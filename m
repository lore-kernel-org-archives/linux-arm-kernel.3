Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB04E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJh7mGflOyZtSXF8dli4DDtwZI6kgrjEhoAo/ThCcW0=; b=BlDdqclaIhOmDD4wsqcJu+E0N8
	EJ4hmLH4TvVj8B/wK0s4lVRXstjXzsS2JrUYTeIJZIv7glOCU3tHyImvp8lVMSZI/mXoK04gHPK3S
	8OdND5peXAUUr79HRt5tR768smaThM2Ymq+oy7KbH4jWBN1NVhdiHg7gIt7Zdsi5+vm5C6dhe6zHF
	rMvJyRQ8pPyQTI4RL+19HpA5vh4BwDvQPtLMZavfldewkBG5SOh94nyBcHHBaU0XiH/tbdNJBBg8P
	U4bcbEeqrmJBs1I6AAYU5niwFQa0XW2Zryrtk+KLaWqccnom8aI8sGeNuz7aJE5CTebEMBi2m1QwP
	wLo0w3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVv-0000000Fpv1-11eG;
	Thu, 05 Dec 2024 11:59:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rn-0000000FcwV-40c2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kJh7mGflOyZtSXF8dli4DDtwZI6kgrjEhoAo/ThCcW0=; b=J0COUIMBHZQ9AbgvfyvkeT2DHe
	an7IQufUAprK1zHss4yvaAXj8Z15IVZzOVfYtft1m72j47u6aMAxQrgnJEo/fDfeooht2nvERC9v9
	EOCkhb2rf2Q9ZSpOvLCdmHqtzlsJ/aC+0QuzWA7NjWKlUlEAvj2DP/w2Zax2URNH+exagr4CQtPh/
	5BlGAEgcIyV748IsKey96EbZtxejcxyhuiyw9jmKXCbQRgdETyQTnE0PzS/TfQnn2a4MAKdGdnX1d
	MaIdkkoW2R1d3AX4YSIPMFZt1/vpmCIWk54q9r4Frco+jwdxEvv5EMDy1LVTOx73l+FGCFAn6dWyZ
	CJ+gjZJg==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rj-00000002ppc-3MOx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:51:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B5Aousl109477;
	Thu, 5 Dec 2024 04:50:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733395856;
	bh=kJh7mGflOyZtSXF8dli4DDtwZI6kgrjEhoAo/ThCcW0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=s3MhXlHKnw5MJbAJCC+A6AIL6ougHA2SvcNtxVXe1hBlYqrPeB246YiqqqAmpPBj9
	 Eh7J5Q5L+gZHdVRZMU8fQ1Akc5pQlXfGMTXvq47GIq0lYZbObECEQgcm+0OC7maJxB
	 X5j7PitQvj/0/VNgmNdp4XB039gzxyZahnnv0Xnw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5Aouo1022898;
	Thu, 5 Dec 2024 04:50:56 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 04:50:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 04:50:55 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AofJt110686;
	Thu, 5 Dec 2024 04:50:52 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am68-sk-base-board: Add overlay for PCIE1 Endpoint Mode
Date: Thu, 5 Dec 2024 16:20:35 +0530
Message-ID: <20241205105041.749576-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205105041.749576-1-s-vadapalli@ti.com>
References: <20241205105041.749576-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105100_145097_B7C71857 
X-CRM114-Status: GOOD (  12.79  )
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

Add overlay to enable the PCIE1 instance of PCIe on AM68-SK-Base-Board in
Endpoint mode of operation. PCIE1 on AM68-SK-Base-Board supports x2 Lane
operation unlike its counterpart on J721S2-EVM which supports x1 Lane.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

This patch has been newly introduced in this series.

 arch/arm64/boot/dts/ti/Makefile               |  4 ++
 .../ti/k3-am68-sk-base-board-pcie1-ep.dtso    | 53 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 03bacbc589ee..04438f7136b8 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -113,6 +113,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
 # Boards with J721s2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am68-sk-base-board-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-common-proc-board.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
@@ -193,6 +194,8 @@ k3-am642-tqma64xxl-mbax4xxl-wlan-dtbs := \
 	k3-am642-tqma64xxl-mbax4xxl.dtb k3-am64-tqma64xxl-mbax4xxl-wlan.dtbo
 k3-am68-sk-base-board-csi2-dual-imx219-dtbs := k3-am68-sk-base-board.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
+	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
@@ -232,6 +235,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
+	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
new file mode 100644
index 000000000000..455736e378cc
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board-pcie1-ep.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling PCIE1 instance in Endpoint Configuration with the
+ * AM68-SK board.
+ *
+ * AM68-SK Board Product Link: https://www.ti.com/tool/SK-AM68
+ *
+ * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
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
+/*
+ * Since Root Complex and Endpoint modes are mutually exclusive
+ * disable Root Complex mode.
+ */
+&pcie1_rc {
+	status = "disabled";
+};
+
+&cbass_main {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic500>;
+
+	pcie1_ep: pcie-ep@2910000 {
+		compatible = "ti,j7200-pcie-ep", "ti,j721e-pcie-ep";
+		reg = <0x00 0x02910000 0x00 0x1000>,
+		      <0x00 0x02917000 0x00 0x400>,
+		      <0x00 0x0d800000 0x00 0x00800000>,
+		      <0x00 0x18000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
+		max-link-speed = <3>;
+		num-lanes = <2>;
+		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 276 41>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes0_pcie_link>;
+		phy-names = "pcie-phy";
+		ti,syscon-pcie-ctrl = <&scm_conf 0x074>;
+	};
+};
-- 
2.43.0


