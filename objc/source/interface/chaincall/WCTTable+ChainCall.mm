/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/WCDB.h>
#import <WCDB/WCTCore+Private.h>
#import <WCDB/WCTHandle+Private.h>
#import <WCDB/WCTTable+Private.h>

@implementation WCTTable (ChainCall)

- (WCTInsert *)prepareInsert
{
    return [[[WCTInsert alloc] initWithDatabase:_database
                            andRecyclableHandle:_database->flowOut()] intoTable:_tableName];
}

- (WCTDelete *)prepareDelete
{
    return [[[WCTDelete alloc] initWithDatabase:_database
                            andRecyclableHandle:_database->flowOut()] fromTable:_tableName];
}

- (WCTUpdate *)prepareUpdate
{
    return [[[WCTUpdate alloc] initWithDatabase:_database
                            andRecyclableHandle:_database->flowOut()] table:_tableName];
}

- (WCTSelect *)prepareSelect
{
    return [[[[WCTSelect alloc] initWithDatabase:_database
                             andRecyclableHandle:_database->flowOut()] fromTable:_tableName] ofClass:_class];
}

- (WCTRowSelect *)prepareRowSelect
{
    return [[[WCTRowSelect alloc] initWithDatabase:_database
                               andRecyclableHandle:_database->flowOut()] fromTable:_tableName];
}

@end
