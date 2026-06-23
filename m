Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFB9CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq8bbh6aLPw7xItUXqYkRP3ERWtfg5d1F8ZxaWAUzYU=; b=ckpE9aIQG8p00i9Dgctd2ArQWH
	gKynJuMYpVqUde0X5ls0Xw4NKfAd21xAGDiKYS6aIBfFwzjFDdVT3PxxYC5H0jpvYq338uMTGvb2e
	xgMdajV+iRYbfSrI+uDJGx5DAcOtNVkbtDEoGRHbcrOgNn/xlvjnjYb7Xt4nH5zyHPeU8Wk83uP31
	5QLxuZXkP+dByW7t2Iour0v1cHzNycV0mxPUfTY6EIUfipfzwmopAIIlaIXvut+t/NMFtY4eErTA1
	uvOeKx0TwkLGJZVCZIOTgfXFbGmAStDSnP4DHRKY9z7lhNLemZ5me/ijagTdEG1Su7E5Z8A9i/KEr
	1v3bNM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Ga-00000006oVw-17Eb;
	Tue, 23 Jun 2026 19:58:40 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7GX-00000006oUr-1Xvj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 19:58:39 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1363fe80fe8so570086c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782244717; x=1782849517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq8bbh6aLPw7xItUXqYkRP3ERWtfg5d1F8ZxaWAUzYU=;
        b=qsdsNaqr5aDric7A3IHNmKhWPZgl7bMC8M1adIBihZF5F9wDruGzTxAyOr+GLn70Wy
         J2lCRJlXD86mbHdaHreCc9ds0H6yL7kTsIyO3y4pJGPJrgUiQqSUTWYAMCzxkr8CH3ne
         Jo0JRnFkDQRF/jaPUIJSeNGbSwfyMrXF6GN1adNVfq1SEbf+UMCyQ1fIvJavSZXCcaXx
         x3NOTvFdOBibiw5qbCBP1tG7fzfFoA7KGIX3J/VDosQC2Ot6IZfrsZ0TuuN1UVMXuyr1
         fw5T8JnuWoMtnkyDR05RGSVFbOs8+oaD+Qd2+pYNo/qkEITdtCo0n1Md/scTVi67xTBa
         xmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782244717; x=1782849517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uq8bbh6aLPw7xItUXqYkRP3ERWtfg5d1F8ZxaWAUzYU=;
        b=Z3eINETZ2mGVUhA/ErRZshPEWfkVGRg+w8gBY87YAZop8OTkroFxAXPkKBLuWYDLOv
         P3QUSaTYOCVJxuDY8/31RHO7APhPBl0qjF2LdBzoWB/bmNHZ64X+qwk8hp/I84VWK6UH
         FsLJ0drS1a5MlBb8lK1N16CoKDsF5tLqyltYw3JGMsN5o8zRIN2de51KbFo4eHV1TQ+q
         SM8qpOzGf5TwDhYkDvRKeZ6io4iBZAG4SH1nT03GN7UdWfQCFodOXNP+u3TzHeFs66Zt
         BTw3EAOmtXarmurQBnlsKWb6rx+wEU+x0Oq3R32H+qTrqhVBTwrh/iT72mKvDBPLxwyd
         4Ihw==
X-Forwarded-Encrypted: i=1; AFNElJ8oQLI/AnYz66VJkjgJ4klWXWO5EJVOyaIbciD+0eADHV6kor7dK6egy8b/ZKxM0WEqDxQ7EWaSfNbcUG6+DwnM@lists.infradead.org
X-Gm-Message-State: AOJu0YwHP7IRCaoRAMdvSPwjCqiUW8Mowj/c5fn2VZ4GqwHs6P9uGIcu
	Z8Dn9QPwxpOibPbD+tChZYRSFaYJxE6+K9ihHNtiApgV//0GeBH9IAtw
X-Gm-Gg: AfdE7ckSZ2m5LgO99bNvmlCivNfZbSj41w58ZqBus9dOlfQ4h5IAAHZaasfTujusW1e
	u0vSt8adK5Emo0HMmcSN903lr3zQRNI41f3CX3e0drNebMX8I5ovq7gIbakKGmlpFl7sidc7aPE
	xBPpzl0NzpVhJSEyVBRPNrELxMm265gho3sn1dOvshi6FV6K69VL7q5LnWMS6fxv4vGrb+9VIus
	LG3xH6UdWXKoLxPH0O769dgpA5i4+C3lTKQILhHkLUOAnCOCQQxcjhiX07dHKT3R82iSKDaga9B
	Kb9Rdfd7wSJbfjd7kYl3PQxzmtkGSuiKQYczlF9thcXOkwFDcr2LZOi0aIZii3vXB/E4P0CaJzj
	eq3c9ssqSh7urVXI/xqVp8vfp6iYRyjx21MD3xBfSw2AV3cKJJnOzfHFwCIXOu+byT8jELIrdd4
	R3XmygDG7V7jkChehpNBhxgkTV1f4ItHpXmM6DRNAfGFFw2GXN9ruZA/Hw/WOHaM3bSboI9P3kq
	0aejKm/K6qVLRrfWv+0ywDD2P4Y4OZtHP2AflVgD1M=
X-Received: by 2002:a05:7022:203:b0:132:5d31:dcb4 with SMTP id a92af1059eb24-139d0c780a0mr163196c88.23.1782244716536;
        Tue, 23 Jun 2026 12:58:36 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add85c40sm15730896c88.15.2026.06.23.12.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 12:58:36 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
Date: Tue, 23 Jun 2026 16:57:39 -0300
Message-ID: <20260623195741.495734-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623195741.495734-1-leoreis.costa@gmail.com>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_125837_435476_D3DE151C 
X-CRM114-Status: GOOD (  14.66  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS V2 connected via Verdin AM62 OLDI on carrier boards exposing LVDS
interface (e.g., Mallow). The panel is an Opto Logic SCX1001511GGC49 10.1"
WXGA TFT LCD and the touch input is provided by an ILITEK ILI251x
capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 129 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe52..61ae9039e561d 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -47,6 +47,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
@@ -249,6 +250,9 @@ k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
+k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	k3-am625-verdin-wifi-mallow.dtb \
+	k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 k3-am62-lp-sk-hdmi-audio-dtbs := k3-am62-lp-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am62-lp-sk-nand-dtbs := k3-am62-lp-sk.dtb k3-am62-lp-sk-nand.dtbo
 k3-am62a7-phyboard-lyra-disable-eth-phy-dtbs := k3-am62a7-phyboard-lyra-rdk.dtb \
@@ -359,6 +363,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
+	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
 	k3-am62a7-phyboard-lyra-disable-eth-phy.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 0000000000000..3ea8ccb8bff99
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin AM62 OLDI
+ * on carrier boards with a Toradex standard LVDS display connector
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_i2s_2_d_in_gpio>,
+			    <&pinctrl_i2s_2_sync_gpio>;
+		/* Verdin I2S_2_SYNC as GPIO (SODIMM 44) */
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <37 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO(SODIMM 48) */
+		reset-gpios = <&main_gpio0 33 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_i2s_2_d_in_gpio: main-gpio0-33-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L24) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+		>;
+	};
+
+	pinctrl_i2s_2_sync_gpio: main-gpio0-37-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (U23) GPMC0_WAIT0.GPIO0_37 */ /* SODIMM 44 */
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

