Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19209CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAFC8H6SRbBYXziL4RWAUIvTgcktVHgnRCl/MLPP5e8=; b=qa+62Dcy2DlTTH1J6m5aZ/XYG1
	T0b0YiZlVzjctKG90Inmua4rP6Pp8W/CntjIOAX/PFFaskuKCbRf59MXbLvXG1j73tnHpJvJV1/QK
	pn+rXvsI5QQ84X2thJ5aSPC62uttxJfeohub8qYS5Qq86AyGmA/r4gL4lpcSKB3aJZiMmBi5rKOkF
	LfqH0oAAozRYU+1vfXl5ymGMKVztWQmTKNG/l1OVMvsZGrT+uBNEmySQNt9PRsyu4zem53lygrskZ
	Xkc+1T7KFIkhW5iJmFQ2lrNXnQPp4pQ4zcYUzNdsF5cDf/C/oFvHG7sQE/w9zrC81nDmQqlK9b7Pd
	Ww0jAVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7I-00000009bUb-2Tzr;
	Thu, 01 Oct 2026 15:54:42 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ7F-00000009bPD-3nxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:39 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1234030f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870076; x=1791474876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAFC8H6SRbBYXziL4RWAUIvTgcktVHgnRCl/MLPP5e8=;
        b=lXUPpvkLKkMF0wqyG8e6VcCgU5oUs7uhrHhQa2fSHJHvd2SUvER+jB7bL9kXxGIZDu
         +wcUjVONWrCdEzdvoCswS9qWQyk+Do3jaMRv/ZN/0R29dGADGAoNhAELfkc9IelZp+fx
         yFTUEnf/ulAAfa0cA5fxMtQwDi94FfPXUU8LN5SEli88anDsaf2DEzRs4sxpYM4Q71LY
         Z0hp3hGIdz4lSVvKNynuRuxEKMuZf/PHw4J4AhCk73QakCr7Gu/rWF5womfHV5SJsoYC
         7aF/aHSQ3Q0geeMrZsgOrxanuOve+BrBYmIZwAHCUNX1AurSmm+Hn0kGosqSRHH3XJRu
         qCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870076; x=1791474876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAFC8H6SRbBYXziL4RWAUIvTgcktVHgnRCl/MLPP5e8=;
        b=LFAIkBN+Jy2ylO5EAYMPHRCuSZDXHnWB97DuvFceYdCBA0I95I1Aq+uKKAYGYkf9zF
         1vNH4BucEMsd9mWOf9VD6AKx9RrR/v5hbgWnm5kRUyOdx5f2+dk7F446Q+cFqbMBGqhb
         Jq4Q66rN6SzsqqpHbnA9Fneg1sNlxTGEWV9LcPv+eYW0GwouLRhBg9o5otH+cPeQGsAU
         7CPXu19pLiXU5gmNMl+Ua6PJRcnR2nrVoU0Sr0vXpctU5k0xFPh8XamWNQC4jng8Ydba
         MLsOplVj2EN8jmGXKci6gGxfkap1xiMLkImAmlEvXz9HAyu3pwuMkW8lE9bNi8E3rmo1
         q/1g==
X-Forwarded-Encrypted: i=1; AKwUvBxFwNb3B7y5G4yL0OhDMGhss3XuJkzFPghsM/ESmEBBP7IFLUIXmvmalHm+qp6ot20nX2dwHoa70ivsxJL9v1ch@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/uUpgF9l3rZbiVN5Y+5/DqOjBKuHlSgcpjFJlqkC/wTay2/Pn
	FXp0UfiwgqiBVquyxlTABBvU7wxnWbFj5hrMSwg6aAY1BypeDs8nL89k
X-Gm-Gg: AYBFou1+Bkc0ly9AblTaNzk/713Zd7yy22+FHBZyEnW6cQA4WpuZDwYZrIa72SZ17cP
	Yz2gq8ogLMvHipFjXfCiKiCa8I+ZG4+X8rdMqAIfC5K6nqXLm5qdmFEA5uW/8Mqn8Z6TPlg4qyS
	bcvtY765Vv9xyf2snvjIaKyRMuEG8QwZT/vTVQej9gXvDSRQTNo2VN8Z4K/MyA0e8M/MIVlv8sB
	NDWs49MOxlhj+BHptaFLYQq0IFlBxan+IVwIMRodGvj2o8dvl6XS7/1LpJXIONjE7WhIJbeZauM
	LCwCIxKvCpSDhO15A02rGg4sHWqWTInutCSPBOgAij5y6PxCbixtc/+GEEkbKFXtU3toalWZ2D7
	pduZVMFEMB5EOWRr1V16xf8OG91Uj26Z+yGCE/CJ4dR+QYnYT+sdZV1/1GwZOT8wvp4SE8lNPMu
	XxIZc63PGljXrnoC5oxlJC7RHKvzRwSxHj3nQvETW47WqprrebLbSR6/Xsz8apwf8piFyThDHNH
	rP/E1BIMtqRdkU428T8mKIJLfGXDNv+ptn2SJU4IkylChf6MoRJPPwSAlvRq3ee8scYOf1J///n
X-Received: by 2002:a05:6000:250a:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48b12739690mr25661f8f.11.1790870076043;
        Thu, 01 Oct 2026 08:54:36 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras
Date: Thu,  1 Oct 2026 12:52:57 -0300
Message-ID: <20261001155412.3177428-8-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085438_000137_124BF8CE 
X-CRM114-Status: GOOD (  18.46  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
iMX6 CSI.

The default overlay describes the current CSI Camera Set 5MP OV5640 with
a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
legacy camera module.

Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level. The camera
modules have their own on-board oscillator, so the sensor xclk is now
described as a fixed clock instead of the SoC CLKO2 output.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
 .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 73 -------------------
 5 files changed, 115 insertions(+), 73 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index cb2ad0756e7fe..9bb3bd9756d11 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,14 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640.dtbo
+
+imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-ov5640-24mhz.dtbo
+
 imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
@@ -250,6 +258,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-ov5640.dtbo \
+	imx6q-apalis-ov5640-24mhz.dtbo \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
@@ -264,6 +274,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-ov5640-24mhz.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
new file mode 100644
index 0000000000000..3e4bbb11ce203
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Legacy Toradex CSI Camera Module 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
new file mode 100644
index 0000000000000..302f1ceb6a102
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Apalis iMX6 CSI.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera: clock-camera {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Apalis GPIO4 - CSI Camera Connector pin 24 */
+		gpio = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Apalis GPIO2 - CSI Camera Connector pin 22 */
+		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+		/* Apalis GPIO1 - CSI Camera Connector pin 11 */
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx6q_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	port@0 {
+		reg = <0>;
+
+		imx6q_mipi_csi_in: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&ov5640_to_mipi_csi2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
new file mode 100644
index 0000000000000..9cf7587c263bf
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Apalis iMX6 CSI.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx6q-apalis-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index e52b55a386f7a..ce160fad5ee06 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -36,12 +36,6 @@ backlight: backlight {
 		status = "disabled";
 	};
 
-	clk_ov5640_osc: clk-ov5640-osc {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -116,26 +110,6 @@ reg_module_3v3_audio: regulator-module-3v3-audio {
 		regulator-name = "+V3.3_AUDIO";
 	};
 
-	reg_ov5640_1v8_d_o_vdd: regulator-ov5640-1v8-d-o-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <1800000>;
-		regulator-min-microvolt = <1800000>;
-		regulator-name = "DOVDD/DVDD_1.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
-	reg_ov5640_2v8_a_vdd: regulator-ov5640-2v8-a-vdd {
-		compatible = "regulator-fixed";
-		regulator-always-on;
-		regulator-max-microvolt = <2800000>;
-		regulator-min-microvolt = <2800000>;
-		regulator-name = "AVDD/AFVDD_2.8V";
-		/* Note: The CSI module uses on-board 3.3V_SW supply */
-		vin-supply = <&reg_module_3v3>;
-	};
-
 	reg_usb_otg_vbus: regulator-usb-otg-vbus {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -690,30 +664,6 @@ adv7280_to_ipu1_csi0_mux: endpoint {
 			};
 		};
 	};
-
-	ov5640_csi_cam: ov5640_mipi@3c {
-		compatible = "ovti,ov5640";
-		AVDD-supply = <&reg_ov5640_2v8_a_vdd>;
-		DOVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		DVDD-supply = <&reg_ov5640_1v8_d_o_vdd>;
-		clock-names = "xclk";
-		clocks = <&clks IMX6QDL_CLK_CKO2>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_cam_mclk>;
-		/* These GPIOs are muxed with the iomuxc node */
-		powerdown-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
-		reg = <0x3c>;
-		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
-		status = "disabled";
-
-		port {
-			ov5640_to_mipi_csi2: endpoint {
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-				remote-endpoint = <&mipi_csi_from_ov5640>;
-			};
-		};
-	};
 };
 
 &ipu1_di1_disp1 {
@@ -743,22 +693,6 @@ lvds1_out: endpoint {
 	};
 };
 
-&mipi_csi {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	status = "disabled";
-
-	port@0 {
-		reg = <0>;
-
-		mipi_csi_from_ov5640: endpoint {
-			clock-lanes = <0>;
-			data-lanes = <1 2>;
-			remote-endpoint = <&ov5640_to_mipi_csi2>;
-		};
-	};
-};
-
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
@@ -933,13 +867,6 @@ MX6QDL_PAD_DISP0_DAT23__AUD4_RXD	0x130b0
 		>;
 	};
 
-	pinctrl_cam_mclk: cammclkgrp {
-		fsl,pins = <
-			/* CAM sys_mclk */
-			MX6QDL_PAD_NANDF_CS2__CCM_CLKO2 0x00b0
-		>;
-	};
-
 	pinctrl_ecspi1: ecspi1grp {
 		fsl,pins = <
 			MX6QDL_PAD_CSI0_DAT6__ECSPI1_MISO 0x100b1

