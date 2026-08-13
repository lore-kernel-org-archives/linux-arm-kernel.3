Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E87CC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76pkAusEOm/VkUOJ6R3g1tJxf2NW1RkLVmy3ipv7D0g=; b=R0v3uMzWhMl1fulMoayBEzluTO
	ef82dY0iEoxViJRVcdOi9YttBjn51kR/o8qfvSHdy/RPtqDUyzG632nj1bsGnjpGL8NoMTjFhTi8W
	Yg2Jz9Gd6yJS6MCj8gjvSUaJduElHfoTuABP5vLKdTHdjBOsLmy4uRQ5EtR8xoTH6lmtdUEXe4vdX
	lhMoibbw1tI5je7fo3nvkrZ8Eedi4PjeeMHXRuN4af9yXLxPBmDOIQujLwl1TU8yhqCIZBB32gcrz
	IPDZaQbgymTDM+VgmkkJyxHzBnE1cvO5p4du9uALVqSzAIoZk6ErgW0DzmNO9DOvESJ506wbN8XNz
	IWOBECvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaD-00000000kso-2rHb;
	Thu, 13 Aug 2026 13:34:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaA-00000000kqh-45K0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:34:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceb096e675so9220015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628094; x=1787232894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76pkAusEOm/VkUOJ6R3g1tJxf2NW1RkLVmy3ipv7D0g=;
        b=FWAC+Le5ZehCrS0xZRl0ex+2g3i1tijptwKG0wWSafFXOGY+VyMyy8VXYsMIQ38y3+
         JTfXDqgyeUF8wn+LaE0LkiB3sdZvptY22PjH+oOI2AJjQuzTHT/yu3a+iHjbU0w5GFuh
         At4dfubZsqE+bMhstpSCKxMjuMq4K0r7qrxnbgOqiA+h84t/bgetJuX1fTUQLc5kshol
         2PxG2LEddGpV6ul1/QEqov7rhugCJzEza+srC8CeG/x0QNQ5yW5fmn2+VKxjjH7TeA7U
         1x9b7UwIyPZhekqBl1qJSuJIJqre2rV++jTVYeEi+ZDa6LFmJ5gvvuKutxmSzKpQcHvM
         0hGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628094; x=1787232894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=76pkAusEOm/VkUOJ6R3g1tJxf2NW1RkLVmy3ipv7D0g=;
        b=hvFLKtQusYFpIUqFuqISnCquFpfNfdNpDmieVw8vBYai9Euj13BEN083xYTXRZGU94
         CCXpPGH1a0umBBrQP9K8eH/aMyVoqp/ZE0PiisCLFq4Zq0ZI43B7NkszjH0JJPFuUvfK
         owK6wvvVIm2rEngCcMltDasBGcU4ZcZnDsiKxlt1ggLsJM1qW86r4g1lw2ZlFg75kNaA
         Z5ilPJFQ/IN+y7Xl89tdyz8SM3Eg1nV84iIovpSW2AnvpPkjeCQbORozqT73xBaGdI+9
         QxrV3CqKAvceDfcIiyaZvoeKOrF6rSkTuaJun+0Y1XCHXm1MpwlHTf62TZ0oMhYaVPrl
         dubg==
X-Forwarded-Encrypted: i=1; AHgh+RqIQQ+2hznGmU9CyiPB7Plq31E1Or49Jx3m1ZPDfwQM+VE2sqWVihO9ogdQmSLZCPjwz+5hlZ7mEU/+EVlub+R7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo/DsITEN9fXNRn22fEkkxTDvd69tHNzBuI8u9/fsViH0KoZyz
	Q7shCSX/2Js5fAHGg+1C8bCs/UaFgDfprMcJOlUhx6pGH3PYOVlW+siS
X-Gm-Gg: AR+sD10ev1q4/w2iB5zwRUME+1mPs7vHYiFubTOblFNXmvmO9wL9q/2Kj6rQyqIh3zx
	TN6QXDInP8cHOPyBk40M7cbSed+Au23FS0X2Zm42hw8jz6H6Ax14DyJCNPeUB99Kxds73NC3vPI
	7Ia6SUGApG5FWcXP6pw/CjcPOPqEOpLdAnSKhvRTeBgKj8nx5FQbdt2U47r+ROWQ99bPPZfuZFt
	yiO/1CJUr3/bHwKOAi1EwMC7mpTI0kS/R3vU5WiycZkO5Sm9GwajmofnVs4+fVKV3GbbHPcnY3h
	QOyIFI7a4q7ZjBNQjAflyPT+YglMR4D128Kz5mFfOfBVnTFouQOkKD43Y6M4g9t9IiE0CrGz5N1
	uO9oH/UZ5DvZTvKv+FGLS6/1IMbw0MP8syyL3Jo/IuNISHi2ZOy1ZZFUstTKAkznrLJJDVSZpyX
	o/KYuXWh/yDC/ZtpSb69G83renCdbV63ISZCpPZBgM2qewXM1UKZChPOkDkU7CI0emcE6oDqgHF
	RVd3mc=
X-Received: by 2002:a17:902:cece:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d37d695848mr54856575ad.9.1786628093944;
        Thu, 13 Aug 2026 06:34:53 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:34:53 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH 4/6] arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" LVDS V2
Date: Thu, 13 Aug 2026 10:33:33 -0300
Message-ID: <20260813133335.1941580-5-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063455_031286_6544D267 
X-CRM114-Status: GOOD (  14.98  )
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
LVDS V2 connected via Verdin iMX8M Plus LCDIF on carrier boards exposing
LVDS interface (e.g., Mallow). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD and the touch input is provided by an
ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...verdin-panel-cap-touch-10inch-lvds-v2.dtso | 118 ++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 37ae0954d02f..2bfed5ac66ac 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -517,6 +517,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
@@ -524,6 +525,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inc
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-zinnia.dtb
 
@@ -536,6 +538,9 @@ imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-mallow.dtb \
+	imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
 imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..6b0c1a10ae2a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" V2 connected via Verdin iMX8M Plus
+ * LCDIF on carrier boards with a Toradex standard LVDS display connector
+ * (e.g., Mallow).
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+	panel-lvds-native {
+		compatible = "optologic,scx1001511ggc49", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		power-supply = <&reg_3p3v>;
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
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+&i2c2 {
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
+		interrupt-parent = <&gpio4>;
+		interrupts = <31 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_D_IN as GPIO (SODIMM 48) */
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&iomuxc {
+	pinctrl_i2s_2_d_in_gpio: gpio4io30grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_RXD__GPIO4_IO30 0x1c4>;	/* SODIMM 48 */
+	};
+
+	pinctrl_i2s_2_sync_gpio: gpio4io31grp {
+		fsl,pins = <MX8MP_IOMUXC_SAI3_TXFS__GPIO4_IO31 0x184>;	/* SODIMM 44 */
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	/*
+	 * This display uses 64.5 MHz pixel clock, so IMX8MP_VIDEO_PLL1 needs
+	 * to be 7 times 64.5MHz, or 451.5 MHz as the internal divider will
+	 * always divide the output LVDS clock by 7.
+	 */
+	assigned-clock-rates = <0>, <451500000>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&panel_lvds_native_in>;
+			};
+		};
+	};
+};

