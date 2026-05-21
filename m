Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BD9CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/73kfEyrfpQzCEFi/idt4kbknug0hC2s2N9IffeSWo=; b=B/rVKj9FZBEZtveq8lL9d22X7h
	Pv0rGY2dJeOe0TYptqxPHXBdaJ4P8z7YEwvU3udygRa38j+U1VTjujQ67PzXfXbFSvzEoHE76/L3L
	s03gz1MKpCco/Mg0fiisrQcJn3XnLcsdiygJ7nVnH2l0M4g2FhXgUjeFKN+THjoaB603xHa0XuBXc
	+Rfc/8+AyjcwUGalAMxWymE7k4iR9BPxZpRKnq+9sWrqRFkUUjHn8va0LkAeHRHbgSIookLUrhl8B
	Je+DUNJagSK4LTaITQJIRDejHMWu6AsWVIXIKLquQuwcBPmyHawbW8OrdoBNXT7/cOFwPpVMHq/L7
	Ls5o4hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4td-00000008DRR-2oHD;
	Thu, 21 May 2026 15:01:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4tV-00000008DL1-2S6K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:01:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso81782475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375664; x=1779980464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/73kfEyrfpQzCEFi/idt4kbknug0hC2s2N9IffeSWo=;
        b=WUuxhLl9U7ttSabnNOki3f8fKRJNEfWdD5gqb3PSq+1qwbK6NvW2XR/oJiWuwReNbc
         /yHt6dIy6tYS2N6WDig9NnUHOfHa3ur+QFsn4sBCQWpmFvOUosjPybfiuaAx8OqNV08u
         v2/nUMDi0YTE6PoFRylj0kFyxldUwisT2mCRVTvNCrH/aShS0iA9nN72dE66dSWVTdxm
         oKfComJxg3oCAGePzETrj4/E0FNJFlIp3OXjVB55+cd0M5R5xhvcusjXlCe6fab6tYSc
         LFtS81qf7LhdnWKuYsyUgYs+Dsdz07GWJDnGM5ZZyskHsphtoDXZztkG22TBW4YxrfwN
         ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375664; x=1779980464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/73kfEyrfpQzCEFi/idt4kbknug0hC2s2N9IffeSWo=;
        b=WEwyvkTlf/W7zkgFZED6YWM17YOKdPv766xFv2EKfYayzqbMIYdUJPpj6GAgbTGFyU
         MSXYR2A0ac/tLxt42EHtT4QBJuEVzpvDhsALJ6uG5xmK8hq64rW5wwCefCQ5hLUMfOSA
         H97ExwF02qIZh3GUZlooSepeayZyFEtcMJTcE+1/XckRQElQSKqMeWLkTO4qIh4VVy/t
         kLYvdo697m0qsJAQo47dHoqSpgnkYiKdOEkY11P5ZTVndgDYf8XLt6cExYcenAT6LbN2
         CMqNrWKdfdUf/xbwPHKBKkwh4TcLLRe1kkOnawCmk+2eX1D/jfAs3V2cVb+fpCMHkpSm
         r0zA==
X-Forwarded-Encrypted: i=1; AFNElJ+L1Jsf9d+K6XlXit21kkSAfRSn29MnFtYKNv19vjyA7YKfMBFPEHxB4BfebSlmSGMi6N5Gi6I6CmhSKzV392oY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4h+48QDgHP9JXNKbJ+JATWBTIVsBIKmSF097PD8KlFc57/+/L
	+wneI40LqXPFYATtuCXXQXxrDlKfcz7b44eWFFbqENic7rGVFkJqIa7m
X-Gm-Gg: Acq92OHgg6qWOWp/9gWN85EF5jetwJhPf5uzQ6JEa1tqwV98z/GKdOC5riiokOocGQC
	dEurITm2fHjUWw+zReDjqJ/c54HbinUs89CQESMssSPuhp0kTy9LWZzqsDKW58Hf+l9G5o4RvhS
	DRw8iptI/io/7gqIbnzn8k1jUfhnfVz02oXtBZLyblimN4vj+1J4Qu6KGlbixf/dBfMPyxAE/wK
	xlQ9g7Q/hYmG4m/G1ywid1pxqE4LdqlSoAp0MNnumVvKNtOv0XGXxdJSVtpqJcfAR+bVr9oDwNC
	90nZ60azfShQ9GTIBUFa98HsOci6UnT5HzD9HLEbV76TSYFynXAJT8M3vqcDN86hLY0Mm+xFwAO
	WwSzy56p6ZUMjWQQLYdXzVJi6bwyHn2je8dlqu7RvR2A/saMgGaOHxOboPlw4VYLc3FOHBbw/k5
	bkmHx7HYfPGIjQ9qivX+MzIShkrsdNJtsKyT8hI7475g==
X-Received: by 2002:a05:600c:848d:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-49035fbaad0mr49232625e9.0.1779375663135;
        Thu, 21 May 2026 08:01:03 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:02 -0700 (PDT)
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
Subject: [PATCH v1 02/15] arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Thu, 21 May 2026 16:00:38 +0100
Message-ID: <20260521150038.103538-19-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_080105_695999_744E3640 
X-CRM114-Status: GOOD (  16.07  )
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

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA LVDS
panel. Touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 135 ++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 21db60cd19de..b2408f62c139 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -209,6 +210,9 @@ k3-am625-sk-csi2-ov5640-dtbs := k3-am625-sk.dtb \
 k3-am625-sk-csi2-tevi-ov5640-dtbs := k3-am625-sk.dtb \
 	k3-am62x-sk-csi2-tevi-ov5640.dtbo
 k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
+k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -310,6 +314,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
+	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..c1236f64732a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display 10.1"
+ * Used on Dahlia (X17) and Development Board (X48) that expose DSI_1 via an
+ * Samtec LSS-130 connector.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
+ * https://www.toradex.com/accessories/verdin-dsi-to-lvds-adapter
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_gpio>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT as GPIO (SODIMM 46) */
+		enable-gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3v3>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&epwm1 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc", "panel-lvds";
+		backlight = <&backlight_pwm3>;
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
+/* Verdin I2C_1 */
+&main_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
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
+	touch@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dsi1_int>, <&pinctrl_i2s_2_bclk_gpio>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <49 IRQ_TYPE_EDGE_FALLING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&main_gpio0 35 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.54.0


