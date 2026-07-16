Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57360C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8IECno4ly1gARzLcwnWJ+vVS4W65edIQKQ8d88JrbIw=; b=cgk9ynOLaVD3kbzC2Q9BK+A86R
	2dkfUSZcRNaRGhUhhssSX9p5oI13RNCucRUT5tAb7jrt7v0BnJRmjIvZzwbICSRgfXVBYQ8F9ZXgF
	uFShO3DQ10LzeIgMQVXuGCG2TMbV/IHmKAEp12q7ad+VhkxAfuJlo2KxuQ01JkfdIGg76NVbLOwbm
	U9GJsDGyrsJB+G1CBJTLrYHpr5KqlCh3h5JXcPyrzh8pKVnv+ZXE4GJkZM+R8jJt/zHlvTB9TbrLA
	oYs41IPT4Af0BVqos+MKcoku5A74BjHA1QzuN0IhlcaJpESswSSXcxqYn0FaU1Oe4wxWyyTX7YY02
	yqkSnJAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTF6-00000000Xy2-3dfQ;
	Thu, 16 Jul 2026 21:03:40 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTF3-00000000Xx9-2VI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:03:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qeU77Gq0lQ8P0zBK2shh3b0l/N1k6LH4dXy1I2Gl5w+63ISY7lNSBqmdqiYyLusf5VD31EnI1YjdRVNmc27J6EbTXRJpmd5OlhHxg1FXy1bZNZ18eH5PxJ81rzImMP890jj2lcmYzScRrGIYDRygXHPLA2NYHK8Grhy0hI6IkmLCtmwXuyDdgiA/1YuEZSkCT/wdl2HNQraTrIiUf+3FTmzDwTliaQIE3Q4gB6rC5wmXVao+/rLZjm/th71ZdCKcrl9eomkYg8hc0k4Dn/lpjnc+WCMN5KGrb5fGkgAkykP/REq1MWioizRZsAyjIHSQMT2T03CJj03rXDJH+xoSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IECno4ly1gARzLcwnWJ+vVS4W65edIQKQ8d88JrbIw=;
 b=CgBaMwi2QMQsJK/FGPMAKBNJvi5mbfdC4w4aOSXaagVELQ0T/saXHz/Y2AS48dxnudWfIiTRayKxgewaAYFIesZQpqGLSYVNq/NnzqVqHMsl8ykYPWNKKOTK3nHX/Tncs2s5MIkvU+6wqUBGSCUsvhDvNibewPdhMYoqedeDSIikNlCfvYJ+ejVZFatNz1W1TLKBCJdn7/qdTt8e4trVjUlxngpckcbHPnZyrxul9v283XBuqo99+5ZstRoprcoLuHhQ/ZINM5++UwMhqsM8BcJGclsCUvG02OIUf7tQlpPgOxqt8T8+YNUrY8H5N7d2qrJ/YtzI94mAJXRUPReKnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IECno4ly1gARzLcwnWJ+vVS4W65edIQKQ8d88JrbIw=;
 b=qtMp1N+uAlxJJVFStAYeRPsnoUuzavrkB3m6aBP3cmNIT5C5abJyls9h8nPZP8qlCjclsrVAuAAaxcumvvxp9J0O6CI+eXULQHBMGL7Mle5uaRCGG4eQtpECld08CXdYDYPsafEVBEg/G+ruxzk4GX2QJRnf2GylWLVP2eP6U3eykL8MloaseYou6Dltmj7XggrYsR6sebQahwSkER4JY1HFKvkQ6d9jmChtXzgtTs4VTMrou0VrDcPTXa9+oh1VxWSBmTbetWr1v2GLyEUBnJsiLnLk1DPj2yG8k5dd6Lh6dVuuhz5Vd0cMVrdKf2CAe7sF06g8VhJSncT0P33YbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:30 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:29 +0000
From: Fenghua Yu <fenghuay@nvidia.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Drew Fustini <fustini@kernel.org>,
	Vikram Sethi <vsethi@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Newton Liu <newtonl@nvidia.com>,
	Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fenghua Yu <fenghuay@nvidia.com>
Subject: [PATCH RFC 00/23] resctrl: MBA control emulation and ARM MPAM MB_NODE support
Date: Thu, 16 Jul 2026 14:02:50 -0700
Message-ID: <cover.1784217438.git.fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:a03:338::33) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f047cc-4d0e-4af5-cee7-08dee37dafe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|921020|18002099003|56012099006|11063799006|10067099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: J0v9cA3YaLy/GTNauOXLjmk0LfUWJBaRBEaniIHhbWHJdq/WCCpjQvVaPFx05VZFxq+2BJfJbZV94xm5OK837VzKvEz0SvGWyDdqUV+lPNPSUY4W3F7hWm4Ns2dslVYKw7UFzUh7GvboCqIEZDg/0bPYN+q73VskhaBfBieCXm42hRKa9RT5Q5tp9x5oqxcmw9GvbIE63LA3MxK4/9b1fx9GofJ2DxwZbe6UH9acRleWKCAsZxK3lZp6XH+O/nNnjEuu0831MldYJ8SuPeqGEtWH/+7XX/vW9fvxsfDJTsQbbjVConIcVuY9rtSSAUuY/f+GKhR+Q7h+AukNG5s0U5zd+GDqV/kflNC/gNnQQr2LXH3TBGZ9CSWjKpduQfrEYwdVWqV9XOnMI9ilt4jYKb6BUUcGs3AbcCmvkU0Ogwra0Ih9ShyjzIJeHTwkHBKRTwbw8lApi03hYeWGhpp6QdvIgossIaa/CjxU+r/mEcSjxD+Zo8HaKxumg8xeueZFCG7YLp2BWH5utg4Uai+sgOb0Qa5SXTkZaZakz7nj+qYFsws5xEXMBJ21DgwMRAGnK6maIWZsXOAONsBlvuhDUcNScf6aoAOdtgPCEOXAcWYvF6jts239lNK862EfVJgM//7aXSPtQ8EfXxsSRk9wXk3b4YpFMs6timHS9ohw1sCXlbdwOslJmJ/VhsZmMdd+JL/PqVIqRDX1saMvQFhpRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(921020)(18002099003)(56012099006)(11063799006)(10067099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFBa0FjS1BYc0lEaXlDaWFFOUJ6cE5MSmQxMTVxcFdsRVFIUlFmM0dnbHF6?=
 =?utf-8?B?bGdWUUNPMVhHMW5NV0ppSFhlamlkczRIck1SSzZpOGp4M1Y2UjBDVk5DK29F?=
 =?utf-8?B?cEw5Z1pLYWc2TS8rQVZvL2RGYUV0eXNFREFHOHViWjVrazhwZEFORGhpamhJ?=
 =?utf-8?B?ZGtLbExYMWlVbzdyRi9tbHlhdkZrVW9EMndSVzR6cXNiWGxjRUo5ajM5NUV6?=
 =?utf-8?B?bjhFdVNYWlF2RU9nd2w5MWhPUHZGbDh0anNCamU1S3ErWkd3ZGI2UDNhTlJ0?=
 =?utf-8?B?OUE3Nm1ZYW01RUJKeE9kY3BYVk9ZenljWS92VHFKRWx5RklTaFo2anhDbllz?=
 =?utf-8?B?RGNwNWw5MFlYSnlidjZSTkhwc0JDSFlCTXFxZ1FkeXFMM0pHcStDL2J6WTZX?=
 =?utf-8?B?M09DNXcwSGQ1MW0wNERXZ05SS3lVVW5OVU1TbWl6RGpWN2IwZlpLSVBVMHM2?=
 =?utf-8?B?R2NqWnZTamUyQ25wSHZNT2loZVdiY2NqUzNGNytEYlE4T0ZmTmNRRkhzNDc1?=
 =?utf-8?B?dUxEaFNtU2hFYjlHWnVuZTl6WDV6QWRvUGlCZjdhcjZZZ1g4NWJtQ3ZrbThC?=
 =?utf-8?B?bjRTL1k1anVRNzduSU16UmNia2NCb0JxTWVqRC96U3k3UkQ1cVJXSUtpRkZE?=
 =?utf-8?B?SHBoamtBbzRiMU45djFpZTlpMG1tTndGdjRVSXhycnpoNG4zL2V0MjAvR2ZZ?=
 =?utf-8?B?ckJ2bVlXZGtHcDJxaGtoeExiK28vUXlHUFVCTDBjWlJYWkZSYlRwUDNLSXpX?=
 =?utf-8?B?ZVZ3REU4NURyd0w0WlIvK0NZRkxIVCtwckhjVDFydjY5NnpjU1NzRXlPclJH?=
 =?utf-8?B?bktGNUFpelhwR0tSdmRjc2xWb3RFRnZtRW1aUWlzWk4vMkFYbUpXaUJEdWQx?=
 =?utf-8?B?dENHNWVhRGx2dmdmL1M5T1A4dmwxRmlBKzc5MkczQ2FCYS9SMjhLZ0dBdG9H?=
 =?utf-8?B?dVZ3SHMwM09JZzdNYXVDUE1GUGxFU1RXZzIyaFBhbjB2cHFXcUxFb3hxdzlJ?=
 =?utf-8?B?aUJnaFUxMXVZcEpSSXY0bXJIdlUrZ1lYZlJlUWNFaDVRRERjYUs3NVdsMDR2?=
 =?utf-8?B?LzJIbXRlbFJSKzZxWVBUWTBSMXhjSHgzTkVNakdlWVUvUkhUZTQ3MjNPNzZz?=
 =?utf-8?B?amtiVXpKOEYxa3A4aDg4cjNLRFJ6NGF5WTgzUkpjZ1lsTVVMd1BmS2F2aVl6?=
 =?utf-8?B?eVB2WENIOFlrZ2o3dkNuQlFsWUNmbHF0K3NEUjVBaUVvV0J4b2JPVTU2dCtH?=
 =?utf-8?B?WUNuaHcyT2s5MDh0WTgrQ3UyeUNTd205dE53aEtXdVFwZElkeUE1YS83Q2pP?=
 =?utf-8?B?b3Y4aUZXcE11cUNwOGJ0U1JwNGRTMDQxYWJlMytDMEpSMmdvRmNqMXR4dFNr?=
 =?utf-8?B?ZmN3UkxoQUR2SGRqNFRxS2c5ekltSHBsMHBtZkNsdE1nd0hENXR1UlNUSHdU?=
 =?utf-8?B?WUVGd014WS9QeFl5NWRRQlVEdDF2Z2lFQ25WemE1VVR1bXZnbjc4V2kvdmlD?=
 =?utf-8?B?aUxWc1FqRy9KZ08wcHJRZ08vamd0R01RbC9hdDd1RDRBYzlQMEJ4c0NWaUZ5?=
 =?utf-8?B?QkFOSy9Sd2dzNll3WHNVMGVYRS9ZT05FTTFOYlVPU0YxNUN0T2RXNEpxdGw3?=
 =?utf-8?B?VnZmcmtkc2xJeGo3RWJSOFdZMDk2WWtzMHJBdzJsSWJpUE5jdlF4L3pGWnV0?=
 =?utf-8?B?Mjdoci9pM3BVS0NDMmdlWGJ6MnJVbXZiRnBxNEZkWkpzRFRyMlU4ZFdTSml4?=
 =?utf-8?B?M1pXWXlQYnFnRmgrYzBQbWg3RUFuY04xcWo2eFdPWWk3SWJhZlg1elM1TEo2?=
 =?utf-8?B?RlFURDNmUHdqMmViSDY0NmlKbzMrVUxTbjJ6RGtBaTk2SCtPSFZQdFdBZ1lR?=
 =?utf-8?B?c3JQc1lXUWlaZEszTVljSWtMUnZwYkN1M01zcE83VTdycGl1Z0tkWUZ3RlB3?=
 =?utf-8?B?SFVHYko4K3pSTkV2bCswYUFnek96U1RNZCtJSStZbmYvaW1adGxGSEJTR2pT?=
 =?utf-8?B?aVFqQVB1SE00ZVlya2V2ZWJjaUZUUndHeWRGdWZPZjJTRUlwZ25scHdpQWxz?=
 =?utf-8?B?RXBQNkFJVnc5Sml3bElyTStzVkJsMEZ2cVpZTXVHdTIyZFl6ZFZhMzJrUXZE?=
 =?utf-8?B?OVZVNE9oYlRTK09teUpvQmFnZkZuSHI0Z1pxVkRkVE1kZXJjczZvUVdVVDBI?=
 =?utf-8?B?ZUwyeXZNd0k3WlhGdmpMMU5mckF1QTIzVkxQRmhFaWpxb1dkYXJkRno3d2FU?=
 =?utf-8?B?Z0wvMXY1enI5RVJ2enNlWXQ5dzdSN08zeVBSRXRabW9QNktUYTErZmhadXJu?=
 =?utf-8?B?aW9BbGxZNWpTVm5TcmthL3lTZjMyaDdZWU1zUDVMMUZNUnNVMkFodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f047cc-4d0e-4af5-cee7-08dee37dafe2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:29.6209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: expsCKJWKAAJB3Uhx4NvKLeVCmBJKfTs0TVrHz0iFnfoqrT2cJWYH9KjEiFLBtf/XebJ4AfXuA2vXqndiuXNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140337_713253_2A736FBF 
X-CRM114-Status: GOOD (  12.09  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series enables MBA bandwidth control emulation on ARM MPAM when the
default MB control is disabled, using a node-scoped MB_NODE control as
the native backend.  It extends memory-bandwidth monitoring and
control to memory-level MSCs or CPU-less NUMA nodes, and adds
documentation and tests.

Background

On x86, MBA bandwidth control is typically associated with the L3 cache:
schemata lines use L3 cache ids and monitor domains appear as mon_L3_XX.
On some ARM MPAM systems the MBA control is backed by a memory-level MSC
rather than the L3 cache MSC.  A memory-level MSC is represented as a
NUMA node, and that node commonly has no CPUs of its own (a memory-only
node that still participates in bandwidth control).  For such a resource
the control scope is NODE, schemata identifiers are NUMA node ids,
monitor domains are named mon_NODE_XX, and a node-scoped MB_NODE control
may be the only control with usable bandwidth hardware.

Because the memory-level MSC lives on a CPU-less NUMA node, the driver
must handle nodes with no local CPUs.  mpam_ris_get_affinity() derives
affinity from the component's NUMA node id, so a memory-only node would
otherwise end up with an empty CPU mask and never be registered.  When
the derived mask is empty, the driver falls back to cpu_possible_mask
(masked by MSC accessibility) so the node still gets a resctrl domain.
The borrowed affinity is kept out of class->affinity: those CPUs already
contribute through CPU-ful nodes in the class, and subtracting the
borrowed mask on teardown would remove CPUs that other live nodes still
depend on.  Domain setup iterates all MSC components per CPU (keyed by
component), so each component — including these CPU-less memory nodes —
gets its own control and monitor domain.

Examples of NODE and emulation interfaces on MPAM.

**MB disabled, MB_NODE enabled** (``MB`` emulated by ``MB_NODE``)::

        info/MB/resource_schemata/
        ├── mode			  # [legacy] native
        └── MB/
            ├── scope                     # NODE
            ├── status                    # disabled
            └── MB_NODE/
                ├── scope                 # NODE
                └── status                # enabled
schemata:   MB_NODE and MB keeps same values
        MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
             MB:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
             L3:1=ffff;2=ffff

mon_data/
mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_NODE_01/mbm_total_bytes

Switch to native by writing to "mode":

        info/MB/resource_schemata/
        ├── mode			  # legacy [native]
        ├── MB/
        │   └── scope                     # NODE
        │   └── status                    # disabled
        └── MB_NODE/			  # MB_NODE is moved to here
                ├── scope                 # NODE
                └── status                # enabled

schemata:   Only show MB_NODE. No "MB:" is emulated.
        MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
             L3:1=ffff;2=ffff

mon_data/
mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_NODE_01/mbm_total_bytes

**MB enabled, MB_NODE enabled**::

Same for legacy and native:

        info/MB/resource_schemata/
        ├── mode			  # [legacy] native
        ├── MB/
        │   ├── scope                     # L3
        │   └── status                    # enabled
        └── MB_NODE/
            ├── scope                     # NODE
            └── status                    # enabled
schemata:
        MB_NODE:0=100;1=100;2=100;10=100;18=100;26=100;34=100;35=100
             MB:1=100;2=100
             L3:1=ffff;2=ffff

mon_data/
mon_L3_01  mon_NODE_00  mon_NODE_02  mon_NODE_18  mon_NODE_34
mon_L3_02  mon_NODE_01  mon_NODE_10  mon_NODE_26  mon_NODE_35

mon_data/mon_L3_01/llc_occupancy
mon_data/mon_L3_01/mbm_total_bytes
mon_data/mon_NODE_01/mbm_total_bytes

The patches can be compiled but not tested on x86.

The 23 patches are grouped as follows:

1. Fixes for previous issues (patches 1–2)

   Correct resource_schemata control subdirectory ownership on non-root
   resctrl mounts, and fix a NULL address access in the ARM MPAM driver.

2. resctrl control emulation (patches 3–8)

   Introduce the MBA emulation framework in the resctrl core: a writable
   legacy/native mode under info/MB/resource_schemata/, per-control status
   and nested schemata layout, schemata mirroring for controls without MBW
   hardware, and subdir rebuild when the mode changes.  Patch 8 documents
   the user-visible behaviour in Documentation/filesystems/resctrl.rst.

   This group and group 4 are trying to implement the concept in
   discussion [1].

   The main purpose of this group is to make CPU-less NUMA Node patches
   work.

   This implementation is only limited to MPAM CPU-less NUMA Node
   emulation. It needs to be enhanced to make another other emulation
   work, X86 memory region or RISC-V emulation etc.

   It's totally fine for me to either replace this implementation with
   another implementation or continue to enhance this implementition
   for control emulations.

3. Memory bandwidth monitoring and control on memory-level MSCs
   (patches 9–17)

   Generalise the monitor infrastructure beyond hard-wired L3 paths:
   de-hardcode L3 monitor plumbing, expose MBA MBM counter assignment,
   name node-scoped monitor domains mon_NODE_<id>, add a node-scope MBM
   total event, and make MBM handling resource-aware.

   On the ARM MPAM side, add memory-level MSC and ABMC support, refine
   L3 topology and class selection, refactor domain setup to iterate all
   MSC components per CPU (keyed by component), and handle CPU-less NUMA
   memory nodes that have no local CPUs but still participate in MPAM
   bandwidth control.

4. MB_NODE emulates MB (patch 18)

   Wire MB_NODE as the native backend that emulates a disabled MB control
   in the ARM MPAM driver.

5. Documentation (patches 19–21)

   Document memory-level MB control and NUMA nodes in the arm64 MPAM
   guide (patch 19), NODE-scoped MBA domains and mon_NODE_* monitoring
   in the resctrl documentation (patch 20), and an MB_NODE emulation
   example on ARM MPAM (patch 21).

6. Tests (patches 22–23)

   Add a KUnit test for CPU-less NUMA node affinity handling and a
   kselftest that exercises MB emulation mode switching, resource_schemata
   hierarchy, and schemata mirroring on ARM MPAM.

To apply the patches, on top of [2],

Testing

  # KUnit (CPU-less affinity)
  ./tools/testing/kunit/kunit.py run test_mpam_devices

  # kselftest (MB emulation; requires ARM MPAM with disabled MB control)
  cd tools/testing/selftests/resctrl
  ./resctrl_tests -a mb_emulation_test

The branch: https://github.com/fyu1/linux/  emul.cpu_less.rfc/
which is on top of [2].

[1] [RFC] mpam,x86,fs/resctrl: Generic schema description Proof of Concept
https://lore.kernel.org/lkml/cd96bda7-675d-451e-b6d9-9fe4a405edbe@intel.com/
[2] Reinette's resctrl control branch: git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v1


Fenghua Yu (23):
  resctrl: Fix ownership of resource_schemata control subdirectories
  arm_mpam: Fix NULL address access issue
  resctrl: Expose MBA resource_schemata mode sysfs
  resctrl: Expose per-control status in resource_schemata
  resctrl: Add nested resource_schemata support for emulated controls
  resctrl: Mirror schemata for controls without MBW hardware
  resctrl: Rebuild resource_schemata subdirs on MBA mode change
  Documentation: resctrl: document MBA control emulation
  resctrl: De-hardcode L3 monitor infrastructure
  resctrl: Expose MBA MBM counter assignment sysfs
  resctrl: name node-scoped monitor domains mon_NODE_<id>
  resctrl: Add node-scope MBM total event
  resctrl: Make MBM paths resource-aware
  arm_mpam: Support memory-level MSCs and ABMC per class
  arm_mpam: Refine L3 topology and class selection
  arm_mpam: Include all MSC components during domain setup
  arm_mpam: Handle CPU-less numa nodes
  arm_mpam: Emulate MB control with node-scoped MB_NODE control
  Documentation: arm64: mpam: document memory-level MB control and NUMA nodes
  Documentation: resctrl: document NODE-scoped MBA domains and mon_NODE monitoring
  Documentation: resctrl: document MB_NODE emulation example on ARM MPAM
  arm_mpam: Add KUnit test for CPU-less NUMA node affinity
  selftests/resctrl: Add MB emulation test for ARM MPAM

 Documentation/arch/arm64/mpam.rst             | 105 ++--
 Documentation/filesystems/resctrl.rst         | 184 ++++++-
 arch/x86/kernel/cpu/resctrl/core.c            |   2 +
 drivers/resctrl/mpam_devices.c                |  59 +-
 drivers/resctrl/mpam_internal.h               |   8 +
 drivers/resctrl/mpam_resctrl.c                | 488 ++++++++++++-----
 drivers/resctrl/test_mpam_devices.c           |  67 +++
 fs/resctrl/ctrlmondata.c                      |  99 +++-
 fs/resctrl/internal.h                         |   9 +-
 fs/resctrl/monitor.c                          | 225 +++++---
 fs/resctrl/rdtgroup.c                         | 507 +++++++++++++++---
 include/linux/resctrl.h                       |  62 ++-
 include/linux/resctrl_types.h                 |  15 +-
 tools/testing/selftests/resctrl/config        |   1 +
 .../selftests/resctrl/mb_emulation_test.c     | 460 ++++++++++++++++
 tools/testing/selftests/resctrl/resctrl.h     |   1 +
 .../testing/selftests/resctrl/resctrl_tests.c |   1 +
 17 files changed, 1942 insertions(+), 351 deletions(-)
 create mode 100644 tools/testing/selftests/resctrl/mb_emulation_test.c

-- 
2.43.0

