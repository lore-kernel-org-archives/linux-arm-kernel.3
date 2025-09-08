Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA61ECAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIkbVZFTPeC5kpv1AyaE5Px1lXNVpXqYqOXOeKAjHC4=; b=iW2YByyuACkLnH+DwaXnZ2suPF
	KMZoNCBPhecTnvACq93N2c3vduIh3jwCAwlXbvO0CVHucfOYYL4zEi1D5b1lRks4QWrYngQWN/Mgg
	oKm0T+9byQecK2blflYpjYomPjTl2tGih5WkpGy0xN+ngfsyTyJ6phBGWg16daDcFiEgfRykjMAoG
	V2P5p3An/ph2GugmoorfKfVdHQgQHJgAcOJA/Dhr0ugBlc2a+OmsUCKqLrZkevE0jEPn/xDcNRXBn
	iTE7P4gQEtW+qexVYxJlFVB/7ItVj/xvf588DecedM1cpG0FzqnssbLA71SzZidp7SLpuFdIC8zAu
	7B3tiDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvg6t-00000001MDR-1qWZ;
	Mon, 08 Sep 2025 17:56:59 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcuG-000000007ri-2kkr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:31:46 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588EVfpi120869;
	Mon, 8 Sep 2025 09:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341901;
	bh=SIkbVZFTPeC5kpv1AyaE5Px1lXNVpXqYqOXOeKAjHC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gbP3sblD8KLtLzN7LzTmDmVV8ejM4nRyyBJmumlRm7rtOjnPbK1FBHc+HSuQCWmj2
	 ZLsSktCTW3ka0dYdvHMrN588crGqOUkVZYA/0kZgNyI/Nx6rK08k5FPpSofMzxEI43
	 BQPedW7nAnI4uXz9E+ITtvAWHrfJ+ys7XnPijSeo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588EVfWK3065633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:31:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:31:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:31:40 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESedB1037553;
	Mon, 8 Sep 2025 09:31:36 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: [PATCH v4 33/34] arm64: dts: ti: k3-am64-ti-ipc-firmware: Refactor IPC cfg into new dtsi
Date: Mon, 8 Sep 2025 19:58:25 +0530
Message-ID: <20250908142826.1828676-34-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_073144_795260_6B148230 
X-CRM114-Status: GOOD (  16.80  )
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

The TI K3 AM64 SoCs have multiple programmable remote processors like
R5F, M4F etc. The TI SDKs for AM64 SoCs offer sample firmwares which
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
Reviewed-by: Wadim Egorov <w.egorov@phytec.de> # phycore-am64x
Tested-by: Wadim Egorov <w.egorov@phytec.de> # phycore-am64x
Tested-by: Hari Nagalla <hnagalla@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---
v4: Changelog:
1. Updated memory node names to generic 'memory@addr'
2. Carried R/B tag.

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-33-b-padhi@ti.com/

v3: Changelog:
1. Carried R/B, T/B tags.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-33-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 30/33] to [PATCH v2 32/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-31-b-padhi@ti.com/

 .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 160 +----------------
 .../boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi  | 162 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am642-evm.dts       | 156 +----------------
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        | 156 +----------------
 arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi   | 156 +----------------
 .../arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi | 156 +----------------
 6 files changed, 172 insertions(+), 774 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
index 5e0c82960a6c..02ef1dd92eaa 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
@@ -52,60 +52,6 @@ main_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_m4fss_dma_memory_region: memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: memory@a5000000 {
-			reg = <0x00 0xa5000000 0x00 0x00800000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	leds {
@@ -238,67 +184,6 @@ &cpsw_port1 {
 	status = "okay";
 };
 
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster6 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-};
-
-/* main_timer8 is used by r5f0-0 */
-&main_timer8 {
-	status = "reserved";
-};
-
-/* main_timer9 is used by r5f0-1 */
-&main_timer9 {
-	status = "reserved";
-};
-
-/* main_timer10 is used by r5f1-0 */
-&main_timer10 {
-	status = "reserved";
-};
-
-/* main_timer11 is used by r5f1-1 */
-&main_timer11 {
-	status = "reserved";
-};
-
-&main_r5fss0 {
-	status = "okay";
-};
-
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
@@ -373,49 +258,6 @@ &main_pktdma {
 	bootph-all;
 };
 
-&main_r5fss0 {
-	status = "okay";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
 &ospi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ospi0_pins_default>;
@@ -451,3 +293,5 @@ adc {
 		ti,adc-channels = <0 1 2 3 4 5 6 7>;
 	};
 };
+
+#include "k3-am64-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..6b10646ae64a
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on AM64 SoCs
+ *
+ * Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&reserved_memory {
+	main_r5fss0_core1_dma_memory_region: memory@a1000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa1000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss0_core1_memory_region: memory@a1100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa1100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss1_core0_dma_memory_region: memory@a2000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa2000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss1_core0_memory_region: memory@a2100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa2100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss1_core1_dma_memory_region: memory@a3000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa3000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss1_core1_memory_region: memory@a3100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa3100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	mcu_m4fss_dma_memory_region: memory@a4000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa4000000 0x00 0x100000>;
+		no-map;
+	};
+
+	mcu_m4fss_memory_region: memory@a4100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa4100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	rtos_ipc_memory_region: memory@a5000000 {
+		reg = <0x00 0xa5000000 0x00 0x00800000>;
+		alignment = <0x1000>;
+		no-map;
+	};
+};
+
+&mailbox0_cluster2 {
+	status = "okay";
+
+	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
+		ti,mbox-rx = <0 0 2>;
+		ti,mbox-tx = <1 0 2>;
+	};
+
+	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
+		ti,mbox-rx = <2 0 2>;
+		ti,mbox-tx = <3 0 2>;
+	};
+};
+
+&mailbox0_cluster4 {
+	status = "okay";
+
+	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
+		ti,mbox-rx = <0 0 2>;
+		ti,mbox-tx = <1 0 2>;
+	};
+
+	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
+		ti,mbox-rx = <2 0 2>;
+		ti,mbox-tx = <3 0 2>;
+	};
+};
+
+&mailbox0_cluster6 {
+	status = "okay";
+
+	mbox_m4_0: mbox-m4-0 {
+		ti,mbox-rx = <0 0 2>;
+		ti,mbox-tx = <1 0 2>;
+	};
+};
+
+/* main_timer8 is used by r5f0-0 */
+&main_timer8 {
+	status = "reserved";
+};
+
+/* main_timer9 is used by r5f0-1 */
+&main_timer9 {
+	status = "reserved";
+};
+
+/* main_timer10 is used by r5f1-0 */
+&main_timer10 {
+	status = "reserved";
+};
+
+/* main_timer11 is used by r5f1-1 */
+&main_timer11 {
+	status = "reserved";
+};
+
+&main_r5fss0 {
+	status = "okay";
+};
+
+&main_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
+	memory-region = <&main_r5fss0_core0_dma_memory_region>,
+			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss0_core1 {
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
+	memory-region = <&main_r5fss0_core1_dma_memory_region>,
+			<&main_r5fss0_core1_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss1 {
+	status = "okay";
+};
+
+&main_r5fss1_core0 {
+	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
+	memory-region = <&main_r5fss1_core0_dma_memory_region>,
+			<&main_r5fss1_core0_memory_region>;
+	status = "okay";
+};
+
+&main_r5fss1_core1 {
+	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
+	memory-region = <&main_r5fss1_core1_dma_memory_region>,
+			<&main_r5fss1_core1_memory_region>;
+	status = "okay";
+};
+
+&mcu_m4fss {
+	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
+	memory-region = <&mcu_m4fss_dma_memory_region>,
+			<&mcu_m4fss_memory_region>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index ebc9fedc4d72..85dcff104936 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -64,60 +64,6 @@ main_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_m4fss_dma_memory_region: memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: memory@a5000000 {
-			reg = <0x00 0xa5000000 0x00 0x00800000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	evm_12v0: regulator-0 {
@@ -727,106 +673,6 @@ partition@3fc0000 {
 	};
 };
 
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster6 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-};
-
-&main_r5fss0 {
-	status = "okay";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
-/* main_timer8 is used by r5f0-0 */
-&main_timer8 {
-	status = "reserved";
-};
-
-/* main_timer9 is used by r5f0-1 */
-&main_timer9 {
-	status = "reserved";
-};
-
-/* main_timer10 is used by r5f1-0 */
-&main_timer10 {
-	status = "reserved";
-};
-
-/* main_timer11 is used by r5f1-1 */
-&main_timer11 {
-	status = "reserved";
-};
-
 &serdes_ln_ctrl {
 	idle-states = <AM64_SERDES0_LANE0_PCIE0>;
 };
@@ -890,3 +736,5 @@ &icssg1_iep0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&icssg1_iep0_pins_default>;
 };
+
+#include "k3-am64-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d2b06e508c7f..1fb1b91a1bad 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -62,60 +62,6 @@ main_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_m4fss_dma_memory_region: memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: memory@a5000000 {
-			reg = <0x00 0xa5000000 0x00 0x00800000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	vusb_main: regulator-0 {
@@ -642,106 +588,6 @@ partition@3fc0000 {
 	};
 };
 
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster6 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-};
-
-&main_r5fss0 {
-	status = "okay";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
-/* main_timer8 is used by r5f0-0 */
-&main_timer8 {
-	status = "reserved";
-};
-
-/* main_timer9 is used by r5f0-1 */
-&main_timer9 {
-	status = "reserved";
-};
-
-/* main_timer10 is used by r5f1-0 */
-&main_timer10 {
-	status = "reserved";
-};
-
-/* main_timer11 is used by r5f1-1 */
-&main_timer11 {
-	status = "reserved";
-};
-
 &ecap0 {
 	status = "okay";
 	/* PWM is available on Pin 1 of header J3 */
@@ -755,3 +601,5 @@ &eqep0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_eqep0_pins_default>;
 };
+
+#include "k3-am64-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
index 38feda717d7a..fcbcc04521b8 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-sr-som.dtsi
@@ -126,60 +126,6 @@ main_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_m4fss_dma_memory_region: memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: memory@a5000000 {
-			reg = <0x00 0xa5000000 0x00 0x00800000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	vdd_mmc0: regulator-vdd-mmc0 {
@@ -281,63 +227,6 @@ ethernet_phy2: ethernet-phy@f {
 	};
 };
 
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster6 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-};
-
-/* main_timer8 is used by r5f0-0 */
-&main_timer8 {
-	status = "reserved";
-};
-
-/* main_timer9 is used by r5f0-1 */
-&main_timer9 {
-	status = "reserved";
-};
-
-/* main_timer10 is used by r5f1-0 */
-&main_timer10 {
-	status = "reserved";
-};
-
-/* main_timer11 is used by r5f1-1 */
-&main_timer11 {
-	status = "reserved";
-};
-
 &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_default_pins>;
@@ -535,49 +424,6 @@ AM64X_IOPAD(0x02a8, PIN_OUTPUT, 0) /* USB0_DRVVBUS.USB0_DRVVBUS */
 	};
 };
 
-&main_r5fss0 {
-	status = "okay";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
 /* SoC default UART console */
 &main_uart0 {
 	pinctrl-names = "default";
@@ -656,3 +502,5 @@ &usbss0 {
 	ti,vbus-divider;
 	ti,usb2-only;
 };
+
+#include "k3-am64-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
index f6d1e980d32f..ff3b2e0b8dd4 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl.dtsi
@@ -42,60 +42,6 @@ main_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
-
-		main_r5fss0_core1_dma_memory_region: memory@a1000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss0_core1_memory_region: memory@a1100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa1100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_dma_memory_region: memory@a2000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core0_memory_region: memory@a2100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa2100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_dma_memory_region: memory@a3000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss1_core1_memory_region: memory@a3100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa3100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		mcu_m4fss_dma_memory_region: memory@a4000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4000000 0x00 0x100000>;
-			no-map;
-		};
-
-		mcu_m4fss_memory_region: memory@a4100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa4100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		rtos_ipc_memory_region: memory@a5000000 {
-			reg = <0x00 0xa5000000 0x00 0x00800000>;
-			alignment = <0x1000>;
-			no-map;
-		};
 	};
 
 	reg_1v8: regulator-1v8 {
@@ -142,106 +88,6 @@ eeprom1: eeprom@54 {
 	};
 };
 
-&mailbox0_cluster2 {
-	status = "okay";
-
-	mbox_main_r5fss0_core0: mbox-main-r5fss0-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss0_core1: mbox-main-r5fss0-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-
-	mbox_main_r5fss1_core0: mbox-main-r5fss1-core0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-
-	mbox_main_r5fss1_core1: mbox-main-r5fss1-core1 {
-		ti,mbox-rx = <2 0 2>;
-		ti,mbox-tx = <3 0 2>;
-	};
-};
-
-&mailbox0_cluster6 {
-	status = "okay";
-
-	mbox_m4_0: mbox-m4-0 {
-		ti,mbox-rx = <0 0 2>;
-		ti,mbox-tx = <1 0 2>;
-	};
-};
-
-/* main_timer8 is used by r5f0-0 */
-&main_timer8 {
-	status = "reserved";
-};
-
-/* main_timer9 is used by r5f0-1 */
-&main_timer9 {
-	status = "reserved";
-};
-
-/* main_timer10 is used by r5f1-0 */
-&main_timer10 {
-	status = "reserved";
-};
-
-/* main_timer11 is used by r5f1-1 */
-&main_timer11 {
-	status = "reserved";
-};
-
-&main_r5fss0 {
-	status = "okay";
-};
-
-&main_r5fss0_core0 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss0_core1 {
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1 {
-	status = "okay";
-};
-
-&main_r5fss1_core0 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss1_core1 {
-	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-	status = "okay";
-};
-
-&mcu_m4fss {
-	mboxes = <&mailbox0_cluster6 &mbox_m4_0>;
-	memory-region = <&mcu_m4fss_dma_memory_region>,
-			<&mcu_m4fss_memory_region>;
-	status = "okay";
-};
-
 &ospi0 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -315,3 +161,5 @@ AM64X_IOPAD(0x0008, PIN_INPUT, 0)
 		>;
 	};
 };
+
+#include "k3-am64-ti-ipc-firmware.dtsi"
-- 
2.34.1


