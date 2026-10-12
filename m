Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193DCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZUpjWP2/jJqlHsKNZbKckpigr+fdFmUOwOX/VucnJY=; b=s2FIGVgg24Y0CQuzkKkds1Apio
	0V80dCrkSPWXTo/il4w6PFdY65l6gx2vMcZJDskOocuoi6SsnN72rXQZBsLwd9KL9iR6bf34vdzIK
	fpz5lZMCkVvOq26if2vdq4JEmrUB3Na3QPy90xBYgls67+u8xMT2Oq38i1UAXHLv4YCD7tqryTx4w
	RJUZ7rEgBEH3z2sngDzZBeqea0FkB0IcPxw5Bae/c92gpI8OD0dwbssxODE8gaGnJP+T/LvzTymB7
	RzGIg3q3HZ1xG3wuDG1LlL7n7rsTPP2i4HZg2MnzUDX3CRyCqOnZU3mewrTnejK0Znqal66q9Axlk
	L/T+z0iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZP-00000009jx9-35I9;
	Mon, 12 Oct 2026 06:31:35 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZD-00000009jni-2VYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:31:28 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 018B7201DCF;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZUpjWP2/jJqlHsKNZbKckpigr+fdFmUOwOX/VucnJY=;
	b=V/EuV0xmKRIXznGueED31w775+uwZndAQ2mkBg7Z307O8FlojjE1bq41jwWUttB5WqCjmD
	EDyxL0cXDbX9UtGR8fVR1NIFMzCV9JDCszjTkkFhQObIJ0IdEBrHo7gnEdjVeodMS3zvAj
	XlPINrgn5DRLeiiz7FTMoJR2I3ZLpu+1odOxOw+kYRrIQcChSdXEH5vSkyGl6NZy+AWTrL
	6RQETnu3q9eqTwt+o7iZb/L+24rYtqw/zALd2RW/XR7Pb9CR3xaR2rKrl/nxdxLuLPfdtq
	DtfIUATavQWObrrOzCgVJlazFKJFnzcZf5nbm+fHNlEDRN72HYYkAx6kuNeOJg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786680; a=rsa-sha256;
	cv=none;
	b=JeHaB1XZuZfzH0khOwXCIPLsBThxd6JpbFN21D72qxorir4M9/dfS7Mejq6ceViCCb6ssh
	1EXnCLnTtB70hvk3I6jAsexUYsQJ6NcUxUQxiPctSparcvJYhLFA9hDo706jvH4xDqvO4I
	dTtloRYAM1ECH9IbMDwPFdy7ySy3Xm99YNGrQgvB2laqWr3rA5IGksHS+ZMbwqREfWnC9N
	M3J2PjjRpRyeQIOAeRggD8NdbR5AYmL/lmmJEzyfrfF0VlFvaW0bsSgJIFYT8q8SkXG0Rh
	L8O5gudoPkhpLcSZ2GXRm/z9Hn5BFghW6Thd5sMRWfY8CGwt36Ak8v3JItG2PQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZUpjWP2/jJqlHsKNZbKckpigr+fdFmUOwOX/VucnJY=;
	b=bNMqs7pq1SOYC2xuvPVId26QA7rEU7bvq/QGFPmBK47JlAIrWDRSBb50ESUPSioZE95GXr
	+gHAZZoQ6A98K1KIDtvzPFukZ0Zd5sBPOArHZSL1NHef4lbkOQrlI3p9pMkCE+kjdxXl6k
	phv0ofpnQAns3SSkbiv1K/diVboLj4VvM/H6O1BYNeRSHjqcceEAD1b2V5YGeYtK2lZMSU
	CQcyaOkiQhK2z8KZOFT4lx31jqVnSJ0KSIFfq6tNne1mrhXktyvygXzrUvO8jZ2cXsdugC
	cF09VAkRHRyNfSvrDw6X3f7xE7/+US2xgovsmsgA5hv3XPx8oel+1OeoSNTtMg==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Oct 2026 08:30:32 +0200
Subject: [PATCH v10 3/4] arm64: dts: imx8mp-skov-revc: convert to overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-3-0906e57486a3@pengutronix.de>
References: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
In-Reply-To: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8062;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=5DWkwLuvhVI9WkXp7/Um5OAn9pxep4COzyUwq/dLrrA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZum3N05esvWm7huWZ2iSbi4u4CxWc/AM5IzjNPj+VK
 Sv0ONzUUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCITVBgZ+oq1OJpObdC/zPp0
 ttemZXejLVbGazIrLtXRi2+/vaTBgeGfTt4n/dK/EeK7t78Q9/oi8swu78qWhpDyL8vzhH14nGt
 ZAA==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233124_136779_FDEE2DB7 
X-CRM114-Status: GOOD (  12.15  )
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
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 5 files changed, 91 insertions(+), 99 deletions(-)

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


