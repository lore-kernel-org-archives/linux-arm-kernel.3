Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C43D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rekg7aWRuoE3k1ZWI3eyAjCyYsaTOADrYMOBZLI5J2k=; b=k5ax7WNXveacXtkp60JpvU3JL5
	fFhRmGymXG54V97UUO2uFae06l6Dlp3eE8k0P+qqHS7faVnGRT1LauIEfemlDCo968rn0cj8JCLBl
	K0K4ZvHYVBV6nlOOPM8U15NN+4DsiUq886O0vVBFL7BNVZb60C0Af5yBaIXxfZqdfDMEvmZbTvl1r
	IvW93TKJLC8/Wq3z3g2LRaV9mXPh5s3Bui7Gfhi3k3ASpjPVladrVGNk9LgMRIdZST//lHm3+MoHX
	tpZD4wcAI/UfSmfVe9O+yRSB0Jwvwotk9wPYmwKYG6It6IqS70xje33A8lwIPVcW7PNaCfgCKAIZ/
	/FJde5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6Q-0000000GYRR-12Vs;
	Thu, 27 Nov 2025 12:28:02 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6G-0000000GYOR-3K5T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUdCxkCDR6oDQ+LubuJliX2I+DSJfLoXJWnc2HVEvdrdJk5d9dTLrQEWcYsrrfRkJVTKkrGI/hMDOTN8/CCi8HvaKz2H7ygfFEIppZeAqML7JOQ4b9W2BGT9KsKui4PrQA0LA4zWHw9ls3U61adcnZM28YbOJoS3tL90JfKNPXJ0sYjE+LKWu3+O+8yNugXzACeyy9PWLkogA4v5OjvBLcut44KpgeTHQghEP0qsJFc/dQEfaaq/y3Y34XpkMoWAUr3a4EQZ9ZhpQC5jsvqXWy8G5wtFve5WBmqcZSDV3RyO4QebwDmbrGftkI96TaCflUy/EqXMk4Ce1ght6dGTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rekg7aWRuoE3k1ZWI3eyAjCyYsaTOADrYMOBZLI5J2k=;
 b=dJPqjnNYdWtaw2yBbskRTtgbG7OMyNmJooLxUjvDundb//R+q4m4vclyBg8YvFeaBQheRtakr/MU4SitMgjMNUE7H59GccdBdp/SACRZTX6qfV9YLrK6yPIL9vIccpkbRUOwno4E6B/LpCx4DqFY3tV/450L+SE9rW9MfF09b/6Ai0FuflKN/RYQVeDApmcOlxInTbHpSu/MOhIYZGu0VcUB2cIIcenoCpIBytJDTNqdkF9juR/oOrCmnd/tc8jQ1ZSC87opbdyHd9/uLGP6B6HuVgfuDVKp7i1jXGt7gsDSG8+Wy+qdnI4lL7WgqPRIA7rlP7XT84CU9Gp/W5ZgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rekg7aWRuoE3k1ZWI3eyAjCyYsaTOADrYMOBZLI5J2k=;
 b=YH7cbQmtlQvt4p+UnViS+v3aV+RgDhVybkUUFQDgjJRAs4myr9Nx1xED8kRAesEIvJokEKvTfS5n9cDurDR8+MngwuYDFCLztLZa6WqvrJ1mAVlSggkMe+ibDX1R7YXY537+52PC3Vb8+hldiCAZDQZhghP4JcESTZcWDInqZrMHK9GMbqPUumRwFyMgQWg9zmG7EBZF5Qmi+Evl3ZuUcRIxMXFkzbSE+t99b6VcJZ+HcIO6h7zkk4kiUOx/abz6QDsXohqLFVLdgwh8W3Xikfv/Z3vPqA8nMqWlPyH7XlPrJqsv9/0AdpLwzRNaabLGgDe37RP/x6ZNAF/Qzop7UA==
Received: from AS4P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::19)
 by PA1P195MB2537.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:464::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 12:27:45 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::18) by AS4P250CA0029.outlook.office365.com
 (2603:10a6:20b:5e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 12:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 12:27:45 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 27 Nov
 2025 13:27:43 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ggiordano@phytec.com>,
	<d.schultz@phytec.de>, <rogerq@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix schema warnings
Date: Thu, 27 Nov 2025 13:27:32 +0100
Message-ID: <20251127122733.2523367-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127122733.2523367-1-w.egorov@phytec.de>
References: <20251127122733.2523367-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|PA1P195MB2537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d9ed773-872b-420a-35a1-08de2db05e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XXwhTXsUquTgO6gQUNs0wJbutz9G+vFSviWmkAjkyIcgvdnOzSdbeIC4IM+X?=
 =?us-ascii?Q?jGSZpMOHq88u5IvZhMpNU9//lcGLJXB4w+Tyx2Vv1sQGlEXv6EbzJOMHZAj3?=
 =?us-ascii?Q?AyTczwk526ycnGWewY+EXwRIanC9nTmT2UxC1QnDs38WBnwETmU6oXNlRmNy?=
 =?us-ascii?Q?4ETVzaeKtiiK/UB2jVi0k1t5+acJM/SoEL7xoV9QWrITC2z8Ammvogrdyfsp?=
 =?us-ascii?Q?dZu4ongIKSc4PBrJA5tWYgxE0D42eu+HAmxKScS8RBcXKMvku0a8LpJZ3gBm?=
 =?us-ascii?Q?96oGs59tfmu+/6yKEliA0zTBQ4+mXgSlYXANpMYV3lNssxmt1wgqEAq3GkCv?=
 =?us-ascii?Q?CdS3vm3tYmGqW4oeWfuQHLh9DHTqtPEsJ2qOmMRiUfyz9Iwr6MDiTiUwU7vr?=
 =?us-ascii?Q?Grkhgyjtz9aF+UmOxUIlvJqTQNADQyk+W3RkplybgxF4r6Y1IvyzvyQxFdFp?=
 =?us-ascii?Q?gu1wgBn4vRZdt4hVX4VaQF3LmNyIQckt0uPCCeqGH1X204YB/XnCw9HguCer?=
 =?us-ascii?Q?GUtXTPOnqW8p/FAZ3SdByIWYNvz5UiNuAoHb/pVvq82pwjf6V0Y7mHuPRbLr?=
 =?us-ascii?Q?5uJw1p5Sp4KTwTu6N0VkpOSRXJ59PoSI5tDWbkuoHmfuUrBYLTjAoaW/9bm2?=
 =?us-ascii?Q?xyhH5JClO5G81FPAomyi/MiKh8ms0a8AW6sWwsZaNJG+Ol3Qsdxhz5Fm23CO?=
 =?us-ascii?Q?TBSsFUWD4nAPhvu04FXZpobqAh7PqPByWkNPtx+7RK8zLgw2Amtvr2lBHVl/?=
 =?us-ascii?Q?+7d5h3UyoZJt6ogX43UrLdiGXEGam4Ufovt++iJtDOInwBYHXWlLvEe+eA3n?=
 =?us-ascii?Q?Npq82XXuiY3Is3eTn0fkCfiMEJUDychjVZiK6yIZ4tFt5IzljxHY24RtVZVM?=
 =?us-ascii?Q?h/V6Ku2ewnYaIrPAmHLZQBnxN4xDVbWnS2sZJOLH9S8mnx4GHzbcaEJszahw?=
 =?us-ascii?Q?DDFS19uxA+3LFHhd+jaTCQwUA5fBZrD5PN1p/v1BEO8+1DxGHQVPlanrQSjK?=
 =?us-ascii?Q?ChlLu7zJ1RA1iC2BeKv5jeidIWUD5BsBLzlmR1sefZEgQHenVze1PnPHTaLt?=
 =?us-ascii?Q?HLQe5UeMUWIlSwsJAolA2fe1qPwzXPwpBjGp4TptD4mrvZYYl8vo3JCsAJ7X?=
 =?us-ascii?Q?vJstmvFZQjl+C/tsC5G/gGHq4Yj0782B6QZcNVOdLXI7TmKRZ8sApsLA3ZZr?=
 =?us-ascii?Q?X324vWBaiq57Um829Lt8HUZh4CE/AY/7bWNP3ILI1+K18pDxlxX2rLb3DoMn?=
 =?us-ascii?Q?WzT2/nDY2vD5TNkxHt+vaFDgq9qKReUP0nXcsnZnv5iNt4A+azB28I95ZqVP?=
 =?us-ascii?Q?4uOPVKyZnEsnvsV4hKh+x1sbXcoX2jophllVPAfisfgvHE6M9Bhr2oWGzWUa?=
 =?us-ascii?Q?hWhUPgdKZ/9qoXatS3NWCCjtMJdp/4MbAshBCkBMiZiqV6rSS+GyBG5ergty?=
 =?us-ascii?Q?lxspFWfTCQ4pCcbmoMZzNMlR1001PJ2PIKEcaWGhJ/+8Pw4PlyE8+Kk+ae80?=
 =?us-ascii?Q?j9jXHj/0FMPVcGBazcnlvkH5E5AMYd7asFEh0W5zWgnb3gJfumyrjeVDL2bk?=
 =?us-ascii?Q?cgtJIGSULGeFKLDkDUE=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:27:45.0988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d9ed773-872b-420a-35a1-08de2db05e38
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042752_837521_6AFD58BC 
X-CRM114-Status: UNSURE (   9.23  )
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

Rename pinctrl nodes to comply with naming conventions required by
pinctrl-single schema. Also, replace invalid integer assignment in
SPI node with a boolean to align with omap-spi schema.

Fixes: 638ab30ce4c6 ("arm64: dts: ti: am64-phyboard-electra: Add DT overlay for X27 connector")
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: Add Fixes tag
---
 .../k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
index 996c42ec4253..bea8efa3e909 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-x27-gpio1-spi1-uart3.dtso
@@ -20,13 +20,13 @@ aliases {
 };
 
 &main_pmx0 {
-	main_gpio1_exp_header_gpio_pins_default: main-gpio1-exp-header-gpio-pins-default {
+	main_gpio1_exp_header_gpio_pins_default: main-gpio1-exp-header-gpio-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0220, PIN_INPUT, 7)	/* (D14) SPI1_CS1.GPIO1_48 */
 		>;
 	};
 
-	main_spi1_pins_default: main-spi1-pins-default {
+	main_spi1_pins_default: main-spi1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0224, PIN_INPUT, 0)	/* (C14) SPI1_CLK */
 			AM64X_IOPAD(0x021C, PIN_OUTPUT, 0)	/* (B14) SPI1_CS0 */
@@ -35,7 +35,7 @@ AM64X_IOPAD(0x022C, PIN_INPUT, 0)	/* (A15) SPI1_D1 */
 		>;
 	};
 
-	main_uart3_pins_default: main-uart3-pins-default {
+	main_uart3_pins_default: main-uart3-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0048, PIN_INPUT, 2)       /* (U20) GPMC0_AD3.UART3_RXD */
 			AM64X_IOPAD(0x004c, PIN_OUTPUT, 2)      /* (U18) GPMC0_AD4.UART3_TXD */
@@ -52,7 +52,7 @@ &main_gpio1 {
 &main_spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_spi1_pins_default>;
-	ti,pindir-d0-out-d1-in = <1>;
+	ti,pindir-d0-out-d1-in;
 	status = "okay";
 };
 
-- 
2.48.1


