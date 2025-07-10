Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30CCC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awWht92ydNSDGXSm3BNgso5fy2hNTNHa58hUSfsxiC8=; b=wVUTIZ9PSTC+LGQlqkH/OqIkDw
	Cx49Qfc7ojOABSadDDnFPx/ay2uEh/tC43EmxacVmXIGX8w6QNtjQ87QF84juqfRLyAVfhF9fSvVE
	Ijf1mTMR4sYI8hHMJb+QQPwBstc5i2x4FtCe9vwTIe+TlbVVG1L7yV+b9DGnvWZz16efUVbRRM4Nl
	Te2zzB2O9aru+Cfzs1nD/YkaHwRvXYg2RLzUHz7agxc/XlAnLMMt2lX/ZA3nPv3vpbM+15DhYU3lf
	OZgbipAoiytq1JNeIbtAG/crfY2r5B9+SsPV8bY8o90py7tGCLm00TODymRyNToqwKyjrZZ3oSNSh
	8gChu79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwYs-0000000Clv2-1307;
	Thu, 10 Jul 2025 19:04:02 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu8A-0000000CR43-3QVj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:28:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so787288f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752164897; x=1752769697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awWht92ydNSDGXSm3BNgso5fy2hNTNHa58hUSfsxiC8=;
        b=YGQEJJm+TA1DsTZYQXEsWIevdwJuW6933QxpIW3l0m6aT+EAUSwF7xC5ko+s+msoES
         6OoFdYFH1QtcEM+p9uWjx3cEsp3+rFanJKW8MxD7lVqodvaC70WjUarK1xGQ7JiotLao
         l5Bxl0+vENxWXxc36THrZuDDmx9Ogi3h+ttbsdVDG6Elbn0e2KTOgXg0Nf7UqZOUW9H9
         CNslXtIW57Y+fbX8rtCUJn0Qnnza/hBhjL6Vr12Y97vPdee3MOMJ9/2HhZiJ2EyO/YSM
         nQ9q3k4QGIL5LOScJk0mJu8g4M1NjXIsyV7J4zJBAbwvwMXLrHwmjL6wDgzLWJ/nUVgZ
         Jw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164897; x=1752769697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awWht92ydNSDGXSm3BNgso5fy2hNTNHa58hUSfsxiC8=;
        b=nQCNekTEQOzyOvoGUUDvSThfo5R+7qwrgRI2mEFMMdKKuKgVtaVFgGvs4etgDmEk5L
         1O6dAhYT5djqCk2vezge1S2Vp43kz8Es+bEIdaOkRqJRTKAl+MpeufpWJZfeNbaJP5Je
         FHACJQ0SbXCVm3VpKvo6TSUaVutxEa8SiaB0AjMfCBdDwVhS4E+yXu77MZh7Wb/We6Fj
         RvZvGWDE7pa84v/pPDlwXaKvB5vlXPj6sBHC821E9vxyOED5ApnXGVJJLQGo/tSKJvFu
         bdHEtJWEpMxA/bcTq4qyt34uSr5qLxIhcmT4PUReNBzzM7EkT7YsS2DBa7hHdoq9Px8U
         RG+w==
X-Forwarded-Encrypted: i=1; AJvYcCWSaVstfW1g+Ei9vReo8aoqQRf8MKd35yPbW3aUBtRYUlRYaZj2TJa7ajhRjcBkQ/xyput8XyfZ5PQtxclxIJkN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4FuSsxspLSruGWDjDRlGx7qn+vgZ04Ctd1T84NxN8tSX2RNW
	XSOzxF2vpgQedgJBYXu0RyiQlS2JNwBzfNBkJvVL/apQvi0JBbZaaoyC
X-Gm-Gg: ASbGncvZZKD3ftLRA8cVRWCCqz3HHyw0MiXXLVbnnBoq2mkZ8wgdgjMIQdy2HWXrnZR
	7d94QSGf7GV0wGw1OsRqlDp+5PtI15Vp64qs0ivmMhBBmNHRM+RcDLL3y6SMLdqmyDLV9W4CaGC
	KhBRdC60fFSYDAtA3oYISmEcbqUCo4tJzM/4PWV1pLohvl8MIOL0H7Y2yHxMScrSeHKPaLB5pQP
	8bf3Nw+KSOHBQIV9QZwwSrTbJml8xt40j5tZ+H2ZrG8gh8Rrj/dOt8IZghFhM+X1f6qkS2EPxVj
	ntqS3AnAxqf0q4ZmY/U80yF/8cRXogAnmR51OXXqlY2VQyFbJMhfUcXUXf3it+YnFjDpTeUNdgV
	AjOUU7sLBzWiX8NzkbuRVkjmCIfYKJHGPHoFOebk05pYgnxU+bxs25pZJ
X-Google-Smtp-Source: AGHT+IEIeRL2OyhvrTG/7t2q2ehzP+qR9O+PaD80bMKWdsDfn5EAIpsjEa0pXNVw9tgF0xzWnh99Yg==
X-Received: by 2002:a05:6000:43c6:20b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b5f18dd3demr116035f8f.35.1752164896293;
        Thu, 10 Jul 2025 09:28:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50df125sm60871005e9.19.2025.07.10.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:15 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
Date: Thu, 10 Jul 2025 18:27:27 +0200
Message-ID: <20250710162737.49679-3-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
References: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_092819_007374_48405AFD 
X-CRM114-Status: GOOD (  17.88  )
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

Add device tree support for the Variscite VAR-SOM-AM62P system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- AM62P Sitara MPU processor
- Up to 8GB of DDR4-3733 memory
- eMMC storage memory
- PS6522430 chip as a Power Management Integrated circuit (PMIC)
- Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices ADIN1300
- Resistive touch panel interface controller TI TSC2046
- I2C interfaces

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://www.variscite.it/product/system-on-module-som/cortex-a53-krait/var-som-am62p-ti-sitara-am62px/

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v3:
 - Change compatible string to match existing mainline format
 - Lower case hex digits
 - Generic node names
v2:
 - Fixed warnings and cleanup

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 370 ++++++++++++++++++
 1 file changed, 370 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
new file mode 100644
index 000000000000..7a93f37ac266
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common dtsi for Variscite VAR-SOM-AM62P
+ *
+ * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "k3-am62p5.dtsi"
+
+/ {
+	compatible = "variscite,var-som-am62p", "ti,am62p5";
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&main_gpio0 54 GPIO_ACTIVE_LOW>,	/* WIFI_PWR_EN */
+			      <&main_gpio0 59 GPIO_ACTIVE_LOW>;	/* WIFI_EN */
+	};
+
+	mmc_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mmc_pwrseq>;
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+	};
+
+	memory@80000000 {
+		/* 8G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>,
+		      <0x00000008 0x80000000 0x00000001 0x80000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
+	opp-table {
+		/* Add 1.4GHz OPP for am62p5-sk board. Requires VDD_CORE at 0v85 */
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-supported-hw = <0x01 0x0004>;
+			clock-latency-ns = <6000000>;
+		};
+	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b500000 0x00 0x00300000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_dma_memory_region: mcu-r5fss-dma-memory-region@9b800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b800000 0x00 0x00100000>;
+			no-map;
+		};
+
+		mcu_r5fss0_core0_memory_region: mcu-r5fss-memory-region@9b900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b900000 0x00 0x00f00000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x00100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			no-map;
+		};
+
+		secure_tfa_ddr: tfa@9e780000 {
+			reg = <0x00 0x9e780000 0x00 0x80000>;
+			no-map;
+		};
+
+		secure_ddr: optee@9e800000 {
+			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
+			no-map;
+		};
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V1.8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_3v3_phy: regulator-3v3-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V3.3_PHY";
+		gpios = <&main_gpio0 45 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+		status="okay";
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>;
+};
+
+&cpsw3g_mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1>;
+	cpsw3g_phy0: ethernet-phy@4 {
+		reg = <4>;
+		compatible = "ethernet-phy-id0283.bc30";
+		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+	};
+};
+
+&cpsw_port1 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&cpsw3g_phy0>;
+	status = "okay";
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&main_i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&main_pmx0 {
+	pinctrl_mmc_pwrseq: main-emmc-pwrseq-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (AB23) VOUT0_DATA4.GPIO0_49 */
+		>;
+	};
+
+	pinctrl_i2c2: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (T22) GPMC0_CSn2.I2C2_SCL */
+			AM62PX_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (U25) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
+	pinctrl_i2c3: main-i2c3-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01d0, PIN_INPUT_PULLUP, 2) /* (A23) UART0_CTSn.I2C3_SCL */
+			AM62PX_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (C22) UART0_RTSn.I2C3_SDA */
+		>;
+	};
+
+	pinctrl_mcasp1: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0090, PIN_INPUT, 2) /* (U24) GPMC0_BE0n_CLE.MCASP1_ACLKX */
+			AM62PX_IOPAD(0x0098, PIN_INPUT, 2) /* (AA24) GPMC0_WAIT0.MCASP1_AFSX */
+			AM62PX_IOPAD(0x008c, PIN_OUTPUT, 2) /* (T25) GPMC0_WEn.MCASP1_AXR0 */
+			AM62PX_IOPAD(0x0084, PIN_INPUT, 2) /* (R25) GPMC0_ADVn_ALE.MCASP1_AXR2 */
+			AM62PX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (P24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	pinctrl_mdio1: main-mdio1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0160, PIN_OUTPUT, 0) /* (F17) MDIO0_MDC */
+			AM62PX_IOPAD(0x015c, PIN_INPUT, 0) /* (F16) MDIO0_MDIO */
+		>;
+	};
+
+	pinctrl_mmc2: main-mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x0120, PIN_INPUT_PULLUP, 0) /* (K24) MMC2_CMD */
+			AM62PX_IOPAD(0x0118, PIN_INPUT_PULLDOWN, 0) /* (K21) MMC2_CLK */
+			AM62PX_IOPAD(0x011c, PIN_INPUT_PULLUP, 0) /* () MMC2_CLKLB */
+			AM62PX_IOPAD(0x0114, PIN_INPUT_PULLUP, 0) /* (K23) MMC2_DAT0 */
+			AM62PX_IOPAD(0x0110, PIN_INPUT_PULLUP, 0) /* (K22) MMC2_DAT1 */
+			AM62PX_IOPAD(0x010c, PIN_INPUT_PULLUP, 0) /* (L20) MMC2_DAT2 */
+			AM62PX_IOPAD(0x0108, PIN_INPUT_PULLUP, 0) /* (L21) MMC2_DAT3 */
+		>;
+	};
+
+	pinctrl_rgmii1: main-rgmii1-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
+			AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
+			AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
+			AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
+			AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
+			AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
+			AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
+			AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
+			AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
+			AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
+			AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
+			AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
+		>;
+		bootph-all;
+	};
+
+	pinctrl_spi0: main-spi0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (B21) SPI0_CLK */
+			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (D20) SPI0_CS0 */
+			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B20) SPI0_D0 */
+			AM62PX_IOPAD(0x01c4, PIN_INPUT, 0) /* (C21) SPI0_D1 */
+		>;
+	};
+
+	pinctrl_uart5: main-uart5-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00ec, PIN_INPUT, 4) /* (AC21) VOUT0_DATA13.UART5_CTSn */
+			AM62PX_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AD21) VOUT0_DATA12.UART5_RTSn */
+			AM62PX_IOPAD(0x00d0, PIN_INPUT, 4) /* (AC23) VOUT0_DATA6.UART5_RXD */
+			AM62PX_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AE23) VOUT0_DATA7.UART5_TXD */
+		>;
+	};
+
+	pinctrl_bt: main-btgrp-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00f4, PIN_OUTPUT, 7) /* (Y20) VOUT0_DATA15.GPIO0_60 (BT_EN) */
+		>;
+	};
+
+	pinctrl_restouch: main-restouch-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00c4, PIN_INPUT_PULLUP, 7) /* (Y23) VOUT0_DATA3.GPIO0_48 */
+		>;
+	};
+
+	pinctrl_wifi: main-wifi-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x00dc, PIN_OUTPUT, 7) /* (AC22) VOUT0_DATA9.GPIO0_54 - WIFI_PWR_EN - */
+			AM62PX_IOPAD(0x00f0, PIN_OUTPUT, 7) /* (AA20) VOUT0_DATA14.GPIO0_59 - WIFI_EN - */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	pinctrl_wkup_clkout0: wkup-clkout0-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x0084, PIN_OUTPUT, 0) /* (F13) WKUP_CLKOUT0 */
+		>;
+	};
+};
+
+&main_spi0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi0>;
+	ti,pindir-d0-out-d1-in;
+
+	touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <48 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&main_gpio0 48 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
+&main_uart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&mcasp1 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcasp1>;
+	op-mode = <0>;          /* MCASP_IIS_MODE */
+	tdm-slots = <2>;
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+	       1 0 2 0
+	       0 0 0 0
+	       0 0 0 0
+	       0 0 0 0
+	>;
+	tx-num-evt = <0>;
+	rx-num-evt = <0>;
+};
+
+&sdhci0 {
+	status = "okay";
+	ti,driver-strength-ohm = <50>;
+	mmc-pwrseq = <&mmc_pwrseq>;
+	disable-wp;
+	bootph-all;
+};
+
+&sdhci2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc2>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	disable-wp;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	ti,fails-without-test-cd;
+	status = "okay";
+};
+
+&usbss0 {
+	ti,vbus-divider;
+};
+
+&usbss1 {
+	ti,vbus-divider;
+};
-- 
2.43.0


