//
//  ViewController.swift
//  Calculator
//
//  Created by Younhee Lee on 2019-09-21.
//  Copyright © 2019 Younhee Lee. All rights reserved.
//

import UIKit

var currentValue : Double? = nil
var previousValue : Double? = nil
var currentOperator : String? = nil

class ViewController: UIViewController {
    @IBOutlet weak var valueOnBoard: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func valueGetter(_ sender: UIButton) {
        let val : String! = sender.titleLabel?.text
        if(val == "÷" ||
            val == "x" ||
            val == "+" ||
            val == "-")
        {
            if(currentOperator == nil){
                previousValue = currentValue // save current value
                valueOnBoard.text = "" // empty the board
                currentOperator = val // save the operator
            } else {
                valueOnBoard.text = ""
                operation()
                currentOperator = val
                previousValue = currentValue
                currentValue = nil
            }
        } else {
            valueOnBoard.text = valueOnBoard.text + val
            currentValue = Double(valueOnBoard.text)
        }
    }
    
    @IBAction func Clear(_ sender: Any) {
        currentValue = nil
        previousValue = nil
        currentOperator = nil
        valueOnBoard.text = ""
    }
    
    
    @IBAction func equal() {
        operation()
        if(currentValue!.truncatingRemainder(dividingBy: 1) == 0){
            valueOnBoard.text = String(Int(currentValue!))
        } else {
            currentValue! *= 1000000
            currentValue! = Double(Int(currentValue!))
            currentValue! /= 1000000
            
            valueOnBoard.text = String(currentValue!)
        }
            
    }
    
    func operation(){
        switch (currentOperator){
        case "÷":
            currentValue = previousValue! / currentValue!
            currentOperator = nil
            break;
        case "x":
            currentValue = previousValue! * currentValue!
            currentOperator = nil
            break;
        case "-":
            currentValue = previousValue! - currentValue!
            currentOperator = nil
            break;
        case "+":
            currentValue = previousValue! + currentValue!
            currentOperator = nil
            break;
        default:
            break;
        }
    }
    
    @IBAction func PlusMinusSign(_ sender: Any) {
        if(Int(valueOnBoard.text.prefix(1)) == nil){
            valueOnBoard.text.remove(at: valueOnBoard.text.startIndex)
        }
        
        if(currentValue! >= 0){
            valueOnBoard.text = "-" + valueOnBoard.text
            currentValue! *= -1
        } else {
            valueOnBoard.text = "+" + valueOnBoard.text
            currentValue! *= -1
        }
        
    }
    
    
    @IBAction func EsterEgg(_ sender: Any) {
        valueOnBoard.text = "It is secret that this app has a lot of bugs"
    }

    
}

