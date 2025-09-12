Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB00CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 06:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6LH87+1IiY/lYyLvbTQW2dEczZuDxUoWtu5AqiVG26Q=; b=MEgAIFyJ00fKAQlf77yRZGBzuo
	XVJXkI5P/rRgz/5Tv6WpkIkZ4eD8y+uF73LtdvwPuCVVc11kVKcn4A+1BmVv92cQCZasjNN3chWsn
	PtIM79cMJ2ucLs298oJkYdKQcYPhepDp2lY9dWgaphhvUUPk1vJjCr7Tcskbeeb4rFaUxeGeiLibg
	Sklzu13EaiW8tnsdYq7SZpC+213MDI2e6zxbDfxIoCZyB5cjkaQAX0ENzR64hWvcwwiaYCGjOt8qd
	2OWUsCjL7u6CfdkCNenExPvZwSzbwdjn0xjgMZD8J/Ya8fG2RnYcfj4AzC2JJ2pMe8lxc56byP5Yx
	ckfk69Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwx9B-00000007Mc6-1uRV;
	Fri, 12 Sep 2025 06:20:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwx98-00000007Mas-1ktu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 06:20:35 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C6KRt8458365;
	Fri, 12 Sep 2025 01:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757658027;
	bh=6LH87+1IiY/lYyLvbTQW2dEczZuDxUoWtu5AqiVG26Q=;
	h=From:To:CC:Subject:Date;
	b=XkeTqY9h7X5uhDfwbJRyfbtlmdQdsmsrsJAFT+BH0J8YpP26KHDZtqAuOV+jiloN5
	 DBXgEAZhWLIWivijHykP0065sHLJl35ulcEyVXouR4vx1egIJn6O3bGX4YOmrSCt6B
	 eXWVtVn62g/KpzIIsPEHBBThEM40Hr9Smec4RZU0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C6KR8t2560140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 01:20:27 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 01:20:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 01:20:26 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C6KM8v3143558;
	Fri, 12 Sep 2025 01:20:23 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721s2-evm: Add overlay to enable USB0 Type-A
Date: Fri, 12 Sep 2025 11:50:14 +0530
Message-ID: <20250912062021.2906034-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_232034_621413_5615D8BB 
X-CRM114-Status: GOOD (  20.81  )
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

The J721S2-EVM (J721S2-SOM mounted on the J7 Common Processor Board) has
a single instance of USB namely USB0. On the board, USB0 can be enabled
using a single USB interface at a time among the following:
1. USB3.1 Gen1 Type C interface
2. Two USB2.0 Type A interfaces via an on-board USB Hub

By default, USB0 is enabled using the USB3.1 Gen1 Type C interface. Hence,
add a device-tree overlay to allow using USB0 with the USB2.0 Type A
interfaces by configuring the "USB2.0_MUX_SEL" mux. Also, since the Type A
interfaces only connect to USB Devices with USB0 acting as the USB Host,
set the Dual-Role mode for USB0 to Host.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250911.
Patch has been validated on J721S2-EVM. Test logs have been provided
below for the default case without the DT overlay (Type C Interface)
and with the DT overlay applied (Type A Interface).

Without the DT overlay, USB0 is configured with 'dr_mode' set to "otg"
due to which the 'lsusb' output does not contain any output initially
as the USB Mass Storage device is not yet connected to the Type C
Interface on the EVM. After connecting the USB Mass Storage device to
the Type C Interface, USB0 assumes the Host role and enumerates the Mass
Storage device. Following this, 'lsusb' output shows the USB Root Hub
and the USB Mass Storage Device. Test Logs for this are:
https://gist.github.com/Siddharth-Vadapalli-at-TI/6bc1434b7d949a2f2c43d55811aee661

With the DT overlay applied, USB0 assumes the Host role by default, due
to which the 'lsusb' output contains the Root Hub even without the USB
Mass Storage device connected to the Type A Interface on the EVM. After
the USB Mass Storage device is connected to the Type A Interface, it is
enumerated and shows up in the 'lsusb' output. Test Logs for this are:
https://gist.github.com/Siddharth-Vadapalli-at-TI/dc3443be624b61d920833f1a66ab356a

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/Makefile               |  4 +++
 .../dts/ti/k3-j721s2-evm-usb0-type-a.dtso     | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index aad9177930e6..1e4829801e49 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -131,6 +131,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-gesi-exp-board.dtbo
 k3-j721s2-evm-dtbs := k3-j721s2-common-proc-board.dtb k3-j721s2-evm-gesi-exp-board.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-usb0-type-a.dtbo
 
 # Boards with J722s SoC
 dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
@@ -230,6 +231,8 @@ k3-j721e-sk-csi2-dual-imx219-dtbs := k3-j721e-sk.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtbo
 k3-j721s2-evm-pcie1-ep-dtbs := k3-j721s2-common-proc-board.dtb \
 	k3-j721s2-evm-pcie1-ep.dtbo
+k3-j721s2-evm-usb0-type-a-dtbs := k3-j721s2-common-proc-board.dtb \
+	k3-j721s2-evm-usb0-type-a.dtbo
 k3-j722s-evm-csi2-quad-rpi-cam-imx219-dtbs := k3-j722s-evm.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
 k3-j722s-evm-csi2-quad-tevi-ov5640-dtbs := k3-j722s-evm.dtb \
@@ -272,6 +275,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-j721e-evm-pcie1-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
 	k3-j721s2-evm-pcie1-ep.dtb \
+	k3-j721s2-evm-usb0-type-a.dtb \
 	k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtb \
 	k3-j722s-evm-csi2-quad-tevi-ov5640.dtb \
 	k3-j742s2-evm-usb0-type-a.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtso b/arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtso
new file mode 100644
index 000000000000..fe4a23efe708
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-evm-usb0-type-a.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * DT Overlay for enabling USB0 instance of USB in the Host Mode of operation
+ * with the Type-A Connector on the J7 common processor board.
+ *
+ * J7 Common Processor Board Product Link: https://www.ti.com/tool/J721EXCPXEVM
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&exp_som {
+	p0-hog {
+		/* P0 - USB2.0_MUX_SEL */
+		gpio-hog;
+		gpios = <0 GPIO_ACTIVE_HIGH>;
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


