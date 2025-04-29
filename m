Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E3AC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 06:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frTIpCth6zof00Zt90URGFazhHJtVHvfc10WE/sjxxE=; b=Bs0AxqTtnoIG3kfjSEmWSbPRkL
	ocY35ESQjAMIyugb1eKNeQgTgI03x0reqfpUKGHIKxx+Zy2BiyFhMbPVhft5NEJneP2TWdW+XpqCj
	ZcnYTGLqG6jv5aNXfRM/3U2JLOFrzDmufizKvfI69FXxGVlEJb0BpyYyEuRVtVuyYLznCWRoGEkZe
	FDbZy5LCe2PKZtl2nR59mI7IZ4vUkHv1CeVvOmBsgaNMBJ9Ke18ytlBZz/gBqQPAUbnKsm1xSB3He
	Mlb2+qvopCvzWIOEaiZujNIOK6kx2Wj4mfssC15Xhb/HRF1XPu/VncUWKq1sk6toE1pcV/ACue0sX
	Fm36Wstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ejh-00000008cge-0Dsm;
	Tue, 29 Apr 2025 06:46:34 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9eeZ-00000008bwd-1JOV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 06:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745908875; x=1777444875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=frTIpCth6zof00Zt90URGFazhHJtVHvfc10WE/sjxxE=;
  b=NKFNfYr2DqQ0nNzgI39Fwh3NK4hTQ5OZRe0eujd8KMPZCuAxUf6lUMWP
   XxoMRRxhSv6IYBGTd1dXKuo+4gTRmN8CrjkqQMTBpoT6t47n6gjcB9H+y
   oyZeEimrOB5YKygeyfTPajCq2qW1C2/guMIibBi4s3sQsSL1Si+YaMiwH
   9gbE+KPWJy+rMz2GmdFgYmEnafx/C+l7dpbBzts47cx2JT7Cb9Y9BDlMk
   cgdpKAOH7oZOrftCvLF09qsB3BuOPCn+uHAFUS8aB+peVeUWhtG3i6mPT
   DFgZsCWgD65bCpJ/pDsDDMuJp0y9ECsxWDi/PE9TuSDNi4yxzVbMN9DFV
   A==;
X-CSE-ConnectionGUID: iUL5rWTiRuKbMsvpQt4L9g==
X-CSE-MsgGUID: VVv0HuE6SdGcSc/ilF585g==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43770688"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 08:41:14 +0200
X-CheckPoint: {6810748A-B-903EAEAC-E04C76C8}
X-MAIL-CPID: C8BF8E45CE0F1837B59639D87A2FE5E6_5
X-Control-Analysis: str=0001.0A006378.6810748E.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8979A1610DA;
	Tue, 29 Apr 2025 08:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745908869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=frTIpCth6zof00Zt90URGFazhHJtVHvfc10WE/sjxxE=;
	b=mtb/ToBisZnzb14DjZPM+ifVvf7eenGPKrRmlArdS0YJ3g8UrCAQZvOadirRKMwSXJlIzW
	HTTayA/u0AKUb3wRBAeNmN6Q8aE700aZYHY1tT7x1EZ6s/4oFIktNEqq95hu8yAVHzVBP+
	EJIHVlj7J3isSkeSo66/6uuiW+SUzOqAeVISvKERnFSBVeJTJ3q6Z+2MeG/EQfDdXGIqOV
	by6wI7XGnYF4T2TgmPYrigbVuewF7Ujn98vh6nY571xfdlvdPbXytYSFAr/wQw3KtJiwpr
	RnYqBvoOiHc5GeJ0ooKFiqGGoGHKekVl907DyOuZL4HEVoyIW4efNs+tUrRWuw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Max Merchel <Max.Merchel@tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] arm64: dts: ls1012a: add DTS for TQMLS1012al module with MBLS1012AL board
Date: Tue, 29 Apr 2025 08:40:54 +0200
Message-ID: <20250429064056.869222-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
References: <20250429064056.869222-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_234115_659105_CDF58B81 
X-CRM114-Status: GOOD (  15.40  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add initial support for TQMLS1012AL module mounted on MBLS1012AL.
It supports UART1 for console, PCIe, I2C, USB, µSD card (default), SATA
and QSPI.
There is an alternative ordering option which provides an eMMC instead of
an SD card. This uses a different DT instead.
Due missing Packet Forwarding Engine (PFE) driver support, there is no
support for Ethernet so far.

Signed-off-by: Max Merchel <Max.Merchel@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 ...sl-ls1012a-tqmls1012al-mbls1012al-emmc.dts |  21 ++
 .../fsl-ls1012a-tqmls1012al-mbls1012al.dts    | 346 ++++++++++++++++++
 .../freescale/fsl-ls1012a-tqmls1012al.dtsi    |  74 ++++
 4 files changed, 443 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index bf575395d7d5b..f6b8686ed3cfe 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -5,6 +5,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-frwy.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-oxalis.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-kbox-a-230-ls.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var1.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
new file mode 100644
index 0000000000000..82dc0a7c7d535
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+#include "fsl-ls1012a-tqmls1012al-mbls1012al.dts"
+
+&esdhc0 {
+	vqmmc-supply = <&reg_1p8v>;
+	/delete-property/ no-mmc;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	no-sdio;
+	no-sd;
+	voltage-ranges = <1800 1800>;
+	non-removable;
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
new file mode 100644
index 0000000000000..d12720107e5df
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
@@ -0,0 +1,346 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+#include "fsl-ls1012a-tqmls1012al.dtsi"
+
+/ {
+	model = "TQ-Systems TQMLS1012AL on MBLS1012AL";
+	compatible = "tq,ls1012a-tqmls1012al-mbls1012al", "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &duart0;
+		/* use MAC from U-Boot environment */
+		/* TODO: PFE */
+		ethernet2 = &swport0;
+		ethernet3 = &swport1;
+		ethernet4 = &swport2;
+		ethernet5 = &swport3;
+		spi0 = &qspi;
+	};
+
+	chosen {
+		stdout-path = &duart0;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		switch-1 {
+			label = "S2";
+			linux,code = <BTN_0>;
+			gpios = <&gpio_exp_3p3v 13 GPIO_ACTIVE_LOW>;
+		};
+
+		switch-2 {
+			label = "X15";
+			linux,code = <BTN_1>;
+			gpios = <&gpio_exp_1p8v 5 GPIO_ACTIVE_LOW>;
+		};
+
+		switch-3 {
+			label = "X16";
+			linux,code = <BTN_2>;
+			gpios = <&gpio_exp_1p8v 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio_exp_3p3v 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_exp_3p3v 15 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			/* 64 MiB */
+			size = <0 0x04000000>;
+			/*  512 - 128 MiB, our minimum RAM config will be 512 MiB */
+			alloc-ranges = <0 0x80000000 0 0x98000000>;
+			linux,cma-default;
+		};
+	};
+
+	reg_1p5v: regulator-1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1P8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+};
+
+&duart0 {
+	status = "okay";
+};
+
+&esdhc0 {
+	vmmc-supply = <&reg_3p3v>;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	sd-uhs-sdr25;
+	sd-uhs-sdr12;
+	status = "okay";
+};
+
+&i2c0 {
+	lm75_48: temperature-sensor@48 {
+		compatible = "national,lm75";
+		reg = <0x48>;
+		vs-supply = <&reg_3p3v>;
+	};
+
+	gpio_exp_3p3v: gpio-expander@20 {
+		compatible = "nxp,pca9555";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_3p3v>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "", "", "GPIO_3V3_3", "",
+				  "", "", "", "",
+				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
+				  "", "", "", "";
+
+		wlan-disable-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "WLAN_DISABLE#";
+		};
+
+		vcc-pcie-en-3v3-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_PCIE_EN_3V3";
+		};
+
+		vcc-wlan-en-3v3-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_WLAN_EN_3V3";
+		};
+
+		pcie-rst-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_RST#";
+		};
+
+		wlan-rst-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "WLAN_RST#";
+		};
+
+		pcie-dis-hog {
+			gpio-hog;
+			gpios = <11 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_DIS#";
+		};
+
+		pcie-wake-hog {
+			gpio-hog;
+			gpios = <12 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "PCIE_WAKE#";
+		};
+	};
+
+	gpio_exp_1p8v: gpio-expander@70 {
+		compatible = "nxp,pca9538";
+		reg = <0x70>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&reg_1p8v>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-line-names = "PCIE_CLK_PD#", "PMIC_INT#", "ETH_SW_INT#", "",
+				  "", "", "", "",
+				  "", "GPIO_3V3_1", "GPIO_3V3_2", "",
+				  "", "", "", "";
+
+		/* do not change PCIE_CLK_PD */
+		pcie-clk-pd-hog {
+			gpio-hog;
+			gpios = <0 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "PCIE_CLK_PD#";
+		};
+
+		pmic-int-hog {
+			gpio-hog;
+			gpios = <1 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "PMIC_INT#";
+		};
+
+		eth-sw-int-hog {
+			gpio-hog;
+			gpios = <2 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ETH_SW_INT#";
+		};
+
+		eth-link-pwrdwn-hog {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_HIGH>;
+			input;
+			line-name = "ETH_LINK_PWRDWN#";
+		};
+
+		vcc-wlan-en-1v5-hog {
+			gpio-hog;
+			gpios = <6 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_WLAN_EN_1V5";
+		};
+
+		vcc-pcie-en-1v5-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "VCC_PCIE_EN_1V5";
+		};
+	};
+
+	switch@5f {
+		compatible = "microchip,ksz9897";
+		reg = <0x5f>;
+		reset-gpios = <&gpio_exp_3p3v 7 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			swport0: port@0 {
+				reg = <0>;
+				label = "swp0";
+				phy-mode = "internal";
+			};
+
+			swport1: port@1 {
+				reg = <1>;
+				label = "swp1";
+				phy-mode = "internal";
+			};
+
+			swport2: port@2 {
+				reg = <2>;
+				label = "swp2";
+				phy-mode = "internal";
+			};
+
+			swport3: port@3 {
+				reg = <3>;
+				label = "swp3";
+				phy-mode = "internal";
+			};
+
+			port@6 {
+				reg = <6>;
+				label = "cpu";
+				/* TODO: PFE */
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <1500>;
+				tx-internal-delay-ps = <1500>;
+
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+/* TODO: PFE */
+
+&sata {
+	status = "okay";
+};
+
+&usb0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb451,8142";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb451,8140";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio_exp_3p3v 6 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_vcc_3v3>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
new file mode 100644
index 0000000000000..45ce6d6623568
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (c) 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Matthias Schiffer
+ * Author: Max Merchel
+ */
+
+#include "fsl-ls1012a.dtsi"
+
+/ {
+	compatible = "tq,ls1012a-tqmls1012al", "fsl,ls1012a";
+
+	memory@80000000 {
+		device_type = "memory";
+		/*  our minimum RAM config will be 512 MiB */
+		reg = <0x00000000 0x80000000 0 0x20000000>;
+	};
+
+	reg_vcc_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+
+	jc42_19: temperature-sensor@19 {
+		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
+		reg = <0x19>;
+	};
+
+	m24c64_50: eeprom@50 {
+		compatible = "atmel,24c64";
+		reg = <0x50>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vcc_3v3>;
+	};
+
+	m24c02_51: eeprom@51 {
+		compatible = "nxp,se97b", "atmel,24c02";
+		reg = <0x51>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_vcc_3v3>;
+	};
+
+	rtc1: rtc@68 {
+		compatible = "dallas,ds1339";
+		reg = <0x68>;
+	};
+};
+
+&qspi {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <39000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
-- 
2.43.0


