Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35198C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AzSmeiBBpTlgTrANysRJi9lJX2Ve1g4o0H/NUCnUg0=; b=2LP+cTbePYEBJpS0yIjh19XoqG
	rSWmLpiTKbJvbd59tGGlrTpwXxzt2h5kmCbuC92nnR2iIFSfgohS7K0J5F4VzSLEdMSnzbU3DRXez
	yr9I/ApL12yy9Rgt4EdpPrzYIJYufNgaJtYZfAix1i0nV8JDpCa+O481kfPWjKgflTeVzpApktEXm
	fDkFlB6PIMEH2ii/zq9Seo3DXkssfmRTxwMr6/YglwSLffE34/+YgmgrvSdMvPJKjevuAgwMj/s5v
	ia52rJeGf8uoK6XFD23DimB2FtFwrREwdyTok0jtI5M6DregMHfBXX6p3ImbxsNW7TU7jekyRDkHb
	Bgn3Ts6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9meC-0000000Be8h-2Oj2;
	Thu, 24 Sep 2026 16:50:12 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9me8-0000000Be6f-1jcW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:50:09 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso13716f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268607; x=1790873407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AzSmeiBBpTlgTrANysRJi9lJX2Ve1g4o0H/NUCnUg0=;
        b=LjevOnUWeljY3NOOZM5iyJz/+jQvBQOzNLodI89WMhc6yqZlAEBp8RXLZjlvmz1vsI
         tVJPdCClERmCpgy6KF0JlEf4bSKilAb8hwwcAyjma4VP+m0x30F9SOWM1/Rjn9pivpC4
         84CcYK4mJU7lIEvov52Qw2eHGIhRtRxZGM5oZk98uUHiweOIfcORjkein1KsClJ3jG0s
         A4kDkZsMI/+AZYW3MbLKVL7RAxIC6SXCBLrsoRzD2I6NPVuN+GxnTLNkVIYerBPqGTw2
         aW5k/lU/cvMBj31Je5Y/T22PHxEDVbe4JEgu/qHY5izonEuji3o7rz19oe6ivZBx0PxY
         bcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268607; x=1790873407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+AzSmeiBBpTlgTrANysRJi9lJX2Ve1g4o0H/NUCnUg0=;
        b=b/FMRwXwV3phxdwur1GFlAJFlmTFUuxYBm+pN9w9mbwYzVDZycFUe1dz4xS0PehKhF
         pueW6oGX0qFIFENf0r4Lh+8/MLzVTtKgtmJ4tWGvIpOvppVgJ5sEp4cuCVAHX4JHgLqS
         fDJ7LFkbnZu5Xu27W5hlMi0Q/zhv+06Y0+mn6C9tq+jOWU5YCsYDBU0ZYl56rnzC0emg
         bSYlTsbj1aIzZBdvFTNW1qcgMdLrXBUpXMBvren40K2mrQ656pqz7KfiaWboFUsw7G6U
         LLCEgrSG2NSE0npD+lrLd0qvvD5RmUMjQBCqQnmC/u0yRHPcqnSoUxPADwBrLaxDa6m2
         iApw==
X-Gm-Message-State: AFuF++nu3gKuW0UufQwtbHRKaLDPkKQeWp6XIvEl4zApnocQZ5rJk9tW
	q8a9w2c3b0CZ3QJGPxVNUeesfUMIalHBD7+3Jzwhfg0YfZVuLUmGduDpB0PQcZOHCbdZ2iLjp7i
	P/FxCk90=
X-Gm-Gg: AYBFou2HDCJjrCybnd5aU3VXkEu/F55e1Z/IAo0OTFmlO7ap6vMwq2qhNWCPko+EyjM
	kQYoOHCYLPAgT5xoif83K5i4k60npcrZkwY9gU0pvSDFjYR1/gU5GjQneFLRdM2roH/LKWOdcQw
	1oaKjBaZpE+S/JO1O4/Q1LIZ4azwJr6fWqByCNW0ePm67wPCpSGYw/zaUCaqg9YoXe64ATcUJkV
	GqUahxIp7+UDgyFD1O36Xql7o0RzpF/dBC4ei3+kyiR/kX9i9Fkk1d9dEHsPuTSXLJ0rFrm80R0
	eEIPTVxblKDRktFvRroSufTc1iDOSfAx3kFX6ZWabgY5z/TSddXQAM9XgRvJGO7aFCuNsT4OBAs
	YFsxYNu/xWV2Fv+zJ0FxIPV5xkCcDRoCfwmhkRkbmfrsiZ5yCvRXz19VT7S+qc767aHOM/3anh9
	s/Fw4WnbfaNF8zgyG2vcaWzoW7r16oHGEWIRHsbZN051M0kLbCCWwvZEKW/fj1uEMNN0Iln7bRl
	dRpVRekdijSReYXVZVtvX0aUTuTGJ3fvLZB
X-Received: by 2002:a05:6000:2f8a:b0:487:27f6:a4d2 with SMTP id ffacd0b85a97d-488716a5f27mr5629854f8f.34.1790268606795;
        Thu, 24 Sep 2026 09:50:06 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a3625ccsm327139f8f.22.2026.09.24.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:50:05 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v5 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 24 Sep 2026 18:49:19 +0200
Message-ID: <20260924164922.117236-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924164922.117236-1-ag@ffroot.co.za>
References: <20260924164922.117236-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095008_482769_651B3572 
X-CRM114-Status: GOOD (  14.64  )
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

Add device nodes for the peripherals that have upstream drivers:
- PWM controller
- Watchdog controller
- eMMC controller

Add a label to the gpio-leds node so board DTS files can override it.

Move the memory node from the DTS into the DTSI; this chip has the RAM
integrated and it's not possible to add external RAM.

Remove three board-specific pinmux nodes that do not belong in the DTSI:
- emmc_pins: eMMC pinmux, moved to the LTPP3G2 board DTS.
- sdcard_pins: SD card pinmux; the SD driver is not yet implemented.
- emac_pins: Ethernet pinmux, will be defined in board DTS files that
  enable ethernet.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 .../dts/sunplus/sunplus-sp7021-demo-v3.dts    |  4 -
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi | 74 ++++++++-----------
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
index d5c5ffc20565..d764fc1f946e 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-demo-v3.dts
@@ -23,8 +23,4 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@0 {
-		device_type = "memory";
-		reg = <0x00000000 0x20000000>;
-	};
 };
diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
index ae9bbe0320b8..9963501b6a41 100644
--- a/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi
@@ -17,6 +17,11 @@ / {
 	compatible = "sunplus,sp7021";
 	model = "Sunplus SP7021";
 
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512MB integrated */
+	};
+
 	clocks {
 		extclk: osc0 {
 			compatible = "fixed-clock";
@@ -84,50 +89,10 @@ pctl: pinctrl@100 {
 			clocks = <&clkc CLK_GPIO>;
 			resets = <&rstc RST_GPIO>;
 
-			emac_pins: pinmux-emac-pins {
-				sunplus,pins = <
-					SPPCTL_IOPAD(49,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_CLK_OUT,0)
-					SPPCTL_IOPAD(44,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDC,0)
-					SPPCTL_IOPAD(43,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_MAC_SMI_MDIO,0)
-					SPPCTL_IOPAD(52,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXEN,0)
-					SPPCTL_IOPAD(50,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD0,0)
-					SPPCTL_IOPAD(51,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_TXD1,0)
-					SPPCTL_IOPAD(46,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_CRSDV,0)
-					SPPCTL_IOPAD(47,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD0,0)
-					SPPCTL_IOPAD(48,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXD1,0)
-					SPPCTL_IOPAD(45,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P0_MAC_RMII_RXER,0)
-					SPPCTL_IOPAD(59,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXEN,0)
-					SPPCTL_IOPAD(57,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD0,0)
-					SPPCTL_IOPAD(58,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_TXD1,0)
-					SPPCTL_IOPAD(54,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_CRSDV,0)
-					SPPCTL_IOPAD(55,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD0,0)
-					SPPCTL_IOPAD(56,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXD1,0)
-					SPPCTL_IOPAD(53,SPPCTL_PCTL_G_PMUX,MUXF_L2SW_P1_MAC_RMII_RXER,0)
-				>;
-				sunplus,zerofunc = <
-					MUXF_L2SW_LED_FLASH0
-					MUXF_L2SW_LED_FLASH1
-					MUXF_L2SW_LED_ON0
-					MUXF_L2SW_LED_ON1
-					MUXF_DAISY_MODE
-				>;
-			};
-
-			emmc_pins: pinmux-emmc-pins {
-				function = "CARD0_EMMC";
-				groups = "CARD0_EMMC";
-			};
-
 			leds_pins: pinmux-leds-pins {
 				sunplus,pins = < SPPCTL_IOPAD(0,SPPCTL_PCTL_G_GPIO,0,SPPCTL_PCTL_L_OUT) >;
 			};
 
-			sdcard_pins: pinmux-sdcard-pins {
-				function = "SD_CARD";
-				groups = "SD_CARD";
-				sunplus,pins = < SPPCTL_IOPAD(91, SPPCTL_PCTL_G_GPIO, 0, 0) >;
-			};
-
 			spi0_pins: pinmux-spi0-pins {
 				sunplus,pins = <
 					SPPCTL_IOPAD(26,SPPCTL_PCTL_G_GPIO,0,0)
@@ -291,13 +256,38 @@ uart4: serial@8780 {
 			pinctrl-0 = <&uart4_pins>;
 			status = "disabled";
 		};
+
+		pwm: pwm@7a00 {
+			#pwm-cells = <2>;
+			compatible = "sunplus,sp7021-pwm";
+			reg = <0x7a00 0x80>;
+			clocks = <&clkc CLK_DISP_PWM>;
+			status = "disabled";
+		};
+
+		wdt: watchdog@630 {
+			compatible = "sunplus,sp7021-wdt";
+			reg = <0x630 0x08>, <0x274 0x04>;
+			clocks = <&clkc CLK_STC0>;
+			resets = <&rstc RST_STC0>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@3b00 {
+			compatible = "sunplus,sp7021-mmc";
+			reg = <0x3b00 0x180>;
+			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkc CLK_CARD_CTL0>;
+			resets = <&rstc RST_CARD_CTL0>;
+			status = "disabled";
+		};
 	};
 
-	leds {
+	leds: leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
 		pinctrl-0 = <&leds_pins>;
-		system-led {
+		led-0 {
 			label = "system-led";
 			gpios = <&pctl 0 GPIO_ACTIVE_HIGH>;
 			default-state = "off";
-- 
2.53.0


