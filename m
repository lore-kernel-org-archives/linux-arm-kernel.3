Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1139DEDA687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PBmcDEYym/rZdA8VFqYBdbvRydmxfKR0WPNdjwBSITU=; b=o/4MAj/ZM0dgd2Zw3ldwX4wphc
	GztmhOPPXxEcSRKmH2SXcU/PD+A9a79GaGdcysAkELfUwAB021jZnT4mYyLP8wUXGfuj9nKztyT9H
	GucpY8htYgSSklD3kcdcEEep7w6OEM9RXfGmP1I1X2PXL9/wlJAlR5g2LQl6LluHRiV3t+0YWqzyr
	a/gG0PSpELqd7dpjagVGPvTTfr3APNPaO6j7PK7ESJZ4aFoUgnMy3pclA29V9UIJNIb7/El8p4mpm
	alnhLuFrbVnNvO305ZiEKPM2ZwRErEB4SLgKLQz3sZFGIXRQjs1LSITaHBhsB7ztJcAT4MPxcxgUu
	Q3pts5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRdV-0000000FQch-0wfm;
	Tue, 03 Mar 2026 15:26:13 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRdR-0000000FQaW-2Nzs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhoW45jCJkUh0/2y0zSF+bhMJpVh+U5av2gu4Wa4999W0SLbpmdtGITlzncd9hcPEneP0apcyGOBsJr+7KLOtUD5TWFGEIyqBtdmCyEn2HQUWcU8AjS7nIv+TFsGxpuJ+VspFi/pRRfz2n49weZSBTc+uV4Ed6wDUP8n9lCO6TymVMyKmDHjtQk7dK8B+UMI3migk7rpql/tlRGku+SGw4diSnccmlc/B2wCpp4m/4kE84hFXMJc1Jvu98MtS18cKI/sy+XoLoTcbbohp8WY5+uSn7e49k12ZsBaMEZe6Tq5UvlPqQCyqUt1jI1YxkwTMmnGvOETPQsUDyXrVwnCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBmcDEYym/rZdA8VFqYBdbvRydmxfKR0WPNdjwBSITU=;
 b=OUAAuIuvi8UH0evwi08lnep3HrSZ7qYIIyyu7RTKmLKNCZTlLGyxXEmCtlEv0DFqWTZcKWMBcflcBk3cwjoXFKrVfjJqEeL67YHWaBQk0kdqKhzxCBWghDtlnCjHhqiUMJ9fLwIiMBo8KUUwtJ9sXLLGxPyU4gjuQgDz3wv4vvgGOHaMS4fOcbB1ddWf+XfH9kwchRrT3GJxHFNTOSiuBfw/3nw5xqBAeveMB2v0U4OS3oSyobTki8Bn7wfHvo5mCTd0/5uAskMcU/9duby/UJEkgOJlRN5LWymEcAdPOdPvip7sZRa4/EHcK8jVhiBqWZpCW/vfa7Wawyn7c6EBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBmcDEYym/rZdA8VFqYBdbvRydmxfKR0WPNdjwBSITU=;
 b=n3CK3dnHdWQb6Ng9F+o3oLI8TPRxcod59hCSfeAoic/vVzS0qwR42i1qSQcsaLW53XY+qSXsd2zmP9FuvgVyY9V9e7ywSMH4PywdT3jnKDQ4/DhW2Q9fWms03pIFRXNpIck0i7OZqtiPF6eNU8I56DxoVIe2nvgeYXDn7uaC9hWhzpqQy4Tr65HJ9Fz9PbuZbmLnn5xOQL57JtQ528moqXXi26vwNmvv4ceXbcmgcPqLZ4SOl616arEbEg1pJqwqRJ+3FwttXxpwcdN5FJYsPmyNeuvEZ6j00gKWWUKXYHVM565MpW03IFbniY6oKyV4P3peJe8cuJQFSfmCUKHFKA==
Received: from AS9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::15) by GV2PPFC019BFE50.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:158:401::8e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:25:57 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:20b:540:cafe::11) by AS9PR01CA0005.outlook.office365.com
 (2603:10a6:20b:540::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:25:53 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 15:25:56 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 3 Mar
 2026 16:25:56 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2] arm64: dts: ti: am62-phyboard-lyra: Add DT overlay for Lincoln LCD185-101CT panel
Date: Tue, 3 Mar 2026 16:25:41 +0100
Message-ID: <20260303152541.2272501-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008D:EE_|GV2PPFC019BFE50:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f892cf6-56cf-4f4d-47c4-08de79392a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: I03bVTN5ySyLDludZ509yR6ZpCM+DF6V3CI9indNHk/cZdyL/jDDomLQBbwo4Dpr1iaDKe7+b1z6LChjY5BZZgmWQkB5vTpwhtNQSV9T8NXU2/xBY1A/4vqHteDR+CD0fTbaYlWe7gCU9DGvLOVV/wmW6mG2c77R9tmSpOBLl5v/y4S9Xcggcn/K9WTY895NLOjyf73su8eVz8M2gFjj5khECl18rEkitEuMOkniwCkZTKhJSiDlCp7rcVAX94A1c0cI831SFpvsNHI35km3NXQL8CyU5ZW+8ut+XOxe7HBU25Y8lXngEnPxSa5nGqqgny9NMYX3mycVuXlG+i/hYh3yPZlND7fXMKpgNGIx43cJ4AY7UGIam/ba42OAgO2fpwqwUbPbWfwcB4EJzZVwHmbsPevTkV7pMhffMI2mOZ/+tqQ5ovyDGgsZDwDQw3xU275MG8U16PIgBcnbtQhHOYcoVzDVSMHFR7E5lCPMuX65YeDizeRsjSizACCvjEI7/eTItb3op7wB9q9Yp1XiE+tpB/s3c52b53XnnfAe4brXZ8MVjbErYZHhnv5+22YtBic1eKWNPAh2/dpRboCMyV88LvXAK2wICeZ9uKJjxQXR9DMcmJM/cfYqjONH6R51ZqL3JMN1scZAfuipMq3BwarFvRv5UAmFZBFRkTMq5FIL32IH2AGEazI+f7XhPESW+Le8rh0M/dsag/j/ZOPFYJlfJ9QHunwl2sijsgcEScTdyljaNEFc6CLyWmvxYDTxfTTelwr9B9Uof9QPcb2ccrf2mqS7IW9n26ZNBsA8KYQIO7KPyNxGhTwUZHRUssXdtDlLM/0TWWROnJG0aNEwsg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E6YHBJFJoENPmxqxklzMm3S1laWnJH8AHnisVL8Bm7Z4Ad4Ynb3r54GyZ/VCTyNAqTeVDXPKckxmDrINsG5wJ4l3tvR3SMjWvILU9zIgLt9eNcs404+u1gYo2p2IzyspPLvW+87CrhZ0ZwURz5AJ2qGNwnNhdRIdboVsqO+V9fSjRnkXEWSAWYfmbSHH/X1jHnT2VbG2MIeJZ7x7HZwNyR7V/lBOAbpB0sZpP1kDp0jbLRJfcLLxLb5oa6YV+uPtn01dgXd95sLwdplgcME/DxRsO3YvrvDXVv9z7VjKD7GGXBbWUvfOGtD6YxGwx4dE4ApG7VsC/CvEILLuthaiRZuCuwprl1DWGrL5HJN+ptPAjScMlMdGpZ4uHoSqWOkqyjkBBi2dAa+WbZyuvo9ddj+MRUw+LWiE2DNA3mG63qgd4+U2+47NF1mgccWCm410
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:25:56.6803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f892cf6-56cf-4f4d-47c4-08de79392a8e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPFC019BFE50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_072609_947573_CE0D8E23 
X-CRM114-Status: GOOD (  13.72  )
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

Add an overlay to support the Lincoln Tech Sol LCD185-101CT panel.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: 
  - Add entry for build time test of overlay in Makefile
  - Drop patch 1 and 2 from this series (both already on master)
v1: https://lkml.org/lkml/2025/9/25/645
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso | 188 ++++++++++++++++++
 2 files changed, 192 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index ba01a929e06f..0a7efa6347c4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -25,6 +25,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-phyboard-lyra-gpio-fan.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62-phyboard-lyra-oldi-lcd185.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
@@ -186,6 +187,8 @@ k3-am625-phyboard-lyra-gpio-fan-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am62x-phyboard-lyra-gpio-fan.dtbo
 k3-am625-phyboard-lyra-qspi-nor-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
 	k3-am6xx-phycore-qspi-nor.dtbo
+k3-am625-phyboard-lyra-oldi-lcd185-dtbs := k3-am625-phyboard-lyra-rdk.dtb \
+	k3-am62-phyboard-lyra-oldi-lcd185.dtbo
 k3-am625-sk-csi2-imx219-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-imx219.dtbo
 k3-am625-sk-csi2-ov5640-dtbs := k3-am625-sk.dtb \
@@ -289,6 +292,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-phyboard-lyra-disable-spi-nor.dtb \
 	k3-am625-phyboard-lyra-gpio-fan.dtb \
 	k3-am625-phyboard-lyra-qspi-nor.dtb \
+	k3-am625-phyboard-lyra-oldi-lcd185.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso b/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso
new file mode 100644
index 000000000000..3466890ee947
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-phyboard-lyra-oldi-lcd185.dtso
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 PHYTEC Messtechnik GmbH
+ * Author: Wadim Egorov <w.egorov@phytec.de>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	display {
+		compatible = "lincolntech,lcd185-101ct";
+		backlight = <&backlight>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				dual-lvds-odd-pixels;
+				lcd_in0: endpoint {
+					remote-endpoint = <&oldi_0_out>;
+				};
+			};
+
+			port@1 {
+				dual-lvds-even-pixels;
+				lcd_in1: endpoint {
+					remote-endpoint = <&oldi_1_out>;
+				};
+			};
+		};
+	};
+
+	backlight: backlight {
+		pinctrl-names = "default";
+		pinctrl-0 = <&bl_pwm_pins_default>;
+
+		compatible = "pwm-backlight";
+
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+
+		enable-gpios = <&gpio_exp 5 GPIO_ACTIVE_HIGH>;
+		pwms = <&epwm0 1 50000 0>;
+	};
+};
+
+&dss {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_oldi0_pins_default &main_dss0_pins_default>;
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
+
+		dpi0_out1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&oldi_1_in>;
+		};
+	};
+};
+
+&epwm0 {
+	status = "okay";
+};
+
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@5d {
+		compatible = "goodix,gt928";
+		reg = <0x5d>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_screen_pins_default>;
+
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+
+		reset-gpios = <&main_gpio0 18 GPIO_ACTIVE_HIGH>;
+		irq-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&main_pmx0 {
+	bl_pwm_pins_default: bl-pwm-pins-default {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b8, PIN_INPUT, 2) /* (C13) SPI0_CS1.EHRPWM0_B */
+		>;
+	};
+
+	touch_screen_pins_default: touch-screen-pins-default {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x048, PIN_OUTPUT, 7) /* (N25) GPMC0_AD3.GPIO0_18 - RST */
+			AM62X_IOPAD(0x04c, PIN_INPUT, 7) /* (P24) GPMC0_AD4.GPIO0_19 - INT */
+		>;
+	};
+
+	main_oldi0_pins_default: main-oldi0-pins-default {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0260, PIN_OUTPUT, 0) /* (AA5) OLDI0_A0N */
+			AM62X_IOPAD(0x025c, PIN_OUTPUT, 0) /* (Y6) OLDI0_A0P */
+			AM62X_IOPAD(0x0268, PIN_OUTPUT, 0) /* (AD3) OLDI0_A1N */
+			AM62X_IOPAD(0x0264, PIN_OUTPUT, 0) /* (AB4) OLDI0_A1P */
+			AM62X_IOPAD(0x0270, PIN_OUTPUT, 0) /* (Y8) OLDI0_A2N */
+			AM62X_IOPAD(0x026c, PIN_OUTPUT, 0) /* (AA8) OLDI0_A2P */
+			AM62X_IOPAD(0x0278, PIN_OUTPUT, 0) /* (AB6) OLDI0_A3N */
+			AM62X_IOPAD(0x0274, PIN_OUTPUT, 0) /* (AA7) OLDI0_A3P */
+			AM62X_IOPAD(0x0280, PIN_OUTPUT, 0) /* (AC6) OLDI0_A4N */
+			AM62X_IOPAD(0x027c, PIN_OUTPUT, 0) /* (AC5) OLDI0_A4P */
+			AM62X_IOPAD(0x0288, PIN_OUTPUT, 0) /* (AE5) OLDI0_A5N */
+			AM62X_IOPAD(0x0284, PIN_OUTPUT, 0) /* (AD6) OLDI0_A5P */
+			AM62X_IOPAD(0x0290, PIN_OUTPUT, 0) /* (AE6) OLDI0_A6N */
+			AM62X_IOPAD(0x028c, PIN_OUTPUT, 0) /* (AD7) OLDI0_A6P */
+			AM62X_IOPAD(0x0298, PIN_OUTPUT, 0) /* (AD8) OLDI0_A7N */
+			AM62X_IOPAD(0x0294, PIN_OUTPUT, 0) /* (AE7) OLDI0_A7P */
+			AM62X_IOPAD(0x02a0, PIN_OUTPUT, 0) /* (AD4) OLDI0_CLK0N */
+			AM62X_IOPAD(0x029c, PIN_OUTPUT, 0) /* (AE3) OLDI0_CLK0P */
+			AM62X_IOPAD(0x02a8, PIN_OUTPUT, 0) /* (AE4) OLDI0_CLK1N */
+			AM62X_IOPAD(0x02a4, PIN_OUTPUT, 0) /* (AD5) OLDI0_CLK1P */
+		>;
+	};
+};
+
+&oldi0 {
+	status = "okay";
+};
+
+&oldi1 {
+	status = "okay";
+};
+
+&oldi0_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		oldi_0_in: endpoint {
+			remote-endpoint = <&dpi0_out0>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		oldi_0_out: endpoint {
+			remote-endpoint = <&lcd_in0>;
+		};
+	};
+};
+
+&oldi1_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		oldi_1_in: endpoint {
+			remote-endpoint = <&dpi0_out1>;
+		};
+	};
+
+	port@1 {
+		reg = <1>;
+		oldi_1_out: endpoint {
+			remote-endpoint = <&lcd_in1>;
+		};
+	};
+};
-- 
2.48.1


