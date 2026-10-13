Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25750CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlwY3wvczgL6laWgfQpGV/1faEWnauYjZxdjpLfOXoc=; b=OrHnq2h5GZnKBVkyAhncuf5hgC
	p59FSBZpHyfYm1KyjNq0gWEcKrMQg0hr21LbCtGV6r8nTAvrS6Xr/Xfc09qZz6oZjzQC1fwYA2Xuj
	HMUW/ZUq+dAMl02v0NWV+gKPfdX/PaFgN8mUYXSl/i+cd3XXFdMpC/1iPwGjiRn9APm24BNQJVMIz
	/b7W6zyA5AXKmHuL321fz3FATK+xXvFy2sdckMKRL/qfPtMowEHlIGDE4xBTxg5ndlztjR5AXV/fd
	yUbmpQYwoIrKlZDb86f7p3p+3e6tGYc/2detLHnCGeyS+ehfECUs4I5chnr2T+EMojECDF0SWcfBw
	FOyQrX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVtF-0000000C8G9-3lap;
	Tue, 13 Oct 2026 06:21:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVtE-0000000C8Ec-18o8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 06:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vlwY3wvczgL6laWgfQpGV/1faEWnauYjZxdjpLfOXoc=; b=DzLZQj/uFAT3JLVEF36PnoHRoF
	uGoSt5vNiIwd6A/kZIZ6zzT/OeKv2nsySIMR5b4XujDbZ1TkO9WFu3p8g4I2lkm8eKE+wB6wzQWjF
	NIcu3VItzgCoQhgYJeWUyGmWKr/tIXhQWf8AJ2tiF/aba5KjUn+4sbU3YOpxZ9Rpn6ncr/lxfIQn4
	KVMDDXPaqCbeS36JxrglC9SUZ7mudyj2vNDs0v94k+fUnLm/OmPIiLAHS00ytVB4yL5P2l3Z7pa+U
	IFplZCkr7hkYAT0IWWaW+UW6jR3COFbrU6TxHAYTuPagum3haZi92PxoBNX8UcTppOf+TKVVWE4hp
	LKW6jEog==;
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVsy-0000000F9eL-48Eg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:21:29 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 12557201E9D;
	Tue, 13 Oct 2026 08:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlwY3wvczgL6laWgfQpGV/1faEWnauYjZxdjpLfOXoc=;
	b=FMsRauBzRihiQ6heXUKwp1b1P26kw1fzdHU9zxxjg8Be11/W81r2ZJ1qYB1jHfG93SK63P
	ptjibrlzYJhZl5SU0GR1KyrNJjFpZCIpPMJs8Rou6ktlRCAK7qKOKEl9QbZdcvRL99cVsG
	Ht7yyzRDKRdIRPAmn93YVCUm2tgHs+2R8Gc26mut29Zn8zoVxPOs2ugbxlZosrr2G4mmWy
	BmW0ca7OeGVqpC0wK7dMlo862jqoAS3OmV3B14kXbKBCGJ2f26cVlbSqUpuZi4+KQFPoR1
	CdIb1NPNszXykUSRohwiw8I8ztBSbfJOG033QI/+TwkURm6GQm+ZZ+QdpO+VBQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872473; a=rsa-sha256;
	cv=none;
	b=X7g3XCh9amJfN2hT7NEVzo3QSEEHEJ2rfBfIFme6bbmJsbkLP2wcaOzKSML3/cdl2bpRyQ
	tgRQPN/YKaEQetpWp8afC+J6Fs/b2kbMtrbwCoZHbB4JyjFQqvV2UoXDSbYPHCUKnJIWvP
	2tZH4x7y1+JPvy4Qcp457zLGMtr/zlduQpiCK5iVQ+G7jNsNSTWi5QRYWEEb/T5b6a73C4
	5MLSylGzOJ0vV7B4budVmw2VYCniHdxhDbtYzLTHqiXPCoNnxqoY9xTjcmdsCT3OGSX7dw
	y/OtCSkgVhwVLYz862JpoaLGAOlyA54eRzrs+C42YyH00uRIqrdM29P5+WCI4w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlwY3wvczgL6laWgfQpGV/1faEWnauYjZxdjpLfOXoc=;
	b=MkkjZRTmNRJ2y+Bvmp3FApuC0sT7A4Al4Au5RbeVlFa1sZN0r29UU/IHUZ0nNL5JGMGHrI
	+0pW/D7hqdkOyR6xZiVchzI8XBdDT6aSdtrDcSM6LT6mYN2O5CNyZsCftwL+2G1bxloNRe
	+TDDbWSm+ys3onPAb/L8pPP/AXjtteAwzDH1Bk+L7C7Lmdlsxt5Fmb7s1DUQLMYAmBDf4T
	y4HxnkcsU1wZP8bxOjNvRmj1Emxq9ps0KawD/oOxL12mLUuGmG+0vbvY40f2tgOVpB1nn+
	EoGcgISXI7+qt0w6NhElynIGya5mkHssQZLi7alyxWNQWlHBHUmOAn3PtKJQUA==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:10 +0200
Subject: [PATCH v11 3/4] arm64: dts: imx8mp-skov-revc: convert jutouch and
 tian to overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-3-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8014;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=qDXjvgTTiBsZn/+Np2Ilr/OCzwP4g9S0xK6lWFE/YDM=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9fjlp79IvdSRuX9N33P3KbGcu4VJos+7m+UfMB/h
 /f3lYKIjlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABNx0mNkOLFJaOe6O4VXHwue
 bP40b4vXKVm2IyJSh48vvhc++S77JkGGfzpc9/Xaio0fmP0J/Xzr/LqV2adnK9ybZuD/LWoP28H
 79xkB
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_072117_779879_34BB5634 
X-CRM114-Status: GOOD (  12.97  )
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

The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
similar, apart from the Display and touch controller.

Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
variants to use overlays applied on this base version.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 24 ++-----
 5 files changed, 90 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 475e1ad9116e1..7c1b61249778e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
+
+imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
+imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-tian-g07017.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
new file mode 100644
index 0000000000000..33ddd08a7adb5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "jutouch,jt101tm023";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@2a {
+		compatible = "eeti,exc81w32", "eeti,exc80h84";
+		reg = <0x2a>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1280>;
+		touchscreen-size-y = <800>;
+		vdd-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
+	assigned-clock-rates = <0>, <506800000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
deleted file mode 100644
index 9a562c011f2c2..0000000000000
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-
-/dts-v1/;
-
-#include "imx8mp-skov-reva.dtsi"
-
-/ {
-	model = "SKOV IMX8MP CPU revC - TIAN G07017";
-	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
-
-	panel {
-		compatible = "topland,tian-g07017-01";
-		backlight = <&backlight>;
-		power-supply = <&reg_tft_vcom>;
-
-		port {
-			in_lvds0: endpoint {
-				remote-endpoint = <&ldb_lvds_ch0>;
-			};
-		};
-	};
-};
-
-&backlight {
-	status = "okay";
-};
-
-&i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5506";
-		reg = <0x38>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_touchscreen>;
-		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <1024>;
-		touchscreen-size-y = <600>;
-		vcc-supply = <&reg_vdd_3v3>;
-		iovcc-supply = <&reg_vdd_3v3>;
-		wakeup-source;
-	};
-};
-
-&lcdif2 {
-	status = "okay";
-};
-
-&lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
-	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
-	assigned-clock-rates = <0>, <358400000>;
-	status = "okay";
-
-	ports {
-		port@1 {
-			ldb_lvds_ch0: endpoint {
-				remote-endpoint = <&in_lvds0>;
-			};
-		};
-	};
-};
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
new file mode 100644
index 0000000000000..b9781a418e4d5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "SKOV IMX8MP CPU revC - TIAN G07017";
+	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
+};
+
+&{/panel} {
+	compatible = "topland,tian-g07017-01";
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5506";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vcc-supply = <&reg_vdd_3v3>;
+		iovcc-supply = <&reg_vdd_3v3>;
+		wakeup-source;
+	};
+};
+
+&lvds_bridge {
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
similarity index 58%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
index 3e320d6dea3a2..8b06a756850c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
@@ -5,11 +5,10 @@
 #include "imx8mp-skov-reva.dtsi"
 
 / {
-	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
-	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
+	model = "SKOV IMX8MP CPU revC";
+	compatible = "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
 
 	panel {
-		compatible = "jutouch,jt101tm023";
 		backlight = <&backlight>;
 		power-supply = <&reg_tft_vcom>;
 
@@ -28,18 +27,6 @@ &backlight {
 &i2c2 {
 	clock-frequency = <100000>;
 	status = "okay";
-
-	touchscreen@2a {
-		compatible = "eeti,exc81w32", "eeti,exc80h84";
-		reg = <0x2a>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_touchscreen>;
-		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
-		touchscreen-size-x = <1280>;
-		touchscreen-size-y = <800>;
-		vdd-supply = <&reg_vdd_3v3>;
-	};
 };
 
 &lcdif2 {
@@ -50,12 +37,15 @@ &lvds_bridge {
 	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
 				 <&clk IMX8MP_VIDEO_PLL1>;
 	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
-	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
-	assigned-clock-rates = <0>, <506800000>;
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			ldb_lvds_ch0: endpoint {
 				remote-endpoint = <&in_lvds0>;
 			};

-- 
2.51.0


