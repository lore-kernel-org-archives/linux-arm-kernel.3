Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3FFE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pjo2xI2NoMV+ws/SdQvbE1uUrLIcffRmbIgnflplOI=; b=kpEuH7xqS9UrQGCoJ+/buts07G
	L3xv4zbYSxNzdYRgpoDVqUTHBz92tEgL+kAW3cNohteZfYu/q7vb7jGhKKaE+DBkyHhBBj5aTGGp2
	5OqzCm/DaLLHEKfVMmwQuh5jNu8+aTxRnllLLLywrJiMY7JRtW7uDHtsTY2qCDA4kWoI0icsB8daa
	G+7P7WPnYWSTP9G6+cqhMufS8OAZ5mVQuHwD60SqZBOpqqdDVQIYi07Tuwkd7DowmbY6Zi3QTqhyp
	0kUzUERGQeCC9Lz+xAjWF/EJcP4iTfhWHbcoMMoiRVvFkOYaeYaKjtL5m97XCT/fgm7tbHuxOzwfD
	T5CGpFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVw-0000000Fpxb-1DGm;
	Thu, 05 Dec 2024 11:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rq-0000000Fcwt-2zB4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9pjo2xI2NoMV+ws/SdQvbE1uUrLIcffRmbIgnflplOI=; b=GD5ORHNGSOGUwfsx+qdSvXNLyU
	qScY6a3xiEewksfYFY/6ZNXGd0wz+c7VtzsE34y37vPDSQW6xNFKl0h2NYQiVyyTCpKCOc2+koiEo
	jvXVD9NrzEf/717sTYNcq2oQgDzx3KkUac5t89rYgW4sIOA5hkhFqWkgAmXvyyqZqngryqfWKxmK5
	UkzaH4rtPk20NFWmumif+yyK3aAY/qYiELvSbGbt+cIWDLeo7BC8RsyczAV7A+oIvE0/t+eOJxB3T
	TykRJof8pUa40BO7DlrqzcdcBL3TMeUVCkaO7Eq6EjtE2w5s03UTH2yHAk5E1qfElv9r047PwizWR
	G4dFvDBQ==;
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rn-00000002pq8-1uvJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:51:05 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AoxYW109484;
	Thu, 5 Dec 2024 04:50:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733395859;
	bh=9pjo2xI2NoMV+ws/SdQvbE1uUrLIcffRmbIgnflplOI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c+C1wYAqvEmWXBmLgMQjzUYK7TGxlL2zeMdtfnI6edTrfhKJOvs4H+HrYdPA1ILEF
	 EtQmIsX7ut+ezOZ++JcWp7xBI4RPOJxnZacqd/LGWYjSlamnihByYQ1pEugFuNUHFd
	 iI5uVINjdv3f8zmrt2ZohuuuLVCfhF6gWfobGQrI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5AoxW5021313
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 04:50:59 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 04:50:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 04:50:59 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AofJu110686;
	Thu, 5 Dec 2024 04:50:56 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 4/4] arm64: dts: ti: k3-am69-sk: Add overlay for PCIE0 Endpoint Mode
Date: Thu, 5 Dec 2024 16:20:36 +0530
Message-ID: <20241205105041.749576-5-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205105041.749576-1-s-vadapalli@ti.com>
References: <20241205105041.749576-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105103_853389_65AC98EF 
X-CRM114-Status: GOOD (  13.03  )
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

Add overlay to enable the PCIE0 instance of PCIe on AM69-SK in Endpoint
mode of operation.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

This patch has been newly introduced in this series.

 arch/arm64/boot/dts/ti/Makefile               |  4 ++
 .../boot/dts/ti/k3-am69-sk-pcie0-ep.dtso      | 53 +++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 04438f7136b8..db5ae27467e7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -126,6 +126,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
 
 # Boards with J784s4 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am69-sk.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am69-sk-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
@@ -198,6 +199,8 @@ k3-am68-sk-base-board-pcie1-ep-dtbs := k3-am68-sk-base-board.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtbo
 k3-am69-sk-csi2-dual-imx219-dtbs := k3-am69-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
+k3-am69-sk-pcie0-ep-dtbs := k3-am69-sk.dtb \
+	k3-am69-sk-pcie0-ep.dtbo
 k3-j7200-evm-pcie1-ep-dtbs := k3-j7200-common-proc-board.dtb \
 	k3-j7200-evm-pcie1-ep.dtbo
 k3-j721e-common-proc-board-infotainment-dtbs := k3-j721e-common-proc-board.dtb \
@@ -237,6 +240,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am68-sk-base-board-pcie1-ep.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
+	k3-am69-sk-pcie0-ep.dtb \
 	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso
new file mode 100644
index 000000000000..9a5bcf282a9e
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk-pcie0-ep.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling PCIE0 instances of PCIe in Endpoint Configuration
+ * on AM69-SK.
+ *
+ * AM69-SK Product Link: https://www.ti.com/tool/SK-AM69
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
+&pcie0_rc {
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
+		phys = <&serdes1_pcie_link>;
+		phy-names = "pcie-phy";
+		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
+	};
+};
-- 
2.43.0


