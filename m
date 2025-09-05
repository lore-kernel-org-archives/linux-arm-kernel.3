Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE8CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwE0XCbd/sXhFbcm12KWj7/xfm9V0KVy6HiQ+MB0eOQ=; b=4liDbiKwAUPBM/sJ8bWJqgRnD1
	WQ3bk5wQ72IsQrmM4y5qCSPedzkFV0FoXVqvHKbwBfq/mv2yco8z74PeX3u0ywa/hsXOv+/X6v2Hh
	LOlV6nQabSqLcOU60JwVU5MJ6gThf7zzrqTZulujNpwqFB8Q13nkAsB9fI/n51bGAOeIghJYvolzv
	fmjVHXfUyhJ0AAhlkkZAvC1EyMRQbh23PzpBSpguzvAib0uH6SKDodQ4MKU7D922joV0mO7JzVMI/
	XtcJytfHWzJ0xDtSnRiyiQEom1YSe3MRlkB/H9gq8XWyH6iPW6PhlRFMzGlRG56irr2HVOdWoe7Qv
	YorNhpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPTT-0000000H97Z-1eEw;
	Fri, 05 Sep 2025 05:59:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOrM-0000000Gwp4-00oE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:19:41 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855JbCl3637252;
	Fri, 5 Sep 2025 00:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757049577;
	bh=iwE0XCbd/sXhFbcm12KWj7/xfm9V0KVy6HiQ+MB0eOQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rLykjRz4NfxRcljAlY7i5Qg7glYwRSzSXCdS5ebYK/ZjwD3qPED0Kbc6F1Z2T/5IF
	 o0nU69mrCnxeHCCFfGkVLUl2jt/M+DNG7x5c3v7spXb0OQaM+8KMJg4bFg9kzyphWR
	 SIe6alFMa3pazxph1JeV0HFZE1A5Z2yRnlDBukvc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855JbVj136238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 00:19:37 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:19:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:19:37 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855Ioic220581;
	Fri, 5 Sep 2025 00:19:33 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 09/33] arm64: dts: ti: k3-am65: Enable remote processors at board level
Date: Fri, 5 Sep 2025 10:48:22 +0530
Message-ID: <20250905051846.1189612-10-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905051846.1189612-1-b-padhi@ti.com>
References: <20250905051846.1189612-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_221940_131941_C1F2EFD4 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Remote Processors defined in top-level AM65x SoC dtsi files are
incomplete without the memory carveouts and mailbox assignments which
are only known at board integration level.

Therefore, disable the remote processors at SoC level and enable them at
board level where above information is available.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
v3: Changelog:
1. Carried A/B tag.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-10-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 31/33] to [PATCH v2 09/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-32-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi | 6 ++++++
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi            | 3 +++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
index e5136ed94765..73936994a156 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-iot2050-common.dtsi
@@ -602,16 +602,22 @@ mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 	};
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	status = "okay";
 };
 
 &mcu_r5fss0_core1 {
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
+	status = "okay";
 };
 
 &mcu_rti1 {
diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
index 7cf1f646500a..f6d9a5779918 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
@@ -408,6 +408,7 @@ mcu_r5fss0: r5fss@41000000 {
 		ranges = <0x41000000 0x00 0x41000000 0x20000>,
 			 <0x41400000 0x00 0x41400000 0x20000>;
 		power-domains = <&k3_pds 129 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		mcu_r5fss0_core0: r5f@41000000 {
 			compatible = "ti,am654-r5f";
@@ -422,6 +423,7 @@ mcu_r5fss0_core0: r5f@41000000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		mcu_r5fss0_core1: r5f@41400000 {
@@ -437,6 +439,7 @@ mcu_r5fss0_core1: r5f@41400000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index e589690c7c82..39c2d46801de 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -541,16 +541,22 @@ mbox_mcu_r5fss0_core1: mbox-mcu-r5fss0-core1 {
 	};
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
+	status = "okay";
 };
 
 &mcu_r5fss0_core1 {
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
+	status = "okay";
 };
 
 &ospi0 {
-- 
2.34.1


