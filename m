Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB922CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lopLWkJC9CWft3b+a1/W5NTqZhGkRVq+wmUIf/6pQ0o=; b=uB9M8U/gjq0zeiH01DN2yWam1x
	9H/f772NGR6VbZGmuPKVvEtoZeQ3MVsc3gAN8d2yic9Dt02u1jHDdTO/Wjcq7clcGFTnPkBhY0aax
	BnqtmJRePo5oCBlXnH5jFU0IedDkfdWHbXnSufG9o3porxlm33c5AF1gOx3cC7NHjZG4UxC4VfNLC
	ikzzGu4r0BWIPQaUFpcilqS6ofs9Wivxp1R1vTF5fgmXodmT2eXeshOcb0mnfFwYD/JHGAsXfGgzo
	ebyWDD4bSSBfFpTVDkn9xbe5sFA7SwdfpaQHtj+ymxIFVYLWokHM9gVHvLLUXDW2evxzAycc3fxs/
	99QjtXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYgC-00000005e9r-1SFY;
	Thu, 28 May 2026 11:13:36 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYg8-00000005e8w-3rfO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:13:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vua25k0UhBfP1smO5GwJapLvAzzM37tU1mMdd5ImP/HHc/MGmnMGegOKxelF6T3+s2B0z7BTx7w/VKSSt4Or8q8ZIZeSw1cFMfE11YBWmzNzTd4439VgYDHUzaPiR4u0fuxgf7GSyvoKiIoTBGssiwPYjkNLbd23QfK8Hv1bw0bFGRHss0tn2p9to91rsz3P45JEHReEDyYPsTbKUrMm7UYh8FtCupaWXWCpYMsFYXKR4P4fRFP2HXoYW2ZIWULs5eRnIEPqIBJo+jHQ/M3pRfhLOaVNiwkYXN3QeudVzhehIe9acHvnYEttNAAvwVs5ugsQZ/o9DsGvzA4GHDJjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lopLWkJC9CWft3b+a1/W5NTqZhGkRVq+wmUIf/6pQ0o=;
 b=K3OUtDvP48DL5Yt9h1un9NWBpOh8eO++uYOfdBTKAeBwMnZSfsEAnyq856DfARC9dOL54VdMMurOxr9C9/MZ/KrbL9FUtG1Co8WWveUWgjbuGfjqvhGGFgL8jbshDYj6qCfFUP1qEwziHmR/4mtnjhnsW42mNlRd/P5dJeKEGyhDQ0T0cWdQGAtQqAVQkonUH/2ppb4V59afcUKO4Kof27uNx+cNd7QqWQHKSyX9hAboY/L3kvNyWaNNecdlhEQCiDcaG3JYAlf0fDiJCfJ36XdvULgbztu/+94K4ftUwN3vNscDqiuFo/Iu5DSKAAAmjv4CRyIpUDPk3foxvp6TWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lopLWkJC9CWft3b+a1/W5NTqZhGkRVq+wmUIf/6pQ0o=;
 b=wRCAek2KqRKvrgG2btxp6N6JTdvLgNk2jn8Z3/cd7PLq0GThoRwuYD6WIWYkwn4tuiTPGQlEyQeRhJxCLiGJNPn4YSXD1d/owNr/J9u+B12cPlbMt4fICAAvmxGvd4C4l/OisQ5+1k63eDzFZPttigaNwiN1j9X6NaUhesQ70cs=
Received: from BN9PR03CA0760.namprd03.prod.outlook.com (2603:10b6:408:13a::15)
 by IA1PR10MB7538.namprd10.prod.outlook.com (2603:10b6:208:44b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 11:13:25 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::24) by BN9PR03CA0760.outlook.office365.com
 (2603:10b6:408:13a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 11:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 11:13:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 06:13:24 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 06:13:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 06:13:24 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64SBDKnf1932799;
	Thu, 28 May 2026 06:13:20 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<tomi.valkeinen@ideasonboard.com>
CC: <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v3] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
Date: Thu, 28 May 2026 16:43:19 +0530
Message-ID: <20260528111319.3262698-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR10MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ed7be6-1670-4b53-4df3-08debcaa2330
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|6133799003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: iZ2NkVZ865dYVsHAbvFo1TLZgWvs6ruWlx9s/l4ny0Y84IxvQv2Dm1Iugz6uGl1DwL+TFARwAoOgnGV/jJaZq9dlm8bru0+v1534LRpFTgZdjJDf2Pkez9/ZWq+5CjlUR2DQfFNz84YGfJFpbYDMXCMXIFFscLNIoOmCbl5jVOLoUtjoAEN3+eiRKrfdKYR+vX5S5zLVkhuVHUMWRfILgAdq0s8Pn79a+afM3ICFDH7kGczCB5b6wX1ftLfZqX2xhqRosjzdr7Phb8tGkuupXufKcJXvD2RBuo+AgnUFDgChRqbq7qSbCEjk5pViaIANqEAmEMAxd62GLKFMhC8HvU/NOGPlnZfX4VFGTyP014yL/bjEEHwuYWhrY7DKIv2iOvA4vz3d+q8ex/CIwds0wWU/+CKCK1GrZY6zmBDbeQI7r6QJuSPi3ZNd9osYb87MKeYPxMDTEF8uVsks22L6FKZrTz4V4fhlNr+IkHrjkhj/pTKLXcVXFE+MIr+v7q2xmk+JE5c3127xr59X8hsbTfiOBnXuu/Nm267RnE8qIfPI16rXtJ8j6QDWqZI+rZQWd+u6p5ttvuZ+eQy+icWSpN+d/26sVcFKRx75V6ZSVZSwi8QCFftNE1phLBCrQtPMDArum0+J81PK6pXwZVZQtsAR2rfP7MynCafxcq6MBTo=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(6133799003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yWZQ36XPOUgVSWYO3huFhvD+fIwQQcuRREBNivhv/M7F2la0oS6yRNxNO31EZeoXoSNhErdziRXqPNM2vHN2Lc+pzRPs5JVvXdwA1V6nz0FM/wvsFtQaQ6H9mA6aEdBwA2w+LCuX/3M9b1fkwSN8o9U4fAkwTY2uzu7Z8dck3rEZ/s7LGstPWE8KjWHfk46Av02J97IBkn3fOUuXoGqGVwwu3J1IqFIirGWB7RE5d/hjyue6fCQRxh6FeirmEsPZhAqFHDG2gQsIB6HxGNkMBXPZ0IZsK7akmBuhtLkhqitMrVvVk71wqO5ZNDFXIdneES6P+v9j78AEGc71FnZLp8goFwsPXpRZy1Hq+GfT8EEX1jxYrjUHZxhDE0+WcegX4vQM0gWXApV77B1A4j1yS4z1LVgHPXWFtwlL/kv90aWLrG7boGt2HFdxzw7uyUs9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 11:13:25.2872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ed7be6-1670-4b53-4df3-08debcaa2330
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_041332_971189_5BEE8A3D 
X-CRM114-Status: GOOD (  16.39  )
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
Changelog:

v2->v3:
Use tab inplace of spaces for indentation.

link to v2: https://lore.kernel.org/all/20260521020630.816220-1-s-jain1@ti.com/

v1->v2:
Move overlay-specific pinmux configurations from base device tree to
k3-am625-beagleplay-lincolntech-lcd185-panel.dtso file.

link to v1: https://lore.kernel.org/all/20260514225502.2327771-1-s-jain1@ti.com/
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 ...5-beagleplay-lincolntech-lcd185-panel.dtso | 165 ++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 21db60cd19de..dd24fbe0c342 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -20,6 +20,7 @@ k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
@@ -190,6 +191,8 @@ k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-ov5640.dtbo
 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := k3-am625-beagleplay.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
+k3-am625-beagleplay-lincolntech-lcd185-panel-dtbs := k3-am625-beagleplay.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtbo
 k3-am625-phyboard-lyra-disable-eth-phy-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-disable-eth-phy.dtbo
 k3-am625-phyboard-lyra-disable-rtc-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
@@ -300,6 +303,7 @@ k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
+	k3-am625-beagleplay-lincolntech-lcd185-panel.dtb \
 	k3-am625-phyboard-lyra-disable-eth-phy.dtb \
 	k3-am625-phyboard-lyra-disable-rtc.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
new file mode 100644
index 000000000000..156bd2c7d82e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtso
@@ -0,0 +1,165 @@
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
+#include "k3-pinctrl.h"
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
+&main_pmx0 {
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
+		pinctrl-0 = <&touchscreen_pins_default>;
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

