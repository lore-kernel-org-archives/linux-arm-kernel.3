Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4881C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpauH2KcGfPHJQZZuVwPrws80Ch7C83LRFFZv9pZ8c4=; b=ompfMN8b3iPGOViQjFud5n4WSt
	TcVCfZgpyVCBF1do+jKrmhjKOKEE/lJBBdeR1Wt7W4VFilvhTaWAwPOIt/eZ1If61cXdrraO4IAt8
	5Obc5ZH7EeCuw2S7yPEpL5WkXNhip1NdxyIB1xLHMXBzbl+t+fyBKW+rUM7CM4FeX/Bg6MUsL7AAy
	aEKEO6PZKPKeIi0YbDeFW1ayMa4krySrAy0g+NwEbHZREksPz53P2iNXsbmrPXSSBCocW5k8K48vL
	9r12HzbwZa3hZzO43PvHgKit1ct/jHDqOTBW0lkPnqvHgKQ98jt47o4JD349LWxqpXOlvr1YH1sxU
	HgWvHtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukK1g-00000002Wlb-15Oj;
	Fri, 08 Aug 2025 10:08:40 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJrw-00000002Va1-0OfN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:58:37 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5789wXcA569354;
	Fri, 8 Aug 2025 04:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754647113;
	bh=tpauH2KcGfPHJQZZuVwPrws80Ch7C83LRFFZv9pZ8c4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mXaXDB4Exi0mpsJ+aC3zBsOpc816kIc7mZ8uDB7YBOfz/TB7S98FEDjEYgaJNPeSm
	 4UsUO9sw4595OEc65HJapcpenJfcFnJiudN6B+0Gz0uinDYZTEq4LgWL+GpN1IzvyR
	 Zonu9qDjyXICZxwWKOjTFA39ReO8iAZAwB52aOpg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5789wXdZ403641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 8 Aug 2025 04:58:33 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 8
 Aug 2025 04:58:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 8 Aug 2025 04:58:33 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5789wCOs2574818;
	Fri, 8 Aug 2025 04:58:29 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <y-abhilashchandra@ti.com>, Jared McArthur <j-mcarthur@ti.com>
Subject: [PATCH V2 3/7] arm64: dts: ti: k3-j784s4-j742s2-main-common: Add interrupts property
Date: Fri, 8 Aug 2025 15:28:00 +0530
Message-ID: <20250808095804.544298-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808095804.544298-1-y-abhilashchandra@ti.com>
References: <20250808095804.544298-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_025836_218375_6CE881F5 
X-CRM114-Status: UNSURE (   8.35  )
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
J784S4 TRM [0].

Interrupt Line      | Source Interrupt
--------------------|-------------------------
GIC500SS_SPI_IN_185 | CSI_RX_IF0_CSI_ERR_IRQ_0
GIC500SS_SPI_IN_184 | CSI_RX_IF0_CSI_IRQ_0
GIC500SS_SPI_IN_189 | CSI_RX_IF1_CSI_ERR_IRQ_0
GIC500SS_SPI_IN_188 | CSI_RX_IF1_CSI_IRQ_0
GIC500SS_SPI_IN_193 | CSI_RX_IF2_CSI_ERR_IRQ_0
GIC500SS_SPI_IN_192 | CSI_RX_IF2_CSI_IRQ_0

[0]: https://www.ti.com/lit/zip/spruj52

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Udit Kumar <u-kumar1@ti.com>
Reviewed-by: Jared McArthur <j-mcarthur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 7c5b0c69897d..2159ce0c942f 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -819,6 +819,9 @@ ti_csi2rx0: ticsi2rx@4500000 {
 		cdns_csi2rx0: csi-bridge@4504000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x04504000 0x00 0x00001000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 72 2>, <&k3_clks 72 0>, <&k3_clks 72 2>,
 				<&k3_clks 72 2>, <&k3_clks 72 3>, <&k3_clks 72 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
@@ -872,6 +875,9 @@ ti_csi2rx1: ticsi2rx@4510000 {
 		cdns_csi2rx1: csi-bridge@4514000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x04514000 0x00 0x00001000>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 73 2>, <&k3_clks 73 0>, <&k3_clks 73 2>,
 				<&k3_clks 73 2>, <&k3_clks 73 3>, <&k3_clks 73 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
@@ -924,6 +930,9 @@ ti_csi2rx2: ticsi2rx@4520000 {
 		cdns_csi2rx2: csi-bridge@4524000 {
 			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
 			reg = <0x00 0x04524000 0x00 0x00001000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error_irq", "irq";
 			clocks = <&k3_clks 74 2>, <&k3_clks 74 0>, <&k3_clks 74 2>,
 				<&k3_clks 74 2>, <&k3_clks 74 3>, <&k3_clks 74 3>;
 			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
-- 
2.34.1


