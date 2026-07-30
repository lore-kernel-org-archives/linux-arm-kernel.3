Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2712EC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 05:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU0F7RMuKqKVc9PSB/TeHbULeXLOnAqwMNjwAH7xmUw=; b=cBRhl8CJvBIHn4N+nIlCz/FhR0
	jCyb/oRs5vcE1ynvNcZmorbUFQlld0Wlno5spsyKgFB+Cdp1Etn0e7u2MJKvg+51SMhY+QsyMB7o3
	Payou73pzlcDtqOQij5uX5zczZo3Hl+MzDhVSuwvDsTaLivDr/CRDi27ZyMG/dv2ZSJVxhSwzFnnY
	iRlSXy+GCwKiKiTJRhggEPVzbDdFr2wvJUMLgS/98JEr2Zve7zwf8f1ah7mMRYhYslenfnLuZ7lwH
	vvsBZboWfAMv7dyoylUOSz24mkwRMt1IDEXFi9R7xKHntcsg6mbLQ8+06x9TuibeNptyLvgBn5lRT
	UMx7Q2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsS-00000009WJ8-0e3T;
	Thu, 30 Jul 2026 05:00:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIsI-00000009WEN-1u5D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 05:00:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2035698a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 22:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785387605; x=1785992405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CU0F7RMuKqKVc9PSB/TeHbULeXLOnAqwMNjwAH7xmUw=;
        b=LJCrOtx35J2a7CVcuOu2LFvnCJ/GBdApna6EObdxYlWFeiilTwcEcfRGzwRCz+QhYi
         vufYWf4f6jYPyQhabwoN04d2VY+ZOS01Dyl8EUh0PaR20GuLjjxso496sjJZQ1eoWGtB
         Tl8LWrTbagVQqdF4s3FGlfQWlhd+jhmOomJstJ+J/9gSXs3UDH48v5YquF/1ggGyBUUL
         R168e2JBC7+kMMOjJVapv/DX//Nh+5ULBJ/CemQU8gaZkep2p0t68StOosvB60qG0ali
         b6ddejIryJupGda4lWpevS1QiF5LSnQSzdTFY7Wp7AhacFIBEWubv0Cza3YaNcLrzwHI
         q1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387605; x=1785992405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CU0F7RMuKqKVc9PSB/TeHbULeXLOnAqwMNjwAH7xmUw=;
        b=Qs3pBdICi1k0V0OM9b1usTE4AuIXbgMVdoVQowqVMWnJzDbIW8C3Im3mNIKtanM/6o
         m9xT5h2c/FC4BRifPuv8k0NZHxsyDkik7rA0Rej2oTPdqyFQm5phfVK1gola10RFT0+Q
         6OAd+2kr3TFSm6/3zsn+OEZ2Ah8OYcf8JC82apZ7TcFQWmKwJ0gAbPo8uU2bygC0TFq6
         lh6tSmANFDcJNetWoEWLRE0+jkQyLS8U04qSgg/Nkj4uKuDAx1W2gcciGBJWe/ts6dBH
         yWr3AweL3LWtlQOObBGom4lEDSaNAx0hqBXWWeqDbwGxwLXbFToRTU2u1q72Vh0sEUFf
         PR6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpm9cZN491UFDwHZD4HFsq7Bi1J4uy3RKp6b8t2ePgeWU4C6cDOM55ImW+P3tZQny/o0+W3pt3WJLIfb8lMaECn@lists.infradead.org
X-Gm-Message-State: AOJu0YwTH1FXewOVzzn/vQRjf4KXDW4TdYvxgRdOyG3PC6CkVDd5Dpay
	pZm07F01DyilcLmifFlhqUDzcsX+nLyIn70fHjvuw5RKRpXio2S8imVG
X-Gm-Gg: AR+sD11YKetrpsiyddW4G9NT9wdUOxH/7ossJtcVZC5J7ftNDetn8HejuKi5loTv+Tt
	FMK9eQy+c5z0ndNRQ3yK8fC2i9uv5u6Om6aydka8dq/tHCdqKdyTFT45HeWoFOSO0Urfi5aBeA0
	8pY1JtyFoJIcMbP8SBRAziym0Q9bhZ9DxL8hCvpsyWPfAxdnbRkxQX/FwdjxlKcUBLYDcjLAVSc
	ccZUDteIaSKUT7rvnikUwPcfY5CoQfHgCfngHv8e5qTNCujMX/NqN6upA2tmU5xjRqZfJhIWNJ4
	mt9xEYXJNormR8AcA+BaOBMGRzG9IBHwJITWMEvzvzkrHxs6N5FjtVezGXV4Q8ws9+x0/yyAC2Y
	z5zwpq8W22HQCr9u4ZbRtLbklJ1oP+40QmFs9q+VTKUUZ8ih5echOJBEGePsLgQUSSI1UvagkQT
	Fp9caysnT0dZF+fMStRCnvIW9arq8BYQaCP4FJvinzY8R/eGwCmCsHsT9P1/FyFuYTjjK/
X-Received: by 2002:a17:90b:390c:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38f9be19b2dmr1008552a91.18.1785387605365;
        Wed, 29 Jul 2026 22:00:05 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72556386sm14383898c88.0.2026.07.29.22.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 22:00:04 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Date: Thu, 30 Jul 2026 10:29:47 +0530
Message-ID: <20260730045947.388660-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730045947.388660-1-hrushirajg23@gmail.com>
References: <20260730045947.388660-1-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_220006_561250_F5E64824 
X-CRM114-Status: GOOD (  16.38  )
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

Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
single-board computer.

Supported peripherals:
- RK808 PMIC with core/logic/IO regulators
- SYR827/SYR828 (vdd_cpu_b/vdd_gpu) CPU-big and GPU regulators
- Mali GPU
- Gigabit Ethernet (RGMII, RTL8211E PHY via &gmac with mdio subnode)
- eMMC (HS400, enhanced strobe)
- microSD card slot
- SARADC and TSADC
- PWM-based vdd_log regulator
- UART2 serial console

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
Changes in v3:
- Replace legacy snps,reset-gpio/snps,reset-active-low/snps,reset-delays-us
  properties on &gmac with a proper mdio subnode (snps,dwmac-mdio) holding
  rtl8211e: ethernet-phy@1 with standard reset-gpios/reset-assert-us/
  reset-deassert-us properties, as requested by the maintainer
- Add phy-handle = <&rtl8211e> to &gmac
- Add gmac pinctrl group with phy_rstb pin for the PHY reset GPIO

Changes in v2:
- Fix fixed-regulator node naming to use 'regulator-[voltage]' prefix
  consistently throughout
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 454 ++++++++++++++++++
 2 files changed, 455 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 761d82b4f4f2..e1b974502915 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
new file mode 100644
index 000000000000..01b8c1536c4c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
@@ -0,0 +1,454 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Vicharak Computers Pvt Ltd
+ */
+
+/dts-v1/;
+#include "rk3399.dtsi"
+
+/ {
+	model = "Vicharak Vaaman";
+	compatible = "vicharak,vaaman", "rockchip,rk3399";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	clkin_gmac: external-gmac-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clkin_gmac";
+		#clock-cells = <0>;
+	};
+
+	vcc12v_dcin: regulator-dc-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc3v3_lan: regulator-vcc3v3-lan {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_lan";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin>;
+	};
+
+	vdd_log: regulator-vdd-log {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 25000 1>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_log";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1400000>;
+	};
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_l>;
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_b>;
+};
+
+&emmc_phy {
+	rockchip,enable-strobe-pulldown;
+	status = "okay";
+};
+
+&gmac {
+	assigned-clocks = <&cru SCLK_RMII_SRC>;
+	assigned-clock-parents = <&clkin_gmac>;
+	clock_in_out = "input";
+	phy-supply = <&vcc3v3_lan>;
+	phy-mode = "rgmii";
+	phy-handle = <&rtl8211e>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_pins>, <&phy_rstb>;
+	tx_delay = <0x28>;
+	rx_delay = <0x11>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rtl8211e: ethernet-phy@1 {
+			reg = <1>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	i2c-scl-rising-time-ns = <168>;
+	i2c-scl-falling-time-ns = <4>;
+	status = "okay";
+
+	rk808: pmic@1b {
+		compatible = "rockchip,rk808";
+		reg = <0x1b>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
+		#clock-cells = <1>;
+		clock-output-names = "xin32k", "rk808-clkout2";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_int_l>;
+		system-power-controller;
+		wakeup-source;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc3v3_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc5v0_sys>;
+		vcc12-supply = <&vcc3v3_sys>;
+		vddio-supply = <&vcc_3v0>;
+
+		regulators {
+			vdd_center: DCDC_REG1 {
+				regulator-name = "vdd_center";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vdd_cpu_l: DCDC_REG2 {
+				regulator-name = "vdd_cpu_l";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-initial-mode = <0x2>;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-ramp-delay = <6001>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-name = "vcc_ddr";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_1v8: DCDC_REG4 {
+				regulator-name = "vcc_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_codec: LDO_REG1 {
+				regulator-name = "vcca1v8_codec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcca1v8_hdmi: LDO_REG2 {
+				regulator-name = "vcca1v8_hdmi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcca_1v8: LDO_REG3 {
+				regulator-name = "vcca_1v8";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vcc_sdio: LDO_REG4 {
+				regulator-name = "vcc_sdio";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcca3v0_codec: LDO_REG5 {
+				regulator-name = "vcca3v0_codec";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v5: LDO_REG6 {
+				regulator-name = "vcc_1v5";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1500000>;
+				};
+			};
+
+			vcca0v9_hdmi: LDO_REG7 {
+				regulator-name = "vcca0v9_hdmi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <900000>;
+				};
+			};
+
+			vcc_3v0: LDO_REG8 {
+				regulator-name = "vcc_3v0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3000000>;
+				};
+			};
+
+			vcc_cam: SWITCH_REG1 {
+				regulator-name = "vcc_cam";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_mipi: SWITCH_REG2 {
+				regulator-name = "vcc_mipi";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+
+	vdd_cpu_b: regulator@40 {
+		compatible = "silergy,syr827";
+		reg = <0x40>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel1_pin>;
+		regulator-name = "vdd_cpu_b";
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_gpu: regulator@41 {
+		compatible = "silergy,syr828";
+		reg = <0x41>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_pin>;
+		regulator-name = "vdd_gpu";
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&io_domains {
+	audio-supply = <&vcca1v8_codec>;
+	bt656-supply = <&vcc_3v0>;
+	gpio1830-supply = <&vcc_3v0>;
+	sdmmc-supply = <&vcc_sdio>;
+	status = "okay";
+};
+
+&pinctrl {
+	gmac {
+		phy_rstb: phy-rstb {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_int_l: pmic-int-l {
+			rockchip,pins =
+				<1 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		vsel1_pin: vsel1-pin {
+			rockchip,pins =
+				<1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		vsel2_pin: vsel2-pin {
+			rockchip,pins =
+				<1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmu1830-supply = <&vcc_3v0>;
+	status = "okay";
+};
+
+&pwm2 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	max-frequency = <150000000>;
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <150000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdmmc_clk &sdmmc_cd &sdmmc_cmd &sdmmc_bus4>;
+	status = "okay";
+};
+
+&tsadc {
+	/* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-mode = <1>;
+	/* tshut polarity 0:LOW 1:HIGH */
+	rockchip,hw-tshut-polarity = <1>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.47.3


