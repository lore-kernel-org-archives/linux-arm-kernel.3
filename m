Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0093D10F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYYd37sNCRvv/foUtdRFxY64hhQaPuuHWRsMzP3pjR8=; b=u6uVoLrkHd4wU7rDsCjuWDyS2R
	ZaimU8Xz7OnejbthJps4bNawOfXiNw3haClD3grnskAew4zqKfEXKuChuLn2Mv39a+TfMM7YoI0eC
	KQN/gUa5tDs2XcFC+DadCQcau+vSG1k97Hk8CGolDMrJadQyCKhwG4u9WbPjPZ9+4DuQj4oPQWTNj
	UwXAfReCdxqM5wDUdpJ3p5Fav7Bv6IN+Z3mMynXlPUoDKOPJEtcLsF99dYEKpr+AxOT8y8dcZGM/V
	hNGAi8tGlVi3ayA/7TQdhBc9j9l+xylKQfG43tGmT6CZh0GgUCQodcMNiG3s+JtzVy10rCKotAa0u
	izbp0mvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuRV-00000008PyB-3rx2;
	Mon, 18 Nov 2024 05:36:57 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuOx-00000008PdM-0l5C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 05:34:20 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8vp023236;
	Sun, 17 Nov 2024 23:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731908048;
	bh=aYYd37sNCRvv/foUtdRFxY64hhQaPuuHWRsMzP3pjR8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=ngiad4PLo4asZT+Q6t73cxzcTl5thkpvboyyAdmxrvB23DvSGjQoJnMnJ+nXQtj4T
	 KMvM8vk+sNuQ5MkatckJ9YdT0iNJJVcuUtVSC247DArAX6xsS5Sg9RyQqMqQrNlB5Q
	 6uh6Ms2MgUBu0jMbn9JvVo46d8ohxQIDKuvdVGXE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AI5Y8iK001689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 17 Nov 2024 23:34:08 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 17
 Nov 2024 23:34:08 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 17 Nov 2024 23:34:07 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8gR042478;
	Sun, 17 Nov 2024 23:34:08 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Sun, 17 Nov 2024 23:34:07 -0600
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62l: add initial infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241117-am62lx-v1-1-4e71e42d781d@ti.com>
References: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
In-Reply-To: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_213419_324036_E3035302 
X-CRM114-Status: GOOD (  14.65  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

Add the initial infrastructure needed for the AM62L. All of which can be
found in the Technical Reference Manual (TRM) located here:

    https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
 arch/arm64/boot/dts/ti/Makefile                  |  3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
 7 files changed, 252 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c84..b109e854879cb 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -31,6 +31,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:
diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f71360f14f233..6745f779b1e6e 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -32,6 +32,9 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
 
+# Boards with AM62Lx SoCs
+dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
+
 # Boards with AM62Px SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
new file mode 100644
index 0000000000000..bdc6cb26a86d3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L main domain peripherals
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
+ */
+
+&cbass_main {
+	gic500: interrupt-controller@1800000 {
+		compatible = "arm,gic-v3";
+		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
+		      <0x00 0x01840000 0x00 0xc0000>,	/* GICR */
+		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
+		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
+		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		/*
+		 * vcpumntirq:
+		 * virtual CPU interface maintenance interrupt
+		 */
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+		gic_its: msi-controller@1820000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x00 0x01820000 0x00 0x10000>;
+			socionext,synquacer-pre-its = <0x1000000 0x400000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	main_uart0: serial@2800000 {
+		compatible = "ti,am64-uart", "ti,am654-uart";
+		reg = <0x00 0x02800000 0x00 0x100>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+		clock-frequency = <48000000>;
+		status = "disabled";
+	};
+
+	oc_sram: sram@70800000 {
+		compatible = "mmio-sram";
+		reg = <0x00 0x70800000 0x00 0x10000>;
+		ranges = <0x0 0x00 0x70800000 0x10000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
new file mode 100644
index 0000000000000..070ba71110f0f
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L wakeup domain peripherals
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
+ */
+
+&cbass_wakeup {
+	pmx0: pinctrl@4084000 {
+		compatible = "pinctrl-single";
+		reg = <0x00 0x4084000 0x00 0x8000>;
+		pinctrl-single,register-width = <32>;
+		pinctrl-single,function-mask = <0xffffffff>;
+		#pinctrl-cells = <1>;
+		bootph-all;
+	};
+
+	wkup_conf: bus@43000000 {
+		compatible = "simple-bus";
+		reg = <0x00 0x43000000 0x00 0x20000>;
+		ranges = <0x0 0x00 0x43000000 0x20000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		chipid: chipid@14 {
+			compatible = "ti,am654-chipid";
+			reg = <0x14 0x4>;
+			bootph-all;
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/ti/k3-am62l.dtsi b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
new file mode 100644
index 0000000000000..43da8e52278ce
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l.dtsi
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree Source for AM62L SoC Family
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Tecnical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+#include "k3-pinctrl.h"
+
+/ {
+	model = "Texas Instruments K3 AM62L3 SoC";
+	compatible = "ti,am62l3";
+	interrupt-parent = <&gic500>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	a53_timer0: timer-cl0-cpu0 {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* cntpsirq */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* cntpnsirq */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* cntvirq */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* cnthpirq */
+	};
+
+	pmu: pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	cbass_main: bus@f0000 {
+		compatible = "simple-bus";
+		ranges = <0x00 0x00600000 0x00 0x00600000 0x00 0x00001100>, /* GPIO */
+			 <0x00 0x00a40000 0x00 0x00a40000 0x00 0x00000800>, /* Timesync router */
+			 <0x00 0x00a80000 0x00 0x00a80000 0x00 0x00040000>, /* GTC */
+			 <0x00 0x01000000 0x00 0x01000000 0x00 0x01b28400>, /* First peripheral window */ 
+			 <0x00 0x08000000 0x00 0x08000000 0x00 0x00200000>, /* CPSW */
+			 <0x00 0x09000000 0x00 0x09000000 0x00 0x00400000>, /* CTRL MMRs */
+			 <0x00 0x0e000000 0x00 0x0e000000 0x00 0x0bd28000>, /* Second peripheral window */
+			 <0x00 0x30200000 0x00 0x30200000 0x00 0x00400000>, /* DSS */
+			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core window */
+			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
+			 <0x00 0x3b000000 0x00 0x3b000000 0x00 0x00001000>, /* GPMC0 */
+			 <0x00 0x47000000 0x00 0x47000000 0x00 0x02000000>, /* DMSS */
+			 <0x00 0x50000000 0x00 0x50000000 0x00 0x08000000>, /* GPMC DATA */
+			 <0x00 0x60000000 0x00 0x60000000 0x00 0x08000000>, /* FSS0 DAT1 */
+			 <0x00 0x70800000 0x00 0x70800000 0x00 0x00010000>, /* OCSRAM */
+			 <0x01 0x00000000 0x01 0x00000000 0x00 0x00310000>, /* A53 PERIPHBASE */
+			 <0x05 0x00000000 0x05 0x00000000 0x01 0x00000000>, /* FSS0 DAT3 */
+
+			 /* Wakeup Domain Range */
+			 <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
+			 <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
+			 <0x00 0x04201000 0x00 0x04201000 0x00 0x00008000>, /* GPIO */
+			 <0x00 0x2b100000 0x00 0x2b000000 0x00 0x00200400>, /* TIMER */
+			 <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
+			 <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		 cbass_wakeup:  bus@43000000 {
+			 compatible = "simple-bus";
+			 ranges = <0x00 0x00b00000 0x00 0x00b00000 0x00 0x00001400>, /* VTM */
+				  <0x00 0x04080000 0x00 0x04080000 0x00 0x00008000>, /* PDCFG */
+				  <0x00 0x04201000 0x00 0x04201000 0x00 0x00008000>, /* GPIO */
+				  <0x00 0x2b100000 0x00 0x2b000000 0x00 0x00200400>, /* TIMER */
+				  <0x00 0x40800000 0x00 0x40800000 0x00 0x00014000>, /* DMA */
+				  <0x00 0x43000000 0x00 0x43000000 0x00 0x00080000>; /* CTRL MMRs */
+			 #address-cells = <2>;
+			 #size-cells = <2>;
+			 bootph-all;
+		 };
+	};
+};
+
+/* Now include peripherals for each bus segment */
+#include "k3-am62l-main.dtsi"
+#include "k3-am62l-wakeup.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62l3.dtsi b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
new file mode 100644
index 0000000000000..7dfc869fbce08
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62l3.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only or MIT
+/*
+ * Device Tree file for the AM62L3 SoC family (Dual Core A53)
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
+ *
+ * Technical Reference Manual: https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf
+ */
+
+/dts-v1/;
+
+#include "k3-am62l.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0: cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x000>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+			device_type = "cpu";
+			enable-method = "psci";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <128>;
+			next-level-cache = <&l2_0>;
+		};
+	};
+
+	l2_0: l2-cache0 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+		cache-size = <0x40000>;
+		cache-line-size = <64>;
+		cache-sets = <256>;
+	};
+};
diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 22b8d73cfd326..56abfe1790bee 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -47,6 +47,8 @@
 #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
 
+#define AM62LX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
+
 #define AM62X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62X_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
 

-- 
2.46.0


