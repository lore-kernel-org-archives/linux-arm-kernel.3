Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A85CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR0GOKqUKK69xFGpw8JrWZnRSOWzPjh/TNYLZAuisSA=; b=eFG1pEcrp4vdxq+EFm3kBeDpgs
	U/NEZydAU66g+H3F/+WTGRz/jz2hF/gUB44vI28YtjNdg8mq5VjSB4SbyLKu6KkiCvQbVb8tIoedW
	EIq8rlO9Jpw32I+weu/lLuMR8mEc/oWrZ5Ql6UJlEWykGNKlEiteClZ8D+9Kb+Ip1r2i7DeD1FlWU
	2H9K7thvTU49AAM12lWtguU8NTnYC0KJ70WxXdfk8nIShI5U7VNzRTHCJpKA2LrpYAPzaLLIQ0EX1
	qpI7O73rYxjIyM/dv01Fm/ogwcAxWC34xCun9I1CT9bayaDny4QkUVPnUYnq28hCyv+okFUnXFYGh
	wPeilXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw2N-00000007LJ2-0W5h;
	Fri, 29 May 2026 12:10:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1x-00000007L1p-3EO2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48fde648a71so92032225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056576; x=1780661376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR0GOKqUKK69xFGpw8JrWZnRSOWzPjh/TNYLZAuisSA=;
        b=njCehBlPmcMwO4a3iFeVTG9ymHiwnF0OlRy/kbnb65Vk5wMeNdqZxsR8uOisnEhJ6+
         C+iJ7KQpsbdeCpdVpdLqVsTBZVJ4RHX5gxsNXIXl+uOIngKxNpbV+1/88OTZKGdSOq3P
         iTxMr1qCwoiwaRbsEup099vVeSjfgcnKAjUb2rVZo/wYOKvzR1Rtxg24JdQT3zaLfhTQ
         rWGeYMjR9eq4wf5DYwoj1AqNizUmDfDKqrmZRzO6S+VCbG86eWmI55g2KxmMeLTR3yZB
         C4Z5tbXbZImwz0r7hXiGpB288aByhSmb/6p9xtDY41ubDABBHIpZCgUD+yCZn12oXBNc
         SBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056576; x=1780661376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FR0GOKqUKK69xFGpw8JrWZnRSOWzPjh/TNYLZAuisSA=;
        b=AKNAVim+BkfUUUguYkFLWN1gpk4Z6yeLoqRPRrXx3fVWfw0cZd4Jtn/i7tB3n4vleF
         /dRlw6lOWji1t1L3GeDylUSYL8w4qhdWP2LfYxZXHEuh/VmqvacGlFDwEfxjzrsjY7FV
         0XWZ7rC5uHBFu+2TRMEvwv5Q9rTA1vSF7ijX4LXTJNY8WW72lVKPTJMN0jkcnnJvnv3m
         9DPWOWfBsa84wE/L4Ev5pt0R4i3rFHEN3ibTL4X8FNDMkR2jSI3QKG6HfpAtmD48r0U0
         LjxYM8DuQr6EzKHK7Vqb+XhX0RhJlRvv5d0Iv0LUvcfRs21u7V5/E/Iv+TXVdzRt4N6k
         TFYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MEWMWHPIqUdD2QWyGxYCTCQzGB5K3NOdUPIJ5Sw6/O2uOVb1fYvIZmzanssCIHxCHZBjtGUwvKZuTP7Xs3RQX@lists.infradead.org
X-Gm-Message-State: AOJu0YxjKUymCw0m0OulupilW7VONnVVSXhEGHc9hrqzn/x0BpJNsQrk
	JOCqHmAzSLAiK4aecJKwesG8/n98cvz+tVyw+W9P9pddCt85KYQKN06g
X-Gm-Gg: Acq92OEcuEbWoNH+gCgjLoVwwltsWu/JdE9yrLQraeJOEZvi82Asklw5FF4ukfmjnMH
	tYlTNuX3atWXUU7/1fxF2p92RojR2+mc5H/pknzW41F4IwLS7ilpbdt3T0VVOUDEVbkdzXdhay4
	vFBHgbJmHMJxYcYbDWhYD6pYZ0mx7VaVenTEuKsO+Bp8neaKpOvc5z9rwGUpT3GQXExyiH1lUh/
	ZZbeZMMvRDbJXqKqiLu0vOiH34+XMIlubssgu03SfV8Kaxp3OwuHVnviDcqMSnx+qcmx3RSlpO/
	MflcB1xRlg+EdnyUzZ9XgAcmSg3V/dkMNWOQYMrxpXupB+Jd9evexQphc4Ef3+Rm1FLUXKt0Isn
	PlST11BPnu2YS2BV0+LbIHdxbF04z//ldDAJL1P2z3ywSIoSpg8y9YmnaP0x8CTsSoFVDIINJV5
	kgx9cFDtpTFtrsenvDvfttK/9W
X-Received: by 2002:a05:600c:3110:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-4909c2af1bbmr34673195e9.0.1780056575683;
        Fri, 29 May 2026 05:09:35 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:35 -0700 (PDT)
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
Subject: [PATCH v1 7/7] arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras
Date: Fri, 29 May 2026 13:08:59 +0100
Message-ID: <20260529120853.636015-16-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529120853.636015-9-ivitro@gmail.com>
References: <20260529120853.636015-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050937_880478_3264A484 
X-CRM114-Status: GOOD (  15.90  )
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
index db205afeb7a0..428b1d2e817a 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -181,6 +181,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtbo
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
@@ -288,6 +292,14 @@ k3-am69-aquila-dev-adapter-panel-cap-touch-10inch-dsi-dtbs := \
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
@@ -368,6 +380,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
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
index 000000000000..3ef3d793c288
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
+&clk_csi1_ov5640 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
new file mode 100644
index 000000000000..931bc5c9f21c
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
+	clk_csi1_ov5640: ov5640-csi1-clock {
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
+		clocks = <&clk_csi1_ov5640>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_1>;
+		DVDD-supply = <&regulator_camera_csi_1>;
+		DOVDD-supply = <&regulator_camera_csi_1>;
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
index 000000000000..40a8ad575dc5
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
+&clk_csi1_ov5640 {
+	clock-frequency = <27000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..8ee50adb7896
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
+&clk_csi2_ov5640 {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
new file mode 100644
index 000000000000..589666c2c043
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
+	clk_csi2_ov5640: ov5640-csi2-clock {
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
+		clocks = <&clk_csi2_ov5640>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera_csi_2>;
+		DVDD-supply = <&regulator_camera_csi_2>;
+		DOVDD-supply = <&regulator_camera_csi_2>;
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
index 000000000000..bcf597e9c5a4
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
+&clk_csi2_ov5640 {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0


