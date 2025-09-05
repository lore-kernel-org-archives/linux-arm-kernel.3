Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDBBCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cu8LEDd4282aI9U+xlecBFS+qHm5DmTS98OsmeKTmDk=; b=o8WXN6PinU94fhbWe0buToRag3
	TuOIQAft84yGGhNGw9xFewfR65d3O3G+odP0YxmbUQvKIy0wdmAAD9i7V30tvUWvXhefzTbiyKZCc
	+8MdJYswRAqSHwtT2O5W16tZqb7GW2VEkNRGfb3dH4lS2ymYM50oEnwTRooXEDM/k5VQB0k2N6NLS
	l6oRxHaKLQuDuXZbqjBh+tYuou1hyHiM22sbEU+huQM+kVq1p3sBnvqHmaH4iyk9pijp4Pq8YhrXi
	NT52G6Xz+R5Ogv40dlY8IKkP7FMejXMB1WzsFbklwQ3Pf6Z0cha7/cnX98wFqsGggigH2pQTBcHqh
	eEk9KkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR9x-000000007jN-26yz;
	Fri, 05 Sep 2025 07:47:01 +0000
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com ([2a01:111:f403:2414::601] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQFH-0000000HNRU-2c5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JocoO0sXJYutPF5A4jVF4U3jmG/03bBvkBSKs0ZrsaC17L6XwybQdXL1+iHrmcsbWqRxpvW2HXGOpTbob9Al+fZPsuHNH9wKPhyRjqpHiyKeDU7DfxpvC2JThumiI7vpwAI5pEY51iB8k4LIJc4Q7RbcPLkBpQ9J1VB0aehkZmfXBKWWEj2u6Lta4rkpc4N6GFSKDDKClJELbvyD1NHqjRktuCzdg1MpjdzUa4t5cwfbHyXYI3B0mZkHp/KlTJa19nTt3Pvce0Sj+gDlzCokH1dLtb5Lyv9kVeQtkSCgTrGG/TQ6x0CHVRxLIwzDCJruwTqvWEeoq6AHomHqZgdw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cu8LEDd4282aI9U+xlecBFS+qHm5DmTS98OsmeKTmDk=;
 b=Q2rODrgFeXS0R7Z34N1GrxYs4ZniTy4bptWLoR47oaFNodZ4VzfC2cQfMkzAS1J72HSZo/lOz/2d7dytVfe8gQMC9IEpVJIUsE8dJxbk/Oj9RTHKvg0oZugm/1ONjt/w9lWAtdcl5wBIFsk1aLBJ6rEMwzyUBkdZqyypb2wdG9u80YtcdnQjlSB5RMQl2WXqhT4EM5yOjql226pwSETVTmrFwsEIFMrYcf8330MkdKygPo8C48FKYEhFSiCNK8tRyr/ZTM1FAQtaffWrrqLCV/OyZoYZqYgMbBXwa3SO6jELVm98gGqjxnPIy6669N2MQGhjxdjh6lJK9xgCUD8nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cu8LEDd4282aI9U+xlecBFS+qHm5DmTS98OsmeKTmDk=;
 b=OmQBOCr7TyAwmyPpySR9H3gsIypzqGqywPBVXVGKL3dHmQOuTmJ1Ix2yWfUeh+ILETA1hbGdedJ/e+YSiZxWqSYVdElTtdSi/OOxiYb8NVMF9cA1wUARi6bPGVy0JWzZIaL0gUlYKfx1h/1RB9AnNYZEef0RlvN80bu9ndWSIUs=
Received: from BN9PR03CA0757.namprd03.prod.outlook.com (2603:10b6:408:13a::12)
 by PH0PR12MB7011.namprd12.prod.outlook.com (2603:10b6:510:21c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 06:48:19 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::b) by BN9PR03CA0757.outlook.office365.com
 (2603:10b6:408:13a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Fri,
 5 Sep 2025 06:48:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Fri, 5 Sep 2025 06:48:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Sep
 2025 01:48:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 23:48:18 -0700
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 5 Sep 2025 01:48:16 -0500
From: Suraj Gupta <suraj.gupta2@amd.com>
To: <vkoul@kernel.org>, <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>
CC: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
Date: Fri, 5 Sep 2025 12:18:11 +0530
Message-ID: <20250905064811.1887086-1-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|PH0PR12MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: b799faf8-de3e-48bd-d1b8-08ddec4832f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3GzTEzWYbjjjKt50WsopcSVonytYtOdPlg/LGy3ev7BU/w5UUejWuWnD87I?=
 =?us-ascii?Q?nRBQ8s77T7nTiisnqB4IvOTfsWxZn/4eLXGXa9LybhDUUCjQ0ABqMM/+WvcB?=
 =?us-ascii?Q?IeZmHP+6YKlmZvIwauhxOl74Zgz9n1bNPF2nvW9E6uLvPP7eoLku6ly+ZutY?=
 =?us-ascii?Q?IEluvV/jGS52utNJ6aljtGb2eVcfXxXT4KoBetgiosgfPEPzghw6U0NzaKPq?=
 =?us-ascii?Q?GWllyv2RLvMgQO8nBLLjtDQBQFIpOn0veg9DQTpw6PlPIhj2ypNDDfVYJFWk?=
 =?us-ascii?Q?vaZEbnWc9005EXzTmoBh/xXYY6avia2VmcCIqiNk9wsoDFeeTJC4wzDpgWo9?=
 =?us-ascii?Q?+danpLldjaoCvAYxxptubiYbwFANLXxm+n+p0Yr8Gd/L4FAmWsi8wGDTQ//r?=
 =?us-ascii?Q?elOnsECUP5pFfj4MJHe1dAPNJ8Q7gIcFPJ5/ti1imce2LFJ/9hYZYBdePn3/?=
 =?us-ascii?Q?aJON8jrH0CAK5KGEpjDRzwD+dYBmfRoHq5HOzYTQE7inE+feEop1wSBQQFo0?=
 =?us-ascii?Q?OTZO3gcZ6/fq90pFGRCVh7OTM2INCsdO4ag2Bt6w6/TFki46VgLTlUfy6Gpb?=
 =?us-ascii?Q?XZsAL6kDhV/QED8f7lxVruspYq42Rvps5ZqbSLYN5lBRWGk11ZZ74ia91Gnf?=
 =?us-ascii?Q?Qp5qzuKzZGZdWokNFza8nYZRLALIHfQw0yRMIbYd7Gg+2UZrkKIOgTaSA5Wl?=
 =?us-ascii?Q?J9c92ntL6N2yXoY4z4+e/rUZrvx4sTNiSFztp/YtMIpnWJJY1DHP8cfCAw7N?=
 =?us-ascii?Q?6UhWFQF0tTDU9/XzBr3FvPBQZYFk4WoVMb0UxIWwvyoYgKG1Dv/GQ48vlQOz?=
 =?us-ascii?Q?yjsePjEVUpAUSTweIS+cAlSGSTqEGCdXW/XLR6QGjxGZV7p1Uln7h2/TFK57?=
 =?us-ascii?Q?nIc4YE2U73435DzGu2sGNJHfbd1QZFnzzF1/WSiNmvxJbamHSVyYTJ2Js/Gq?=
 =?us-ascii?Q?crcGoeCEYUN0qOF5gxgXoOJgsHyh5zqMzU38yf67ljwgMA77Hsy3RvhIMYAZ?=
 =?us-ascii?Q?QpO72DazXDcPwyGc/H/9tPCVU2pjfeRu44bHq3ZexPvJvEdfUC34FGFT+4qu?=
 =?us-ascii?Q?yLwAm6xlcGp6ui96ea7YKzWf/qU5rKyaolAl8IzAweS+cpufF+REMNURL+U1?=
 =?us-ascii?Q?UdZ02QlUFZlVuuNEwdQlQTnC88jv2/OZHQWLw3wa1fkL4o6zvrY0j8weC+fO?=
 =?us-ascii?Q?kscEHJUOId8W/Hy33jtA1YeQVtiHZUtm5Is2LewQfdaRPbJWrRaOjlkf8RoP?=
 =?us-ascii?Q?BylWWKN+C1FUvyWPAxQjFQe1R3xwxJSTPOXwmlrcFmwmgUCP9B202+/GhDJb?=
 =?us-ascii?Q?hbIJvgNyc3gNm1G6h9dYnylBkvACTkYL4rqUhIf5UTcu7ViF7h8wo+SUEkdV?=
 =?us-ascii?Q?HDf7yba7rsHq8xfKnyXG5RchAHvabXr2cNfeeTBR4euH0ePfgclzYQXy7C8s?=
 =?us-ascii?Q?uPpsceE9YFiXCvdKQLD2+RxBpR7YBNBjtnUbu0Av3nwz2u1uCCltJcXSRkoT?=
 =?us-ascii?Q?9mK+0zoL4ZGrkVvJiaAPVMcnWATkpBTn8oDP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:48:19.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b799faf8-de3e-48bd-d1b8-08ddec4832f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_234827_664127_0325CFE3 
X-CRM114-Status: GOOD (  12.82  )
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

When device tree lacks optional "xlnx,addrwidth" property, the addr_width
variable remained uninitialized with garbage values, causing incorrect
DMA mask configuration and subsequent probe failure. The fix ensures a
fallback to the default 32-bit address width when this property is missing.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
Fixes: b72db4005fe4 ("dmaengine: vdma: Add 64 bit addressing support to the driver")
---
 drivers/dma/xilinx/xilinx_dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index fabff602065f..89a8254d9cdc 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -131,6 +131,7 @@
 #define XILINX_MCDMA_MAX_CHANS_PER_DEVICE	0x20
 #define XILINX_DMA_MAX_CHANS_PER_DEVICE		0x2
 #define XILINX_CDMA_MAX_CHANS_PER_DEVICE	0x1
+#define XILINX_DMA_DFAULT_ADDRWIDTH		0x20
 
 #define XILINX_DMA_DMAXR_ALL_IRQ_MASK	\
 		(XILINX_DMA_DMASR_FRM_CNT_IRQ | \
@@ -3159,7 +3160,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct xilinx_dma_device *xdev;
 	struct device_node *child, *np = pdev->dev.of_node;
-	u32 num_frames, addr_width, len_width;
+	u32 num_frames, addr_width = XILINX_DMA_DFAULT_ADDRWIDTH, len_width;
 	int i, err;
 
 	/* Allocate and initialize the DMA engine structure */
@@ -3235,7 +3236,9 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 
 	err = of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
 	if (err < 0)
-		dev_warn(xdev->dev, "missing xlnx,addrwidth property\n");
+		dev_warn(xdev->dev,
+			 "missing xlnx,addrwidth property, using default value %d\n",
+			 XILINX_DMA_DFAULT_ADDRWIDTH);
 
 	if (addr_width > 32)
 		xdev->ext_addr = true;
-- 
2.25.1


