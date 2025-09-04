Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD9ACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rexbZq37ojm1gWgYILbmLhzidPbLhbryKWFIZQaYdpU=; b=XjdwZbPz4tNkY7gCJhFfieYBO5
	v5Y6VVF7BxES9GQv+6LWsCC8+P8jeUxxBrMfyaiZy4F/QyyMBoBBgOTuYsn2Ha9Kc5O/CJQiQ0Njo
	6b2Cw4i9PPVWQF8K2zcMsbHZccWk2aAohj56F6qTT8/AX+lkv47lZVgK7LnA5861K/sG8Sj2Y09Cj
	iDrvYr3YuR0U11N0lXe77VNDzrouv0Tqf931qikQdFca8IXUiELScHWzyQZMLJ6vJW6Sg26POyLXZ
	SGqgAygg3Kevni9+bckBQSKrI1h3wQxAaoao0lMmavJ7X/DW4P9VQjAcPako5sE79G/TdSBs/hmYe
	hlQmow9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bp-00000008fSR-0CRk;
	Thu, 04 Sep 2025 03:26:01 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty8O-000000080o9-1S0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:47:29 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5840lOOW3349406;
	Wed, 3 Sep 2025 19:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756946844;
	bh=rexbZq37ojm1gWgYILbmLhzidPbLhbryKWFIZQaYdpU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bGYZ3vJMnT630Vnx1nX3daMbYnOH4RnN0pfJMhRpPyc/BpXIqXMjWG6/RWvTaC7iv
	 B6G6+NoAwf5/ocbDSmgXXUT0ORHFW87ijJgMLIaRJcl9mgRi3r+iSBAumGDP9M+JTl
	 Y21QLQ8ijLoPbIgFtzJ5vLZxERkw1mvuy24GctL8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5840lOjp3984944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 19:47:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 19:47:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 19:47:24 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5840lNZK2425599;
	Wed, 3 Sep 2025 19:47:23 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] arm64: dts: ti: k3-am62p/j722s: Move sdhci0 from common
Date: Wed, 3 Sep 2025 19:47:22 -0500
Message-ID: <20250904004723.2856005-2-jm@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904004723.2856005-1-jm@ti.com>
References: <20250904004723.2856005-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174728_471348_E3FC26FE 
X-CRM114-Status: GOOD (  10.62  )
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

Since eMMC HS400 has been descoped for j722s due to errata i2478 [0]
and is supported for am62p SR1.2 device, remove sdhci0 node from
common-main.dtsi and include instead in each device's main.dtsi
appropriately.

[0] https://www.ti.com/lit/pdf/sprz575
Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../dts/ti/k3-am62p-j722s-common-main.dtsi    | 25 -------------------
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi     | 25 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi     | 22 ++++++++++++++++
 3 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 4427b12058a6..84083f5125df 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -566,31 +566,6 @@ main_gpio1: gpio@601000 {
 		clock-names = "gpio";
 	};
 
-	sdhci0: mmc@fa10000 {
-		compatible = "ti,am64-sdhci-8bit";
-		reg = <0x00 0x0fa10000 0x00 0x1000>, <0x00 0x0fa18000 0x00 0x400>;
-		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
-		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
-		clock-names = "clk_ahb", "clk_xin";
-		bus-width = <8>;
-		mmc-ddr-1_8v;
-		mmc-hs200-1_8v;
-		mmc-hs400-1_8v;
-		ti,clkbuf-sel = <0x7>;
-		ti,strobe-sel = <0x77>;
-		ti,trm-icp = <0x8>;
-		ti,otap-del-sel-legacy = <0x1>;
-		ti,otap-del-sel-mmc-hs = <0x1>;
-		ti,otap-del-sel-ddr52 = <0x6>;
-		ti,otap-del-sel-hs200 = <0x8>;
-		ti,otap-del-sel-hs400 = <0x5>;
-		ti,itap-del-sel-legacy = <0x10>;
-		ti,itap-del-sel-mmc-hs = <0xa>;
-		ti,itap-del-sel-ddr52 = <0x3>;
-		status = "disabled";
-	};
-
 	sdhci1: mmc@fa00000 {
 		compatible = "ti,am62-sdhci";
 		reg = <0x00 0x0fa00000 0x00 0x1000>, <0x00 0x0fa08000 0x00 0x400>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 6aea9d3f134e..fb8473ce403a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -31,6 +31,31 @@ usb1: usb@31100000 {
 			snps,usb2-lpm-disable;
 		};
 	};
+
+	sdhci0: mmc@fa10000 {
+		compatible = "ti,am64-sdhci-8bit";
+		reg = <0x00 0x0fa10000 0x00 0x1000>, <0x00 0x0fa18000 0x00 0x400>;
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
+		clock-names = "clk_ahb", "clk_xin";
+		bus-width = <8>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		mmc-hs400-1_8v;
+		ti,clkbuf-sel = <0x7>;
+		ti,strobe-sel = <0x77>;
+		ti,trm-icp = <0x8>;
+		ti,otap-del-sel-legacy = <0x1>;
+		ti,otap-del-sel-mmc-hs = <0x1>;
+		ti,otap-del-sel-ddr52 = <0x6>;
+		ti,otap-del-sel-hs200 = <0x8>;
+		ti,otap-del-sel-hs400 = <0x5>;
+		ti,itap-del-sel-legacy = <0x10>;
+		ti,itap-del-sel-mmc-hs = <0xa>;
+		ti,itap-del-sel-ddr52 = <0x3>;
+		status = "disabled";
+	};
 };
 
 &oc_sram {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 993828872dfb..2978fe1a151e 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -404,6 +404,28 @@ e5010: jpeg-encoder@fd20000 {
 		power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	sdhci0: mmc@fa10000 {
+		compatible = "ti,am64-sdhci-8bit";
+		reg = <0x00 0x0fa10000 0x00 0x1000>, <0x00 0x0fa18000 0x00 0x400>;
+		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 57 1>, <&k3_clks 57 2>;
+		clock-names = "clk_ahb", "clk_xin";
+		bus-width = <8>;
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
+		ti,clkbuf-sel = <0x7>;
+		ti,trm-icp = <0x8>;
+		ti,otap-del-sel-legacy = <0x1>;
+		ti,otap-del-sel-mmc-hs = <0x1>;
+		ti,otap-del-sel-ddr52 = <0x6>;
+		ti,otap-del-sel-hs200 = <0x8>;
+		ti,itap-del-sel-legacy = <0x10>;
+		ti,itap-del-sel-mmc-hs = <0xa>;
+		ti,itap-del-sel-ddr52 = <0x3>;
+		status = "disabled";
+	};
 };
 
 &main_bcdma_csi {
-- 
2.51.0


