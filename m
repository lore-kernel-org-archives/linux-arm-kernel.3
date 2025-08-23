Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E7CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR/hoH64cH3MOD7K6qgvNDmIbIcrvHYcVdV4BgK66Jg=; b=qk9cqOV1hi74jT1IxkouyI94v5
	IvF5o6MXgJiT7tgtjYlQocrHKmfVS8gf32aNcY1Wg6BsoGaQOCqV7vHTQHDCCp39Q9A3r1+e1fQq7
	JbjrpGhbqTQxrr2luGm1Qb3GQJI6FaqTANdiqA0tAQgXwMUGqT82U1Ag+oaJ4eydR8QVoUh1rIn39
	0tdRbW9QbiUsyFuiePKLbAxd3sBDZ+/sg74oKENyKS9cV62tZWsRoVV+prqhGKjsebK/4ayfMp4VN
	q/YLjbB6p3RnnQAGSkbZCVqQIkquJ2rnNYBbbK6rx43Eo+rMOshrk9sS90AEXoB5nJlzsQnllg1UT
	fLw54JAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upt99-00000005BTD-363o;
	Sat, 23 Aug 2025 18:39:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqqG-00000004ziG-2vSH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 16:11:46 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57NGBg1w468652;
	Sat, 23 Aug 2025 11:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755965502;
	bh=kR/hoH64cH3MOD7K6qgvNDmIbIcrvHYcVdV4BgK66Jg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LFePR+2F0fUFH6l2JF/n38nOA6bxW/9RThCJuObBvmeiivYJxPDdrDUBO0HnVB65g
	 H7zr+zbpdHXMuSLynugwvvMduFV2e3BxNJ3KQiuJV/Z9XxCaoiyN85n9gWDilIkvVI
	 YDH6n5oyRTArycfzw/PT3USDqpHrLEwo9fV30uLA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57NGBf8f3736509
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 23 Aug 2025 11:11:42 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 23
 Aug 2025 11:11:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 23 Aug 2025 11:11:41 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57NG9Exl1274978;
	Sat, 23 Aug 2025 11:11:37 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 31/33] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Refactor IPC cfg into new dtsi
Date: Sat, 23 Aug 2025 21:38:59 +0530
Message-ID: <20250823160901.2177841-32-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250823160901.2177841-1-b-padhi@ti.com>
References: <20250823160901.2177841-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_091144_829321_9B587F64 
X-CRM114-Status: GOOD (  17.17  )
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

The TI K3 AM62A SoCs have multiple programmable remote processors like
R5F, C7x etc. The TI SDKs for AM62A SoCs offer sample firmwares which
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
---
v2: Changelog:
1. Re-ordered patch from [PATCH 25/33] to [PATCH v2 31/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-26-b-padhi@ti.com/

 .../boot/dts/ti/k3-am62a-phycore-som.dtsi     | 90 +----------------
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi | 98 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 92 +----------------
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts      | 76 +-------------
 4 files changed, 102 insertions(+), 254 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 3108e9b0c804..44c73ed637da 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -59,30 +59,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99800000 0x00 0x100000>;
-			no-map;
-		};
-
-		c7x_0_memory_region: c7x-memory@99900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99900000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b800000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
@@ -209,13 +185,6 @@ opp-1400000000 {
 	};
 };
 
-&c7x_0 {
-	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
-	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
-	status = "okay";
-};
-
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_rgmii1_pins_default>;
@@ -246,33 +215,6 @@ &fss {
 	status = "okay";
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-
-	mbox_c7x_0: mbox-c7x-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_mcu_r5_0: mbox-mcu-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
@@ -388,27 +330,6 @@ &main_pktdma {
 	bootph-all;
 };
 
-/* main_rti4 is used by C7x DSP */
-&main_rti4 {
-	status = "reserved";
-};
-
-/* main_timer2 is used by C7x DSP */
-&main_timer2 {
-	status = "reserved";
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
@@ -437,13 +358,4 @@ &sdhci0 {
 	status = "okay";
 };
 
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0  &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
+#include "k3-am62a-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..91583cd23b12
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on AM62A SoCs
+ *
+ * Copyright (C) 2022-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&reserved_memory {
+	c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x99800000 0x00 0x100000>;
+		no-map;
+	};
+
+	c7x_0_memory_region: c7x-memory@99900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x99900000 0x00 0xf00000>;
+		no-map;
+	};
+
+	mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9b800000 0x00 0x100000>;
+		no-map;
+	};
+
+	mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9b900000 0x00 0xf00000>;
+		no-map;
+	};
+};
+
+&mailbox0_cluster0 {
+	status = "okay";
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+
+	mbox_c7x_0: mbox-c7x-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+
+	mbox_mcu_r5_0: mbox-mcu-r5-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+};
+
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&c7x_0 {
+	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
+	memory-region = <&c7x_0_dma_memory_region>,
+			<&c7x_0_memory_region>;
+	status = "okay";
+};
+
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 7ebcfe8edfe1..ede03f449d65 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -53,30 +53,6 @@ linux,cma {
 			linux,cma-default;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99800000 0x00 0x100000>;
-			no-map;
-		};
-
-		c7x_0_memory_region: c7x-memory@99900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99900000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b800000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
@@ -713,11 +689,6 @@ &main_uart1 {
 	status = "reserved";
 };
 
-/* main_timer2 is used by C7x DSP */
-&main_timer2 {
-	status = "reserved";
-};
-
 &usbss0 {
 	status = "okay";
 	ti,vbus-divider;
@@ -835,67 +806,6 @@ &epwm1 {
 	status = "okay";
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-
-	mbox_c7x_0: mbox-c7x-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_mcu_r5_0: mbox-mcu-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
-&wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&c7x_0 {
-	mboxes = <&mailbox0_cluster1>, <&mbox_c7x_0>;
-	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
-	status = "okay";
-};
-
-/* main_rti4 is used by C7x DSP */
-&main_rti4 {
-	status = "reserved";
-};
-
 &fss {
 	status = "okay";
 };
@@ -937,3 +847,5 @@ AM62AX_IOPAD(0x008, PIN_INPUT, 0) /* (J24) OSPI0_DQS */
 		>;
 	};
 };
+
+#include "k3-am62a-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index 41860ac42f3c..a57fc2362dfd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -58,30 +58,6 @@ secure_tfa_ddr: tfa@80000000 {
 			no-map;
 		};
 
-		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99800000 0x00 0x100000>;
-			no-map;
-		};
-
-		c7x_0_memory_region: c7x-memory@99900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x99900000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_dma_memory_region: r5f-dma-memory@9b800000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b800000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core0_memory_region: r5f-dma-memory@9b900000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9b900000 0x00 0xf00000>;
-			no-map;
-		};
-
 		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c800000 0x00 0x100000>;
@@ -551,66 +527,16 @@ cpsw3g_phy1: ethernet-phy@3 {
 	};
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-
-	mbox_r5_0: mbox-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-
-	mbox_c7x_0: mbox-c7x-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_mcu_r5_0: mbox-mcu-r5-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&wkup_r5fss0 {
-	status = "okay";
-};
-
 &wkup_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
-	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	status = "okay";
 	bootph-pre-ram;
 };
 
-&mcu_r5fss0 {
-	status = "okay";
-};
-
 &mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_mcu_r5_0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
 	firmware-name = "am62d-mcu-r5f0_0-fw";
-	status = "okay";
 };
 
 &c7x_0 {
-	mboxes = <&mailbox0_cluster1 &mbox_c7x_0>;
-	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
 	firmware-name = "am62d-c71_0-fw";
-	status = "okay";
 };
 
-/* main_rti4 is used by C7x DSP */
-&main_rti4 {
-	status = "reserved";
-};
+#include "k3-am62a-ti-ipc-firmware.dtsi"
-- 
2.34.1


