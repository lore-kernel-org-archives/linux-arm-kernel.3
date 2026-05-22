Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5B0CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=; b=dYRr7dCe9fnZfRHHB+dop9JCSQ
	BBwrfP5L5JofVXW55hDtDkKm+ooJBaweD8YT1S8+j7psgoTUr2ESZP2WNruYW9gzZVBZ/ylSqAZcd
	/Pp/l5jHdGIfkDL7GT58U/S4+9+t/vfTuVvmgysQx7BWCLq5/NLfxduQWl/qINRo2rdTR2fJ+buI6
	E8B4IiE/1UkEHXWGdNxOTzmeVmtufBwE0EqwUjuGJwywHW/XT6U6U6Fsu9L5A82gQ2gj2xlJSjPL9
	7+g/bQVxp5/MVPgnMf5WUfDFMizlIHe0WD7MIlJishQHYrLPtq8rVsVLvuZYYuFZhsZhM354Z06pn
	7llbNqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoK-0000000Awb5-27ak;
	Fri, 22 May 2026 13:21:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo8-0000000AwRA-1jwy
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:20:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=; b=lMRwWiYgrLTX1HUCi2NqVwbVsA
	kIYOhrIHxe31HYPW8S1acOwrZGFMrHv9GdZ3jVcTZ9cnrD1S3Uw7WGG9AaaZ0jDkx3iCIWme/kIwk
	p7SUnful6PWq0jA3rH99WkJImso7KYaSM2wyLZ/mb2jWLO1dkQgkQEmzhE/VJvpJNmBCXZO6qMwHR
	gERJsIlfYKD8s9ko5SdZikhMOp4X47hYiSgNBHh6VJsERFEZYHvWqLQJg0jZwiAmy38vk/rIjLzn6
	Q5azx5KQ4DrEMygaGeoh+Lvz6fpCC47W9J8hdNiXrIO2eASgB8d/WcYs/bfAQDpLU1LFVMJwRVoHO
	t804hGwA==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo4-00000004QJL-3XXj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d75312379so6169113f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456051; x=1780060851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=CIGIBvOE6XhQnjwJWHgTEdHEwiUnmtFpQjUYv2VAAcCWKIdbCRGpJqUkrsRCdeYS+X
         Hh1tpDezhVQATtp7Ojr+lUi83zW8krl6q1lny3lVn9MQjcPPJPfrKuswrc99+jwPwiwQ
         IcHAURZy0x5sBtQ42aUz55oZB/JHdFkQjuTxrfkL7ktVdBdcFP8IocRW2NPLjUEbU0XL
         F8jpHLqEaFJYIKRNyue93YjtfRxiFTo4CzkXVnloSgcvuUxxhzcuWq3Ts5M+j7TtXK0B
         egVki/7PUmoh9CH6yipb5VRRehhI0VwjilWovaUKNnMEDz03N/l8tXri7vM1aiSbBZpg
         hPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456051; x=1780060851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feqCuYJiSrJNV96kUr6v72Q4V4YTTvof+UmoeS01S+w=;
        b=HUxF1Jye17+7e7qNhbPq1B7A688C9sR4stsxf9l7apkYlGnS3JBYjrCj5lA3x7dI8j
         OHqL++c0fWFEHv51bI8irLObpdlBn940ibv51rIRMgeES+ZjRe0XJ8IVWU9UUChpuhmb
         Bcp4t1anZCffYtlUD/yEJXEJOv0GYrLuKSOeomuFdK6Y6zgy/eu6pYuXytGSTeCW4Sxh
         C9VzfUiqC8Q9FxKvp2AaXxPXBlirB69x3xwIjKmWai3EDvFGZfUc+Rjy9NPNOmCSY/Oi
         Ld4JMGGQ0aWr+V0j4QvsBNm/QIhOc91u4m0iNFgguy9h7N5IF8pgqlgQCf2w2nL/NrRE
         UIVA==
X-Forwarded-Encrypted: i=1; AFNElJ88QSfdu3liGZVTU/zt7zXt5sdnlJGotVKgfWu4c/S6m9RYTOgUEFSouid3UoDYxC0ZYV4bGiacW6BZAQis7Ho3@lists.infradead.org
X-Gm-Message-State: AOJu0YzI3S0vCaA+BFyEn8bw6CqrusHN0IQ9onk7tJ4K+Zos2n8UDwVs
	1J38YFYTOzjTRCmmqpEBhPfDzjxp7P1czVo+OavGnIaRmWptxPJ5pVCe
X-Gm-Gg: Acq92OHGD533jAcil+IOV0A0IN3+w7j/jGVtpQoKlJmMEikUUgUY8T7qlyTfKtcypoQ
	rYOm4292lM/oiv+CCmsQjr9DU5WeHmeC1tbj22V4cQW89YxfAzQ6DjTICDzm11OkgZfrTL4Kdaf
	PTFf4z3Dfy/uRay4I69QPc/sKagob3+JdzuQnIJ4Yom6sXDHDonHDitL29fqiqrg3XrU+ADHVI4
	+tlNhZT1FAYHgguhv7NmuN7zoaXiqqr1ZsgMIdv+Y0IDFmQXvxbk96xaBy6SJEE7cwq2y4w6Ok9
	zTY/wednCzUh1jXBBnyiSgYSveEp0KZ/DPq+qMTOtCWwvscq55MO4G2n4849WvAYI7aYUdgdrjH
	pXWLgy2UGKloJDrZvBotjpWuxwSP2PbPEnXDGIutyYi0vR9wlyqqYbwVbpCJN3aNZF0VdogwrYN
	yKSh0p7OSZ6XvBjxOdf1jgZ78tUkojyXWx+p1VcYqAxtgEFB9C7JhI
X-Received: by 2002:a05:600c:a402:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490426b0c92mr33094865e9.16.1779456051266;
        Fri, 22 May 2026 06:20:51 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:50 -0700 (PDT)
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
Subject: [PATCH v2 09/11] arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
Date: Fri, 22 May 2026 14:20:22 +0100
Message-ID: <20260522132014.226721-22-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142053_304304_38FBE05B 
X-CRM114-Status: GOOD (  15.86  )
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


