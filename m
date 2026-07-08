Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BA5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK06CF5hKpMrLcFWG77808uZSM3bFcqkOP7z2Pi4N9M=; b=Lna6i+w8eN/FK1i1z9iwUd85K/
	180NCpwauTiXMLO0Fm6mpu5WUQXBxvJw76IjRnCyVKtop6itT0pl7pN1u/VF+jfzeoRD4NaHiPU04
	ncGTOQxi0Bpe1AvPhV4wc9F4zZSAxoup5DLqEHzvmcT31cwqW61f6np4SfHgYS+5bp2HU4TRz389v
	Ojpo58nUCEoe8JqBGyM6AFRarADzBYedfHO+R11Le6Pqg3uSSCjUF+UQXRht7Q0EVMenm7NTtfDYv
	44yMx1wZJPr3ntrw9YwW6pXXevZotSPnTg5KzBi9/OvmIcG1eMgmeGOIA2f8bi7YCzOTxCVLdx9K7
	rAx4A4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPDg-0000000GoVN-20gH;
	Wed, 08 Jul 2026 10:09:32 +0000
Received: from mail-southcentralusazon11011048.outbound.protection.outlook.com ([40.93.194.48] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPDd-0000000GoUD-406I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biQ18L6CQ9RHTT4PjToptO7uHFhXNFKa1ON5DtlsHeiTD51u9eAN/O5mo+xyMRIz2xvFPkVNLkH3zYcwXz5e5r/jhASLKUSs/zZenZxhEbBSusBikuz+qO0n8c1h7QJP6a3Rp1gfyTJ9ZcxNhMu3SwV4wPhUuEY5MPQdlmLU51VoEip6k2hmVvk6zCifNXR2SMPBcO/tGQRyETseruwg7YEB+Yqw5wqDNOrKGfTCW5XI5qjrJCnVuifp9QshqW6ug23MjGbrersIxEliakR1VbWJ3epm4hGoHw9YzU4HDHou6sGQm6xIrWTP2I/WdNDqu+Zwgpkenw9Nu8yumdvqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK06CF5hKpMrLcFWG77808uZSM3bFcqkOP7z2Pi4N9M=;
 b=GppaGNrJCuyf8WPThcHUOM4yeyh8xnSdJjmmm90rk2wRy9/Oz629iebUdm1lqi3GLJpqlcnE4GgC6WGWKG+WTqFzQJPyvYXRaty2CgA61OSpqANlKsY/Dx3egak7wXuLURJVBltc91TGGajKsjL8rASqQ8YsZVQL/qYvKwU7QBSDHn5ErEkQEEpUNfoeAxi0AOfNqjx60nWmPgOiYx0ZHkfl23tgV/J7RMQAj/0Sj9/NwWNZPHLgLK0dFX3X7i+1AR3S/+AcvHQEvZnPNHKKZVJez7w2wH05UCMVEah3sARpItRp1BwC6HrCFsyTPPbfMcALjFz3o2GnGU8gVH8Yeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK06CF5hKpMrLcFWG77808uZSM3bFcqkOP7z2Pi4N9M=;
 b=rrG9xVyXHztWR63i0tXbPtFOvz/8mTy49STWrqw+dhP+TZ3rSNaHqlzwRzljNPkgCgUoIXcuLq2n4412z/JaXAtMuXot4/IqQ13CIEiEC9V8csxr7ZdDtzasRKBj6awPNVb318jYqBf86MjLMbTd8ZPfNd3pLHq7J0rn7S5piRE=
Received: from MN2PR08CA0023.namprd08.prod.outlook.com (2603:10b6:208:239::28)
 by MN0PR12MB6200.namprd12.prod.outlook.com (2603:10b6:208:3c3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 10:09:20 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::66) by MN2PR08CA0023.outlook.office365.com
 (2603:10b6:208:239::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:09:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 10:09:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 05:09:19 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 05:09:18 -0500
Received: from xhdsneeli41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 05:09:13 -0500
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
Subject: [PATCH V3 1/4] dmaengine: xilinx_dma: Fix MCDMA descriptor fields based on DMA direction
Date: Wed, 8 Jul 2026 15:36:49 +0530
Message-ID: <20260708100652.603074-2-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260708100652.603074-1-srinivas.neeli@amd.com>
References: <20260708100652.603074-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|MN0PR12MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a14041c-c378-49b2-c7f6-08dedcd8fa61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|36860700016|82310400026|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 6y1CSEbFzGkQtibfJd6wjLBptKnCTUU0XOgokqjDKov6l1qTd6aQNy12xZtWAsFcJHBCtiT/Josv7DhdTezCLHdIrI0TfSYMH/AtYYW56SKbdWkzG7PVdnDKDeHblJJASnR1H+BAX3vUccFcp026OslLT34q6OsoVGM/wnCnMmCqzoZ+/KME9N+ZJf1XIomOieA40pAlJDIMjha1Ltszd6+M7QGpvRTCZbsMN0+9mO9SgyLrHKvY3yY3PWyAHNNYWVu5DisTDykT7/mAqucB8F1ARS5rCvyfim/wzYoLcGn/C4ZXE5oUn95g2dVPohA/6+nvrkDmgazYMiIegsSY++IK9yuL4tBLWfu+nEfqRE7mXJCTnZy2Y5MK0u6RJp558Q8ENmBuIgKDNv1wxHgMziID+DzmuY7I6SOBDBJrDZFNDjICjS3i6q8zi331dN/3HUeSuqnwn4KoyUvo9OwaXFkz7MHPKAqngxcTTPfy2syP9apZck0GKCfKMLlmxxqYtXdqgxnMOlcAoLalAyuGvFWv9bo1w2FjLfDGpuMJCItXjtguN6uC4+a1xYIMWyoh7I2gqySxQxWM0FL4EZ3/IKoWs+tH4IilX5jPGBVl5qRSwsQ8d3rhtBLRe96OvGRvOF2mfXvm/pZBg/Exyf6C7gB2sfFcKliGJJXLP+axFJ4YWpX7I1X7OUJ/x51bPS5bVGNtSlM1BZW/pvXZTKkJ1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: izupamLnmM+N0H5Qq4adh+Q2hQrX4LIzu/Un7vXx95qMRqxLvqgw51X5MTVndQerrqMMe/jEYvCQ1lD/hGRpi5jP3CF0y685C3esNLaydOUkdtDtnWsqjt0Oaf2FTpxOlo9cJP9GXLWv7AoauIplBhC37g2vV2jSIIEykmwvbRu/Yancnt8kS8nqdjALrLRhE+8R6mIW5h+3YdWEoD5k0Otzfase7o846+0BbgmIhHrPzRXMkbcs58UKXo2KLzFF9uh+x4jVKRT7IDbMW4hhf/uCusUEDd8OYsX8OYmSJ1F9E4dkjrtk+Un3QEoif/IWaFT6Xaua/MTTCUaCofHKZowlTdfJc154lumH7l3r8NPdUREmBwoJI6TlCCkNSPTgAJEh7IuIGru4xVnYFxD3Qpr1hrjSbfch7Go1r1VqG8O1wCeIWCou2ZaMS0mh+06Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:09:20.4507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a14041c-c378-49b2-c7f6-08dedcd8fa61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030930_006563_A999AD0C 
X-CRM114-Status: GOOD (  14.50  )
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

The MCDMA BD format differs between memory-to-device (MM2S) and
device-to-memory (S2MM) directions, but the driver was using generic
'status' and 'sideband_status' fields for both. This led to incorrect
residue calculations when the hardware updates direction-specific fields.

Refactor the descriptor structure to use unions with direction-specific
field mappings, and update the residue calculation logic to select the
correct status field based on DMA direction.

This matches the hardware descriptor layout and fixes incorrect
residue reporting.

Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
Changes in V3:
 - Renamed subject from "for MM2S vs S2MM" to "based on DMA direction".
 - Reworded commit message for clarity.
 - Added XILINX_MCDMA_BD_HW_SIZE macro and static_assert to verify
   descriptor size at compile time.
 - Refactored residue calculation to separate addition and subtraction
   operations for better readability.

Changes in V2:
 - No change.
---
 drivers/dma/xilinx/xilinx_dma.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 98b41b8f8915..ff5b29a808e9 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -223,6 +223,7 @@
 #define XILINX_MCDMA_IRQ_ERR_MASK		BIT(7)
 #define XILINX_MCDMA_BD_EOP			BIT(30)
 #define XILINX_MCDMA_BD_SOP			BIT(31)
+#define XILINX_MCDMA_BD_HW_SIZE			64
 
 /**
  * struct xilinx_vdma_desc_hw - Hardware Descriptor
@@ -277,8 +278,10 @@ struct xilinx_axidma_desc_hw {
  * @buf_addr_msb: MSB of Buffer address @0x0C
  * @rsvd: Reserved field @0x10
  * @control: Control Information field @0x14
- * @status: Status field @0x18
- * @sideband_status: Status of sideband signals @0x1C
+ * @mm2s_ctrl_sideband: Sideband control info for mm2s @0x18
+ * @s2mm_status: Status field for s2mm @0x18
+ * @mm2s_status: Status field for mm2s @0x1C
+ * @s2mm_sideband_status: Sideband status for s2mm @0x1C
  * @app: APP Fields @0x20 - 0x30
  */
 struct xilinx_aximcdma_desc_hw {
@@ -288,10 +291,17 @@ struct xilinx_aximcdma_desc_hw {
 	u32 buf_addr_msb;
 	u32 rsvd;
 	u32 control;
-	u32 status;
-	u32 sideband_status;
+	union {
+		u32 mm2s_ctrl_sideband;
+		u32 s2mm_status;
+	};
+	union {
+		u32 mm2s_status;
+		u32 s2mm_sideband_status;
+	};
 	u32 app[XILINX_DMA_NUM_APP_WORDS];
 } __aligned(64);
+static_assert(sizeof(struct xilinx_aximcdma_desc_hw) == XILINX_MCDMA_BD_HW_SIZE);
 
 /**
  * struct xilinx_cdma_desc_hw - Hardware Descriptor
@@ -1015,9 +1025,11 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 					   struct xilinx_aximcdma_tx_segment,
 					   node);
 			aximcdma_hw = &aximcdma_seg->hw;
-			residue +=
-				(aximcdma_hw->control & chan->xdev->max_buffer_len) -
-				(aximcdma_hw->status & chan->xdev->max_buffer_len);
+			residue += aximcdma_hw->control & chan->xdev->max_buffer_len;
+			if (chan->direction == DMA_DEV_TO_MEM)
+				residue -= aximcdma_hw->s2mm_status & chan->xdev->max_buffer_len;
+			else
+				residue -= aximcdma_hw->mm2s_status & chan->xdev->max_buffer_len;
 		}
 	}
 
-- 
2.25.1


