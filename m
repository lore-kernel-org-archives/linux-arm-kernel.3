Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDFFCDDE6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hBWX1Y33xzdpSsqxwD6CudWj4cUUDqJMHtctcCXvks=; b=yxiTLPkyUARnIAKD5DYva/BZFt
	c878Eirxjh4D9lqFioDIhbdnAO0J7P24KdlVnFgAB5V8x5R0zWS3pxxCuN4OlB31lUAZNrX1ffwzy
	VRu4Omr3rYcnfu8xDvLUNR8KepYm0MifTwy4LUsHwmeBpuLjIOtCFrcYN9DLfJ1bmh0QQIs9ce17B
	FnNwCOst3G/kskoMbVXhYZOIrnlaxs+93s0QtiSRgGWVlFcF5yv2ZfFV350mvq/0+jh4MJbdCyopw
	TRffsFw9e6rVXAksZSAj480lQtt9gruHL76kXqKiQqlYdkU/+Tvo/uMJaNuIGuGFOx+f7teTih/dL
	Je509I/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAi-0000000E4zv-3hwV;
	Wed, 23 Oct 2024 11:05:00 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YsA-0000000E1ua-3DRz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:45:52 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjlkJ117708;
	Wed, 23 Oct 2024 05:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729680347;
	bh=6hBWX1Y33xzdpSsqxwD6CudWj4cUUDqJMHtctcCXvks=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MzJ9nsfQyWCeOWsNpkPHGUwBGtArJjkDI7Q4rJbEFCpLgnb4tP0cFjxGM4b/MeZtQ
	 BXpsePLy2rNyqNcJnNvHu7hw2wRJzo2oa1HVWiusNfOO+u7XUh6OzjHDBf9g1DOAtH
	 bpDlwO+IJXDvgn0VrJTgLOzYnij/895JRObqTAnk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjl3A036410;
	Wed, 23 Oct 2024 05:45:47 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 05:45:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 05:45:47 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NAjW1u014331;
	Wed, 23 Oct 2024 05:45:44 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-j721s2: Fix clock IDs for MCSPI instances
Date: Wed, 23 Oct 2024 16:15:31 +0530
Message-ID: <20241023104532.3438851-4-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023104532.3438851-1-a-dutta@ti.com>
References: <20241023104532.3438851-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034550_932836_91B310C0 
X-CRM114-Status: GOOD (  10.56  )
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
in J721s2 are incorrect when compared with documentation [1]. Fix the
clock IDs to their appropriate values.

[1]https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html

Fixes: 04d7cb647b85 ("arm64: dts: ti: k3-j721s2: Add MCSPI nodes")

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi       | 16 ++++++++--------
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi |  6 +++---
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 9ed6949b40e9..fae534b5c8a4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -1708,7 +1708,7 @@ main_spi0: spi@2100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 339 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 339 1>;
+		clocks = <&k3_clks 339 2>;
 		status = "disabled";
 	};
 
@@ -1719,7 +1719,7 @@ main_spi1: spi@2110000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 340 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 340 1>;
+		clocks = <&k3_clks 340 2>;
 		status = "disabled";
 	};
 
@@ -1730,7 +1730,7 @@ main_spi2: spi@2120000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 341 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 341 1>;
+		clocks = <&k3_clks 341 2>;
 		status = "disabled";
 	};
 
@@ -1741,7 +1741,7 @@ main_spi3: spi@2130000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 342 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 342 1>;
+		clocks = <&k3_clks 342 2>;
 		status = "disabled";
 	};
 
@@ -1752,7 +1752,7 @@ main_spi4: spi@2140000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 343 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 343 1>;
+		clocks = <&k3_clks 343 2>;
 		status = "disabled";
 	};
 
@@ -1763,7 +1763,7 @@ main_spi5: spi@2150000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 344 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 344 1>;
+		clocks = <&k3_clks 344 2>;
 		status = "disabled";
 	};
 
@@ -1774,7 +1774,7 @@ main_spi6: spi@2160000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 345 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 345 1>;
+		clocks = <&k3_clks 345 2>;
 		status = "disabled";
 	};
 
@@ -1785,7 +1785,7 @@ main_spi7: spi@2170000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 346 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 346 1>;
+		clocks = <&k3_clks 346 2>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
index 9d96b19d0e7c..8232d308c23c 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
@@ -425,7 +425,7 @@ mcu_spi0: spi@40300000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 347 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 347 0>;
+		clocks = <&k3_clks 347 2>;
 		status = "disabled";
 	};
 
@@ -436,7 +436,7 @@ mcu_spi1: spi@40310000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 348 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 348 0>;
+		clocks = <&k3_clks 348 2>;
 		status = "disabled";
 	};
 
@@ -447,7 +447,7 @@ mcu_spi2: spi@40320000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 349 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 349 0>;
+		clocks = <&k3_clks 349 2>;
 		status = "disabled";
 	};
 
-- 
2.34.1


