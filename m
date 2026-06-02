Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF9DCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 14:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJTNSvGmNlfWTZXTUtIjd3Sb6+df9HO925pTn2aF+ec=; b=2k9MErXmC6ADbrXoumJOu3tW2D
	204F1zTydoKFjMLHhXUbJ2RKDWYJydRsVwl8OOAjW0+IEH/tNuF5rj6qO5cbt10xMBQhz8iDaDjL2
	Ks52MtGwWTiiY+S7Wb4GJbyUP0WWYtCrQJEcX5O0lZmV+gbi3MCVRg8RlI/EFqYRM6DUVMJ3blq/x
	40bvmbbxbGxY5q5U4J81itugehWkZ5ST4CVuIBke1OZSxc91oB5wW+NfmOIsvjI23GlkkebsXfYrg
	z9BhfhL8BiRpigUlUTqmO0Qjr61AC74r5/68EkKqk5qXbm78Jopvy8w78uZTBYOFftN+lZRvbtfiP
	zK41u0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs9-0000000D9wZ-1uNG;
	Tue, 02 Jun 2026 14:13:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUPs5-0000000D9t5-1QzO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 14:13:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4908b92904fso61990965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 07:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780409611; x=1781014411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJTNSvGmNlfWTZXTUtIjd3Sb6+df9HO925pTn2aF+ec=;
        b=iJQ/8Amp7rYHRyQCxAKHQK+WkpLz4QieIjgLCraHkiFFs5HV9bbRR4YBiIlDm5n9wn
         puwKvZ0/5miHPBf2SDU2T2Iq1XxgQn2yPazmlwQD9xQCwypuxF/GzZXyDh4CCKzvHtGI
         02kP4YNVr5naOuRhIG3VYhphkt6yl7kDnLiB3GyABkOXpr/aNNFm9/3vT2sFbBk+naHR
         JuP1zpG5JWlmMU3idQ4I/zF9IQm+pXYpsuKhBQb/k9sod7ywrbQYmpk2dzXwU9VL1b9t
         YSoiDQ2yy4joKWc905fql17W6isAaAD4S96imHVB3BO9z51uZqnntpxnfkRkA2lPoaTK
         aVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780409611; x=1781014411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJTNSvGmNlfWTZXTUtIjd3Sb6+df9HO925pTn2aF+ec=;
        b=tRwuj3/uWpK5sDSyHUy4P5RFIvdWNC+ZOQxeYbrsN7BO61KKrNoEI6X81o6dqHye/A
         F5vDKpeXBwrG7mQiHduvFxI+3x/yCP4WXBcVs4Af/yjbFL0MliItiljJr9DQHX2E24xM
         akc112ri8u2o6GEJj9Sh/oRWHchL3HZEBBD1Zn0UC1f9BEiHUd7Ex/KQULsFElUjsM+U
         bS+iC6+ly0PTaOnCuXPRLKogz5wQv5F+eFQIuDZDBqZ+O0jqeTMPSEo6yEVc7ov4DuBw
         mIyuaTLdchYy0arWUtnfI/oYj9CJa2fJ3xyLvTN65k7Rzd7SPrMYsiMgcyDBrZVJzjJ0
         Fffw==
X-Forwarded-Encrypted: i=1; AFNElJ/lLL4vAKO3hyh7qYFip53RfTWli9rYo3fYYIG4yj6ex+hLRHE0nxHOqJVuoNwjpU9y8XRNe53JtWahb5O2qES6@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFGVLVBQjQxPiwZTwoXP5enFigf+GddMmaBpxPnnb5YZONikJ
	mNcz3kVJP9ReAxqw0HdQA6g4C3SQiQtJRsw+a5sB2y9lkIa1e0DmMYQv
X-Gm-Gg: Acq92OHpiL1Efrf3493VCXtWmWiEX10n+ekluHvXebd+7sUxu1bxUBmd5cN7gSTgDxA
	kt9LNM15gsZiiFZXHzJGSuFRe3dTJVZAGJyM8IXlQ8LHmahgTR3jhwzyZ3D8iRsiLeViEf6jdMj
	WPP9oyL75u+jSF9aTi0vKD5fqkpgiApARIkvPpgEI4TUpjEc5azycS/WSxXNa2S7NrV1dwkQasG
	lz5F0ZICSwuU2JGN2ikHMYGZPWWOS651RDK0yu2otXkldIIy/I+bTWaR6VncV4zHD+bsTRUZbnw
	4SVAJ+sfyRP+qKWtIyTn8TYATPPZrn6pFBaRDvvhe2enLU67cdwvX7QHfIJonaZp8HfO80tvh3r
	i+T0Wce6SfnP9fYUAueamTtC8ywGPCTb/F3vPrBPtEpjEdInwfMN55DBUlLZd3eT0uAGrRPEkov
	5jKY6/3zjcTwAhYGZi26qsEAd7tg==
X-Received: by 2002:a05:600c:8b77:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490a293a0b1mr331988825e9.16.1780409611329;
        Tue, 02 Jun 2026 07:13:31 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:e8c3:a961:5b26:a2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e0de7bsm60816345e9.3.2026.06.02.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:13:30 -0700 (PDT)
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
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
Date: Tue,  2 Jun 2026 15:13:13 +0100
Message-ID: <20260602141311.1366818-8-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
References: <20260602141311.1366818-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_071334_051541_6ED605A6 
X-CRM114-Status: GOOD (  15.78  )
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

Add device tree overlays for the Toradex OV5640 CSI Cameras on Verdin
AM62P CSI_1. Two variants are supported: the current CSI Camera Set 5MP
OV5640 with a 27 MHz oscillator and the legacy CSI Camera Module 5MP
OV5640 with a 24 MHz oscillator.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  8 +++
 .../dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso | 17 +++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi  | 72 +++++++++++++++++++
 .../boot/dts/ti/k3-am62p5-verdin-ov5640.dtso  | 18 +++++
 4 files changed, 115 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 27a56abb1d7f..9fdf4f1452c4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
@@ -278,6 +280,10 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640-24mhz.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-uart4-mcu-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-uart4-mcu.dtbo
 k3-am642-evm-icssg0-dtbs := \
@@ -379,6 +385,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..1da6329065e6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640-24mhz.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Module 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..f0430b1efcf1
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtsi
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common device tree include for Toradex OV5640 CSI camera on Verdin AM62P CSI_1.
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
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CAM_1_CON_PWRCTRL */
+		gpio = <&main_gpio0 52 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-name = "V_CSI";
+		startup-delay-us = <5000>;
+	};
+};
+
+&csi0_port0 {
+	status = "okay";
+
+	csi2rx0_in_sensor: endpoint {
+		remote-endpoint = <&csi2_cam0>;
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
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clock_camera>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6 (SODIMM 218) - CAM_1_CON_PWRDWN */
+		powerdown-gpios = <&main_gpio0 50 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5 (SODIMM 216) - CAM_1_CON_RST */
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
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
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
new file mode 100644
index 000000000000..2e90aeb448b9
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-ov5640.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex CSI Camera Set 5MP OV5640 on Verdin AM62P CSI_1.
+ *
+ * https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
+ * https://www.toradex.com/accessories/csi-camera-ov5640
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-am62p5-verdin-ov5640.dtsi"
+
+&clock_camera {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0


