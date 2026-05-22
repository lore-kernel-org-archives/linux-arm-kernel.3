Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C472CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=; b=yWqLbXweHkvAWU0rBGT+TErx51
	C2BzY/wcbyq/J5Befw3bzgGAz0klxGCpy663qMHtAG3gTmELnLkrz9gGmMERplp8vFD6u+h0kcjQv
	Ww0XIJiDSLVhjlkVep6xo2n5PtuDkmgM8xUa9XOr5l/B0Q4wFwGu8yuSNHxJG6yjWwfunQ4hbxK/K
	aDEWTUerWLys7IOlo9SIPck/ohev0EA8WURWdytbsvoxlEtAFunvhMWjNsoQj2MyU3wHntak0SKf8
	BP/miDtgPk/7aKYl9gXaBwiF1xtIAeY+0B51wELL3FDEzkAN7LktbZVu1QmN5YbrwpqrLr14tKrsj
	qjx4XIVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoJ-0000000AwZi-42Vj;
	Fri, 22 May 2026 13:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPo1-0000000AwNX-3A32
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=; b=ARHh0nAOMyT7XKkUPiturxn4XB
	fCMh8eqErFKgbDmgwLTEirKYOYJEht6hRdfjCcGHHQKzZW/PMyvkIV9hIopeBYncEYYoGskN9S6Yp
	F/sO5tr4Oi6BY2vP6qLaoFT7howLKSKHE0iBnD1FH/j4y5C30SGEjV7crlvUsemG6GMZU8wk2ElD0
	5oEbuiWbawjqdwOM7UA8hkfG3+gnIZtLvuLK0V6PIxxt4W2sptnmhWtzIcsxz1ri4uajvB3US6rMW
	dYB99ia3xbmuQOP1JjxMKkbXsddSlbnyHC+6N/uvq+9tTk+hd4YeoDFEn9z3De8AsUJ9LVhH+tv2b
	BbwUcKHw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnx-00000004QGU-3fg6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49042aeeb75so11671845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456044; x=1780060844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=G5kBTAqkk0glQLb/BNWRecx1CL9f5Q8dy/6gFwFphh0ji+Kd4Yh+ji+0VfoLoRpQZm
         +9Ex9HSSs6wbnmhXrV2+3Gsca6Y2yHPeF5xP1+z+NegUYJYno3ABtIK565Ep5tRSkLEF
         UhCFlf7WVYUheDav7q1LOXH8h7rIDNQfjvEs+9+1nI2ceRsYLYtp8jsTnEr1Tcf+tWff
         0P30T3nzNdrLcO2n5KQkZP63MntDW+NBYTfCmF/Ej03H6t9IfbIedxGC4IgFCQ/mja+N
         +IHixzqUJdonAc2e9GVjPmZxOGSli9WAIM6bUWB08EASXk0D0dvscP8o3qjVFYXOeQxX
         yV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456044; x=1780060844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7D35dABqjaav5/0u2KUMA47QmCFUbfMXIhJqIGOMGE=;
        b=GAfdv9s9QYhgmP0qJpffXmoJ8GCuOYFm8Ev9jRHabxeVGHiaXeFkRVXGgcyQbTcF4Z
         hpBPwhqE85ZGL1Dbh4GXKpq+jmv5xSZ285Fl2sKQJ35ML3LxVerfK2r6wCmXwbdNXwdd
         LLHCxQUxCB7zQROMhQAVSW+XfpQmrNJZnY7wHxLAkkPYJaWfpLbpf/NF0hKK1vGiEL6U
         l/hZboOuHAROHiny3emJ8JxG36QIEqKx51b6Sis9Yp5SjU/0RrAqsoNukH4ddWuPXQ+5
         hcf/myIoSTGJAGbLX+na4+i5y5o79njUfv9/y4uP6zCtcVqq87bw3EJRvlDbqbYsH/o2
         BexA==
X-Forwarded-Encrypted: i=1; AFNElJ9plww6FWkvwNdXXCIZlhS82O8QRCMY/Zr53BGRQzv4CGEKLrDb6oZzXx4VMDljTBFUZih+8WIFlbk7RKsMyQ+x@lists.infradead.org
X-Gm-Message-State: AOJu0YxiwMg82iPNtJX8W/xd4Qxjrm3hiPSw/F77D0jFE0XP+7G2vTOT
	VlehxalhjCuKRlpXKOqkPMh2PJdPkGxH/1HKu8khWEPhmEq6yP1w8Xtne7XaYQ==
X-Gm-Gg: Acq92OH7d5nQEx3R8IniBLCrLXKgILVkJbMBOJ9xkFwUGpcZEBKX0AThHMGZ9geUOFA
	kt3k5p5OLup5wMTZFOG4Vkbf+JxMnYYOlEvEgTM2vQz3SaD/nEjbnNnNlSdCvOeLqe4oBSHVRfK
	/kd3XQG55ozMi7gABDJ0nQ/G3GSO6Zf9NJXCuh0Jyn/Y1OwQYSctAL7JJ3gdvfA93sMM1l4Or+1
	u6tk2epVlihlqrCQJarA9IwRwysEYgRsL2pF6to7fgOGX0CehitwAJBt0NObjGT1hOuIkFh8aui
	YoB1Et8HjeZxdqba2mOI6iH40l7wK/NeZMk26yCVK95d847+r5L05SIIoSYTUyPSQwKZGgZvuMW
	tSkU9xL2n9/8/2XSulYyf0OboEKrJ2w2YlaCmROVG0JBG8m+HcTBoNl2d2mjzGbuuNHneZVlIyj
	fh530nHbK5g83SMQQ/0TbZaK9g9jetl2P1icF6z//ZmUV4aaG55mkj
X-Received: by 2002:a05:600c:5298:b0:48f:e230:2a26 with SMTP id 5b1f17b1804b1-490428e16bamr53107105e9.33.1779456043753;
        Fri, 22 May 2026 06:20:43 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:43 -0700 (PDT)
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
Subject: [PATCH v2 05/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Fri, 22 May 2026 14:20:18 +0100
Message-ID: <20260522132014.226721-18-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142046_253618_4FC19163 
X-CRM114-Status: GOOD (  16.18  )
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
on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA (1280x800) IPS TFT LCD panel. The touch input
is provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin AM62 Dahlia carrier board
device trees to provide ready-to-use DTBs in both WiFi and non-Wifi SoM
variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter/
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   9 ++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 867c05b675d1..dc397bc693ac 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -11,10 +11,16 @@
 # Boards with AM62x SoC
 k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am625-verdin-nonwifi-dahlia.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-nonwifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 k3-am625-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dahlia.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
+k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := \
+	k3-am625-verdin-wifi-dahlia.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-hdmi-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
@@ -26,6 +32,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
@@ -33,8 +40,10 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..de0148ddd596
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" on Verdin DSI_1.
+ * On Dahlia (X17) and Development Board (X48), DSI_1 is exposed via a
+ * Samtec LSS-130 connector and requires the Toradex DSI Display Adapter
+ * to convert to FFC/FPC connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-dsi
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
+		compatible = "riverdi,rvt101hvlnwc00", "panel-lvds";
+		backlight = <&backlight_pwm3>;
+		data-mapping = "vesa-24";
+		height-mm = <136>;
+		width-mm = <217>;
+
+		panel-timing {
+			clock-frequency = <72400000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <88 88 88>;
+			hfront-porch = <12 72 132>;
+			hsync-active = <0>;
+			hsync-len = <1 5 40>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <23 23 23>;
+			vfront-porch = <1 15 49>;
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


