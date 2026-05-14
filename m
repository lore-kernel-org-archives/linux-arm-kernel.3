Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C1ECD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 22:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6JDt4JVt/OvqFFN1NaTyFcBkdmkdGWpIiCqlAceleCc=; b=0+y10nEmE3Yg8OCCIpG7ZMK4i4
	c43ZZPazDivzaPtFg9uvqR66Hk/K95ufeH6gdTCjnBhbcpfnnOa535uN6MnvAub06saQFSktalTv5
	FUmSVWh0wFRKqRAJYO7HPqYcjYYN2djePeQi5yoNX9bkZnEwrp2aNxpfM8oMNK9m7KiG0pon+0S+Y
	AXLQ9IGgOOEQ4XXtpAaUnf+k5ygC7skSFjrkHmym1e3BVZfNQ5rYPOqN7dT5I6z8nYVRR30fu7kRo
	Os6nZxZINJU+oF3VvlT51uFKsPNKBJSxGWvz4MvJlX2+cKPO+eNgOKZfcfD9xmYY4PPx0P9lySi/A
	j9EW8xJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNexb-00000006lam-0O9M;
	Thu, 14 May 2026 22:55:19 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNexX-00000006lZW-15Kc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 22:55:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyAu6s06jienQTJMqErJBBU0Gq2XWsztZO4ar0jDFRuVysaCHBmio5vgFXFBMA5vw3FHq8mqbRiuD8LT6+jZumnxEDjP87c8XARWrvoykdf2eQoFWGKYE/C88gKRsYoupHlkk2Bkw62fQMeiw8VEASPm0GBx7jEiYaZaqi6k9XunEEACwXukSpX7MY7K7jQUoXn/r5fvkcQ2VlhdVpwL7FcVArBk5C3QTFNwIgtS3Dg7OVg7Lab1kutfsocRNldBAiamr43U5Y6vxqWY1p2+6Wsj4P7M9qg+dVFQiU8c6sypG1hiGPOYSqXnBFYAZ92Go0rDzoZvWkCc7t6fjhnwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JDt4JVt/OvqFFN1NaTyFcBkdmkdGWpIiCqlAceleCc=;
 b=MaTHGRVODGd7Jg6M+XInGkqQKGLddPHtH6D2OdfCWMDeCOqsy11mpcgCB0L/vaUhke6NDwvuIYjSDLz1UlNjwPyCIZpdPLsY+cB1NAi5QiXYMI0BNWoCJi2bYbua9l/hwdP9+N2a8J1uatVaYhl7viT5pYUxmLygTGgarxeQC/pZzii1ppTh0Dx+PTHyLwOCuFXaJny1Wv77jzhjpbJX3tchbufaprCiQVMqz57xjoHOquhF3vhMmQLp6IxPIKjDmtVvOd6V4qViGGsS4WTaCFYkfatbtj14MBFFZjqBsd4ceRK5BXcgCrBrq6h07N2PwXpz8e8zrek06Ixaul08Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JDt4JVt/OvqFFN1NaTyFcBkdmkdGWpIiCqlAceleCc=;
 b=riqwWigmGZP9Nnb/p9EYj7zyUJNE83YnCNngbxKAf2isOgPrPVvY9+lO1w/ofYon9spngoFUCGfCsnckt9/ZvUw0Lm9SwlIJMxd5JyMNSYF1lS44QZ1k6LBwHW7JxAyv32kMhKZxG6l+WRRFiujnDZyqoC++Qej490aSyelLZZk=
Received: from SJ0PR03CA0382.namprd03.prod.outlook.com (2603:10b6:a03:3a1::27)
 by MN2PR10MB4173.namprd10.prod.outlook.com (2603:10b6:208:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:55:11 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::12) by SJ0PR03CA0382.outlook.office365.com
 (2603:10b6:a03:3a1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Thu,
 14 May 2026 22:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 22:55:09 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 17:55:07 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 14 May
 2026 17:55:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 14 May 2026 17:55:07 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64EMt2pu3164482;
	Thu, 14 May 2026 17:55:03 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
Date: Fri, 15 May 2026 04:25:02 +0530
Message-ID: <20260514225502.2327771-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|MN2PR10MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: de516976-629e-4165-7b18-08deb20bd939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: E9DO3QGatLaHwlrggM1cBPwbrTOrzW1jOtKpqxM2OIaE5ho20dhZ3c/10axFWseOOkRxLvITODZ3C4y+m8dcwjK7LrkHn1QXTB6HhRff5J65/W0xmSmOCzYEVMK5tFrR6QhruU6IlHiLUGsalGw7JpZANiImPe6CYGwr1eCTE4SGbqhdt7h9wx2cdaz9jnpL+iBXhxq7sY3X+fjAhaekXWsbMJN11hEVLc3OyU7s8EDg2r1ORJsIArlbsYndZ7eTSp+GgBi/W8bf1anqZIm/kxt+9pf28oDAYrQSOo7FIOxyFd/vurTM5TbqXUGPCRMLlLBvyuPUKuKyeSQE4s5gABGapMbG37ROSaDjIe1sbtlDaMYnSLYAh5reNgfewDoJyE1h9KtbKsdmz6OHCbV7J5A0/Mtm2Poo39q+cdNxpEJpabuiWob+y63QR5A1REGKR6+bxOo6km7wn6ewS3HXq4+7QMueH2cPbwvykw9JAtt9eKsopWiZ4muoDBSOGAsAn+rg8ehH+myWvoPMMRsy6wZW3qY+GgPWFMiSaZznByI7SG3flTqL17FBV3+xwtNwHLyaY8pPWei+VA9MtJ8We1j9nPa4Mb7IkrCIMeo8BKchyds07lK1rZvRtfJ8LtB/ZP9jCHl7cWhjq/PgdjUYZeXwD7BfHu7eb4i0XDURBPg=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sdeRlQQEK2cWgDmOtpnhDdUw50KNTzQoZVomOR0RqT0tcgAhmiSaVHycu+Wd6rnnTnyaqfZL4sLY9sEmiCyTbTysfM25sjnukGMavGfdZPTEaszFmroq9dT8j3aK3t8yRDN4j8+tPW/l2ch3ySqakZuKnF5lsgqMl/GAh8d0B21r6/Hn9kA6gtRUScU4vjriNwJisxXnYijluDyUjPzQL1N08j+T0aPPGUJHZHPRzmswd6qyFCpu24YuhLBL+l0yVgfscQ4v/GpyW+0u/JCc2euys46SUy6RMsQtIgduDft/8+9ykvTXh8byZF4wVSP3w/CbeSHshY12uOBqMDYVUcZFXXD+ourM8yoSc0VRrlJQGIEFVntj6pTE5LsR216EhJgvOHFsteHrTibcddHifPeGWdgX5cwTDupWmh1u2RStmOVMkW7AOS57+/1guGh+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 22:55:09.0704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de516976-629e-4165-7b18-08deb20bd939
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_155515_355880_C5259598 
X-CRM114-Status: GOOD (  16.13  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

The panel is Lincoln Technology Solutions LCD185-101CT[0]. It is a
Dual-Link LVDS panel and supports WUXGA resolution (1920x1200).
Furthermore, it has an i2c based touch controller: Goodix-GT928.

Add DT overlay for the OLDI panel to connect with BeaglePlay platform.

[0]: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...5-beagleplay-lincolntech-lcd185-panel.dtso | 148 ++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  14 ++
 3 files changed, 166 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 7642c06ca834..f0436a102fce 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -12,6 +12,7 @@
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
@@ -177,6 +178,8 @@ k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+k3-am625-beagleplay-lincolntech-lcd185-panel-dtbs := k3-am625-beagleplay.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 k3-am625-phyboard-lyra-disable-eth-phy-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-eth-phy.dtbo
 k3-am625-phyboard-lyra-disable-rtc-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
@@ -287,6 +290,7 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtb \
 	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
 	k3-am625-phyboard-lyra-disable-rtc.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
new file mode 100644
index 000000000000..9ebfa9ab7a90
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/**
+ * Lincoln tech Solutions OLDI panel (LCD185-101CT) and touch DT overlay for AM625-BeaglePlay
+ *
+ * AM625-BeaglePlay: https://www.beagleboard.org/boards/beagleplay
+ * Panel datasheet: https://lincolntechsolutions.com/wp-content/uploads/2024/09/LCD185-101CTL1ARNTT_DS_R1.3.pdf
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_pins_default>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+		enable-gpios = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		pwms = <&epwm0 1 20000 0>;
+	};
+
+	lcd {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+		/*
+		* Note that the OLDI TX 0 transmits the odd set of pixels
+		* while the OLDI TX 1 transmits the even set. This is a
+		* fixed configuration in the IP integration and is not
+		* changeable. The properties, "dual-lvds-odd-pixels" and
+		* "dual-lvds-even-pixels" have been used to merely
+		* identify if a Dual Link configuration is required.
+		* Swapping them will cause an error in the dss oldi driver.
+		*/
+		power-supply = <&vsys_5v0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&oldi0 {
+	status = "okay";
+	ti,companion-oldi = <&oldi1>;
+};
+
+&oldi1 {
+	status = "okay";
+	ti,secondary-oldi;
+	ti,companion-oldi = <&oldi0>;
+};
+
+&oldi0_port0 {
+	oldi_0_in: endpoint {
+		remote-endpoint = <&dpi0_out0>;
+	};
+};
+
+&oldi0_port1 {
+	oldi_0_out: endpoint {
+		remote-endpoint = <&lcd_in0>;
+	};
+};
+
+&oldi1_port0 {
+	oldi_1_in: endpoint {
+		remote-endpoint = <&dpi0_out1>;
+	};
+};
+
+&oldi1_port1 {
+	oldi_1_out: endpoint {
+		remote-endpoint = <&lcd_in1>;
+	};
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* VP1: Output to OLDI */
+	port@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dpi0_out0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&oldi_0_in>;
+		};
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@57 {
+		compatible = "atmel,24c256";
+		reg = <0x57>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+		pinctrl-names = "default";
+	        pinctrl-0 = <&touchscreen_pins_default>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
+		irq-gpios = <&main_gpio0 39 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio1 15 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1920>;
+		touchscreen-size-y = <1200>;
+	};
+};
+
+&epwm0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09..dc5b7f6217ad 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -510,6 +510,20 @@ AM62X_IOPAD(0x0074, PIN_OUTPUT, 1) /* (U25) GPMC0_AD14.VOUT0_DATA22 */
 			AM62X_IOPAD(0x0078, PIN_OUTPUT, 1) /* (U24) GPMC0_AD15.VOUT0_DATA23 */
 		>;
 	};
+
+	touchscreen_pins_default: touchscreen-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 7) /* (A13) SPI0_CS0.GPIO1_15 */
+			AM62X_IOPAD(0x00a0, PIN_INPUT, 7) /* (K25) GPMC0_WPn.GPIO0_39 */
+		>;
+	};
+
+	backlight_pins_default: bl-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
+			AM62X_IOPAD(0x01b8, PIN_OUTPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
 };
 
 &mcu_pmx0 {

