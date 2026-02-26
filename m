Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5049FD8FF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 18:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRZG/bOAwSWkG31/K1DHKkMuwrdImswtfVquSoxYKLY=; b=ykHAwljxCBCbhGlmGJaOe7qY1N
	tGPEoefWteEMucTVxHcKlBjuEX4xOM/lTOQku+ytCA2OVOBmc9+qR9yu5Plr6RUwnOTyDjgz/Q+aN
	PboSpZUnwYUWfQzImIEXQz4LdVF+7TM5Cz2QNKHVrm5Pkiy/SCQpbjZ/bO6mytv2fR9f6id7vRaqJ
	lXOWE1sGP4/n3UcnJx0A56X2jRfHVUNHEoECOxNMBf5My3SWEmBQYspfky1kyv/huQeIWPD2IFkI9
	rasaTNX2GlKLq/dAdVBPEX0+JaGLXuBkA06RNXH0ZCCic+usmFrwmG+xtlOktXUYlj0iYq8JnQcfC
	j6lgdIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgVr-0000000704k-26RW;
	Thu, 26 Feb 2026 18:55:03 +0000
Received: from mail-centralusazhn15011021.outbound.protection.outlook.com ([52.102.139.21] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvgVn-0000000703z-3pXb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 18:55:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCCNZuNoS4Jd7SFT20z8cXVrWcxabZC/aG3lx3mZAoUQBerN5HoM32gBVrOAnW+g5CIi5CDg9HAh9I2Z8UEkSXxiWl/mkVLY3yLmgmdFeDa4rgbD36o4XIB7FSNImqhOWOwDrCvB703xRiKgPId0DnOekhiYBk2cqxiDfw8z2YUjf4Zf+3hOT6dx8vtYJUuBQ++HvPCsSbdpUjxt25dO7a3wZk90TdayTQpVV6DGg/fhffFNozKo1VYzUPE7p5R4cnHG7a6fwcOmrWDEZqXp/UamidHpZj9PZfbmwxRhwiOihb8n3Naf3UU73FwNrDT21kc20HhnHTqM8LVFb+FDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRZG/bOAwSWkG31/K1DHKkMuwrdImswtfVquSoxYKLY=;
 b=Ux3tkUUme1hhDgnGr9MriBOBbk9a8N9X69WhLA74BJHpDsS8RIy1PJS5hgmASUaxcJhRBf2MBmp0H+z6QphUKCC/Inftns01nIgt2i5m/AXn+x5suTwm3YI6aebvcl+S6bBoE5wv9GbCuv6UcxiZLW1DUX42KxSEIbhrT1xz/a51P2BOqSAEFViyl67hb7oM+PU+rbnhXqQs6KiQMLjzYiYrH+eI8XbJPivOOnrGZtYilv6wKRuCXIpQ9nxT3Ccb+LaDqPRBJTvsYMMEoMRxWxcJxPrNF4XPpNicZSEE4Hw9sz/bTSYy0DuDnznIw0mbiMyBu7eQC54lJ2SSHA8Olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRZG/bOAwSWkG31/K1DHKkMuwrdImswtfVquSoxYKLY=;
 b=vnJtf2nc58xt4khFjrqvkkG1C9CW0nxKNDn9HzwscM3rbMVvSpW22mtr0bAF88O4UIyGNKEPNQLfc7qNDrJ68I91oP7XZdCPnAayoHfROQMUH9PZycNcNDnm+CeULMEzZ0LvyrYd3MnGRYwdvB3CrGgyRNZW/VslDNh6/tmqb+c=
Received: from BN9PR03CA0162.namprd03.prod.outlook.com (2603:10b6:408:f4::17)
 by SA1PR10MB6616.namprd10.prod.outlook.com (2603:10b6:806:2b6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 18:54:55 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::9d) by BN9PR03CA0162.outlook.office365.com
 (2603:10b6:408:f4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 18:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 18:54:54 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 12:54:53 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 12:54:53 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 12:54:53 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61QIsrLq2583023;
	Thu, 26 Feb 2026 12:54:53 -0600
Received: from localhost (meghana-pc.dhcp.ti.com [10.24.69.13] (may be forged))
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 61QIsqBN025537;
	Thu, 26 Feb 2026 12:54:52 -0600
From: Meghana Malladi <m-malladi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, <andrew@lunn.ch>,
	<hkallweit1@gmail.com>, Meghana Malladi <m-malladi@ti.com>
Subject: [RESEND PATCH] arm64: defconfig: Enable DP83TG720 PHY driver
Date: Fri, 27 Feb 2026 00:24:48 +0530
Message-ID: <20260226185448.2167189-1-m-malladi@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|SA1PR10MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d328090-a987-4a44-811e-08de75688765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026|12100799066;
X-Microsoft-Antispam-Message-Info: LR09SzJvtDesR+zgVgX29TOZnnXJ3BuU7f3Sy1XR3W5yTaidhcfODFsIRJWbhsthQX/aJGiKLemAv4elZEJD4d30rKn32qPD4PBw1QY3O6Xgac0gndkHDBqwQc6LIk9H0XcT20b1FGge6wZb9a197MKXL5c206N3zTXGzKuxl8yMmAi926lgY5YtJSiJMWuuKVHDs8dAcuspIXdZ2bIGZfKQ4wB9oIPky/Ez8MYPcIQty/pzkO3f+hqgI14I1F9+WRyBuSAtxE0ddGQcN9VLq4/Lu4lvHNTcXy7DiNjILZIbRTKjct6GH4oDXdLTU0ge0t+LMLR1mbkOFvjg5IGyZWoWZ8s+F1/lEG9lB7pcYDRkJ1RDftQeyP1xNNztP0U2R3A/irpgSVLsip2vJKplEkTMRf2HbFC677N2MvImuId67MuegOifkYNGG09oiKqzeGeooYq+EcfGjrkRQ8K9A7SFVEMzEGP5dTJDlYvDNb6evenPO+VaOB6pwPaMWj9IeF0ufMVbxp5JW3tCPdncVvd2VRFnenwG4Y+jQYH5HdXz9eHuHwJfF/1Ps7U6q87PDL0FRDln25eKt6sIOFe04KNh4OS66prg969qC1EzDEvwg0UUqG7uOA0/0HwgTXyaiLywzqWoFwa4m0/+H3eBoKiI53YQgKTokLz+dsCVfElYCVk8jWy1y6pP2yM8r6LJPObm+q7MiGJIyLZ+TSFLSPa/Rv9P6ZpkyjCPSDeeFwM6a92hZoLHQ/1ea6wtHtHmuyhG2tq7ULnoMIXqvL9ocyMhqETl+rxqBrVX+6d1YgVyZm0YwLOJNrLZ2+j+/JMLYdGkDQDfLPEKr2Ph0zoh7Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N0TxiqEUn9U78UAqYUz0xF1rtSLTSAwbD5VnP6wcdOIelgNk2rdAipmMb+tk/cetzLHYureI5zo4Zir/Wbd0EPfArnAhVt2RdnIfgyBaP5sJ9umh5QreQiHtTR4cr0GIexnGFfY+1W3x2SR1wz3xvHPaWqNcA0POr7exLqkCWbBShlcEG7jsEQlXdEPcKqM9RwedxrviDW5da2QU08tWfGufY5zwUQu6W6JAjw1mQSnKMCSe6b109cJBXjnzzzEOrslw5Z/iGqy66Q2hp6WOuZC9BLn3hse8+pU7/TNIVBqNWp2F3eVdduDjBuj1j4PAnNnXfoUm3N+XFkkdaZVa+8HMXyV4fWkjzhSYflcrHwGY/xTG3z1GG9qv1dgTfq2hAUXgHbYaM+DuiUIb4o0+NFHvNQiyPr4NoNE5KQ1K58JyL5geia93/0geOYuZXu2u
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:54:54.0691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d328090-a987-4a44-811e-08de75688765
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_105500_049750_A578E0DB 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

Enable DP83TG720 PHY driver as a module to support TI's DP83TG720
1000BASE-T1 Automotive Ethernet PHY. This is required for the
DP83TG720-IND-SPE-EVM daughter card used with AM642 EVM ICSSG0
interface.

Signed-off-by: Meghana Malladi <m-malladi@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..3b88df2ca5e1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_REALTEK_PHY=y
 CONFIG_ROCKCHIP_PHY=y
 CONFIG_DP83867_PHY=y
 CONFIG_DP83869_PHY=m
+CONFIG_DP83TG720_PHY=m
 CONFIG_DP83TD510_PHY=y
 CONFIG_VITESSE_PHY=y
 CONFIG_XILINX_GMII2RGMII=m

base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2
prerequisite-patch-id: d9e4c1f3ec36250ae7ce49b720614eef25f9ffd3
-- 
2.43.0


