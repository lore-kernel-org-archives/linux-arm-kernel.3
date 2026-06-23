Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AF0CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/fp9uYhKIZVODXjBwNwAyAJlbCISy/3icMoMCSqHfo=; b=vlgtTYV7DG0vT0WcmjRYxMRbXp
	ZcPxBkULC8LpMb5Iv1JlebPolesNiYh0BEq+j74/ocPuDZLulfZ0eMM7MMatY0kG6xcWxBZqls1DD
	dVRbbO2XMWb5dIRyVIAPLjHkW0KQIpu/pBCEVev6d+1PfD6zBekuhpeEGznueAZwgzddAYa47mCCI
	2ALK8RH6QKH1vN6y8ZAAx3gHqm9opL4CmQmYR/tl5y356kF4q0lKd5B4mSKF23XPDMBqah6tOKbbj
	odgV7DIpqUZRViHNJhCXU8elinNk1yXP9ltCz3yWaEGIS/dwLmMMes45EqNreS/Ku5wuhuPxnHCV2
	MZNuXhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Go-00000006oan-225A;
	Tue, 23 Jun 2026 19:58:54 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Gm-00000006oZn-0RGe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:58:53 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-13810b63a1aso585010c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244731; x=1782849531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/fp9uYhKIZVODXjBwNwAyAJlbCISy/3icMoMCSqHfo=;
        b=EJsFO7trH8iFRjVcv9+D+YP6qQftO3hhZ/9c6rB+jo2ovNdpcX4+Fx/VLAA8ABcuFh
         H2QZyvRTSIHBLrpf3QOW8LxNO/qR29tAGADyq6MGJvqrleb45RNIOIjmZ4yr2DurWvEc
         N1M94eqWwBuii8yzs5ZORwlUu+PKt0CjYhVQjMhclTkaXFtm7F4Oi1dHJpY9jOKnUsiB
         SOsgjHxfNI+47f5tUBuSDHVC/Q0qJOwvh/FqcuHiavQygmqG6aYLeG0Eig8xv8z351+a
         7A+hpg3HcYteDUwFODSj6LmC3QOrY42CzpxMdDw+ghbnAdHiAMs5ChR+78k02X4mDSmg
         4lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244731; x=1782849531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/fp9uYhKIZVODXjBwNwAyAJlbCISy/3icMoMCSqHfo=;
        b=qpTY9ACVOd5lu+jWppRw3+gHZxmp2UzKTqB4VbLbUSc9voGrrm/MgVIK9pSUDrhBX8
         vPsOjOuUxX1YK1M58/JRxodsXiVK8eQcQoiGEL1PtQi/Bbkb6231zQvibuhwftdm+ZMs
         7BPy+Fe15+HpC3BauGQ+61gX8tjP4w3ZNhp0P75BCM8ywu/znHnY832qWmZ+pVTL2zY5
         jC07R4Lx7l2PJRdXsWQ8qxC6JGA83cjLCZs4uMcLfskRADpCLlAxD0efHNmcOoABPdc3
         cC3lP2i0+RFW2JL6M3DIXgnPxzmVBxXjEQBqDu4iLXdBAkL7a8rXrxfaIvnVRq6bsMtb
         3/cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QCsPFwa3u453cH04aJ4I+6kh4IHefPFyTkq6egNp+rXQT7yd77Bzw88mk662yR8blLu5sodJreFoD/QYs3lKP@lists.infradead.org
X-Gm-Message-State: AOJu0YyM2R1XydO/BQJv4rGvIFTNYBwVdRJXbMol/eS1RfO7R1LUSBMz
	j8UFza0pHNJZEMB22TZOdrqeSIY6xdWq8kyNjQ06e5xqWb402RKnk+u9
X-Gm-Gg: AfdE7cmXqGD22M6uVk0n3/ogF6O/v57UgajU56lCmsOLMRfYEzsldMAzc7QGYV1D5At
	/oCCRQyMrKutbwgQ+NJVDo3dGxa4hkh3xbqIp6AFFHcxFCdfckBEZR84KvGC8qPf7WzTXLFOV4P
	ETBh+NWNHG4DaKgviEpCiaaKZ1DU9LiLMeeOtjS6Mt+7FBzvuN3nEb/1AIvNb2/DbmI/kGKKHyJ
	mS0PAO+1kCkb0SltWU8vt5pGYyV+zCY78S7BTAQexzVhBPA0ACaIVokakQfzNioGacyZpgTDFKo
	HZzvyswdntgeUFcwQVWE+y8aMWkIFjhjYIVRilaBeycqJmvJqW5RRDb7QsnzWRU0FgZ/HmgM9vr
	CQ/u8YxkpuPiTECI84qphEqRoIwF0NqvJHWUAa31jbwNCZKLGHzcgBfqXRnXDbelJn3FUCTcTD3
	h0GdE9KzMSsFPmXkAeqmjYBWVJ462pF/+LS+iFyabiB9m+NfGfpzbiV88NYQ+85amZ/i3RgOWoL
	4/eHX2/93wzppTp3Bn5HlJ2wGFa4SX4b+aitf75U2E=
X-Received: by 2002:a05:7022:4397:b0:138:5ae:3eaa with SMTP id a92af1059eb24-139ad6961c2mr13263116c88.9.1782244731170;
        Tue, 23 Jun 2026 12:58:51 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:50 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: laurent.pinchart@ideasonboard.com,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	thierry.reding@gmail.com,
	sam@ravnborg.org
Cc: leonardo.costa@toradex.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display 10.1" LVDS
Date: Tue, 23 Jun 2026 16:57:41 -0300
Message-ID: <20260623195741.495734-6-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125852_154164_2CA665BA 
X-CRM114-Status: GOOD (  14.45  )
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

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin AM62 Mezzanine
expansion board. The panel connects via the AM62 OLDI0 on the Mezzanine
LVDS interface (J10). The panel is an Opto Logic SCX1001511GGC49 10.1" WXGA
TFT LCD LVDS and the touch input is provided by an ILITEK ILI251x
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 109 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8b90fef11cb32..d9e0b1b80b28d 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -240,6 +241,9 @@ k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
@@ -362,6 +366,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
 	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..26f6715463986
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin AM62 Mezzanine
+ * LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO_4 (SODIMM 212) - LVDS_BKL_EN */
+		enable-gpios = <&mcu_gpio0 4 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) - LVDS_PWM */
+		pwms = <&epwm0 1 6666667 0>;
+	};
+
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight_pwm2>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <64500000>;
+			hactive = <1280>;
+			hback-porch = <20>;
+			hfront-porch = <20>;
+			hsync-len = <2>;
+			vactive = <800>;
+			vback-porch = <5>;
+			vfront-porch = <5>;
+			vsync-len = <3>;
+			de-active = <1>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			pixelclk-active = <0>;
+		};
+
+		port {
+			panel_lvds_native_in: endpoint {
+				remote-endpoint = <&oldi0_out>;
+			};
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+&dss_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* DSS VP1: internal DPI output to OLDIx */
+	port@0 {
+		reg = <0>;
+
+		dss0_out: endpoint {
+			remote-endpoint = <&oldi0_in>;
+		};
+	};
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) - LVDS_TOUCH_INT# */
+		interrupt-parent = <&mcu_gpio0>;
+		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin GPIO_2 (SODIMM 208) - LVDS_TOUCH_RST# */
+		reset-gpios = <&mcu_gpio0 2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&oldi0 {
+	status = "okay";
+};
+
+&oldi0_port0 {
+	oldi0_in: endpoint {
+		remote-endpoint = <&dss0_out>;
+	};
+};
+
+&oldi0_port1 {
+	oldi0_out: endpoint {
+		remote-endpoint = <&panel_lvds_native_in>;
+	};
+};

