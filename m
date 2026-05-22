Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D69CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/CkFG5HHyxm29Pd1D4X6TKTxgJBPv7Y7GlCFyBlO2U=; b=GnVJiWaCSruhFX/F8ivXeJ7yHQ
	Vbk/f2D2DwRtAxpc8ijmhMt0DRCsAyvCaIgK+u9pAkTYCPNiJaayrIoF2spl+kOJR556pJmFTOxbF
	Ona5uWLfk7coPZXM8lMG51HvBcjY6r/bhSsNXmm64VHL9yvnm6KEhMYY+fWv/7kCi1NKT0unrCACh
	3RwlFbMiMdkIUID+KzFO8gjU6RFcKq+iZP/EpMsSJoAKgSAsratFuXaGFRDrk7lwIji2q5tYPUeUP
	64MqFuV2FTMIp6IJPdUwj5prJkw2xi2mO2tfc15DLsV7s2wFCjsvpYwNTM1uii3fSUjhIFCrHbOZ4
	6pCO4xZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTk-0000000BNvk-36bj;
	Fri, 22 May 2026 16:12:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSTW-0000000BNjg-1n7J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:11:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4903cbfad68so13616315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 09:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466308; x=1780071108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/CkFG5HHyxm29Pd1D4X6TKTxgJBPv7Y7GlCFyBlO2U=;
        b=DFCGUVonobtixZbmNoaZMg3VMVIj1n2e2yjUse4JlUsOnDpnKnZTmSYyrjuOxCi1Kb
         0oYBSal0SgC7aAddboYsJDgfTlAjeY/GjGoW5Yupwm1FllIuxCircFZKMOU8uY9XAXM1
         m7dFic3+ptClV/zTVeQWyYgJgEn5dj7AGnklcbdcx/dqLlKp1uN5JaNu/44MRN86HzJ8
         Jw38O0vwYUnZvoa3WQ7pV7Q8O+qa4Qds3LOOt9NlCC6QY1NvTq7XnRb0+wzgaKkP6FCD
         55PzFfXxj/UuRxyplcpCLp39OLFq89hvWMDkkEG2OeoDF9+sDkAMszdxJ+QYBmOfGtTf
         mFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466308; x=1780071108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m/CkFG5HHyxm29Pd1D4X6TKTxgJBPv7Y7GlCFyBlO2U=;
        b=PhDfp4XVLk1orWrCjTX/mW9D6YYfy5heSoTNpf8PUlIWtAkaMtUfWGIf5YntAp0cZL
         givIiro0bQ8c62T3931cLBOpG+4S6Bd5IWxHLhvuSxunJxSlMHQ6ghGywQsfel0Ymdty
         HrPJwn7R6Ur+PA+n1siQgPWVkjDd0T4Nz5aYtIX3i+vrbVVaTnd6jmpbhU65Yn0uMXsJ
         ZWinyQMKN7tWt57HD0CD9T52wFiJb8N40rEYxFf3GIMFO6rsDxp74ttYj4Pf9ZRXqxX8
         bPo4yYe+TabxJsmTzkHoc/Arj3S6HZBz91bVwi3K0qzNVRn9GnPkhLeBgsZTvl1VRbkC
         sLLA==
X-Forwarded-Encrypted: i=1; AFNElJ90jcapTjQyYSxjn1giwFGffM/Y/kdYNzbgNtGeUEQbBvZdXEa+vU0EvojdThHZP+5axaAnzpx/G2impg85e0D1@lists.infradead.org
X-Gm-Message-State: AOJu0YyoXJOWmZuE6vdf2bfL2posw8IfwGSQzziqrrjyStwFS5VJ5pSD
	42WpKPChbbzZzZIdEBg4OMBiqLurdRXdLBPpdfHk7d3eioXCONBsi/kc
X-Gm-Gg: Acq92OElyJWTBD/akuCixHEblvizIYRgti/CS0K5ihZb/P/SPplD/LOIMCnP3KWXRKF
	vt7ZoPAcGgLmpNa7X3KohW0wYyHFrZ0uFwHmsghD/T/ZuZWG0pLlmtT6QYFyjdrhyAQz/rKXqFG
	6g0bsygtFjhythVhiIRiRiwsXsKem+xEPHHHK57cr0NYU2wjxvZsbb4ld33zvSyeoD3qAY69Cfk
	gTXnEVQGVu2B4DBigG+SHYtS1XdVQAAI3cdYCMWrMvUEOOtn+5FsTf7Z4lTypqd2PfMZWR56nHy
	KqfMmeSlIyG6/LqtGb2vjPlue4xKJmT/tp1MPpKjwACQtV8aHtSTXgT2RD4IKsS5sK+TFJi8INl
	IzaD1ZgxbSpDPZH9AC2VQr6g84lp9ziNX5lmoofG0Sj9BjRUYA7QMC4evaEh0f6L1tB/LSxowpm
	hxXDt4oPE4iUaAzv//kfj/MXM0McM2L7WRbaoihyS6rA==
X-Received: by 2002:a05:600c:3b07:b0:490:f7c:b19 with SMTP id 5b1f17b1804b1-490420f67f5mr50710055e9.0.1779466308126;
        Fri, 22 May 2026 09:11:48 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:47 -0700 (PDT)
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
Subject: [PATCH v3 05/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
Date: Fri, 22 May 2026 17:11:09 +0100
Message-ID: <20260522161105.277519-18-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_091150_520230_BA720A54 
X-CRM114-Status: GOOD (  15.99  )
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
Changes in v3:
- Rename touch@ nodes to touchscreen@

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
index 000000000000..ed66feec9462
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
+	touchscreen@41 {
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


