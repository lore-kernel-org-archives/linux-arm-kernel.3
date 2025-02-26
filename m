Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC12C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZp9dPc1jeykb22QbqsQXbIMwc7uQL0Ohu9JSDscCI4=; b=Njq3Rx9UFdd+yKF066xIa3g+4P
	gcd/fdb7TCgGTOdFNXUEEYXfUtsolGHyz4xek4IW5RVrAlMzkQ174ucjkXkMFcmMUiWjf0G5zwToZ
	xwQdOXyoCsoMemqqEngkf6wDcDfSHXWi/zx8eD13QIr9eBp1GFXdVouBGUFEdICYbt4N3i6A+11w1
	tE68CYsVvgh4DgZKzgXfeML8KRNqi8PNP4PrSgK7qxX/enRl/vKUvlcCbZIlYNYieDEBgoa9K5ALs
	klIW+HOZQ/8eDuvS1driXeWh95u1xRkmRd5bMoSowKi/la76Av0iUA2ZdwidJLXTPSFTRtnPmrMKO
	vces3x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY8-000000047pQ-2wmd;
	Wed, 26 Feb 2025 14:38:12 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGke-00000003jQ9-3ggI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:43:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51QCgvsT2078702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 06:42:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740573777;
	bh=SZp9dPc1jeykb22QbqsQXbIMwc7uQL0Ohu9JSDscCI4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XEVSi1R5I0ijZQM4JfykonOmJsgLU/aUCJUq5RPAqTnSa9Yl6UbVCJ+RDvEC1jInW
	 of9koGOLt0UKAas9DPT1HwPN+lMx6wkwSZvZe6lQrrwxRp/n/b5dQZsjDHK/6IVc+0
	 GDL1Tjzqh5rJ3p1ch5zrSkj+r2oyVnGvaiBC+Ovc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51QCgvH8090082
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Feb 2025 06:42:57 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Feb 2025 06:42:56 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Feb 2025 06:42:56 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51QCgkI2094589;
	Wed, 26 Feb 2025 06:42:53 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay for PCIe NTB
Date: Wed, 26 Feb 2025 18:12:44 +0530
Message-ID: <20250226124245.9856-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226124245.9856-1-s-vadapalli@ti.com>
References: <20250226124245.9856-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_044301_008525_C66E8978 
X-CRM114-Status: GOOD (  15.79  )
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

PCIe NTB (Non-Transparent-Bridge) allows connecting the memory of
multiple PCIe Hosts (Root-Complex). The number of such hosts is
determined by the number of PCIe instances configured for NTB operation
on the device which intends to enable NTB functionality. Add a device-tree
overlay to configure PCIE0 and PCIE1 instances of PCIe on either J784S4 EVM
or J742S2 EVM for NTB operation. This shall allow connecting the memory of
two PCIe Hosts via PCIE0 and PCIE1 on J784S4 EVM or J742S2 EVM
respectively.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

v1:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250202093636.2699064-3-s-vadapalli@ti.com/
Changes since v1:
- s/epf_bus/epf-bus since node names shouldn't contain underscores.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/Makefile               |  7 ++
 .../dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso | 92 +++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 1097ab30f5a9..dbeb5d7401f7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -128,6 +128,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -212,6 +213,10 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j742s2-evm-pcie-ntb-dtbs := k3-j742s2-evm.dtb \
+	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+k3-j784s4-evm-pcie-ntb-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
@@ -247,6 +252,8 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j742s2-evm-pcie-ntb.dtb \
+	k3-j784s4-evm-pcie-ntb.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
new file mode 100644
index 000000000000..46cbddcf612e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-pcie-ntb.dtso
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling NTB functionality using PCIE0 and PCIE1 instances of
+ * PCIe on the J784S4 EVM and the J742S2 EVM.
+ *
+ * J784S4 EVM Product Link: https://www.ti.com/tool/J784S4XEVM
+ * J742S2 EVM Product Link: https://www.ti.com/tool/J742S2XH01EVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/soc/ti,sci_pm_domain.h>
+
+#include "k3-pinctrl.h"
+
+&{/} {
+	epf-bus {
+		compatible = "pci-epf-bus";
+
+		ntb {
+			compatible = "pci-epf-ntb";
+			epcs = <&pcie0_ep>, <&pcie1_ep>;
+			epc-names = "primary", "secondary";
+			vendor-id = /bits/ 16 <0x104c>;
+			device-id = /bits/ 16 <0xb012>;
+			num-mws = <4>;
+			mws-size = <0x100000>, <0x100000>, <0x100000>, <0x100000>;
+		};
+	};
+};
+
+&pcie0_rc {
+	status = "disabled";
+};
+
+&pcie1_rc {
+	status = "disabled";
+};
+
+&cbass_main {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic500>;
+
+	pcie0_ep: pcie-ep@2900000 {
+		compatible = "ti,j784s4-pcie-ep";
+		reg = <0x00 0x02900000 0x00 0x1000>,
+		      <0x00 0x02907000 0x00 0x400>,
+		      <0x00 0x0d000000 0x00 0x00800000>,
+		      <0x00 0x10000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
+		max-link-speed = <3>;
+		num-lanes = <4>;
+		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 332 0>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes1_pcie0_link>;
+		phy-names = "pcie-phy";
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
+	};
+
+	pcie1_ep: pcie-ep@2910000 {
+		compatible = "ti,j784s4-pcie-ep";
+		reg = <0x00 0x02910000 0x00 0x1000>,
+		      <0x00 0x02917000 0x00 0x400>,
+		      <0x00 0x0d800000 0x00 0x00800000>,
+		      <0x00 0x18000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
+		max-link-speed = <3>;
+		num-lanes = <2>;
+		power-domains = <&k3_pds 333 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 333 0>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes0_pcie1_link>;
+		phy-names = "pcie-phy";
+		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
+	};
+};
-- 
2.34.1


