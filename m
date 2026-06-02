Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F5CD6E66
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9szoMkSekqXZjHQ58B9YIx1uhfdOHkq/yPwrYOOb5tU=; b=L1L0ex2PIEfvfDcKgv9TivgPc/
	Q5fb76wrOZmFm4uRL4khA64P1i5HAdtUmwDol6wIfP3UXwTYkuzrXqt8RiP1noNUWzqArdhSdwx+7
	kmGqB33TBNlUdGL8DhsbID9HUE5gy/Y4Q2iWz6oQ08zez/5a8EMwOu36FA1k0WR8yOuM8kOl1wMiR
	JeFpTk9PlmvQ+WxAi/1KIvihl5vczRJTKE2KjYyOLgV98c7qD+ylGY2ktrxPdKsG1PRGu1HkOINra
	gMO6T41g5klt/IzuEmmjB0QKdVZSWN/1eELpuoQBSJKFVHExFx8Q8tp4uhjq2IkZimiQyPUAPAINk
	dZDBXnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNez-0000000CuwQ-241E;
	Tue, 02 Jun 2026 11:51:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNew-0000000Curs-3HNG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:51:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso5371475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401109; x=1781005909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9szoMkSekqXZjHQ58B9YIx1uhfdOHkq/yPwrYOOb5tU=;
        b=ejbUNcx2qBgMhr5BfXRPfbfy4MHLz6ZDvVLQR1mXsdwWpQvOF9+qGewtC5PcWxX/RS
         q0nASxeZowH3BR1K5wxslZdOqRA75aR2SRdSY/D25EiM6QJvZlPIZjm6OYZ0ZEJ5Q3mI
         t6dU25N2vPSewNJzwBqAVMbDVufaod0U2ivv4slkP0HEbbs3j8uyf7RALcs7I2r3JTks
         EQ14gsTSwjCtWI0rgbXKZR4wC7JcEyWCS/ZrfofIciX1SC0sxnCr3C02bT6otmziDMlz
         OjqSIwo0IdpYwnDt75JSA4+wP75pQdcm1hAjr/xeGmbkAxFXHPGmjDS+Cpp0pswp4asl
         hl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401109; x=1781005909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9szoMkSekqXZjHQ58B9YIx1uhfdOHkq/yPwrYOOb5tU=;
        b=dPOD+YQvBzSwWx+UXeXRQ73pl7I63OBHqN0+/cA4stfcjlyPCKeCZCsA+uhD/A2pZo
         kkUdg32qAaUXw2tNJeUpmq2MG+h/sMzniI8E0lJ8WCGN92c+ebUlHYVFwzNwq1zBjR3b
         xNG2Q0vW2Yd8yu3/ojKN8m9dssx+kiIOmnewlSiGgYrNW4JJEpfEViQ5gptBVSCFBFVH
         Yqb1kK1DCGEoYVE1uMAHyvg8wBQUaHsf454YMWnva61i/0ZbLhH8saSaV1JbaICqA+Fx
         eo/esp+hqHlRu1Ik/SCuK6uCTON0aqLeTb3pH4GZ8ve8U1a1IxdRTF/lSybf1rGp2rSv
         8dQg==
X-Forwarded-Encrypted: i=1; AFNElJ8gb0Ij/ANeWP+QCfYNV9aIEZIKGZ9iKru6Emyz6WE7EZrJb7eA0ezfTTcjgMXzFd3oDARlSxcfHo7zCcLgSOBE@lists.infradead.org
X-Gm-Message-State: AOJu0YxR7+kaYqzTutxpQqqjaYZrwlp41VADr8poboF59mgD2DwHdp7V
	UrUpsG5QAdDMWRhuq+HZUQsnPwph/SMYwLerDRdbcAg+72L0YYkyIKx+
X-Gm-Gg: Acq92OGHcCqNOqK3t2/E4hb3iUo+TU3CbbBcx5w5+tREu+n0+8M2Yk6hqQSHhFM+HhU
	pHt5cK82gvjQKa8mRDDnNi3XSAn/bsRAOq64mYZn4qLAZVaYbDjQwAy4SU9m8FYGulqXxjedrDR
	9wq5NhehQ5GbkWM3Hh0tThTU99sVM/SUfZ3cUjr9swPpKCvJpE4lxZ/e3d1+GmPSOAcxagkqJYG
	fVSodoBg28WFNcsiYXJoPA1QchjceaLy8whE0iQHVxfDGHRdEQHili8AMYGEmZyQTyjPt7uPFZj
	UoS/Oy0+mQBndmChEOVGMj00MzowfuM/dNc1e2SoYQS4qIaN/FNlrYyy1z9ePCnLqnmnI6ewoT6
	9vXB7mK4I7gJfxv9T+xS056n7mLI13xS/TvEvQI9kIpYKHVXGaeV3uZhsE3sLOfyh4u0/4RzUsk
	l4fFXi1tu79x+VdmnpnUarVhQAAQ==
X-Received: by 2002:a05:600c:8216:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490b28da915mr41764595e9.8.1780401108861;
        Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm139480015e9.9.2026.06.02.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:51:48 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
Date: Tue,  2 Jun 2026 12:51:30 +0100
Message-ID: <20260602115123.1324474-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
References: <20260602115123.1324474-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_045150_890678_1B310B49 
X-CRM114-Status: GOOD (  16.87  )
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

From: Vitor Soares <vitor.soares@toradex.com>

Add device tree overlays for the Toradex OV5640 CSI cameras on Aquila
CSI_1 and CSI_2. Two variants are supported for each interface: the
current CSI Camera Set 5MP OV5640 with a 27 MHz oscillator and the legacy
CSI Module 5MP OV5640 with a 24 MHz oscillator.

On the Aquila AM69 Development Board, CSI_1 is exposed on connector J70
and CSI_2 is exposed on connector J71.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
Changes in v2:
- Reorder supply properties in OV5640 CSI camera nodes and rename clock
  node to match binding preferred node name pattern.

 arch/arm64/boot/dts/ti/Makefile               | 14 ++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  | 18 +++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    | 76 +++++++++++++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    | 19 +++++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  | 18 +++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    | 76 +++++++++++++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    | 19 +++++
 7 files changed, 240 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a8c2fae6a212..4f1a8375e554 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -199,6 +199,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-clover.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi1-ov5640.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi2-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-csi2-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-dsi-to-hdmi.dtbo
@@ -328,6 +332,14 @@ k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
 k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtbo
+k3-am69-aquila-dev-csi-ov5640-24mhz-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-csi1-ov5640-24mhz.dtbo \
+	k3-am69-aquila-csi2-ov5640-24mhz.dtbo
+k3-am69-aquila-dev-csi-ov5640-dtbs := \
+	k3-am69-aquila-dev.dtb \
+	k3-am69-aquila-csi1-ov5640.dtbo \
+	k3-am69-aquila-csi2-ov5640.dtbo
 k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am69-aquila-dev.dtb \
 	k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -417,6 +429,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am69-aquila-clover-panel-cap-touch-7inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi.dtb \
 	k3-am69-aquila-dev-adapter-panel-cap-touch-7inch-dsi.dtb \
+	k3-am69-aquila-dev-csi-ov5640-24mhz.dtb \
+	k3-am69-aquila-dev-csi-ov5640.dtb \
 	k3-am69-aquila-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-am69-sk-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..e7d238da8bef
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Aquila CSI_1.
+ * Used on Development Board (J70). Uses a 24 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi1-ov5640.dtsi"
+
+&clock_camera_csi_1 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
new file mode 100644
index 000000000000..668658d32111
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI Camera on Aquila CSI_1.
+ * Used on Development Board (J70).
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera_csi_1: clock-camera-csi-1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera_csi_1: regulator-camera-csi-1 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_12_csi_1>;
+		/* Aquila GPIO_12_CSI_1 - Camera Connector 24 */
+		gpio = <&main_gpio0 48 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_1";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi0_port0_in: endpoint {
+		remote-endpoint = <&csi0_port0_cam_out>;
+		bus-type = <4>; /* CSI2 DPHY. */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+/* Aquila I2C_4_CSI1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_09_csi_1>, <&pinctrl_gpio_10_csi_1>;
+		clocks = <&clock_camera_csi_1>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_1>;
+		DOVDD-supply = <&regulator_camera_csi_1>;
+		DVDD-supply = <&regulator_camera_csi_1>;
+		/* Aquila GPIO_10_CSI_1 - Camera Connector 22 */
+		powerdown-gpios = <&main_gpio0 2 GPIO_ACTIVE_HIGH>;
+		/* Aquila GPIO_09_CSI_1 - Camera Connector 11 */
+		reset-gpios = <&main_gpio0 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi0_port0_cam_out: endpoint {
+				remote-endpoint = <&csi0_port0_in>;
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
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
new file mode 100644
index 000000000000..76807176e288
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Aquila CSI_1.
+ * Used on Development Board (J70). Uses a 27 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi1-ov5640.dtsi"
+
+&clock_camera_csi_1 {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..607e1c76c86d
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Aquila CSI_2.
+ * Used on Development Board (J71). Uses a 24 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi2-ov5640.dtsi"
+
+&clock_camera_csi_2 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
new file mode 100644
index 000000000000..454ac120337c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI Camera on Aquila CSI_2.
+ * Used on Development Board (J71).
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	clock_camera_csi_2: clock-camera-csi-2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera_csi_2: regulator-camera-csi-2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_16_csi_2>;
+		/* Aquila GPIO_16_CSI_2 - Camera Connector 24 */
+		gpio = <&wkup_gpio0 39 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI_2";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi1_port0 {
+	status = "okay";
+
+	csi1_port0_in: endpoint {
+		remote-endpoint = <&csi1_port0_cam_out>;
+		bus-type = <4>; /* CSI2 DPHY. */
+		clock-lanes = <0>;
+		data-lanes = <1 2>;
+	};
+};
+
+&dphy1 {
+	status = "okay";
+};
+
+/* Aquila I2C_5_CSI2 */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_13_csi_2>, <&pinctrl_gpio_14_csi_2>;
+		clocks = <&clock_camera_csi_2>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_2>;
+		DOVDD-supply = <&regulator_camera_csi_2>;
+		DVDD-supply = <&regulator_camera_csi_2>;
+		/* Aquila GPIO_14_CSI_2 - Camera Connector 22 */
+		powerdown-gpios = <&wkup_gpio0 33 GPIO_ACTIVE_HIGH>;
+		/* Aquila GPIO_13_CSI_2 - Camera Connector 11 */
+		reset-gpios = <&wkup_gpio0 32 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi1_port0_cam_out: endpoint {
+				remote-endpoint = <&csi1_port0_in>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&ti_csi2rx1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
new file mode 100644
index 000000000000..d3279f373d32
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Aquila CSI_2.
+ * Used on Development Board (J71). Uses a 27 MHz oscillator.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am69-aquila-csi2-ov5640.dtsi"
+
+&clock_camera_csi_2 {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0


