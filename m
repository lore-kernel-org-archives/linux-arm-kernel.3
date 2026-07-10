Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD68C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0XHen8IR69lr0Mvi6TF7SKZT2IXesgxyeuXi2HTHdY=; b=ypG19wBX+uvXplgG8xPDR1f0Fr
	B6x9PdI4eKg7V6i58sI3Qpus/tyg0WdPzpBf83fTqbxCgq7UfHlgGtQTLmxeO2H5F9ptgbt7/s/6T
	F5wtHQtWbIyuZvgcj9COlA553gviptT+AeaqkCFd5YdRD1M0pQQ0rbk8RYgCCSi/BjoxPVw6nBIin
	iJlwCzQXGohC5SbJKt8KWhq5RrzBBqDXIqIu4AsYAm1Rn5ShGUcoV6fEoaAmFYRRB/+5p42FuqIIU
	EFy5hqTXVV0Nyodm8HapciwtMtQBDv9tlYZ65+yV203r0VADj2/BQBZLY7LeoMsK3Kiuo6Aj6oTfn
	QqAYlnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFG4-00000005SQi-1GsK;
	Fri, 10 Jul 2026 17:43:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFG0-00000005SNW-0ZjC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:43:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-472326ca506so957612f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783705402; x=1784310202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0XHen8IR69lr0Mvi6TF7SKZT2IXesgxyeuXi2HTHdY=;
        b=FLUKZesLfJwA86k5X3sEFEUQ5FK+BsF9PCTh1MgfJMVjXyvL8lyDSrN3qf/nyrZ2DQ
         gvwlOfYlYBwSnlkZYKp75dihY999jX+8MX3YB3yOJqQPIvSdW8Jc0r4V+afDkmeAzBhW
         T7E6OI/j0IwTCNKAvHA6sFe7qUeiCRDB0Dv1Rx/ypKiUd+hCRSMIuTSOwm0ISWSU2wqE
         KzdhDP33uMmsDYlc2hWu8l0YsW/QRX6BmhEQ2ijNPyT7LAq8CKsrQlvOTzZRNNptTtcu
         vQW8Yo4U8squQktxfSDETYr+46jUd1mYlEPLR0AiO2AgIMIkCjjC1o+ZeS57q4mXqigl
         gX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783705402; x=1784310202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0XHen8IR69lr0Mvi6TF7SKZT2IXesgxyeuXi2HTHdY=;
        b=NMkYlm3cNeNXkCip4l/2AtoH1uCXahfaQF98pKjEulW+OWV4qXqVyps/+E3TIahdD4
         3iUNtSYwsaPx5Mv9wexTblWfW3p+aQePpUWLTZEjJdlvcDEdM5UWIKO+4/cSJrA74Gq7
         ZGnG5XhWf+xReK2Hf+/QJzxnejuAGVTKpNectdpKzC+zZuXZr9HFEgBKSS3EQnNjIfWH
         Yho7BUvw67ZFexsmpn3h1ykVjTuQ3YZOKv0wa7z+yPy2iW4dz5M4JVcOn1nH6TM874tS
         Kk9C5ohxUNGY595ixv4FR64rF4W8atbQNFPov0UoT30g+0Hj8tAYpEXkpDHWFKLZp1Pe
         Bgmg==
X-Forwarded-Encrypted: i=1; AHgh+Rqpp6Ys1ZhGTj3v1uxq/VyzrCXpQVadyM29dxT1dcOffFCRkp3vZlVIiNRwwi6zZKoGDcgY/iZ2MFz0OfF51c+9@lists.infradead.org
X-Gm-Message-State: AOJu0YyHhXsHn3wmN7RUyaAl08lse4LjrgkUSDWWSOzRyCnOg1QHazr9
	J9O+euxdWpJeA+BRllyZaZHz2rIFXOZWM+MVqOHyx2SYlt6ORRLt2Ikg
X-Gm-Gg: AfdE7cnhQt73NH9e8PZa46gKqQ4ODEnQgYCg8hAaLVA3aNtBj1EfKT+uZHlDsoMcjTp
	SACmE0iXMJs+fu15RrEFxbvnrWcZThYku8ZFuGspRigN4smXeW2LYGrDnIIogVr7Oz1F3TjWvSE
	ddZbYhDBXmnEuD8ZoSboldSH+cHBRZVUt+FWKTWINLeSIYA0FLzEqRPfTkbAucYWJ+xG3ODA8PO
	1Zgmv/h3sghYWOddtMQgCXkGFHfk4FeqgQ5gt6mx85ntICiqbUU5O9RNRqyTALYT9tWDH3BO1aF
	IMso3qM+eYO/zDPK+m8YvReG3rAuxeHSFB3gilLcN1fPCzOEPj4RlllI/i5pCglKJPoYHxSqc4C
	ie6BEivtwWaBz11xo9J+gXYV8wx9fK7J9cYqwVJ8C/nnoi+nL+t+H2gdh2PG/K/aCWzC6nz1grH
	Blrijv54vmg+S4e4zWXVQLAiA3P9OSHVE0fSsQf7uI9WSR86HIjRLi
X-Received: by 2002:a05:6000:26d3:b0:474:3b3b:5e5f with SMTP id ffacd0b85a97d-47df072b06bmr13539693f8f.16.1783705401985;
        Fri, 10 Jul 2026 10:43:21 -0700 (PDT)
Received: from GLaDOS.station ([185.81.127.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm67170201f8f.4.2026.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:43:21 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board
Date: Fri, 10 Jul 2026 19:43:09 +0200
Message-ID: <3f58a10e07d9a353c7c18f7d3ec8ea1f4c08f4f0.1783689915.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783689915.git.stefano.r@variscite.com>
References: <cover.1783689915.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_104324_324269_D991973E 
X-CRM114-Status: GOOD (  18.41  )
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

Add device tree support for the Variscite Symphony carrier board with
the VAR-SOM-AM62 system on module.

The Symphony board includes
- uSD Card support
- USB ports and OTG
- Additional Gigabit Ethernet interface
- Uart interfaces
- OV5640 Camera support
- GPIO Expander and TPM
- CAN, I2C and general purpose interfaces
- Capacitive touch controller

Link: https://www.variscite.it/product/single-board-computers/symphony-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Fix reg_sdhc1_vmmc regulator
 - Add missing properties on pca9534 node

v1->v2:
 - Fix reg_sdhc1_vmmc pinctrl
 - Add reg_ov5640_buf_en pinctrl

 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-var-som-symphony.dts | 555 ++++++++++++++++++
 2 files changed, 556 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..e33c4d0363a9 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
new file mode 100644
index 000000000000..e2fba95d9b94
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Variscite Symphony carrier board for VAR-SOM-AM62
+ *
+ * Link: https://www.variscite.it/product/single-board-computers/symphony-board/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ * Copyright (C) 2026 Stefano Radaelli <stefano.r@variscite.com>
+ *
+ */
+
+/dts-v1/;
+
+#include "k3-am625-var-som.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-AM62 on Symphony-Board";
+	compatible = "variscite,var-som-am62-symphony", "variscite,var-som-am62", "ti,am625";
+
+	aliases {
+		ethernet0 = &cpsw_port1;
+		ethernet1 = &cpsw_port2;
+		mmc0 = &sdhci0;
+		mmc1 = &sdhci1;
+		mmc2 = &sdhci2;
+		serial0 = &main_uart0;
+		serial2 = &main_uart2;
+		serial5 = &main_uart5;
+		serial6 = &main_uart6;
+		spi5 = &main_spi2;
+		usb0 = &usb0;
+		usb1 = &usb1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clk_ov5640_fixed: clock-24000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-back {
+			label = "Back";
+			linux,code = <KEY_BACK>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
+		};
+
+		button-home {
+			label = "Home";
+			linux,code = <KEY_HOME>;
+			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
+		};
+
+		button-menu {
+			label = "Menu";
+			linux,code = <KEY_MENU>;
+			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			label = "Heartbeat";
+			linux,default-trigger = "heartbeat";
+			gpios = <&pca9534 0 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	reg_2p8v: regulator-2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "2P8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&reg_3v3>;
+		regulator-always-on;
+	};
+
+	reg_sdhc1_vmmc: regulator-sdhc1 {
+		compatible = "regulator-fixed";
+		regulator-name = "+V3.3_SD";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_vmmc>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		enable-active-high;
+		gpios = <&main_gpio0 30 GPIO_ACTIVE_HIGH>;
+		bootph-all;
+	};
+
+	reg_sdhc1_vqmmc: regulator-sdhci1-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "+V3.3_SD_VQMMC";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_sd1_vqmmc>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		gpios = <&main_gpio0 56 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0x0>,
+			 <3300000 0x1>;
+		bootph-all;
+	};
+
+	reg_ov5640_buf_en: regulator-camera-buf-en {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640_buf_en";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5640_buf>;
+		gpios = <&main_gpio0 21 GPIO_ACTIVE_HIGH>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	transceiver1: can-phy {
+		compatible = "ti,tcan1042";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+	};
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_extcon>;
+		label = "USB-C";
+		id-gpios = <&main_gpio1 12 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+
+		port {
+			usb_con_hs: endpoint {
+				remote-endpoint = <&typec_hs>;
+			};
+		};
+	};
+};
+
+&cdns_csi2rx0 {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		csi0_port0: port@0 {
+			reg = <0>;
+			status = "okay";
+
+			csi2rx0_in_sensor: endpoint {
+				remote-endpoint = <&csi2_cam0>;
+				bus-type = <4>; /* CSI2 DPHY. */
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>,
+		    <&pinctrl_rgmii2>;
+	status = "okay";
+
+	cpts@3d000 {
+		/* MAP HW3_TS_PUSH to GENF1 */
+		ti,pps = <2 1>;
+	};
+};
+
+&cpsw3g_mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mdio1>;
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@5 {
+		compatible = "ethernet-phy-id0283.bc30";
+		reg = <5>;
+		reset-gpios = <&pca9534 5 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <100000>;
+	};
+};
+
+&cpsw_port2 {
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the Symphony PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&cpsw3g_phy1>;
+	status = "okay";
+};
+
+&dphy0 {
+	status = "okay";
+};
+
+&epwm1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_epwm1>;
+};
+
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* GPIO expander */
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <30 IRQ_TYPE_EDGE_FALLING>;
+
+		usb3-sel-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-low;
+			line-name = "usb3_sel";
+		};
+
+		eth-som-vselect-hog {
+			gpio-hog;
+			gpios = <6 0>;
+			output-low;
+			line-name = "eth-vselect";
+		};
+
+		eth-mdio-enable-hog {
+			gpio-hog;
+			gpios = <7 0>;
+			output-high;
+			line-name = "eth-mdio-enable";
+		};
+	};
+
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&clk_ov5640_fixed>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_2p8v>;
+		DOVDD-supply = <&reg_1p8v>;
+		DVDD-supply = <&reg_1p5v>;
+		powerdown-gpios = <&main_gpio0 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio0 22 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ov5640>;
+
+		port {
+			csi2_cam0: endpoint {
+				remote-endpoint = <&csi2rx0_in_sensor>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
+&main_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c1>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		label = "tpm";
+		reg = <0x2e>;
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch_pins>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
+};
+
+&main_mcan0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcan0>;
+	phys = <&transceiver1>;
+	status = "okay";
+};
+
+&main_pmx0 {
+	pinctrl_captouch_pins: main-captouch-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b8, PIN_INPUT, 7) /* (C13) SPI0_CS1.GPIO1_16 */
+		>;
+	};
+
+	pinctrl_epwm1: main-epwm1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x019c, PIN_OUTPUT, 6) /* (B18) MCASP0_AXR1.EHRPWM1_A */
+		>;
+	};
+
+	pinctrl_extcon: main-extcon-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a8, PIN_INPUT, 7) /* (D20) MCASP0_AFSX.GPIO1_12 */
+		>;
+	};
+
+	pinctrl_i2c0: main-i2c0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1e0, PIN_INPUT_PULLUP, 0) /* (B16) I2C0_SCL */
+			AM62X_IOPAD(0x1e4, PIN_INPUT_PULLUP, 0) /* (A16) I2C0_SDA */
+		>;
+	};
+
+	pinctrl_i2c1: main-i2c1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1e8, PIN_INPUT_PULLUP, 0) /* (B17) I2C1_SCL */
+			AM62X_IOPAD(0x1ec, PIN_INPUT_PULLUP, 0) /* (A17) I2C1_SDA */
+		>;
+	};
+
+	pinctrl_mcan0: main-mcan0-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1dc, PIN_INPUT, 0) /* (E15) MCAN0_RX */
+			AM62X_IOPAD(0x1d8, PIN_OUTPUT, 0) /* (C15) MCAN0_TX */
+		>;
+	};
+
+	pinctrl_mmc1: main-mmc1-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
+			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
+			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
+			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
+			AM62X_IOPAD(0x224, PIN_INPUT, 0) /* (D22) MMC1_DAT3 */
+			AM62X_IOPAD(0x240, PIN_INPUT, 0) /* (D17) MMC1_SDCD */
+		>;
+	};
+
+	pinctrl_ov5640: main-ov5640-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0028, PIN_OUTPUT, 7) /* (J22) OSPI0_D7.GPIO0_10 */
+			AM62X_IOPAD(0x0058, PIN_OUTPUT, 7) /* (R23) GPMC0_AD7.GPIO0_22 */
+		>;
+	};
+
+	pinctrl_ov5640_buf: main-ov5640-buf-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0054, PIN_OUTPUT, 7) /* (P21) GPMC0_AD6.GPIO0_21 */
+		>;
+	};
+
+	pinctrl_pca9534: main-pca9534-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01f0, PIN_INPUT, 7) /* (A18) EXT_REFCLK1.GPIO1_30 */
+		>;
+	};
+
+	pinctrl_rgmii2: main-rgmii2-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x184, PIN_INPUT, 0) /* (AE23) RGMII2_RD0 */
+			AM62X_IOPAD(0x188, PIN_INPUT, 0) /* (AB20) RGMII2_RD1 */
+			AM62X_IOPAD(0x18c, PIN_INPUT, 0) /* (AC21) RGMII2_RD2 */
+			AM62X_IOPAD(0x190, PIN_INPUT, 0) /* (AE22) RGMII2_RD3 */
+			AM62X_IOPAD(0x180, PIN_INPUT, 0) /* (AD23) RGMII2_RXC */
+			AM62X_IOPAD(0x17c, PIN_INPUT, 0) /* (AD22) RGMII2_RX_CTL */
+			AM62X_IOPAD(0x16c, PIN_INPUT, 0) /* (Y18) RGMII2_TD0 */
+			AM62X_IOPAD(0x170, PIN_INPUT, 0) /* (AA18) RGMII2_TD1 */
+			AM62X_IOPAD(0x174, PIN_INPUT, 0) /* (AD21) RGMII2_TD2 */
+			AM62X_IOPAD(0x178, PIN_INPUT, 0) /* (AC20) RGMII2_TD3 */
+			AM62X_IOPAD(0x168, PIN_INPUT_PULLDOWN, 0) /* (AE21) RGMII2_TXC */
+			AM62X_IOPAD(0x164, PIN_INPUT, 0) /* (AA19) RGMII2_TX_CTL */
+		>;
+	};
+
+	pinctrl_sd1_vmmc: main-sd1-vmmc-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0078, PIN_OUTPUT, 7) /* (U24) GPMC0_AD15.GPIO0_30 */
+		>;
+	};
+
+	pinctrl_sd1_vqmmc: main-sd1-vqmmc-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x00e4, PIN_OUTPUT, 7) /* (AA23) VOUT0_DATA11.GPIO0_56 */
+		>;
+	};
+
+	pinctrl_spi2: main_spi2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01b0, PIN_INPUT, 1) /* (A20) MCASP0_ACLKR.SPI2_CLK */
+			AM62X_IOPAD(0x0194, PIN_OUTPUT, 1) /* (B19) MCASP0_AXR3.SPI2_D0 */
+			AM62X_IOPAD(0x0198, PIN_INPUT, 1) /* (A19) MCASP0_AXR2.SPI2_D1 */
+			AM62X_IOPAD(0x01ac, PIN_OUTPUT, 7) /* (E19) MCASP0_AFSR.GPIO1_13 */
+		>;
+	};
+
+	pinctrl_uart0: main-uart0-default-pins {
+		bootph-all;
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x1c8, PIN_INPUT, 0) /* (D14) UART0_RXD, change muxmode from 0 to 7 to deactivate Debug UART RXD */
+			AM62X_IOPAD(0x1cc, PIN_OUTPUT, 0) /* (E14) UART0_TXD */
+		>;
+	};
+
+	pinctrl_uart2: main-uart2-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x005c, PIN_INPUT_PULLUP, 2) /* (R24) GPMC0_AD8.UART2_RXD */
+			AM62X_IOPAD(0x0060, PIN_OUTPUT, 2) /* (R25) GPMC0_AD9.UART2_TXD */
+		>;
+	};
+
+	pinctrl_uart6: main-uart6-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x009c, PIN_INPUT, 3) /* (V25) GPMC0_WAIT1.UART6_RXD */
+			AM62X_IOPAD(0x0244, PIN_OUTPUT, 1) /* (C17) MMC1_SDWP.UART6_TXD */
+		>;
+	};
+
+	pinctrl_usb1: main-usb1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18) USB1_DRVVBUS */
+		>;
+	};
+};
+
+&main_spi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_spi2>;
+	ti,pindir-d0-out-d1-in;
+	cs-gpios = <&main_gpio1 13 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&main_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart0>;
+	status = "okay";
+};
+
+&main_uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
+	status = "okay";
+};
+
+&main_uart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	status = "okay";
+};
+
+&sdhci1 {
+	/* SD Card */
+	vmmc-supply = <&reg_sdhc1_vmmc>;
+	vqmmc-supply = <&reg_sdhc1_vqmmc>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mmc1>;
+	disable-wp;
+	bootph-all;
+	status = "okay";
+};
+
+&ti_csi2rx0 {
+	status = "okay";
+};
+
+&usb0 {
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		typec_hs: endpoint {
+			remote-endpoint = <&usb_con_hs>;
+		};
+	};
+};
+
+&usb1 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+	status = "okay";
+};
+
+&usbss0 {
+	status = "okay";
+};
+
+&usbss1 {
+	status = "okay";
+};
-- 
2.47.3


