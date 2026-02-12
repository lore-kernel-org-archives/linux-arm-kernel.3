Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F80EE3685
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKeo5c2Y9vP3AHPb4vOzxRL+DS8n2p7bYBis1SJP62Y=; b=MSp4u8wKWjTzdIav+yhyYsz8Kd
	22+etlNpiAlX8fhBf2kZHGWUNV3z7Nm8aw+DBdQ9GgUfXPos/quM9pCQvxP6qlbH0+MxoeD7rmfmz
	CSMRL2N4Rro2HuQKmZ92PU/h/HA498zJTZ2aN1xWQ3i19SDUYWTf03nICMQnzXHJGzx47koisPV1D
	HDT/shXDxrh/9u0d4TFeOkNIJ+2tZuHN+vB7M7dhdN/ThIe1PqcPY7jfcxOAvgS0fGAAN/Y7t1LZD
	NT52Qot/mor+VtoJ5srtVTePqgkzrQKVkUbGXOiAj/XSA0j6j0AJXIE9YknAygzEGq8SFHzaUev/a
	HKZkxmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX7K-000000029w8-3w0P;
	Thu, 12 Feb 2026 13:52:26 +0000
Received: from mail-westusazon11010045.outbound.protection.outlook.com ([52.101.85.45] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX7H-000000029u9-3uh3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 13:52:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yL1QXjhpKr9XAcF3UXQCvMzCMrwiJ50G6P9+v96VtFMNeugzhRQ8oKn0Pc5D9ndRTQnFOMshOUvgeWg5tstfhGhydjlkg77ykTOgiRroyW9HSQV2CzsGQHbU9PqFnUFHF2YaZlwbVVXFbH6P/wSiKNGB1FWNAGuVtMLs3xMqObEEdVg1R0rDtwjoFgkI+wGWs34vAtMVvUgD3b+TWiHCpJ10OzK/4ub0s02JQAxgoeKJlFrVL5C2SpXHxDiGbm16O4AYdH+kCWKfQqH9hblUt3Kc1yhvnkJtJwOoRU6B2LBWIPKkVTJ1sb7tIYI29znhLlD6tANfLkjNnUmOmPk9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKeo5c2Y9vP3AHPb4vOzxRL+DS8n2p7bYBis1SJP62Y=;
 b=fbWBX1r8hItFZZxyjNOJMdhpNMPls1rq1fYYb4mNKZzELA5FBwOUMErdPXDNrmoTY2bIGw2XHF3cLAr0kpZ4qz+VGMye79DLlXU/l3pRRE0hF1OL45YLxuAs6YjbmZSnAQ5ZmpJNwoUnR3ZREuyPSZZ6QbkmyJqck76M3ujpTx2oiQb2lc/kL8PUzd4f4c+rz17OJlgO8Nuaug3cqaNMBKSne+/5lte368t1e8cyoaFeWMdohVooCFlff5nkRlrsPDyD3oOSX0tTYkU4nWrP3ECb0KSCgVrToWc3sCpzQWvP5MQFrsMxUkPV4D9vJcZ27I75Nf91uFHeGW1CyLonCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKeo5c2Y9vP3AHPb4vOzxRL+DS8n2p7bYBis1SJP62Y=;
 b=j5hcop9L8CswPQub4WimygInonJKFbf9GJsF6cCH3h6hv+goi//7CDxkDbGpKtKGOHOMm+lW/SBwycsrU9G8CTe0VmlWxfYseOlvKR9dm5BCoJYoocaOi+EdpodQ69yDUUN6fKpHwo7rUWMn4UA0kngnJewqBsmncrO+uCJELvw=
Received: from MN2PR05CA0037.namprd05.prod.outlook.com (2603:10b6:208:236::6)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 13:52:16 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::9a) by MN2PR05CA0037.outlook.office365.com
 (2603:10b6:208:236::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 13:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 13:52:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 07:52:13 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 07:52:13 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 12 Feb 2026 07:52:08 -0600
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: <vkoul@kernel.org>
CC: <michal.simek@amd.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <suraj.gupta2@amd.com>, <abin.joseph@amd.com>,
	<radhey.shyam.pandey@amd.com>, <dev@folker-schwesinger.de>,
	<thomas.gessler@brueckmann-gmbh.de>, <tomi.valkeinen@ideasonboard.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, <srinivas.neeli@amd.com>
Subject: [PATCH 5/7] dmaengine: xilinx_dma: Extend metadata handling for AXI MCDMA
Date: Thu, 12 Feb 2026 19:21:44 +0530
Message-ID: <20260212135146.1185416-6-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260212135146.1185416-1-srinivas.neeli@amd.com>
References: <20260212135146.1185416-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ceed24c-2bae-4c32-4b31-08de6a3dee22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PnoabW1oESTqSmb7WwvJQgBbVOy+W5CkfntXGj/QYmzpxZDHILS/pDNZAOWG?=
 =?us-ascii?Q?5DCWqXUA/UM9lwY/dMs4wT89IvxdHtGnRhm3n6KOiVZLhkQXQijAH4Pk0ViR?=
 =?us-ascii?Q?q1VhD4pGGVhMGZNMUpdlJkhzl/ItKNBiviQdj5PuPhWkM6gABs9aBbf+M8GJ?=
 =?us-ascii?Q?6TDqSAkRl/b168bH4A0Cf97vLM86+vSkWxc8SR4k7ZSCX6suTyBrax/uz13o?=
 =?us-ascii?Q?EP/H13yz/rx7aCs5eMJTTKU3ayVYmCzoaetpNRTMc2UdpThhMiXwMoI1UxAF?=
 =?us-ascii?Q?WQx6sRjKFt8lOIsa3eJhYgU6Y/HW1/CL2E5lcxjG+PdhiSv6R9NGAxg/V3hZ?=
 =?us-ascii?Q?QvUQjcOtzh/6UBQ16a6i6qBOQZvGs7LUJJe8OPZ4P86nXs9zLZ3inpWVi31s?=
 =?us-ascii?Q?H4vmC5171VTc61RUD23CblUypNF/aoqtMwb74zpNjqpZScBaI2NWT7hQj4kI?=
 =?us-ascii?Q?8yZ94ai724mPqlq+sKhdjxScu0c5/D+nmaXHU5o4VWNXvfihPCcAVfFbwPBe?=
 =?us-ascii?Q?aM06NUUhrhfjdEfq/HJ8BvHRSwVqMQCgU/IzTQaT86L/PlZDRufHMWvJQhkn?=
 =?us-ascii?Q?GU2HkHOeg4avxKX5mEQrTNY6iElD5ZE3RwCNakxQ1NHgQxsy5ZK7aUfB4t0O?=
 =?us-ascii?Q?eL/3uKE8q6xkehVFhtPjfiVE7POqjQDgoKkXu/eKl/BescmGtKscgKbVXK2N?=
 =?us-ascii?Q?+qab9fvgo5vbBC9+e29AxtI/QBhs5aE/M75bnYU/YeeQ36TSTY0UIOO4mgIB?=
 =?us-ascii?Q?MFFnI/8cZCQG6Qy9DZL5R8z7KbTJh2dmStpNz9fXWfm4RCgMAQ9A3/cpa0hQ?=
 =?us-ascii?Q?3S9sBBQ4GlT8XYNdlrRUuf1K3tHKId7FnyhQ7udE90ijqaxqQm+CCB0plg05?=
 =?us-ascii?Q?7iCQ1cW64vtdFRQCq/sS8a21A5oQwxwzhGSvPsCfSlUO3XsEqVueMQUfeeRA?=
 =?us-ascii?Q?H9EGVpECL7Qg2WpVfxEGC9k62t4UK2ti5m/J8Ym7kAz2VUFzmDMLvYW+dUiy?=
 =?us-ascii?Q?WLCY7w47+OrSRKok2UZiQ7uvLCj7kLvQBP5e2qkZ29pjjbnzaHXHb1WIDLVv?=
 =?us-ascii?Q?ck7DGih0LiFtDEA7xbjVfliqf9ipxnLO6OyWqF5EAAf8jWR7xZ3zEwW5Qpjn?=
 =?us-ascii?Q?AzFBcpqMKJzP4MHxj/fR42Qt9M7j723CsWvWycns9LPzQX+7TEyJPBfjX8Sq?=
 =?us-ascii?Q?NYbL16bzfQw/NRaU4eY3NFzgdgDKRoLbRhoWDho+xDFjhAc5B/ZGpaB0f8EL?=
 =?us-ascii?Q?/li1Pt9lVbKzEhiMVyyjFrsjdHsStYLUVepeW7vqOKfcON2mIdqz+aCpuRlb?=
 =?us-ascii?Q?8Gz3NHK+fE2YV7/eHbD96cKo86wmevj81EdzDaeVu/mOkAF115mym4mq5At7?=
 =?us-ascii?Q?j9rg0+5hAxgTwExkyzGjCgJli7MbmT3HxX4i4PgqGaH1OfJKHeYDQDKB3/ll?=
 =?us-ascii?Q?PgoCvHnEPLcAz7pw60wd7HhWk0EoIeRKIVK5WqzVRMhSA7HBEhk5o4wyEkLv?=
 =?us-ascii?Q?3zVI3TRp7BnUPR4TOfbOGVSAt6PCM+cuxOVillkjFQDxOXbQG5J7ToTaS3zV?=
 =?us-ascii?Q?Cp8FGcGBHFW6LSYvDBBv2MmU4hXJc5Hh3vgfmpgVLfLVcG9iQrAQ35MJnITH?=
 =?us-ascii?Q?EcQlkQekdFsFoqI4kCfNj0adw3Mr6qoZ1PdlZkb9S8HKi4rusdRmGItBbFKB?=
 =?us-ascii?Q?QUW79Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sGwrn7TZwpNK9oIG3IN4rR4y+0KfFM6MkGN4jnRYtOgzLyU0D5YkyBRsB86fnpRjNQqnX2/NGtbytwCsHepz2+Wiz1Z4eErUzywEN3WNS5kBQi83508hZMAHK/NTTiv87M/Nz8uf063gLKqDA8p05knj92Tt4qMkMBBLhEB7r+zJB5pIciAICUnsk8krGqgXdn0ZXf7tiaLpI3zRt2c7FeUV84umTT87hFNhu5s7m8zrN59dDynvBEi8TpREhA9zOnTMnogyCQiPSb32u8P+rHEN5dwjCa7/Je7x2Lf3ddh/QKtOXFnFGYAkpnzMtBsihrYlhsmKFEpmssJ0LfwRMxssCktylj2t8h3XFnBwb7yoFZhAqo7j2Vv8ba9l22muSu1BNmrx2xVooG4lZFZQBTlWBU+VjrvFsqjo1ZEHkgCPo1C80Q1xQCBvdv0enlf3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 13:52:15.3602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ceed24c-2bae-4c32-4b31-08de6a3dee22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_055223_976650_8A8C1E06 
X-CRM114-Status: GOOD (  17.21  )
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

From: Suraj Gupta <suraj.gupta2@amd.com>

Extend probe logic to detect AXI Stream connections for MCDMA. When
an AXI Stream interface is present, metadata operations are enabled for
the MCDMA channel. The xilinx_dma_get_metadata_ptr() is enhanced to
retrieve metadata directly from MCDMA descriptors.
Add corresponding channel reference in struct xilinx_dma_tx_descriptor to
retrieve associated channel.
These changes ensure proper metadata handling and accurate transfer
size reporting for MCDMA transfers.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Co-developed-by: Srinivas Neeli <srinivas.neeli@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index e3f8c0f09a17..0fed6bb1b354 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -222,6 +222,8 @@
 #define XILINX_MCDMA_BD_EOP			BIT(30)
 #define XILINX_MCDMA_BD_SOP			BIT(31)
 
+struct xilinx_dma_chan;
+
 /**
  * struct xilinx_vdma_desc_hw - Hardware Descriptor
  * @next_desc: Next Descriptor Pointer @0x00
@@ -371,6 +373,7 @@ struct xilinx_cdma_tx_segment {
 
 /**
  * struct xilinx_dma_tx_descriptor - Per Transaction structure
+ * @chan: DMA channel for which this descriptor is allocated
  * @async_tx: Async transaction descriptor
  * @segments: TX segments list
  * @node: Node in the channel descriptors list
@@ -379,6 +382,7 @@ struct xilinx_cdma_tx_segment {
  * @residue: Residue of the completed descriptor
  */
 struct xilinx_dma_tx_descriptor {
+	struct xilinx_dma_chan *chan;
 	struct dma_async_tx_descriptor async_tx;
 	struct list_head segments;
 	struct list_head node;
@@ -653,12 +657,23 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 					 size_t *payload_len, size_t *max_len)
 {
 	struct xilinx_dma_tx_descriptor *desc = to_dma_tx_descriptor(tx);
-	struct xilinx_axidma_tx_segment *seg;
+	void *metadata_ptr;
+
+	if (desc->chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
+		struct xilinx_aximcdma_tx_segment *seg;
 
+		seg = list_first_entry(&desc->segments,
+				       struct xilinx_aximcdma_tx_segment, node);
+		metadata_ptr = seg->hw.app;
+	} else {
+		struct xilinx_axidma_tx_segment *seg;
+
+		seg = list_first_entry(&desc->segments,
+				       struct xilinx_axidma_tx_segment, node);
+		metadata_ptr = seg->hw.app;
+	}
 	*max_len = *payload_len = sizeof(u32) * XILINX_DMA_NUM_APP_WORDS;
-	seg = list_first_entry(&desc->segments,
-			       struct xilinx_axidma_tx_segment, node);
-	return seg->hw.app;
+	return metadata_ptr;
 }
 
 static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
@@ -848,6 +863,7 @@ xilinx_dma_alloc_tx_descriptor(struct xilinx_dma_chan *chan)
 	if (!desc)
 		return NULL;
 
+	desc->chan = chan;
 	INIT_LIST_HEAD(&desc->segments);
 
 	return desc;
@@ -2613,6 +2629,9 @@ xilinx_mcdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
 		segment->hw.control |= XILINX_MCDMA_BD_EOP;
 	}
 
+	if (chan->xdev->has_axistream_connected)
+		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
+
 	return &desc->async_tx;
 
 error:
@@ -3261,7 +3280,8 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(xdev->dev, xdev->max_buffer_len);
 
-	if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
+	if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA ||
+	    xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
 		xdev->has_axistream_connected =
 			of_property_read_bool(node, "xlnx,axistream-connected");
 	}
-- 
2.25.1


