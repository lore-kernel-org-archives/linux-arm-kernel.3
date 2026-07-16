Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8DC44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67zSFNzLZlVLDtB25uadYMFOipvoKKNbLkgSRU7ta/Q=; b=C4MYGVfdxyh7I5g6EXkzmu14sE
	L6LH6aGjWYUkSDZY7Okc2UaEwyFmqvAG8Y7pP4N/c9vM5CGTlBEMc95ik9xMotgVoXcfrlBFESKlx
	zbbuJIQdPvt1JeiV/zylCU3hCLP6l2nwD7pv37qj+JxV0ikYbrUcyGvABpOsjdDlcqxAjVsgO91s1
	KWsOqI1BvqLLtTvCHNMVwGYnF1G76dhL9UuURBDSu31PtGpbZ8tNqQ4Pk/fQODxNKicwnEVeult4B
	sUM6m+ocTVK9MQDCdSKh90Rs2xcLa+P/FAlhMoTINWNT4lS2ITZ/xjWOmQeqziDZegCAtUc64ZyuT
	thtfN6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3M-00000000PvW-2PyW;
	Thu, 16 Jul 2026 18:43:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR3G-00000000Prm-2qpW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 18:43:20 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so6177715f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784227397; x=1784832197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=67zSFNzLZlVLDtB25uadYMFOipvoKKNbLkgSRU7ta/Q=;
        b=EyoiUHU4qwXVmY66O+1+7PcUw1YIJaFugV/r+CU90z4obXEgkRKIfz81BF/hsxC1FR
         wgEzutuZefbrb3rSQaL1GyyG2mf0eY0qGMRtZU08hileMkyh+YU4ShoXcuvjmjQwM0uD
         1DwKfRt2xekeoNXbUUa6l++ktAWvSUXtLrbiU3RUnXYRL4czYfowrEbwyL8YPxFfMycC
         URjs+lVCrExGqty2BIUoLQx6PWCs8RLreSgVWrqwgxXz2gpoeEWkEdBotqjwTsDMReLz
         30n/KCNR4rWq8Sm5qL7OU0CxjM8NE/+PR+OFaxMMcYnud6GWhAe1czKkrIFnlIuq0CzP
         +w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227397; x=1784832197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=67zSFNzLZlVLDtB25uadYMFOipvoKKNbLkgSRU7ta/Q=;
        b=qKVTjyPmsYjwdCJ+7CQZ8YYvTcOHcuvJD/+25m6JG0XmGl94dgwDFC2XhLF0gF3flP
         rJHaWJnhkHPMRokuimQ2iMeaE5CB6gwtXoEu1FhGpWJ5Jj+Yhygf9ixas4a6ED7eBMm1
         mH/AfL+Ohdk0sNdAPpgZu8VqC/cqVvDhg8fuISIOuTmN3i960cLmZf1id911NPhCB3S0
         V30SHAAOhEl9HCIOM6XA5wlcBI6gGtVJq80n22Dm72VFltanbYstZSALY7oMF7HmaV78
         J+1SUDWcgqISlg3lnGcrq+15Y2bmGtCtqpcAyXTmFcRmB7AcW4KsuEFAa+Kf0URCaC0a
         /ccQ==
X-Forwarded-Encrypted: i=1; AHgh+Rru+IsGorGrhg3jh3P6OaG91kW2Y+dt/+gETN4v6zPV/b5cdbmAa6hg5Ezlu9Gd3+M/6KXjqC0+DMraLVwKHuco@lists.infradead.org
X-Gm-Message-State: AOJu0YwPzPukguJgoT+5UkDwbSl8xKBtr+hRgEkWAZyhDOB7AcBf5Wuq
	7xS/7pFUqQ1yva90rw4i6FAPvF6qp9TikZRg5hlPSjvW1yNMa9WlKyXT
X-Gm-Gg: AfdE7cnPBmvYLBIHDgT0AEeaItNgN+3VHLN/TK7pLSHKLcSMq0nT0zB/tAsjqbjExGY
	yHtANX9mYdYlIqREVS3V/2lTrTco2Ztj7WoYBomVhYb33waxOzVy/sEczF1vi69gZ6RDByS7fsu
	TeqmhqU7hocvMxTxfebBc7EwX4WgXi2gdr+ZyQP6XbFELQnHs+voEiXuLIFLKIyBxb+ESVR6bZ8
	KMLzlqI38HdFswb7ttoAWPp5O0nAVqyTfviOhsT1jQ9nn8RDbYRSu+uOPvxTip6/xFJabjIqfDE
	/nPFdAfwmZZv2eGPXo1IIkPdAcLvQzlS1ULBmvQohQa2UMaQLcu5lxyTbWZn9sn+QXmzHiIP1uL
	d5pXKWbhDxXREaxdi1QU6ej7SE/f1YbKRnTswHlONV2fUMv62U5c6zzGkpNHrRZ5cxI88eQ==
X-Received: by 2002:a05:600c:4e93:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-4953c286bbemr98229355e9.26.1784227396788;
        Thu, 16 Jul 2026 11:43:16 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:b22c:3845:cef5:c42f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e7d799sm72404615e9.3.2026.07.16.11.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:43:16 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-am62p-verdin: Add Toradex OV5640 CSI Cameras
Date: Thu, 16 Jul 2026 19:43:01 +0100
Message-ID: <20260716184300.85413-7-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716184300.85413-5-ivitro@gmail.com>
References: <20260716184300.85413-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114318_758849_2117F70F 
X-CRM114-Status: GOOD (  15.16  )
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
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
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
index f2db3c878993..8541e43d24b7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,6 +84,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-ivy.dtb
@@ -277,6 +279,10 @@ k3-am62p5-sk-csi2-tevi-ov5640-dtbs := k3-am62p5-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am62p5-verdin-wifi-dev-nau8822-btl-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
 	k3-am62p5-verdin-dev-nau8822-btl.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640-24mhz.dtbo
+k3-am62p5-verdin-wifi-dev-ov5640-dtbs := k3-am62p5-verdin-wifi-dev.dtb \
+	k3-am62p5-verdin-ov5640.dtbo
 k3-am642-evm-icssg0-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg0.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
@@ -376,6 +382,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-ov5640.dtb \
 	k3-am62p5-sk-csi2-tevi-ov5640.dtb \
 	k3-am62p5-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am62p5-verdin-wifi-dev-ov5640.dtb \
 	k3-am642-evm-icssg0.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
 	k3-am642-evm-icssg1-dualemac-mii.dtb \
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
+		bus-type = <4>; /* CSI2 DPHY */
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


