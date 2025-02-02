Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6893AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyxT29djFvM3ntDkvLl+j0Q447hgH0lzb94/vho/PT4=; b=TsKDIvugZYdekKk6v+gt37IfAq
	8OHlNJj9F6lRwthTCThGv+LdevI1V8xWZAiKR4hZA3q7mLi4ZTtBbzzKBIcA2dMbf4E5K/hyBVxpq
	D/QE2qk0Q5RbCkWZF8Jt4scleIta5A0wQDKHR/HO2LRjnZ7f4/Y0LE8AFkiozkvF4Vj4vGsVRSi0H
	q6p4uwZd8c2SyNVm+jCkSegFBzg/QBcUWpavsP5dGMJMbRk8Kfsg2m8sJ6oOaCGVi3nza28Dimp7D
	mTC4MOgocynKTMLW/8ei/0ncwv3WOYL1q2q9JB9aSV8VmRqVscnPGcJQhNmF700aLwjQ9R7DoDNs+
	tHpRznyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teWUF-0000000Da8F-0OJ0;
	Sun, 02 Feb 2025 09:41:55 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teWPP-0000000DZdN-0CHP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 09:36:57 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5129aqpU2003168
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 2 Feb 2025 03:36:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738489012;
	bh=VyxT29djFvM3ntDkvLl+j0Q447hgH0lzb94/vho/PT4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aT7RhGqIkAn63V2CqOHxeRmOokBxADWMJyqDlGmV059XqKP4IFv/b98WaIB5k8lAL
	 hUzM1yKVhMFUZgcEGatNsaeHzsuOziqJj8d8lU5sMNwoBCA80oxkJbdQAo5a5kR1Is
	 6b8lX3Fy9xWj0+MwJuAd+SGkO1OSimAjdGo+11xk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129aqdu086783;
	Sun, 2 Feb 2025 03:36:52 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 2
 Feb 2025 03:36:50 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 2 Feb 2025 03:36:51 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5129abbl119794;
	Sun, 2 Feb 2025 03:36:48 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 3/3] arm64: dts: ti: k3-j784s4-j742s2-evm: Add overlay to enable USB0 Type-A
Date: Sun, 2 Feb 2025 15:06:30 +0530
Message-ID: <20250202093636.2699064-4-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250202093636.2699064-1-s-vadapalli@ti.com>
References: <20250202093636.2699064-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_013655_181302_6D1BD98F 
X-CRM114-Status: GOOD (  16.15  )
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
 arch/arm64/boot/dts/ti/Makefile               |  9 +++++-
 .../ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso  | 29 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-usb0-type-a.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index dbeb5d7401f7..019517c258ec 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -129,6 +129,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-pcie0-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-quad-port-eth-exp1.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 
 # Boards with J742S2 SoC
 dtb-$(CONFIG_ARCH_K3) += k3-j742s2-evm.dtb
@@ -215,6 +216,8 @@ k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
 k3-j742s2-evm-pcie-ntb-dtbs := k3-j742s2-evm.dtb \
 	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
+k3-j742s2-evm-usb0-type-a-dtbs := k3-j742s2-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 k3-j784s4-evm-pcie-ntb-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-j742s2-evm-pcie-ntb.dtbo
 k3-j784s4-evm-pcie0-pcie1-ep-dtbs := k3-j784s4-evm.dtb \
@@ -223,6 +226,8 @@ k3-j784s4-evm-quad-port-eth-exp1-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtbo
 k3-j784s4-evm-usxgmii-exp1-exp2-dtbs := k3-j784s4-evm.dtb \
 	k3-j784s4-evm-usxgmii-exp1-exp2.dtbo
+k3-j784s4-evm-usb0-type-a-dtbs := k3-j784s4-evm.dtb \
+	k3-j784s4-j742s2-evm-usb0-type-a.dtbo
 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-beagleplay-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-csi2-imx219.dtb \
@@ -253,10 +258,12 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
 	k3-j742s2-evm-pcie-ntb.dtb \
+	k3-j742s2-evm-usb0-type-a.dtb \
 	k3-j784s4-evm-pcie-ntb.dtb \
 	k3-j784s4-evm-pcie0-pcie1-ep.dtb \
 	k3-j784s4-evm-quad-port-eth-exp1.dtb \
-	k3-j784s4-evm-usxgmii-exp1-exp2.dtb
+	k3-j784s4-evm-usxgmii-exp1-exp2.dtb \
+	k3-j784s4-evm-usb0-type-a.dtb
 
 # Enable support for device-tree overlays
 DTC_FLAGS_k3-am625-beagleplay += -@
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


