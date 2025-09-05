Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA37CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 06:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CcSBn1sieMh3wLMCvhjWJn/ZJZah8FAD6lzlnYyzRs=; b=v4+YJxguAoOZvMIJC+iyrPfmXS
	UMGa5IuZq11eZVXY4jdlELH6wnZSCPDYECSpHeNsGA/WqWPfKpwnW1pLwkZqhaC1KFVKd0hpG0zzz
	hfoyrSJSloiDlzktPIxHdOCQFbq55ls0k6JuJugEllpGtaFxKbaNCQ8+AFtcm0n34gTOpYzYMkthC
	q/Uc05EUZhFzcDNMCaMrJdGpF/ZL7ZxR4eC5Jokp41FYDoQ4WYkfGVDwNq9Oy4+YBEA6UqzLQoS9Z
	zN8XZdfT3/0kz1yqfMyJVRPIPzMLuj2QVuOPwrL3OHnFlSXNk3CLfiCwtiOe9wrE8+tgDDHg3EPQi
	cBsmYnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQNh-0000000HQFu-3R4r;
	Fri, 05 Sep 2025 06:57:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOss-0000000GxRm-1Cqo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:21:15 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855LB913246656;
	Fri, 5 Sep 2025 00:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757049671;
	bh=7CcSBn1sieMh3wLMCvhjWJn/ZJZah8FAD6lzlnYyzRs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Phcet9x4fD5bzS3er92yxMJfWIu2Qx4e/8oUF5oge3XatyDL5CKC5jhH3RCFkuH84
	 GzdO6h5BU8sKOdwv0Mqjv11Hi2aJNXKPAoZcHJNi1cUmmnCvzm8ZcYxHOahtykapUg
	 tFIbv2boM0SfYMAEdW/Omv72NUXKQzW2vtZTcjXM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855LBTg1405980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 00:21:11 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:21:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:21:10 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855Ioix220581;
	Fri, 5 Sep 2025 00:21:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: [PATCH v3 30/33] arm64: dts: ti: k3-am62-ti-ipc-firmware: Refactor IPC cfg into new dtsi
Date: Fri, 5 Sep 2025 10:48:43 +0530
Message-ID: <20250905051846.1189612-31-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905051846.1189612-1-b-padhi@ti.com>
References: <20250905051846.1189612-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_222114_419363_D7518F82 
X-CRM114-Status: GOOD (  15.97  )
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

The TI K3 AM62 SoCs have multiple programmable remote processors like
R5F, M4F etc. The TI SDKs for AM62 SoCs offer sample firmwares which
could be run on these cores to demonstrate an "echo" IPC test. Those
firmware require certain memory carveouts to be reserved from system
memory, timers to be reserved, and certain mailbox configurations for
interrupt based messaging. These configurations could be different for a
different firmware.

While DT is not meant for system configurations, at least refactor these
configurations from board level DTS into a dtsi for now. This dtsi for
TI IPC firmware is board-independent and can be applied to all boards
from the same SoC Family. This gets rid of code duplication and allows
more freedom for users developing custom firmware (or no firmware) to
utilize system resources better; easily by swapping out this dtsi. To
maintain backward compatibility, the dtsi is included in all boards.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
Tested-by: Wadim Egorov <w.egorov@phytec.de> # phycore-am62x
---
v3: Changelog:
1. Changed memory node name to memory@addr. 
2. Carried R/B, T/B tags.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-31-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 22/33] to [PATCH v2 30/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-23-b-padhi@ti.com/

 .../boot/dts/ti/k3-am62-phycore-som.dtsi      | 44 +---------------
 .../boot/dts/ti/k3-am62-pocketbeagle2.dts     | 46 +---------------
 .../boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi  | 52 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi    | 46 +---------------
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 46 +---------------
 5 files changed, 59 insertions(+), 175 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index dcd22ff487ec..34b2e8d6bf80 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -52,18 +52,6 @@ rtos_ipc_memory_region: ipc-memories@9c800000 {
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cb00000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cc00000 0x00 0xe00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9da00000 0x00 0x100000>;
@@ -245,20 +233,6 @@ cpsw3g_phy1: ethernet-phy@1 {
 	};
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
 &main_pktdma {
 	bootph-all;
 };
@@ -364,13 +338,6 @@ i2c_som_rtc: rtc@52 {
 	};
 };
 
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
@@ -399,13 +366,4 @@ &sdhci0 {
 	status = "okay";
 };
 
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
+#include "k3-am62-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 729901b2ca10..e634abe9e8e6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -54,18 +54,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cb00000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cc00000 0x00 0xe00000>;
-			no-map;
-		};
-
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -298,20 +286,6 @@ &epwm2 {
 	pinctrl-0 = <&epwm2_pins_default>;
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
 &main_uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_uart0_pins_default>;
@@ -362,24 +336,6 @@ &main_i2c2 {
 	status = "okay";
 };
 
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
 &mcu_pmx0 {
 	wkup_uart0_pins_default: wkup-uart0-default-pins {
 		pinctrl-single,pins = <
@@ -543,3 +499,5 @@ ldo4_reg: ldo4 {
 		};
 	};
 };
+
+#include "k3-am62-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..ea69fab9b52b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on AM62 SoCs
+ *
+ * Copyright (C) 2021-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&reserved_memory {
+	mcu_m4fss_dma_memory_region: memory@9cb00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9cb00000 0x00 0x100000>;
+		no-map;
+	};
+
+	mcu_m4fss_memory_region: memory@9cc00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9cc00000 0x00 0xe00000>;
+		no-map;
+	};
+};
+
+&mailbox0_cluster0 {
+	status = "okay";
+
+	mbox_m4_0: mbox-m4-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 5ecdd833587e..dc4b228a9fd7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -206,18 +206,6 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		mcu_m4fss_dma_memory_region: memory@9cb00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cb00000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@9cc00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cc00000 0x00 0xe00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: memory@9da00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9da00000 0x00 0x100000>;
@@ -1334,38 +1322,6 @@ &main_i2c3 {
 	status = "disabled";
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
 /* Verdin CAN_1 */
 &main_mcan0 {
 	pinctrl-names = "default";
@@ -1549,3 +1505,5 @@ &wkup_uart0 {
 	pinctrl-0 = <&pinctrl_wkup_uart0>;
 	status = "disabled";
 };
+
+#include "k3-am62-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 03b8e246d8c2..ec2685144558 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -58,18 +58,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		mcu_m4fss_dma_memory_region: m4f-dma-memory@9cb00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cb00000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: m4f-memory@9cc00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9cc00000 0x00 0xe00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9da00000 0x00 0x100000>;
@@ -477,38 +465,6 @@ cpsw3g_phy0: ethernet-phy@0 {
 	};
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster0 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
 &usbss0 {
 	bootph-all;
 	status = "okay";
@@ -601,3 +557,5 @@ &epwm1 {
 	pinctrl-0 = <&main_epwm1_pins_default>;
 	status = "okay";
 };
+
+#include "k3-am62-ti-ipc-firmware.dtsi"
-- 
2.34.1


