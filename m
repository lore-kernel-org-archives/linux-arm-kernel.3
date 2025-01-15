Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6843C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zo63X4b2n6p23OwJQ1JnY9oZ9Wn9evh647WwH/Y0K94=; b=AmAZ/7JVF3CKoaY7p7BHvA7e6y
	zrzZvMkPcakmX7166RM6Lj/L3A6yTCcCotQa8IyAGhRkED1UvzGB9/dMyiytfmGT6tM6k950aToKR
	uCBJcKnFWpvCGntX2vGYs1glEy24cBMEImg//eI+t8zi8Vz7H8VZvWB0WGNafw1gpOGcVWkbX3g4U
	TuXhYkudOq8hrnWflmHQcgZnfYbbhA0dwYWQ72ry9G4s9xB1QtlMz+0455Rr9D79Q7pAL58a/5ugB
	ZX0kvTiK06Bfk6b1H6XyfTrDUHtSQkZMDwYprJQwKfgZPqUXct5+CdWRudmAVZXAdB7nTUQB7rB8V
	nK7vKsBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Yj-0000000Bftc-36cC;
	Wed, 15 Jan 2025 11:27:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1U4-0000000Bf5L-1i0l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:22:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21661be2c2dso115971295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736940171; x=1737544971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo63X4b2n6p23OwJQ1JnY9oZ9Wn9evh647WwH/Y0K94=;
        b=hATIKfdPSAhM+BR/v92VT8TgadqiiFLQCMtOdNBZJyinSjZ182MbIyIUxFawbLSmMX
         GSzt42N+73J2JwIdg6eVEd1Twxgjc1T3Zng6/2SaP+m11hlSmBOqZaSjPc5F3foLRgNs
         snGYyr5mAXnLvikL3WsqcbZzXqsiA8TqGPJi0CTWuyJOX8+ORDB5EWunUI/9V2olUWsn
         V6qdFA+EEpKvLKGMr8HnGgeuiJDMlRHuFMbwES/31dbJCzXxJ2pDBg+JVhpisu055HF+
         ieOoFpCmkOpaPXAjC5/8oBI3cZg+tgmC3hxYWvz/gVZqDNO0t9+XpQ3RnZttn8p9sJFy
         ea6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940171; x=1737544971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zo63X4b2n6p23OwJQ1JnY9oZ9Wn9evh647WwH/Y0K94=;
        b=P/Mth+iv479tRcp3DqnXdzdCtm67N+AYlCHL63UUCgnm53KZHS/8syvzOk4IRw6kqz
         dk3mEax2r30s1ejK2TGyuXhghOxFbYF+3zBZRJMXFykyY+4S7HCNMCACBTZtJeIzu6MJ
         blfilsgjz5iTovPbbvN15QoZvAd6tgDJnic298e0EELoSCJ9uBPWCcseKG0kDGhodY7x
         qTq008r9ecRMLbu2XadBX1iKe57INIW7Vcbdnt3I/psm9HI1NX2HxM2Cl2dyVH6Ip67g
         WrkCriHnCNm+8Tm9Rs8nixM90B7yXDTAiNfkXOq0v3fNltAPoA0dvJK4RTYwiSVz0VxF
         dk9w==
X-Gm-Message-State: AOJu0YyeMGt4xQNHSxXQUp+6AtnZFfDW2olp1zMUG7Lzd9zoS34hZRHx
	7G0rv1gIeonW4mAT7HrvR2IT4Q6EBzvU/gGK0K6Bgd9T/UGwBiHnggBZYw==
X-Gm-Gg: ASbGncvFROaQh8MS4/vPSUaKV2Ps8foFkuh9lfgRxla45ewGdL2KLiZ/QeCkjBgCaNM
	RYVBc+514Ca3IyhtijJz/oCaJU7yBpEDlhPcJ2AxgB4LtSiFkzAj9NKf2dlPa9mnBxe5lWXRNdY
	/5Ptdc9PJDTTkopilPDwPpvMD7w4MCPbyTryyA/48gJDFAK3tZvZLRvLyzORc0DE+l3RwfBQAhO
	23Blo4dW8nvjovcXK9x/2LndTfNuGDOLhlSuzVdfR/tMZwDYXfh
X-Google-Smtp-Source: AGHT+IEqSWTyEAvhn4NfhqEKLFHJGZYS2WAPJVQyXKuKqmPW3WItXYzuAtZ8poCQD+q257oCT7R+XA==
X-Received: by 2002:a17:902:ea08:b0:215:9894:5679 with SMTP id d9443c01a7336-21a83da498emr452270265ad.0.1736940171409;
        Wed, 15 Jan 2025 03:22:51 -0800 (PST)
Received: from prometheus.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f111b82sm80243675ad.35.2025.01.15.03.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:22:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	Andrew Geissler <geissonator@yahoo.com>
Subject: [PATCH] ARM: dts: aspeed: Remove swift machine
Date: Wed, 15 Jan 2025 21:52:38 +1030
Message-ID: <20250115112239.430636-1-joel@jms.id.au>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032252_451031_D3740D19 
X-CRM114-Status: GOOD (  11.29  )
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

This machine is no longer in use, and support was deleted from openbmc
in March 2022.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 -
 .../boot/dts/aspeed/aspeed-bmc-opp-swift.dts  | 974 ------------------
 2 files changed, 975 deletions(-)
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 2e5f4833a073..456da4b6fc9b 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -55,7 +55,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-nicole.dtb \
 	aspeed-bmc-opp-palmetto.dtb \
 	aspeed-bmc-opp-romulus.dtb \
-	aspeed-bmc-opp-swift.dtb \
 	aspeed-bmc-opp-tacoma.dtb \
 	aspeed-bmc-opp-vesnin.dtb \
 	aspeed-bmc-opp-witherspoon.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts
deleted file mode 100644
index a0e8c97e944a..000000000000
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-opp-swift.dts
+++ /dev/null
@@ -1,974 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/dts-v1/;
-#include "aspeed-g5.dtsi"
-#include <dt-bindings/gpio/aspeed-gpio.h>
-#include <dt-bindings/leds/leds-pca955x.h>
-
-/ {
-	model = "Swift BMC";
-	compatible = "ibm,swift-bmc", "aspeed,ast2500";
-
-	chosen {
-		stdout-path = &uart5;
-		bootargs = "console=ttyS4,115200 earlycon";
-	};
-
-	memory@80000000 {
-		reg = <0x80000000 0x20000000>;
-	};
-
-	reserved-memory {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		flash_memory: region@98000000 {
-			no-map;
-			reg = <0x98000000 0x04000000>; /* 64M */
-		};
-
-		gfx_memory: framebuffer {
-			size = <0x01000000>;
-			alignment = <0x01000000>;
-			compatible = "shared-dma-pool";
-			reusable;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		event-air-water {
-			label = "air-water";
-			gpios = <&gpio ASPEED_GPIO(B, 5) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(B, 5)>;
-		};
-
-		event-checkstop {
-			label = "checkstop";
-			gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(J, 2)>;
-		};
-
-		event-ps0-presence {
-			label = "ps0-presence";
-			gpios = <&gpio ASPEED_GPIO(R, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(R, 7)>;
-		};
-
-		event-ps1-presence {
-			label = "ps1-presence";
-			gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(N, 0)>;
-		};
-
-		event-oppanel-presence {
-			label = "oppanel-presence";
-			gpios = <&gpio ASPEED_GPIO(A, 7) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(A, 7)>;
-		};
-
-		event-opencapi-riser-presence {
-			label = "opencapi-riser-presence";
-			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
-			linux,code = <ASPEED_GPIO(I, 0)>;
-		};
-	};
-
-	iio-hwmon-battery {
-		compatible = "iio-hwmon";
-		io-channels = <&adc 12>;
-	};
-
-	gpio-keys-polled {
-		compatible = "gpio-keys-polled";
-		poll-interval = <1000>;
-
-		event-scm0-presence {
-			label = "scm0-presence";
-			gpios = <&pca9552 6 GPIO_ACTIVE_LOW>;
-			linux,code = <6>;
-		};
-
-		event-scm1-presence {
-			label = "scm1-presence";
-			gpios = <&pca9552 7 GPIO_ACTIVE_LOW>;
-			linux,code = <7>;
-		};
-
-		event-cpu0vrm-presence {
-			label = "cpu0vrm-presence";
-			gpios = <&pca9552 12 GPIO_ACTIVE_LOW>;
-			linux,code = <12>;
-		};
-
-		event-cpu1vrm-presence {
-			label = "cpu1vrm-presence";
-			gpios = <&pca9552 13 GPIO_ACTIVE_LOW>;
-			linux,code = <13>;
-		};
-
-		event-fan0-presence {
-			label = "fan0-presence";
-			gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
-			linux,code = <5>;
-		};
-
-		event-fan1-presence {
-			label = "fan1-presence";
-			gpios = <&pca0 6 GPIO_ACTIVE_LOW>;
-			linux,code = <6>;
-		};
-
-		event-fan2-presence {
-			label = "fan2-presence";
-			gpios = <&pca0 7 GPIO_ACTIVE_LOW>;
-			linux,code = <7>;
-		};
-
-		event-fan3-presence {
-			label = "fan3-presence";
-			gpios = <&pca0 8 GPIO_ACTIVE_LOW>;
-			linux,code = <8>;
-		};
-
-		event-fanboost-presence {
-			label = "fanboost-presence";
-			gpios = <&pca0 9 GPIO_ACTIVE_LOW>;
-			linux,code = <9>;
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		fan0 {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
-		};
-
-		fan1 {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
-		};
-
-		fan2 {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
-		};
-
-		fan3 {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
-		};
-
-		fanboost {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
-		};
-
-		front-fault {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
-		};
-
-		front-power {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
-		};
-
-		front-id {
-			retain-state-shutdown;
-			default-state = "keep";
-			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
-		};
-
-		rear-fault {
-			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
-		};
-
-		rear-id {
-			gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	fsi: gpio-fsi {
-		compatible = "fsi-master-gpio", "fsi-master";
-		#address-cells = <2>;
-		#size-cells = <0>;
-		no-gpio-delays;
-
-		clock-gpios = <&gpio ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
-		data-gpios = <&gpio ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
-		mux-gpios = <&gpio ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
-		enable-gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
-		trans-gpios = <&gpio ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
-	};
-
-	iio-hwmon-dps310 {
-		compatible = "iio-hwmon";
-		io-channels = <&dps 0>;
-	};
-
-};
-
-&fmc {
-	status = "okay";
-
-	flash@0 {
-		status = "okay";
-		label = "bmc";
-		m25p,fast-read;
-		spi-max-frequency = <100000000>;
-		partitions {
-			#address-cells = < 1 >;
-			#size-cells = < 1 >;
-			compatible = "fixed-partitions";
-			u-boot@0 {
-				reg = < 0 0x60000 >;
-				label = "u-boot";
-			};
-			u-boot-env@60000 {
-				reg = < 0x60000 0x20000 >;
-				label = "u-boot-env";
-			};
-			obmc-ubi@80000 {
-				reg = < 0x80000 0x7F80000>;
-				label = "obmc-ubi";
-			};
-		};
-	};
-
-	flash@1 {
-		status = "okay";
-		label = "alt-bmc";
-		m25p,fast-read;
-		spi-max-frequency = <100000000>;
-		partitions {
-			#address-cells = < 1 >;
-			#size-cells = < 1 >;
-			compatible = "fixed-partitions";
-			u-boot@0 {
-				reg = < 0 0x60000 >;
-				label = "alt-u-boot";
-			};
-			u-boot-env@60000 {
-				reg = < 0x60000 0x20000 >;
-				label = "alt-u-boot-env";
-			};
-			obmc-ubi@80000 {
-				reg = < 0x80000 0x7F80000>;
-				label = "alt-obmc-ubi";
-			};
-		};
-	};
-};
-
-&spi1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default>;
-
-	flash@0 {
-		status = "okay";
-		label = "pnor";
-		m25p,fast-read;
-		spi-max-frequency = <100000000>;
-	};
-};
-
-&uart1 {
-	/* Rear RS-232 connector */
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd1_default
-			&pinctrl_rxd1_default
-			&pinctrl_nrts1_default
-			&pinctrl_ndtr1_default
-			&pinctrl_ndsr1_default
-			&pinctrl_ncts1_default
-			&pinctrl_ndcd1_default
-			&pinctrl_nri1_default>;
-};
-
-&uart2 {
-	/* APSS */
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd2_default &pinctrl_rxd2_default>;
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&lpc_ctrl {
-	status = "okay";
-	memory-region = <&flash_memory>;
-	flash = <&spi1>;
-};
-
-&mac0 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii1_default>;
-	use-ncsi;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
-		 <&syscon ASPEED_CLK_MAC1RCLK>;
-	clock-names = "MACCLK", "RCLK";
-};
-
-&i2c2 {
-	status = "okay";
-
-	/* MUX ->
-	 *    Samtec 1
-	 *    Samtec 2
-	 */
-};
-
-&i2c3 {
-	status = "okay";
-
-	max31785@52 {
-		compatible = "maxim,max31785a";
-		reg = <0x52>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fan@0 {
-			compatible = "pmbus-fan";
-			reg = <0>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@1 {
-			compatible = "pmbus-fan";
-			reg = <1>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@2 {
-			compatible = "pmbus-fan";
-			reg = <2>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@3 {
-			compatible = "pmbus-fan";
-			reg = <3>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-
-		fan@4 {
-			compatible = "pmbus-fan";
-			reg = <4>;
-			tach-pulses = <2>;
-			maxim,fan-rotor-input = "tach";
-			maxim,fan-pwm-freq = <25000>;
-			maxim,fan-no-watchdog;
-			maxim,fan-no-fault-ramp;
-			maxim,fan-ramp = <2>;
-			maxim,fan-fault-pin-mon;
-		};
-	};
-
-	pca0: pca9552@60 {
-		compatible = "nxp,pca9552";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
-
-	power-supply@68 {
-		compatible = "ibm,cffps2";
-		reg = <0x68>;
-	};
-
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
-
-	power-supply@69 {
-		compatible = "ibm,cffps2";
-		reg = <0x69>;
-	};
-
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-	};
-};
-
-&i2c7 {
-	status = "okay";
-
-	dps: dps310@76 {
-		compatible = "infineon,dps310";
-		reg = <0x76>;
-		#io-channel-cells = <0>;
-	};
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	si7021a20@20 {
-		compatible = "si,si7021a20";
-		reg = <0x20>;
-	};
-
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
-
-	pca1: pca9551@60 {
-		compatible = "nxp,pca9551";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
-};
-
-&i2c8 {
-	status = "okay";
-
-	pca9552: pca9552@60 {
-		compatible = "nxp,pca9552";
-		reg = <0x60>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names = "PS_SMBUS_RESET_N", "APSS_RESET_N",
-			"GPU0_TH_OVERT_N_BUFF",	"GPU1_TH_OVERT_N_BUFF",
-			"GPU2_TH_OVERT_N_BUFF", "GPU3_TH_OVERT_N_BUFF",
-			"P9_SCM0_PRES",	"P9_SCM1_PRES",
-			"GPU0_PWR_GOOD_BUFF", "GPU1_PWR_GOOD_BUFF",
-			"GPU2_PWR_GOOD_BUFF", "GPU3_PWR_GOOD_BUFF",
-			"PRESENT_VRM_CP0_N", "PRESENT_VRM_CP1_N",
-			"12V_BREAKER_FLT_N", "THROTTLE_UNLATCHED_N";
-
-		gpio@0 {
-			reg = <0>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-			type = <PCA955X_TYPE_GPIO>;
-		};
-	};
-
-	rtc@32 {
-		compatible = "epson,rx8900";
-		reg = <0x32>;
-	};
-
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-	};
-
-	ucd90160@64 {
-		compatible = "ti,ucd90160";
-		reg = <0x64>;
-	};
-};
-
-&i2c9 {
-	status = "okay";
-
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	ir35221@71 {
-		compatible = "infineon,ir35221";
-		reg = <0x71>;
-	};
-
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	pca2: pca9539@74 {
-		compatible = "nxp,pca9539";
-		reg = <0x74>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio@0 {
-			reg = <0>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-		};
-	};
-};
-
-&i2c10 {
-	status = "okay";
-
-	eeprom@50 {
-		compatible = "atmel,24c64";
-		reg = <0x50>;
-	};
-
-	tmp423a@4c {
-		compatible = "ti,tmp423";
-		reg = <0x4c>;
-	};
-
-	ir35221@71 {
-		compatible = "infineon,ir35221";
-		reg = <0x71>;
-	};
-
-	ir35221@72 {
-		compatible = "infineon,ir35221";
-		reg = <0x72>;
-	};
-
-	pca3: pca9539@74 {
-		compatible = "nxp,pca9539";
-		reg = <0x74>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio@0 {
-			reg = <0>;
-		};
-
-		gpio@1 {
-			reg = <1>;
-		};
-
-		gpio@2 {
-			reg = <2>;
-		};
-
-		gpio@3 {
-			reg = <3>;
-		};
-
-		gpio@4 {
-			reg = <4>;
-		};
-
-		gpio@5 {
-			reg = <5>;
-		};
-
-		gpio@6 {
-			reg = <6>;
-		};
-
-		gpio@7 {
-			reg = <7>;
-		};
-
-		gpio@8 {
-			reg = <8>;
-		};
-
-		gpio@9 {
-			reg = <9>;
-		};
-
-		gpio@10 {
-			reg = <10>;
-		};
-
-		gpio@11 {
-			reg = <11>;
-		};
-
-		gpio@12 {
-			reg = <12>;
-		};
-
-		gpio@13 {
-			reg = <13>;
-		};
-
-		gpio@14 {
-			reg = <14>;
-		};
-
-		gpio@15 {
-			reg = <15>;
-		};
-	};
-};
-
-&i2c11 {
-	/* MUX
-	 *   -> PCIe Slot 0
-	 *   -> PCIe Slot 1
-	 *   -> PCIe Slot 2
-	 *   -> PCIe Slot 3
-	 */
-	status = "okay";
-};
-
-&i2c12 {
-	status = "okay";
-
-	tmp275@48 {
-		compatible = "ti,tmp275";
-		reg = <0x48>;
-	};
-
-	tmp275@4a {
-		compatible = "ti,tmp275";
-		reg = <0x4a>;
-	};
-};
-
-&i2c13 {
-	status = "okay";
-};
-
-&vuart {
-	status = "okay";
-};
-
-&gfx {
-	status = "okay";
-	memory-region = <&gfx_memory>;
-};
-
-&wdt1 {
-	aspeed,reset-type = "none";
-	aspeed,external-signal;
-	aspeed,ext-push-pull;
-	aspeed,ext-active-high;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdtrst1_default>;
-};
-
-&wdt2 {
-	aspeed,alt-boot;
-};
-
-&ibt {
-	status = "okay";
-};
-
-&adc {
-	status = "okay";
-};
-
-&sdmmc {
-       status = "okay";
-};
-
-&sdhci1 {
-       status = "okay";
-
-       pinctrl-names = "default";
-       pinctrl-0 = <&pinctrl_sd2_default>;
-};
-
-#include "ibm-power9-dual.dtsi"
-- 
2.45.2


