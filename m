Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+X/O4NBeT5ZTdS8ik8SCStHIRNCc4cPRH1WbAhSrO9U=; b=W3vL7FHsvX2Qf3BZHNTKViAvFV
	tVF3xk4flIXgedN9mLvpHA9ITaHRRysnaSU8ksZqUbM4a5ZmG20bmWK9RVSAxSEc09tCQFBFSIgN2
	LWj3/DQNjkhFgyYoEAiSgAh03UnzPL8+0Aq5B7Ny7Zd6as7ENYOL7QczyKVN+7cyVttMnCDl+wKDn
	Mc2AOkRBlDzeECt8U6hMrGGlyK+5swrbRs4BMh5k6/WtDl6kVlkLpxNE+9c9OyNkI2b2UURNp/OLB
	0WhNuAV3mG/GWObz9koK2TFbtxC6yGPB9niZTw58ovyG7rAJsxtKXJxtyH7Csk8tjyw9KzDwCt2an
	vyLrtkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAzd-00000008O5V-19iv;
	Mon, 13 Jul 2026 07:22:21 +0000
Received: from mail-southcentralusazon11012003.outbound.protection.outlook.com ([40.93.195.3] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAza-00000008O3i-2eZK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pW2QMdHp7J33pXiZjlyXhrCS3s+GpFmBuZd4XcGNOek6pn5gocXunzbSSpO6BZjbsI8JfUYyjeigOUedQk90roPF25n1yBPcdNgruuGequsEF1i1voavSSPlALe9dE1wKhsiYg0i8i47vWgwi4mH2+Q7/Q44okuwvk4BKODT952Rqa4U8PMBTbeTdaTeTuHdgRcvEmsrORVZM1VpohVzswpVhKECSKCziE8faDmiUVI7ZyxPCiIiOIZyF6A6YMydx7BTHSySAhTqFIH3TKM29jzMfpq0/7NEJ/4xjygEifPuJOx2LEA869TBiddQfs1r4GHxj32eQxWzs20U8ChYCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+X/O4NBeT5ZTdS8ik8SCStHIRNCc4cPRH1WbAhSrO9U=;
 b=HDKLhIcJy9Dx8GNa9LMi+zQWlXfxX/OAT6+bCxAfNFSjRZsfb1NGsCs40oFkodep2TIX8Uu/QanH95hNmY6ah8ur8hHMnUxwU3C2o9f9sqVvipGeZmDRdxHsqAuuzDjn+BbngRHTn0rH4acgEJi7DjBTFOpni/Ugwn0B7FaBpN7XB+Mxk97UiwU75Ri5q+bikh9zxkkP74MmrzsTOhVUCoh4FKuwDWUEcUcgsUkB2ZuFi6uS55nmAcJNPn1kIb4nVm6EbarfA4aUtzoMSbI1yC17Qvvl7IFACTR6b/WyxTCamG1qTh93ASnau2ZXuS0HfLxYaWR4vYR23xWnIGCD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+X/O4NBeT5ZTdS8ik8SCStHIRNCc4cPRH1WbAhSrO9U=;
 b=tCSwtgsYXgxZwYIZ7YVeF5AVTxEx34pq06cMC9f2+GIn3kmMuL7BCYAo8XILJvOlrTqDKXc3MrYrRiWttSzbHNGPJTDbV60zy44keKxuBP5DXCfbNqpmgknEavOlBkMchw3+SrgoDM2xrVYMrpYyzCVB8kWwMybtra4pNb3IBKQ=
Received: from SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::14)
 by CH1PPF4CBE7339A.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 07:22:05 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::35) by SJ0P220CA0010.outlook.office365.com
 (2603:10b6:a03:41b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 07:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 07:22:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 02:22:02 -0500
Received: from xhdsneeli41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 13 Jul 2026 02:21:58 -0500
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Suraj Gupta
	<suraj.gupta2@amd.com>, Marek Vasut <marex@nabladev.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Alex Bereza <alex@bereza.email>, "Folker
 Schwesinger" <dev@folker-schwesinger.de>, <dmaengine@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH v4 2/4] dmaengine: xilinx_dma: Move descriptors to done list based on completion bit
Date: Mon, 13 Jul 2026 12:51:44 +0530
Message-ID: <20260713072146.45269-3-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260713072146.45269-1-srinivas.neeli@amd.com>
References: <20260713072146.45269-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|CH1PPF4CBE7339A:EE_
X-MS-Office365-Filtering-Correlation-Id: f68cde26-de7e-40e0-980c-08dee0af710c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|23010399003|18002099003|22082099003|5023799004|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: rzSXwuyDJGV+82mQFOU/SII99R6Devt/Hsp3hiDYKfGsntmQZt2iz5BahDJhL36xKbySFv2JWRlBZmo1K+x4o11qj/f9YqmgXeiNs6L7XHbJRw0KP9A+8drb+HNAWHL5rtIo7mOYeXRGUg6+N5YZe47mdGqA3yMh2IoD7HprJc0qDNGsXV2Ft8J796jO06FcWoGufpF8bTPNIp6mTbODuEVGOBdjXqMb2SADKka5/sLtPTdkRwIuJ6wxh5+tkDlugbFD10oJfAJ1/gZNgPdDw7SVop+OzDDFc2CciguZqlMSmAnRHWnOHB1/3pnD8RMjZ6WZ/Qlp9J+GQr1nU/oobGTfgrnN9Eo44AJcL7pkCBbbusKVj6v9Gjaujdma02R+64zB71DNGs3WFSXKejtkIRNy/de8JdLc/CHOrY/W0vF5XecleIHGg5FI4+p20QLjxkdhx/xhrVAaHdJx0mZjPmjlhMz7wmKnVwehqBrnaM/l/mLS0YdijYHbmFqHE9axp17u2ICqiNojOclG9qYScBSbN0PWujjEV1jbiYzQk6Xp/eCKL09zk/i1h78u/apbjQ5ayVGE4qLtE/qxeg5LbGZoJjTRmLlrelQ2PrB7BQIcgw/OPO7vkFRYmIFhLqHJYcoRynQfSphItY+iwuAIrCJ6W07JRjaLnDMr6OfngyaTj90FmUNMaKwYEtU1R6jLk0Wn2SpT5AC4m5vWg9tXcQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zB44urI8CElqib68gHw5t0LW/uYJsKJmdI6wP+1bfUaY4rfOXr2uv+Dvi886dJ7/9HdOxfAqA4mDgsoD2YbWXLJHhYjCuYHf9I0oYLTaXdW8U64Y4IIQXINgHdsxNg5jOoIMHQKx/Bu4k1RLsd/Jc7MrTvd/SjJ7VH9e9Ik25UY1tyw7/554Isq9g73yAqK4XjzAsPN/Yc2TjWuQ7qfdfvw5Yuffe/INzGdTlebeSTBpnLxh2yQnG9ywgGvH2/5anOUA7YEzt0H7zAxmXfYaX2VM9IIPLUTic6vk2FxlHAdNi3dsk/G4n2db5lrJZZfKnZ6j47lJzbrwo1uTmTsbcNVBmQwDq5dPF6noF7m7k+/nkHujmvYyOv7QArLwLGVLenUNmloRjry5LsKzMVS1CkbHzzOvNEMYn9FOn7WOSZ3fuhRs7LutTv/EF/JJJ6qE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 07:22:05.2963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f68cde26-de7e-40e0-980c-08dee0af710c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4CBE7339A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_002218_678659_02C6B812 
X-CRM114-Status: GOOD (  14.70  )
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

In AXI MCDMA, xilinx_dma_complete_descriptor() walks the channel's
active_list and unconditionally moves every entry to the done_list. The
MCDMA IOC interrupt handler invokes this function on every
interrupt-on-completion, but with interrupt coalescing (IRQThreshold > 1)
an IOC interrupt may fire after only a subset of the queued descriptors
have actually been processed by the hardware. As a result, descriptors
whose completion bit is not yet set in the BD status were being reported
as completed to client drivers.

Add a check for the descriptor completion bit before moving entries from
the active list to the done list, using the appropriate direction-
specific status field (s2mm_status for DMA_DEV_TO_MEM, mm2s_status for
DMA_MEM_TO_DEV).

This mirrors the AXIDMA fix in commit 7bcdaa658102 ("dmaengine:
xilinx_dma: Freeup active list based on descriptor completion bit").

Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
Changes in V4:
 - Reworded commit message to reference the AXIDMA fix it mirrors
   (commit 7bcdaa658102).
 - Added Reviewed-by: Radhey Shyam Pandey.

Changes in V3:
 - Added Fixes tag.
 - Expanded commit message to explain the interrupt coalescing scenario
   and why the has_sg guard is omitted for MCDMA.
 - Changed local variable from 'bool completed' to 'u32 status' for
   cleaner status field access.
 - Simplified completion check logic.

Changes in V2:
 - No change.
---
 drivers/dma/xilinx/xilinx_dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index ff5b29a808e9..1b5b00f08c5f 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1784,6 +1784,17 @@ static void xilinx_dma_complete_descriptor(struct xilinx_dma_chan *chan)
 					      struct xilinx_axidma_tx_segment, node);
 			if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
 				break;
+		} else if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
+			struct xilinx_aximcdma_tx_segment *seg;
+			u32 status;
+
+			seg = list_last_entry(&desc->segments,
+					      struct xilinx_aximcdma_tx_segment,
+					      node);
+			status = (chan->direction == DMA_DEV_TO_MEM) ?
+				seg->hw.s2mm_status : seg->hw.mm2s_status;
+			if (!(status & XILINX_DMA_BD_COMP_MASK))
+				break;
 		}
 		if (chan->has_sg && chan->xdev->dma_config->dmatype !=
 		    XDMA_TYPE_VDMA)
-- 
2.25.1


