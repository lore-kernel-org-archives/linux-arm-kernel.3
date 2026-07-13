Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42325C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NllSOXANZbxP8RBncH/Am6flywgYUGPahcvW1ImjCo4=; b=k11cbfFvQBZFyW53h7QEz0i2tj
	AqI92DsKc+m4tJHwqvFB3CEJb4g9iBkTZ5x3WLnVJ2oniWKNL6hXgmjcs8FpoT6JIHiW/KyXgakrJ
	w1vBXB4tDFSQSmpAWsyMo2qeHj6IqKXOxNqdu8KQ6MRVAQZiEk36ju2iyvrHdT9KFjGd7ZAG1Qloc
	Vz0X21LLumnbdsTJzA9OeXcnehNdb+xV6WmFyMAH1SAaia3lojgE2q7OEBWPRSgy4qtKO69zNsod9
	4uc4TF8AhUGFc2tXgARBm1rRWilAzK0RSReUNIb5amt+9oJ9dEeGeL5cD21D0d/JVfCYPtn7ll7Ul
	5wVOIwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFJ-00000009jBE-1xrE;
	Mon, 13 Jul 2026 15:07:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFI-00000009j8a-10Kp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NllSOXANZbxP8RBncH/Am6flywgYUGPahcvW1ImjCo4=; b=Jlv7oGh1zbS1PwBMBHLwsIIUzE
	NXfIecnM6uUpUe1rEiTsw5XF+xvS/khgRkrIAk7aP0U94nSFiAyICjwi1kTO0+eizvfxn92UAs7/d
	IS/HjSXe1nQTdLh6DsyiIyGPDfLtasOQL6I7pIale8d9E06cmtLtYxwInjFEdHd5CrvEiL67G/GCR
	/gubow5LgKuIyI95I3QjYSRHvyx91wcezHRA2cyRLNWpaT2JS2b781D2VyyN8snl65PrVb9lB3eRD
	ey2kR+lGZip0FfuZO4SRjYg0RVFHFl/KQvNgPkYASmg35EPkXOl4DY8GZix3OIXHu6hA5T2lxUAdN
	aI4SsJSQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFF-0000000Bkxl-0bHH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:06:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2834583f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955215; x=1784560015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NllSOXANZbxP8RBncH/Am6flywgYUGPahcvW1ImjCo4=;
        b=eju5iMs5u8m0emkQQ2bI4xDGygP3mrf1lMF3q/4ld6rjVl3CW+RGGGVwB4kCG807D7
         JmWG61TrCj4Ihg51zBUfSK1TDWBel61C5yQEbWmlfyzKvp+hOP29RniAvrypfGWO77Cn
         w1C+4V9m+GqDaHBOGBRTgHltGayKl7Zq4OBfIqcSXyqJC/PPQQ8zS1467IwDlxba4WKD
         MXCpC7ty/++R8WGJYoNJTePkvrN7ELIPfV4wyDkAc0P7XztV3jblBkecgFqDokS1OqWm
         CwVVXeNDnyWezEKlgEIbqJ4wOaMAKFJ4jDN/uaLSy6PNm6ZnfRMrr5NEsBIHWxrvT0uj
         FAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955215; x=1784560015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NllSOXANZbxP8RBncH/Am6flywgYUGPahcvW1ImjCo4=;
        b=SRwleKmjZ80BSDgE8ukRZDT5C9AwFZUycrZpFRBSdYkh1NYlt61qsoLfUv3IM5lx6b
         /R6qe8Jry+Ynp+FooKfY5b45hCGNzwqMHQ90kwm35quHYrXEoS/+0xgTvZ9TOg70naUw
         Y/hzC9Y8GZ82GYTb797JK2xxjxgBF2/+5P9YcxyIZFDWNs5pNk0Qlmb8HT2VCia4C7Ig
         5B/eQHn3Bgto8+nGenCGZYZR3lKN3mTEvuY3NO7LEe11keP9yZbFrqv/pkQ4yJoXOlo4
         +dgrTjWstmaHjnKFSm/PiQOyMAAWHITQL78Z57Gpb3w3oDEjgfuMlEA4iRaGUfhaq77D
         DJmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ1igU8qd/pmLZ0ONG89Bg/jDlBfYBOCXmO5A6Vgeo/pnlrL3QUrmYEPM0Hgl44TNju3dxH1NTus78Vyw1gnAW@lists.infradead.org
X-Gm-Message-State: AOJu0YwvszSlKVw2asuBs0BBj8u+Q4zUPS3GZe+rJn7kih8PD+BlNkrO
	8TjWelNT2pbjCy1c6aUfSwXcN5QdwQWf9o+T6dfNhASwd5JVpC0wZ3XS
X-Gm-Gg: AfdE7clQlopqWeUFktuDC0VjYIG6pahr7z2Cc9GY0Pmu/8B3AveFd1M66ciWC3UCqmu
	bMMry/nN2mHeL0PYNBcupod4WdoORCOhOcXhP8UD8NOdpEZLcTlkV2dkViwRVRmCVghWHxMjdeZ
	tJ0qVuezZi5g2RAnMrbzfbFxDT/i5glkxO6SSneaLrW6sqkB0O4T/jqazSedwnuEMGTqZTf/9ZG
	PwYAVcuiTU+avUGuBrdkZTBV74dYGnXxNU4KV7M+6YbunvvVrqYSoBmPOlJqR1ChOZJJU4K9mUa
	6vwPu8sn0MWdnEcmACuVhhx6IsASeqNl+UOV7XxqXa1X78ACfOzvynnvMqJfOPyEPwBmPlqbOlK
	5zDROviYqQ+P5g8TgyAJ89oxLUQZa/UUuId92049CJS4/mmhLcIc7HLK2Yy+QfSJq8KbBDCqfw1
	v48eerOrz00DjgxibpOBTJUDM38zq2yCq3E4YDNP4GRFX99fYtdamjIj4SyH2ealGBrQNRp99Jl
	UZTmialhXpFb/Cc
X-Received: by 2002:a05:6000:491a:b0:472:8c12:b93a with SMTP id ffacd0b85a97d-47f2dd1fd49mr11190610f8f.28.1783955215265;
        Mon, 13 Jul 2026 08:06:55 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:54 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:25 +0200
Subject: [PATCH 4/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 10.1" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-4-4acd63db4504@toradex.com>
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
X-CRM114-CacheID: sfid-20260713_160657_341409_D3499112 
X-CRM114-Status: GOOD (  14.36  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display
10.1" on the Verdin DSI_1 interface. The display features an internal
Texas Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT101HVLNWC00 10.1" WXGA IPS TFT LCD panel. The touch input is
provided by an Ilitek ILI2132 capacitive touch controller.

The overlay is also combined with the Verdin iMX8M Mini Dahlia carrier
board device trees to provide ready-to-use DTBs in both WiFi and
non-WiFi SoM variants.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   7 ++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  | 129 +++++++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 9fdcc1a4c1e8..996b3b5413ac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -180,6 +180,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
@@ -188,7 +189,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
@@ -201,9 +204,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-zinnia.dtb
 
 imx8mm-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-nonwifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-nonwifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dahlia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
+imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mm-verdin-wifi-dahlia.dtb \
+	imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
new file mode 100644
index 000000000000..5626903d668a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
@@ -0,0 +1,129 @@
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
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&pwm1 0 6666667 0>;
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
+			clock-frequency = <71100000>;
+			de-active = <1>;
+			hactive = <1280>;
+			hback-porch = <64 64 64>;
+			hfront-porch = <36 36 36>;
+			hsync-active = <0>;
+			hsync-len = <24 24 24>;
+			pixelclk-active = <1>;
+			vactive = <800>;
+			vback-porch = <24 24 24>;
+			vfront-porch = <8 8 8>;
+			vsync-active = <0>;
+			vsync-len = <8 8 8>;
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
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	bridge@2c {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_10_dsi>;
+		/* Verdin GPIO_10_DSI (SODIMM 21) - DSI_1_BKL_EN */
+		enable-gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				dsi_lvds_bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_out>;
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
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>, <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio3>;
+		interrupts = <15 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif {
+	status = "okay";
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


