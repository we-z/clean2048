

import Foundation

struct PlistConfiguration {
    let name: String
    let xml: Data
    
    init?(name: String) {
        self.name = name
        
        guard
            let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path) else {
            return nil
        }
        self.xml = xml
    }
    
    func getItem(named name: String) -> [String : [String : String]]? {
        return try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? [String : [String : String]]
    }
}
