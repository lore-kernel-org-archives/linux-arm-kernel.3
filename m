Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B67C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 21:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKSOs/JQBcovnuEivBRSvneAfe6XiJt0qLk589NeoFQ=; b=F9ZbNc3R1YFuP92ZHXNnJncNqe
	kwyxiVLvd2bJO76S+12AwjdjLZ2i3iMaS9Ng2cpRT5+8AmdZ6+VZ4QKv2TRKCWoAALgyxiIlGBLxx
	BfHB37M/1kiLXSnYiSn259R8oZXpKViDSDGeIr5ZFqxIU2sHx9pO7blI7+5zduuYpRu9nAJiFf+4f
	89vusAcwCkeWP7/Ie1fT++5OzyzQZgSeGm+K9NnTfWWLh6IrVgRjdVm5e2gnBDtnIEbk5SucMflri
	LpFaCx2cyF179+avanWsDsBJ44LGgdZjtcQ8oFgoRFro+kHNHkOgwQTT6BRZJGbn4NxRhG48q4KhJ
	EDvaCJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfH-00000000QhG-3ukU;
	Wed, 08 Jul 2026 21:18:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whZfE-00000000QfC-3Xxs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 21:18:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so1971425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783545519; x=1784150319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKSOs/JQBcovnuEivBRSvneAfe6XiJt0qLk589NeoFQ=;
        b=e7ETfb3NFqNSltgqOEFq/fbw4X5VqTGj9T2a0FG93PFH4OD7asR2Lr7h7UdF3zWsBZ
         x/vwV8SgmR0EaHYadVXK0viVA1mrK8Cy4EwxeswC6z3P4mmEjsXPJ2+4twg+OFlLZAmw
         aIYjdwBXPvqd0rSiwow0ZXaxuzt+vT1QH5Mwof/+yZnTCvOEqGIqadv44yG92cs9aVB5
         m4J2IZjYrcKFIJGzbqTMTYnP4MXpWzXaQihyrPXt+w62BRXES9itePmabPtcdEGbClbj
         dT3qEFyS/zRPrDpy0YOCnVuqBEdkl1QtA5o8tGVWfvH+bdQJN9WlRsEW0N292qun47FT
         ki5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783545519; x=1784150319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKSOs/JQBcovnuEivBRSvneAfe6XiJt0qLk589NeoFQ=;
        b=Dkm/TQhumYJVw1PdhVzUY0/htD08hyS5oXFv3Sx16k1kR88/RidtfH0ua+URjpU7IS
         HMsjWxYmg/GqJNY9Z+oSZElfD/UAmRGHt+LEFOXVi949ecmWHpVH3RIc2N833oFS+rr4
         ULQSFaJ8p0vRGwuFYDVaALa9cUCBM+MqrpV8spfq5IvJ6zUq/iccOXTY7nFiTqwujO4U
         Pa07TNwGiUI4N1U+cSXph92u3jXirsvXFjERACp+JvH1TJ8lPvbbxCsxYQ8JYF/4Icln
         5hbACh7XWIaiFeviAX1UhomeI/hHm9AI6d59scEO3WtmlIPInFTaIc83FJo6eskrmA/I
         lQpw==
X-Forwarded-Encrypted: i=1; AHgh+RrbqckfarqfViXbQdgAsc8slp46xE3c1BEt7Sw5S28yWF3NVvBGb7dKIYMzO0LBsiwWcsLV/5OMa1Lt0CrXHJGk@lists.infradead.org
X-Gm-Message-State: AOJu0YwvhuRyFDfA6IYzi/LlLhVkMr5mmuNv4I2iAxfp+IrE3Bj/0aae
	vZ0TqjmXTL+u2S9Z/t1Njf5HRstOMpf4+KrP1HXilSEddBdz5ev06eLG
X-Gm-Gg: AfdE7ckHZbBN0Rd9M9fIZnstT7CIpERzzJYEKZZnYJ3Q15zJ7JI1WgENR3i34ifLFDZ
	5Fss3kCurgRbQFRzTIs1NFu2bR0uNYgfZDoo+R0iilukpmUfP1NfewseEVNPL/1Iv3EwUnNnJCE
	blKoRgb506ljKao9v5WxNH8DKhDGiK8hZ+c5h+vpVqarW61yFC+8vFV5ZJV7kSj2SplS9SqUIH5
	Ij5U8Z90x+dKYYTBPCIBNCi5azDQwzDkBQgq2uY8gNLjttWol4ccvTXh2YW+YZ7oEQQ0BKLiY3t
	9nudeEUfvozbAsASIpXN37h2BEzhay5m1f6Ziv9OsTILCtLYje0Zs+OaIhBJQb5+UytdLaYvjG4
	eS1c5r/amRpZRsB46rWoRNC/l6jaoqOHzv5ywdcEOa+WniI5fJddBD9T3+g/SWpkBKMQGemXuOX
	z5Qj6WKOvb5HGdeCmca97Px7RCexyJ0H0FR15rKBlES/6v9KoFMdO1xup4co3yHPcR/apzBl5ub
	S8uE3ohByWIFoE0mXR/MGg6wj0sJIc2fAqVEg==
X-Received: by 2002:a05:600c:8b53:b0:493:e79e:da87 with SMTP id 5b1f17b1804b1-493e79edc1bmr32960585e9.31.1783545518925;
        Wed, 08 Jul 2026 14:18:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a58853sm68494175e9.1.2026.07.08.14.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:18:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH v1 2/3] arm64: dts: ti: Add support for Variscite VAR-SOM-AM62
Date: Wed,  8 Jul 2026 23:18:26 +0200
Message-ID: <36179bc7e043c95838354174963cdb27d5383620.1783545241.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783545241.git.stefano.r@variscite.com>
References: <cover.1783545241.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_141841_034926_4A79E986 
X-CRM114-Status: GOOD (  17.96  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SOM-AM62 system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- AM62x Sitara MPU processor
- Up to 4GB of DDR4-3733 memory
- Up to 128GB eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver Analog Devices
- Audio codec wm8904
- Resistive touch panel interface controller
- I2C, UART and SPI interfaces
- Bluetooth 5.2 + WiFi single or dual band

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am62/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 491 +++++++++++++++++++
 1 file changed, 491 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
new file mode 100644
index 000000000000..95dd96fe4c66
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common dtsi for Variscite VAR-SOM-AM62
+ *
+ * Link: https://variscite.com/system-on-module-som/ti-sitara-am62x/var-som-am62/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ * Copyright (C) 2026 Stefano Radaelli <stefano.r@variscite.com>
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
+#include "k3-am625.dtsi"
+
+/ {
+	compatible = "variscite,var-som-am62", "ti,am625";
+
+	memory@80000000 {
+		/* 2G RAM */
+		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
+		device_type = "memory";
+		bootph-pre-ram;
+	};
+
+	mmc_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_mmc_pwrseq>;
+		reset-gpios = <&main_gpio0 49 GPIO_ACTIVE_LOW>;
+	};
+
+	opp-table {
+		/* Add 1.4GHz OPP for am625-sk board. Requires VDD_CORE to be at 0.85V */
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
+		ramoops@9ca00000 {
+			compatible = "ramoops";
+			reg = <0x00 0x9ca00000 0x00 0x00100000>;
+			record-size = <0x8000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x00>;
+			pmsg-size = <0x8000>;
+		};
+
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x8000000>;
+			linux,cma-default;
+		};
+
+		rtos_ipc_memory_region: rtos-ipc-memory@9b500000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9b500000 0x00 0x00300000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
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
+			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
+			alignment = <0x1000>;
+			no-map;
+		};
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
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "On-module +V3.3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
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
+	};
+
+	reg_vdd_mmc2: regulator-vdd-wifi {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_vdd_mmc2>;
+		compatible = "regulator-fixed";
+		regulator-name = "wifi_power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "dsp_b";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp1>;
+		};
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1>;
+	status = "okay";
+
+	cpsw3g_phy0: ethernet-phy@4 {
+		compatible = "ethernet-phy-id0283.bc30";
+		reg = <4>;
+		bootph-all;
+		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <20000>;
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
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_refclk1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_1v8>;
+		CPVDD-supply = <&reg_1v8>;
+		DBVDD-supply = <&reg_3v3>;
+		DCVDD-supply = <&reg_1v8>;
+		MICVDD-supply = <&reg_1v8>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
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
+	pinctrl_i2c2: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0b0, PIN_INPUT_PULLUP, 1) /* (K22) GPMC0_CSn2.I2C2_SCL */
+			AM62X_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
+	pinctrl_i2c3: main-i2c3-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d0, PIN_INPUT, 2) /* (A15) UART0_CTSn.I2C3_SCL */
+			AM62X_IOPAD(0x01d4, PIN_INPUT, 2) /* (B15) UART0_RTSn.I2C3_SDA */
+		>;
+	};
+
+	pinctrl_mcasp1: main-mcasp1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0090, PIN_INPUT, 2) /* (M24) GPMC0_BE0N_CLE.MCASP1_ACLKX */
+			AM62X_IOPAD(0x0098, PIN_INPUT, 2) /* (U23) GPMC0_WAIT0.MCASP1_AFSX */
+			AM62X_IOPAD(0x008c, PIN_OUTPUT, 2) /* (L25) GPMC0_WEN.MCASP1_AXR0 */
+			AM62X_IOPAD(0x0084, PIN_INPUT, 2) /* (L23) GPMC0_ADVN_ALE.MCASP1_AXR2 */
+			AM62X_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (K25) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
+		>;
+	};
+
+	pinctrl_mdio1: main-mdio1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x160, PIN_INPUT, 0) /* (AD24) MDIO0_MDC */
+			AM62X_IOPAD(0x15c, PIN_INPUT, 0) /* (AB22) MDIO0_MDIO */
+		>;
+	};
+
+	pinctrl_mmc_pwrseq: pinmux-mmc-pwrseq-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00c8, PIN_OUTPUT, 7) /* (Y25) VOUT0_DATA4.GPIO0_49 */
+		>;
+	};
+
+	pinctrl_mmc0: main-mmc0-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
+			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
+			AM62X_IOPAD(0x210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
+			AM62X_IOPAD(0x20c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
+			AM62X_IOPAD(0x208, PIN_INPUT, 0) /* (Y4) MMC0_DAT3 */
+			AM62X_IOPAD(0x204, PIN_INPUT, 0) /* (AB2) MMC0_DAT4 */
+			AM62X_IOPAD(0x200, PIN_INPUT, 0) /* (AC1) MMC0_DAT5 */
+			AM62X_IOPAD(0x1fc, PIN_INPUT, 0) /* (AD2) MMC0_DAT6 */
+			AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (AC2) MMC0_DAT7 */
+		>;
+	};
+
+	pinctrl_mmc2: main-mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x120, PIN_INPUT_PULLUP, 0) /* (C24) MMC2_CMD */
+			AM62X_IOPAD(0x118, PIN_INPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x114, PIN_INPUT_PULLUP, 0) /* (B24) MMC2_DAT0 */
+			AM62X_IOPAD(0x110, PIN_INPUT_PULLUP, 0) /* (C25) MMC2_DAT1 */
+			AM62X_IOPAD(0x10c, PIN_INPUT_PULLUP, 0) /* (E23) MMC2_DAT2 */
+			AM62X_IOPAD(0x108, PIN_INPUT_PULLUP, 0) /* (D24) MMC2_DAT3 */
+			AM62X_IOPAD(0x11c, PIN_INPUT_PULLUP, 0) /* (#N/A) MMC2_CLKB */
+		>;
+	};
+
+	pinctrl_restouch: main-restouch-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00c4, PIN_INPUT_PULLUP, 7) /* (W24) VOUT0_DATA3.GPIO0_48 */
+		>;
+	};
+
+	pinctrl_rgmii1: main-rgmii1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x14c, PIN_INPUT, 0) /* (AB17) RGMII1_RD0 */
+			AM62X_IOPAD(0x150, PIN_INPUT, 0) /* (AC17) RGMII1_RD1 */
+			AM62X_IOPAD(0x154, PIN_INPUT, 0) /* (AB16) RGMII1_RD2 */
+			AM62X_IOPAD(0x158, PIN_INPUT, 0) /* (AA15) RGMII1_RD3 */
+			AM62X_IOPAD(0x148, PIN_INPUT, 0) /* (AD17) RGMII1_RXC */
+			AM62X_IOPAD(0x144, PIN_INPUT, 0) /* (AE17) RGMII1_RX_CTL */
+			AM62X_IOPAD(0x134, PIN_INPUT, 0) /* (AE20) RGMII1_TD0 */
+			AM62X_IOPAD(0x138, PIN_INPUT, 0) /* (AD20) RGMII1_TD1 */
+			AM62X_IOPAD(0x13c, PIN_INPUT, 0) /* (AE18) RGMII1_TD2 */
+			AM62X_IOPAD(0x140, PIN_INPUT, 0) /* (AD18) RGMII1_TD3 */
+			AM62X_IOPAD(0x130, PIN_INPUT, 0) /* (AE19) RGMII1_TXC */
+			AM62X_IOPAD(0x12c, PIN_INPUT, 0) /* (AD19) RGMII1_TX_CTL */
+			AM62X_IOPAD(0x00bc, PIN_INPUT, 7) /* (V24) VOUT0_DATA1.GPIO0_46 */
+			AM62X_IOPAD(0x00b8, PIN_INPUT, 7) /* (U22) VOUT0_DATA0.GPIO0_45 */
+		>;
+	};
+
+	pinctrl_spi0: main-spi0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01bc, PIN_OUTPUT, 0) /* (A14) SPI0_CLK */
+			AM62X_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (A13) SPI0_CS0 */
+			AM62X_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B13) SPI0_D0 */
+			AM62X_IOPAD(0x01c4, PIN_INPUT, 0) /* (B14) SPI0_D1 */
+		>;
+	};
+
+	pinctrl_uart5: main-uart5-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00ec, PIN_INPUT, 4) /* (AA24) VOUT0_DATA13.UART5_CTSn */
+			AM62X_IOPAD(0x00e8, PIN_OUTPUT, 4) /* (AB25) VOUT0_DATA12.UART5_RTSn */
+			AM62X_IOPAD(0x00d0, PIN_INPUT, 4) /* (Y23) VOUT0_DATA6.UART5_RXD */
+			AM62X_IOPAD(0x00d4, PIN_OUTPUT, 4) /* (AA25) VOUT0_DATA7.UART5_TXD */
+		>;
+	};
+
+	pinctrl_vdd_mmc2: main-vdd-mmc2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00d8, PIN_INPUT, 7) /* (V21) VOUT0_DATA8.GPIO0_53 */
+			AM62X_IOPAD(0x00dc, PIN_INPUT, 7) /* (W21) VOUT0_DATA9.GPIO0_54 */
+			AM62X_IOPAD(0x00f0, PIN_INPUT, 7) /* (Y22) VOUT0_DATA14.GPIO0_59 */
+			AM62X_IOPAD(0x00f4, PIN_INPUT, 7) /* (AA21) VOUT0_DATA15.GPIO0_60 */
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
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi0>;
+	ti,pindir-d0-out-d1-in;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
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
+	pinctrl-0 = <&pinctrl_uart5>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&mcasp1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcasp1>;
+	op-mode = <0>;  /* MCASP_IIS_MODE */
+	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
+		1 0 2 0
+		0 0 0 0
+		0 0 0 0
+		0 0 0 0
+	>;
+	tdm-slots = <2>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+/* On-module eMMC */
+&sdhci0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc0>;
+	bootph-all;
+	disable-wp;
+	mmc-pwrseq = <&mmc_pwrseq>;
+	non-removable;
+	status="okay";
+};
+
+/* On-module Wi-Fi */
+&sdhci2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc2>, <&pinctrl_wkup_clkout0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	assigned-clocks = <&k3_clks 157 158>; /* wkup_clkout_sel_out0 */
+	assigned-clock-parents = <&k3_clks 157 164>; /* clk_32k_rc_sel_out0 */
+	vmmc-supply = <&reg_vdd_mmc2>;
+	bus-width = <4>;
+	disable-wp;
+	non-removable;
+	cap-power-off-card;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&usbss0 {
+	ti,vbus-divider;
+};
+
+&usbss1 {
+	ti,vbus-divider;
+};
+
+/* mcu_gpio0 and mcu_gpio_intr are reserved for mcu firmware usage */
+&mcu_gpio0 {
+	status = "reserved";
+};
+
+&mcu_gpio_intr {
+	status = "reserved";
+};
+
+&wkup_rtc0 {
+	status = "disabled";
+};
+
+&wkup_rti0 {
+	/* WKUP RTI0 is used by DM firmware */
+	status = "reserved";
+};
+
+&wkup_uart0 {
+	/* WKUP UART0 is used by DM firmware */
+	status = "reserved";
+};
+
+&main_uart1 {
+	/* Main UART1 is used by TIFS firmware */
+	status = "reserved";
+};
+
+#include "k3-am62-ti-ipc-firmware.dtsi"
-- 
2.47.3


