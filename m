Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834CDCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERrj/ew67k+04R85vJSKMEJ/AUxyWsHxKe8K8F/Tkpk=; b=GSJctMak4mGtisrVwhJ9nJZcBj
	BuE3GPlx8Gkxhz407W2pQnK5TK8UR08aYLLMNvKkz0twIzkv4CPdITfQbf8ZGfLQJtaQDV+FdqD6s
	B9I2XhWwVyuvSMVM/zyD318glUpTXo8wmXlcL28RGT/6JJioyNu0Ytce09L3//zuyx4EXRV3TEIAv
	4bNmz8FYC4wzCiwtINZ4k0IwhaQFkfDQzypEjNt+KhLc3IQuC1XyBTIxfSBBmT7EiUH60FvljFwGB
	zRQjwdKz8QS/oyslNuMYF6cwDnxj/0UVD1zCiLxkZ+ffJl1GYyxdLQhhU93pbgo+Qzzhc02ScT8OD
	key4LnjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnv-0000000AwJ5-2oai;
	Fri, 22 May 2026 13:20:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnr-0000000AwGu-0wMA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490426d72f7so7672275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456037; x=1780060837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERrj/ew67k+04R85vJSKMEJ/AUxyWsHxKe8K8F/Tkpk=;
        b=DOI9G2wUuWhOtjFMXwYE2nC6Q0FyzUzX9vqXPG8IBhwPo04MI0X7MIityG0Decxh6l
         wFyiyuX9Wqfi1b+11AkPrJw9RlyFQ9HSe3w2jnni2VYyfA/p1XKoyi1ztts7OeuRDFOM
         CrQFmV5Uah15bwRYQdO43StkUj68XvRTc5Lxo72gztNRbItEGje+G2tJ2tw8ACIMasLo
         pXcCInQQrnqfnTxzAU6k0NsxMjBqjypUBECzKDc/3cu1jxlVy2N47a4vIut/zo6dHK9m
         hBLXYruXdMNGDV2HZliDif9RXXbhmf4ts1MbPfZMdLTUxdJCP9vSlbGdf5ix0YurE6Fx
         dV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456037; x=1780060837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERrj/ew67k+04R85vJSKMEJ/AUxyWsHxKe8K8F/Tkpk=;
        b=LMytzeIse70SvjZMaHncEWU9fmeWg7Lu2j11xXg4yFWAFuBIQmrUZOBbU2UCNj8Qwp
         NnYKMGU+tIM0VTNTBjuVKmC8z+9UU8BJC8tIGa7cPdPBr/TyYiam9okLEBkOSV5Mq8yI
         D/HnjV6PsffaUCCVIGQ50Va4CGiGbBYJECwOo+A3ExAh3MWm62KZlbZNrY2di+xMghjW
         J7Jv8Oq9Sm+dPsTAqPDYoCpeuWjLNlIylpJQV687lwQrVNa9omo1BYbWC7C3ZbaJdR4n
         C8pkCdCIqzP/ULUWNS06VTEBdGHfvyRX/Gr2zv7GnW+MEojGKfAxZq6UcajmeEUp7YcI
         FjAA==
X-Forwarded-Encrypted: i=1; AFNElJ8+vllEXYmfG3df5t5XY3wb8n3kUBLi7CfWWbdm38M7rqe45soGHBFbb/jCUsZv9tm6Y6vksFJPAVyt0mPlqTQT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8OzyGs+hFUcEa9n7I/dfij59Kzg7Xiu7dg+NfgLjdTDL+OsdQ
	iAsbbKrH0CQWw/Ic8RDVBLPOhyqCKlon5r42pH16ZzZ64fnbecB6NdQE
X-Gm-Gg: Acq92OH8+NNlQuSfCaVgBp4k8SZzi8bFc7XZrOHciYVRGt8AqQzIJZG2tYyf/IrfPFg
	+OKZWo2mdEIQqX8P1ZyitiTBbWgPp9CFWBpr3gedoTNJfWM+dtPD0xzz9ju+GhDet7Bq3pEPinx
	izNBe3Yrxw9XHpavC2Cgqh4V4NPmgh+rmiUIuLUpczDvYWXz1u1BEccB4N6sBMrLTFHGGrWD5qY
	aC/Bai6xBM6xt40zj/eAKbqopt6M3RnpGtniOrw0igO1TndI1SGrlebveOMPPpHJe3JOBUfUo68
	XAoFUO13AJ7NsvgmLrRz0WcjLXyRZ7RaDTuCSI2KBRL0yF8u+9ROqtkC04QLPzDHrk3/n2fNSkf
	otlPQHMxWm87/xxDIf7JZrqqbUECFVruGL2mDha1if+p4/m5oGU8pKxCKZxy658NEeN3wMFFYTV
	xaBxG7mUoQZIF5jOIqPdZGZTC0Pze4/f/C2RavP9yclDIu5xtw4LkF
X-Received: by 2002:a05:600c:1550:b0:490:48a0:b87a with SMTP id 5b1f17b1804b1-49048a0b90dmr20498045e9.9.1779456037100;
        Fri, 22 May 2026 06:20:37 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:36 -0700 (PDT)
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
Subject: [PATCH v2 01/11] arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
Date: Fri, 22 May 2026 14:20:14 +0100
Message-ID: <20260522132014.226721-14-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062039_304927_97C41556 
X-CRM114-Status: GOOD (  15.69  )
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
Changes in v2:
- Use panel-simple compatible form

 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 123 ++++++++++++++++++
 2 files changed, 128 insertions(+)
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
index 000000000000..0e873f2ccf65
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
@@ -0,0 +1,123 @@
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
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight_pwm3>;
+		power-supply = <&reg_3v3_lvds_bridge>;
+
+		port {
+			panel_lvds_bridge_in: endpoint {
+				remote-endpoint = <&dsi_lvds_bridge_out>;
+			};
+		};
+	};
+
+	reg_3v3_lvds_bridge: regulator-3v3-lvds-bridge {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
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


