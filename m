Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64690C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3he1cNFX+tF1rEerCr+qRpTP/ZJe20EHw41Kf/s7zwA=; b=gfqZVIu9E2/WnpTJyjTrSu/m+j
	7+blJiWgp8eN/bwpOFqLyM0z7jkPcR/P7kSyTjQltBxms9oaHzsmYx00PAlW3EwyvT3zwLbgVaKQ3
	94eUH809zuM+MSM3XY0yk6z0JyFwSmFqgMJUuBBNYgRiJ7UnSrwbhV9SGEbgwZo6RJbrkuszuCLjT
	R9DbGD4M07l9MOBGixftOVDdRGywFNQc7A/T/crB/MvxfKmLDz0fSnPzTc8e2eIgnyakFwmTap2Uf
	a7eiz0/Lr3SUq/ZRd1Rf1kCiGS75VmS9tXDHhzY7cw95+FOGLUjBx4t4lZBFJiCYn4XRFHUiPInsX
	prbqVObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IGe-00000005gLe-2aww;
	Tue, 08 Apr 2025 23:22:08 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2IDM-00000005ft8-3KrK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 23:18:46 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-85da5a3667bso152336739f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 16:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744154323; x=1744759123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3he1cNFX+tF1rEerCr+qRpTP/ZJe20EHw41Kf/s7zwA=;
        b=YKki0tmaBoF1DqcGdIviej3x5SpBmqqXpySJl8RtzYQEWXOM8RyzMQ7Yx8MJbT3WhA
         GndtXd6oRCNCBqk2BjDV8vPAL/0jyANP/BVNXQDE02xDTleUFKrAZ6IuaBBhK9PYcNUs
         HAnX+MJqTVJyC34hFChfNwzmNNb/chDIG9AX68VJZycoxYUIfo9L2/pJK7CBxknKAbMt
         +URDWqgJZcFMXOx4m6wZN9/XrEmsRJo9P3fjE9natN8Ce7qNpaELzBTWGhyXw78U5+JB
         hlRS1MJRyptxAPlWuF+eP9JYr/U9Ikpxx4ZsqyDtqO/8U+9qOEY2K6Th84Q+f2AQ6hk3
         jsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154323; x=1744759123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3he1cNFX+tF1rEerCr+qRpTP/ZJe20EHw41Kf/s7zwA=;
        b=EjuI76RPtMvGD2gVUIiU17OvDLeikDBAzk2TaVh8D+bAAHYl+CsenT7glLcer1k3pr
         xl3Ow2cCVgMe6d2FIhocJskCqoJnBm6HU81X48zsmk/b9e9Vs8D1uIkDRZ7CWiMOOfpf
         LAD2R4psUboOg05qO50LV3yP9nGhXv+V+6Oo9JU6dtGQTKjSUsiGXb8S3eQVaFHrvmTX
         /f3gRBLHl1qdGkzVqs/jB/uumvuutMGPWi2rYJhmsNeWxqFasE+V9i/o8y/qhUnH95pu
         JLUKV0O8PoEQ1XJfwA8SOK9PCz+EsySSiknewcUtSDSvJxwosP6OVl9ezboMxg/wMeDL
         3NSw==
X-Gm-Message-State: AOJu0YxiiR90lu9fNEGVGbBOPlV8axKJcELln5s5/ZsTXTR0t7DSVIFa
	LspFQGqXJ1229Hicl/Lsyo7TxKb/BCiDmI1K9hi2PoJfGe6QS14H/fB6zg==
X-Gm-Gg: ASbGncs1qFVnoL0MbsMNaBwIdkossVwGjoIxigeLndG8EljGNSyaa+439DnSn3POXFs
	pog44UkteL2hd1nSOktCle1vf4zIiVzU1uWGJ5PprKjyDZ9gsj+5zjMJ5RcwkVBmb29AAMIqR/7
	izY32EW/Ctpcr+z0gI8+vZO/WyF/Fucr6cqdwN5c+7J5og15v0mBiySTapBeLtQGstGfLyEWg8A
	Hfu+qXcyDJf32dQuz6gy7QIUPfA5X5ciKpnzJhg48CKxGsw8E+guZWVMEt/nzsRtpCc/O1/UyZl
	2O1kEqdBTG3Q19Pa87r69vshpsEBfdmTiXTdpfRI6QgPSm0qeIqjBLi2m8iKm5I8Y23AyNx3p/G
	PtclpyVs/+4FyO7c=
X-Google-Smtp-Source: AGHT+IHOnEUm49QzqTz8vJZ4+Ws94J0w/Imp6qR2hwe2CXCyj0Qm5aSKpUGiKZHaWv64uC5h3hWOqQ==
X-Received: by 2002:a05:6e02:2186:b0:3d6:cbed:3305 with SMTP id e9e14a558f8ab-3d776c964b2mr9177755ab.10.1744154323460;
        Tue, 08 Apr 2025 16:18:43 -0700 (PDT)
Received: from hestia.. (24-220-158-153-dynamic.midco.net. [24.220.158.153])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e2759sm724244173.128.2025.04.08.16.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:18:42 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nishanth Menon <nm@ti.com>,
	Andrew Davis <afd@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Judith Mendez <jm@ti.com>,
	Andrei Aldea <a-aldea@ti.com>,
	Dhruva Gole <d-gole@ti.com>,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Ayush Singh <ayush@beagleboard.org>
Subject: [PATCH v2 2/2] arm64: dts: ti: Add k3-am62-pocketbeagle2
Date: Tue,  8 Apr 2025 18:18:23 -0500
Message-ID: <20250408231823.826163-2-robertcnelson@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408231823.826163-1-robertcnelson@gmail.com>
References: <20250408231823.826163-1-robertcnelson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_161844_836420_EA090E3A 
X-CRM114-Status: GOOD (  15.28  )
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

BeagleBoard.org PocketBeagle 2 is an upgraded version of the popular
PocketBeagle.  It is based on Texas Instruments AM6232 or AM6254 SoC.
Its dual or quad A53 cores can provide higher performance than classic
PocketBeagle. The new design comes with pre-soldered headers, a 3-pin
JST-SH 1.00mm UART debug port, a USB-C port, Texas Instruments
MSPM0L1105 Cortex-M0+ MCU for ADC, 512MB RAM, and a LiPo Battery charger.

https://www.beagleboard.org/boards/pocketbeagle-2
https://openbeagle.org/pocketbeagle/pocketbeagle-2

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Nishanth Menon <nm@ti.com>
CC: Andrew Davis <afd@ti.com>
CC: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Judith Mendez <jm@ti.com>
CC: Andrei Aldea <a-aldea@ti.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Jason Kridner <jkridner@beagleboard.org>
CC: Deepak Khatri <lorforlinux@beagleboard.org>
CC: Ayush Singh <ayush@beagleboard.org>
---
Changes since v1:
 - fix '_' in main-i2c2-default-pins
 - aliases i2c match original pocketbeagle
 - add mcu_m4fss with reseved memory and mailbox
 - drop unused main_gpio0_pins_default pinmux
 - drop unused main_gpio1_pins_default pinmux
 - drop unused main_spi2_pins_gpio pinmux
 - Reserve 128MiB of global CMA
---
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 528 ++++++++++++++++++
 2 files changed, 529 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 03d4cecfc001..4f8fcb69a2c1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-phyboard-lyra-gpio-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am62-pocketbeagle2.dtb
 
 # Boards with AM62Ax SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
new file mode 100644
index 000000000000..65000ed8196f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * https://www.beagleboard.org/boards/pocketbeagle-2
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2025 Robert Nelson, BeagleBoard.org Foundation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "k3-am625.dtsi"
+
+/ {
+	compatible = "beagle,am62-pocketbeagle2", "ti,am625";
+	model = "BeagleBoard.org PocketBeagle2";
+
+	aliases {
+		serial0 = &wkup_uart0;
+		serial1 = &main_uart1;
+		serial2 = &main_uart6;
+		serial3 = &main_uart3;
+		serial4 = &main_uart4;
+		serial5 = &main_uart5;
+		serial6 = &main_uart2;
+		serial7 = &main_uart0;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		usb0 = &usb0;
+		usb1 = &usb1;
+		i2c1 = &main_i2c1;
+		i2c2 = &main_i2c2;
+		i2c3 = &wkup_i2c0;
+	};
+
+	chosen {
+		stdout-path = &main_uart6;
+	};
+
+	memory@80000000 {
+		/* 512MB RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x20000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
+		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cb00000 0x00 0x100000>;
+			no-map;
+		};
+
+		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9cc00000 0x00 0xe00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+	};
+
+	vsys_5v0: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_3v3: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vsys_5v0>;
+		regulator-always-on;
+		regulator-boot-on;
+		bootph-all;
+	};
+
+	vdd_mmc1: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_mmc1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_3v3_sd_pins_default>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		regulator-always-on;
+		vin-supply = <&vdd_3v3>;
+		gpio = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	vdd_sd_dv: regulator-4 {
+		compatible = "regulator-gpio";
+		regulator-name = "sd_hs200_switch";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vdd_sd_dv_pins_default>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&vdd_3v3>;
+		gpios = <&main_gpio1 49 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+		bootph-all;
+	};
+
+	adc_vref: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "default";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+	};
+
+	leds {
+		bootph-all;
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins_default>;
+
+		led-1 {
+			bootph-all;
+			gpios = <&main_gpio0 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			default-state = "on";
+		};
+
+		led-2 {
+			bootph-all;
+			gpios = <&main_gpio0 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK_ACTIVITY;
+			linux,default-trigger = "mmc1";
+		};
+
+		led-3 {
+			bootph-all;
+			gpios = <&main_gpio0 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led-4 {
+			bootph-all;
+			gpios = <&main_gpio0 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			default-state = "off";
+		};
+	};
+};
+
+&main_pmx0 {
+	led_pins_default: led-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x000c, PIN_OUTPUT, 7) /* (E25) OSPI0_D0.GPIO0_3 */
+			AM62X_IOPAD(0x0010, PIN_OUTPUT, 7) /* (G24) OSPI0_D1.GPIO0_4 */
+			AM62X_IOPAD(0x0014, PIN_OUTPUT, 7) /* (F25) OSPI0_D2.GPIO0_5 */
+			AM62X_IOPAD(0x0018, PIN_OUTPUT, 7) /* (F24) OSPI0_D3.GPIO0_6 */
+		>;
+		bootph-all;
+	};
+
+	main_i2c0_pins_default: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (B16) I2C0_SCL */
+			AM62X_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (A16) I2C0_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */
+			AM62X_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
+		>;
+		bootph-all;
+	};
+
+	main_uart0_pins_default: main-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14/A13) UART0_RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14/E11) UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart1_pins_default: main-uart1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x194, PIN_INPUT, 2) /* (B19/B18) MCASP0_AXR3.UART1_CTSn */
+			AM62X_IOPAD(0x198, PIN_OUTPUT, 2) /* (A19/B17) MCASP0_AXR2.UART1_RTSn */
+			AM62X_IOPAD(0x1ac, PIN_INPUT, 2) /* (E19/D15) MCASP0_AFSR.UART1_RXD */
+			AM62X_IOPAD(0x1b0, PIN_OUTPUT, 2) /* (A20/D16) MCASP0_ACLKR.UART1_TXD */
+		>;
+		bootph-all;
+	};
+
+	main_uart6_pins_default: main-uart6-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x001c, PIN_INPUT, 3) /* (J23) OSPI0_D4.UART6_RXD */
+			AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
+		>;
+	};
+
+	main_mmc1_pins_default: main-mmc1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
+			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
+			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
+			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
+			AM62X_IOPAD(0x224, PIN_INPUT, 0) /* (D22/C19) MMC1_DAT3 */
+			AM62X_IOPAD(0x240, PIN_INPUT, 7) /* (D17/C15) MMC1_SDCD.GPIO1_48 */
+		>;
+		bootph-all;
+	};
+
+	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0244, PIN_OUTPUT, 7) /* (P25) GPMC0_CLK.GPIO1_49 */
+		>;
+		bootph-all;
+	};
+
+	pmic_irq_pins_default: pmic-irq-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01f4, PIN_INPUT_PULLUP, 0) /* (D16) EXTINTn */
+		>;
+		bootph-all;
+	};
+
+	vdd_3v3_sd_pins_default: vdd-3v3-sd-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0000, PIN_OUTPUT, 7) /* (H24) OSPI0_CLK.GPIO0_0 */
+		>;
+		bootph-all;
+	};
+
+	usb1_pins_default: usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0258, PIN_INPUT, 0) /* (F18) USB1_DRVVBUS */
+		>;
+		bootph-all;
+	};
+
+	epwm2_pins_default: epwm2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01e8, PIN_OUTPUT, 8) /* (B17) I2C1_SCL.EHRPWM2_A */
+		>;
+	};
+};
+
+&cpsw3g {
+	status = "disabled";
+};
+
+&cpsw_port1 {
+	status = "disabled";
+};
+
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&epwm2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&epwm2_pins_default>;
+};
+
+&mailbox0_cluster0 {
+	mbox_m4_0: mbox-m4-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart0_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&main_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart1_pins_default>;
+	bootph-pre-ram;
+	status = "reserved";
+};
+
+&main_uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_uart6_pins_default>;
+	bootph-all;
+	status = "okay";
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+	status = "okay";
+
+	ad7291: adc@20 {
+		compatible = "adi,ad7291";
+		reg = <0x20>;
+		vref-supply = <&adc_vref>;
+	};
+
+	eeprom: eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+	};
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+	bootph-all;
+	status = "okay";
+};
+
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
+&mcu_pmx0 {
+	wkup_uart0_pins_default: wkup-uart0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x02c, PIN_INPUT, 0)	/* (C6/A7) WKUP_UART0_CTSn */
+			AM62X_MCU_IOPAD(0x030, PIN_OUTPUT, 0)	/* (A4/B4) WKUP_UART0_RTSn */
+			AM62X_MCU_IOPAD(0x024, PIN_INPUT, 0)	/* (B4/B5) WKUP_UART0_RXD */
+			AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0)	/* (C5/C6) WKUP_UART0_TXD */
+		>;
+		bootph-all;
+	};
+
+	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x004c, PIN_INPUT_PULLUP, 0)	/* (B9) WKUP_I2C0_SCL */
+			AM62X_MCU_IOPAD(0x0050, PIN_INPUT_PULLUP, 0)	/* (A9) WKUP_I2C0_SDA */
+		>;
+		bootph-all;
+	};
+};
+
+&sdhci1 {
+	/* SD/MMC */
+	vmmc-supply = <&vdd_mmc1>;
+	vqmmc-supply = <&vdd_sd_dv>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_mmc1_pins_default>;
+	disable-wp;
+	cd-gpios = <&main_gpio1 48 GPIO_ACTIVE_LOW>;
+	cd-debounce-delay-ms = <100>;
+	bootph-all;
+	ti,fails-without-test-cd;
+	status = "okay";
+};
+
+&usbss0 {
+	bootph-all;
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb0 {
+	bootph-all;
+	dr_mode = "peripheral";
+};
+
+&usbss1 {
+	ti,vbus-divider;
+	status = "okay";
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins_default>;
+};
+
+&wkup_uart0 {
+	/* WKUP UART0 is used by Device Manager firmware */
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_uart0_pins_default>;
+	bootph-all;
+	status = "reserved";
+};
+
+&wkup_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wkup_i2c0_pins_default>;
+	clock-frequency = <100000>;
+	bootph-all;
+	status = "okay";
+
+	tps65219: pmic@30 {
+		compatible = "ti,tps65219";
+		reg = <0x30>;
+		buck1-supply = <&vsys_5v0>;
+		buck2-supply = <&vsys_5v0>;
+		buck3-supply = <&vsys_5v0>;
+		ldo1-supply = <&vdd_3v3>;
+		ldo2-supply = <&buck2_reg>;
+		ldo3-supply = <&vdd_3v3>;
+		ldo4-supply = <&vdd_3v3>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		bootph-all;
+		system-power-controller;
+		ti,power-button;
+
+		regulators {
+			buck1_reg: buck1 {
+				regulator-name = "VDD_CORE";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck2_reg: buck2 {
+				regulator-name = "VDD_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck3_reg: buck3 {
+				regulator-name = "VDD_1V2";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: ldo1 {
+				/*
+				 * Regulator is left as is unused, vdd_sd
+				 * is controlled via GPIO with bypass config
+				 * as per the NVM configuration
+				 */
+				regulator-name = "VDD_SD_3V3";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-allow-bypass;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: ldo2 {
+				regulator-name = "VDDA_0V85";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: ldo3 {
+				regulator-name = "VDDA_1V8";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: ldo4 {
+				regulator-name = "VDD_2V5";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
-- 
2.47.2


