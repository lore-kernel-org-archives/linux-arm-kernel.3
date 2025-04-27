Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA039C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=; b=4MS9AvPbrlb5TdMaqfDCKSygbb
	5UUOHKmgbQfNz4eW0eQ/M1KflLvAxMBA1oe1sUOFDlylGycXmOogQTWMag8gwfM2Qlqkm/swVRbtO
	tXEV4AwVppDdxhU8LklqvftQopN9sHHEFRnWMOCYJ1qB478+8n0jNzO2VtE5O9lGc8vo5Di8R/tJg
	YNEcqICN+4cf5Drayfu8ytBl9kE97E/Ah8U7poRppaQnFRKcdsYB8YuewTKhWNth3xv0k46IMUaqt
	6AQkv1sv9NPMF7KN+vtleGac0txZM9Ad5AuZRvfs1nOz7YxGwD3ndbVd4pDdmwPyLHUTsNe0Lj+wZ
	ne9OoTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wxY-000000038pQ-1ouq;
	Sun, 27 Apr 2025 08:01:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8wgX-000000037Fj-1y5r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:44:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso23337595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745739860; x=1746344660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
        b=dpztANFbfBs5KVpV+DfebFD7GPQFFuKNUWmRsXsUaetfJvvur5l5L9PMV4tfR26nbO
         nZnNlb7TYl0GFfsnd+ycsDAj7sxTlF44jiUa2y/3y9tMmiWtaxjbha5bF1cI579dCyQc
         Ydfi3Vcx4S2HJZZeqztstuBkrVu39dx/ljPqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745739860; x=1746344660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pL4EuVBd+kCprRkzB/cjMf7Bv+31ykO+OuQZllzhxds=;
        b=gn/LMLRwPgvNDPW8FHAfEWSgBDzkFBCyuXa1UhEkOXR20kqSrgmWx7yOhHfsMwr/xy
         GvS7V8zCeDE/4oivLEd07Lim8Oa3DCvGpl1cFmZQei7uuldo567O2mFGwC2qtYMM1Phj
         7lTt1DnenST3VOHTStzu8gngmI100rKb6NXUT5Fii4Ot11/f3yC9Vch2pi5X467yRBSk
         2JnH5559xsO2Y8Ib1MXkfXRQEO1sGZnX73yZYoQr5dZ5/8mxOPIvJSq4ZC3WDV4jT9UH
         FdbLY0oDvIbH/rjd+mPs9GL2ODS9a2l3s3V2ORKF6PFwtRZGBAL+DdQ/1c8n/q0JH6BU
         AHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO6EligyAsb7JXZ8CR/Tzy9Hw2nYi6IdaLVXphSrwxzv7/Pc3NOxi1WxW+zZRhh6AaDA6U+zrghBT4Y37WBgLN@lists.infradead.org
X-Gm-Message-State: AOJu0YxfFU1Vpn3S7cIZntC7Nx0mCMp6B/2GHXlUVQoCC2KIMPM6Bq0V
	39yuhGlkBAvYsvzxPHAwxRQx9Ga0UNmEjMnykHFb5YtipS5dEUvNSHVjew8K+Is=
X-Gm-Gg: ASbGnctTPTa/Qnqzg5YhTNzuTflj8FYARDA/HcA/UdWci85Q20mTvPZFzvJbwRb+fh/
	bO0fACNJNkZaEMHfxLpHRstPExWwZPZkykZGFO3KreF3HfrxrIi/3p4C0Y+u1GOutD79l6ulUci
	9Sk8yE0hQur3pifN8/TTVuekZH8TALkP2BVAsHJLXMqjC/kXr+QBUOFUalOzHZqTDu8UpehBoNZ
	EbRZHiXtOE9A600fXGXY17wdjXO1jvdtmu0rNABKuUPZot4EVbGFr1HEfkpqE9JRDBbTWSyi2FA
	V0/6W2jejy8RrAyJ8ZzsHd/dgv2FvywAJOsCd5rFfnuEMjvlT7FJWTwvlQtDk06+b1LtvExPtGF
	xIjRMfQ==
X-Google-Smtp-Source: AGHT+IEL/lT85jIG57Q0JOnH775/lJ5IzNoIu0Chk+nAgHGI/dfLdbqsRa7ZO7X6xN8mOHy3m7EIgA==
X-Received: by 2002:a05:600c:58d7:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-4409c52a44dmr92109645e9.16.1745739859798;
        Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:44:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Jander <david@protonic.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Roan van Dijk <roan@protonic.nl>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 8/8] ARM: dts: stm32: support STM32h747i-disco board
Date: Sun, 27 Apr 2025 09:43:27 +0200
Message-ID: <20250427074404.3278732-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
References: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_004421_507468_BE2251D2 
X-CRM114-Status: GOOD (  15.70  )
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

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/Makefile             |   1 +
 arch/arm/boot/dts/st/stm32h747i-disco.dts | 136 ++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index 60d55516f723..c66959edac12 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32746g-eval.dtb \
 	stm32h743i-eval.dtb \
 	stm32h743i-disco.dtb \
+	stm32h747i-disco.dtb \
 	stm32h750i-art-pi.dtb \
 	stm32mp133c-prihmb.dtb \
 	stm32mp135f-dhcor-dhsbc.dtb \
diff --git a/arch/arm/boot/dts/st/stm32h747i-disco.dts b/arch/arm/boot/dts/st/stm32h747i-disco.dts
new file mode 100644
index 000000000000..99f0255dae8e
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32h747i-disco.dts
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/dts-v1/;
+#include "stm32h743.dtsi"
+#include "stm32h7-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "STMicroelectronics STM32H747i-Discovery board";
+	compatible = "st,stm32h747i-disco", "st,stm32h747";
+
+	chosen {
+		bootargs = "root=/dev/ram";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@d0000000 {
+		device_type = "memory";
+		reg = <0xd0000000 0x2000000>;
+	};
+
+	aliases {
+		serial0 = &usart1;
+		serial1 = &uart8;
+	};
+
+	v3v3: regulator-v3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		led-green {
+			gpios = <&gpioi 12 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+		led-orange {
+			gpios = <&gpioi 13 GPIO_ACTIVE_LOW>;
+		};
+		led-red {
+			gpios = <&gpioi 14 GPIO_ACTIVE_LOW>;
+		};
+		led-blue {
+			gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+		button-0 {
+			label = "User";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpioc 13 GPIO_ACTIVE_HIGH>;
+		};
+		button-1 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpiok 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-2 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			gpios = <&gpiok 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-3 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			gpios = <&gpiok 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-4 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			gpios = <&gpiok 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+		button-5 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			gpios = <&gpiok 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&clk_hse {
+	clock-frequency = <25000000>;
+};
+
+&mac {
+	status = "disabled";
+	pinctrl-0 = <&ethernet_rmii>;
+	pinctrl-names = "default";
+	phy-mode = "rmii";
+	phy-handle = <&phy0>;
+
+	mdio0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	cd-gpios = <&gpioi 8 GPIO_ACTIVE_LOW>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&v3v3>;
+	status = "okay";
+};
+
+&usart1 {
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart8 {
+	pinctrl-0 = <&uart8_pins_a>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0


