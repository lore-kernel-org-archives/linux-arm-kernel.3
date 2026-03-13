Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D1A106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N522ykJ1u9LJYBqjbfnp3hUFRZ4bmn5UTpiAIr4DK9c=; b=z+hS1tggCTP1ANFkkVzXq05V2t
	pMoY4XFFkF0VIc29OiIyE99VHe6CZwRnOP9FHcZrgsmZ+9zJX9HDbhCm3Co7l1nZx/kOWFGdsOAOt
	sQM8Ac0a+kuaHv5JEF5Z0xtoyLcbSFwRgQHPz60z2Fobo+doIYjzFu7pn6U6a0WEiT4eVOXF0W8jd
	PYd8NxvgSXgiaWEzhnJo+rnVkYMzy6apu7at+aaZPVhloPhZngHqJDoxIa9jlwb8CLVU/IgP8MEZQ
	j5xQtj5KHIDPlWcZc5Mq5rtrGznu8Xfmoh6tksxJ06MhifJ1PWUai5m4vbIVMRo7UOql+CnZE9Ico
	3RF7fgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vyA-0000000GqeC-0MgY;
	Fri, 13 Mar 2026 06:25:58 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vy5-0000000GqcQ-3pwd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUaN68KqWOlJ/31gFGDw7XEASd2aZlXt39+lBs7KcwxQU8pJ3zTRMk5mU+PXYFe62xTLNGX8ZJzidaTvgXLoR4FqurTYy5fRGa3F6A3hAwN2mU0zjT7a5R81kS9EaVh8oI28ltA8PysaqT2xfQH4joMqTiVNOQysOcJBUtDw61AeJ5kH9LI9zZTgvs61R5iqJ6UrHzcIMsGtkOq5NyBH6gM/R0JjeH5OigRkO7R7VTrOofL1p19xG07p+XhDzGNwCW5MO+kJK1vHUaH54nsvq2/y7e29qJHQ4LQpMRSEAzN94sATV0J1KhZlfDpxWVnxEPnoyl2A04rE2FyDCsfPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N522ykJ1u9LJYBqjbfnp3hUFRZ4bmn5UTpiAIr4DK9c=;
 b=iiGib+CtcQOj1O092NCOYmEjXtcQxkKe/7qdK9mP2/zu9IbxDr46HchRciEnXEKcrApPadpj9tsmQYM1AAqjYy09TJFQ/r+W3eUera4j/mzeNrKOD2KGf9DUx7fEU3HR5P0hd38E+EufqAfpN7T9gV3Ez0RS1oJow5Be21JoyON5SxybRs3Zo+NzRJbLw4PaNMp4ZgOod2u6pBVI8igEqajmZW2lo2zm39PPJFSIugSz9mu8Pz9lA+gnXZ8z9MuuIEFncbEqBOvF9Oz4seVjOLTtUlkrdD6mX7qHSySq+MqLsiE+jGrD8E49NfJyUWWKkIJO1Mg9Wl7xv0doH7WrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N522ykJ1u9LJYBqjbfnp3hUFRZ4bmn5UTpiAIr4DK9c=;
 b=zoQAAahCCQT6JRr7rlNydx7QAO6HF7FgM2oDDF69jMyJeN4+m5QkFm4lRnibzFGc2tMuxXu9DviDm+k4FGXIGHgyclJL3E3zAcQ2IjQitD00mDfCI4BIwFi5ot1dFI0yapJWaS9fLDVN64y8yQUdQzE5dVYzhcQ4cg+oOQYMZ2M=
Received: from PH7P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::22)
 by CY8PR12MB7218.namprd12.prod.outlook.com (2603:10b6:930:5a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Fri, 13 Mar
 2026 06:25:45 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::11) by PH7P223CA0001.outlook.office365.com
 (2603:10b6:510:338::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 06:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 06:25:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 01:25:43 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Mar 2026 01:25:39 -0500
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: Vinod Koul <vkoul@kernel.org>, <git@amd.com>, <srinivas.neeli@amd.com>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>, Thomas Gessler
	<thomas.gessler@brueckmann-gmbh.de>, Folker Schwesinger
	<dev@folker-schwesinger.de>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Kees Cook <kees@kernel.org>, Abin Joseph
	<abin.joseph@amd.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/5] dmaengine: xilinx_dma: Fix MCDMA descriptor fields for MM2S vs S2MM
Date: Fri, 13 Mar 2026 11:55:29 +0530
Message-ID: <20260313062533.421249-2-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313062533.421249-1-srinivas.neeli@amd.com>
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: bf60fe51-df97-4df8-ef5e-08de80c95bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0xEVFixG1iCIfOwKtFhtRZnYs90uihDZtujGPiW+oCdVqMoVwFEOV7sn/EK2z+4YVZTunM+gz/qNpmg4aAv8Xifi05AW+eCPde3VVIsOMEjS8X9K1CsQmAmtCP62/74QFcihSAB6S+9iW+fYrpgNFu2t5RDWFnj/oCeaF51JqzNFbWSQ58MzCFoiWhqXS4WPjnJVD7FX4t6U5lP/sbIm+UF19cg6gPKoTb/+2aN+t80tyQaz+Owc6VXEHz7RMsswtei3MkrilrpwQPO+oi0ElvVZ/jz8rfnBB6j3rKfNwLVUMWigioi2zOsRYZWAyv/M71KDqKyE5BYbG8HUmUzevvtRqt5/50NK8qX1NIGyUFdcntm/q1hWBcpjbe38eQOAy0gUxtguayhFQIxSwAZHO/jCQ5B6zi3vRuxQwyB2vpUYb2ViXkAW8TJXZqqKJez+3Ejt2Gxwbd7a5gWhmEd9eITGNKjfwaFydlc735mfGPelS/G/Fzkacit5ETHanEpJr3/Jr1+7rpLyO7f404wV/SXYlt+2uul0xXUUkoSXvAqmwgfViKa41Jhrmn5MCEgGB7IPmM8vKGv0qLRG8WZTeD01IT9L73QBDj78yNZOIvx0P0tgxNuEUxP9F9TCeHLbP0U9s1rRsaQ/RJKpeusSECbVpedKpaQY+CPU4sXDsGtGjpm69Qqb/iPb0UTgb0n6CfTuslohKW51Y/61VThm3vMHVac3+Ndl83TAs2lj8SiJqhWMSD4qiHsnuQSyt+OO+/9KIjBEOu1xJmHs35glvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: K18H/LRKGZ9/JFOIkIzGeR6MuwwEkuzLb6rOex6AUO2S2WFekyYIpPn3VMKKfxEih19hM+WoNVQWCMlEhKJlWPo7l50aTSwWRtvZAoVxJ/SrHTKL0KkXYFw1GF/5J6z9cmSuR651qgqkOdJrRvgswLjv2jaknjBv5LoWFeymOD3Crxe2TbM944Fu89e+GOkaWcHKl/CHYbSj5DZZLMAHTXxeWepWj56HVJu6m2NEiKvvnOEMPY2QGUjcIXpsGw8nPmjAMYBaDw1tuM2yL/oDVizNZonQMehGJ3VhUUaZexNXHddId1rhynvc8Vy9zSFlMnN7seNKHlfYTmvSl7nLmXgKGO5X2mml+F9vwSjnwXvGqKojl11UrzPPCvOpSwwBVE1USwK2rASkjhG0Gk2nHh4YUfWnLzzfkukKGJDOxz0LYUHFaszyJ8r806Rkh6po
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:25:45.1809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf60fe51-df97-4df8-ef5e-08de80c95bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_232553_956235_AC27B0CB 
X-CRM114-Status: GOOD (  11.90  )
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

The MCDMA BD format differs between MM2S and S2MM directions, but the
driver was using generic 'status' and 'sideband_status' fields for both.
This could lead to incorrect residue calculations when the hardware
updates direction-specific fields.

Refactor the descriptor structure to use unions with direction-specific
field names (mm2s_status/s2mm_status, etc.). This ensures the driver
accesses the correct hardware fields based on channel direction and
matches the hardware documentation.

Fixes: 6ccd692bfb7f ("dmaengine: xilinx_dma: Add Xilinx AXI MCDMA Engine driver support")
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b53292e02448..4a83492f2435 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -275,8 +275,10 @@ struct xilinx_axidma_desc_hw {
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
@@ -286,8 +288,14 @@ struct xilinx_aximcdma_desc_hw {
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
 
@@ -1013,9 +1021,16 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 					   struct xilinx_aximcdma_tx_segment,
 					   node);
 			aximcdma_hw = &aximcdma_seg->hw;
-			residue +=
-				(aximcdma_hw->control - aximcdma_hw->status) &
-				chan->xdev->max_buffer_len;
+			if (chan->direction == DMA_DEV_TO_MEM)
+				residue +=
+					(aximcdma_hw->control -
+					 aximcdma_hw->s2mm_status) &
+					chan->xdev->max_buffer_len;
+			else
+				residue +=
+					(aximcdma_hw->control -
+					 aximcdma_hw->mm2s_status) &
+					chan->xdev->max_buffer_len;
 		}
 	}
 
-- 
2.43.0


