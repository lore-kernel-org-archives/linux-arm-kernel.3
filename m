Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D87CDDE64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8XkaaTwVn1pEtca7T5QpBmMyz/VvqvE0668l+CnlLk=; b=pszypx4ohIBOMhvcMS97zs0wsO
	rkiTWf69NNrSBqRZeB+UYR2L34/1JFT43V0FcdB9KG49Yj7SIquzMA6QTIOECLNPxCeWS+vuhEZmx
	8C13luawwoUmyWgTcSPka5vicI/Jhq4I5yOOl8rKAxZZ3+p+LY0rJUPk76zjsmjYL6C6ynYh0PBDP
	++AfhiucJaZ+8lBHdUKKW2cH+DboTnBWU8bhFMKoLumBDrgCuNFYTYxuYPdAEBztv1H4pUZr3eWAy
	v2/GSlYMMnCMbSSqdGDn4m5Ard1MU1k7XKlo4E1YRszNUACX+9rCtxPfWslIvw12UEXEeQOjynj6n
	QEsxWluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z7k-0000000E4aP-1Vvi;
	Wed, 23 Oct 2024 11:01:56 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ys4-0000000E1sG-27lq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:45:46 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjeBB102038;
	Wed, 23 Oct 2024 05:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729680340;
	bh=g8XkaaTwVn1pEtca7T5QpBmMyz/VvqvE0668l+CnlLk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pSnSvYJ47q+HYXyrV+fazk6L51oO6WbCtDKNeLq5UKKA/2ZrV8UeJG58qKCxVBpxP
	 gCtf+6VTSqMIJA7eIEc43maX+o3VcA8mPO4i3Wb6/RQXx/TxUfyg2SM55a0UgKVHMK
	 MO8KSbHNTranwBCCm4lMo5BLUB91lr4g32TaxjUc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NAje0a031226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 05:45:40 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 05:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 05:45:39 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjW1s014331;
	Wed, 23 Oct 2024 05:45:37 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH 1/4] arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI instances
Date: Wed, 23 Oct 2024 16:15:29 +0530
Message-ID: <20241023104532.3438851-2-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023104532.3438851-1-a-dutta@ti.com>
References: <20241023104532.3438851-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034544_658835_31DD38BA 
X-CRM114-Status: GOOD (  11.34  )
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

The clock IDs for multiple MCSPI instances across wakeup as
well as main domain in J7200 are incorrect when compared with
documentation [1]. This results in kernel crashes when the said
instances are enabled. Fix the clock ids to their appropriate
values.

[1]https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j7200/clocks.html

Fixes: 8f6c475f4ca7 ("arm64: dts: ti: k3-j7200: Add MCSPI nodes")

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi       | 16 ++++++++--------
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
index 9386bf3ef9f6..ee953c0bf11f 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-main.dtsi
@@ -1145,7 +1145,7 @@ main_spi0: spi@2100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 266 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 266 1>;
+		clocks = <&k3_clks 266 4>;
 		status = "disabled";
 	};
 
@@ -1156,7 +1156,7 @@ main_spi1: spi@2110000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 267 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 267 1>;
+		clocks = <&k3_clks 267 4>;
 		status = "disabled";
 	};
 
@@ -1167,7 +1167,7 @@ main_spi2: spi@2120000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 268 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 268 1>;
+		clocks = <&k3_clks 268 4>;
 		status = "disabled";
 	};
 
@@ -1178,7 +1178,7 @@ main_spi3: spi@2130000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 269 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 269 1>;
+		clocks = <&k3_clks 269 4>;
 		status = "disabled";
 	};
 
@@ -1189,7 +1189,7 @@ main_spi4: spi@2140000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 270 1>;
+		clocks = <&k3_clks 270 2>;
 		status = "disabled";
 	};
 
@@ -1200,7 +1200,7 @@ main_spi5: spi@2150000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 271 1>;
+		clocks = <&k3_clks 271 4>;
 		status = "disabled";
 	};
 
@@ -1211,7 +1211,7 @@ main_spi6: spi@2160000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 272 1>;
+		clocks = <&k3_clks 272 4>;
 		status = "disabled";
 	};
 
@@ -1222,7 +1222,7 @@ main_spi7: spi@2170000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 273 1>;
+		clocks = <&k3_clks 273 4>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
index 5097d192c2b2..b18b2f2deb96 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi
@@ -494,7 +494,7 @@ mcu_spi0: spi@40300000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 274 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 274 0>;
+		clocks = <&k3_clks 274 4>;
 		status = "disabled";
 	};
 
@@ -505,7 +505,7 @@ mcu_spi1: spi@40310000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 275 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 275 0>;
+		clocks = <&k3_clks 275 4>;
 		status = "disabled";
 	};
 
@@ -516,7 +516,7 @@ mcu_spi2: spi@40320000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 276 0>;
+		clocks = <&k3_clks 276 2>;
 		status = "disabled";
 	};
 
-- 
2.34.1


