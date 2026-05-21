Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20659CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=; b=QBV/AS/t/tBeKA5hLYrkoGvCY0
	cafQYZaaB5JYuSAb9qI62K5r2VOenD8Q5Z1+oGr/0mnC6Ig6T1c640Vg3Xujetr1L4hOPaAwAwhoP
	DE4S+XkxALq6Ibv5i0gpgYu4pUTMf1bnZrlMAW57rbR9avKG8kBseEKrlrmoGEcdL8JI+c12BTXX4
	O6Ryll6yc55qzFWWSJLy/7sbLgEpHf256VgO8DzptjcfXIZMTutUeLYd0w0y5EgVrvW/gzQ8R/Egm
	bvci2+HAcR0XV6CZfHQ+SYo+0dZYRdcfssPnYnLAsx6NpVaixUF/Bi3JZS0S3Op8XwcGmm8kl2Zwv
	rypjRi9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tw-00000008DfQ-2ZH5;
	Thu, 21 May 2026 15:01:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tg-00000008DTK-1S9q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso56024785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375674; x=1779980474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=;
        b=Fw2ZW3Vtiqpwbc/Xg+9AXNJ4p1iK6hCp6qiFK9meWMoYAYXi4bHmBT3SQ2BOK62rrp
         M3G2ybJp7ll6Al7pY0Hw+EjPkP8MlV8RbvjFfDOdyqrDSv2JROAfnmTPfw03gB0xM5aR
         7ASIG5oCOWqMVysU+ukBkO6tc4gNuKVJ3qIkaa8RMlJh2qfbm1FYcQdgEwq5ZWzJ7B+l
         11ioiIrUxZN04fVrqFNsmWKCZtuh6BfnVeaASsKfowkg15W25uGxu0kKjkiBSaEdv13t
         exmSeDbrL6PxjrFGepXOuJPv8MJk5eRGJRJ8TTUh2Xn9qE5acOoiYplTk/8L4t1sDGDv
         m5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375674; x=1779980474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=;
        b=lhg33HVXK2mOZlYx0GVp8iRImHkhfKT5dC5lbgRnHH2JQlG3pYOahxl0z/NWJ/8S+t
         bcV6E97J4gCxbLoV+FzKkAU8kGUytp+WrVFb0CsMT0lmfqii5XdlK5QWa8aIr38XHJIq
         nqKHX7/au5fx+AUowSY2sGGfCrNQzqhR59O3xOdK7f6oP0xXNWo9dwRgndSjxgm2D5+U
         lo+pRNX7hRUKRN9uCXX1QvZezuRT8AJMBlydiyCbYjYOgc8nGwI5hBndN6gWyjj+e3iH
         HnwXsRGVC0sZZzcb1V3N+1M0WL7ZuXFjh470ciAzeaa1wEHZfq7jEKr9TOtGOKzXqi75
         qE8A==
X-Forwarded-Encrypted: i=1; AFNElJ95AxH+8D6Z1pY6JTXzYzD6MP7z/tYUyCvtnT/lf15VOJmI0kAbTMWwB2tOy6F/tM89vgoaJI8P9EYpWb0aBpaK@lists.infradead.org
X-Gm-Message-State: AOJu0YwI9FB3TTbKmyTYjsy8ik20FBqaW8Dj+Qz6cMrwYQPUCpP907Cy
	jE5FzpokomjpVffz9VgCYAQA5DyNqX2NnLN/pXPuamt7ps+jW3ryzJ58
X-Gm-Gg: Acq92OFkrHzm+nX18reXZ2gcGzZnAkfbbhtglVrmNf16ZdyPqiS2p+lh5TlTJrdDHjY
	AsSK0kqQLgCTmUVMaBjFBpdUpXrvWyrXB+6A9M8HX3JOqJXg8RJhsDyiRpqZgiTRwHpNH+m/rOK
	v4YzAvepxejVaAVNb6mywDu/5B8WGIvHdakp5HcZvi6LhOmQKOR7fSX9F+ePgj97h6AWEZbYn6d
	jd+fVQdU5mGRrZdzUpc+e6c/gCi+inJahS6y6Xnm/FzXuj/lUKaOYUOl+nJSKLFsK39Yq1Wa+vN
	49abjgSnRnCH5UBzgknpt8kWBQkdHH0f4b0xTTtnLWFn7ES9eVbvIh2XrqNYry6FfGOGHgB+6id
	sgyKLwW4+bCTRzF97Oq2uAT2ogsV1l4j7QOQmd089uBnzl4/VX73IeBKacqvb84+gCXrnb+7HOB
	om2BHrDYnor7SamCCconO0cBagG+NQ78RQekJIqTZzuA==
X-Received: by 2002:a05:600c:3e86:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-490360438b4mr58116935e9.8.1779375674175;
        Thu, 21 May 2026 08:01:14 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:13 -0700 (PDT)
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
Subject: [PATCH v1 07/15] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 7" DSI
Date: Thu, 21 May 2026 16:00:43 +0100
Message-ID: <20260521150038.103538-24-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080116_427192_CBA01158 
X-CRM114-Status: GOOD (  15.83  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
DSI on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index dc397bc693ac..14898f8ab0e2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -223,6 +224,9 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -328,6 +332,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..0fa8306324b3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-dsi
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-display-adapter
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
+	backlight_pwm3: backlight-pwm3 {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		power-supply = <&reg_3v3>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&epwm1 0 6666667 0>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		panel-timing {
+			clock-frequency = <51200000>;
+			de-active = <1>;
+			hactive = <1024>;
+			hback-porch = <160 160 160>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <1 5 140>;
+			pixelclk-active = <1>;
+			vactive = <600>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 12 126>;
+			vsync-active = <0>;
+			vsync-len = <1 10 20>;
+		};
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi_bridge {
+	status = "okay";
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			remote-endpoint = <&dsi_lvds_bridge_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_bkl_en>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					remote-endpoint = <&dsi_bridge_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				dsi_lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_lvds_bridge_in>;
+				};
+			};
+		};
+	};
+
+	touch@41 {
+		compatible = "ilitek,ili2132";
+		reg = <0x41>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 35 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0


