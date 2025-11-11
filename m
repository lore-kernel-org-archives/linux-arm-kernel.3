Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B43CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tqvStYVVLesg/ZFGiq4AVK9vNMLzixLGpWz/a5Dhn4=; b=bc/B2DsLT3qyHyXitOcfOWU8QR
	Le8610mfXHFRwXTMcXidwG61ZKo0hBov+HZxLjQP1H+jLPgKpgJRulJVsRKDaIqDHy2P8z/Dhzu0i
	yiZgP68eD9yuYYRvOsOD2KuYLpLQOQRxF7Q76npsBJfqiBv/iYvhEth1ZYd8dCSdZ0NYp2/hX9iz7
	g4HOIHT+EWWi2AzdZYoFNhoydyCyK23ABcIGklOF2AgUFvFFwWp1JaYNeVQo65egqCXJ3ltkWFVxR
	ZPQs60UaI6dCEh8CMJUY5bdeyb9PtOnM2Eun94OXK3P9fOri7Rn632UgoIMJiO3viN9DYslfQ1jD3
	BmbZYMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpSA-00000007KId-16x6;
	Tue, 11 Nov 2025 14:34:38 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIpS4-00000007KGl-1lX4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 14:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8D6UptNVPJKGRtx3qWqAYRwgK9Yin/KND+7vEkkqOTX0X8GclGLOf8VFkTzNvgOk4m09Ix/exRP3pbb2hiA+rxvzX9Ab6/tDY3ZO/dSVKlYnYh7+Dfv+F1dvZM7iOzhs/m7tESN/uymUZB7Vl2lrREqvbxNuCbzTrIespstkT7XA4dCKEf81LCREeYX8XnPmAA0loI9CDKnSt/PL8OcITS/jwlelE81hOvAeUBBzoeXACz1U1RJfHh0390xJ89ft5Z0w7vyDz/OmEaK+c9kNAitXorPTWw+vO2RnOWyzmlOxM80kdOocSLiFJPOFk5QLE0JS/gnQJyX/ZJUMMxdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tqvStYVVLesg/ZFGiq4AVK9vNMLzixLGpWz/a5Dhn4=;
 b=syn3q68U4GAWcPpo3gr3KoTqmPZEAzae93BU+JjunJ9vtA3Xj2H2qFHpZFUqSMDdLGZfEg4440rvKZYERZ2gv4ZgQRNY5W0FJcPSTiGUYM9psZpLAtKfZQzYAzsxAnjx6bjROVSBjOq/9ME7NOl4dbP2oSpkDuAM0McokzqBYhtpwLPu0unaNFEsl58HFWV4V1DC52yb+RPhP1HQIlpGjHXQgxdBpRdmEx1IxUYMbwaO1Z9G1Rwi+u4oye/Fl1l4xDFWjreowkyx3uPbGmIx1GwvuRZah6HNZrRVFccE2LKQTzPgbV4GecZiHYZLsnTtMWKumDXxQfmJptEsUcwdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tqvStYVVLesg/ZFGiq4AVK9vNMLzixLGpWz/a5Dhn4=;
 b=iJWQH9K5Ewj6N1IcYFIacjf3cVE9BzHHysFGNW9newXnN+Lty/8UIekFU3lD99wTE+kuVI/eSnu+ozTcgHQC41xC3nCj972Vnreolrilqa+A0kNRA3Kw8EEhCazPpwl3uYhbpogDdUi3w087okAvZ4xWfSa/SNCsSmBgp26YNSH8zBrDu3UXQ58Re4rSxOTkN/YhYpUKaNLjMDowlgmqYvkOG9PCzjMV6em2QvuJwuqNUa31N9SZPQKC8mObsJE6icKIpBjnQoQ8iIi/yplgzVgVHDYBQZasOArYvvqNTMV8gd47ibTVt+pNbgMagqWZQvcyT+CaMIZ3HLQhi4OjZg==
Received: from AM0PR02CA0153.eurprd02.prod.outlook.com (2603:10a6:20b:28d::20)
 by AM0P195MB0499.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:164::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 14:34:24 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::4) by AM0PR02CA0153.outlook.office365.com
 (2603:10a6:20b:28d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 14:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 14:34:24 +0000
Received: from llp-varakala.phytec.de (172.25.32.223) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 11 Nov
 2025 15:34:22 +0100
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <peng.fan@nxp.com>, <y.varakala@phytec.de>
Subject: [PATCH 2/2] arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay
Date: Tue, 11 Nov 2025 15:34:07 +0100
Message-ID: <20251111143407.24657-3-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111143407.24657-1-y.varakala@phytec.de>
References: <20251111143407.24657-1-y.varakala@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.223]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B7:EE_|AM0P195MB0499:EE_
X-MS-Office365-Filtering-Correlation-Id: d292ecc3-8c1c-4092-184d-08de212f68f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r8SXMvFWhm8Av/zBoNARsC7gx2GvP4qEueq/LDq/JK3jk1rx4p7gYNik1kTT?=
 =?us-ascii?Q?ZbOtukObeyNczK84Jvv2/fNtPLZsAcPDYCPVSGut0Bdutx98SLljyoJ8kThK?=
 =?us-ascii?Q?63hKOXvv6kvBSVS5LYySfuHpiVC0h7MWwZbCj4bJG6Y57T3SAFEx/pNuCNs6?=
 =?us-ascii?Q?reg4mmKCt2iCuggH32savLyXN0h4xyMA/Hjm3M3zXfcL3dcrGc3UuxjxoLFz?=
 =?us-ascii?Q?XLq2Lk0cyRRNvANIn5cUKjFcr5cIsaht4kww5gHE2fWZ9ax4m/iGxWL4jNjM?=
 =?us-ascii?Q?zXK8xwD49cPLtOkGjh/D0rvarg8CFVKjWpKIFpxeG1s3CJ5G1RU5S3B2NRf8?=
 =?us-ascii?Q?9c771CNLxFXbtZbiGLs4RBUQO09WKf5ePqmdXRxe5ksOX3/Zz4sZ0nPMgNEb?=
 =?us-ascii?Q?ShwXebkUs8CXXM9Hbr0S9ey3417+xIBLIPae9HP6QrxkreF1NjkkGz2fWQ6T?=
 =?us-ascii?Q?/U9aUjDX8jZVubH+rjrUCM4FQWDowVz05YiatDnNipTMNvIPtU9WeYjyNVw+?=
 =?us-ascii?Q?VRfe2DJ4ZRVrMhr3yQqathYLb01gk6nYDFent8RZSnQDqfl5fgiU0CMQd54T?=
 =?us-ascii?Q?V1MjoeXYd1OykY2aNriwTFw9dT93FdPfgLUmTvysWCF/9ec8BgWnXYBgjzdj?=
 =?us-ascii?Q?APFYmJz4ekJSLWn1r69TLv3B+928ty44YBl5siqMBdHnpnqI1vVxgyllL5y5?=
 =?us-ascii?Q?wcAn7UUmZDiM0XrcoZDGBuU3/QB9JNsNPhh86DL31FhoGikk4//NEqHbou97?=
 =?us-ascii?Q?WfCbmEvQKi3/pPeWX0CTytgGCGTWhJLGlcu60yybTL5pp9jWFPvV9taD68Cg?=
 =?us-ascii?Q?qweSw27+F79oiXEm0ncl2zxqCqzLzbvCzdbG/hdVAmnTeKOhCOSBCFvkI8tx?=
 =?us-ascii?Q?tCQ1FLSl72uH6ZCMeT8UgQp8cYDuhQtEWiaFR1k6dlBRA3xbHj4wi2On8OJI?=
 =?us-ascii?Q?fWMNZ83IjqBhnJSpzPndzWMOfCXPxiq7JRTYekTLnPB6tJoKz48WqQDWWcRg?=
 =?us-ascii?Q?KJQ2irAjIGwazmHcxf5jO+JRq9uJ7jznpNfWA1yVoQhoyetCe55IuAkhBHYW?=
 =?us-ascii?Q?dnEUKoYzg2QWwauJoY+sbx7fugSHbwNhSNRXJD5SevAp5rFnJUwwqe5pGiav?=
 =?us-ascii?Q?L2CUdLFBagNhdILT7+nGnf6QdEU4yrYAnGlGskfvee3sMfEiptIPXjl5i+gu?=
 =?us-ascii?Q?BT8iXG/gbKTTx42VPTLvZBTe7iDceonh/VupHV4gL/PQ+lz+bb54Phl1Bpzc?=
 =?us-ascii?Q?rzwjxrqjbnGUzHXuL5eZzBABONCcP3YS94cdwuGnMnb3U0Ij2UiXBZ87H3gs?=
 =?us-ascii?Q?RZ2YKAh6wJa6Hley4V9c5qc4x7VqVRVH0nHevJ/ucN7GqTM+T9U5YExiXddK?=
 =?us-ascii?Q?E3J0wEaQw34xQ9WzxJUeuijroYdaE8BVGUhocegwH46+jygwkScs5QmvaK+v?=
 =?us-ascii?Q?Ow/IrSifUoR0XmTSS2Qb1FFU0GGH2Zaw1Z9OH8Kyo1luWN1IWCqHSyAOpeDZ?=
 =?us-ascii?Q?KZ8PxYt92DBm4bbHF49hVhbto7G0hAIyE7QGiFfI1C/hom3o4jb86iTRFVLy?=
 =?us-ascii?Q?g2Zc9iP/K5pReblYMyQ=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 14:34:24.1098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d292ecc3-8c1c-4092-184d-08de212f68f9
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P195MB0499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_063432_654934_65646C05 
X-CRM114-Status: GOOD (  15.85  )
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

Add an overlay of expansion board (PEB-AV-10) that supports multimedia
interfaces, 3.5mm headphone jack, a USB-A port and LVDS, backlight
connectors can be connected to the imx8mp libra. Audio works when no
display is connected to expansion board.

A separate overlay for Powertip display, based on peb-av-10.dtsi and
intended for use with PEB-AV-10 expansion board, will be added
later as display support is not yet available.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
---
 arch/arm64/boot/dts/freescale/Makefile        |   3 +
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi | 196 ++++++++++++++++++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso |   9 +
 3 files changed, 208 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index eb38dcc76b84..0d2bd8d1d3b6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -223,8 +223,11 @@ imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra-dtbs += imx8mp-libra-rdk-fpsc.dtb \
 	imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
 imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01-dtbs += imx8mp-libra-rdk-fpsc.dtb \
 	imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtbo
+imx8mp-libra-rdk-fpsc-lvds-peb-av-10-dtbs += imx8mp-libra-rdk-fpsc.dtb \
+	imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
new file mode 100644
index 000000000000..6574dfbb32f7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pinctrl-0 = <&pinctrl_lvds1>;
+		pinctrl-names = "default";
+		power-supply = <&reg_vcc_12v>;
+		status = "disabled";
+	};
+
+	panel_lvds1: panel-lvds1 {
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_vdd_3v3>;
+		status = "disabled";
+
+		port {
+			panel1_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+
+	reg_vcc_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VCC_12V";
+	};
+
+	reg_vcc_1v8_audio: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_Audio";
+	};
+
+	reg_vcc_3v3_analog: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC_3V3_Analog";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd-peb-av-10";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Speaker", "Speaker",
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In",
+			"MIC3R", "Microphone Jack",
+			"Microphone Jack", "Mic Bias";
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+
+		dailink_master: simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	codec: codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		pinctrl-0 = <&pinctrl_tlv320>;
+		pinctrl-names = "default";
+		#sound-dai-cells = <0>;
+		ai3x-gpio-func = <0xd 0x0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_vcc_3v3_analog>;
+		DRVDD-supply = <&reg_vcc_3v3_analog>;
+		DVDD-supply = <&reg_vcc_1v8_audio>;
+		IOVDD-supply = <&reg_vdd_3v3>;
+	};
+
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+};
+
+&sai5 {
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		 <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
+		      "pll11k";
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x1e2
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04	0x1e2
+		>;
+	};
+
+	pinctrl_lvds1: lvds1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x12
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x12
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00 0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0xd6
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0xd6
+		>;
+	};
+
+	pinctrl_tlv320: tlv320grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x16
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
new file mode 100644
index 000000000000..803a199dffa3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi"
-- 
2.34.1


