Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCABC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hxl7sXFnEgiG1MFxFPbQ6njCNsYLFPynsLR2SOWrj+Q=; b=m9D8gQE3qj8At8nQSEwqJJI2yC
	9OzyTowl+KQdtglggiSs6zQKLjiCvvMw/MFyJXLnWNoddPr4XHp6USisXpsSP8Tj4noiSWdRxf2iI
	lvguhaTVcOJsSbRLRmeK3inInZ0MNEzoZipWnu6x8ldros1/dJa27i6uiNCysSbQeXl9mnJ6MjN/u
	PtHgTm0CLsjIV6YGu9hcJ9xei6KnYnfoKbynbeaXqYDDQnE/lmC0q5Cw2tzYDYiuc5MpcAD2W/SjC
	D5H3YYgiMuq6B9IdP5jtoEr8eWRQeY/4DbnXf/5FaipufUwNEM7jXLRib2towH49BWlBWZ/ZQ5HD2
	ZwWgvsgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFW-00000000YLu-0cGv;
	Thu, 16 Jul 2026 21:04:06 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTFO-00000000Y2O-2peR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:04:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlJ19efuo+s9VRMCIi0qAKN+fZx/TCUstzYV2DlZbyYp2ikW4zh77eVjHYSzB5R/RoA9WGFj7wMRCV5YKO6GhuzOrYx/jJ+FcOM7prFuScNIcDC2dX9hJ7vzyeZn29iUwvoMn9oT7OrSDy7dcp8ze4T406pkYmy1DLEWjCAX5i4/rUPJVimTp/dXJ3yz5YO9EpsnE6KNOM1Jvagg2QcN4iMLeWgTX3CJh5OKo4ihRDAa162KyXPJBPuxbag0cPkfZ0XnbAdMnchS/pPUVYDk3gT4WZXQnqEybbqPZxcZvnlbtUrF5wclQXrZUcM12d3ZHEqY6NIZ3cZIYPU774AO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxl7sXFnEgiG1MFxFPbQ6njCNsYLFPynsLR2SOWrj+Q=;
 b=kbkwmz/bU+4MOPrOYmEpolAfw4MGmEPoVhO2w3KLvC8FDeVsNU51Bg9foIaxUmSa4vfsbNz0tbaUArPTD3GbCo4JBt1Jf3ziLntHH+lr2WnElMZ2HWofrimyiypoqtumEkiaECbnnRbsCOJV0V8Fuokjpc0kJuYP2eydPcKg7TJUcc6/39Yem88YS1KU3JOYCVDA8hxProlhlIem6CJvNbxrRpkctFifniA4yL3k77U7M5vbMfW4NjBqekLu6wSAas7yA267JW7gbjNYfvqUj1i1MO/DfOG768+ehSKrWmYAVN8VKjZsWyPBn2/bi2NCn6DPIXInKJ4QandG3fEvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxl7sXFnEgiG1MFxFPbQ6njCNsYLFPynsLR2SOWrj+Q=;
 b=cplH7Bv0tIdaDpPkN/ADSt7YFAjRf4EwDaQD59aX5WxOp0W/ftqSLj9Nvk5cnwOYxHzLdF5OIou8SHM2TuPyuhA22lERI0EnKgHta8V2MsB0Aj2NBOOu/DKZ3ESNTuWQU3DhrcNv6PiigqZli2nLs1+ZYvukHcgCbZEURf5wzcqghHk4HuIOs0VBLtohxbuUMUgC/x78HtsuE/jRMrFc/GfozBpb0Gh5wS7OcDf75wKNPIc0TGG0Bdy8gpTq0oDkyk87MryuxJtb6GCNZ0wBJPYng2QMqbJOisN2slzWrz6ccYRl4PbAbseIW76CTbdGpmaZJzPj1Z7drLCCGGz98g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:03:45 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 21:03:45 +0000
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
Subject: [PATCH 12/23] resctrl: Add node-scope MBM total event
Date: Thu, 16 Jul 2026 14:03:02 -0700
Message-ID: <20260716210329.2914625-12-fenghuay@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784217438.git.fenghuay@nvidia.com>
References: <cover.1784217438.git.fenghuay@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: d8bb64ce-49a3-44e4-82c3-08dee37db983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: qYsLZG+8r/j7SKl0dHAUDXs+MqXbIjwZuSLpDovSxQ1iz9QR0r8XKrNVWQKxHT/5IChkeoz7dIcz5gBi4O6HyAiZJn7sP1zuh25rhLtcbZ2SBh4yY3xLryt/jH8CTHnsSTzCayFO2LvpiozH00yvRtUhe6yR/GKVInDu05ejGf3TWZBa0wErZ1bwQrDvR5QziZ+07MACyaeQC5i8Zv4DiC+sAWHo3oIBYHD/NYHGWOVMn2s6SEW6vbqhW3cmfDiquiypxGBCxk3u24HFOEN6tiptKwuEcPZW+10iCe4TNAk2MaF6wZID0uVeQDzQvq+8SZYFcG1LCTEeHIBIJYLuiO5uJRQorLhyMDQyel2bm3SepTMnGDzl4LA7vrSPjgK713HYEXB6QfG5qTgAch9mGOXdTfxRbU77mtoyak4HvqV04Slu+x8ugTc8ltps+lVrc2beVujWiB2x7g+JyQSwt35Rsbam9hVhbl5W03zhGjvbcdGTacwu5/Ot42TBHr0udiBwLs5hPc3VtvxhVOCq4/iBkFRRzpHO1gmDTD1f1hEbPcW1kjmZMa4eMtn18ZMoXMRhIDUQUqP9z/to7lkZmPeoIJTm6mTTmrSaiBZ838U9oVbYnvCshQDaxXcIAJAEYLGQqvDm6k/bMYbM3L/AnX67oEq9jEp89/sIVf6uOEV0eP+iWi6cnaP2vT1S8/w7swvcH3EnjVQs+23JM9hCOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHXkwURKjNua7E3vmFwu6ggeqonYzo6bA02CU/9OVdYtZ5Oi/9gJHSKPl3Tm?=
 =?us-ascii?Q?ORa3Nq166+BK4pl0AHhB1UAYLXUohGDWKgch6cgxIQjhLBdjvxc6UgjSdp7x?=
 =?us-ascii?Q?xOhPlBVvdKHWjgrgjMqWBfAOEv+WwQWNj6ET5D4Wsy5KDzK7jybABjzlHE+n?=
 =?us-ascii?Q?5H4GinRkBEaOBg/uGmbvns+cRGkjYJHU1HW8K1PffHPk7fLXKIneLYoXCGwu?=
 =?us-ascii?Q?641TETBTkFhDE+CQCVIms+/fEzCQ37DSzCPPOClpGu9hgVQBvDCcYWzJwbub?=
 =?us-ascii?Q?PKCWhOROksiquiOOUAxQZBRE7Q7MjtiZV0z8/vYv4giRAF6hC2uiwvYwsAA7?=
 =?us-ascii?Q?qNnLlPD1N5CVNnC2wHisnjmDoHLh/7h44dOgW5QHy+a6VgrZiwkE16DeU2ri?=
 =?us-ascii?Q?mltM7yzWQj9PqYHvNzMhCDSwixCt92Y4yBSemKPSF3pFRRBERIS4M1UxVDx6?=
 =?us-ascii?Q?wuL/vYHzIl5J+R4Kx18ylvU2QpL/kgy1YRL6MDgOVFlE3pTrDEOn8ht0ve0/?=
 =?us-ascii?Q?qxdwhsPDcsSwWsi0h7Ktjs2++/FGCvIbMCH5KtA1B506Cu2FuUHw9QlNCPh6?=
 =?us-ascii?Q?J802OgC8WMAv5/+tlm1EHXLMRu9Th7Kbu+nWFuZrfbHxsucS8M1p8EHjG2js?=
 =?us-ascii?Q?6ov4INeK4QdSpKmjuZkhPRdiHdV8vadm20vMUkLee2Gaheu0Ym+dxw7Twti9?=
 =?us-ascii?Q?TBqcXBBK5/phlnB6jOEd3YHPGBxIs4BMo3JTG41VUsWmThadQMP8UqnE395A?=
 =?us-ascii?Q?sbAx8x+UzuSsV93v1MQIYW9aJzpNp4Q5aJTjd5jxRDuxL7pzkmr6Tmoyb+py?=
 =?us-ascii?Q?880ijTKLpn6AbfxWg+DW9vl/Xx3PrIbuZCf6A97HzQYq6gwEOo8EPotHRXZE?=
 =?us-ascii?Q?EwLXpnu9yoJLsMGtQUyzfAh9rj+p7x8b6AKua2pUFztjiCi0nDLRACtrvnje?=
 =?us-ascii?Q?1/MQf2XyWZkV0/sdCovft1SCtT9Xku+CP127cg9j3/Tf7duppwEn0skYVZCu?=
 =?us-ascii?Q?W6uEAfCNksN3VMxPScTS8G2LAsgdiWE5bgoCq/ckL6OdlrtrYoXS62Yu8f11?=
 =?us-ascii?Q?ZKJ2PB//HGkh8cb2GXXC2QfAqH3GRKwseL0BaDQBCLTcb5ZlCJo2ipHC6Adm?=
 =?us-ascii?Q?VKqx7N9oCd1DvcQAr5umIXoS6zmepAkiZYtqYKaTJZeJIB431Q5T4ObZKUNw?=
 =?us-ascii?Q?KJmupT9FM9XjBgj00qbmC6Hk+aGsqlx+3kMT6uV9iDye8jK14wfQsGgd3ZQG?=
 =?us-ascii?Q?9+dpXCdw/PvOzwmH4rgw3DL5IOJKaetkcoB1BNBAu22C5wBZSM0HHwSETH91?=
 =?us-ascii?Q?HmVJv36N1rovTrG6MQkKGcJUZfj8azPP9c8DVlKQ/xRS7P7RWUkgAhdNq9GZ?=
 =?us-ascii?Q?PAlBSsW/vyM6TCwyoZgoh6dV8W5tTzqdMvjRK9VYhcREORFT3AveJ4y8oCmm?=
 =?us-ascii?Q?A32Xh/OhcSRMqujm0WSSXAGK1baarEjaFFMnkvVpJ9K1tQxfqikD8Cs1SwR2?=
 =?us-ascii?Q?4cSgUW/JyKzUy6J876n3g36xZsruEKajzqfWKlfPWmz4jsT8n3Rad1UZZXgq?=
 =?us-ascii?Q?W53dtIwGe6YpGxEB9ieCHAK46uA5i3rZ/CyUAEeFq+JJA0jwzDabqKtXkYEP?=
 =?us-ascii?Q?enJxkbm0W/3xghAxoqmuDKVcoBaJ2Iz2h73/SzZcUvWZzhuCoVjMtG5yf9Sl?=
 =?us-ascii?Q?gYrEhv5MEczyMUjogqHEloBrW6xXwRCaO3leB03UZxNuEPJd2Auh4Z7rCHLm?=
 =?us-ascii?Q?OuFUE6E70g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bb64ce-49a3-44e4-82c3-08dee37db983
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:03:45.7508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyaxttN8jxXk/qVHpXy6VqpTbnlTP7VjvImugou/XdjVu+2K+B4mAjDIHMJHLJHqrNMXzPBBvdREE1nHHJVUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_140358_746750_25491457 
X-CRM114-Status: GOOD (  18.03  )
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

Some MPAM systems count total memory bandwidth on a memory-side MSC that
is scoped to a NUMA node rather than the L3 cache. Add a new
QOS_NODE_MBM_TOTAL_EVENT_ID event for this node-scoped total, backed by
the MBA resource, and register it in the mon_event_all[] table.

Keep the new event id contiguous with the existing L3 MBM events so the
for_each_mbm_event_id() range and the per-domain software MBM state
arrays continue to be sized from the first to the last MBM event. Extend
resctrl_is_mbm_event() to recognise it, and add helpers
resctrl_is_mbm_total_event() and resctrl_mbm_total_event_id() so callers
can select the node-scoped total when it is enabled and fall back to the
L3 total otherwise.

Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
---
 fs/resctrl/monitor.c          |  1 +
 include/linux/resctrl.h       | 27 +++++++++++++++++++++++----
 include/linux/resctrl_types.h | 15 ++++++++++++++-
 3 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index db19e5eac1f9..25b5038b3e16 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -990,6 +990,7 @@ struct mon_evt mon_event_all[QOS_NUM_EVENTS] = {
 	MON_EVENT(QOS_L3_OCCUP_EVENT_ID,		"llc_occupancy",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_L3,	false),
 	MON_EVENT(QOS_L3_MBM_LOCAL_EVENT_ID,		"mbm_local_bytes",	RDT_RESOURCE_L3,	false),
+	MON_EVENT(QOS_NODE_MBM_TOTAL_EVENT_ID,		"mbm_total_bytes",	RDT_RESOURCE_MBA,	false),
 	MON_EVENT(PMT_EVENT_ENERGY,			"core_energy",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_ACTIVITY,			"activity",		RDT_RESOURCE_PERF_PKG,	true),
 	MON_EVENT(PMT_EVENT_STALLS_LLC_HIT,		"stalls_llc_hit",	RDT_RESOURCE_PERF_PKG,	false),
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 307803ea1b09..3fb236c459dc 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -536,16 +536,35 @@ bool resctrl_arch_is_evt_configurable(enum resctrl_event_id evt);
 
 static inline bool resctrl_is_mbm_event(enum resctrl_event_id eventid)
 {
-	return (eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
-		eventid <= QOS_L3_MBM_LOCAL_EVENT_ID);
+	return ((eventid >= QOS_L3_MBM_TOTAL_EVENT_ID &&
+		 eventid <= QOS_L3_MBM_LOCAL_EVENT_ID) ||
+		eventid == QOS_NODE_MBM_TOTAL_EVENT_ID);
+}
+
+static inline bool resctrl_is_mbm_total_event(enum resctrl_event_id eventid)
+{
+	return eventid == QOS_L3_MBM_TOTAL_EVENT_ID ||
+	       eventid == QOS_NODE_MBM_TOTAL_EVENT_ID;
+}
+
+static inline enum resctrl_event_id resctrl_mbm_total_event_id(void)
+{
+	if (resctrl_is_mon_event_enabled(QOS_NODE_MBM_TOTAL_EVENT_ID))
+		return QOS_NODE_MBM_TOTAL_EVENT_ID;
+
+	return QOS_L3_MBM_TOTAL_EVENT_ID;
 }
 
 u32 resctrl_get_mon_evt_cfg(enum resctrl_event_id eventid);
 
-/* Iterate over all memory bandwidth events */
+/*
+ * Iterate over all memory bandwidth events. The node-scope total event is
+ * contiguous with the L3 events, so it is covered by the same range. Loop
+ * bodies must skip events that are not enabled.
+ */
 #define for_each_mbm_event_id(eventid)				\
 	for (eventid = QOS_L3_MBM_TOTAL_EVENT_ID;		\
-	     eventid <= QOS_L3_MBM_LOCAL_EVENT_ID; eventid++)
+	     eventid <= QOS_NODE_MBM_TOTAL_EVENT_ID; eventid++)
 
 /* Iterate over memory bandwidth arrays in domain structures */
 #define for_each_mbm_idx(idx)					\
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..996ae8763b0a 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -50,6 +50,13 @@ enum resctrl_event_id {
 	QOS_L3_MBM_TOTAL_EVENT_ID	= 0x02,
 	QOS_L3_MBM_LOCAL_EVENT_ID	= 0x03,
 
+	/*
+	 * Total memory bandwidth counted on a NUMA node scope MSC (e.g. a
+	 * memory-side MSC above the L3). Kept contiguous with the other MPAM
+	 * events so arch code can size per-event arrays by the last MPAM event.
+	 */
+	QOS_NODE_MBM_TOTAL_EVENT_ID	= 0x04,
+
 	/* Intel Telemetry Events */
 	PMT_EVENT_ENERGY,
 	PMT_EVENT_ACTIVITY,
@@ -65,7 +72,13 @@ enum resctrl_event_id {
 	QOS_NUM_EVENTS,
 };
 
-#define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
+/*
+ * Number of software MBM state slots per monitoring domain. The MBM events
+ * (L3 total, L3 local and the node-scope total) are contiguous, so the last
+ * one bounds the array. The node-scope total event is only ever enabled on
+ * Arm/MPAM; on x86 its slot is simply left unused.
+ */
+#define QOS_NUM_L3_MBM_EVENTS	(QOS_NODE_MBM_TOTAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
 
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.43.0


