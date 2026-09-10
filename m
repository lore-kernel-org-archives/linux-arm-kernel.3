Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB646C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtejia/wv40g06S8cN1rafdHWQPPM6JpPN+Gedzf/sc=; b=S6RT8hcA0vWOa4v5sOKVvd+2ts
	uRCh14bz+Ube/alsqkWca+SGns2TDnL8H8N0l84nf507jbOEnTrfoVBUF1I3CVeGodtUEVSnK4Pmk
	xVqhSujI8SX/GebFTkyLqhxNsF3LsVlzDQkXOyG9vfm8WBqNz42k2Xoc1Uq1nSzMTBsUusHagu1T3
	Rr4MsfEfeSn2J8vM+6RHN6h6M+63bh59Bro+GCV12KAa/SSlm6sxKZ2OwwkX9N8XhXnsz/LHGYOCa
	WjOcOd0WKe1eUsRqY2gmIfZOf7R9NSA8oOvtfGdouqnE8j6qmCzeborH/dWC7P8FxmLaT7C6ejXbc
	TlDNHNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqu-0000000Eom3-4Aw0;
	Thu, 10 Sep 2026 15:38:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqr-0000000EoiI-421o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4956869750eso65367425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054692; x=1789659492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtejia/wv40g06S8cN1rafdHWQPPM6JpPN+Gedzf/sc=;
        b=bc2fzy8w01Vxg+zSehpIiOS14h0dlXXXsHk2+RqAIbSBGaAmfFmrMiMvjL+jkEiTQf
         JdN1RkE/NZv/DWWIEvi5rvvtZW98c4y/Cldo0i+QoxgZkvEj/wEGi2p05Ju6/ohCBNHt
         FQ42DPX8ndjFDhifFLRlokJVYT1U/fdMo0zTxqHM2I6PmVFalZC64ua0+Z4VFU5RRLLs
         +G6bOYr/eOR3J5i81Bqh1Bw2at/WfKGxBGa1ELdtJ4Z0rumXqUxEqw47FXD70jid+QNT
         nf7j4YeTdCgD40I4T0ViSau0EDhAC0YkZ8fXYRdGff3mzj43X1gPjSH2io+mEWFpdi/i
         Ak1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054692; x=1789659492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtejia/wv40g06S8cN1rafdHWQPPM6JpPN+Gedzf/sc=;
        b=iVvRy7BGeLtlWIWnGQxS7WxE3GWkj4mVbC0SDa+RmhXn05A6YecHLexm8GrLusT3gs
         ocnyjSZ0CTprPMQ/dWhswIZHjquvzOP37HbJ6zAQMTBXj/aQTo5aYVINBAgVV6B6gZAf
         SZOKQe8fXO0qaY0BEsS4Dw9LC0Jznm1q76S+Hi6d0q6LnDfj5732JVwzraNZ5ZXD5oZQ
         tu4nqknFo+SozGY3ljZLHhdfIuDk0kneCniwJs4yz5MtkimZSul//q1gtAAbdbRKs/nP
         YDhNmIb59CoyLBYNo1r8/eHjlDP/ExlsSJhB6g7ReRqzCEDz4Y61wcOu5W/Ci7zd5BLo
         x3YQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxuHX4xixbJchYGMiPhP4b70bH3bq/nwc2Sx6Q1MMjLgz3NgObZvgTTXguwf/TD0owPwMLimPgXU/fIS/Am4m2@lists.infradead.org
X-Gm-Message-State: AFuF++myDVHYctm1niqUf+IQCqZu1mkVDaNWa8UqRABF7rmciUWsGWba
	57ZaasRltKdBsdc5jVbiqB71VywgeyWI9mtV6r2QCKmzYHEj+92dbYxN
X-Gm-Gg: AYBFou1ch8KkO9vfLUZZDOuX5EV8708GpChqwN1o7R9cj/BDm7rKZ3V/Dux/jyI7H1t
	eeuJZvbXAPPfmhb8SOZsV2qblV3ZLBJMJr4wBIXDSiV5PPGEq/Yd7udH5qrQvZgXJb2GYOT/2AR
	66S48BGmxQPU5C443psFRF4YyOY/gZ6d+m8HKdCo7qa4048R3baQ3lIwfGdiLQz3kZXt48a1IvD
	ZYKFm1zFHhH10rChsSE5fZfbW5eJKUc66VZIeg08eJcq5g2DgIP1QjtSelLM4ZEzkZy5JOZPK8W
	lAr5HzpGIg3b9l4Lzz3ErbnbhrIj1f7sYnGk4HntKY7fCP3eHqOGPIN8MSffpraSclLMzNhTP0c
	4TBEVORyqpXVE7dBWxD4sS+iViPL5LgPRBMdkBSXqpkk2TQYYsgCGDf8zwPwgB5aHFNl7VYZE1L
	WADtNsWJBx6hJ7OMFIT2UPLjrznk+oP5wyZU41f6K2szcWDuE82ThO3+rDkYKmz4JJ35CxUaCL+
	iDUCStWq5eV/jk8MFQ/JZ7yi3wLFiv2mbjZ3GE5qSfRDjPS3sRqjMaOLVYP1TFZuKl8fQR74w==
X-Received: by 2002:a05:600c:3b0e:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49cf8254d53mr409949955e9.13.1789054691664;
        Thu, 10 Sep 2026 08:38:11 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:10 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:38:01 +0200
Subject: [PATCH 5/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add shared
 OV5640 overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-5-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_083814_064546_54730F40 
X-CRM114-Status: GOOD (  14.75  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The current and legacy Toradex OV5640 camera modules use the same connector
on Verdin iMX8M Mini and Verdin iMX8M Plus. Keeping SoC and carrier GPIO
references in the overlays would require a separate camera description for
every combination.

Use the connector nexus and stable CSI_1 media labels to describe the
camera once. Keep separate variants only for the current 27 MHz and legacy
24 MHz camera oscillators.

Build both DTBOs for installation and compose each with the two Verdin
Development Board DTBs to validate the module integrations.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             | 10 +++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 4 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 8b152903b4b1..06d41b9faa79 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8m-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
 imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
@@ -273,6 +275,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
@@ -294,6 +298,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
@@ -749,6 +755,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.d
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
@@ -768,6 +776,8 @@ imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640-24mhz.dtbo
+imx8mp-verdin-wifi-dev-ov5640-dtbs := imx8mp-verdin-wifi-dev.dtb imx8m-verdin-ov5640.dtbo
 imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..af77c065c3c2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..39204a14f0d0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clk_ov5640_osc: ov5640-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	reg_ov5640: regulator-camera {
+		compatible = "regulator-fixed";
+		/* CAM_1_CON_PWRCTRL, pin 24 */
+		gpios = <&verdin_camera_connector 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&verdin_csi_capture {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&verdin_csi_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio5>, <&pinctrl_gpio6>;
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_ov5640>;
+		DOVDD-supply = <&reg_ov5640>;
+		DVDD-supply = <&reg_ov5640>;
+		/* CAM_1_CON_PWRDWN, pin 22 */
+		powerdown-gpios = <&verdin_camera_connector 1 GPIO_ACTIVE_HIGH>;
+		/* CAM_1_CON_RST, pin 11 */
+		reset-gpios = <&verdin_camera_connector 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_verdin_csi_rx: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&verdin_csi_rx_in>;
+			};
+		};
+	};
+};
+
+&verdin_csi_rx {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			verdin_csi_rx_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_verdin_csi_rx>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
new file mode 100644
index 000000000000..332811f53743
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8m-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8m-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0


