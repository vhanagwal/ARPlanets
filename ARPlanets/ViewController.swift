//
//  ViewController.swift
//  ARPlanets
//
//  Created by Vardhan Agrawal on 10/14/17.
//  Copyright © 2017 Vardhan Agrawal. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
  
  @IBOutlet var sceneView: ARSCNView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the view's delegate
    sceneView.delegate = self

    // Show statistics such as fps and timing information
    sceneView.showsStatistics = true

    // Create a new scene
    let scene = SCNScene()

    // Create a position (SCNVector3) to be passed into createMars() function
    let position = SCNVector3(0, 0, -1)

    // Create mars at 'position'
    let mars = createMars(at: position)

    // Adds mars to the scene
    scene.rootNode.addChildNode(mars)

    // Set the scene to the view
    sceneView.scene = scene

  }
  
  // Creates planet Mars
  func createMars(at position: SCNVector3) -> SCNNode {
    
    // Creates an SCNSphere with a radius of 0.4
    let sphere = SCNSphere(radius: 0.4)

    // Converts the sphere into an SCNNode
    let node = SCNNode(geometry: sphere)

    // Positions the node based on the passed in position
    node.position = position
    
    // Creates a material that is recognized by SceneKit
    let material = SCNMaterial()
    
    // Converts the contents of the PNG file into the material
    material.diffuse.contents = #imageLiteral(resourceName: "mars_texture.png")
    
    // Wraps the newly made material around the sphere
    sphere.firstMaterial = material

    // Returns the node to the function
    return node
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Create a session configuration
    let configuration = ARWorldTrackingConfiguration()
    
    // Run the view's session
    sceneView.session.run(configuration)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    // Pause the view's session
    sceneView.session.pause()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  // MARK: - ARSCNViewDelegate
  
  /*
   // Override to create and configure nodes for anchors added to the view's session.
   func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
   let node = SCNNode()
   
   return node
   }
   */
  
  func session(_ session: ARSession, didFailWithError error: Error) {
    // Present an error message to the user
    
  }
  
  func sessionWasInterrupted(_ session: ARSession) {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
    
  }
  
  func sessionInterruptionEnded(_ session: ARSession) {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
    
  }
}

