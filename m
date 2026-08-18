Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36176C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXEMkjZfzJJFUgNCoT4YB6DpLRmaO3cR04O9m50VzrE=; b=ePM/2OWxtotMmU8EWh4NnNbWAq
	4eWsSJGLorm/PhTSHeUFOkzabMQaJ7+PTKsxjHlTQhqV7jZpFC7Oiu1rjsnePcjiQ8hjTJhhOrN5p
	jzMXM1Qd0m6i1lfPYIP8yvPj8jqbCtu64XvASbf/NpJl60Kuf6HRVz5vwp7ZbWD6Zo3j13WB1JOLH
	UEKtnj+ZpHM+cFCAVjSFmyN6wf99mI34489Jj6tdC9pgQmpRu06j6Y/jMh5Lk1lgE6GhgoNIcN2qL
	osDPPDqGBwwnTyi6XWt44np3BMN+YXF9iUTtQ+wMUp28td+BX1q7iTqAAN8reSW9zFPNo5+oA6o9r
	vRmQe9ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNtj-00000008Sjl-37Of;
	Tue, 18 Aug 2026 17:46:51 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNth-00000008SiD-05dp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:46:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT395s03mK5iqQZ0uY+bsQsLau3p0+uAj6eB1pxdADm8V658mPD3eqvdD3pcTK5685y2Fc11ckBLeyhlPiYjvvUFT6LC5e7s75QWldobXAExwB9tDS5lHJiwCGpkGLdM4ykUF5R0m2TLQS54CaMyTJXkTy5uVMVwmK+TXsBw50D7WPzb/cyJk3NOrB0azF4PiRLVBQCuJX/64zBcJIndNWC1evpszp3J129c+fW9BYvkfw2qtPZTdHkHe+dol8bXMHa2J84lb/FJl91UDhuWVdC3gYuxak1ZUlPf5Cxks56twD3Hq2akadHa1dgs1ycLnKFF/l6/tPi9KFfSVQ7SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXEMkjZfzJJFUgNCoT4YB6DpLRmaO3cR04O9m50VzrE=;
 b=RVf5KQ2QCQpuSBpnR5Iqy9AhQkC/mxkbCUAluKbHzI10H0Wfo/tzBFV5ROvsCp8fmSYaFoCHiz1Q/4CwA3z9vdKryS/rHuydfX0NSZlBq6A004eL/diwFW15yVzGBzLU3m/Na9puy4A8qBcRbZUSwiyHL8hLSR38+ny66D4su7DpGdAxjQLXuaO7WjkWAOri3+m5whoGVC8bFvdTl/jdS5i0/yTponXbvyzoCV2x1lNANJegkiYf+P/a1utTFj8g7NB6zjfzGLpuUpv1gwF83oCTxW80dOObHKbziwC+67CaHvHy2CyWXtFbEGArMMWLttEByrors3MuoQfkibOjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dXEMkjZfzJJFUgNCoT4YB6DpLRmaO3cR04O9m50VzrE=;
 b=XkIj7uC0FBskABz3viE7ABxZ7UHYW5u7iF6KDhE0OsDFW+pH5Y2tRD1UD1AaWsMlI8kGbQssZ6seTRv/82P9GeBkivtbgzIfXIisACRFr16vhZRYxRE+Hey8almvuxch6jFz3INhL+78G/2BqWRDtQEAsou4n38HdEgMItObtp4=
Received: from SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::23)
 by CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 17:46:40 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::6) by SN7P220CA0018.outlook.office365.com
 (2603:10b6:806:123::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 17:46:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 17:46:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 12:46:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 12:42:07 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 12:42:02 -0500
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
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <srinivas.neeli@amd.com>
Subject: [PATCH V6 2/4] dmaengine: xilinx_dma: Move descriptors to done list based on completion bit
Date: Tue, 18 Aug 2026 23:11:49 +0530
Message-ID: <20260818174151.1608971-3-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818174151.1608971-1-srinivas.neeli@amd.com>
References: <20260818174151.1608971-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 0788fdd0-8b8a-43f3-552b-08defd50a8da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: bPzKZelbYV1EZQ5/2AfT3b5Ube1tVZfDi0IvN2CP8rub4brSBW8M3ML6OEIWwY/fZU8noZ+VQqFyk1dWPrtreyN1k+lI6dWscOWLAB1MSJ4xWrMrrX15mDSDRV0AMB0mZB4YHPDxT2iuuI6k4cqHgBjOYrOlOFiS3A8Go7cw4BJdNX5HWb1i8gp+qLXUHDJ9RZtxqWZGVpjFn2pSh2UHOaLfK0+hQjtZTJOoa9JLw53hpe0tiqUh/V5VVfxYwoxvQtPVZFmS71Fcb99fazDsJdG1g8kZEuKP2z0cdSF7S/wgFtFAjTSzVSOQW62Rs8SimCvsPZpjwyCsggNzTmZ7tm+uIGjZAZEvxd83any7CThbrdhO4ApgBBzNOT30vgW/qTWJpW9jx8HURysrldMF2MfvGqUP+q8NosVW477d50meHbDv05RyXMmWXfDUW2CdxTLhMLanxSSJKJa/2AyBNjlVVSoH4E2lqH76tHexkpxfFEIevyJxL6/tDm43NyTdV2VCF0Mq+r5+CurIt7lIeZC2vCcNS+OP0sEYfgxi/d10twrUXnyLSyOGMI4zdyydM+ESLBwIbEBjX7B2Q9WtkZUcCKRVnlTQxc9OL7bodaTizZQ6eAQffRzAlr13St4bKPYw/x5X8FJq6x/BgSGeb2G7wSdxUTp1BrrCtIhV5sQyPM3lD7DUAn74L984pB7fhU1VEry5rz2rM5H8LAwTAg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T5aC1XmGzm6vNeacZLtsqtXyrObS2hrH3oNgsV5DWd+JYxcSn0C19fGaIEZ7mO6XGq96Ii0HqwJAtidZSewCF8IC1xe3ls8liU8fp1QgF1kzE4beFpuWHj7v/Tua7wZm6FTvqcWjS21osWkIVligDgST3h0nKwfcNg5BJHtbk/txkQioUG7q5UPUPGpR2A43ugzkU6hxulx9jpvZ0AFHS68veDCpWmY9RWrqqSKezD8HwdvBCinvy6QvLPozHD+NZ5MwxyoAzhIKiR/LfKt/c06l4rDj0i/HqiBY7riXiskUdYbcryI0dW+rk6ma6DGFkihObwWbsUK8rJjadlZD3+zgKUy0SRODJdQsUOAkl/2lN/Zl2GZ7/XE6sDTi+gO6jfhfvB54n9PgRihZEH/XxzJr4M9npoZv63zTrVJsqnm5LNB4J4o/hYPL363BUfrc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 17:46:40.4918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0788fdd0-8b8a-43f3-552b-08defd50a8da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_104649_128694_5E85CB22 
X-CRM114-Status: GOOD (  15.09  )
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
Changes in V6:
 - No change.

Changes in V5:
 - No change.

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
index 2319101be778..506ce1ec29bc 100644
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
2.43.0


