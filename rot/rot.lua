local Class = require ('rot.rot.class')

local ROT = Class:extend('ROT', {
    DEFAULT_WIDTH =80,
    DEFAULT_HEIGHT=24,

    DIRS= {FOUR={
                { 0,-1},
                { 1, 0},
                { 0, 1},
                {-1, 0}
               },
           EIGHT={
                { 0,-1},
                { 1,-1},
                { 1, 0},
                { 1, 1},
                { 0, 1},
                {-1, 1},
                {-1, 0},
                {-1,-1}
               }
          }
})
package.loaded[...] = ROT

-- Concatenating assert function
-- see http://lua.space/general/assert-usage-caveat
function ROT.assert(pass, ...)
    if pass then
        return pass, ...
    elseif select('#', ...) > 0 then
        error(table.concat({...}), 2)
    else
        error('assertion failed!', 2)
    end
end

ROT.Class = Class

ROT.RNG = require ('rot.rot.rng')

-- bind a function to a class instance
function Class:bind (func)
    return function (...) return func(self, ...) end
end

-- get/set RNG instance for a class
-- used by maps, noise, dice, etc.
Class._rng = ROT.RNG
function Class:getRNG()
    return self._rng
end
function Class:setRNG(rng)
    self._rng = rng or ROT.RNG
    return self
end

require ('rot.rot.newFuncs')

ROT.Type = {} -- collection types tuned for various use cases
ROT.Type.PointSet    = require ('rot.rot.type.pointSet')
ROT.Type.Grid        = require ('rot.rot.type.grid')

ROT.Dice             = require ('rot.rot.dice')
ROT.Display          = require ('rot.rot.display')
ROT.TextDisplay      = require ('rot.rot.textDisplay')
ROT.StringGenerator  = require ('rot.rot.stringGenerator')
ROT.EventQueue       = require ('rot.rot.eventQueue')
ROT.Scheduler        = require ('rot.rot.scheduler')
ROT.Scheduler.Simple = require ('rot.rot.scheduler.simple')
ROT.Scheduler.Speed  = require ('rot.rot.scheduler.speed')
ROT.Scheduler.Action = require ('rot.rot.scheduler.action')
ROT.Engine           = require ('rot.rot.engine')
ROT.Map              = require ('rot.rot.map')
ROT.Map.Arena        = require ('rot.rot.map.arena')
ROT.Map.DividedMaze  = require ('rot.rot.map.dividedMaze')
ROT.Map.IceyMaze     = require ('rot.rot.map.iceyMaze')
ROT.Map.EllerMaze    = require ('rot.rot.map.ellerMaze')
ROT.Map.Cellular     = require ('rot.rot.map.cellular')
ROT.Map.Dungeon      = require ('rot.rot.map.dungeon')
ROT.Map.Feature      = require ('rot.rot.map.feature')
ROT.Map.Room         = require ('rot.rot.map.room')
ROT.Map.Corridor     = require ('rot.rot.map.corridor')
ROT.Map.Digger       = require ('rot.rot.map.digger')
ROT.Map.Uniform      = require ('rot.rot.map.uniform')
ROT.Map.Rogue        = require ('rot.rot.map.rogue')
ROT.Map.BrogueRoom   = require ('rot.rot.map.brogueRoom')
ROT.Map.Brogue       = require ('rot.rot.map.brogue')
ROT.Noise            = require ('rot.rot.noise')
ROT.Noise.Simplex    = require ('rot.rot.noise.simplex')
ROT.FOV              = require ('rot.rot.fov')
ROT.FOV.Precise      = require ('rot.rot.fov.precise')
ROT.FOV.Bresenham    = require ('rot.rot.fov.bresenham')
ROT.FOV.Recursive    = require ('rot.rot.fov.recursive')
ROT.Color            = require ('rot.rot.color')
ROT.Lighting         = require ('rot.rot.lighting')
ROT.Path             = require ('rot.rot.path')
ROT.Path.Dijkstra    = require ('rot.rot.path.dijkstra')
ROT.Path.DijkstraMap = require ('rot.rot.path.dijkstraMap')
ROT.Path.AStar       = require ('rot.rot.path.astar')
ROT.Text             = require ('rot.rot.text')

return ROT

