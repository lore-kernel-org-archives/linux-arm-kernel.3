Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D51CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkHx06qj6d78UKebVh6/tdSFsn1yrzx2AXX+eUMVOVQ=; b=1RFRvNeYZs5QsGiHMZJbPU4oy+
	RQAwrFMntgQUuapeT39ohkbKT8lu3Z+8aiFLacmm69Sx7GxM4ywuSnwjryJEse6uXvtJXziZN0zE/
	WuDYVGasLQE48uoVfvlW6/tTCTi+sckGfgj7SPFMBSUsOpO5aD3tpaoEsdGqJ/tjjNtl/Ggcc4r/t
	xaD3gDVexFrWfQi4m07G5XxjhhydSxP7sLDC45zVw7Ic+FP209oLP2rTVIFalgfDO+Z69IYzoCuIe
	FLd8orPHedBRpMMVjgDaNei09SGJT96hmnwdJ1SGsz636Y3P1ZgrzzlY2V0pYpS1C88dnlSTvny/1
	tJ72a7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYep-00000008L2n-196u;
	Mon, 25 Aug 2025 14:58:51 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVzA-00000007sCk-0kyv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:07:41 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250825120738epoutp04c02ae34e33c5fe0957d0f6e24d9b79ce~fASm4mDJg0999109991epoutp04c
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 12:07:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250825120738epoutp04c02ae34e33c5fe0957d0f6e24d9b79ce~fASm4mDJg0999109991epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123658;
	bh=kkHx06qj6d78UKebVh6/tdSFsn1yrzx2AXX+eUMVOVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVqSGuEs3NUzHhudCdMIuWB5zqOuyru0QnMxDP74xAM9DFTMzHqI+M30/TJPfqE2c
	 hVqahaiJuo+XemZmnH1ki1XX4xSZZmcK3X4n7szx8GdC4onac2Yf1ScEV5w6hZ/iTa
	 ml1I2DMkFyx91AESyHiNsAu7Y91t5/EJ9Knkp0d8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250825120737epcas5p1150a41513f3ba1ba3693fa44ba789367~fASl9QF8o2094320943epcas5p1V;
	Mon, 25 Aug 2025 12:07:37 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c9V0m35xBz2SSKY; Mon, 25 Aug
	2025 12:07:36 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342~fASkgQBAN1420914209epcas5p38;
	Mon, 25 Aug 2025 12:07:35 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120730epsmtip2171965c1a77ed63cea61a61d3c845347~fASf0oza00154801548epsmtip2O;
	Mon, 25 Aug 2025 12:07:30 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 08/10] arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC
 support
Date: Mon, 25 Aug 2025 17:14:34 +0530
Message-Id: <20250825114436.46882-9-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120735epcas5p3c86b9db5f17c0938f1d53ef6014ab342@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_050740_553449_0D13CC75 
X-CRM114-Status: GOOD (  20.16  )
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

From: SungMin Park <smn1196@coasia.com>

Add initial device tree support for Axis ARTPEC-8 SoC.

This SoC contains 4 Cortex-A53 CPUs and several other peripheral IPs.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 MAINTAINERS                                   |  12 +
 arch/arm64/Kconfig.platforms                  |   7 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/axis/artpec-pinctrl.h     |  36 +++
 .../boot/dts/exynos/axis/artpec8-pinctrl.dtsi | 120 +++++++++
 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi  | 244 ++++++++++++++++++
 6 files changed, 420 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/axis/artpec8.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..4d0c1f10ffd4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4102,6 +4102,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/axentia,*
 F:	sound/soc/atmel/tse850-pcm5142.c
 
+AXIS ARTPEC ARM64 SoC SUPPORT
+M:	Jesper Nilsson <jesper.nilsson@axis.com>
+M:	Lars Persson <lars.persson@axis.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org
+L:	linux-arm-kernel@axis.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
+F:	arch/arm64/boot/dts/exynos/axis/
+F:	drivers/clk/samsung/clk-artpec*.c
+F:	include/dt-bindings/clock/axis,artpec*-clk.h
+
 AXI-FAN-CONTROL HARDWARE MONITOR DRIVER
 M:	Nuno Sá <nuno.sa@analog.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a88f5ad9328c..959f79d73b40 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -40,6 +40,13 @@ config ARCH_APPLE
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.
 
+config ARCH_ARTPEC
+	bool "Axis Communications ARTPEC SoC Family"
+	depends on ARCH_EXYNOS
+	select ARM_GIC
+	help
+	   This enables support for the ARMv8 based ARTPEC SoC Family.
+
 config ARCH_AXIADO
 	bool "Axiado SoC Family"
 	select GPIOLIB
diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/exynos/Makefile
index bdb9e9813e50..bcca63136557 100644
--- a/arch/arm64/boot/dts/exynos/Makefile
+++ b/arch/arm64/boot/dts/exynos/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+subdir-y += axis
 subdir-y += google
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
new file mode 100644
index 000000000000..70bd1dcac85e
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec-pinctrl.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Axis ARTPEC-8 SoC device tree pinctrl constants
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#ifndef __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
+#define __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__
+
+#define ARTPEC_PIN_PULL_NONE		0
+#define ARTPEC_PIN_PULL_DOWN		1
+#define ARTPEC_PIN_PULL_UP		3
+
+#define ARTPEC_PIN_FUNC_INPUT		0
+#define ARTPEC_PIN_FUNC_OUTPUT		1
+#define ARTPEC_PIN_FUNC_2		2
+#define ARTPEC_PIN_FUNC_3		3
+#define ARTPEC_PIN_FUNC_4		4
+#define ARTPEC_PIN_FUNC_5		5
+#define ARTPEC_PIN_FUNC_6		6
+#define ARTPEC_PIN_FUNC_EINT		0xf
+#define ARTPEC_PIN_FUNC_F		ARTPEC_PIN_FUNC_EINT
+
+/* Drive strength for ARTPEC */
+#define ARTPEC_PIN_DRV_SR1		0x8
+#define ARTPEC_PIN_DRV_SR2		0x9
+#define ARTPEC_PIN_DRV_SR3		0xa
+#define ARTPEC_PIN_DRV_SR4		0xb
+#define ARTPEC_PIN_DRV_SR5		0xc
+#define ARTPEC_PIN_DRV_SR6		0xd
+
+#endif /* __DTS_ARM64_SAMSUNG_EXYNOS_AXIS_ARTPEC_PINCTRL_H__ */
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
new file mode 100644
index 000000000000..8d239a70f1b4
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8-pinctrl.dtsi
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC pin-mux and pin-config device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include "artpec-pinctrl.h"
+
+&pinctrl_fsys {
+	gpe0: gpe0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe1: gpe1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpe2: gpe2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf0: gpf0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf1: gpf1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf2: gpf2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf3: gpf3-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpf4: gpf4-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps0: gps0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gps1: gps1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	serial0_bus: serial0-bus-pins {
+		samsung,pins = "gpf4-4", "gpf4-5";
+		samsung,pin-function = <ARTPEC_PIN_FUNC_2>;
+		samsung,pin-pud = <ARTPEC_PIN_PULL_UP>;
+		samsung,pin-drv = <ARTPEC_PIN_DRV_SR3>;
+	};
+};
+
+&pinctrl_peric {
+	gpa0: gpa0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa1: gpa1-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpa2: gpa2-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+
+	gpk0: gpk0-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
new file mode 100644
index 000000000000..db9833297982
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Axis ARTPEC-8 SoC device tree source
+ *
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *             https://www.samsung.com
+ * Copyright (c) 2025  Axis Communications AB.
+ *             https://www.axis.com
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/axis,artpec8-clk.h>
+
+/ {
+	compatible = "axis,artpec8";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		pinctrl0 = &pinctrl_fsys;
+		pinctrl1 = &pinctrl_peric;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x0>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+			clocks = <&cmu_cpucl CLK_GOUT_CPUCL_CLUSTER_CPU>;
+			clock-names = "cpu";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x1>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x2>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <1200>;
+				min-residency-us = <2000>;
+			};
+		};
+	};
+
+	fin_pll: clock-finpll {
+		compatible = "fixed-factor-clock";
+		clocks = <&osc_clk>;
+		#clock-cells = <0>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "fin_pll";
+	};
+
+	osc_clk: clock-osc {
+		/* XXTI */
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "osc_clk";
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0x0 0x0 0x0 0x17000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		cmu_imem: clock-controller@10010000 {
+			compatible = "axis,artpec8-cmu-imem";
+			reg = <0x10010000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_ACLK>,
+				 <&cmu_cmu CLK_DOUT_CMU_IMEM_JPEG>;
+			clock-names = "fin_pll", "aclk", "jpeg";
+		};
+
+		timer@10040000 {
+			compatible = "axis,artpec8-mct", "samsung,exynos4210-mct";
+			reg = <0x10040000 0x1000>;
+			clocks = <&fin_pll>, <&cmu_imem CLK_GOUT_IMEM_MCT_PCLK>;
+			clock-names = "fin_pll", "mct";
+			interrupts = <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		gic: interrupt-controller@10201000 {
+			compatible = "arm,gic-400";
+			reg = <0x10201000 0x1000>,
+			      <0x10202000 0x2000>,
+			      <0x10204000 0x2000>,
+			      <0x10206000 0x2000>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+
+		cmu_cpucl: clock-controller@11410000 {
+			compatible = "axis,artpec8-cmu-cpucl";
+			reg = <0x11410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CPUCL_SWITCH>;
+			clock-names = "fin_pll", "switch";
+		};
+
+		cmu_cmu: clock-controller@12400000 {
+			compatible = "axis,artpec8-cmu-cmu";
+			reg = <0x12400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>;
+			clock-names = "fin_pll";
+		};
+
+		cmu_core: clock-controller@12410000 {
+			compatible = "axis,artpec8-cmu-core";
+			reg = <0x12410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_CORE_MAIN>,
+				 <&cmu_cmu CLK_DOUT_CMU_CORE_DLP>;
+			clock-names = "fin_pll", "main", "dlp";
+		};
+
+		cmu_bus: clock-controller@12c10000 {
+			compatible = "axis,artpec8-cmu-bus";
+			reg = <0x12c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_BUS>,
+				 <&cmu_cmu CLK_DOUT_CMU_BUS_DLP>;
+			clock-names = "fin_pll", "bus", "dlp";
+		};
+
+		cmu_peri: clock-controller@16410000 {
+			compatible = "axis,artpec8-cmu-peri";
+			reg = <0x16410000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_IP>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_AUDIO>,
+				 <&cmu_cmu CLK_DOUT_CMU_PERI_DISP>;
+			clock-names = "fin_pll", "ip", "audio", "disp";
+		};
+
+		pinctrl_peric: pinctrl@165f0000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x165f0000 0x1000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		cmu_fsys: clock-controller@16c10000 {
+			compatible = "axis,artpec8-cmu-fsys";
+			reg = <0x16c10000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&fin_pll>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN0>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_SCAN1>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_BUS>,
+				 <&cmu_cmu CLK_DOUT_CMU_FSYS_IP>;
+			clock-names = "fin_pll", "scan0", "scan1", "bus", "ip";
+		};
+
+		pinctrl_fsys: pinctrl@16c30000 {
+			compatible = "axis,artpec8-pinctrl";
+			reg = <0x16c30000 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		serial_0: serial@16cc0000 {
+			compatible = "axis,artpec8-uart";
+			reg = <0x16cc0000 0x100>;
+			clocks = <&cmu_fsys CLK_GOUT_FSYS_UART0_PCLK>,
+				 <&cmu_fsys CLK_GOUT_FSYS_UART0_SCLK_UART>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&serial0_bus>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
-- 
2.49.0


