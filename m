Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33202E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkpVXwWuotXxa9vkpl5KFFoSmocApd4ODUbu3hO56t8=; b=grGE7ceRODxKkifQ9E9G5hDqTR
	4vHbXpWy0+zleTVajeyJv893cVBECBykZ1D9uI3n09bjHbL8i7eakLP2SRQ+7L3E2GTtEGO4QgMxo
	rSPXmSQ9C0O7i7UpccGMHD5cqvq2LYy4LOiui6LYm7flXXj5Cb8kCEm5VqIBbm3NgrNZoBL4SF4Pc
	jAsHEuoW+tjNpO/7wdblHgC3jtg+LJYFw5lGK4Dv7ae9sXbJBA+Mjff9ocIKJv9kDbhud8P+eWlO5
	ATxLSm/mCs3KnUVxr+Q5I2fuhRtW5otet2BkeBRPk1kp7g6pKVmbjbflIvqHAhSX++o5uT5pHZQgW
	ZEAUxdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVt-0000000Fpsb-2o98;
	Thu, 05 Dec 2024 11:59:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rl-0000000Fcw6-3YUQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BkpVXwWuotXxa9vkpl5KFFoSmocApd4ODUbu3hO56t8=; b=o0FX4JNpEMJDMCPDo5ZWLMHqLW
	nKlHZAXzwnxYj5mbmBGXYSl1bP9AL29Ma1lMKa3bxcMbZlZ/XC2wCLlDtCOuJYNBPN2B0c+FES1xf
	d3Uo6VneukRV2MWfynQelySiwW0EzGN82qscKF1bxNSCb2EuZ/0u7hPkQP/q+TfqIUzSXIaKm/jOs
	Mg6SfzhDz82jMRX8wnk6LGtVva4sFGFxT5gJnJoqWUIdAPSho851mfG++8uZ5NwEpMCwe+FIADb2W
	g+RJz7lG0zfKPtQPTpmhdMIOCgiSJjzr9DJpSZPAMD8RoySqH3zJWqdQE4gxMKlaM/LbnlMXrCusX
	/YvE0jOQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ri-00000002poM-2jxI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:51:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5Aor6C1935941
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 04:50:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733395853;
	bh=BkpVXwWuotXxa9vkpl5KFFoSmocApd4ODUbu3hO56t8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WuQwMi9G2tn9bHE8rmNKRlohI35zYJBdgnuxWADNJyMYAqGCwgvFm1pTOF4wna6J+
	 Hy9gEf8VVKfZa8QAqh6G/JiUr5Y/qSEdtyLwTGvLTRdyHtlktMobxc1FyBYwcSNPxK
	 xlgxTKFDniWW2vueirR2l7BBLWs63gZS3o50xE5M=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5AorlF093394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 04:50:53 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 04:50:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 04:50:52 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AofJs110686;
	Thu, 5 Dec 2024 04:50:49 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 2/4] arm64: dts: ti: k3-j721e-evm: Add overlay for PCIE1 Endpoint Mode
Date: Thu, 5 Dec 2024 16:20:34 +0530
Message-ID: <20241205105041.749576-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205105041.749576-1-s-vadapalli@ti.com>
References: <20241205105041.749576-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105059_058831_C895E649 
X-CRM114-Status: GOOD (  14.87  )
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

Add overlay to enable the PCIE1 instance of PCIe on J721E-EVM in Endpoint
mode of operation. Additionally, in order to support both PCIE0 and PCIE1
in Endpoint Mode of operation, enable applying device-tree overlays on
"k3-j721e-evm-pcie0-ep.dtb", thereby allowing the overlay for PCIE1 in
Endpoint mode to be applied on the aforementioned DTB.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
v3:
https://lore.kernel.org/r/20241010100933.2492806-1-s-vadapalli@ti.com/
Changes since v3:
- Rebased on next-20241204.

v2:
https://lore.kernel.org/r/20240222065733.1213434-1-s-vadapalli@ti.com/
Changes since v2:
- Rebased patch on next-20241010.
- Moved vendor specific property "ti,syscon-pcie-ctrl" to the end of the
  node.

v1:
https://lore.kernel.org/r/20240220105006.1056824-1-s-vadapalli@ti.com/
Changes since v1:
- Created a new overlay for PCIE1 based on Andrew's suggestion at:
  https://lore.kernel.org/r/415ee6d4-fe26-4582-80f3-9b503d308fdf@ti.com/
- Updated Makefile to allow applying overlay on
  "k3-j721e-evm-pcie0-ep.dtb"

 arch/arm64/boot/dts/ti/Makefile               |  5 ++
 .../boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso    | 53 +++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 379bfa4425d4..03bacbc589ee 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -107,6 +107,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-common-proc-board-infotainment.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721e-evm-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
 
@@ -200,6 +201,8 @@ k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-common-proc-board-infotainment.dtbo
 k3-j721e-evm-pcie0-ep-dtbs := k3-j721e-common-proc-board.dtb \
 	k3-j721e-evm-pcie0-ep.dtbo
+k3-j721e-evm-pcie1-ep-dtbs := k3-j721e-common-proc-board.dtb \
+	k3-j721e-evm-pcie1-ep.dtbo
 k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
@@ -233,6 +236,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
+	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
@@ -255,6 +259,7 @@ DTC_FLAGS_k3-am68-sk-base-board += -@
 DTC_FLAGS_k3-am69-sk += -@
 DTC_FLAGS_k3-j7200-common-proc-board += -@
 DTC_FLAGS_k3-j721e-common-proc-board += -@
+DTC_FLAGS_k3-j721e-evm-pcie0-ep += -@
 DTC_FLAGS_k3-j721e-sk += -@
 DTC_FLAGS_k3-j721s2-common-proc-board += -@
 DTC_FLAGS_k3-j784s4-evm += -@
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
new file mode 100644
index 000000000000..a8cccdcf3e3b
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721e-evm-pcie1-ep.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling PCIE1 instance in Endpoint Configuration with the
+ * J7 common processor board.
+ *
+ * J7 Common Processor Board Product Link: https://www.ti.com/tool/J721EXCPXEVM
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
+		compatible = "ti,j721e-pcie-ep";
+		reg = <0x00 0x02910000 0x00 0x1000>,
+		      <0x00 0x02917000 0x00 0x400>,
+		      <0x00 0x0d800000 0x00 0x00800000>,
+		      <0x00 0x18000000 0x00 0x08000000>;
+		reg-names = "intd_cfg", "user_cfg", "reg", "mem";
+		interrupt-names = "link_state";
+		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
+		max-link-speed = <3>;
+		num-lanes = <2>;
+		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 240 1>;
+		clock-names = "fck";
+		max-functions = /bits/ 8 <6>;
+		max-virtual-functions = /bits/ 8 <4 4 4 4 0 0>;
+		dma-coherent;
+		phys = <&serdes1_pcie_link>;
+		phy-names = "pcie-phy";
+		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
+	};
+};
-- 
2.43.0


