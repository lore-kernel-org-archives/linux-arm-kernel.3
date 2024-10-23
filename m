Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8593CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csUKGiVK2HsvgfvRBbrDSKbQ6Dfvy+AyewZWb+pdrcs=; b=IMGwONUEAyalShb1uTrg6dOOM0
	ds2svNRi3qI2IUc5w40PK1RHKtxfwsIYQ3MAjkoZ9IDlFpolWIkcNvdV4m5lWLeID3x4ORBt26eme
	1luFyAY434BsOfBo14vAXOJK9oaT1T7hA30IBkanqsew7/QTwZaMGAx4l8ioU/juLnfQq0gZbS3Lk
	REy2jiuMeQRtdqhcKodw3RLzkOsRo0D1qh/WLIkJ4No0m4RhSCvuy2SEKjcXzDWMIbVGZ/B8SwA+5
	b6Ukd6CMIExUM1vothb5HjgVJ63zCTetFF7Q8BxiHuhD4og8tr3hBGUmNE7HiT57verw4pDy5wio+
	KT+rohLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpA-0000000EBsq-464X;
	Wed, 23 Oct 2024 11:46:49 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YsD-0000000E1wG-40qs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:45:56 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjpvk090794;
	Wed, 23 Oct 2024 05:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729680351;
	bh=csUKGiVK2HsvgfvRBbrDSKbQ6Dfvy+AyewZWb+pdrcs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UDBVanBxW++zMmwZNOnRg09m/rZIJwhtCyoMLvn3F6+ElxBxwydizd40eEFLH2kIT
	 RAUofV2KvLZ3Uc0gNyZNAYl4aKompXItPpagnAmi1j0ywNxm1psBEGpjDkEjN9Nl6N
	 MXCpj4WlH+u1bNdz86PpSidE59zGvNYN70Y1peYc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NAjpNw031274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 05:45:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 05:45:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 05:45:50 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjW1v014331;
	Wed, 23 Oct 2024 05:45:47 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH 4/4] arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
Date: Wed, 23 Oct 2024 16:15:32 +0530
Message-ID: <20241023104532.3438851-5-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023104532.3438851-1-a-dutta@ti.com>
References: <20241023104532.3438851-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034554_159527_A2BE55E1 
X-CRM114-Status: GOOD (  10.46  )
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

The clock IDs for multiple MCSPI instances across wakeup domain
in J784s4 are incorrect when compared with documentation [1]. Fix
the clock IDs to their appropriate values.

[1]https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html

Fixes: e23d5a3d116d ("arm64: dts: ti: k3-j784s4: Add MCSPI nodes")

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index e73bb750b09a..5c5398990514 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -2141,7 +2141,7 @@ main_spi0: spi@2100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 376 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 376 1>;
+		clocks = <&k3_clks 376 0>;
 		status = "disabled";
 	};
 
@@ -2152,7 +2152,7 @@ main_spi1: spi@2110000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 377 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 377 1>;
+		clocks = <&k3_clks 377 0>;
 		status = "disabled";
 	};
 
@@ -2163,7 +2163,7 @@ main_spi2: spi@2120000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 378 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 378 1>;
+		clocks = <&k3_clks 378 0>;
 		status = "disabled";
 	};
 
@@ -2174,7 +2174,7 @@ main_spi3: spi@2130000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 379 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 379 1>;
+		clocks = <&k3_clks 379 0>;
 		status = "disabled";
 	};
 
@@ -2185,7 +2185,7 @@ main_spi4: spi@2140000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 380 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 380 1>;
+		clocks = <&k3_clks 380 0>;
 		status = "disabled";
 	};
 
@@ -2196,7 +2196,7 @@ main_spi5: spi@2150000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 381 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 381 1>;
+		clocks = <&k3_clks 381 0>;
 		status = "disabled";
 	};
 
@@ -2207,7 +2207,7 @@ main_spi6: spi@2160000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 382 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 382 1>;
+		clocks = <&k3_clks 382 0>;
 		status = "disabled";
 	};
 
@@ -2218,7 +2218,7 @@ main_spi7: spi@2170000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 383 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 383 1>;
+		clocks = <&k3_clks 383 0>;
 		status = "disabled";
 	};
 
-- 
2.34.1


