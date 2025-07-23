Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91318C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 04:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LaZDA/FCK3jvCwMvQup/hbQjkRk3GDFDbtf0l3xKc4=; b=k17aLV1GHRWiW8m8P5vBJAydXe
	vydlhwffGMjAvNj+8AGD46t0KH6eR84xGFQeTvr9gbS77HdMoELhBSGMrTA7sOgDrouVvpGzzpzgr
	fIRZ+oYQtCeuJ0Ci2zHnXS7VAP60Ivejs7vM9yK3zMRf73EqLtFDSXKrwnWaOsOM22Ba15YHWJzno
	WMzzLqGEavAckv68P/s9XOBKvYDb3BFjvZy88gL7IOUId9t/d/bS2hQsowm/2KeDHZImmkPAzwty1
	O+cRgg0qLDG0cB/YLKNQ7MuCJbw82a3usNQl34WMElkuFs+cQhBs+Tmo4qtfWmgdPaefIknzuVdUP
	jk6ziEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQtY-00000003yUb-26lm;
	Wed, 23 Jul 2025 04:15:56 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueQR2-00000003vs4-0RGp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 03:46:29 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250723034625b4bb39adfe60b06636
        for <linux-arm-kernel@lists.infradead.org>;
        Wed, 23 Jul 2025 05:46:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=huaqian.li@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+LaZDA/FCK3jvCwMvQup/hbQjkRk3GDFDbtf0l3xKc4=;
 b=OWIP5tScLpijIdXWno3l72DBpUU8dG0iO56tpvSECZ67A0t43T3i2joIm7maPfe06U2qAZ
 p+MLqFek14H+3N+EFQkLqpngXP+RD/XkY73UBhFUZfx+ZqlYkD6TlrDJt+1wqqaKu9yPn6j7
 5r7rD/WMH1HTY/2GHNOL59LLgjhVY7C0vgFNbgil5lSlL1OPAODtcV4amns4XpKFkkFt48L+
 CBWf8IyaFDUzNAUfSiPxWpDRZNT/5a1TYCvrJGUgPo3YLlC+v42cfD3rm4SmCS6vVWVnUX/Q
 deQuYUSnSrNmJkitvIHqhtdXWK/ITgodAATBPKivkdD1W218iAP8Lpuw==;
From: huaqian.li@siemens.com
To: christophe.jaillet@wanadoo.fr
Cc: baocheng.su@siemens.com,
	bhelgaas@google.com,
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
	robh@kernel.org,
	s-vadapalli@ti.com,
	ssantosh@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v11 7/7] arm64: dts: ti: iot2050: Add overlay for DMA isolation for devices behind PCI RC
Date: Wed, 23 Jul 2025 11:45:21 +0800
Message-Id: <20250723034521.138695-8-huaqian.li@siemens.com>
In-Reply-To: <20250723034521.138695-1-huaqian.li@siemens.com>
References: <20250723034521.138695-1-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-959203:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_204628_267488_798DEFCE 
X-CRM114-Status: GOOD (  12.84  )
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


