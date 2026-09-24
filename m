Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C68C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4nApwDcK7osAtHQ4CZDuyWi27LJxNQtg3TKGcmGjpI=; b=Lrpf6vW7xKIFfxsiW1qOQNgTFP
	3VtTOoUBwCeSK6Eyq7XO7Qusr0tjO+SJYDLzFoXxYdRVmprJ93FouHT5mOlN3QcdGDbXKpjHryKC1
	6tTRpPWbI6LUZymZx+dTBVovw5aZw4XXYw15FnYrhoUR8owuZ2fymIrqqu8RYYmDjuIXBNxA/RHIF
	FJmXIGLevGAhhBFZ1uer9VSAhZAbjTxvCUsKL+HeJB5UH45BmP1mgHohfF/cyhDKoHZb71edndfGl
	ja4FPzG35RxdSa1L55FNzmpL6F1Gi3AeEy9A3Q8w2PjmHKzB68gDSihDO4ZeNcazIZHXDENUK8TAU
	uY+3LmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lOZ-0000000BPwH-3mnu;
	Thu, 24 Sep 2026 15:29:59 +0000
Received: from mail-wr2-f35.google.com ([74.125.225.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNs-0000000BPN8-3sNP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:18 +0000
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887635e952so232198f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263754; x=1790868554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4nApwDcK7osAtHQ4CZDuyWi27LJxNQtg3TKGcmGjpI=;
        b=BJXheJljm0yhOPQHdBm/TE+nkkmS217rKKMsrGAxyF7HXu1NnN/VF0FAwZ6xiTBg34
         lhMawNlEdw/VgtsaqEH9NQT2YC8p6PSxrTf29cHkTBNBksWf4P8np0hYbc0P+wcQKDH8
         lbGfMSMjyWpDRDfdPyc8kb1Qkpqce32aZAc6QqkQSRCsBtRq5pD32HVzxhfUfOulBReP
         n8nX/q10Oy1kZqScK0zitAL/0gLXK2ataQFqAftNYfxkkxmgA0o7XJu1D/8vdYmsBCiJ
         tKIvpESJaQxC1M2bhiOei9ZkWVj5GX43bSM38UrRRKqIclnIg9/7pi3HwYAIR8pU4er/
         IJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263754; x=1790868554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4nApwDcK7osAtHQ4CZDuyWi27LJxNQtg3TKGcmGjpI=;
        b=UxG3CfqlWE12+H4oI53qdqhyMrHvk8T9mrmuhK5zlZQWFRaJgYYNJm+vpcbvAUMus5
         mVri0HzuYCrsjA+3cwvUJ2aZMLg8cq0ELcy56vb7gx8JUQ6jC2ZMUzMrNOYGd04ouJ3F
         aItORxV2usOmglUGJLMhxs7B1w3odYm0L0L8zM7gcc5Y8jxHiAs+xbyqQN+2cS1St9AW
         gl2smC51CigbUp/Gw0TawQYR2Ja9zk2hlKFBD2lfIFr+PxkJJHBqkTWxKWUJ7qpR2t60
         RrHwwf0/Ldvuq5F9VqXvsLo0R/pTuk/B9meCtTLKXCMfxhnKOHYdXNc64jZGTTOLPQb1
         8g/Q==
X-Gm-Message-State: AFuF++mhxQPjcEN9EbG3/zFQC1dKEjEWWm4nj3fwQDDo9BPs3Aex+eKw
	IGN2YKVTXhh5dyaOx1DyhdgWY5Yq6rbREk+TQPMMkYvVa3KR2ZgHwgxNNacGxf/HY47bpISXKPH
	lDbiaBSo=
X-Gm-Gg: AYBFou0JH2jV46b90felxr9JLLcuULYRCwtmZPv0XZNcBxwp2ASF655V9Qy2QWJLtzr
	rk5MXEfq89dU+MI3l/Nzm474ntNcFGYhfYfXDhhb2TFU/NBRDQVwnQUCksVZkn6aP5XmzW6TJgh
	BE7bMg0eFNOWKWGTUHu+Q+FpAhEgcu3SLRd1pbwqnX0vtb4gw7HWHH7556RzsZYu/qZxamqi7ea
	jqJmfIPZOUU1N9EPxWLYvmadfBJSJduU7KtGH/Lu0DN2NApPg8uRsvXd3Kun8NkL2fb3AU4vZ1h
	0jVtJ8+VRL73Z3IB2yhNYM211FhJT4dS7TFuwuCFO+bHw94jPiTEoI+EjTpe49i+lOaiCc89oHX
	MPGh7wPdHr3SvFF9giDRAT1SJXK1f794zQFrU/Dd+ZMjsZJcEcPKxXuLy1wAqSviJ6N5v/w7WX9
	bM38RWU8nacp5T4Y5LbSEkSHJU6pNwi4FJic+e3rbrQeDG1gVFX5wVTaQDc/HUXw7DYan2VCgqL
	taTGWYiYzKfR/AnIbEse1MBcMmmCJTDYHaf
X-Received: by 2002:a05:6000:184e:b0:488:5fa9:34aa with SMTP id ffacd0b85a97d-488716d22bcmr5931880f8f.20.1790263754406;
        Thu, 24 Sep 2026 08:29:14 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:13 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 3/6] arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
Date: Thu, 24 Sep 2026 17:28:41 +0200
Message-ID: <20260924152844.81705-4-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082917_047398_47D53C61 
X-CRM114-Status: GOOD (  13.43  )
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


