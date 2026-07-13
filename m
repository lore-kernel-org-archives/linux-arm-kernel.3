Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A03C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AcskjGdqN6uWnXhGp/YW0UcRAdBQsz7qHR+c6jChdw=; b=LfpWWVso7x24KVACgaZFX6KswB
	O8swamo822MR3+hmgxN7h1O6PB3nUWdCobUQTusYbo810rVwKkowJQab/RpjfMsAY3uceGUxQv51v
	wFPikBzm9bOJz8nlw2Ymmzxfz3U1rmIh+Mmz79qDmZyCV0te9+pn4FSEOttGtwp8eUElMpEIowEr0
	LshWMkIviPo9jAhzJKzVSVI5ODWfQKuYZsK16EkujJwsNlIiqhCaLO92XMG03WP2fNt+ZdGSLNA4H
	Ca5LGf6dvzZUj+7s55MnHnt6YwgAgpyaouojsN6LvMUR/QKp5F+/EGYmgwVSZIkUDeGe9ud89YdEk
	xP3ZAvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFI-00000009j9K-0kE4;
	Mon, 13 Jul 2026 15:07:00 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFF-00000009j6o-032o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:06:58 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-474560436c3so2499436f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955215; x=1784560015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AcskjGdqN6uWnXhGp/YW0UcRAdBQsz7qHR+c6jChdw=;
        b=b+BM8qMtLEPjQqtB8fPgjsykP3HDIeNI/3irrvzidITCO21sb4N6ZmZn3Jo5PPTYCF
         oTqqBAARFzbt6vopc3nQiHzHihIA3ldgVJuOs1qeEsIqZ5Uvi79GLk1HYuEobyUqTg72
         xG8KWdtpLznabsCjRBs08Ow7Hn9RpKc91/a5VV8okWGr3TNp2I+TmPG3vZXupP1M056u
         1T6GRboG7815brSEa+fCXhJyWa7zuKxMzQX26catl5RY/uOg22fSERw5B9k40l8Nw0TS
         DRJFEu8rM7ziI1N9SD0BmBLRwjSQFE1oMsUn6fIUt39HBHb3VwT3N+t9rKqRGb586J/w
         lqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955215; x=1784560015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AcskjGdqN6uWnXhGp/YW0UcRAdBQsz7qHR+c6jChdw=;
        b=oX1VcnRgikHivHZx1GBguCfKq92CD4EYI0VyADEh6xQHIqZMImOmI/9REA7Y2y2cda
         R3Qv6N27cCjTD6OaQtha68OkGWoHACndNwUvEH5+IFnrPyH8uau3jmSwDEQcrCxgVRqs
         XtNznoQeLDwtQI3/FzqL75sMHLleB5n52esxH9fkHsmNczvNqXIxRhunNzldcwgd6Ne7
         8eW2x2l9C1Jd9oGJSeBOZgH41dzcxo271MWlpSTvAI+Hw3qYE10+0VMqTf2uZOgRar1W
         8H9dj/ZU5MAkFBaq0btOcxRVGTEjTaI/VprHYoWLb+/SSx+yNseBxypBBBwvGpzWIDwc
         hCjg==
X-Forwarded-Encrypted: i=1; AHgh+RpSoQKHmmyWD1A6K/RgJVMTggF1UgPzjT9hKEPuiUQ1jnXq8RvGA3QRXWX9oDz+6vyPy+pyBqeyREJN1iL13/I9@lists.infradead.org
X-Gm-Message-State: AOJu0YyOs/hxyMPvB0sWM3ATsSnKBfYD1ko8bj6BfrL+3YepXr/tmhp2
	IdAJEFxKEhZoR/bMOsWy7sE1h1ur0ClakSZzUshsnbxkFsY5N/1sJRgF
X-Gm-Gg: AfdE7cmbMOQhkmngqudY0jmYCgGeQrymuhxkoGf6oU0xUBJ+z6orJdah9TlmHZKmutr
	u2hvKjDKBfgK+C6pTJ8pftFKmgSEMEzj9EuKOyZ2oT9wVfzKUwoEHcM/7cCecWfAtJ8SmUuGM/Z
	VaYZ/GxBDIh5a8Bo0gX6aPalcYJ1455cQ0+o6BOjVTVMJUeoCk4WLxrl6J00RBEXy25NbGZ62XN
	PMARF/8Am9v3k3uiSh5JSxoJUctggsPu+4m+sHzILpCbbW7GsyDEZ5982hLjYncY60BD3P0MNlT
	MUmY/YgHGpFu6WE9PO86IrJ8yzOQKfFY2sGvV9KKMcLq4s6jR5WsB4CyJvyUo+8nZwqc+n8GWJG
	W2KpkO2Irpw/Gqs4u6BuLs407LULQeO/7SwixOrgT5vnGg7zj2Z5Zl8ZZCw8rQTA8iYVlzcnHVI
	Edk8f4+/7RYYlS8Q4/1IMB1QCQmN6nVbTSY5hzNhGYciCRI6DDsOi84l1DNE72CbKePvEh9uAYO
	42MVqsIMrP4LC7z
X-Received: by 2002:a05:6000:1868:b0:47a:d4d6:a21c with SMTP id ffacd0b85a97d-47f2dcb600dmr11333820f8f.2.1783955214366;
        Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:53 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:24 +0200
Subject: [PATCH 3/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI
 to LVDS adapter with 10.1" display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-3-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_080657_086879_E5034A82 
X-CRM114-Status: GOOD (  14.01  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
Toradex Capacitive Touch Display 10.1" LVDS. The adapter connects to the
Verdin DSI_1 interface. It is based on the Texas Instruments SN65DSI84
DSI-to-LVDS bridge and drives a LogicTechno LT170410-2WHC 10.1" WXGA IPS
LCD panel. Touch input is provided by an Atmel maXTouch capacitive touch
controller.

Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso | 104 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e8a1e015ca77..9fdcc1a4c1e8 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -178,6 +178,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
@@ -190,6 +191,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
@@ -203,6 +205,8 @@ imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
new file mode 100644
index 000000000000..2c253018893b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex DSI to LVDS Adapter on Verdin DSI_1 with Capacitive Touch Display
+ * 10.1". Used on Dahlia (X17) and Development Board (X48) that expose DSI_1
+ * via a Samtec LSS-130 connector.
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
+		pinctrl-0 = <&pinctrl_i2s_2_d_out_dsi_1_bkl_en>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin I2S_2_D_OUT (SODIMM 46) - DSI_1_BKL_EN_LVDS */
+		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) - PWM_3_DSI_LVDS */
+		pwms = <&pwm1 0 6666667 PWM_POLARITY_INVERTED>;
+	};
+
+	panel-lvds-bridge {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_dsi_lvds>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_dsi_lvds: regulator-dsi-lvds {
+		compatible = "regulator-fixed";
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-name = "DSI_1_PWR_EN";
+	};
+};
+
+&atmel_mxt_ts {
+	vdd-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&lvds_ti_sn65dsi84 {
+	vcc-supply = <&reg_dsi_lvds>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			dsi_lvds_bridge_in: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&mipi_dsi_out>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			dsi_lvds_bridge_out: endpoint {
+				remote-endpoint = <&panel_lvds_bridge_in>;
+			};
+		};
+	};
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <16000000>;
+
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&dsi_lvds_bridge_in>;
+};

-- 
2.43.0


