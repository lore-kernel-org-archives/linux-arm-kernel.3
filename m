Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C43C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeyweqjzqYsgzcRbXY7Sz3yu1Pc8vFqR1fhsIJ8jHhA=; b=VvN+JXO/+oK5QbdFpaCpZDJvbG
	HaoIaazUAaYhTxUXhmi3Eld6HfXl6WzTLgeE4Qkip+UJeJG4kR9pzkSa/OpkST+IHTEjKz708k+7Y
	G6/0j100bevj/ecE3pxUFY0oMGMhy1HUEbRf1rMrNujQyM8sEH+GNjPPSpr2lEmei6uPudW9PULbN
	1nKmjnAe08TpQgRmh5/jNNdBgzVdlF7jtdgp6dTO1eMgIQ4gl67A5G1pWodjIJSRckz+YPVMB8kJ7
	k8drB6QVT3qn4MixztMl0wuFOiwcWNhqn7L3VMff0OHnH7zBqaIpvHmojqKdqyKq9E8lGLswlHNBi
	5uqL+0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFV-00000009jJe-3VYJ;
	Mon, 13 Jul 2026 15:07:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFJ-00000009jAc-1Y1C
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UeyweqjzqYsgzcRbXY7Sz3yu1Pc8vFqR1fhsIJ8jHhA=; b=dXqSkgOTAj1ex4iGbk/6C1rhtf
	BA6C7VAdyZ49WVCsAGaf77cuKW4N+Be6mNI43XT5cMyzGu/JgMmH11CSysjLxGgdqersqUSDzOFme
	vRNxsppIsJd6nKy+w9EUoVdjQgA1w/Eirj7gXJk4x7pe/7JkyQbWXY5W4O+DiSWiSpw6an8rlEjHQ
	bBt4w7kM9shPzRb77WokoJDn8ToAmM3ZOEFij9AC1edrOIOxOdU6ymLBHyw8GG8+Zb/iYbAxIwgwm
	I3wI2GkbZYicOrQDsaE1sNk8Gx5mQ8jqovHVW84rz7BXfUJJKKLCROIcicjMk66l0EdNKi7AsqUNu
	XPWyMQig==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFG-0000000Bky8-0prq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:07:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2992506f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955217; x=1784560017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeyweqjzqYsgzcRbXY7Sz3yu1Pc8vFqR1fhsIJ8jHhA=;
        b=eVKdWCJ/tMJQtDSCaszQQoLQ6PLnhUc0mfv85lMB9tLS7mISSm/mjihZ8K9yPhrzLK
         bNmaxg4lDrB52feWfFaKrfbbKzQR90+r1+OUoIxGT9b2SoSrhJZqm0k9aCPvxTiBmN3R
         ZHmaUPA0hxCyvlFXfSOVFGBJNGMhebLDbxddHm1uF8drQcBQNexm8ohrVph0sqruZA3W
         oxDgX6iegKkpCmGzW4MBcWC1UoeIiqXUf0zaG7Q+yDv5LD3T8WEHjU/o2WUYdR4DihJi
         mhLp6ZBeQxonSbAZPSZSDnBY1TgKUQ3hIFA/tYYhPWENfElnRla47EBuNKq2fuqrx2Jz
         eSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955217; x=1784560017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeyweqjzqYsgzcRbXY7Sz3yu1Pc8vFqR1fhsIJ8jHhA=;
        b=pF/g5Ou2EDPyDmny8SCDjJfmXCYjySF4ZKCq/7WhcGoqvQbaij10b1RZ4G1xHQuq0i
         4/TVMniybbqHMzXYnZVCfVwb9Icz0nqW6c0oZooIRooXFv7HqO1wOiYUG9ClLy7gdlc3
         JFJruswgslYYcocJmSzWXIsU20HtDXCvTJ/gdRmPaR6lX81NZUKqWr+arzOj/3xZQQp2
         p4f/BbjzfK6l0y4v/Qq4cs2KJvyyfyJjUM++bLBoTVsCPmqF5fz78ZnFqumTluUqMYfH
         9RrgXjslzuJ3Ibf3B5rQYwfjC+/+puK9mpblpaasSQUAMfVA1RgSJZly3Lv8sSdbpDaO
         PBBg==
X-Forwarded-Encrypted: i=1; AHgh+RqI7rIKXFQC85jFfKVAFKsLc8BXU4nNHf6w4HBbKGONuZuVFfZFGmarjJX35+LManO7DOAA/zjlXQkwD1zz+Czy@lists.infradead.org
X-Gm-Message-State: AOJu0YynzkBjoPnppc0An3NiQ6pe+UGXKG4vsXfyrJ/OhOl4BDbO4JZ4
	qjr9Au2Xel14b+01zINV+Jpb1+zb5c4HbYea/vDp2MsR38Kn6V7gUPkMO/Gi6ocM
X-Gm-Gg: AfdE7cnnBCtRPF3GikyE5TrgcaJDYVFY/f623z9Mw6OuVneUxfTzi9KYq2jQ2n/kMBm
	HsnKSMUKEissaaQvgXLkLhpJG+vChrcJKKCOwQFKe5fQU4djhMU1ZJdT8WwXe0xZxA7ch9gJmg9
	+/c8gXRGkRS9K343nrmfKjoRVL15EEVmrJBKIYnnF5tR5H+/PMnY+WRz1VhChe3+YB7nS8OnaA6
	5VoH/JTWSy4gPfEQxOlyBuocph6ikrpp67B+TxKovx3e4rXtbbFVBaxqsyqqu9gMlG1+HQGKMiB
	gbQvRoU+bMWp16Yqb7U5mQCX60OIEwRgSOPXXtKyJKfpuvmPYjZjZKSB2JrLwi5mFu3I6+YlLUH
	FvBkTFpf6XCoBGQ1XgqaL4Y77rAzm4h/jpakG441Kbu03RYw+5jspN6C/zpIJp0qpU22VJdmgTi
	LqKQkuy52GZrODOamMHaHuYOBQNYxixKOMtwDLnrDCSGcOMcGcB7KTBTyFQOh0Z4bIXMWodTceI
	SYhfmHhLUw8iIFKKx5K/ulPm9w=
X-Received: by 2002:a5d:5d0c:0:b0:477:2e75:522c with SMTP id ffacd0b85a97d-47f2dce7e5amr10375689f8f.28.1783955216485;
        Mon, 13 Jul 2026 08:06:56 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:55 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:26 +0200
Subject: [PATCH 5/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-5-4acd63db4504@toradex.com>
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
X-CRM114-CacheID: sfid-20260713_160658_423899_24084FFD 
X-CRM114-Status: GOOD (  14.15  )
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

Add a device tree overlay for the Toradex Capacitive Touch Display 7"
on the Verdin DSI_1 interface. The display features an internal Texas
Instruments SN65DSI83 DSI-to-LVDS bridge driving a Riverdi
RVT70HSLNWCA0 7" WSVGA IPS TFT LCD panel. The touch input is provided
by an Ilitek ILI2132 capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-dsi
Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-display-adapter
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   4 +
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   | 129 +++++++++++++++++++++
 2 files changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 996b3b5413ac..c465aa19e526 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -190,12 +190,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -215,6 +217,8 @@ imx8mm-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ver
 imx8mm-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 imx8mm-verdin-wifi-dev-nau8822-btl-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-dev-nau8822-btl.dtbo
+imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
+	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..0e15b4b3f3ec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,129 @@
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
+		power-supply = <&reg_3p3v>;
+		/* Verdin PWM_3_DSI (SODIMM 19) */
+		pwms = <&pwm1 0 6666667 0>;
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
+			hback-porch = <100 100 100>;
+			hfront-porch = <16 160 216>;
+			hsync-active = <0>;
+			hsync-len = <50 60 140>;
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


