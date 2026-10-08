Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73A1CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77EiD7dcsGb4llxm7OK0Zi2OZUN1sK/BOEaDbwqRY3o=; b=zB3EooReDSNwHg+kr3+uUZVhDC
	6pDeBGcGAM8kK8NGthnjFR6jTinmY9aOlxiBaBcQBDtfaokGDHq6Ew437ZRMqEN2hpNOWWQY6WzcG
	M5grWHMvlTctihrMhfuMhK+0QSqbVeat7w7SbO5s+u764i4r5iMqxeIhVnCy285BZZO64kVD5968+
	4ysMFQ1TaYi416MrrE9nNl44Fr2XhNJRYUv03cOqrpsnkeipbGhlXMEh9BZwpFnYsDwaOVBFXru+R
	893LiG2ssG6FtAj99OC2NCR0pilKKSb/RRKrYnOXHGeXP+2YFt1Jb7gqtNPskPwjNiwKX30pSqxCG
	fC9X5sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEd-00000003z8X-172h;
	Thu, 08 Oct 2026 09:16:19 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEkEW-00000003z6D-2dKP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:16:15 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5992020236A;
	Thu, 08 Oct 2026 11:16:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77EiD7dcsGb4llxm7OK0Zi2OZUN1sK/BOEaDbwqRY3o=;
	b=Q4GfX8sSjPEmAnk9uJVgCG06IspsKkj4m2Jjzbt7C2BHgmZ9BFGYzJ87wP3pCo86L3ODA2
	KxX4kubrFODMN/t3TkGVrR9VzVAKSptov1Q8qaERoktxuG2JeISNdXFycTHaHqScdFEe4z
	ywwvpfbkIBEvcyNiU3gzV+Ht+vWgv9PImK2RNwK/7qF65ibvwIhv7Od+SQXHfL8daTrr2V
	3swWRgFqOjLXog2E9qBhjce5rbAMv4hWSuGFsfC2amNC7ZWBKiT86HE9Je2P6/clrzjKSC
	kyc+h/xEhPP+TZM/HptJSz79ZjQ7rFYCI9VrXZfG42xsyQXuNBP8OERYowl+Zw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791450969; a=rsa-sha256;
	cv=none;
	b=BBWeUh/osREZ8QaIcUuENfie6kHo/C9wY1bBdzeDuQtK8UcPUc2AZJOkMbujYP2FbqeBtG
	ld0eT2zbnNbICGGUiHLk9k5WHUazfO9FeNAX0Ofysm2NMsso1i4qElUflE8e/Vaqd6gTQ6
	X0rfHs3URvRKoWfaZahQBfUNRU1OuG3pWV+kwvAb5QXxfvb9Ob5z3sLuvyp/JOZVQq+btQ
	/hxdfp0eLU8wmC9qe+fhaim4cnXBR8GX9ll9gPe3g3dTXFKA842lJ1FbVKCFJFP7tleIX4
	UfC8gQCuCJ/f6aBWyEmsQDJ6P9t8qhiHdSmnzaa1CnmAfD6wjak7pe03lPwG0Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791450969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=77EiD7dcsGb4llxm7OK0Zi2OZUN1sK/BOEaDbwqRY3o=;
	b=YFKH5/WFKolhGRZqq32w2siYIbPIg7P+bT9tUYCPwKW9hViw/Yg5cudLSNpaDMX4+u+6ur
	op+tHBv8u7fo8+bzSoNFI0U2qMeltiiKZGFGmrnq4DuiVqnAr6whfTGBccRG+71CEm/YE4
	o0ILuarXu6DXuQREwUDuEwvJlkdd4sGnmnUQYuqDmGKNDb9/uKUbTCU9KprdEuNuZ5ToFr
	4nQWQPPN4ajyKm0Ke9K/uzHXUoGmFtXRalgnx4vt94Nr09pBJMsa11gsnFCfznhOb8P2Gr
	Q9BaOdlrBPLDsPWcKil91SIUxN2Xr+IchzsDtZ62XxRxEB248xa8Dwp5YqdUJw==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 08 Oct 2026 11:16:00 +0200
Subject: [PATCH v9 2/3] arm64: dts: imx8mp-skov-revc: convert to overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9118;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=7ReLI/iGZrXbZ5xJxaeRTlXH1XL879P2e2jdc31lBfA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bx+Ii61o+V4U9LlyVpL/3PPY+Lue/PuqfGJ/OepRwL2
 m/+xq6to5SFQYyLQVZMkUVlYQWfqMcHz8hpIlwwc1iZQIYwcHEKwES6/RgZflxW+/W2YdXf5xa/
 peQN3yUcKljJcLTmsfM0ofTFK0t2OjMy3GrMlL+msL60oOWSp8NyB8etkSvvbXlXdCI0aeLHOgl
 uXgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_021612_964897_BA5E8F45 
X-CRM114-Status: GOOD (  13.23  )
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

Add a compatible for revC-based Skov boards with a touch panel for the
common dts.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  5 ++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 6 files changed, 92 insertions(+), 99 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d53..5599e45ffdcec 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1155,6 +1155,7 @@ properties:
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 49025ae465f22..d706290b8dd02 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -475,6 +475,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
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
similarity index 56%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
index 3e320d6dea3a2..c830f3ca8cb45 100644
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
@@ -48,14 +35,17 @@ &lcdif2 {
 
 &lvds_bridge {
 	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
+			  <&clk IMX8MP_VIDEO_PLL1>;
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


