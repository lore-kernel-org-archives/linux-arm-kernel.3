Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBC0C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4cE7UArTN6RhuHj/AD5sk8PploVRZUygtjNoDSP+vs=; b=rHnB0x8eOt7f9SYgvIpLQU/EI8
	Y9bWnYG4mQdl7DZc/N+VP+Skimdq2DD6TMX6VyL0qV4rAUA0ZA6JsDp9EuQFMYffWJUumocBMjCA3
	Rwn3l8st4f7PAohFmFT/SeXwEGnLYz77MQirhIHo2qAdg//0ahrGrGlpMrib51KZZe+9t25HEFScg
	qO9kN/KCXK/WuP1AQI/5JU17XEqmnDGwLqJcPjupBU4opouGGQgSnXVy0xbBMP4CkkJasSpPsoZpg
	rPKo9zijVpVS9T9SpUQtE1mHzAjjC1LaHkD14OJcmipdmrHtbczegJz9Y4HNS8Bfhfw00/sLHUhpJ
	7/jqGdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeZ2-00000001mQf-31Y5;
	Fri, 17 Jul 2026 09:09:00 +0000
Received: from mail-westusazon11012030.outbound.protection.outlook.com ([52.101.43.30] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeYy-00000001mP6-10uG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 09:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZIL+z2eB4E2CDlCbqwoS5fOw84Sqz5J1UNpsOYMIOQo7vE8Dg6XOzR78Vdefd2YT+usCkRotr04QPze8Nrp6lApfz+CPIw/3ilp4Q6/UyAsADAfIJdHk3VFXUjTP2aLn85ZTtD1OFXDjT+fEF9NgBDJAbA4IhLTZwp7I+rd0q5FCY7S88nliHo9cw79wxdPk7/N0G9+FLw0Oz3/evIx+QqRXrFL9uyXlf1CXIgfuBADXQgMVEJKPwKZc9iW8LQuMkwKT+sDBri6kB38NZEKn4arJI1rz9CEZyikh8xussSjswjy9rm0Hc/pQxvutaz7luUnd1yqC+ll9dYS6ijoWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4cE7UArTN6RhuHj/AD5sk8PploVRZUygtjNoDSP+vs=;
 b=mnvQOTbEez04R9jUbShqlYC/q6tM8aMOboTEGbg4Z31wP8zh9xZYrJ9v6WDNX/6mMnIiyGX7wKX/xtKf9ukUyJu7Z0KyOZ37qpvYewSO6YVklTKPb32mg64FE3pxonlGF+MfOxSYuDrPNKMVks7Al4rchrXgOpOxZeYG+JLRKDWUncipSZKmqnlEbwbOfP2xCv0YQYgd3Na3csGGY666yi5XHDa2sE3KptauzgoBo1is8D0cGDQjfnYKAYksMIqfnHE1g98GLuCXMD+u8vrPaXDg0mxYW4qGhO2+A2pDTyLCAsikNilz6FP9WzjsM44CIv0xCPtV+fA58ROWxfYeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4cE7UArTN6RhuHj/AD5sk8PploVRZUygtjNoDSP+vs=;
 b=PdJJFM/rXnJlblYkLRxjwKqLpQ5N9LR2m1qVSLQfHWaBrM4tWlD3MSw3j74dxSj6yR/6JhLd2HnQ7mhY65tWuyc0qz8UMHUJA+qU5ni2ynFRCRRXhwzzKzX/W8gj62AJhNDs+/D0RxL6kIUy8U+o/oQAPXpthAXwBDX3krSmhFw=
Received: from DS1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:44c::9) by
 BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 09:08:48 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:8:44c:cafe::53) by DS1P220CA0020.outlook.office365.com
 (2603:10b6:8:44c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 09:08:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 09:08:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 04:08:39 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 17 Jul 2026 04:08:35 -0500
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
Subject: [PATCH v5 2/4] dmaengine: xilinx_dma: Move descriptors to done list based on completion bit
Date: Fri, 17 Jul 2026 14:38:22 +0530
Message-ID: <20260717090824.2364230-3-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717090824.2364230-1-srinivas.neeli@amd.com>
References: <20260717090824.2364230-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a001f5-571c-4c0e-8fa6-08dee3e30324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|23010399003|7416014|376014|82310400026|10067099003|5023799004|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6/NJZT/5WpLgL5B7YLGvQ+DUCZX6HRZ+si6TB0KuSdUtzMCzWEmuSLZ7QAc2YC16674ZPcZfZNPNsAXBI7wS+JPXvJIa5E51xFXTOoKcVcM+bXj1kIjPEYRSD3Br59FAuqtORB8IbdnH7MPaRzKd6q2ze57isTEVWH8Q5pIqKM9KotPZ45hbWmD7BMFDmYmC6pkns2bqg3VYGiexV5xqElbiCl7zbqeUVGnvzoxu1GK/WsaW2rMpe5PdujplnsqOmGS+q9KcBZWdcXtmfmFuqLswgR/nVKPRP8ofm7QC/o2nZxci9GnSKA+mmJ44gc31Xghw44cNSCZ4m7UQOtbT/xEyB6FTCk9A5NX/yhd+UuFr/EW4Nw3eOKyjSiZQ6V1S4uISNYd1cXi8Xovx2GPFDafcMrdZg4jQQMbNzF4CyXCZ/OwGnZSy8rO34FfJxEIsM7/1kohL5N6nMjUL+fGeZBkTA6o8wElrbwSGxyhB74HVbKkUzWRfmLLyWFkQniA4Kl52lrYHAjqH3uOnrqq3UiYbQuAARqLOYFuOEROBbEJ4/IFrv3HVLofu06cwak7NA96XxjuWc1EbbpYqVbL4WKKGvyS7L4PiCJEe+i0vHw43sT9lOc5bYoCUWYF6D1JRF8YkYVcS6UY4dge652uG1dEpALvz7pFx6CMr8nZllCKNnlcJoD0Rq4uz0wG3GXPOiuKcEcn6UzLNBS8BO07b/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(7416014)(376014)(82310400026)(10067099003)(5023799004)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o9+GtI70uCLUpBJKDhRZZbOFOhg/fXtdkBYIg3OHin47zG1OI0+V1+IR970MRV5a8pOPGKD9Qmkl0w6+YBtCs9PGCUx4Y1R0gFJldoqGHWnUIXh8QdaRffUt8dQCSO8C31dLT+cHhn89heK0VMaajpRB+Ta4yhCG4w1DVg6VeKD/kPdb6uDEf9zhztKuKq+Xz4P37C4SqrzlgdtMQnuehPSXzaRnVfk0GlIa2J6C/zZX+w4dD5GWuQjaeieSwMQ1RT1CnT3ujH0ytf8Svc9rUncArxC8oY5TFHwqyfeJ7K1h9qmLFtXxfO+EEwGvk9hHfic0ILzPJz2vbuAvpp6j7QZLpUnGnnCqP9692FGYukPXzFxeBeUetqO/0niFXNu8NTJ7dfapYKK7QpXkQ0XzDw8SGzR283SA7VwsVBjA/dGks03OXLoHK+ShuyrGjoqw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 09:08:48.2368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a001f5-571c-4c0e-8fa6-08dee3e30324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_020856_306075_A03A957D 
X-CRM114-Status: GOOD (  14.46  )
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
2.43.0

