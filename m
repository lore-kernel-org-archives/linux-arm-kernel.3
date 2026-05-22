Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2444ECD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=; b=V+UByNM1RHB7UV3O6VNpDiev/Q
	gbyb2qnQ7NhhB+ghL0nUSIgydeR8FVN3e+ZchzcrgHX8zrmmo0pgEnVfyQ9R0HbGIo/ZA5BIt5Nit
	L7CmOjTuh0VIWwVK+s4HZ0lkRQ99wkf2PpsdasiGwBOXUeLlAzJ5ckUMGUvQDpcqYtoZxaCPudpBy
	o2WQIxJbGqNW5NZzMM2yC82/aUa1SUam9klU3Xt/MgAcb16OMNdTHN5m1TJPaeByp6bJJOy5t0Rk8
	bsd8s+iLgbDLdf5SYX5D5wjBee8aLCOgPuE8kNMvN7pHNmG6aoLeOMdpPlt+UJXgdF4hIU6Fu1ogN
	ltOKH9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoE-0000000AwWN-3Q2I;
	Fri, 22 May 2026 13:21:02 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnz-0000000AwM0-3BPZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:49 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so18715715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456046; x=1780060846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=;
        b=fKvwM9ZExOYBnr7h7jTik8CPpoGtImCqZcNi6cGp7ieP4Ydgjf78pLMQEvdSpMfpRh
         YP6yHXgirhciZQV6jH/l+eMfnIndi+m2P2uyaxmd3+iNlFvoUBRq/oHlzKFZ296A1jnD
         67KTOCWgLB5ocu5CDE75dAtu5AEctSZdkwHEPjO4NJgAOvpky15NdKafgK1rRl3p9GZh
         Ny4FJC1XNYi9KVe6yePF9IVmRVXYTskk2j0cU/CUTVxUxMTL+W7n8aIdFuLly7QT7o/X
         KBBwp/12Ov2SmL1Wp1ME/b7HZe1IlSFUqdCS678Ha0FzGGMBDvHZVjBzeR109gGX/I2D
         ng9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456046; x=1780060846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UnJ/kwJD1BzZb6v1f/A6vTafil6ZFFTK+y21zbKW+bo=;
        b=Z9jYBjbYnIFdTkTwA5mTML2/G29CmEvrEvPb4txzVMhiBaNw6Pk2TQPNVU0M2NJbuy
         hknj5sJFyrNue/9dldQn0FNrk9fr9MKJ6EAoWLErPCbQOCVdx+M1y11nq1tg+99r3u2S
         XUT2JDoIZEe2gCE3GkybB2f3Ccu7Fch+CAWDoLqwUyKt2xpN8/t8d9GDKlUJrIYG6D7e
         K4aDwEJW5IzbmmS22aIRdrPqPZerEV4LqAjShBMVazvg6HIhlb2iIjv1xzc47N/s9JSP
         IEhChgBUO4hoidJr0743lVbzEG3FdWXEZZY0iVIQfBOPmteEooaMKxgObJ1xzHLRSPHj
         ocrg==
X-Forwarded-Encrypted: i=1; AFNElJ8WPXpiHXJ5zXvrONJrUfQhATbvXFKubU1vqKarfcNlO3Sgeh5FgjDwt9WrORpflQ5k44Px17ccL2KN7D2nbC5W@lists.infradead.org
X-Gm-Message-State: AOJu0YwPSF8gwRjhD7KCxZVLmbfBozWBq0Dol2nyBooZqbtB4R3Q7Ez5
	PjpKvTeELe3NrvcjorcK+TGuIS5hAZXAPOdGXE/+I07jGU8M8NrOAYEf
X-Gm-Gg: Acq92OFfDy95iZV603fYm9acAbf/TDmIbC3wvDPW0ThdAvzKVcGPwkpro7O424GbVwd
	/ZzzZdlx0geyMhZGKuHDO7z8oG+ESIeCqSuGNlsYWGqfB0BCsmCUuAAd0gH44PXeNPP/GLs4AkX
	p5HOAUjvLdCpP0uKiBo+KJzB6RTW+mWAcPIcRFmBZl8blVeVEJWprwHGJQ/vN3gr6/1nYYUeHcX
	pjPpazDPKEem9Frrs7kWw/Efzrk/aYjzptVUtAmzS6/2u2P0UYqDsI7Mb55DXE80Q4YeGyCJuEc
	LP0u7kQV9c9fbZ7G2ryYF7gSeAuyzgiPFU/7kL683GmfFnW5vISXnSXklH9pzmd7+GIOp4COq5h
	/+54pOY4L+iL/V+k8kQ3ne1qZBp3eVa9lTLF6M5xvFoO5hbBh1+mn1QoMf2B3ircong5xWwqJS3
	hGNQNVs0gWP81DIHq2VhvvBgN7EnHF+B4MzZHaXcRgZ0cX2oKF8EM2
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr40665565e9.16.1779456045378;
        Fri, 22 May 2026 06:20:45 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:44 -0700 (PDT)
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
Subject: [PATCH v2 06/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 7" DSI
Date: Fri, 22 May 2026 14:20:19 +0100
Message-ID: <20260522132014.226721-19-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062047_848217_33FEF669 
X-CRM114-Status: GOOD (  15.80  )
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


