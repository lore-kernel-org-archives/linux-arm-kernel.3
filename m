Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6AFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17in0dPu1cEXsBpoGpIQO8NBNGwqAQlLqZX3FuIiHHg=; b=cWD57ICPyqQowDeTUtYXDdzY/K
	nVjYeUjpyNjf7rE1vHNvANDUhXin6K78TzXYSljrPXkfYz2u2LyGR/OBTQzA3WnNMh3i+I2lt4ZRQ
	FCSv+jYinIE+KqsZTqAaHklaOKQJoN9ATaN3KEE/9nvkqsU7scfYWGotwqfC7zGWdqGUIaYoYlBdk
	Ep3u8MPX2uVPUf0jnkrTjZpmDSQ9T8QLmhjPRh+8SQlB6xyd+O8jvLO+3btMZ5QLGwKcq2eayDtIo
	oagJobH03rZKAP7xVsaS3B4VAi1XS/EcnqlbcGP5t7rxHNXUGelgQ1n1NDszxusSDBxeMLWCwTCE8
	cSS6ZkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeKu-0000000Dq24-2rEY;
	Wed, 05 Nov 2025 14:18:08 +0000
Received: from mx-relay23-hz1.antispameurope.com ([94.100.132.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGeKq-0000000Dq1d-32iK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:18:07 +0000
ARC-Authentication-Results: i=1; mx-gate23-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=17in0dPu1cEXsBpoGpIQO8NBNGwqAQlLqZX3FuIiHHg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762352273;
 b=F/1/9cqfN1uLr7Ws4LZGQUIbvKjWjbLlaa3HRLaj87a3FHWimsQh2ST/0DHiTRFJTAZGzY52
 dsbu1ZGZE8fkOt2XjJv2NyOIFqxK5vFhn3dN2z1gKKrSVZN7Yp4pn4hVp8LkO/6SSJ6S8wy4PFy
 eaZCM7+IdBEu8xEVJhR6lH5M9tfLarLK1U8cAHBpmtfe7rTR+QTWUIEKoteDlC56g4rMksGlc9w
 W44XfE9NJHpd/DpZFJ4Pe0xLZ468YEZpTc/Wef9XCnPkkC1uneAI+hn9b//8lWpvoC5SoTZzLJV
 R5CfJBvzJ91MSEEvyJZ3/k4f3x2AzOdPvVkLG2zlVT4qw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762352273;
 b=OMJAKQiw3QYzc3flg3WKCvbGo0GJUbe2JMe43hh+DEZahuQPeD57J96jO1SJ3WxZZSuWq8yO
 /2Jrxm2P2+WFWSRUhJsNw/zBHXFU5ZKuaPbhqlFmaspBcnHKD+H27c7qP2kLlwK9ggyscXKf0hi
 nj6t70HwqN+EOK4C1H9+2HF0onTFJKnPbLt0+6Qr/vHydUnlQF2DtWCxJy1W10+3XIUqg9jBwHO
 otZwQcR7yqW0UB8YiJzpybc7FiWf3ZbSJtsfY9uvz2o7l9cSa+E1RMoYoifYMMJOjIlknks1eZ1
 TGPu6ZbPDzU56rckPswDqPCXkGrqS5dDIRtLw8m4z5c/Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay23-hz1.antispameurope.com;
 Wed, 05 Nov 2025 15:17:53 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4B688220D4A;
	Wed,  5 Nov 2025 15:17:43 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2] arm64: dts: ti: k3-am642-tqma64xxl: add boot phase tags
Date: Wed,  5 Nov 2025 15:17:26 +0100
Message-ID: <20251105141726.39579-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay23-hz1.antispameurope.com with 4d1nTg6CRtz4NP6l
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: baa9b331185fd744344aa7d6361c3463
X-cloud-security: scantime:1.822
DKIM-Signature: a=rsa-sha256;
 bh=17in0dPu1cEXsBpoGpIQO8NBNGwqAQlLqZX3FuIiHHg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762352272; v=1;
 b=D2pOX3YpDZr13Fu6/to5HkBGSjIvqNV7XKE3r6kO3fWXJiEemj8LoyaFp1WhqJRl9jsZ+cXM
 K5N6G/pco/CM96ETuVCPGS4XUZ8QZVbyjL52Txye7yl5LRJhFdCXa8zRUlcu6DAmd18wHzpF95T
 0353I7X6CaORpP2ODrcm69KJNyBpJlX9Otglj3hLk3fsjC5ZOsJVOIzKexqHdN1qhEqonYom6wq
 +Nva1b1iE7d27PNk1b67J5xv1RRkIoeCf9AzneuwyH9iC3rXt4BIbRqf9rWQXREbrVZ4IKG0snr
 dVEMy3rFJk0X8VPHcQB49XwH1loEh1ffWnwbqITh1itRg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_061805_225247_180141EA 
X-CRM114-Status: GOOD (  14.73  )
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

Similar to other AM64x-based boards, add boot phase tags to make the
Device Trees usable for firmware/bootloaders without modification.

Supported boot devices are eMMC/SD card, SPI-NOR and USB (both mass
storage and DFU). The I2C EEPROM is included to allow the firmware to
select the correct RAM configuration for different TQMa64xxL variants.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2: order boot phase tags after other standard properties

 .../dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts     | 18 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 15 +++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
index 8f64d6272b1ba..7a69e729eae84 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
@@ -175,6 +175,7 @@ reg_sd: regulator-sd {
 		regulator-max-microvolt = <3300000>;
 		gpio = <&main_gpio1 43 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		bootph-all;
 	};
 };
 
@@ -260,6 +261,7 @@ &main_gpio0 {
 		"", "", "STATUS_OUT_3", "EN_DIG_OUT_4", /* 32-35 */
 		"", "", "STATUS_OUT_4", "DIG_IN_1", /* 36-39 */
 		"DIG_IN_2", "DIG_IN_3", "DIG_IN_4"; /* 40- */
+	bootph-all;
 };
 
 &main_gpio1 {
@@ -285,6 +287,7 @@ &main_gpio1 {
 		"", "", "", "", /* 60-63 */
 		"", "", "", "ADC_INT#", /* 64-67 */
 		"BG95_PWRKEY", "BG95_RESET"; /* 68- */
+	bootph-all;
 
 	line50-hog {
 		/* See also usb0 */
@@ -334,6 +337,7 @@ &main_spi0 {
 &main_uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_uart0_pins>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -493,6 +497,11 @@ &mcu_uart1 {
 
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_USB>;
+	bootph-all;
+};
+
+&serdes_refclk {
+	bootph-all;
 };
 
 &serdes0 {
@@ -500,6 +509,7 @@ serdes0_usb_link: phy@0 {
 		reg = <0>;
 		#phy-cells = <0>;
 		resets = <&serdes_wiz0 1>;
+		bootph-all;
 		cdns,num-lanes = <1>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
 	};
@@ -512,6 +522,7 @@ &sdhci1 {
 	cd-gpios = <&main_gpio1 77 GPIO_ACTIVE_LOW>;
 	disable-wp;
 	no-mmc;
+	bootph-all;
 	ti,fails-without-test-cd;
 	/* Enabled by overlay */
 };
@@ -535,9 +546,11 @@ &usb0 {
 	maximum-speed = "super-speed";
 	phys = <&serdes0_usb_link>;
 	phy-names = "cdns3,usb3-phy";
+	bootph-all;
 };
 
 &usbss0 {
+	bootph-all;
 	ti,vbus-divider;
 };
 
@@ -625,6 +638,7 @@ main_gpio0_hog_pins: main-gpio0-hog-pins {
 			/* (P19) GPMC0_CSn2.GPIO0_43 - MMC1_CTRL */
 			AM64X_IOPAD(0x00b0, PIN_OUTPUT, 7)
 		>;
+		bootph-all;
 	};
 
 	main_gpio1_hog_pins: main-gpio1-hog-pins {
@@ -748,6 +762,7 @@ AM64X_IOPAD(0x0298, PIN_INPUT, 7)
 			/* (#N/A) MMC1_CLKLB */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0)
 		>;
+		bootph-all;
 	};
 
 	main_mmc1_reg_pins: main-mmc1-reg-pins {
@@ -755,6 +770,7 @@ main_mmc1_reg_pins: main-mmc1-reg-pins {
 			/* (C13) SPI0_CS1.GPIO1_43 - MMC1_SD_EN */
 			AM64X_IOPAD(0x020c, PIN_OUTPUT, 7)
 		>;
+		bootph-all;
 	};
 
 	main_mmc1_wifi_pwrseq_pins: main-mmc1-wifi-pwrseq-pins {
@@ -797,6 +813,7 @@ AM64X_IOPAD(0x0230, PIN_INPUT, 0)
 			/* (C16) UART0_TXD */
 			AM64X_IOPAD(0x0234, PIN_OUTPUT, 0)
 		>;
+		bootph-pre-ram;
 	};
 
 	main_uart1_pins: main-uart1-pins {
@@ -865,6 +882,7 @@ main_usb0_pins: main-usb0-pins {
 			/* (E19) USB0_DRVVBUS */
 			AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0)
 		>;
+		bootph-all;
 	};
 
 	pru_icssg1_mdio_pins: pru-icssg1-mdio-pins {
diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index ff3b2e0b8dd45..dde19d0784e31 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -17,7 +17,7 @@ memory@80000000 {
 		device_type = "memory";
 		/* 1G RAM - default variant */
 		reg = <0x00000000 0x80000000 0x00000000 0x40000000>;
-
+		bootph-pre-ram;
 	};
 
 	reserved_memory: reserved-memory {
@@ -54,10 +54,15 @@ reg_1v8: regulator-1v8 {
 	};
 };
 
+&fss {
+	bootph-all;
+};
+
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins>;
 	clock-frequency = <400000>;
+	bootph-pre-ram;
 	status = "okay";
 
 	tmp1075: temperature-sensor@4a {
@@ -72,6 +77,7 @@ eeprom0: eeprom@50 {
 		vcc-supply = <&reg_1v8>;
 		pagesize = <16>;
 		read-only;
+		bootph-pre-ram;
 	};
 
 	pcf85063: rtc@51 {
@@ -89,9 +95,10 @@ eeprom1: eeprom@54 {
 };
 
 &ospi0 {
-	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins>;
+	bootph-all;
+	status = "okay";
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
@@ -99,6 +106,7 @@ flash@0 {
 		spi-tx-bus-width = <8>;
 		spi-rx-bus-width = <8>;
 		spi-max-frequency = <84000000>;
+		bootph-all;
 		cdns,tshsl-ns = <60>;
 		cdns,tsd2d-ns = <60>;
 		cdns,tchsh-ns = <60>;
@@ -121,6 +129,7 @@ &sdhci0 {
 	disable-wp;
 	no-sdio;
 	no-sd;
+	bootph-all;
 	ti,driver-strength-ohm = <50>;
 };
 
@@ -132,6 +141,7 @@ AM64X_IOPAD(0x0260, PIN_INPUT_PULLUP, 0)
 			/* (B18) I2C0_SDA */
 			AM64X_IOPAD(0x0264, PIN_INPUT_PULLUP, 0)
 		>;
+		bootph-pre-ram;
 	};
 
 	ospi0_pins: ospi0-pins {
@@ -159,6 +169,7 @@ AM64X_IOPAD(0x0028, PIN_INPUT, 0)
 			/* (N19) OSPI0_DQS */
 			AM64X_IOPAD(0x0008, PIN_INPUT, 0)
 		>;
+		bootph-all;
 	};
 };
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


