Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A8CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2MR17weggiyEPbRgrdR25GH0iavLtW4vrISi+mM9Fg=; b=bN6MRIF/Hbs7tVifhsqH6O75ra
	2t5dJGaHKpOdPqJgqokT7FXzeO2zyC3LaK1IjP2Eb5gl6myBmdlf4dwt1ei7ib9hiC51Tm5lFlfpM
	SzD7oqV+wVwV5lLJ9cEIlH7pRF7mkzgKQnJQxdUbYRiW8qTNVRaV2yx6X2nLchp5OygDyr6AGMkeF
	elobBufPZYD5LYvYCK2O82iB7IgXriPAatKXAWcGa5BLf5pUSZ0kxZmNruI/g2oRk2mC9MiCi8kkO
	VQRPFRcvkYbIu1MICc/anKbcCsyKk5dKEqbOy13MbN+SoR52TFMOcS5c5084AKUb/qG6OwdOyf1Bt
	FGOux25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPE-000000015pc-1CQ0;
	Mon, 08 Sep 2025 17:11:52 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcrl-000000006iH-1i7U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:29:10 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ET6Fb3810224;
	Mon, 8 Sep 2025 09:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341746;
	bh=T2MR17weggiyEPbRgrdR25GH0iavLtW4vrISi+mM9Fg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UqIPY6le8iQxJmiGMtbwkUEd+xkfA5Q8BHjGyXUs06mQaLhoC322nSwMpds+fawHt
	 tJ6hbm6+Mzzf3oLsfvtmelC62Ahx3zOiqqDLbduNPaARkvSuGvzpFZS0jpF/oS8oWe
	 8mcg8DFNtbq338wwuihDWHwWwUGtcflybWsscb8U=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ET6oJ3833159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:29:06 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:29:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:29:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecf1037553;
	Mon, 8 Sep 2025 09:29:01 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 03/34] arm64: dts: ti: k3-j721s2: Enable remote processors at board level
Date: Mon, 8 Sep 2025 19:57:55 +0530
Message-ID: <20250908142826.1828676-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_072909_536339_7BB753EE 
X-CRM114-Status: GOOD (  11.54  )
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

Remote Processors defined in top-level J721S2 SoC dtsi files are
incomplete without the memory carveouts and mailbox assignments which
are only known at board integration level.

Therefore, disable the remote processors at SoC level and enable them at
board level where above information is available.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-4-b-padhi@ti.com/

v3: Changelog:
1. Carried A/B tag.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-4-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 08/33] to [PATCH v2 03/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-9-b-padhi@ti.com/
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi  | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi       | 12 ++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi       |  6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi |  3 +++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi     | 12 ++++++++++++
 5 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index fd715fee8170..383594732e81 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -371,24 +371,28 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	status = "okay";
 };
 
 /* eMMC */
@@ -407,10 +411,12 @@ &main_sdhci1 {
 
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss1 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -438,16 +444,22 @@ &main_timer5 {
 	status = "reserved";
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &ospi0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 4ca2d4e2fb9b..2d2edeeb7347 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -291,24 +291,32 @@ mbox_c71_1: mbox-c71-1 {
 	};
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss1 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -340,24 +348,28 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	status = "okay";
 };
 
 &c71_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 0ad752975acd..80c51b11ac9f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1895,6 +1895,7 @@ main_r5fss0: r5fss@5c00000 {
 		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
 			 <0x5d00000 0x00 0x5d00000 0x20000>;
 		power-domains = <&k3_pds 277 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		main_r5fss0_core0: r5f@5c00000 {
 			compatible = "ti,j721s2-r5f";
@@ -1909,6 +1910,7 @@ main_r5fss0_core0: r5f@5c00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		main_r5fss0_core1: r5f@5d00000 {
@@ -1924,6 +1926,7 @@ main_r5fss0_core1: r5f@5d00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
@@ -1935,6 +1938,7 @@ main_r5fss1: r5fss@5e00000 {
 		ranges = <0x5e00000 0x00 0x5e00000 0x20000>,
 			 <0x5f00000 0x00 0x5f00000 0x20000>;
 		power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		main_r5fss1_core0: r5f@5e00000 {
 			compatible = "ti,j721s2-r5f";
@@ -1949,6 +1953,7 @@ main_r5fss1_core0: r5f@5e00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		main_r5fss1_core1: r5f@5f00000 {
@@ -1964,6 +1969,7 @@ main_r5fss1_core1: r5f@5f00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index bc31266126d0..837097751c18 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -690,6 +690,7 @@ mcu_r5fss0: r5fss@41000000 {
 		ranges = <0x41000000 0x00 0x41000000 0x20000>,
 			 <0x41400000 0x00 0x41400000 0x20000>;
 		power-domains = <&k3_pds 283 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		mcu_r5fss0_core0: r5f@41000000 {
 			compatible = "ti,j721s2-r5f";
@@ -704,6 +705,7 @@ mcu_r5fss0_core0: r5f@41000000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		mcu_r5fss0_core1: r5f@41400000 {
@@ -719,6 +721,7 @@ mcu_r5fss0_core1: r5f@41400000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index a9dbe14fb0c9..f252007262d3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -572,24 +572,32 @@ mbox_c71_1: mbox-c71-1 {
 	};
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss1 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -621,24 +629,28 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	status = "okay";
 };
 
 &c71_0 {
-- 
2.34.1


