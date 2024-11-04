Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D11BD132B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qWe9yZVKp9lQnh1EpUy8j2D7QQ0wdm66TmKhai599sk=; b=i0Ht+NZbKJ6HbNrKIMhYa6ylxH
	3p+A1zr0yKhrlyO1/dYTsqn+bloOzhf5jvDmMdsvJHyWjbmHDbfoLzfuTN81UOqP3xrlQ48tZljfR
	JfxpPPF+71lR4a8UaZ3yuzExzhG0yTHSMBWG11TRkMnf8nhb+x17+GpEyDYge/4eqEZ0Ndz9gRfhv
	ySkGUp8f1B/fChKiGCUxiCQEooeDgv7iwBsH2Obrc7Xy2909692F7BBscYCXarpPBh9KwhCkrFBC7
	+hWcxGLwp1J389mE9gm0/McEuSz12U1ykpz0ZXzRKVQaOcnW04lU/o48iPWDftDwpYDhpUpT6s65u
	Snv07vCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7w6X-0000000DgZw-0zvI;
	Mon, 04 Nov 2024 12:22:45 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vwx-0000000Des1-3fEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:13:03 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A4CCk5Q009117;
	Mon, 4 Nov 2024 06:12:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730722366;
	bh=qWe9yZVKp9lQnh1EpUy8j2D7QQ0wdm66TmKhai599sk=;
	h=From:To:CC:Subject:Date;
	b=UDfMoCJTV+OGWMHtkPnHWN9EQM+kivRS0GVX96oRPdV51uw3MbS0mQV7aMqc+cQ3w
	 Bj2FRHFLDF2TiqyuBK10uutjHXwjvPA4V9X2ntKwYxGN+h7pLK/gyhHfU7ifa9Y3r6
	 0DOpvYVYEsFOf/T5/IDWRjPLOssmmnEvucN57lEE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A4CCkk1023279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Nov 2024 06:12:46 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 4
 Nov 2024 06:12:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 4 Nov 2024 06:12:45 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.68.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A4CCfqu002463;
	Mon, 4 Nov 2024 06:12:42 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <j-keerthy@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances
Date: Mon, 4 Nov 2024 17:42:41 +0530
Message-ID: <20241104121241.102027-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_041252_219732_5E7D5695 
X-CRM114-Status: GOOD (  11.80  )
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

Hi all,
The original series is : [1]. It is a series of 4 patches out of which the first 3
have already been applied to branch ti-k3-dts-next on [2]. However, the fourth patch 
[4/4] arm64: dts: ti: k3-j784s4: Fix clock IDs for MCSPI instances does not apply
cleanly because the changes should be in arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
and not in arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi.
  
v2: Changelog:
- Changed the clock IDs in arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi instead of
arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi

Link to v1: https://lore.kernel.org/all/20241023104532.3438851-5-a-dutta@ti.com/

[1] https://lore.kernel.org/all/20241023104532.3438851-1-a-dutta@ti.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
 
.../dts/ti/k3-j784s4-j742s2-main-common.dtsi     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 7721852c1f68..f27f7ae51479 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2040,7 +2040,7 @@ main_spi0: spi@2100000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 376 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 376 1>;
+		clocks = <&k3_clks 376 0>;
 		status = "disabled";
 	};
 
@@ -2051,7 +2051,7 @@ main_spi1: spi@2110000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 377 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 377 1>;
+		clocks = <&k3_clks 377 0>;
 		status = "disabled";
 	};
 
@@ -2062,7 +2062,7 @@ main_spi2: spi@2120000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 378 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 378 1>;
+		clocks = <&k3_clks 378 0>;
 		status = "disabled";
 	};
 
@@ -2073,7 +2073,7 @@ main_spi3: spi@2130000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 379 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 379 1>;
+		clocks = <&k3_clks 379 0>;
 		status = "disabled";
 	};
 
@@ -2084,7 +2084,7 @@ main_spi4: spi@2140000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 380 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 380 1>;
+		clocks = <&k3_clks 380 0>;
 		status = "disabled";
 	};
 
@@ -2095,7 +2095,7 @@ main_spi5: spi@2150000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 381 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 381 1>;
+		clocks = <&k3_clks 381 0>;
 		status = "disabled";
 	};
 
@@ -2106,7 +2106,7 @@ main_spi6: spi@2160000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 382 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 382 1>;
+		clocks = <&k3_clks 382 0>;
 		status = "disabled";
 	};
 
@@ -2117,7 +2117,7 @@ main_spi7: spi@2170000 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		power-domains = <&k3_pds 383 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 383 1>;
+		clocks = <&k3_clks 383 0>;
 		status = "disabled";
 	};
 
-- 
2.34.1


