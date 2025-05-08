Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DA0C3ABCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRbkDO4Y/285n2JL//96+lq6iY+17Tv7Id+/EmgjOtY=; b=xXmJgkFnn3pVo/hGsJoKWw0lF0
	ozgmbaKkCLiJEPH1RRsOBHhdUde5At2VaTp6do9Wc1dOHm7bVu6F2bIZl5YZ/2UW6WaAUEAnJ7i31
	oTXha05Y3yC4Qo0rLnaYMBvV1Hr/gqHx4tNz5EGtMwfxRA3pF/o88zquAEVMwiGK2GEWRAj2Xospb
	vAb/kjRFnjUIE+BzpzF2FcUoHyPN2wMA8j1vDXdBqjg30BSiQmQjcIbULPUhalao6IC/HwDRqdbZR
	ihfwhdQ9I+UKvggyfjJ8HsSZQ5/6n0Xs8QbXPYGbWfGZ/2aB+Eu+1hxfm4TOHyO/2+ERTIVpHpDMF
	9H285s7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vZ-00000001Mlj-1XC3;
	Thu, 08 May 2025 17:20:57 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3YX-00000001CLx-1KD5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:53:06 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548Fqtcm1135308
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719575;
	bh=TRbkDO4Y/285n2JL//96+lq6iY+17Tv7Id+/EmgjOtY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sZW2TZYsmwZbKSD9f9gXhiwpjcGK26uttGXVZvt1kdcAdHoSBldBfd61dC3s4hB14
	 /1IwD/Oo7XNfBhkdVGRrDgbk5UnFnb4tA23xGXWGKLhZB1VWHj4TZZBFaRevssBXeq
	 SiqKAeSo13AmB3b5HZOwt/ZZpkx0M7RgYciJsh70=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqskW068752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:54 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:53 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:53 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oO050794;
	Thu, 8 May 2025 10:52:50 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 4/4] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
Date: Thu, 8 May 2025 21:21:34 +0530
Message-ID: <20250508155134.2026300-5-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085305_480043_930732C6 
X-CRM114-Status: GOOD (  14.37  )
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

From: Vaishnav Achath <vaishnav.a@ti.com>

TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
for quad TEVI OV5640 modules on J722S EVM.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 322 ++++++++++++++++++
 2 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b317eaff64cc..b0ac5c05274f 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -133,6 +133,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
@@ -230,6 +231,8 @@ k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
+k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
+	k3-j722s-evm-csi2-quad-tevi-ov5640.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -268,6 +271,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
+	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
new file mode 100644
index 000000000000..55e767a020d9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&{/} {
+	clk_ov5640_fixed: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3_exp>;
+		regulator-always-on;
+	};
+};
+
+
+&main_pmx0 {
+	cam0_reset_pins_default: cam0-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x03c, PIN_OUTPUT, 7) /* (R22) GPIO0_15 */
+		>;
+	};
+
+	cam1_reset_pins_default: cam1-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x044, PIN_OUTPUT, 7) /* (R26) GPIO0_17 */
+		>;
+	};
+
+	cam2_reset_pins_default: cam2-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x04c, PIN_OUTPUT, 7) /* (T25) GPIO0_19 */
+		>;
+	};
+
+	cam3_reset_pins_default: cam3-default-reset-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x054, PIN_OUTPUT, 7) /* (T21) GPIO0_21 */
+		>;
+	};
+};
+
+&csi01_mux {
+	idle-state = <1>;
+};
+
+&csi23_mux {
+	idle-state = <1>;
+};
+
+&pca9543_0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ov5640_0: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam0_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 15 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam0: endpoint {
+					remote-endpoint = <&csi2rx0_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		ov5640_1: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam1_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 17 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam1: endpoint {
+					remote-endpoint = <&csi2rx1_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+};
+
+&pca9543_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0>;
+
+		ov5640_2: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam2_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 19 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam2: endpoint {
+					remote-endpoint = <&csi2rx2_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+
+	i2c@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+
+		ov5640_3: camera@3c {
+			compatible = "ovti,ov5640";
+			reg = <0x3c>;
+			clocks = <&clk_ov5640_fixed>;
+			clock-names = "xclk";
+
+			AVDD-supply = <&reg_2p8v>;
+			DOVDD-supply = <&reg_1p8v>;
+			DVDD-supply = <&reg_3p3v>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam3_reset_pins_default>;
+
+			reset-gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
+
+			port {
+				csi2_cam3: endpoint {
+					remote-endpoint = <&csi2rx3_in_sensor>;
+					clock-lanes = <0>;
+					data-lanes = <1 2>;
+				};
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx1 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi1_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx1_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam1>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx2 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi2_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx2_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam2>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx3 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi3_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx3_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam3>;
+				bus-type = <4>; /* CSI2 DPHY */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+
+&ti_csi2rx2 {
+	status = "okay";
+};
+
+&dphy2 {
+	status = "okay";
+};
+
+
+&ti_csi2rx3 {
+	status = "okay";
+};
+
+&dphy3 {
+	status = "okay";
+};
-- 
2.34.1


