Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2608ACAC585
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYmqmDcavZhbioQhWBZ1l9KsdHUtq0/7Xk+DnYj/bRA=; b=IbZUOS1LYS2KGm0xHkgtKQ7CpD
	hwn+umkWZJnZLO24YnXLE5qVjvpbhRXHuF7BF1T5Of2B0T2yeTgVn0hGogTPww+QaKKqU72WvaBIX
	YnjUyVEcUNhCcZpgzA5TyBDFX1m9WRau46bKNFrinmSuSv9rklfttPt9wOXoaxPSbRrLRQlr8m9gx
	LuORmVA6WugJxZDPdn7eLTKx6zLmp8E+PrJEBs8cIk0UwhMO2XOrWFXdlqD0HbSjfwI9i1moLER0C
	iVpS478lparfnkkTRnibY4xV0uYd/9ssdhnHJyEJ2pfFbjYmYAddD9n9zSAoKZdF1ZLhuLvmUJ9+r
	NKqRsEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfPF-000000015rw-2fac;
	Mon, 08 Sep 2025 17:11:53 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcrp-000000006jq-0NpA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:29:14 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588ETAbI3883021;
	Mon, 8 Sep 2025 09:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757341750;
	bh=oYmqmDcavZhbioQhWBZ1l9KsdHUtq0/7Xk+DnYj/bRA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Q8ONq12qBhGDCbSQ/e6DoSqWBjqOt1j5G5jsLGeNBD+C8oIJ7zE1zVVp22vAGh37k
	 m8ajdsPGPmoO2MCZ5Rv3kJ62VPRsXJCALO5zojydfPpzgH8D3rCqUiznHL1kJbzgc+
	 +arPW5LAXqtmUsYxOas7vcIcHb8NwELTK2LFjFGU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588ETA0T3063556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 09:29:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 09:29:10 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 09:29:10 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588ESecg1037553;
	Mon, 8 Sep 2025 09:29:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <d-gole@ti.com>, <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 04/34] arm64: dts: ti: k3-j784s4-j742s2: Enable remote processors at board level
Date: Mon, 8 Sep 2025 19:57:56 +0530
Message-ID: <20250908142826.1828676-5-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908142826.1828676-1-b-padhi@ti.com>
References: <20250908142826.1828676-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_072913_219855_40416642 
X-CRM114-Status: GOOD (  11.46  )
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

Remote Processors defined in top-level J784S4-J742S2 common SoC dtsi
files are incomplete without the memory carveouts and mailbox
assignments which are only known at board integration level.

Therefore, disable the remote processors at SoC level and enable them at
board level where above information is available.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
---
v4: Changelog:
1. None

Link to v3:
https://lore.kernel.org/all/20250905051846.1189612-5-b-padhi@ti.com/

v3: Changelog:
1. Carried A/B tag.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-5-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 10/33] to [PATCH v2 04/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-11-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am69-sk.dts             | 15 +++++++++++++++
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi  |  7 +++++++
 .../boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi |  9 +++++++++
 .../ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi    |  3 +++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f4f7b89bf0d2..af8eafc3f54a 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -992,24 +992,32 @@ &mcu_cpsw_port1 {
 	bootph-all;
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
@@ -1055,42 +1063,49 @@ &main_timer9 {
 
 &main_r5fss2 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss0_core0 {
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
 
 &main_r5fss2_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
 	memory-region = <&main_r5fss2_core0_dma_memory_region>,
 			<&main_r5fss2_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss2_core1 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
 	memory-region = <&main_r5fss2_core1_dma_memory_region>,
 			<&main_r5fss2_core1_memory_region>;
+	status = "okay";
 };
 
 &c71_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index 6afa802544e9..c269e5b29b96 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -1154,6 +1154,10 @@ mbox_c71_2: mbox-c71-2 {
 	};
 };
 
+&mcu_r5fss0 {
+	status = "okay";
+};
+
 &mcu_r5fss0_core0 {
 	status = "okay";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
@@ -1170,14 +1174,17 @@ &mcu_r5fss0_core1 {
 
 &main_r5fss0 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss1 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 &main_r5fss2 {
 	ti,cluster-mode = <0>;
+	status = "okay";
 };
 
 /* Timers are used by Remoteproc firmware */
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index fbbe768e7a30..9cc0901d58fb 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2174,6 +2174,7 @@ main_r5fss0: r5fss@5c00000 {
 		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
 			 <0x5d00000 0x00 0x5d00000 0x20000>;
 		power-domains = <&k3_pds 336 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		main_r5fss0_core0: r5f@5c00000 {
 			compatible = "ti,j721s2-r5f";
@@ -2188,6 +2189,7 @@ main_r5fss0_core0: r5f@5c00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		main_r5fss0_core1: r5f@5d00000 {
@@ -2203,6 +2205,7 @@ main_r5fss0_core1: r5f@5d00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
@@ -2214,6 +2217,7 @@ main_r5fss1: r5fss@5e00000 {
 		ranges = <0x5e00000 0x00 0x5e00000 0x20000>,
 			 <0x5f00000 0x00 0x5f00000 0x20000>;
 		power-domains = <&k3_pds 337 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		main_r5fss1_core0: r5f@5e00000 {
 			compatible = "ti,j721s2-r5f";
@@ -2228,6 +2232,7 @@ main_r5fss1_core0: r5f@5e00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		main_r5fss1_core1: r5f@5f00000 {
@@ -2243,6 +2248,7 @@ main_r5fss1_core1: r5f@5f00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
@@ -2254,6 +2260,7 @@ main_r5fss2: r5fss@5900000 {
 		ranges = <0x5900000 0x00 0x5900000 0x20000>,
 			 <0x5a00000 0x00 0x5a00000 0x20000>;
 		power-domains = <&k3_pds 338 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		main_r5fss2_core0: r5f@5900000 {
 			compatible = "ti,j721s2-r5f";
@@ -2268,6 +2275,7 @@ main_r5fss2_core0: r5f@5900000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		main_r5fss2_core1: r5f@5a00000 {
@@ -2283,6 +2291,7 @@ main_r5fss2_core1: r5f@5a00000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
index 52e2965a3bf5..cc22bfb5f599 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
@@ -595,6 +595,7 @@ mcu_r5fss0: r5fss@41000000 {
 		ranges = <0x41000000 0x00 0x41000000 0x20000>,
 			 <0x41400000 0x00 0x41400000 0x20000>;
 		power-domains = <&k3_pds 345 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
 
 		mcu_r5fss0_core0: r5f@41000000 {
 			compatible = "ti,j721s2-r5f";
@@ -609,6 +610,7 @@ mcu_r5fss0_core0: r5f@41000000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 
 		mcu_r5fss0_core1: r5f@41400000 {
@@ -624,6 +626,7 @@ mcu_r5fss0_core1: r5f@41400000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
-- 
2.34.1


