Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7D4C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k13HDNE1rJUSq0uCLZXSMqkE9k5YxUpfJcI0ebOcnHg=; b=HqxzxB971jTC+kyEOoC4UdVBg4
	j5ROwJJdBJDBYQKP8xRr0gpVClMMGKCqgU9fdwo4tETYGlfbXvA5HG3VnYLkmf1L42dgQ6HGC/qC0
	/o6yhMfDqcy74nzA7aaDTAyZqJuzx3Vybryjs3VLu+jCrHuDdDThk0jau6vVFLGTb2/oD6N01GlTe
	F8y6pJ5wXVSGDCUBFDe0n2xor9wF6c5iF0xqdEJ02LcWeEB3VnWeHbNQGF3c+Uu6tf3aZ1aCykZEU
	iic+D2Qcm0lOVChH8gRwqJiRAgTRa9EOEbmdDkWbYoESxpHOdPjEQ7qe89VW9hHOkIIF06eZR6uIf
	YODCbqsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fPT-00000002UEF-2yqb;
	Mon, 21 Sep 2026 14:54:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fOx-00000002TtM-1cyO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:53:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EA0661A08AC;
	Mon, 21 Sep 2026 14:53:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBE0A5FFB2;
	Mon, 21 Sep 2026 14:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AEC8103291B1;
	Mon, 21 Sep 2026 16:53:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790002428; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=k13HDNE1rJUSq0uCLZXSMqkE9k5YxUpfJcI0ebOcnHg=;
	b=fQm76AQDVNW5du+BeBnL/BuChXoy2BjharEsy3atUz0NWRcJM4z08+LENAQ92A64BF+nWf
	k+a9AJnfxFXPpt1Y1WQsYSdJ8Fui4CYyJevLQFaMma9zFCi8Q8Au4hQdO49mIfNARFgpuy
	E+HUeqorzzoFNMbMXiSAkWkX0625ARnbYqhKWj0Jf1BbrlSCfvEig0A1tFRnRgfmmfGQRW
	ttKT70nnfvixB6pxMycDiv06bnPsM7xiXbQzNI7nfGLnbDjEscPA/6KfiFQkwisM52yFVA
	pCn3egXC1a6an9JQwNqPcB/DM2tsz8lZcp5iJOixaLLaUGDUJmVFylNIxiss4A==
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
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v4 7/7] arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Mon, 21 Sep 2026 16:53:25 +0200
Message-ID: <20260921145325.300025-8-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921145325.300025-1-richard.genoud@bootlin.com>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_075351_938372_92F50AA6 
X-CRM114-Status: GOOD (  15.54  )
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

