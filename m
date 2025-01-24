Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DE2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 12:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y0droG6bfOVQ9ccS8dcPaAEGjjMS1WyNZBdFc7z/3EM=; b=aNzcmr6VRdcWCYYfwV81GeSkPo
	fEIlXaWoowIW/XjJqqGAVaJOG4X4KI3IxqTgrKZggxexNtLOTKH0M89GoXMNcx5pAwsFYiKTp0wn2
	iKGnDBlrikY+fk6W4AxPqv9cegENv9bhBRMa6JylK0YybO4fAmwkezOOg6EOXfeYIqekWETZ5rW5w
	mVZf0BIOyQ459JPh4KXGzF11ewBYqh1kTjD5OpLzSPgXwUHUoHK8iJpeiQjDACIkA+pXTh66BoG0w
	++M0qOFKaqxO1rObCbvYCOZ+1ccpHEoqMIdAkKrnGDR87kKmZfS0H7Yp49Un6CYNjZkz2Gg1nKuHZ
	4Nrrk+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJ22-0000000EgI3-19v7;
	Fri, 24 Jan 2025 12:43:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJ0h-0000000EgE8-377q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 12:42:09 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OCft1f1355368
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 06:41:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737722515;
	bh=Y0droG6bfOVQ9ccS8dcPaAEGjjMS1WyNZBdFc7z/3EM=;
	h=From:To:CC:Subject:Date;
	b=KgCYOHIHrPe3VeMYjUaew8+9jcRsa1Oa71tscE15qycA+G1yBoNzK8kbpA4Slo+Nr
	 SJW2k2Vyg8/ipdjAGkI4sDsgpOTcVrQbbufmOzhtW+Azaw6b3DR//nVIe32N9DTdx0
	 Di+Pxr69L4Tg25f4ObaNM83SVeDDWvrww6/+CpZk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50OCft2s020912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 06:41:55 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 06:41:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 06:41:54 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OCforC023206;
	Fri, 24 Jan 2025 06:41:51 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type-A
Date: Fri, 24 Jan 2025 18:11:49 +0530
Message-ID: <20250124124150.2024963-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_044207_915794_6D9C9312 
X-CRM114-Status: GOOD (  17.60  )
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

The USB0 instance of the USB controller on both the J742S2 EVM and the
J784S4 EVM supports a single USB interface at a time among the following:
1. USB3.1 Gen1 Type C interface
2. Two USB2.0 Type A interfaces via an on-board USB Hub.

By default, the USB3.1 Gen1 Type C interface is supported on both of the
EVMs. Enable the USB2.0 Type A interface by configuring the USB2.0_MUX_SEL
mux. Additionally, set the Dual-Role Mode to Host since a Type-A interface
is only associated with the Host Mode of operation.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250124.
Since Linux boot is broken on all TI K3 SoCs including
J742S2 and J784S4 due to:
https://github.com/torvalds/linux/commit/ba5095ebbc7a
as indicated at:
https://lore.kernel.org/r/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
this patch was tested on J784S4-EVM by reverting the aforementioned commit.
Logs validating the USB2.0 Type-A Connector on J784S4-EVM using a USB Pen
Drive:
https://gist.github.com/Siddharth-Vadapalli-at-TI/663d703912ae574e39d7a78421e404c8

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/Makefile               |  7 +++++
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 8a4bdf87e2d4..95b8fd0981d7 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -127,6 +127,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -209,10 +210,14 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtbo
+k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
@@ -243,8 +248,10 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
+	k3-j784s4-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
 
 # Enable support for device-tree overlays
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
new file mode 100644
index 000000000000..ba15d72d86d6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling USB0 instance of USB on J784S4 and J742S2 EVMs for
+ * Host Mode of operation with the Type-A Connector.
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
+#include <dt-bindings/gpio/gpio.h>
+
+&exp2 {
+	p12-hog {
+		/* P12 - USB2.0_MUX_SEL */
+		gpio-hog;
+		gpios = <12 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "USB2.0_MUX_SEL";
+	};
+};
+
+&usb0 {
+	dr_mode = "host";
+};
-- 
2.43.0


