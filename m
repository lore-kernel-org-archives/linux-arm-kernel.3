Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C09CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=; b=sStdWGxS6yP0fxc5V3C7y0v2hc
	eVFkKlvCmPZavUc6zn0+iLkMDb2yOYv7AoUaNcsGyuH/jC1qUWPLVt+0uetheI73N9Tv2KWHnlQMh
	TzbGZQwxSlOiekFAKdeILqE7Ne16M3Qgh5rLKOaNwPBheF0qmgn63OyLhYw/gLsm8vlHyYtM1z7RE
	qdNPkwg3K8u6Qrf9deVge5kpb60Oyox/hom95JzhOYCbi+m/nXWW3wGx7kT1XqOEUqIwX8W6pbJpx
	COB6kL78iAT97F0or2T+YrntP7kg5Tow7rzcfPrNXQBDXXEd/cLJM218pfKHro6ShRTaBWA+7W+Iq
	UnBIiXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTl-0000000BNwy-0n3L;
	Fri, 22 May 2026 16:12:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTc-0000000BNov-3l9H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490426d72f7so9559805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466315; x=1780071115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=gnJf/uGeBOhEKZdT0qbAZ74mzNDAzEeMcCGeiuweShJMt98XX2RsTxJQIwIGnoFHEn
         xGBu34i+wV+0ZLWFI4itsSH0vuuj68OAZBLlDRxZzWSmVv36tvQdxA3WM0WAIhg1SOPZ
         38sx9OXmYldOlerQL+/gyxvnbmAAoHcUxMDt4bzsuEkqzkqIRe6PcdNqAQyhZsvfSO4h
         qpN/YAtqaplR1tgYOUZIs1QGRReIuGo2MTWJljyRxJEXY6RXYrwLXBg2AvIs+8tiFT5+
         SI6iE+HPph0VJVpFG98O8nEyUSpAqqmWuiA4tulx3UCRyry5/vj2soN2rOxHc8tSywRr
         AhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466315; x=1780071115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=ecPwJsTQNQ6MxV6M7egqgJYHoizYnsRth/GWKSgiaQkuLKV64Ewh/LcqsL16kHltuk
         zIN4hF48VJgIQm5hHP9TL5tszHGTeoMfd9GFmMSbuJYJJz2RCP+5QgvDpMWyrJ+SrLzB
         emXrI6GN5mQli8Y1cSxA/oOwCZ+V/B17f0SIR13YtcNmP08xESdMPcVZgD9m05OoLyyJ
         YzzE2vZtxjCwR8zvVNwIUJerdLibj4YWAl7Mx6UR3iUS+kDoHJXHcCq1oQZVZtju6e6n
         hR+xkchZF01oi1eHY267lY91fxT2j5p3o0EnXGBUu6p7+O0JVl8e3cjl7c7cz6OwWu0e
         BvOA==
X-Forwarded-Encrypted: i=1; AFNElJ9gmMKBdGFsH+aGV8hxnQ63Vh+tslI+iuXvKYOWWouFT/zo8oEQgwhA6MWIoEEgzL1Ch0O8Oplr92155zFV3tzE@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6lBVoElqdEPBv6LaKE8xDofccoOJmae+Oms5KWk9zObRZWSVv
	JE2443nsGMGTMhzwzOEXaKwdn25KOfT3RV4SH241LfVT45p4SXHbaXQA
X-Gm-Gg: Acq92OFTgw6BG76USVybF2tGoe2srtxCQ/J+Wwr3mWyYrsbQOvs2R6o9rQYQwz6OvrE
	BiMRijDlZyzV5mf3weJFMYpAhbNowznoXVuHbK9VuJ/8v+IifKTimrNkuS8UgSAAssExkp8cIQE
	UBkShqoDuqUIy2Y2WWyMkg52WZeraKF5uakS0PWbe9w+5MTvj+USvN8H1bKI6IpPWSNrLVCUskS
	CrW7b6dd0IbJJbitA1BPOMB8QNt+1E5mgf4V5VhIqd2d054X6vUu2UCnbKPYs8fO1cXksZMOLzL
	RuKHsj7iac5cX9blyTrhEShse20Ad3KmWS9Rn0rQya4r/N8hcabZsxOMphL8nfuE4Qu5dD2b17c
	A3+TZHa/rYVJ1Bg8N1I2UUdRZ6nYdKQ/2iA26kEvZO9/6lL0V8AlWioHSeMwsioEDP/Zbm0HUox
	Jg57WyYxA6HQnbD+m9YgY4+CZEU61GdLvqTAkVvdXDig==
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr61481075e9.22.1779466314619;
        Fri, 22 May 2026 09:11:54 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:54 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/11] arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
Date: Fri, 22 May 2026 17:11:13 +0100
Message-ID: <20260522161105.277519-22-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091156_961758_BC485BBF 
X-CRM114-Status: GOOD (  15.91  )
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
CSI_1. Two variants are supported: the current CSI Camera Set 5MP OV5640
with a 27 MHz oscillator and the legacy CSI Camera Module 5MP OV5640
with a 24 MHz oscillator.

Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  8 +++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  | 17 +++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   | 71 +++++++++++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   | 18 +++++
 4 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 31c9bc1d48b1..60844951c9ce 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -41,6 +41,8 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640-24mhz.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -228,6 +230,10 @@ k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
+k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-ov5640-24mhz.dtbo
+k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-ov5640.dtbo
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
@@ -339,6 +345,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
+	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
+	k3-am625-verdin-wifi-dev-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
new file mode 100644
index 000000000000..7089336fa5b4
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
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
+#include "k3-am625-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
new file mode 100644
index 000000000000..eb3df9d85517
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
@@ -0,0 +1,71 @@
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
+	clk_ov5640_osc: ov5640-xclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	regulator_camera: regulator-camera {
+		compatible = "regulator-fixed";
+		/* Verdin GPIO_8_CSI (SODIMM 222) - CAM_1_CON_PWRCTRL */
+		gpio = <&main_gpio0 42 GPIO_ACTIVE_HIGH>;
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
+&main_i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&clk_ov5640_osc>;
+		clock-names = "xclk";
+		AVDD-supply = <&regulator_camera>;
+		DOVDD-supply = <&regulator_camera>;
+		DVDD-supply = <&regulator_camera>;
+		/* Verdin GPIO_6 (SODIMM 218) - CAM_1_CON_PWRDWN */
+		powerdown-gpios = <&main_gpio0 36 GPIO_ACTIVE_HIGH>;
+		/* Verdin GPIO_5 (SODIMM 216) - CAM_1_CON_RST */
+		reset-gpios = <&main_gpio0 40 GPIO_ACTIVE_LOW>;
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
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
new file mode 100644
index 000000000000..e7f02cfaa94f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
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
+#include "k3-am625-verdin-ov5640.dtsi"
+
+&clk_ov5640_osc {
+	clock-frequency = <27000000>;
+};
-- 
2.54.0


