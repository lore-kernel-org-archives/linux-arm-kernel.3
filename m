Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F0AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV/jaYaeqLgeor+uhAvzT3mMfdbRoQoVZFVEqQ7WnTw=; b=b7QA2+vDzzXioWG2aEQ++4YnFi
	aCsI1j/+44j3eefYa384raCUoMznJzCNstPcti+Fqc3w1CbeiURjo7chyvnnmASG5ANVImR+++eCh
	5hEKSZeZU4NFYNlLd2cq9azXVWBams4o68wdhVFcpyss+tsVrhXJ5TCXZhRwaKdaeB13CVb5L005O
	reaGbYE1XydmUGFDpbMOIF3+NXGmEZlv/LNAEDyqbv1iB5kZZ+FzVSsRdo1R0kjAmpD9WPzqDPlYo
	cgFH6GjoIu7Dv6t/rcYbTprD2s7XUXqaHiS8Aw3iiZ7ygtCQ9nbpt8BMg0GAmxWjCBOIq9HYqkZSG
	l+pR3ijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1U-00000007Hrb-3U7o;
	Fri, 03 Jul 2026 14:37:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1Q-00000007Hlm-0nSg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:37:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8F061A0DE2;
	Fri,  3 Jul 2026 14:37:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8809860300;
	Fri,  3 Jul 2026 14:37:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E8FA104C952E;
	Fri,  3 Jul 2026 16:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089457; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tV/jaYaeqLgeor+uhAvzT3mMfdbRoQoVZFVEqQ7WnTw=;
	b=EQdWgeMciATtzO8+dj0t/UslJ3pit7RDOvh/AfdcQ0bFYOIQ+IagJ/2FXbrFvJKoNFg+ML
	Mn3l5hO4r+JtP5i5GdtS+asfAYonsG/r6cnMUBnFOyVMT5C6A9V5DuWbq9oPYdpeHYG+hY
	lXJ0qu+7r4sZqOWCSmpjLM9ibC0PjAxkAzKIVmWSMFadWZpgZI2Zm0NPYRHYW5Xnkl5n5B
	xPl+U9P1e3foXtyPFw36bc43u6J7K0+0SN8UUpIgIVDjAsBsJ1y0yBF94K8Mif1kPekfsh
	W1dY8V3EbDE7eGMXIpX5aQ+/9meK0HAofwIUKtaxyegfB4wQJrYozLnJ0+hk1A==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Fri,  3 Jul 2026 16:37:17 +0200
Message-ID: <20260703143717.177362-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143717.177362-1-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_073740_381017_0F1E04AE 
X-CRM114-Status: GOOD (  15.31  )
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

Declare a carveout memory region to store LPM metadata on J742S2.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
enabled.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts      |  2 ++
 .../dts/ti/k3-j742s2-ti-ipc-firmware.dtsi     | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
index fcb7f05d7faf..583b672ef8e9 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
@@ -24,3 +24,5 @@ memory@80000000 {
 		bootph-all;
 	};
 };
+
+#include "k3-j742s2-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
new file mode 100644
index 000000000000..d66bcd2f4e19
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/**
+ * Device Tree Source for enabling IPC using TI SDK firmware on J42S2 SoCs
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2026 Bootlin
+ */
+
+&reserved_memory {
+	lpm_memory_region: memory@ab000000 {
+		reg = <0x00 0xab000000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+};
+
+&mcu_r5fss0_core0 {
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
+	status = "okay";
+};
-- 
2.47.3


