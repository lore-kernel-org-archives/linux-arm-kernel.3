Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43316CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krlVJxioMsDrJW2XlkwyB0bBUJJkPx1oQj9XKMu+vrQ=; b=NSiwyodMI2h9WkfX7Rd7lRorNy
	hoh4ZIxZS9EW90o9/n3G3HQ16zHUluTRrPzQ7gbOtW7fjv1L7GblsbfvHS9UyK5//C6CC3UU7im+N
	4hw7ef+/4AqFPFOPAXUQW53Dsg+qZ2AZgeO2AxcwwuRbjuSQipQ3M0Pa6dWk4/BYBx2ZVUapuWzP7
	RORBsyLizbsBwkoeNv9YYEanGNF9jlae8v8LS5ApnXwjOdJSFNuIZl6KINRakN0anDMWyvRRc9UVv
	EA4tz9EOmZkpCtNMkrEPKIqOjVUX+ghllzl34w3hadh6px16Ea6mIwkhlT+cDmtinx7PRCbsg5acN
	TySKj24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uptEK-00000005BgE-1ERH;
	Sat, 23 Aug 2025 18:44:44 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqqO-00000004zkA-2gN1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:11:54 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGBo2H468668;
	Sat, 23 Aug 2025 11:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965510;
	bh=krlVJxioMsDrJW2XlkwyB0bBUJJkPx1oQj9XKMu+vrQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oxESDF3vCfszk+9xgHKlmWh/m54kTI5SPeRbuCfAvgYRzFuWavTLA4h5hwVRJZGRm
	 3BC3Z42nebPvRxMpd9gK0YD+ujcn/m/pnTUbNxyzq6PF9LwKMZAt87YxMWENTA6kVc
	 xK97gu9194aFs3Yd4ar4oGIB1JXc2JsKAoP4O6V4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGBoTp3736591
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:11:50 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:11:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:11:49 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9Exn1274978;
	Sat, 23 Aug 2025 11:11:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 33/33] arm64: dts: ti: k3-am65-ti-ipc-firmware: Refactor IPC cfg into new dtsi
Date: Sat, 23 Aug 2025 21:39:01 +0530
Message-ID: <20250823160901.2177841-34-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091152_768957_DD0B4B62 
X-CRM114-Status: GOOD (  18.11  )
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

The TI K3 AM65 SoCs have multiple programmable remote processors like
R5Fs. The TI SDKs for AM65 SoCs offer sample firmwares which could be
run on these cores to demonstrate an "echo" IPC test. Those firmware
require certain memory carveouts to be reserved from system memory,
timers to be reserved, and certain mailbox configurations for interrupt
based messaging. These configurations could be different for a different
firmware.

While DT is not meant for system configurations, at least refactor these
configurations from board level DTS into a dtsi for now. This dtsi for
TI IPC firmware is board-independent and can be applied to all boards
from the same SoC Family. This gets rid of code duplication and allows
more freedom for users developing custom firmware (or no firmware) to
utilize system resources better; easily by swapping out this dtsi. To
maintain backward compatibility, the dtsi is included in all boards.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Re-ordered patch from [PATCH 32/33] to [PATCH v2 33/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-33-b-padhi@ti.com/

 .../boot/dts/ti/k3-am65-iot2050-common.dtsi   | 62 ++----------------
 .../boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi  | 64 +++++++++++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 58 +----------------
 3 files changed, 72 insertions(+), 112 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index 6cd499ea53e7..19eb4a32e18d 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -59,24 +59,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			no-map;
 		};
 
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa1000000 0 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa1100000 0 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: ipc-memories@a2000000 {
-			reg = <0x00 0xa2000000 0x00 0x00200000>;
-			alignment = <0x1000>;
-			no-map;
-		};
-
 		/* To reserve the power-on(PON) reason for watchdog reset */
 		wdt_reset_memory_region: wdt-memory@a2200000 {
 			reg = <0x00 0xa2200000 0x00 0x1000>;
@@ -582,44 +564,6 @@ &pcie1_rc {
 	reset-gpios = <&wkup_gpio0 27 GPIO_ACTIVE_HIGH>;
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-	interrupts = <436>;
-
-	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-		ti,mbox-tx = <1 0 0>;
-		ti,mbox-rx = <0 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-	interrupts = <432>;
-
-	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
-		ti,mbox-tx = <1 0 0>;
-		ti,mbox-rx = <0 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	status = "okay";
-};
-
-&mcu_r5fss0_core1 {
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
-	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
-	status = "okay";
-};
-
 &mcu_rti1 {
 	memory-region = <&wdt_reset_memory_region>;
 };
@@ -692,3 +636,9 @@ &mcu_r5fss0 {
 	/* lock-step mode not supported on iot2050 boards */
 	ti,cluster-mode = <0>;
 };
+
+#include "k3-am65-ti-ipc-firmware.dtsi"
+
+&rtos_ipc_memory_region {
+	reg = <0x00 0xa2000000 0x00 0x00200000>;
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..514ec4c03056
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on AM65 SoCs
+ *
+ * Copyright (C) 2016-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&reserved_memory {
+	mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		compatible = "shared-dma-pool";
+		reg = <0 0xa1000000 0 0x100000>;
+		no-map;
+	};
+
+	mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		compatible = "shared-dma-pool";
+		reg = <0 0xa1100000 0 0xf00000>;
+		no-map;
+	};
+
+	rtos_ipc_memory_region: ipc-memories@a2000000 {
+		reg = <0x00 0xa2000000 0x00 0x00100000>;
+		alignment = <0x1000>;
+		no-map;
+	};
+};
+
+&mailbox0_cluster0 {
+	status = "okay";
+	interrupts = <436>;
+
+	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
+		ti,mbox-tx = <1 0 0>;
+		ti,mbox-rx = <0 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+	interrupts = <432>;
+
+	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
+		ti,mbox-tx = <1 0 0>;
+		ti,mbox-rx = <0 0 0>;
+	};
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	status = "okay";
+};
+
+&mcu_r5fss0_core1 {
+	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
+			<&mcu_r5fss0_core1_memory_region>;
+	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index e532ea0a22b2..adb7b8e6d52e 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -61,24 +61,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			reg = <0 0xa0100000 0 0xf00000>;
 			no-map;
 		};
-
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa1000000 0 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0xa1100000 0 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: ipc-memories@a2000000 {
-			reg = <0x00 0xa2000000 0x00 0x00100000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	gpio-keys {
@@ -521,44 +503,6 @@ &serdes1 {
 	status = "disabled";
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-	interrupts = <436>;
-
-	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-		ti,mbox-tx = <1 0 0>;
-		ti,mbox-rx = <0 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-	interrupts = <432>;
-
-	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
-		ti,mbox-tx = <1 0 0>;
-		ti,mbox-rx = <0 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	status = "okay";
-};
-
-&mcu_r5fss0_core1 {
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
-	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
-	status = "okay";
-};
-
 &ospi0 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -653,3 +597,5 @@ &dss {
 &wkup_gpio0 {
 	bootph-all;
 };
+
+#include "k3-am65-ti-ipc-firmware.dtsi"
-- 
2.34.1


