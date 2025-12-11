Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D05D41C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3rLCxy8arP6w59VperOyYrrxNsr7wHMVWS7dXHm70Y=; b=LEVj2/2ThAx2jGPdcpkQYo3Mwo
	OlkgAwHxN3yJF/pfxjmUQIqAoHOO/EhlPLdr2F86Lq2jL4yBpbGELlFlU0M9i4KSigP6/quMJJbEl
	/P5fi00ZyQhgn0T7vNYK3d/ChP/2FIEq0wqi/mVAn6LhmVgu6SdQVy7TIiY+/StCeYbd98bdfi8nT
	LAHKIOS7Mgmh1aPIMvteu2GuVXofBB0W6hOmGTx5upsNrYfj7QeeKu9Raoj8CrK/bFj0/aQjXmBKn
	w1EKi1FwqMjog7DU5HfwOU4Ac08eZgGCSivO891h74QCMcguXIcg3iXtSmtDVbyTDOr4ya8pWVGqd
	/CQWeDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbfv-0000000GLy4-0NEd;
	Thu, 11 Dec 2025 08:05:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbfr-0000000GLxd-3E8o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:05:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29d7b019e0eso9469695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 00:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765440318; x=1766045118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3rLCxy8arP6w59VperOyYrrxNsr7wHMVWS7dXHm70Y=;
        b=fJE9BjjS3LtsafGbYpOn9qPI5Cn0UOTOnfNSZFT0a85VjmEZxAyxdtfwVQDb0MamYh
         X7dB1QoRJkX6Ugt7KzCjxFQKuYztKhBmTz7FF+CXM7DaJTQNee4OG3RV0E2wLL1cLsJG
         xhercE9unX7KSVFIwm0PvoHzVUzAMp9CqhTcehyDwaXckulKBdx9OON2krAzAvtm7CyU
         8w5V7bP5xLcLx0Tle2cChgwewdlbCOfty+FXA037jL3N4lIdDVWm+w9teqlM9unNAemJ
         oSv3FnaKlj0zQJsWkTGOIgWRmcOmtmanz067v0IcMmNa+BlHxcJ3oAa9ViHjwH6S8m2y
         MBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440318; x=1766045118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3rLCxy8arP6w59VperOyYrrxNsr7wHMVWS7dXHm70Y=;
        b=J+KYs2Ama1A8027S928bq1vJ2Sr9aKH3BsomVsTMTJoSwoc/I81+0pBHJojkrhcxTB
         b8dlbvwInzh8mjT6rNXtFkACOzYKiepeh5x7TxwN5T5Oe1/VIN16+jO8ivsoNlPZMUGE
         y2Ns/dcRJ6UhkU3qKRsyE4AV8ekvQRtaM8eJsaKuB5VvvZPHsXmrjbV7uiUCmu1xliW1
         GkDbjnpJS9UZzWok8GjqKO+L3HfHMsxaAgQLf3QncQZ1EQlyimzvGc2FwmFTrkQx3AkG
         4rtbAA4hvzoD6K2AbAYN/dsPz5e94IO5kKbxiOgXRBSX6MC42PvoszxTVb8gXeuWsAOD
         L7fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTbzlpFRLrqVN9WIkn/so1Q3GGUfU8Xw0CNFjc9olRhvAHr5fW+fRVLXDH/KFz9UeJE2GAXD90IN1OTcp+m/O3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3a+zv394GjTs2Yx6HVhx+yQDk3ZsmveNsbBrs6S9TUERZ+Kk
	tP+PDtKT89EYSDY8w5kGzoiVFW1v11nZl/inzp1xlMRKACDQTpCkjHkt1jvyRg==
X-Gm-Gg: AY/fxX7Y8T8pwZ5b5ye1f0pFeV4Lronrl8Yfo8PqkuuxliDyYKc0aLgzX1kHIgxhTit
	BFRAad5bbU4K/cGsUcNleGiyW1Uk0ucB1Uuz8Omfec2EWMglvtEEMoKGpshJ58YGvaIDsU4BwqC
	LPdtH2fJINA/RQEx5zHLvA9f5RtA24Xne2AbcYqTWOU/xnvOdgvzmhWtvqkb3BsgB8Ohve41Fha
	1W6b5N+yrZZZvYIeaMtDXg8UNDJTwF7X7VMSC7p+2QtZgPaM1L1c3Tptr/Qo71fcApPgd7hdv8Z
	9xBtyjL1XKQCV9vf9EYRAjVhCx14svSuWyY/De5qrbBQ07JOl0DhX0/tD39UihF+erZciG0NLMl
	OB+8v1eD+oV2Kt395RKMJU5ZQn5tYq3+fcwH9k+93vGUnJfX4DX+nPhvxPSnrdfVvAEFWMbgCwN
	+2ULTxjUUe6XW2srVTdX1YF3nMNpLQYpRL5mDJlkWrt4ypF5zK6cKMn9s4h8niZ9VSWVrPBfNj9
	zP41vbZ25hY5e0=
X-Google-Smtp-Source: AGHT+IFSb6qHiNb7jgJvSvyN5nw2vItlbOK8l/VjqDL3ZuhE2uUid0Tlm0CFY+T/pBTkwDJQrCPzZw==
X-Received: by 2002:a17:903:1666:b0:29e:9c82:a925 with SMTP id d9443c01a7336-29ec22ca944mr62447985ad.6.1765440318499;
        Thu, 11 Dec 2025 00:05:18 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b373d6sm16118945ad.13.2025.12.11.00.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:05:18 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH] ARM: dts: aspeed: bletchley: Fix dt-schema warnings
Date: Thu, 11 Dec 2025 16:03:11 +0800
Message-ID: <20251211080311.242771-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_000519_834556_AF0E1E05 
X-CRM114-Status: GOOD (  10.70  )
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

Update the device tree to fix dt-schema warnings:
- Use generic node names for SPI, LEDs, and GPIO keys.
- Update SPI GPIO properties to use the "-gpios" suffix.
- Remove unused address/size cells from pca9539 nodes.
- Use 'aspeed,int-vref-microvolt' in ADC nodes.
- Remove unused 'aspeed,hw-timeout-ms' from i2c13.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 100 ++++++++++--------
 1 file changed, 54 insertions(+), 46 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index abdb1562115a..7c27bf6bb51d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -34,14 +34,14 @@ iio-hwmon {
 			<&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
 	};
 
-	spi1_gpio: spi1-gpio {
+	spi1_gpio: spi {
 		compatible = "spi-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
 		num-chipselects = <1>;
 		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
 
@@ -54,7 +54,8 @@ tpm@0 {
 
 	front_gpio_leds {
 		compatible = "gpio-leds";
-		sys_log_id {
+		led-0 {
+			label = "sys_log_id";
 			default-state = "off";
 			gpios = <&front_leds 0 GPIO_ACTIVE_LOW>;
 		};
@@ -62,42 +63,50 @@ sys_log_id {
 
 	fan_gpio_leds {
 		compatible = "gpio-leds";
-		fan0_blue {
+		led-0 {
+			label = "fan0_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 8 GPIO_ACTIVE_HIGH>;
 		};
-		fan1_blue {
+		led-1 {
+			label = "fan1_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 9 GPIO_ACTIVE_HIGH>;
 		};
-		fan2_blue {
+		led-2 {
+			label = "fan2_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 10 GPIO_ACTIVE_HIGH>;
 		};
-		fan3_blue {
+		led-3 {
+			label = "fan3_blue";
 			retain-state-shutdown;
 			default-state = "on";
 			gpios = <&fan_leds 11 GPIO_ACTIVE_HIGH>;
 		};
-		fan0_amber {
+		led-4 {
+			label = "fan0_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 12 GPIO_ACTIVE_HIGH>;
 		};
-		fan1_amber {
+		led-5 {
+			label = "fan1_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 13 GPIO_ACTIVE_HIGH>;
 		};
-		fan2_amber {
+		led-6 {
+			label = "fan2_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 14 GPIO_ACTIVE_HIGH>;
 		};
-		fan3_amber {
+		led-7 {
+			label = "fan3_amber";
 			retain-state-shutdown;
 			default-state = "off";
 			gpios = <&fan_leds 15 GPIO_ACTIVE_HIGH>;
@@ -106,12 +115,14 @@ fan3_amber {
 
 	sled1_gpio_leds {
 		compatible = "gpio-leds";
-		sled1_amber {
+		led-0 {
+			label = "sled1_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled1_blue {
+		led-1 {
+			label = "sled1_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled1_leds 1 GPIO_ACTIVE_LOW>;
@@ -120,12 +131,14 @@ sled1_blue {
 
 	sled2_gpio_leds {
 		compatible = "gpio-leds";
-		sled2_amber {
+		led-0 {
+			label = "sled2_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled2_blue {
+		led-1 {
+			label = "sled2_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled2_leds 1 GPIO_ACTIVE_LOW>;
@@ -134,12 +147,14 @@ sled2_blue {
 
 	sled3_gpio_leds {
 		compatible = "gpio-leds";
-		sled3_amber {
+		led-0 {
+			label = "sled3_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled3_blue {
+		led-1 {
+			label = "sled3_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled3_leds 1 GPIO_ACTIVE_LOW>;
@@ -148,12 +163,14 @@ sled3_blue {
 
 	sled4_gpio_leds {
 		compatible = "gpio-leds";
-		sled4_amber {
+		led-0 {
+			label = "sled4_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled4_blue {
+		led-1 {
+			label = "sled4_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled4_leds 1 GPIO_ACTIVE_LOW>;
@@ -162,12 +179,14 @@ sled4_blue {
 
 	sled5_gpio_leds {
 		compatible = "gpio-leds";
-		sled5_amber {
+		led-0 {
+			label = "sled5_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled5_blue {
+		led-1 {
+			label = "sled5_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled5_leds 1 GPIO_ACTIVE_LOW>;
@@ -176,12 +195,14 @@ sled5_blue {
 
 	sled6_gpio_leds {
 		compatible = "gpio-leds";
-		sled6_amber {
+		led-0 {
+			label = "sled6_amber";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 0 GPIO_ACTIVE_LOW>;
 		};
-		sled6_blue {
+		led-1 {
+			label = "sled6_blue";
 			retain-state-shutdown;
 			default-state = "keep";
 			gpios = <&sled6_leds 1 GPIO_ACTIVE_LOW>;
@@ -191,32 +212,32 @@ sled6_blue {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		presence-sled1 {
+		presence-sled1-switch {
 			label = "presence-sled1";
 			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 2)>;
 		};
-		presence-sled2 {
+		presence-sled2-switch {
 			label = "presence-sled2";
 			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 3)>;
 		};
-		presence-sled3 {
+		presence-sled3-switch {
 			label = "presence-sled3";
 			gpios = <&gpio0 ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 4)>;
 		};
-		presence-sled4 {
+		presence-sled4-switch {
 			label = "presence-sled4";
 			gpios = <&gpio0 ASPEED_GPIO(H, 5) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 5)>;
 		};
-		presence-sled5 {
+		presence-sled5-switch {
 			label = "presence-sled5";
 			gpios = <&gpio0 ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 6)>;
 		};
-		presence-sled6 {
+		presence-sled6-switch {
 			label = "presence-sled6";
 			gpios = <&gpio0 ASPEED_GPIO(H, 7) GPIO_ACTIVE_LOW>;
 			linux,code = <ASPEED_GPIO(H, 7)>;
@@ -352,8 +373,6 @@ sled1_ioexp41: pca9536@41 {
 	sled1_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -441,8 +460,6 @@ sled2_ioexp41: pca9536@41 {
 	sled2_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -530,8 +547,6 @@ sled3_ioexp41: pca9536@41 {
 	sled3_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -619,8 +634,6 @@ sled4_ioexp41: pca9536@41 {
 	sled4_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -708,8 +721,6 @@ sled5_ioexp41: pca9536@41 {
 	sled5_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -797,8 +808,6 @@ sled6_ioexp41: pca9536@41 {
 	sled6_ioexp: pca9539@76 {
 		compatible = "nxp,pca9539";
 		reg = <0x76>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
@@ -953,7 +962,6 @@ fan_leds: pca9552@67 {
 
 &i2c13 {
 	multi-master;
-	aspeed,hw-timeout-ms = <1000>;
 	status = "okay";
 
 	//USB Debug Connector
@@ -1024,7 +1032,7 @@ &gpio0 {
 };
 
 &adc0 {
-	vref = <1800>;
+	aspeed,int-vref-microvolt = <2500000>;
 	status = "okay";
 
 	pinctrl-names = "default";
@@ -1035,7 +1043,7 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 };
 
 &adc1 {
-	vref = <2500>;
+	aspeed,int-vref-microvolt = <2500000>;
 	status = "okay";
 
 	pinctrl-names = "default";
-- 
2.43.0


