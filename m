Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66807CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L0RZjjh4AWa9ANLwiQ5lj+1d3o5izAz/z+vBhd22hM=; b=oeYEGsnkVHc6t9yd4ijS3gV+Y5
	rAy8wbnhTUFa90DYKeAN/vS2UXpvSvxO6eaCRC2Npu+jlmaIXnfU9brJFiFpepqwhW8OeK5CvAW2+
	3ugFLudXDmn5x9hBbgmtQAat+ECw+i4V9qhTl4amAkf3K1DJfYmprX+qy9SS8AKPzIJG/2KNQUmuB
	29exB6tyHf1z1Gt0drFV8KFxbwF81LAyaPpEJLHV+KD11wUmTVum6RaBzAMb493I9aC7OrrmSHsg+
	3syPj9OOl+K5rhTjEMkRe5y5qR9MDKyvEQYGQCMwkKkQyywMWP7LpYrVKcqT2OsWDWBsM5YKBRxpj
	wB00dDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuPIp-0000000H5j8-0SqV;
	Fri, 05 Sep 2025 05:48:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOr5-0000000Gwg9-0jTt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:19:24 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5855JK5h3637178;
	Fri, 5 Sep 2025 00:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757049560;
	bh=5L0RZjjh4AWa9ANLwiQ5lj+1d3o5izAz/z+vBhd22hM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=omX2bvQp+9Xa8YdRzsVw3DBduzWgog+0XpkNm72RT7MHCXX7PnF0RkSllyRPLnX+w
	 lVlKpAQMDqpxtitrfyJRohyww3efNgR2V1IrstLsdEKd4WDPqmIpgl1nCfDkS9YvNl
	 efFC0aN/W+4YJGooaLEIDuc2HZOQqT91aF/cr4Yg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5855JKD4688598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 5 Sep 2025 00:19:20 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 5
 Sep 2025 00:19:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 00:19:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5855IoiY220581;
	Fri, 5 Sep 2025 00:19:16 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 05/33] arm64: dts: ti: k3-am62p-j722s: Enable remote processors at board level
Date: Fri, 5 Sep 2025 10:48:18 +0530
Message-ID: <20250905051846.1189612-6-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905051846.1189612-1-b-padhi@ti.com>
References: <20250905051846.1189612-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_221923_300173_C876BC9A 
X-CRM114-Status: GOOD (  10.60  )
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

Remote Processors defined in top-level AM62P-J722S common SoC dtsi
files are incomplete without the memory carveouts and mailbox
assignments which are only known at board integration level.

Therefore, disable the remote processors at SoC level and enable them at
board level where above information is available.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
---
v3: Changelog:
1. Carried A/B and T/B tags.

Link to v2:
https://lore.kernel.org/all/20250823160901.2177841-6-b-padhi@ti.com/

v2: Changelog:
1. Re-ordered patch from [PATCH 13/33] to [PATCH v2 05/33].

Link to v1:
https://lore.kernel.org/all/20250814223839.3256046-14-b-padhi@ti.com/

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi    | 1 +
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts                  | 2 ++
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts           | 3 +++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                  | 3 +++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi                | 1 +
 6 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index bd6a00d13aea..5288c959f3c1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -205,6 +205,7 @@ mcu_r5fss0_core0: r5f@79000000 {
 			ti,atcm-enable = <0>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <0>;
+			status = "disabled";
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
index 6757b37a9de3..8612b45e665c 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi
@@ -136,6 +136,7 @@ wkup_r5fss0_core0: r5f@78000000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 899da7896563..2755598fd1f5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -725,6 +725,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0 {
@@ -735,6 +736,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_uart0 {
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index bf9b23df1da2..b329e4cb0c37 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -515,6 +515,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0 {
@@ -525,6 +526,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0 {
@@ -535,6 +537,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &c7x_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 9d8abfa9afd2..2b9e007432a9 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -850,6 +850,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &mcu_r5fss0 {
@@ -860,6 +861,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &main_r5fss0 {
@@ -870,6 +872,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	status = "okay";
 };
 
 &c7x_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 993828872dfb..d57fdd38bdce 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -368,6 +368,7 @@ main_r5fss0_core0: r5f@78400000 {
 			ti,atcm-enable = <1>;
 			ti,btcm-enable = <1>;
 			ti,loczrama = <1>;
+			status = "disabled";
 		};
 	};
 
-- 
2.34.1


