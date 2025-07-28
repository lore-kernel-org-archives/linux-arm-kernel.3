Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3835C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LaZDA/FCK3jvCwMvQup/hbQjkRk3GDFDbtf0l3xKc4=; b=WXKs5Nhm0C/4C23r7OambzfzOP
	aR9tf5jt7DCdFAbRkSpl3y7BmPW1pqCLXN0d7HBuI/LYW6FVF4ruLfwWgRPor0+fCjciyr6mPHgWG
	o06pcKKK0BBlz1UIDdqCdLnTqTD27piyZIkCMah0C7Q2NHEUzMrN8CLGmfikC3m6ITbxidvVAir0k
	azwEofFxcW1a0OpbKjjIIor0+Qqo960w9ZE7NFgld0w0gui/MjgZc/DZDjH1TemIrp5O6xqLQ315i
	xHi6B6MasSGqHnPrAlyEhAWprtGfm80pjAWa+PdNBHqiFd7OKRcTukZ1zj0Kp7gFywfeCo4Iju+Kr
	A0UNiPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugE3p-0000000DV69-3cKn;
	Mon, 28 Jul 2025 02:57:58 +0000
Received: from mta-64-227.siemens.flowmailer.net ([185.136.64.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDke-0000000DTAf-1Cpo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 02:38:09 +0000
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202507280238045093750fce9d22699b
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 28 Jul 2025 04:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+LaZDA/FCK3jvCwMvQup/hbQjkRk3GDFDbtf0l3xKc4=;
 b=nf1Uw3Ncp9jtJY9loCfxU9bFqmLTMP12BmamCuGp878lDEQS3+iRkLECAjXXa+5Lv0gXII
 ImGEJ6vJ2pSXj5mgWY3YP29/R7Iu5PouNmN+QLjLgiihpS2OSOAGSI+WZf1O32Ld0WcrhFR2
 MTzKVvs/vnBoP79nd60eRlnluiDdr7v5pcRmOtuVXFlanWa91sG60CFFN4PNpYoVwMwGrEql
 1IV4I21jWTWTe+rQuC/rWI58yR0YeWW/WjqR3SJY32jw9FE3Paey3EArjUx+cd3+1YTlj0HT
 QXkXZY/lsYNrrbunbji7GHz7r75OMVEpz7AohRJJwuBInzBC4xKsx6Rg==;
From: huaqian.li@siemens.com
To: lkp@intel.com
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
	christophe.jaillet@wanadoo.fr,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	diogo.ivo@siemens.com,
	helgaas@kernel.org,
	huaqian.li@siemens.com,
	jan.kiszka@siemens.com,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	kw@linux.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	nm@ti.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v12 7/7] arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices behind PCI RC
Date: Mon, 28 Jul 2025 10:37:01 +0800
Message-Id: <20250728023701.116963-8-huaqian.li@siemens.com>
In-Reply-To: <20250728023701.116963-1-huaqian.li@siemens.com>
References: <20250728023701.116963-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_193808_469103_C1258D9C 
X-CRM114-Status: GOOD (  12.80  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Reserve a 64M memory region and ensure that all PCI devices do their DMA
only inside that region. This is configured via a restricted-dma-pool
and enforced with the help of the first PVU.

Applying this isolation is not totally free in terms of overhead and
memory consumption. It  makes only sense for variants that support
secure booting, and generally only when this is actually enable.
Therefore model it as overlay that can be activated on demand. The
firmware will take care of this via DT fixup during boot and will also
provide a way to adjust the pool size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  5 +++
 ...am6548-iot2050-advanced-dma-isolation.dtso | 33 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-dma-isolation.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index c6171de9fe88..66b1d8093fa2 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -84,8 +84,10 @@ k3-am654-gp-evm-dtbs := k3-am654-base-board.dtb \
 k3-am654-evm-dtbs := k3-am654-base-board.dtb k3-am654-icssg2.dtbo
 k3-am654-idk-dtbs := k3-am654-evm.dtb k3-am654-idk.dtbo k3-am654-pcie-usb2.dtbo
 k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie-dtbs := k3-am6548-iot2050-advanced-m2.dtb \
+	k3-am6548-iot2050-advanced-dma-isolation.dtbo \
 	k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtbo
 k3-am6548-iot2050-advanced-m2-bkey-usb3-dtbs := k3-am6548-iot2050-advanced-m2.dtb \
+	k3-am6548-iot2050-advanced-dma-isolation.dtbo \
 	k3-am6548-iot2050-advanced-m2-bkey-usb3.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am6528-iot2050-basic.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am6528-iot2050-basic-pg2.dtb
@@ -288,7 +290,10 @@ DTC_FLAGS_k3-am62p5-sk += -@
 DTC_FLAGS_k3-am642-evm += -@
 DTC_FLAGS_k3-am642-phyboard-electra-rdk += -@
 DTC_FLAGS_k3-am642-tqma64xxl-mbax4xxl += -@
+DTC_FLAGS_k3-am6548-iot2050-advanced += -@
 DTC_FLAGS_k3-am6548-iot2050-advanced-m2 += -@
+DTC_FLAGS_k3-am6548-iot2050-advanced-pg2 += -@
+DTC_FLAGS_k3-am6548-iot2050-advanced-sm += -@
 DTC_FLAGS_k3-am68-sk-base-board += -@
 DTC_FLAGS_k3-am69-sk += -@
 DTC_FLAGS_k3-j7200-common-proc-board += -@
diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-dma-isolation.dtso b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-dma-isolation.dtso
new file mode 100644
index 000000000000..dfd75d2dc245
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-dma-isolation.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IOT2050, overlay for isolating DMA requests via PVU
+ * Copyright (c) Siemens AG, 2024
+ *
+ * Authors:
+ *   Jan Kiszka <jan.kiszka@siemens.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/reserved-memory} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	pci_restricted_dma_region: restricted-dma@c0000000 {
+		compatible = "restricted-dma-pool";
+		reg = <0 0xc0000000 0 0x4000000>;
+	};
+};
+
+&pcie0_rc {
+	memory-region = <&pci_restricted_dma_region>;
+};
+
+&pcie1_rc {
+	memory-region = <&pci_restricted_dma_region>;
+};
+
+&ti_pvu0 {
+	status = "okay";
+};
-- 
2.34.1


