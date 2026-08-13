Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52115C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VK36CbOGVcOzaatP6Iu4YWlcyKL8YIDa/uuP+k8f9qM=; b=1OOVDfthScSBtlB/isd0XetMeR
	wGPU2iIvV2OrZb+CJvVUxxkAUiabmKCXJadQlC5y9xDmzDwHIemHSs2czeasDnlaPT331PlAlGcjM
	gwVxa6D/MgEQEmQfWrl68W1Xop2JGnoZqptmHAm1Yavc5D0bZyBPNf3Q2vivsQhiPLtUPONNnR3V2
	rUfY+WLjZBdkpcnQ3dDwoBVay3u8sMcbqGZAI7VC+DTJP9KBwQ7IcdXNbM18QP//Scd8n5U7P/gJR
	ahNAuOJ2nNsjebUXrPca77DEXQ1x6dBfRUyU2xYggC9dK85MmfJECxJLZKc73f4jRBxTLtlLHa4bn
	BQSFLfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaR-00000000l1X-3nrU;
	Thu, 13 Aug 2026 13:35:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVaP-00000000kzt-37dx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:35:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cf50c6f235so30421975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786628109; x=1787232909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK36CbOGVcOzaatP6Iu4YWlcyKL8YIDa/uuP+k8f9qM=;
        b=aaUyl2PG6JG3573Vk//H8oqgRWrngKBv8ADIurUcUFdg7IWtNgwUnXd/RI/SI4MB28
         AGLk1AIpuJNnSY29b2UDcdu2UWzF+cu8yKuJAz+Z7ZX5saoJWY1CcVtmVTmV/VZsEEa6
         8C59eSwCS9c3MCy7XJMMk/EUgNqkTYw9VEFy298dxkfVU6CEPtACZTFTbYkB0XN1R2yD
         +0LSg9f9y1N42AgBN6lusSor/SqARulNPeKjo4Gdt9URSnFN968RyFjwA08bKmHXjKkI
         ZzmvxYcP3NyGkUPCEJmEgIP2LzxVS+AbyqZ4jz75N/BDe/vG+NhyMsHnFlXaH/j8VttY
         vZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786628109; x=1787232909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK36CbOGVcOzaatP6Iu4YWlcyKL8YIDa/uuP+k8f9qM=;
        b=oQjs32jEDZ26xcqeDKi4LvBdLMkTXWlYBEV6km/7LonVrYeZ7AfI8FYO4h/K7faYZq
         fj0O/KZJjCb1hrt95TQoU/HIdsoWKMSjTe6AFBwQGVYVGEZ/zDfgH3vHw4vsBZwncZPm
         zXHm1mrXtK9sManjiOfiSy2bBggcUYDWP+VXk9ZKaFwWc1x+tiR9ZNd5h0ZqWs2f5wn3
         vSMvW12TpnaO5U4DxtjhRM1mfDWdlBQMlaQHSrxRGElm02MGE1uLGTPHv1Or9xuguqg6
         hoiw1+Te9Jd8WQeqeJxcxVkUVdbb9KvC6jfbP/qYcoKUIeEvlayqUDvcqLnm//9vu9ju
         MMeg==
X-Forwarded-Encrypted: i=1; AHgh+RqWREGWMI/9WfKXhXRokwWeoQrfLrMZWSaUas2hiLNprLNIzeU16HIMEOQmmOoy0Umy4mGGihHTICH8NPAgHZRu@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFZv4aOtCeW44bpgA0q1TSGZw/qNfZ4W0VR1tWOpkvcOR6vQO
	0Z9mgcOiB7yW4graB09QO7ZZZXUwt1wak1ZgAE/4q3C/h+nZTtppqmkF
X-Gm-Gg: AR+sD11F92MQxkA5xXHtghddyH2JR0aDFqxbM9Qjxo9VuNZCltikK/ZQm4WImPhKPVR
	M4fCh6jTKqv8PTzs3uhuATXon20E0ts+M6r97WL/2RUgMVSo6tmSomQG6T50E9J3Knnj5o9/+ri
	48q9OcmD/naGZlnM3yKN3A5PKa//mLP5/SR0hJ8HIDmO6nh90lQrhKLnsu/6YWUtmdG47IcY+cE
	aWLMMivFnwsr+pLutMEAL1k75bH83x3eH3ABXtpvEJIv6E8LDqxNZh08nRrEDruFoIVsQTOuvS5
	4zHY/DWc/1K3U6dwK9M2zBbXZKmuGx7gybbqarsBlPCpG4YEiYC1CcQpyy+kzXleH80DuhFcnWR
	Yr3BREK7bsMjmi+PjIzT58gze6yPu3XyfYKtv3k2ELF+KoZZKBLos9VcNH0AhaiAhayKLnCrXk+
	ukdS5xF0IHfma7KJDB2dpxSudRFIYYCWPOCnd9H+8EShrkA4VYPe86NyS8OrGZyQxdxVo=
X-Received: by 2002:a17:90b:540c:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-3931e26c688mr6942633a91.16.1786628108491;
        Thu, 13 Aug 2026 06:35:08 -0700 (PDT)
Received: from leonardoc-nb ([179.160.38.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d891sm8447990eec.5.2026.08.13.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 06:35:07 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine with Toradex Display 10.1" LVDS V2
Date: Thu, 13 Aug 2026 10:33:35 -0300
Message-ID: <20260813133335.1941580-7-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813133335.1941580-1-leoreis.costa@gmail.com>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_063509_796371_8422479B 
X-CRM114-Status: GOOD (  15.29  )
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

Add a device tree overlay enabling the Toradex Capacitive Touch Display
10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
by an ILITEK ILI251x capacitive touch controller.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...zanine-panel-cap-touch-10inch-lvds-v2.dtso | 107 ++++++++++++++++++
 2 files changed, 112 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 236bfb6a1e19..39c5f0db5203 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -509,6 +509,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw74xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw75xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw82xx-2x.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-dsi-to-lvds-v2-panel-cap-touch-10inch.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
@@ -524,6 +525,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb
@@ -540,6 +542,9 @@ imx8mp-verdin-wifi-dev-dsi-to-lvds-v2-panel-cap-touch-10inch-dtbs := \
 imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-dev.dtb \
 	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
+imx8mp-verdin-wifi-dev-mezzanine-panel-cap-touch-10inch-lvds-v2-dtbs := \
+	imx8mp-verdin-wifi-dev.dtb \
+	imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtbo
 imx8mp-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	imx8mp-verdin-wifi-mallow.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-lvds.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
new file mode 100644
index 000000000000..b78322907192
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" LVDS V2 on the Verdin iMX8M Plus
+ * Mezzanine LVDS interface (J10), used with the Verdin Development Board.
+ *
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ * https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
+ * https://www.toradex.com/accessories/verdin-imx8m-plus-mezzanine
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
+		backlight = <&backlight_mezzanine>;
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
+&backlight_mezzanine {
+	/* Verdin PWM_2 (SODIMM 16) */
+	pwms = <&pwm2 0 6666667 0>;
+
+	status = "okay";
+};
+
+/* Verdin I2C_2_DSI */
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		/* Verdin GPIO_3 (SODIMM 210) */
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		/* Verdin GPIO_2 (SODIMM 208) */
+		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
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

