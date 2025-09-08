Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9973CCAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXRd9cNajXgMoXFnQ8H+Mp9quCpzNS7bOq38PRnGCFA=; b=26m6wNW21lM8hTiMqFU4u8YNzf
	boH/MQcNsu7PnLyjkYGOjwBDGfRAm9tsZ6vmtlMgwNgNE3ytaqA/r5dR/Vaun4X+5uF2eNNc6Z2Wz
	6DCVOSBjk/WTuc6YgQQigqag8Xe6s5Lddqypn89hzQyU3z+tlRc9HXVaSoq+PmkXYNrCm5/W6gAUS
	iYLRskF3M/MsEW8+FKb3KMkUwR+6vgqDXF6Gt4CgZ3CUt42XogofHddDPtzg5QudV94Zd1MsYzlX7
	MIfiiYPSrtHpZPkMr362RxuzfsvxQoZ7YWcYztNDwOfI2LtHTCjvOeQmfmIVsyNFOyzcvtPnj2P3Q
	G2Z4upnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlek-000000033EH-1AFd;
	Mon, 08 Sep 2025 23:52:18 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfp5-00000001G1O-2dbO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:38:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588HcVv13916327;
	Mon, 8 Sep 2025 12:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757353112;
	bh=BXRd9cNajXgMoXFnQ8H+Mp9quCpzNS7bOq38PRnGCFA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=naIkQAf/a2+zDLCEwuJ3VGpzUF+Mh81yb7+BtFxDtLFaqlDDi6SuejZmM1qcmpU6d
	 JcohdWI3KftukvgUwlmsPYnzFR2Dg1YFwwK+zQL4MJltFJYm6/OjXPOEZkGh4hoS8x
	 sxH8taLaZZ/JN13VCbBfLHIoy7qN/6LEgcYbKIhw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588HcVKf3122914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 12:38:31 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 12:38:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 12:38:31 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588HcVVo1281123;
	Mon, 8 Sep 2025 12:38:31 -0500
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
Subject: [PATCH v2 1/2] arm64: dts: ti: k3-am62p/j722s: Remove HS400 support from common
Date: Mon, 8 Sep 2025 12:38:30 -0500
Message-ID: <20250908173831.269039-2-jm@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908173831.269039-1-jm@ti.com>
References: <20250908173831.269039-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_103835_753794_450FFA7C 
X-CRM114-Status: GOOD (  10.12  )
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

Since eMMC HS400 has been descoped for J722s due to errata i2478 [0]
and is supported for AM62Px device, remove eMMC HS400 support from
common-main.dtsi and include only in am62p-main.dtsi.

[0] https://www.ti.com/lit/pdf/sprz575
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 3 ---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi              | 6 ++++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 4427b12058a6..0c05bcf1d776 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -576,15 +576,12 @@ sdhci0: mmc@fa10000 {
 		bus-width = <8>;
 		mmc-ddr-1_8v;
 		mmc-hs200-1_8v;
-		mmc-hs400-1_8v;
 		ti,clkbuf-sel = <0x7>;
-		ti,strobe-sel = <0x77>;
 		ti,trm-icp = <0x8>;
 		ti,otap-del-sel-legacy = <0x1>;
 		ti,otap-del-sel-mmc-hs = <0x1>;
 		ti,otap-del-sel-ddr52 = <0x6>;
 		ti,otap-del-sel-hs200 = <0x8>;
-		ti,otap-del-sel-hs400 = <0x5>;
 		ti,itap-del-sel-legacy = <0x10>;
 		ti,itap-del-sel-mmc-hs = <0xa>;
 		ti,itap-del-sel-ddr52 = <0x3>;
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 6aea9d3f134e..90afe21e972b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -31,6 +31,12 @@ usb1: usb@31100000 {
 			snps,usb2-lpm-disable;
 		};
 	};
+
+	sdhci0: mmc@fa10000 {
+		mmc-hs400-1_8v;
+		ti,strobe-sel = <0x77>;
+		ti,otap-del-sel-hs400 = <0x5>;
+	};
 };
 
 &oc_sram {
-- 
2.51.0


