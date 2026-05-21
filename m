Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD3CD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2nNvQ/9QzF53UePGdmOGFkUv81LpKRUaMuMcSzTUng=; b=Dkvq7cPt7F1PN5zFfE/igbPnlk
	8H+qtszREOTl9z32waHRJBDVo8kblJIkyRVq3ecPQ/MYu6CaNP24wVLXYS/Q3svtio1iMBCRhfUY1
	ZZvV1kZ/sIIWEFO7VlTe7d9vlrYPwR4nACJlo2NLu1xf/NmuPQ6V3orMCWnMM56aQcpVzVatFw+jd
	PGZ35baxhsZuuvt98/pbPKOui9deNHT2nonwMXbfQZS8776Lc9bTlLRxfzwiWCWDM5IYeHQymhP70
	w0zZFjjU3E1qn5BBMpBCVHjcLjyuk3m4/nvllvQg4EPnYU/ZA++mgm14Gu5BiOD0EbV7De/AAXDPD
	RWfXZ4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4td-00000008DRh-3CCC;
	Thu, 21 May 2026 15:01:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tX-00000008DMf-3Bzu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso56022845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375666; x=1779980466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2nNvQ/9QzF53UePGdmOGFkUv81LpKRUaMuMcSzTUng=;
        b=HYrHVBh7sTTZZXCNwHSrxTgEcXjCr5J8nAXs/bgu4KaVDRSR9nykeZFwsBDD4GoYGV
         tRtm8XMC8FXXLCkOtEQFLfAvkU0Ri6K/ppyR5Oqlx65En8z8PNyj1vQdz/E+hQeF4lOl
         AyOg+7RfBDllCHa9xr98AyA/udRoYAXxWvy161Va7M7sTZg7HRW2LRknnF/YOyjW2Kpo
         aIL3JqOYhKo8Ac6GhIZ3v5onrRL6LiRFtwioJ+M3Lee4tORZcWoBAYcmDo3uM6TpmwLS
         EgIryzy4uKXgsmTiPADILEheIfLmMzuh28njrDyg7xsgFHg9GMyrl44AC4+cK221fTYH
         5mSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375666; x=1779980466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2nNvQ/9QzF53UePGdmOGFkUv81LpKRUaMuMcSzTUng=;
        b=I2O9kaKI2h9VFWGMvM4PLXNXyQhJflo5yBHcNAfPD5+59Oa4RGwO3Z8RMXMmYBZyxf
         uuIIlhqKgZDVh8m3G+m799DdudzbFYY3/Jb8j0sJXD1bOwzkYLmejCKxIALe4bNrpPuc
         iMgt4tXJLB3GK5pNsQatbzVk4y+Zed5saqZ1fo4xfGtI7dsHZjnwOIcsiJIUHFTNUm2Y
         FM/NQAXko4cEEXjsff3Kl1V9W2w4OG+e8ggDr8Y1r28kOp2xo2loqS1dZrfAC3CBEZAk
         L1zU+URWgELboFjaJsx2gfp4i5d0KwSqI7ou/fm/F1S3KiRfgfGeKhVvLxP2e3qWdn/C
         cd/Q==
X-Forwarded-Encrypted: i=1; AFNElJ82FHBei1zB5qHKcmCZyWmNGiwI6QmDDewHfW7BpzpOOHPQ2Hjw8PL84a+RBpCyWOoByy84cZFh+aWQe+FmCoVt@lists.infradead.org
X-Gm-Message-State: AOJu0YzLyXTq5NhI9lim3d6m6X9DzmVtQ5aeb6TCfYesufzNHuflbPJ3
	U5/2JON9qLKSK2zXSfL4kwb3bq4h88MXZzwgvzDoZGVinqOpXFbE0oS3
X-Gm-Gg: Acq92OHLptmbwwFs1TQFqPbgqJFP0BlVhLMNfYgrJv0VhBVhF1mi1wr0U8RbaJgJm79
	kJYfNMnQlgQsUA+HMyp9AcGq43gJ5yDwhS3Dv/U44jisT3GDTn7TiAVLu9UIdu9jsy7d4+wcAHs
	KA/oMGf5N18MuXdt6Tdv/S3iRbc9+VlPOnn2WjdlF9HNQzJCduSLGpL0KrkV9WGV+GKcBJDFeG8
	4pUB7F2307GIv2Awc3jaZ4/f2oapROkLBFngQf08ej3NuLPOk0hZwuZ1FQPNPKXeL8j9pBDeZwB
	b+y0RhesEgkPcOr6x2bKJmR3hL+pqbnKpoM+TxY7xgtKeldC3SL6IqjW4fBhF6pxERdaGTu4iMi
	98HBFg7zJ6nopAvgtujBk6srdaYYAoRxIzKPDCYzo81RkOl3UOCHxBhFUDnUtzbVR5x3OcCiMm9
	SvBQOm6xpJFrlxUSqA9P+opaAd0J8dCQiX48Q3rgAtmQ==
X-Received: by 2002:a05:600c:4d82:b0:48f:e230:8caa with SMTP id 5b1f17b1804b1-490360ceaf7mr29173645e9.30.1779375665343;
        Thu, 21 May 2026 08:01:05 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:04 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 03/15] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu, 21 May 2026 16:00:39 +0100
Message-ID: <20260521150038.103538-20-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080107_898926_698B8AC8 
X-CRM114-Status: GOOD (  15.66  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is a LogicTechno LT170410-2WHC 10.1"
WXGA IPS LCD and the touch input is provided by an Atmel MaxTouch
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 131 ++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index b2408f62c139..867c05b675d1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
@@ -213,6 +214,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -315,6 +319,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 000000000000..893dde0e2e2b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
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
+#include "k3-pinctrl.h"
+
+&{/} {
+	backlight_pwm2: backlight-pwm2 {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&epwm0 1 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-native {
+		compatible = "logictechno,lt170410-2whc", "panel-lvds";
+		backlight = <&backlight_pwm2>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <71100000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <3 40 51>;
+			hfront-porch = <43 80 91>;
+			hsync-active = <0>;
+			hsync-len = <15 40 47>;
+			pixelclk-active = <1>; /* positive edge */
+			vactive = <800>;
+			vback-porch = <5 7 10>;
+			vfront-porch = <5 7 10>;
+			vsync-active = <0>;
+			vsync-len = <6 9 12>;
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
+	touch@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>, <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	/* Mallow Touch RST */
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	/* Mallow Touch INT#*/
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT,  7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
+		>;
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
-- 
2.54.0


