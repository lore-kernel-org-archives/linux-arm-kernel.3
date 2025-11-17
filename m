Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED68CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awz8JyVgwCWWIHu3ZS5zJIjBoq5ipV22WVrbdn9LsCE=; b=aa0TNn0iMb6dReOzJNz7NFbfn+
	6CCbD8HGuyB/lxuxjCPmH7DfQoRDflQq/QByFFFYH1rz9FfoiuwdWCYpDDjrsMR03UDu/GlJUe5bp
	hob3oTp9ad7lE4ppLR9wUYMHFh6dRg0uTVIR3kRq/pd+KSdPdf6fwJBCknVVUS4/JfSCrQKBqj0GL
	ZduOOCCGCayWE9l6m/D7pVdPcZNB82t23eBJoI5hgfsSQbxwfCX8d8PWQn86RI3dZ7G+t9AaKnyr3
	+27j3+lI2loG3yCAVy73RggWHyZ7VQRJtPmOFYWMY1eVxE/FPJ48FGRRnE+6pBgYSuViGZ0HGeMGP
	RoDQT7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKybx-0000000G7Cg-0ef0;
	Mon, 17 Nov 2025 12:45:37 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKybu-0000000G7AZ-0T0r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFXROJKm20WxNrpJzTHC5v5r1XAxf9LyHDy+a4qTArLcOwZnaYKHzK42vw3cYCDk6M8HnYlOKzur/LxN1lWy7F2QwfGdVOzw7kEOag6xeo4SXUtqbxtpoYthE2oB4aPqYdAd0oJOk7YFLOykI9KAGwO4YBj5rU2WHb87N6e7H/+8inT+hQH6puiHG8WQg5I3h5O9hsKFi8o8bE70z4AUCQ7Y55B5MIzQn7Zm7UK58IKrOj7liJmPJoo3iER/OOBKErOI6zXB2opO1iJZkK55ZEt0WEE/dSGlMu9tnoYIAdtmSz8x1mqT/92t0J/K3YpsskAhXpCZu1wN6NNU6VU0kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awz8JyVgwCWWIHu3ZS5zJIjBoq5ipV22WVrbdn9LsCE=;
 b=KP3/mTWHhgBp0xLiIvQWXbL5czD7mS4aEBQqfvPNBpYQTjAOCGw/V1WkY+PAygyv7GmGBoO0nUO0ZZrZS2FD19Ucva2CP5RgWD0iNvckkQjB2xveSdIwaNYWUZFniNHAUgYUBWsFVho/Zefr6R6mq3296cABeDinZLAwcRPvCBde0cjPtmWFvjTwJYUJ17eKPGKndPhCQvp+QbHjSidZgtiH0bNrZ1XFxiS9WffaqqpPuqTDhDF4xXjFaM9x579j8VJtJYiwCIPghaGF8q+luHypJ3ugXPKOF58hSnzsuTLoRky0op90cBxPz9uCU5wBoRdWYIrZBW96u01y0Thbgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awz8JyVgwCWWIHu3ZS5zJIjBoq5ipV22WVrbdn9LsCE=;
 b=IGik4pMbAZZmklDhPdSbcPVy8qEYzm0XwPEv+LwCvCHN/yHqEdYG35mD4YB80dXukAZN2McDbyjMJcW69g/hLQzi0ShzULNaKgHW9ZqaQpyi35/dyumtVkmoRDv9sL2gBZuJ1F6Kv26L8bRaaYhOGQ6qnkiNDOCiucMRp/IlM4rr9XkyTRJCLq+F1uB7eXx1+A+dMllmvDY6QZWyihAj9XHnsGRBiwwg+CHk0t2eBVQEcqYHNOeVIIihbeEFkSVFmCBcoSYKPiCRJisO99tyRcMtdnIJbOBR46ZALelU7VWu0il7BnFnAS+gyhxnacx8wVXZpcBqO3A52siKnxGOsQ==
Received: from DU6P191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::19)
 by GV1P195MB1763.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:5a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 12:45:27 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::5) by DU6P191CA0063.outlook.office365.com
 (2603:10a6:10:53e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 12:45:26 +0000
Received: from llp-varakala.phytec.de (172.25.39.183) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 17 Nov
 2025 13:45:26 +0100
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <peng.fan@nxp.com>, <y.varakala@phytec.de>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp libra: add and update display overlays
Date: Mon, 17 Nov 2025 13:45:14 +0100
Message-ID: <20251117124515.26675-2-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117124515.26675-1-y.varakala@phytec.de>
References: <20251117124515.26675-1-y.varakala@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.183]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|GV1P195MB1763:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fd7337-e976-4d7d-24a5-08de25d72f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wNxny4HY3vV6EhA2PFaQ23MVCQPGPx/k8fD9CeEEagGQEF4P8v+8uYZshupT?=
 =?us-ascii?Q?HDoXIMVOkG7P8BlYBXcrd/vyaijMxRYJSt//SqZ7tRs2qFS+YAfphNADKuPd?=
 =?us-ascii?Q?zoKof+6a0crPRtEdoybQ8m+xtTRbVmJZeoXE7bJx0vsXiGh/NIzeLAnvv0Rt?=
 =?us-ascii?Q?6p5UUfCt/mTCAlSP1R//sczMsov5HLYbeRwaRzNrAOUDNM5ID06LlBxtUN4C?=
 =?us-ascii?Q?Mx2YUK9UuLARolTOlch3v+cjs7hKTnImxEXOHODHn0FXCyvHcKRjLNL4fbH0?=
 =?us-ascii?Q?gqkQ9+Yu2C6qJfy4VHKPohi4kQORPAhf0GMJmvSlnnTqR/Cyu47PM06RpDnL?=
 =?us-ascii?Q?/wMyIXcKJX9ePA0SKLxKQXRtkgofMfn3M80uG7o+aB+cX2D3x714mSqe5IYH?=
 =?us-ascii?Q?S2LPpXmDv1gOldABReYkjjB2eBTfTzepeJHXKm/n1hHbfiT7VA+Fb068KUqX?=
 =?us-ascii?Q?KVRC4apr0gy/6J08xf5vGxXeSEN5KTdogoG27XzB6ETvY4b2LhGByBqS3wuE?=
 =?us-ascii?Q?3pmXItCjUsUHJkNItW/yrqXCpIjX87/uH6llWzGOC6PIrY7v2omo6nkbSz5I?=
 =?us-ascii?Q?ZU1twTzvhh/yucgw8E4ipOQLoz9VVWmk2jaSpihuJRfnHnNVuC1qKE9pKWPe?=
 =?us-ascii?Q?LZYaPzOxQxHv3vbtVtdXXYOD/XTTjzNC7dbvISjIl6LsDXNvSM5FeLIHKcyR?=
 =?us-ascii?Q?JtcMKLJlCIOv5LWIaK+gORFZYRLPc3IV2MW1cxbUJogb5NacyP9fbiyE4OtL?=
 =?us-ascii?Q?wEe4+IXV75VN9lHz6aHvWmdiWPQkJ4/E+ND4Py4k83N7K+0AHAlwm97F5Hg4?=
 =?us-ascii?Q?91ox0tHokT3qYwXxQCSEIvDaR2Wv/Bs4NMG832ITHcD4870hcAWIBNA+p6OY?=
 =?us-ascii?Q?TChfaROWALX10uPYLn10fT/VshM3pT/eqk9Qc3TWBOnWxDlfv6enCKvVq84i?=
 =?us-ascii?Q?9hW1ydSe7jxQCgDQh88I0q4I6Eifw0gnEw7GO4meJH9QC6tqSV/uR/JCtDn0?=
 =?us-ascii?Q?pYIcbV1W4rCW1kpGxe70VuRwrw0n30SwyzT1m27G7sLaoehmTgBNLbm8URyk?=
 =?us-ascii?Q?9mNeDg8HXXNS1hJ0zWfD6maCAGsDdRS4gFKuIGosiyTt3i1896ELrYEqjfTw?=
 =?us-ascii?Q?9k9WW/+q9WDgDCD0UCScFRPZKEtw+Gmpji5+g9WprxqwaJx5VJKc6LwVW3m3?=
 =?us-ascii?Q?a1wA3N1jEyvFxLI8AZTTRJWcLOm8zKhrFw3Et6DsASDVauw5QuXZ5Qduc3NE?=
 =?us-ascii?Q?vus6wWUf8lHbsqMpVqwjk2a/Di81Gxyms83sxHKHbikj6TLG5BjPSU2oBb5y?=
 =?us-ascii?Q?+RLxb5KA7uEfbqWCCc62wmX87+t98hOMGalBGGjsp/HEOjfrQU9Kw4VIyNqY?=
 =?us-ascii?Q?dBvKzkrQFYMf+LoSKe313vW5O3OOek11Owgrf8wigMMgSdCUFe6zAwDB617j?=
 =?us-ascii?Q?gOGNif+B70qHv2PL1AsfPOOtgdIPd7UlZG+9HGKDZgqu13eUuf8uCyfd3NNz?=
 =?us-ascii?Q?iZnzjsngAfbStA3KdqX0cQ3s3H998jubXHCAdUkPVRWf9540B9o+h4kUHA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:45:26.9907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fd7337-e976-4d7d-24a5-08de25d72f0b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_044534_149772_F19D80C6 
X-CRM114-Status: GOOD (  15.15  )
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

Add imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso
devicetree display overlay for the i.MX8MP Libra RDK platform.
The overlay enable LVDS display configuration.

To keep the consistent style of panel and backlight nodes and labels.
They are updated in imx8mp-libra base board devicetree and
etml1010g3dra display overlay.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile        |  8 +++-
 ...8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso |  2 +-
 ...ibra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso | 44 +++++++++++++++++++
 .../dts/freescale/imx8mp-libra-rdk-fpsc.dts   |  4 +-
 4 files changed, 53 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d..eb38dcc76b84 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -219,8 +219,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc.dtb
-imx8mp-libra-rdk-fpsc-lvds-dtbs += imx8mp-libra-rdk-fpsc.dtb imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds.dtb
+imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra-dtbs += imx8mp-libra-rdk-fpsc.dtb \
+	imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
+imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01-dtbs += imx8mp-libra-rdk-fpsc.dtb \
+	imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
index 1dcf249ca90d..02889d691c01 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
@@ -34,7 +34,7 @@ &lvds_bridge {
 	status = "okay";
 };
 
-&panel0_lvds {
+&panel_lvds0 {
 	compatible = "edt,etml1010g3dra";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso
new file mode 100644
index 000000000000..418c8536e791
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+/dts-v1/;
+/plugin/;
+
+&backlight_lvds0 {
+	brightness-levels = <0 8 16 32 64 128 255>;
+	default-brightness-level = <8>;
+	enable-gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
+	num-interpolated-steps = <2>;
+	pwms = <&pwm1 0 66667 0>;
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>, <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/*
+	 * The LVDS panel uses 66.5 MHz pixel clock, set IMX8MP_VIDEO_PLL1 to
+	 * 66.5 * 7 = 465.5 MHz so the LDB serializer and LCDIFv3 scanout
+	 * engine can reach accurate pixel clock of exactly 66.5 MHz.
+	 */
+	assigned-clock-rates = <0>, <465500000>;
+	status = "okay";
+};
+
+&panel_lvds0 {
+	compatible = "powertip,ph128800t006-zhc01";
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
index 7a20284b0a29..4ffc950711d8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
@@ -15,7 +15,7 @@ / {
 		     "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
 	model = "PHYTEC i.MX8MP Libra RDK FPSC";
 
-	backlight_lvds0: backlight0 {
+	backlight_lvds0: backlight-lvds0 {
 		compatible = "pwm-backlight";
 		pinctrl-0 = <&pinctrl_lvds0>;
 		pinctrl-names = "default";
@@ -27,7 +27,7 @@ chosen {
 		stdout-path = &uart4;
 	};
 
-	panel0_lvds: panel-lvds {
+	panel_lvds0: panel-lvds0 {
 		/* compatible panel in overlay */
 		backlight = <&backlight_lvds0>;
 		power-supply = <&reg_vdd_3v3>;
-- 
2.34.1


