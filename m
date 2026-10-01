Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B333CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtEL2g/8NWsR/SmZXJaalescOgxFX8anBFjSYLZjBpc=; b=zAod3x0VUu0jA/Fl2CM8ntF5MJ
	+zvUV1jYRIXGYWTHePv+NR9mrFzOPFL2aJ+C9hSjBNRG0rwCsIQKQiVm0KPD0bvo3ktdsbayqqTSi
	t6W2m1aaYtNmwQssoHs+i4plfSS9BUey2Hvdt7ilrLAPF1ZCRMZQkAvhyVmOE+/ZBbEUBLZTIPbAD
	Mdi00nqY7G/dKvddioM9ITk3rgs1xnvjJ0ZI3SkXWi3XdtQcRxOIkg0PYhsELNvghGRsz69+hCncs
	edGrMJjQEkk9D4qL+9XJo2OKKEClANVlBK+DipmgUdkOrKndkKciJZl7MxxR8th8lQvQyihJpviN4
	mLLndqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD5-00000008fI6-0pFo;
	Thu, 01 Oct 2026 11:44:23 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD2-00000008fEv-3eTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:44:22 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso18561475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855059; x=1791459859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtEL2g/8NWsR/SmZXJaalescOgxFX8anBFjSYLZjBpc=;
        b=BDYBHfHDYsm1JsMTKqd+cYL8MUtkt6E89OnBmx+imR3vm+HANYOOS+QS1AQaF0EZdF
         cB01BCopHOSiaWXGUdqtuRwR8xhukAKE5Xm+sGufTqAfYYX497VIJu3TOY5OEvBnIbB2
         ep846Ny8El9+Qe+Sd9LX9xgqTynXtuLXhnY4F46F4WkqmTNZV+n4qaFiIkE3c8JrvUOW
         FTYFDYt3wrbJAqUJ260hN6x0HlMcmRk64bA9SUsQi/PaPxAYIJYIdLDPj9QueJVN1WRt
         GpxzCPAXke/i6skqbuMPWxUZiNR1AYQm/ncTmHDrxbfiRi9u5sHVLvWZR9lIXZPoGThx
         8ZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855059; x=1791459859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtEL2g/8NWsR/SmZXJaalescOgxFX8anBFjSYLZjBpc=;
        b=k4cMfb+V44vcXB+J2acrw5uNwSHD7kqSpUuLzB/rbiUoxGV3Se5+Hd4uGiP8RrABEP
         RcIdiNViGe7JViKqoltyNNL3i1zZVySDDan8D45r/EYAxVOVrqTZFNduzFje76zSY/WE
         RwJR9tzHOV2cjMM5WwsPleBHajxgRc2h6MtgcBubIXQEBlyeGD7pS8ax5tKRDFbgEbnX
         DvX9Jk7kBWidCltEijvB74iBsfTKHxbFZpYuAyHUIwKAxtW/W71/Yr7mVLdo8+1sfhqN
         MQoLGVvKbfIiM+3MQV4GU95MC/YjfsQnflsa377PANLvEYPNYwvrMGvuBTd7quGMzGtW
         VOWA==
X-Forwarded-Encrypted: i=1; AKwUvBwXjnQfW+gPkHyv8c3bFDLx914JtR6hQT819OAkgI8ZWqnXhJlHYv/2/dwiI0nwwO+r+tok406eoea3brdvG/zB@lists.infradead.org
X-Gm-Message-State: AFuF++lgoE0z8mAolth+J7feJ30PFz/sXhb/fKKoSakobzFetllymCvE
	4H/7quA2lp0qY3st4ojDoUAtAYsGQhHCTN2ZZ5XL1zhihkC78h0D1Ka4
X-Gm-Gg: AYBFou0zi5GJzL8viBFZ5GnvJWuitsBcV4jZDKSoqeMQ2Gql6BKlxlp2licL7DfPK3I
	5MDnFBTkvaBBnahE+m1mYd223JgF+QDXkG6tAX0qlkoKm2+7lGNrquLHPyqfurfb/4zZH9glDUY
	N+ZqeGhRn8yicAnOz/miojgmNR3Q7211UKxHX5dYD6WJWriRGOkxxN6yitkde/P4OsvpNUue9Dt
	Y4I4ZsAaw/Q7V9h7HKFmUNI1nl9BIxWI367rhGpKIuBDQizJgGLFlVBGBEmxyhYo2AYWVheX6kO
	Mh7Z0mUxZZIgnthkRXB6oYst/VU+gY1sA31SY7AuGMwpJXWDPszuEX91Sjy0YnUxjeFNiKWzi73
	28aDEGs53VXYVgrmqg9F0RFShLAnzHYHqeBGjBr3wBLJVGEQ+rxrXENQHO400ZveSSyDNgIlDwZ
	4MnwcrjX4dOD7E7lVraDZCps2T4nmymXalzYDsyl4G1agkrKVKorfeDYQ8/3hIINMUtXZ34ms9+
	vd+785bF2Hpi1LBH0zBUmJTKxkdy4393oFLhsPr/DtTzw/QQ5wYkT/vqZIjQEYIQyTOT8S2Vy0P
	KfOHLSSaBQ==
X-Received: by 2002:a05:600c:8b5b:b0:49f:ce73:7aa with SMTP id 5b1f17b1804b1-4a01b00b470mr68455805e9.35.1790855058853;
        Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:18 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:12 +0200
Subject: [PATCH v2 4/6] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-4-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_044421_036671_341CF668 
X-CRM114-Status: GOOD (  13.89  )
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

The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
sideband signals and media pipeline through different SoC resources.

Add a GPIO nexus to each carrier description and stable Verdin-level labels
for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
nexus in the carrier files avoids describing the physical connector on
carriers which do not provide it.

This gives accessory overlays a stable connector and media interface
without embedding either module's wiring in the accessory description.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi        |  8 +++++++-
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi    | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi        |  7 ++++++-
 8 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index 3d0b14968131..4cf77559e69b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
index 1d8d146d9eeb..51a836324c16 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	sound_card: sound-card {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&dailink_master>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
index 4a0799d63446..5951cd19a84c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 11 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio1 9 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4f64c5da8d15..1eb6b5d2b432 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -224,6 +224,9 @@ &cpu_crit0 {
 	temperature = <105000>;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &csi {};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 
@@ -596,7 +599,7 @@ &i2c2 {
 /* Verdin I2C_3_HDMI N/A */
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
 	};
 };
 
+/* Verdin CSI_1 */
+verdin_csi_rx: &mipi_csi {};
+
 /* Verdin PCIE_1 */
 &pcie0 {
 	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index 0e218e6b8e29..164031d5dd86 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X21";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..c52e46738110 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,23 @@
  */
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
index 846b36706821..b915fbbd04b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi
@@ -11,6 +11,23 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	verdin_camera_connector: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST       (pin 11) - Verdin GPIO_5 (SODIMM 216)
+		 * CAM_1_CON_PWRDWN    (pin 22) - Verdin GPIO_6 (SODIMM 218)
+		 * CAM_1_CON_IC_DETECT (pin 23) - Verdin GPIO_7 (SODIMM 220)
+		 * CAM_1_CON_PWRCTRL   (pin 24) - Verdin GPIO_8 (SODIMM 222)
+		 */
+		gpio-map = <0 0 &gpio1 7 GPIO_ACTIVE_HIGH>,
+			   <1 0 &gpio1 8 GPIO_ACTIVE_HIGH>,
+			   <2 0 &gpio4 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &gpio4 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X14";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 45a4713c260f..53499289cf61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -719,7 +719,7 @@ atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 };
 
 /* Verdin I2C_4_CSI */
-&i2c3 {
+verdin_csi_i2c: &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
@@ -829,6 +829,11 @@ &i2c5 {
 	single-master;
 };
 
+/* Verdin CSI_1 */
+verdin_csi_capture: &isi_0 {};
+
+verdin_csi_rx: &mipi_csi_0 {};
+
 /* Verdin PCIE_1 */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0


