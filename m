Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC6DD5CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v6koZlLfiM2wPFeyFxSJklnjDBVuQcqo4Tb2erh4niE=; b=eSXozStv8nSX1t8lgFvzRmMtnr
	odhNFRgzyVoegBkkNPYv3B3X30dm7ExwBmvBPz3/wHZMzQdI4PnFwEu3ZipgNJy6Bu3HABYWE27wA
	AVuPsGsVwZYrxcfidsS2Or0efZbwLgB+nw6AMbe+/59+mIY3Q8Fc6QTOMuCUgtgdtZVnDlWqDEUfq
	jZpQefh+tHitRxo6Cr/5rF2oU2H1yycDS8zyoMIqr9UfmkzbbdsLDo/Qpoisi8eR2IXoupyA6wBq6
	DvoCaSsgavPA4tJDqcRRqtHIz/hqr8p/B/kllmLCTEoCHqFg80FSuW70zjk4rwnw+TUE05jFcY4Z6
	HSl0d1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67IN-00000000EdP-1rSx;
	Wed, 30 Oct 2024 11:55:27 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t678b-00000000C9w-0SpI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:45:22 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49UBjFcx070698;
	Wed, 30 Oct 2024 06:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730288715;
	bh=v6koZlLfiM2wPFeyFxSJklnjDBVuQcqo4Tb2erh4niE=;
	h=From:To:CC:Subject:Date;
	b=VbesGsbNfDOJlzPbOAms9yUJ1aog0/6vg/8OIEJ52pYB1MPF57F/hNmLdm4O0WcN5
	 McGORCVhwJA7CLovKTvpXv38F4oDUNGUrRjYqIz4+8Bs8U88ceJ5SxQSNzH4KIZjBl
	 E2aCD2yhTIpXulTk+9emmZe/MpGBlBQHH8DEQN98=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49UBjF8d007881
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Oct 2024 06:45:15 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Oct 2024 06:45:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Oct 2024 06:45:14 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49UBjEnq048831;
	Wed, 30 Oct 2024 06:45:14 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 49UBjDa8025747;
	Wed, 30 Oct 2024 06:45:14 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: <vigneshr@ti.com>, <nm@ti.com>
CC: <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kristo@kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
        <danishanwar@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am642-evm: Add dt overlay to disable icssg for Linux
Date: Wed, 30 Oct 2024 17:14:58 +0530
Message-ID: <20241030114458.1358800-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_044521_259763_26274EC4 
X-CRM114-Status: GOOD (  15.13  )
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

Add k3-am642-evm-icssg1-disable.dtso overlay file that disables
icssg1-eth from Linux so that icssg peripherals can be used by
RTOS or some other OS running on R5 core.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  7 +--
 .../dts/ti/k3-am642-evm-icssg1-disable.dtso   | 49 +++++++++++++++++++
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 6bd06bd76b68..0fd95b7df5a8 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am642-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-nand.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-dualemac-mii.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-icssg1-disable.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-evm-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am642-phyboard-electra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am642-sk.dtb
@@ -235,8 +236,8 @@ k3-am62p5-sk-microtips-mf103hie-lcd2-dtbs := k3-am62p5-sk.dtb \
 	k3-am62p5-sk-microtips-mf103hie-lcd2.dtbo
 k3-am642-evm-icssg1-dualemac-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac.dtbo
-k3-am642-evm-icssg1-dualemac-mii-dtbs := \
-	k3-am642-evm.dtb k3-am642-evm-icssg1-dualemac-mii.dtbo
+k3-am642-evm-icssg1-disable-dtbs := \
+	k3-am642-evm.dtb k3-am642-evm-icssg1-disable.dtbo
 k3-am642-evm-pcie0-ep-dtbs := \
 	k3-am642-evm.dtb k3-am642-evm-pcie0-ep.dtbo
 k3-am642-tqma64xxl-mbax4xxl-sdcard-dtbs := \
@@ -323,7 +324,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am62p5-sk-microtips-mf101hie-panel.dtb \
 	k3-am62p5-sk-microtips-mf103hie-lcd2.dtb \
 	k3-am642-evm-icssg1-dualemac.dtb \
-	k3-am642-evm-icssg1-dualemac-mii.dtb \
+	k3-am642-evm-icssg1-disable.dtb \
 	k3-am642-evm-pcie0-ep.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-sdcard.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso
new file mode 100644
index 000000000000..dc04e2999e97
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm-icssg1-disable.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT overlay for enabling 2nd ICSSG1 port on AM642 EVM
+ *
+ * Copyright (C) 2020-2024 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "k3-pinctrl.h"
+
+&oc_sram {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	r5f0_0_sram: r5f0_0_sram@0 {
+		reg = <0x0 0x180000>;
+	};
+};
+
+&main_r5fss0_core0 {
+	sram = <&r5f0_0_sram>;
+};
+
+&cpsw_port2 {
+	status = "disabled";
+};
+
+&icssg0 {
+	status = "disabled";
+};
+
+&icssg1 {
+	status = "disabled";
+};
+
+&ospi0 {
+	status = "disabled";
+};
+
+&mdio_mux_1 {
+	status = "disabled";
+};
+
+&icssg1_eth {
+	status = "disabled";
+};
-- 
2.34.1


