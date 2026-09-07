Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC82C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=; b=BOoUaZ94AI9tvIFqpM2OrjX7rp
	tXgL3K4lGV+TjYjFIBzxxS3zS5iIvhN+AncyXnTClV8MP8WCo2QBqJEFIE/cQlITGYHvBTp9Jv0Vh
	9KuWqp4Dk6JqtD9QnBP1c3nmTnj8OG8J2AiaxieP5LvwDreEBG6uLhRpx7SYX0k9IPe2GXsJ3rSPi
	YBRvSfk60j/pRiPNEl+h0lWLoty3SLJyg8fIDmEnVScDzmsCerSvcSkOVuDhj6EXA/H6sL6XOBts0
	d4dzNfv/T4ChO7cre96q5Y97j6Qo6hubb/ZD5o3UmXNVHYCT4zoRItkPNmPiK3o/dZ4Evao6xJCAC
	OI9b6/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjP-00000006gfk-3OqM;
	Mon, 07 Sep 2026 11:41:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XjN-00000006gd1-499F
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 11:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=; b=OGHbSV8Tc3fbIwDZYyw0u5BXyr
	3LfaELm8v8Yys3ZdmkQz5ZibjupsNtIFeOA+BGqOAbAZAyC5gLRViD4SWkh7njy0EBAhgwkTl7+Kq
	dGmQv01JFEqemiyhtQYvBrzHGhUkg+JclcEeEDlcFrvThiUVhT73A3VtM/duvgpan1RtpP/TP5bUc
	tmPwOkUGyraQY7Hhk34jlGRAhq16u5EwlROUl+/f8xeBaJpAhMYFDiyr/W7FaNImeeGJDkJuledJX
	9+m2KcPi/BvVxyb8G0P/FmpQaCoPJRO7MIW8pIEcI6e3E7P91v+ggrjLWM884FpS3uy2kMvZFVwSo
	RqPWQ1fg==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3XjK-0000000GAZR-308j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:41:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2171372f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=;
        b=dWYKm609HRdbgxpQRT3FuhDcOR0N4YTuZ+6XuPE2r3GrFQ6GUBdGomLQSuu3HVVw/t
         kepARFh5UOiQn0EapjiS3kKEoxA9xLWh/VV991h8+uv0pFmQGl2PlZPD0917VnkdB6OW
         4qxMvE10gISnsw72QbsntrmhWiusB0CT9IDsMlEa9IxvlROO2doZcEluV3r4NT9kM5Gp
         qid3lYZ3eMp+v4Lnebb2jtQYbAxOxgrOdw7x+888NhPQiWekvN9qtXMOJ6SrI5zsTTLx
         OyW29VrO8pVRZv4l9dvwWQtPQHDOkeEy4V0pmw1D78F6Cd8vdNt3Iws7DHhjoU53VKQE
         dxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781301; x=1789386101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGhU3g1EDTqUexinuXLvBxRKleBWMVdoNp6t/M9e0oQ=;
        b=U2pGxW/cK3E+OhEiD0cXb1WV4naFdarV85g4VwTutRANBBLojikJdV+utH95IQtJCh
         sl3OBYRt5MhaHcWRgw7DkyvqlSw/aJzh9/jQPMreXOUb2SEzvZ981ptSJtcP0LXylGxa
         eZ3pGTBEBT1rtCgWkcsRDV3dKjnm+gRPVxlOdbutImzxMztsw1SKhJ/Jj1sIrtUMcf2n
         Aiy03++IP0nMyTzJLiOYWYIZ+Ju+oPdkPeE4uPH91fH17r/3mDwxp+C8iWEeytGHVwXm
         qzYVteR5MQ8EIbqDq5L3TcBxpAXeTBRFsUI2ltOUPA5Ktg00wRWWov6AtdokJUAMS20n
         tQYA==
X-Forwarded-Encrypted: i=1; AKwUvBzK8230kBXasjaCXaHRA/pwWPPfcZYDynUWuUUGQbjYthQ7VMqy6bVGmJUagoio+Sww4D+Abajg6badZRdDX0JG@lists.infradead.org
X-Gm-Message-State: AFuF++nq1IO9UsvCjBhOqWE+Z7VWNxlU/kFoEXLdu9XEdvrM10KYUVIV
	/EraJ51b1pq03L+3ic9guI+vOiSKGkOMiAUsKmAa/YfSYAXuj2iLCn8SMvZnTerg
X-Gm-Gg: AYBFou1FbhWiGtm6xxkGNVC3320ux3Uv9ZjwrHVvZdGH2DPdwbjfVXy7o3jNkIqfOlS
	Uc86Pf8ZrW59YV24KQR0GxqWGshFOb6STBQSygVIAbHOVWgRbmh3ZDei1EsJrkAPIMwWIcI2Ga3
	3lG44uA3FGQKzrrqPgs8cNm+pKzPAcJh2QHKmMIzUJqZwXuz4tcfWJC5aJl0uqNhTazklDL/Z02
	CNAuocj9591W/0v34uNQ6ztDdyV2OBotDTISfjLqwniMayUYSZDTInS61gzunt3iz5K7n0QYdGm
	gfPIAjMh1dBqGhOTSjn4MZOJJbE2EYsRHE4b4/Cp76Qio9/I2aTAB9gtDqtmgVoQ2qL1YCGiGj4
	Z5PbWchJIBQqhJsiji1rUHMqx5sz81l9/GoeSP5k0QIxxjwZwB/gD4ORLjYXOFjavwS8pdWaCvT
	qu017tVyQvtdnNGp899vLXdvs35O0FuTrcqTanb8HZ0THLVnfdcunE1JF/9+uDzNZbFfaJBAS6P
	PUJQU3okg/kvAeT+sP5AqU2xIzq4GwFTyHMf2EJpO7PfalNLuf/K4RntnIOw0c=
X-Received: by 2002:a05:6000:25e1:b0:482:f270:65c5 with SMTP id ffacd0b85a97d-4858708dcdamr24060589f8f.9.1788781300517;
        Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:40 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 07 Sep 2026 13:41:33 +0200
Subject: [PATCH 4/4] arm64: dts: freescale: imx8mp-verdin: Add Toradex
 Capacitive Touch Display 7" DSI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-4-ca0c63c2994f@toradex.com>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_124142_892303_0E9ADE31 
X-CRM114-Status: GOOD (  15.57  )
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
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 14ea662bdcfd..ca4fec7c1038 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -741,11 +741,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-nau8822-btl.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
@@ -763,6 +765,8 @@ imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-wifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dev-nau8822-btl-dtbs := imx8mp-verdin-wifi-dev.dtb imx8mp-verdin-dev-nau8822-btl.dtbo
+imx8mp-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
 imx8mp-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 
 imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso
new file mode 100644
index 000000000000..f1a82796a9c6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
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
+
+&{/} {
+	panel-lvds-bridge {
+		compatible = "riverdi,rvt70hslnwca0", "panel-lvds";
+		backlight = <&backlight>;
+		data-mapping = "vesa-24";
+		height-mm = <86>;
+		width-mm = <154>;
+
+		/*
+		 * Use a combined horizontal sync and back porch of 160 pixels. Treating
+		 * the panel data sheet's 160-pixel back porch separately from the sync
+		 * pulse results in unstable display output with the Verdin iMX8M Plus
+		 * display pipeline.
+		 */
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
+&backlight {
+	/* Verdin PWM_3_DSI (SODIMM 19) */
+	pwms = <&pwm3 0 6666667 0>;
+
+	status = "okay";
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
+		/* Verdin GPIO_10_DSI (SODIMM 21) */
+		enable-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
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
+		pinctrl-0 = <&pinctrl_gpio_9_dsi>,
+			    <&pinctrl_i2s_2_bclk_touch_reset>;
+		/* Verdin GPIO_9_DSI (SODIMM 17) - TOUCH_INT# */
+		/* Rising edge avoids spurious interrupts from the noisy falling edge. */
+		interrupt-parent = <&gpio4>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin I2S_2_BCLK (SODIMM 42) - TOUCH_RESET# */
+		reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&lcdif1 {
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


