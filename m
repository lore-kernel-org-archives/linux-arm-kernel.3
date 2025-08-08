Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A816C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN9F/Z8yVEbC9CdL7tswojoopNfT7T9SIHmCO89Cm2g=; b=iglczq08CwcekfqUYj/K7hrU/i
	41KitezRNcwHRVziLRUP+A1wC5HLgkri4L1KnPlAsiQZzCZa/BwkpahLrYLUPgFQaDXMxQG3xZV3g
	kzXID6ewxknikqHzkPBazb2EpX54QbPYoTwlUiGyOe0skRWJzQwuKmI4z8Yc63tNgLrtIzRf54jAf
	DtjTg4+NUXh87QfElRG00drLyVImkWD8aV/aCpD1jA46tvU3i8uqECa9T76UEPhZhquC0ycervllQ
	AwqcM89ytnb8iOgeHYLb1hkw6eae0K+c1Fv+gBzyO7ECqCgMV51ma8o2OSc8ao4qwbZsa3C6GyYkI
	JL18tLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJzE-00000002Wb3-1oWY;
	Fri, 08 Aug 2025 10:06:08 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJrs-00000002VZV-06M1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:58:33 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5789wS0P524181;
	Fri, 8 Aug 2025 04:58:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754647108;
	bh=DN9F/Z8yVEbC9CdL7tswojoopNfT7T9SIHmCO89Cm2g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=S23A5MpEuTcL+PUgS1rlAX9tI5plHKHE/hrAdhD264muagtfDQSyR9GNE7P6zGcC2
	 d6jQdcr265jcvGUijeqbizr5DP1g/+iD35ZoYYoWsQGUGnzsyjxU0xQ5JWzc1CTEup
	 kLlF4cZwUUTN/9poqFLU5Kiz+RmtO7jc48+E6NK8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5789wScu842054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 04:58:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 04:58:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 04:58:28 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5789wCOr2574818;
	Fri, 8 Aug 2025 04:58:24 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Jared McArthur <j-mcarthur@ti.com>
Subject: [PATCH V2 2/7] arm64: dts: ti: k3-j721e-main: Add interrupts property
Date: Fri, 8 Aug 2025 15:27:59 +0530
Message-ID: <20250808095804.544298-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808095804.544298-1-y-abhilashchandra@ti.com>
References: <20250808095804.544298-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025832_147704_E9C6A732 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Add interrupts property for CSI2RX. Interrupt IDs are taken from the
J721E TRM [0].

Interrupt Line    | Source Interrupt
------------------|-------------------------
GIC500_SPI_IN_185 | CSI_RX_IF0_CSI_ERR_IRQ_0
GIC500_SPI_IN_184 | CSI_RX_IF0_CSI_IRQ_0
GIC500_SPI_IN_189 | CSI_RX_IF1_CSI_ERR_IRQ_0
GIC500_SPI_IN_188 | CSI_RX_IF1_CSI_IRQ_0

[0]: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Reviewed-by: Jared McArthur <j-mcarthur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index 5bd0d36bf33e..ab3666ff4297 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -608,6 +608,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		cdns_csi2rx0: csi-bridge@4504000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x4504000 0x0 0x1000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
 				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
@@ -661,6 +664,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		cdns_csi2rx1: csi-bridge@4514000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x4514000 0x0 0x1000>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 27 2>, <&k3_clks 27 0>, <&k3_clks 27 2>,
 				 <&k3_clks 27 2>, <&k3_clks 27 3>, <&k3_clks 27 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-- 
2.34.1


