Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF2AD10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdSKxknrKFNJTzfKtYqid2Pa7BipQkO27cYmalqeDQ8=; b=gWmJRPh9e1Do+3y4Sk4J32BgvV
	/9UW/i++V7JVQqM/m3j4TK2Vuq1jSZ5zxl2oacuWcoHc2Y25IfqSMTDgyFye+tzwvtxq+TwvcIbev
	D3BXELB5sARCMWdHFG7cd1ox1YLW1hrwp/UeXibufwC5rc0g3bmch4h5vMMz8K/kO3DPAtk7dCgFg
	ZQLbiL/8ylGccYhRQqIu5V5Q6RQJ1SRL1/5lEJz8MieomkUJaZpaUJYACFKcxTQGgI7lzCgaBPgc9
	zMcJnZZ8Gqg3HTjqhy3IpX2DsNikYwJDMvv7k2MRUMHb1JiLYTzppim2SmbNaFb13BfSi0zUYYifM
	/RXj1fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB90-0000000EdTi-0LaJ;
	Wed, 26 Nov 2025 08:44:58 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8s-0000000EdQe-2CpO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:44:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvZ7RFZXphmsciGvo3p02bszY4hfhW21AwSk+15CXh9f80L3e+8kCb4Fc6Pko4WF01SzSEw3gEPTuQ3RH3fDI3mncQ8AuB06+cy43xU1nEgqeq7faQgyNO0JO9qNGMeH2kSaSRk4Vit/9tH9ONY1qBRFNU8H7vy5CzB7ZCxviGysc0NgRz87dauIYk+WnP9izendolHIDe0cXs07w4xCDhxDE0X3rd0xD0Qh3OmKo1PVK8vRIqgsGjhaFTK/lqoq1o0BvZxL6v2xHtC6T+FWzvK6YwI4vnWb3De/PDqcuwdjlcZoAwvAcrIt3vN4MZ05kNslI7DfPzU5YfqgRWXvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdSKxknrKFNJTzfKtYqid2Pa7BipQkO27cYmalqeDQ8=;
 b=pjjF+ghFgeu+rXjt4JU/g8UHFam9wSvXq8uym34tUnQr4vFXne+OqdCnyYhElB3rZ8SHVnNr9xmYs6I9yDu37K4CRG7196N90/QdUm4sBeiBY5nFRGNH+bk/1ueKK4YIJPRrNCuLSC6HJZeXG6Gou71I6FAvRvWhq+TpaKD71nD//1RJ0ZPxIBiCDWkObcep+46htLNotn3otL5R/9LNh+nqP+IB97g2npa6AD+F40j17yB3MEXhs7XJcFoamf0YS4l14YzS1khR6v7omM6ZQMooEAk8K6y2irhHgN4l3+xO0H66wVlaaPbawXBppO3+ZcqNY1HgXdvaPNmLBaJbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LdSKxknrKFNJTzfKtYqid2Pa7BipQkO27cYmalqeDQ8=;
 b=dSrL8PBUD/ZrBK9Jeclg0Bs2tZK4JUSmC1c73Vlvw6jiwiAlxhmHdpcsrQUZexilAqj8JZG/zDMhGYW9kfjZKm+iVV8lbIhe34nb7HcS7THF/CScbcJ0MQkGQQhamJ8+o4nNjhm6CO2BmiFcsRzvq3+z0Jt05OmRmT2TsYb8qJbr5cnwFuVwwu0GQHE5H6zOZES0tTGbPgpxT6N8HSyFXB57hykTUATkhd3+tQTz9EEMOru+mCkb3ZvokvR7R/zOPp8zN1WcUmOKyuHkOI7CGD6X+KtqLhaqikPH/mgiKCi3GIOy/5vdYUoGosW52hmLIu4g3RzfBCbAzjWt9xGOag==
Received: from CWLP123CA0209.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::6)
 by DU2P195MB2464.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:49a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:44:36 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::cf) by CWLP123CA0209.outlook.office365.com
 (2603:10a6:400:19d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 08:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 08:44:36 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 26 Nov
 2025 09:44:34 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 2/3] arm64: dts: ti: k3-am642-phyboard-electra-x27-gpio1-spi1-uart3: Fix schema warnings
Date: Wed, 26 Nov 2025 09:44:02 +0100
Message-ID: <20251126084403.24146-2-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126084403.24146-1-w.egorov@phytec.de>
References: <20251126084403.24146-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|DU2P195MB2464:EE_
X-MS-Office365-Filtering-Correlation-Id: c371d4f1-5f2c-462f-512f-08de2cc8076e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?liJa+iDBm5nS6TvkDLlGporcZrZVh/csU7GkvBv61hZLUV6dqSPzdlUBYcpI?=
 =?us-ascii?Q?t+eG0x5eH36cerF/4Y2YcCQtFBd6Le0e6+PGW9YOd+DaRvD5B6Thq15MJd/C?=
 =?us-ascii?Q?l4SM2X3g29hA7DMRWLMbMy+ybTZHiYnPUN8RYKEB+R74OHmDFR7wSV1kzmyS?=
 =?us-ascii?Q?V2if0/GXf1acJdLR9pbdIvJg5PQJD7n9LPSymL0a/ftzRiTnYazBuvJjfsOW?=
 =?us-ascii?Q?qwuEIW9v1Gj92u6zpZRnoZvfYoAOB9fBK1GIRYp7iUsh3OefGLsdWmYQuppv?=
 =?us-ascii?Q?Cpj4QVTL0SzT3HoI71V+gI0fvT2inn8h5bqhCJTCzYc/dLUJujxS8Inse/ZI?=
 =?us-ascii?Q?CuPaNeNczgdfyQ+ZrXiwobN7IsI0nd8BVVUDUFmcO/mIgwv/NgI62yK1wvMR?=
 =?us-ascii?Q?a9p6neWiE4AgcOEZn/3fr9O9Qta5+U18NvcprQe+sY9gtRAHCvYwFI+06EN0?=
 =?us-ascii?Q?Ly4wCVH6FJWWEpejJs6zULLU4Tm04jl7Y3jzrhdPaoQKO0IMAFfZOQDVVlfk?=
 =?us-ascii?Q?zwi0iLwHorzc/VJaw8xVHRP2W/vaqiKqb9+/KpbEyEGBtDums/yr8aZqNTA9?=
 =?us-ascii?Q?UpPbPDy5PmvWS4lfVk/N9dIJcneq8cmljT5mICN+oUMY/nXDINk5stAQvVrm?=
 =?us-ascii?Q?1Bcd9Rq4HnhdtvdkzokxJQJkplKHpIZkid7Kq3e5RZyRcNxBS0zdLliUpZPo?=
 =?us-ascii?Q?1mwYIgB9V9+TwK22UqsS3MSqLabSqSOVqXtKWh980StESLAZeve/ccVABTrr?=
 =?us-ascii?Q?EV9RXtm57Kz9ueMtAnGaOHtjDXIDFgBwmcOkzoTDvp2MFMX1VPXab9xtqmWL?=
 =?us-ascii?Q?WvAzzRWzPIReXUNByahy0W8SqgvwpeiRi6/PWKqkeunXZ8TPUhrFl/Du3dh8?=
 =?us-ascii?Q?LNTu6fOBxIYg6sLUyWWbfh2o2IBzfn7ZsAz+cB3b0N1/naHxLDgJQOA0ZjpM?=
 =?us-ascii?Q?VnuFKuSB1r3yvy0+Qffw72BhK8c3lDBkK6MXWyiTdSbK7NvHHDo4EYvYPbCh?=
 =?us-ascii?Q?7klMm8appJqp0xXoB43qyyZI4lERRtYZKRZZGvvT7P/gVgMcRcOh0gnsDa1a?=
 =?us-ascii?Q?aD3Ch1IKdiGgGWUABDJWw8i0p6A+Fvhir6xnjbifbH0g4GmLfOdEzTR3bJiF?=
 =?us-ascii?Q?OjCQnAq3Hb2zVBN18bFnHceROKfMKnd5JRloknoVB/ZGkhgfeoS+l7/IpH9l?=
 =?us-ascii?Q?Dcg4uxJVBhB7ZGvr3TBpNqv4FRCiKPwMWdm0ZHbVZ6Rsdd1yZ0ijs2s7gpa6?=
 =?us-ascii?Q?Bv4zkVrOYRNwZ4ir6XzQ32fYaSgWggou8Cykq+/ouoBsNIyeiRm1RX8Tb/8K?=
 =?us-ascii?Q?WzgroYlYlK+uOPh2N0Qu8QygGCLXN8M3Thtqx/zvURWhUXFHQVueRmzWsHzB?=
 =?us-ascii?Q?fSdGvceMGQOd/0XCLfyop7SneP+ue3EANWYOxiSn55/0z9OUzvIhffleeXiH?=
 =?us-ascii?Q?ZGc20yx7Oyz/va9N1TgX7AbnE68GGc+PqiA/gvP6xiUUujHMND0u9chsrYHd?=
 =?us-ascii?Q?/ZXcJgHBTxXKKN90KG+/4jM5fPsnypyT+O4YmPSww2/Pbxjdiejzn42Gjlxx?=
 =?us-ascii?Q?SVUUwTgiJ3gcNWOyEio=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:44:36.2553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c371d4f1-5f2c-462f-512f-08de2cc8076e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P195MB2464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004450_572970_1C5440FE 
X-CRM114-Status: UNSURE (   9.82  )
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

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
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


