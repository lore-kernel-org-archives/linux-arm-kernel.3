Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F9C02192
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 01:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIkyzSXSV2B6RBXeelSB15KaPmkEXOdtzbQYPoGRhV8=; b=oJr1RKgwTUhiIgpVoWB99W6o0g
	3EJAL8FAZ0blGl/IfqrZAWyeq4XLpS2VKUm/0Al551ylZHUaCZdetpeS9LFS9QLtZnHcExYrOi2eF
	kn4Y8cnIqOgJ+DI+ovswzSHICfjzqtqJClU7L1k1wTOjuzExwawg7myeAOzUiM6yCZOiAyDjJgkam
	WTR23CkQi3jb0rZB7TswLyg4jMGqIFubf1dAm0NEaKtaxUhSQmcgQWnSe8QKe2f/Loe0Uwhp19E3+
	5Txveeizg2UMas99PV39VbLLNCWItKQG0EJJvNHZHsySwMhoFBG3y2xFhswLjX6hOH8EXbU4InF9X
	V/z7k79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7ho-0000000H3cV-2krZ;
	Tue, 04 Feb 2025 01:26:24 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf7YW-0000000H1Y7-0Xnh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 01:16:49 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5141GhcW2302348
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Feb 2025 19:16:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738631803;
	bh=bIkyzSXSV2B6RBXeelSB15KaPmkEXOdtzbQYPoGRhV8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zGFsO0bohsedtABLEJ+XLT9NP7w1dgYHIbcAxkUeigi1qqom5ZtJBZhaCe9lCHdAu
	 07ZCQb4zZ0p7sydbkyeww26fDjadQzHt3o2f01M5C6uS6YcrKt/HCEfo1DaibUNhwZ
	 RBD8puXpl5ucwPsWnTCYKrxsPVKzdKpTlklS1iRQ=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5141Gh7h016770
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Feb 2025 19:16:43 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Feb 2025 19:16:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Feb 2025 19:16:42 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5141GfAV024451;
	Mon, 3 Feb 2025 19:16:42 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>,
        Hari Nagalla
	<hnagalla@ti.com>
Subject: [PATCH v3 7/9] arm64: dts: ti: k3-am62x-sk-common: Enable IPC with remote processors
Date: Mon, 3 Feb 2025 19:16:39 -0600
Message-ID: <20250204011641.1523561-8-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250204011641.1523561-1-jm@ti.com>
References: <20250204011641.1523561-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_171648_287868_6CE22261 
X-CRM114-Status: GOOD (  12.76  )
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

From: Hari Nagalla <hnagalla@ti.com>

For each remote proc, reserve memory for IPC and bind the mailbox
assignments. Two memory regions are reserved for each remote processor.
The first region of 1MB of memory is used for Vring shared buffers
and the second region is used as external memory to the remote processor
for the resource table and for tracebuffer allocations.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Fix memory carvout sizes, remove leading zeros
- Reorder memory carveouts according to memory location
- Fix whitespace issues
- Fix commit headers, capitalize IPC
---
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 32 ++++++++++++++++---
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 2f129e8cd5b9f..9ea4de9303f51 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -68,6 +68,18 @@ mcu_m4fss_memory_region: m4f-memory@9cc00000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9da00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9da00000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_memory_region: r5f-memory@9db00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9db00000 0x00 0xc00000>;
+			no-map;
+		};
+
 		secure_tfa_ddr: tfa@9e780000 {
 			reg = <0x00 0x9e780000 0x00 0x80000>;
 			alignment = <0x1000>;
@@ -80,11 +92,6 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9db00000 {
-			compatible = "shared-dma-pool";
-			reg = <0x00 0x9db00000 0x00 0xc00000>;
-			no-map;
-		};
 	};
 
 	leds {
@@ -478,6 +485,11 @@ mbox_m4_0: mbox-m4-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_r5_0: mbox-r5-0 {
+		ti,mbox-rx = <2 0 0>;
+		ti,mbox-tx = <3 0 0>;
+	};
 };
 
 &mcu_m4fss {
@@ -487,6 +499,16 @@ &mcu_m4fss {
 	status = "okay";
 };
 
+&wkup_r5fss0 {
+	status = "okay";
+};
+
+&wkup_r5fss0_core0 {
+	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};
+
 &usbss0 {
 	bootph-all;
 	status = "okay";
-- 
2.48.0


