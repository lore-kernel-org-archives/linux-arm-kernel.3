Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5juV90kzWQIJHm9V0tj8t1x+iEGgdNXNYPzXu2InEo4=; b=jZBrda6zXMx6zyG0YqAxcSEaJ4
	og4d5HHoDXPyUb4TciE6JXsuMvl8nRm2MxpRW2SVOazIK7fbO2dWjaHKY2wnHEgIBUg4TmUiP0igT
	6J5piYcnXW0d9knRJHvZAgrlXfIrSQUkG7jidRYpKulm95B0lf4L0bjlDvz6BoPGCvMUCLdVdunLk
	RHqXhQnLrcJDCdwXDRPwOb+svfEBKWwgB09uAcSAZKtec4mn12uaZqVsQ/sVIsvLBq5wLK7xePBVB
	J2BGMFsriQGPtd92wD38s7rNM2w8YJsErBC1YQxmn1mE86OI+76IWOs42Z6ULmK67O1VvV5bVpv87
	xRauUrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umi7c-00000000riy-3qK1;
	Fri, 15 Aug 2025 00:16:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgc1-00000000gwB-1r2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:39:58 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57EMdsLT2027456;
	Thu, 14 Aug 2025 17:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755211194;
	bh=5juV90kzWQIJHm9V0tj8t1x+iEGgdNXNYPzXu2InEo4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EJlgwww9C16HetxKy0SVyU8C/iYfXoge/lUyNDmjw5sypvun3pUleZrncBBI8d5Rc
	 ZgERHZXiAU6OBTMC8oZZHd/mz8tJXrX+bjPEbFwCuzUTarHbzLUNJPECf7WR+bWJUZ
	 CDa6sTVK0FAGLqNPBkTs0w+QvcTx/uEacGGFMdZA=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57EMdslI1461706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 17:39:54 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 17:39:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 17:39:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57EMcw4k096792;
	Thu, 14 Aug 2025 17:39:49 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 11/33] arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Refactor IPC cfg into new dtsi
Date: Fri, 15 Aug 2025 04:08:17 +0530
Message-ID: <20250814223839.3256046-12-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814223839.3256046-1-b-padhi@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_153957_584983_B859CE3B 
X-CRM114-Status: GOOD (  13.38  )
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

The TI K3 J784S4/J742S2 SoCs have multiple programmable remote
processors like R5F, C7x etc. The TI SDKs for J784S4/J742S2 SoCs offer
sample firmwares which could be run on these cores to demonstrate an
"echo" IPC test. Those firmware require certain memory carveouts to be
reserved from system memory, timers to be reserved, and certain mailbox
configurations for interrupt based messaging. These configurations could
be different for a different firmware.

While DT is not meant for system configurations, at least refactor these
configurations from board level DTS into a dtsi for now. This dtsi for
TI IPC firmware is board-independent and can be applied to all boards
from the same SoC Family. This gets rid of code duplication and allows
more freedom for users developing custom firmware (or no firmware) to
utilize system resources better; easily by swapping out this dtsi. To
maintain backward compatibility, the dtsi is included in all boards.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am69-sk.dts         | 336 +----------------
 .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 344 +----------------
 ...-j784s4-j742s2-ti-ipc-firmware-common.dtsi | 350 ++++++++++++++++++
 3 files changed, 354 insertions(+), 676 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index cea096733ba2..5e187e86a5d9 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -61,126 +61,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			no-map;
 		};
 
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
-		main_r5fss2_core0_dma_memory_region: r5f-dma-memory@a6000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss2_core0_memory_region: r5f-memory@a6100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss2_core1_dma_memory_region: r5f-dma-memory@a7000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss2_core1_memory_region: r5f-memory@a7100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa8000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_0_memory_region: c71-memory@a8100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa8100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_1_dma_memory_region: c71-dma-memory@a9000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa9000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_1_memory_region: c71-memory@a9100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa9100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_2_dma_memory_region: c71-dma-memory@aa000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xaa000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_2_memory_region: c71-memory@aa100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xaa100000 0x00 0xf00000>;
-			no-map;
-		};
-
 		c71_3_dma_memory_region: c71-dma-memory@ab000000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0xab000000 0x00 0x100000>;
@@ -640,84 +520,7 @@ &phy_gmii_sel {
 	bootph-all;
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
-&mailbox0_cluster3 {
-	status = "okay";
-	interrupts = <424>;
-	mbox_main_r5fss2_core0: mbox-main-r5fss2-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss2_core1: mbox-main-r5fss2-core1 {
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
 &mailbox0_cluster5 {
-	status = "okay";
-	interrupts = <416>;
-	mbox_c71_2: mbox-c71-2 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
 	mbox_c71_3: mbox-c71-3 {
 		ti,mbox-rx = <2 0 0>;
 		ti,mbox-tx = <3 0 0>;
@@ -992,143 +795,6 @@ &mcu_cpsw_port1 {
 	bootph-all;
 };
 
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
-&main_timer6 {
-	status = "reserved";
-};
-
-&main_timer7 {
-	status = "reserved";
-};
-
-&main_timer8 {
-	status = "reserved";
-};
-
-&main_timer9 {
-	status = "reserved";
-};
-
-&main_r5fss2 {
-	ti,cluster-mode = <0>;
-	status = "okay";
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
-&main_r5fss2_core0 {
-	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
-	memory-region = <&main_r5fss2_core0_dma_memory_region>,
-			<&main_r5fss2_core0_memory_region>;
-	status = "okay";
-};
-
-&main_r5fss2_core1 {
-	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
-	memory-region = <&main_r5fss2_core1_dma_memory_region>,
-			<&main_r5fss2_core1_memory_region>;
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
-&c71_2 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster5 &mbox_c71_2>;
-	memory-region = <&c71_2_dma_memory_region>,
-			<&c71_2_memory_region>;
-};
-
 &c71_3 {
 	status = "okay";
 	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
@@ -1410,3 +1076,5 @@ &usb0 {
 	phys = <&serdes0_usb_link>;
 	phy-names = "cdns3,usb3-phy";
 };
+
+#include "k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index c269e5b29b96..9e233400a648 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -46,126 +46,6 @@ mcu_r5fss0_core0_memory_region: r5f-memory@a0100000 {
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
-		main_r5fss2_core0_dma_memory_region: r5f-dma-memory@a6000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss2_core0_memory_region: r5f-memory@a6100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa6100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		main_r5fss2_core1_dma_memory_region: r5f-dma-memory@a7000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7000000 0x00 0x100000>;
-			no-map;
-		};
-
-		main_r5fss2_core1_memory_region: r5f-memory@a7100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa7100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_0_dma_memory_region: c71-dma-memory@a8000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa8000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_0_memory_region: c71-memory@a8100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa8100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_1_dma_memory_region: c71-dma-memory@a9000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa9000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_1_memory_region: c71-memory@a9100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xa9100000 0x00 0xf00000>;
-			no-map;
-		};
-
-		c71_2_dma_memory_region: c71-dma-memory@aa000000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xaa000000 0x00 0x100000>;
-			no-map;
-		};
-
-		c71_2_memory_region: c71-memory@aa100000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0xaa100000 0x00 0xf00000>;
-			no-map;
-		};
 	};
 
 	evm_12v0: regulator-evm12v0 {
@@ -1069,228 +949,6 @@ &main_cpsw1_port1 {
 	status = "okay";
 };
 
-&mailbox0_cluster0 {
-	status = "okay";
-	interrupts = <436>;
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
-	status = "okay";
-	interrupts = <432>;
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
-	status = "okay";
-	interrupts = <428>;
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
-&mailbox0_cluster3 {
-	status = "okay";
-	interrupts = <424>;
-
-	mbox_main_r5fss2_core0: mbox-main-r5fss2-core0 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-
-	mbox_main_r5fss2_core1: mbox-main-r5fss2-core1 {
-		ti,mbox-rx = <2 0 0>;
-		ti,mbox-tx = <3 0 0>;
-	};
-};
-
-&mailbox0_cluster4 {
-	status = "okay";
-	interrupts = <420>;
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
-&mailbox0_cluster5 {
-	status = "okay";
-	interrupts = <416>;
-
-	mbox_c71_2: mbox-c71-2 {
-		ti,mbox-rx = <0 0 0>;
-		ti,mbox-tx = <1 0 0>;
-	};
-};
-
-&mcu_r5fss0 {
-	status = "okay";
-};
-
-&mcu_r5fss0_core0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
-	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-};
-
-&mcu_r5fss0_core1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
-	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
-			<&mcu_r5fss0_core1_memory_region>;
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
-&main_r5fss2 {
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
-&main_timer6 {
-	status = "reserved";
-};
-
-&main_timer7 {
-	status = "reserved";
-};
-
-&main_timer8 {
-	status = "reserved";
-};
-
-&main_timer9 {
-	status = "reserved";
-};
-
-&main_r5fss0_core0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
-	memory-region = <&main_r5fss0_core0_dma_memory_region>,
-			<&main_r5fss0_core0_memory_region>;
-};
-
-&main_r5fss0_core1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
-	memory-region = <&main_r5fss0_core1_dma_memory_region>,
-			<&main_r5fss0_core1_memory_region>;
-};
-
-&main_r5fss1_core0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
-	memory-region = <&main_r5fss1_core0_dma_memory_region>,
-			<&main_r5fss1_core0_memory_region>;
-};
-
-&main_r5fss1_core1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
-	memory-region = <&main_r5fss1_core1_dma_memory_region>,
-			<&main_r5fss1_core1_memory_region>;
-};
-
-&main_r5fss2_core0 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
-	memory-region = <&main_r5fss2_core0_dma_memory_region>,
-			<&main_r5fss2_core0_memory_region>;
-};
-
-&main_r5fss2_core1 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
-	memory-region = <&main_r5fss2_core1_dma_memory_region>,
-			<&main_r5fss2_core1_memory_region>;
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
-&c71_2 {
-	status = "okay";
-	mboxes = <&mailbox0_cluster5 &mbox_c71_2>;
-	memory-region = <&c71_2_dma_memory_region>,
-			<&c71_2_memory_region>;
-};
-
 &tscadc0 {
 	pinctrl-0 = <&mcu_adc0_pins_default>;
 	pinctrl-names = "default";
@@ -1619,3 +1277,5 @@ &mcasp0 {
 		0 0 0 0
 	>;
 };
+
+#include "k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
new file mode 100644
index 000000000000..b5a4496a05bf
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -0,0 +1,350 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on J784S4/J742S2 SoCs
+ *
+ * Copyright (C) 2022-2025 Texas Instruments Incorporated - https://www.ti.com/
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
+	main_r5fss2_core0_dma_memory_region: r5f-dma-memory@a6000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa6000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss2_core0_memory_region: r5f-memory@a6100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa6100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	main_r5fss2_core1_dma_memory_region: r5f-dma-memory@a7000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa7000000 0x00 0x100000>;
+		no-map;
+	};
+
+	main_r5fss2_core1_memory_region: r5f-memory@a7100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa7100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	c71_0_dma_memory_region: c71-dma-memory@a8000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa8000000 0x00 0x100000>;
+		no-map;
+	};
+
+	c71_0_memory_region: c71-memory@a8100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa8100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	c71_1_dma_memory_region: c71-dma-memory@a9000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa9000000 0x00 0x100000>;
+		no-map;
+	};
+
+	c71_1_memory_region: c71-memory@a9100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xa9100000 0x00 0xf00000>;
+		no-map;
+	};
+
+	c71_2_dma_memory_region: c71-dma-memory@aa000000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xaa000000 0x00 0x100000>;
+		no-map;
+	};
+
+	c71_2_memory_region: c71-memory@aa100000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0xaa100000 0x00 0xf00000>;
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
+&mailbox0_cluster3 {
+	status = "okay";
+	interrupts = <424>;
+
+	mbox_main_r5fss2_core0: mbox-main-r5fss2-core0 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
+	};
+
+	mbox_main_r5fss2_core1: mbox-main-r5fss2-core1 {
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
+&mailbox0_cluster5 {
+	status = "okay";
+	interrupts = <416>;
+
+	mbox_c71_2: mbox-c71-2 {
+		ti,mbox-rx = <0 0 0>;
+		ti,mbox-tx = <1 0 0>;
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
+&main_timer6 {
+	status = "reserved";
+};
+
+&main_timer7 {
+	status = "reserved";
+};
+
+&main_timer8 {
+	status = "reserved";
+};
+
+&main_timer9 {
+	status = "reserved";
+};
+
+&mcu_r5fss0 {
+	status = "okay";
+};
+
+&mcu_r5fss0_core0 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>;
+};
+
+&mcu_r5fss0_core1 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
+	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
+			<&mcu_r5fss0_core1_memory_region>;
+};
+
+&main_r5fss0 {
+	ti,cluster-mode = <0>;
+	status = "okay";
+};
+
+&main_r5fss0_core0 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
+	memory-region = <&main_r5fss0_core0_dma_memory_region>,
+			<&main_r5fss0_core0_memory_region>;
+};
+
+&main_r5fss0_core1 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
+	memory-region = <&main_r5fss0_core1_dma_memory_region>,
+			<&main_r5fss0_core1_memory_region>;
+};
+
+&main_r5fss1 {
+	ti,cluster-mode = <0>;
+	status = "okay";
+};
+
+&main_r5fss1_core0 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
+	memory-region = <&main_r5fss1_core0_dma_memory_region>,
+			<&main_r5fss1_core0_memory_region>;
+};
+
+&main_r5fss1_core1 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
+	memory-region = <&main_r5fss1_core1_dma_memory_region>,
+			<&main_r5fss1_core1_memory_region>;
+};
+
+&main_r5fss2 {
+	ti,cluster-mode = <0>;
+	status = "okay";
+};
+
+&main_r5fss2_core0 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
+	memory-region = <&main_r5fss2_core0_dma_memory_region>,
+			<&main_r5fss2_core0_memory_region>;
+};
+
+&main_r5fss2_core1 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
+	memory-region = <&main_r5fss2_core1_dma_memory_region>,
+			<&main_r5fss2_core1_memory_region>;
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
+
+&c71_2 {
+	status = "okay";
+	mboxes = <&mailbox0_cluster5 &mbox_c71_2>;
+	memory-region = <&c71_2_dma_memory_region>,
+			<&c71_2_memory_region>;
+};
-- 
2.34.1


