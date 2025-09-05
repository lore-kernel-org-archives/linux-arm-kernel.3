Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04885CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 06:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tjLB6Ar1uMU3oVthaalUvfXwZsBUyVa+HUgHQ9QTyA=; b=KIXr8D3/lRzxZdpKkiQuZWJNF4
	VQVVqth4LjaJ8AyRfZtQ1kZvDvj9GyYvGBOYtpdnjLGnuQ+KqaAtDoMVvngJOpt2rORnndyeM1Mw6
	S7YE4qhAN0sAQ9GrUJb3Il+jLCDqKdCUbjeY2aJjFX69JeSHhRiou7Q9NAIHjKVBGNfp7fQ1iRa3q
	Kg3dgGFv1H2zsqAuP0q+cXBcUQ8Ixl7cc9z7mOFAX4tSZBD1cUTzfhIV+/b1xfN4letjYx2yBdRDL
	UwDU0GKXXPaMEpFvbU3g7tp6xek5sEb8B/v/AsqUSAvzyUHdJIkETrJHnJy94S0zRmwNBOnN69uol
	vN2KQC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQAN-0000000HMD4-2v4e;
	Fri, 05 Sep 2025 06:43:23 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOsX-0000000GxJh-20kk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:20:55 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855KoXa3246582;
	Fri, 5 Sep 2025 00:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757049650;
	bh=4tjLB6Ar1uMU3oVthaalUvfXwZsBUyVa+HUgHQ9QTyA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m8ijhm5XU8WnUW9HIbsOKdcNHST6PyE8EH4qKetMudQizC9x+t8nO5g9z4clVoOMF
	 Y9M9IfoaWWp6fJgaU4OuUTMJmg+HrtNlf8ecvVGoh9OFExqu5Ne0qyiI4yDNJOMEkW
	 U3wZ6WjvmOJl0bHjMhzYnYw3nBmvPMcJUBGzfsuE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855Ko2p1405715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 00:20:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:20:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:20:49 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855Iois220581;
	Fri, 5 Sep 2025 00:20:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 25/33] arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Refactor IPC cfg into new dtsi
Date: Fri, 5 Sep 2025 10:48:38 +0530
Message-ID: <20250905051846.1189612-26-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905051846.1189612-1-b-padhi@ti.com>
References: <20250905051846.1189612-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_222053_618433_1E36687E 
X-CRM114-Status: GOOD (  14.25  )
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

The TI K3 J721S2 SoCs have multiple programmable remote processors like
R5F, C7x etc. The TI SDKs for J721S2 SoCs offer sample firmwares which
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
v3: Changelog:
1. None

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-26-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 09/33] to [PATCH v2 25/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-10-b-padhi@ti.com/

 .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 247 +----------------
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi    | 241 +----------------
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  | 243 +----------------
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 253 ++++++++++++++++++
 4 files changed, 258 insertions(+), 726 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index 383594732e81..21fe9083c19c 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -60,96 +60,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_0_memory_region: c71-memory@a6100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_1_memory_region: c71-memory@a7100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
-			reg = <0x00 0xa8000000 0x00 0x01c00000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	vdd_sd_dv: regulator-sd {
@@ -243,80 +153,6 @@ J721S2_WKUP_IOPAD(0x09c, PIN_INPUT_PULLUP, 0) /* (H27) WKUP_I2C0_SDA */
 	};
 };
 
-&c71_0 {
-	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
-	memory-region = <&c71_0_dma_memory_region>,
-			<&c71_0_memory_region>;
-	status = "okay";
-};
-
-&c71_1 {
-	mboxes = <&mailbox0_cluster4 &mbox_c71_1>;
-	memory-region = <&c71_1_dma_memory_region>,
-			<&c71_1_memory_region>;
-	status = "okay";
-};
-
-&mailbox0_cluster0 {
-	interrupts = <436>;
-	status = "okay";
-
-	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	interrupts = <432>;
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	interrupts = <428>;
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster4 {
-	interrupts = <420>;
-	status = "okay";
-
-	mbox_c71_0: mbox-c71-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_c71_1: mbox-c71-1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
 &main_cpsw {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii1_pins_default>;
@@ -367,34 +203,6 @@ &main_gpio0 {
 	status = "okay";
 };
 
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
 /* eMMC */
 &main_sdhci0 {
 	non-removable;
@@ -409,59 +217,6 @@ &main_sdhci1 {
 	bootph-all;
 };
 
-&main_r5fss0 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-/* Timers are used by Remoteproc firmware */
-&main_timer0 {
-	status = "reserved";
-};
-
-&main_timer1 {
-	status = "reserved";
-};
-
-&main_timer2 {
-	status = "reserved";
-};
-
-&main_timer3 {
-	status = "reserved";
-};
-
-&main_timer4 {
-	status = "reserved";
-};
-
-&main_timer5 {
-	status = "reserved";
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&mcu_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi0_pins_default>;
@@ -611,3 +366,5 @@ som_eeprom_opt: eeprom@51 {
 		pagesize = <32>;
 	};
 };
+
+#include "k3-j721s2-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 2d2edeeb7347..4b14fb1062bd 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -38,96 +38,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_0_memory_region: c71-memory@a6100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_1_memory_region: c71-memory@a7100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
-			reg = <0x00 0xa8000000 0x00 0x01c00000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 };
 
@@ -235,153 +145,4 @@ partition@3fc0000 {
 	};
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-	interrupts = <436>;
-	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-	interrupts = <432>;
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	status = "okay";
-	interrupts = <428>;
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-	interrupts = <420>;
-	mbox_c71_0: mbox-c71-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_c71_1: mbox-c71-1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&mcu_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-/* Timers are used by Remoteproc firmware */
-&main_timer0 {
-	status = "reserved";
-};
-
-&main_timer1 {
-	status = "reserved";
-};
-
-&main_timer2 {
-	status = "reserved";
-};
-
-&main_timer3 {
-	status = "reserved";
-};
-
-&main_timer4 {
-	status = "reserved";
-};
-
-&main_timer5 {
-	status = "reserved";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&c71_0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
-	memory-region = <&c71_0_dma_memory_region>,
-			<&c71_0_memory_region>;
-};
-
-&c71_1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster4 &mbox_c71_1>;
-	memory-region = <&c71_1_dma_memory_region>,
-			<&c71_1_memory_region>;
-};
+#include "k3-j721s2-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index f252007262d3..d4d996b985ae 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -42,96 +42,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa5100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_0_dma_memory_region: c71-dma-memory@a6000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_0_memory_region: c71-memory@a6100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_1_dma_memory_region: c71-dma-memory@a7000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_1_memory_region: c71-memory@a7100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: ipc-memories@a8000000 {
-			reg = <0x00 0xa8000000 0x00 0x01c00000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	mux0: mux-controller-0 {
@@ -516,157 +426,6 @@ partition@3fc0000 {
 	};
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-	interrupts = <436>;
-	mbox_mcu_r5fss0_core0: mbox-mcu-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster1 {
-	status = "okay";
-	interrupts = <432>;
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster2 {
-	status = "okay";
-	interrupts = <428>;
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-	interrupts = <420>;
-	mbox_c71_0: mbox-c71-0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_c71_1: mbox-c71-1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&mcu_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	ti,cluster-mode = <0>;
-	status = "okay";
-};
-
-/* Timers are used by Remoteproc firmware */
-&main_timer0 {
-	status = "reserved";
-};
-
-&main_timer1 {
-	status = "reserved";
-};
-
-&main_timer2 {
-	status = "reserved";
-};
-
-&main_timer3 {
-	status = "reserved";
-};
-
-&main_timer4 {
-	status = "reserved";
-};
-
-&main_timer5 {
-	status = "reserved";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&c71_0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
-	memory-region = <&c71_0_dma_memory_region>,
-			<&c71_0_memory_region>;
-};
-
-&c71_1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster4 &mbox_c71_1>;
-	memory-region = <&c71_1_dma_memory_region>,
-			<&c71_1_memory_region>;
-};
-
 &main_i2c4 {
 	bridge_dsi_edp: bridge-dsi-edp@2c {
 		compatible = "ti,sn65dsi86";
@@ -693,3 +452,5 @@ port@1 {
 		};
 	};
 };
+
+#include "k3-j721s2-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..835da81ba78e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -0,0 +1,253 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on J721S2 SoCs
+ *
+ * Copyright (C) 2021-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&reserved_memory {
+	mcu_r5fss0_core1_dma_memory_region: r5f-dma-memory@a1000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa1000000 0x00 0x100000>;
+		no-map;
+	};
+
+	mcu_r5fss0_core1_memory_region: r5f-memory@a1100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa1100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a2000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa2000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss0_core0_memory_region: r5f-memory@a2100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa2100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss0_core1_dma_memory_region: r5f-dma-memory@a3000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa3000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss0_core1_memory_region: r5f-memory@a3100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa3100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss1_core0_dma_memory_region: r5f-dma-memory@a4000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa4000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss1_core0_memory_region: r5f-memory@a4100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa4100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss1_core1_dma_memory_region: r5f-dma-memory@a5000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa5000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa5100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	c71_0_dma_memory_region: c71-dma-memory@a6000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa6000000 0x00 0x100000>;
+		no-map;
+	};
+
+	c71_0_memory_region: c71-memory@a6100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa6100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	c71_1_dma_memory_region: c71-dma-memory@a7000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa7000000 0x00 0x100000>;
+		no-map;
+	};
+
+	c71_1_memory_region: c71-memory@a7100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa7100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	rtos_ipc_memory_region: ipc-memories@a8000000 {
+		reg = <0x00 0xa8000000 0x00 0x01c00000>;
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
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster1 {
+	status = "okay";
+	interrupts = <432>;
+
+	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+	interrupts = <428>;
+
+	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+&mailbox0_cluster4 {
+	status = "okay";
+	interrupts = <420>;
+
+	mbox_c71_0: mbox-c71-0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_c71_1: mbox-c71-1 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
+};
+
+/* Timers are used by Remoteproc firmware */
+&main_timer0 {
+	status = "reserved";
+};
+
+&main_timer1 {
+	status = "reserved";
+};
+
+&main_timer2 {
+	status = "reserved";
+};
+
+&main_timer3 {
+	status = "reserved";
+};
+
+&main_timer4 {
+	status = "reserved";
+};
+
+&main_timer5 {
+	status = "reserved";
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&mcu_r5fss0_core1 {
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
+	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
+			<&mcu_r5fss0_core1_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss0 {
+	ti,cluster-mode = <0>;
+	status = "okay";
+};
+
+&main_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
+	memory-region = <&main_r5fss0_core0_dma_memory_region>,
+			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss0_core1 {
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
+	memory-region = <&main_r5fss0_core1_dma_memory_region>,
+			<&main_r5fss0_core1_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss1 {
+	ti,cluster-mode = <0>;
+	status = "okay";
+};
+
+&main_r5fss1_core0 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
+	memory-region = <&main_r5fss1_core0_dma_memory_region>,
+			<&main_r5fss1_core0_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss1_core1 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
+	memory-region = <&main_r5fss1_core1_dma_memory_region>,
+			<&main_r5fss1_core1_memory_region>;
+	status = "okay";
+};
+
+&c71_0 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster4 &mbox_c71_0>;
+	memory-region = <&c71_0_dma_memory_region>,
+			<&c71_0_memory_region>;
+};
+
+&c71_1 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster4 &mbox_c71_1>;
+	memory-region = <&c71_1_dma_memory_region>,
+			<&c71_1_memory_region>;
+};
-- 
2.34.1


