Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBC1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1msyrEjLzU5sVYoDtxlhOd4TOZqVOCbRm9j4ZgloS3s=; b=28oDPfQ54ACUssMmO/lSCmUXlp
	5aFyx/h9ngKsWsZWhsd9uNm03eidhS1+uFhUEGzlRYekNrz89fagw02qvjnlvmoR0vAulVsd39VQT
	qjyh67JCD6YWy4EEfnPEo+05wGwWc/lJ6FHq6A/zXLo7Ahz46y910nfwX09w/FGGZNLieQp5jtiwS
	Al+g8IIzsqNV54CazuvqUdys06erZu7cQVR98+Hn6bQ1lN4D4oEpmQWCzMOM+w0X9NeWHXB7ZGEk1
	60J5mMdyDAnUMbciICEOuHPDjKMirHxhFh82ga/+7g8sxJ4j46vXbgHJrhaQf5NCqaaAHnplb9I5x
	kU8BUT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVr5-00000000LNc-3hsj;
	Mon, 10 Feb 2025 15:37:51 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVeX-00000000IQB-2ZDL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 15:24:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AF0lYD002305;
	Mon, 10 Feb 2025 16:24:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1msyrEjLzU5sVYoDtxlhOd4TOZqVOCbRm9j4ZgloS3s=; b=EBMaY+TZFMuHaIez
	wU4ZNZt+7gqs2nBfUmsNfA9hBzYvMIV9LaQwxWhtBGRzwEK4xxixOPMa8VdWhyIw
	wWyxGpKNY9keMlOoGgupO71b16vf2moKXTUeo5AfmofIJk+sMG1mz2swZj4SNZjg
	ZFGvMc7zYxgDLbdCF/wq756LGoRBnm/wxX+c2mzkXNvntSpvqdQFbQOX4IvLtVJK
	unKuQPkCx+GGFVQl+K0/Kdzc4QY2tbdogRmOSgDSXHcXIfnNRBixHiSFTuS+tqma
	xeeGrvt9jZKz54r/vyk4vvz9aP5857AAwMAjdIkFWEtcO2p+kuWvmSPpAZJ7jTen
	SnJnBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0pyq6kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 16:24:46 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8BDE640061;
	Mon, 10 Feb 2025 16:23:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 942512957B3;
	Mon, 10 Feb 2025 16:21:42 +0100 (CET)
Received: from localhost (10.48.87.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 16:21:42 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Mon, 10 Feb 2025 16:21:02 +0100
Subject: [PATCH 08/10] arm64: dts: st: introduce stm32mp21 SoCs family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-b4-stm32mp2_new_dts-v1-8-e8ef1e666c5e@foss.st.com>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_08,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_072453_967165_4DEB1A9A 
X-CRM114-Status: GOOD (  11.07  )
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

STM32MP21 family is composed of 3 SoCs defined as following:

-STM32MP211: common part composed of 1*Cortex-A35, common peripherals
like SDMMC, UART, SPI, I2C, parallel display, 1*ETH ...

-STM32MP213: STM32MP211 + a second ETH, CAN-FD.

-STM32MP215: STM32MP213 + Display and CSI2.

A second diversity layer exists for security features/ A35 frequency:
-STM32MP21xY, "Y" gives information:
 -Y = A means A35@1.2GHz + no cryp IP and no secure boot.
 -Y = C means A35@1.2GHz + cryp IP and secure boot.
 -Y = D means A35@1.5GHz + no cryp IP and no secure boot.
 -Y = F means A35@1.5GHz + cryp IP and secure boot.

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi  | 130 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp213.dtsi  |   9 +++
 arch/arm64/boot/dts/st/stm32mp215.dtsi  |   9 +++
 arch/arm64/boot/dts/st/stm32mp21xc.dtsi |   8 ++
 arch/arm64/boot/dts/st/stm32mp21xf.dtsi |   8 ++
 5 files changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d384359e0ea16e2593795ff48d4a699324c8ca75
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a35";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a35-pmu";
+		interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>;
+		interrupt-parent = <&intc>;
+	};
+
+	arm_wdt: watchdog {
+		compatible = "arm,smc-wdt";
+		arm,smc-id = <0xbc000000>;
+		status = "disabled";
+	};
+
+	clocks {
+		ck_flexgen_08: ck-flexgen-08 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <64000000>;
+		};
+
+		ck_flexgen_51: ck-flexgen-51 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
+		};
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+
+		scmi: scmi {
+			compatible = "linaro,scmi-optee";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			linaro,optee-channel-id = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_reset: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	intc: interrupt-controller@4ac00000 {
+		compatible = "arm,cortex-a7-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x0 0x4ac10000 0x0 0x1000>,
+		      <0x0 0x4ac20000 0x0 0x2000>,
+		      <0x0 0x4ac40000 0x0 0x2000>,
+		      <0x0 0x4ac60000 0x0 0x2000>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,no-tick-in-suspend;
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <2>;
+		interrupt-parent = <&intc>;
+		ranges = <0x0 0x0 0x0 0x0 0x80000000>;
+		dma-ranges = <0x0 0x0 0x80000000 0x1 0x0>;
+
+		rifsc: bus@42080000 {
+			compatible = "simple-bus";
+			reg = <0x42080000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <2>;
+			ranges;
+			dma-ranges;
+
+			usart2: serial@400e0000 {
+				compatible = "st,stm32h7-uart";
+				reg = <0x400e0000 0x0 0x400>;
+				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ck_flexgen_08>;
+				status = "disabled";
+			};
+		};
+
+		syscfg: syscon@44230000 {
+			compatible = "st,stm32mp25-syscfg", "syscon";
+			reg = <0x44230000 0x0 0x10000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp213.dtsi b/arch/arm64/boot/dts/st/stm32mp213.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..22cdedd9abbf4efac2334d497618daa6cc76727b
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp213.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp211.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp215.dtsi b/arch/arm64/boot/dts/st/stm32mp215.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d2c63e92b3cc15ec64898374fd2e745a9c71eb6d
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp215.dtsi
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+#include "stm32mp213.dtsi"
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xc.dtsi b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..39507a7564c8488647a3276eb227eb5f446359e6
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xc.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};
diff --git a/arch/arm64/boot/dts/st/stm32mp21xf.dtsi b/arch/arm64/boot/dts/st/stm32mp21xf.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..39507a7564c8488647a3276eb227eb5f446359e6
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp21xf.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2024 - All Rights Reserved
+ * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
+ */
+
+/ {
+};

-- 
2.25.1


