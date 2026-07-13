Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C31C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=; b=Q5pSxnmZoZcZgrfZ+rwIjQGOau
	lvj0FFTMkcGoWGFSx6Ic3qgpE4TxOWehekuc+WIPKp40TrusBgXGPt9AsA73WDc6GM01paGpj15sP
	VjtKfAEfki5qm01vdWirrNpxHqGqAs3bN9eYa1hA6D3dKQzjmExNBneFdFntLlxeTgLACNuxFlsWW
	X5P7l62hvie5+BBgqDps+P140SpOpI+Fh2gyvGO1E1ltNiLCSIm7Wsg+JxQ/PQ96TLIH2pXfT6g2s
	XquNpy5gpL5P6ActN7LT9XaomDl2gk0uQHZCOjHyNRf59JN87L344mwtl4NO+dWUsgtvJKrNDWn9l
	aviv47Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFV-00000009jJz-3xpN;
	Mon, 13 Jul 2026 15:07:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFI-00000009j8O-1aE0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:07:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47d70879764so2087276f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955218; x=1784560018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=qQOqHDYNpATH2uB1tTtGJmqb4hTaycrco85bABLqjwy8vswy+QowYL1AZ9xBSkQvc7
         jNYYiNye+bJ6MxuAfSZ2aI7q6XerX8+Xsi0Cqx02Y4XPohm78Zf8JjxxXM63lnzNuJDI
         lxMuhtFeA80X4x6YBe9gMUYvAJbcQl+4kcS3NZbnUPjEvV7r7nQLK8+6wBzFNtPudi+x
         xKYfeWgm+OqfTKY3V2yBTQzNwtg5gHhl79/MoD5gi9DQMg66mUVCs01hgXJGYq+D4n6/
         Mx8SoPV8K+BWHsRjSHtPd++7m4Gm39GlY9CtYKvSxwTn7ww7YkZr8rJc4TnbDtr1/B3j
         fgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955218; x=1784560018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKycMxkJUjKVffGUmXn6hazDZ6CipwefkSIIp/tO8Gc=;
        b=SLa/BMjaQwd/skRM8963R1F7mgT5XDPISbumJcv3k4ZQuURoGJG5NwIKeaM1zb/goG
         Plxv5HD7gq/7nGN0a/3lGu4MOWqwGXRj5/5jg/xjJbkGh/WNevdmpK2tXGkivZJlWWcY
         Sme60NOOQEhjjfmZvBqHka2d1XC+Zq87142zX7og7T4hxaZKYak97MjcuPyauhtMUfah
         0UTaiXPutvS+BVROBnwpTySh5u7ajFa2tZ8Bd7luf4eGw3F7AMvokL6D9v3iaGJJDf9+
         JVo6lFtoGIY+E8DJa7AycR0x8wjEAJyI5eM7vsFquz24W0TCgPNbPRflRoyhXtHZ6qMS
         6wsg==
X-Forwarded-Encrypted: i=1; AHgh+RpNCx6qU6fKGneg1RoHM0ruKcDu82uWOUBpA/mrU1zLzTuqoYigbNswdMpYJNmMdtdYksgkcBjChWduV4fXdFWZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzrMZeDUBicQ9RlqIK9YE/jodeHyYktqUflD/tW2NRKOge99lAQ
	hEC5neq6dcWgQDQ/6VCftnvpKSuEfru3M8UYgFt8fo1JOyFU0wLFrqNW
X-Gm-Gg: AfdE7ck+epnQRDHbYHxH1aFFJ/kHe947IbGAs9xNhZJQomRpAA209DUcgNh+yGShIb/
	3F56cJvOHcuaQFwN1TbwUPZ3ocNhPjW4YL7I3qoYCXBY4oS5cjbV2+kVqFvjjfX84EF+CPB70vV
	bgcj65idmXqB4qr7RZV2a9ekLCSUHya227XmaMZd5C3ZmKARFtnTbMmV9IrcSRckCsN1AKR1G9a
	qInfrd6w+enSBP5A1wyRVy7o+S1PgOEwokXHZKhk2uQAIsUmQyoOM/mSZnhdV/DzZQjGD91u+S1
	Eitm0bxXs2UgKZqIYp2LORV6BbPnK7yG8ZoGJ33cpB7OsLRNcARZ0Vu2U+G84WzulECW66NBxej
	SH+nwaYd65yDazDMJ1+RoV7AjaJ79b1Y5hd+RkUwX7L2bhOft8xzhaCKYp8Vdhy5/eN/eSRFlZF
	VljO8ZhiceLB9sDk4f0J1n+dt7XkJjrLVtPJK/GuxekqDM41VJ30+rmvXNcP4m/NoMDxi6e9q1x
	bK9wpzj6lYZ2KZB
X-Received: by 2002:a5d:64cc:0:b0:472:d154:fac6 with SMTP id ffacd0b85a97d-47f2dce975amr10204164f8f.35.1783955218269;
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:27 +0200
Subject: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_080700_502465_A6E36939 
X-CRM114-Status: GOOD (  12.86  )
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

Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.

The default overlay describes the current CSI Camera Set 5MP OV5640 with a
27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
camera module.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://www.toradex.com/accessories/csi-camera-ov5640
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 ++
 .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
 4 files changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c465aa19e526..ed3d678e7c5e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
@@ -197,6 +199,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -217,6 +221,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640-24mhz.dtbo
+imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..f479b709c151
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..0632bdb1b679
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin CSI_1.
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
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CSI_1_PWR_EN */
+		gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&i2c3 {
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
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6_CSI (SODIMM 218) - CSI_1_PWDN */
+		powerdown-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5_CSI (SODIMM 216) - CSI_1_RESET# */
+		reset-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_to_mipi_csi2: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx8mm_mipi_csi_in>;
+			};
+		};
+	};
+};
+
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			imx8mm_mipi_csi_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_to_mipi_csi2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
new file mode 100644
index 000000000000..d56234913b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
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
+#include "imx8mm-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};

-- 
2.43.0


