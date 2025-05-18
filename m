Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA82CC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLs80DRngycvg8mfju1hywH7qb6aCCKjt+E8URewsKw=; b=H/WTpIg3GPTd+j8za5rG+rDnRI
	zQ+453PCgQnqDdovUnt0ksudbZf+lzO90kr6enqFTIIQ0YUct4ZrRe+1+Km7xsVas0hA7GxZyqD16
	DPWCp9uTO44DXd8EQJUVI0P8HbQyGsavXHbJTYJ44B3/ZMA8r9rfqUbYrX7y/Zad46ZaVH1PFTArw
	Ta0CsNf+uRWz7ZtvjmAp//OkyvFGU+2SzDRSLv8GVXTwWsWdQXptMxLW9vwPTB9BWu306PfblmwZg
	Y/aOY2EvCPgkJvxejwxlP1yse8KCZ/ZEewMirnrQExXEPO8v4bni2+16a+Vtbnz+xp7gyX/6DwJzL
	iGHesW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmG4-00000007bTV-1PtP;
	Sun, 18 May 2025 22:13:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm8A-00000007aG6-0G8O;
	Sun, 18 May 2025 22:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KLs80DRngycvg8mfju1hywH7qb6aCCKjt+E8URewsKw=; b=JYLI3Pl7iThnhQCIZMLSRXC+yL
	UC3NkfoDUWYu+NNfmGyVZ3fN+M0zcT7XAbD0vnc6NQZNzczdDD6sjZQzj8hPbd8vVq90EARUZUrem
	IAXPpv9h8wDbcLIXDilErMjwuNMsBGiiFvzJ7u1umkilVSLG2JSanELHht3zXLrisWpgOPCkn/A5F
	Uf8HR06FIr962ig/Xl6KYny/GxBLRKpZtO6aaNPmofCEWMKRCSpAa+HsjOGLJwbfU02PUE966wkhB
	l8s1/PlaDRzQT5Yp2ejDZWDeFZVB3EJzwJwnKrzmBwJGYuX1wXlTvXEEtUIg59sxdb4tCzVDE56e3
	78Xwn40A==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm80-0004gv-RL; Mon, 19 May 2025 00:05:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: rockchip: fix rk3562 pcie unit addresses
Date: Mon, 19 May 2025 00:04:47 +0200
Message-ID: <20250518220449.2722673-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150514_097391_5FEFBA03 
X-CRM114-Status: GOOD (  13.93  )
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

The rk3562 pcie node currently uses the apb register as its unit address
which is the second reg area defined in the binding.

As can be seen by the dtc warnings like

../arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expected "fe000000"

using the first reg area as the unit address seems to be preferred.
This is the dbi area per the binding, so adapt the unit address accordingly
and move the nodes to their new position.

With the move also move the reg + reg-names below the compatible, as is the
preferred position.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3562.dtsi | 106 +++++++++++------------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562.dtsi b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
index 6268f84efa13..292e82ec5d45 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
@@ -249,6 +249,59 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		pcie2x1: pcie@fe000000 {
+			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
+			reg = <0x0 0xfe000000 0x0 0x400000>,
+			      <0x0 0xff500000 0x0 0x10000>,
+			      <0x0 0xfc000000 0x0 0x100000>;
+			reg-names = "dbi", "apb", "config";
+			bus-range = <0x0 0xff>;
+			clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
+				 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
+				 <&cru CLK_PCIE20_AUX>;
+			clock-names = "aclk_mst", "aclk_slv",
+				      "aclk_dbi", "pclk", "aux";
+			device_type = "pci";
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie2x1_intc 0>,
+					<0 0 0 2 &pcie2x1_intc 1>,
+					<0 0 0 3 &pcie2x1_intc 2>,
+					<0 0 0 4 &pcie2x1_intc 3>;
+			linux,pci-domain = <0>;
+			max-link-speed = <2>;
+			num-ib-windows = <8>;
+			num-viewport = <8>;
+			num-ob-windows = <2>;
+			num-lanes = <1>;
+			phys = <&combphy PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+			power-domains = <&power 15>;
+			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
+				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
+				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
+			resets = <&cru SRST_PCIE20_POWERUP>;
+			reset-names = "pipe";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			status = "disabled";
+
+			pcie2x1_intc: legacy-interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		gic: interrupt-controller@fe901000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
@@ -621,59 +674,6 @@ gpu: gpu@ff320000 {
 			status = "disabled";
 		};
 
-		pcie2x1: pcie@ff500000 {
-			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
-			bus-range = <0x0 0xff>;
-			clocks = <&cru ACLK_PCIE20_MST>, <&cru ACLK_PCIE20_SLV>,
-				 <&cru ACLK_PCIE20_DBI>, <&cru PCLK_PCIE20>,
-				 <&cru CLK_PCIE20_AUX>;
-			clock-names = "aclk_mst", "aclk_slv",
-				      "aclk_dbi", "pclk", "aux";
-			device_type = "pci";
-			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie2x1_intc 0>,
-					<0 0 0 2 &pcie2x1_intc 1>,
-					<0 0 0 3 &pcie2x1_intc 2>,
-					<0 0 0 4 &pcie2x1_intc 3>;
-			linux,pci-domain = <0>;
-			max-link-speed = <2>;
-			num-ib-windows = <8>;
-			num-viewport = <8>;
-			num-ob-windows = <2>;
-			num-lanes = <1>;
-			phys = <&combphy PHY_TYPE_PCIE>;
-			phy-names = "pcie-phy";
-			power-domains = <&power 15>;
-			ranges = <0x01000000 0x0 0xfc100000 0x0 0xfc100000 0x0 0x100000
-				  0x02000000 0x0 0xfc200000 0x0 0xfc200000 0x0 0x1e00000
-				  0x03000000 0x3 0x00000000 0x3 0x00000000 0x0 0x40000000>;
-			reg = <0x0 0xfe000000 0x0 0x400000>,
-			      <0x0 0xff500000 0x0 0x10000>,
-			      <0x0 0xfc000000 0x0 0x100000>;
-			reg-names = "dbi", "apb", "config";
-			resets = <&cru SRST_PCIE20_POWERUP>;
-			reset-names = "pipe";
-			#address-cells = <3>;
-			#size-cells = <2>;
-			status = "disabled";
-
-			pcie2x1_intc: legacy-interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
-				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-			};
-		};
-
 		spi1: spi@ff640000 {
 			compatible = "rockchip,rk3066-spi";
 			reg = <0x0 0xff640000 0x0 0x1000>;
-- 
2.47.2


