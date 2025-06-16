Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108EFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YBepW4GEZcGM8oBdaITI7nr/MJUbEalakXB1PI+zG4=; b=pdrnrOQDGgKjaahr21PAaJo46G
	QKauUH4ktajdHzw5EWL+cZUT8nEo4/BrwQpc5NPREWaHdQjP+9UtTT6sXBCDVUFPFpYt9HhiVEfG9
	kpe1eej5VynvDqtlfWfTBGcBgEjBf4aomtTgDJXwtkZ+NmcW0YUbiNIvefnQbOQnbCI15TKtE2Y+s
	UiD6gSm9fu8xk2hI7knDPJRBKTJvWr06Fxyt5+fIHHYc0ErV7DF+4JHLGdGCk9ShEObY9kWP+QX09
	6P4W+u/jI+1Wccwt7ARkz18uvbIHKxZYin9bg76lrSpn83xSORfC5n4t/Jr4gb8ugg/8/Xd1YQYWr
	TAhLcnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7HN-000000045zl-2QzL;
	Mon, 16 Jun 2025 10:41:29 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6c0-00000003zzH-0q1r;
	Mon, 16 Jun 2025 09:58:46 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 47F8D605DE;
	Mon, 16 Jun 2025 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750067922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1YBepW4GEZcGM8oBdaITI7nr/MJUbEalakXB1PI+zG4=;
	b=HyRgBKi3BNRpzpUOxtNoi8n8pr2bapR+yN7VuLS+0CeTeB0AJG8VcJr/2L7Y0vj1OHoiBU
	QkHiVvKaesda89NIROy3rpCtl4FfXj5eAi+5puYimOYWYuYvn1oYPWug/wCM5bJHTl9tJs
	rdRLLoPuWSNl5Lpf3kCUS78q7bZRL2o=
Received: from frank-u24.. (fttx-pool-194.15.87.210.bambit.de [194.15.87.210])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id DCF2F122677;
	Mon, 16 Jun 2025 09:58:41 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 06/13] arm64: dts: mediatek: mt7988: add basic ethernet-nodes
Date: Mon, 16 Jun 2025 11:58:16 +0200
Message-ID: <20250616095828.160900-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616095828.160900-1-linux@fw-web.de>
References: <20250616095828.160900-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_025844_540418_3DEC2B8B 
X-CRM114-Status: GOOD (  13.10  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add basic ethernet related nodes.

Mac1+2 needs pcs (sgmii+usxgmii) to work correctly which will be linked
later when driver is merged.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v4:
- comment for fixed-link on gmac0
- update 2g5 phy node
  - unit-name dec instead of hex to match reg property
  - move compatible before reg
  - drop phy-mode
- add interrupts for RSS
- add interrupt-names and drop reserved irqs for ethernet
- some reordering
- eth-reg and clock whitespace-fix based on angelos review
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 126 +++++++++++++++++++++-
 1 file changed, 123 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 560ec86dbec0..c0a073cf168e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -680,7 +680,28 @@ xphyu3port0: usb-phy@11e13000 {
 			};
 		};
 
-		clock-controller@11f40000 {
+		xfi_tphy0: phy@11f20000 {
+			compatible = "mediatek,mt7988-xfi-tphy";
+			reg = <0 0x11f20000 0 0x10000>;
+			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
+				 <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
+			clock-names = "xfipll", "topxtal";
+			resets = <&watchdog 14>;
+			mediatek,usxgmii-performance-errata;
+			#phy-cells = <0>;
+		};
+
+		xfi_tphy1: phy@11f30000 {
+			compatible = "mediatek,mt7988-xfi-tphy";
+			reg = <0 0x11f30000 0 0x10000>;
+			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
+				 <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
+			clock-names = "xfipll", "topxtal";
+			resets = <&watchdog 15>;
+			#phy-cells = <0>;
+		};
+
+		xfi_pll: clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
 			resets = <&watchdog 16>;
@@ -714,19 +735,118 @@ phy_calibration_p3: calib@97c {
 			};
 		};
 
-		clock-controller@15000000 {
+		ethsys: clock-controller@15000000 {
 			compatible = "mediatek,mt7988-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
-		clock-controller@15031000 {
+		ethwarp: clock-controller@15031000 {
 			compatible = "mediatek,mt7988-ethwarp";
 			reg = <0 0x15031000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
+
+		eth: ethernet@15100000 {
+			compatible = "mediatek,mt7988-eth";
+			reg = <0 0x15100000 0 0x80000>, <0 0x15400000 0 0x200000>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx", "rx", "rx-ring0", "rx-ring1",
+					  "rx-ring2", "rx-ring3";
+			clocks = <&ethsys CLK_ETHDMA_CRYPT0_EN>,
+				 <&ethsys CLK_ETHDMA_FE_EN>,
+				 <&ethsys CLK_ETHDMA_GP2_EN>,
+				 <&ethsys CLK_ETHDMA_GP1_EN>,
+				 <&ethsys CLK_ETHDMA_GP3_EN>,
+				 <&ethwarp CLK_ETHWARP_WOCPU2_EN>,
+				 <&ethwarp CLK_ETHWARP_WOCPU1_EN>,
+				 <&ethwarp CLK_ETHWARP_WOCPU0_EN>,
+				 <&ethsys CLK_ETHDMA_ESW_EN>,
+				 <&topckgen CLK_TOP_ETH_GMII_SEL>,
+				 <&topckgen CLK_TOP_ETH_REFCK_50M_SEL>,
+				 <&topckgen CLK_TOP_ETH_SYS_200M_SEL>,
+				 <&topckgen CLK_TOP_ETH_SYS_SEL>,
+				 <&topckgen CLK_TOP_ETH_XGMII_SEL>,
+				 <&topckgen CLK_TOP_ETH_MII_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_500M_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_PAO_2X_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_SYNC_250M_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_PPEFB_250M_SEL>,
+				 <&topckgen CLK_TOP_NETSYS_WARP_SEL>,
+				 <&ethsys CLK_ETHDMA_XGP1_EN>,
+				 <&ethsys CLK_ETHDMA_XGP2_EN>,
+				 <&ethsys CLK_ETHDMA_XGP3_EN>;
+			clock-names = "crypto", "fe", "gp2", "gp1", "gp3",
+				      "ethwarp_wocpu2", "ethwarp_wocpu1",
+				      "ethwarp_wocpu0", "esw", "top_eth_gmii_sel",
+				      "top_eth_refck_50m_sel", "top_eth_sys_200m_sel",
+				      "top_eth_sys_sel", "top_eth_xgmii_sel",
+				      "top_eth_mii_sel", "top_netsys_sel",
+				      "top_netsys_500m_sel", "top_netsys_pao_2x_sel",
+				      "top_netsys_sync_250m_sel",
+				      "top_netsys_ppefb_250m_sel",
+				      "top_netsys_warp_sel","xgp1", "xgp2", "xgp3";
+			assigned-clocks = <&topckgen CLK_TOP_NETSYS_2X_SEL>,
+					  <&topckgen CLK_TOP_NETSYS_GSW_SEL>,
+					  <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>,
+					  <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>,
+					  <&topckgen CLK_TOP_SGM_0_SEL>,
+					  <&topckgen CLK_TOP_SGM_1_SEL>;
+			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>,
+						 <&topckgen CLK_TOP_NET1PLL_D4>,
+						 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
+						 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
+						 <&apmixedsys CLK_APMIXED_SGMPLL>,
+						 <&apmixedsys CLK_APMIXED_SGMPLL>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mediatek,ethsys = <&ethsys>;
+			mediatek,infracfg = <&topmisc>;
+
+			gmac0: mac@0 {
+				compatible = "mediatek,eth-mac";
+				reg = <0>;
+				phy-mode = "internal";
+
+				/* Connected to internal switch */
+				fixed-link {
+					speed = <10000>;
+					full-duplex;
+					pause;
+				};
+			};
+
+			gmac1: mac@1 {
+				compatible = "mediatek,eth-mac";
+				reg = <1>;
+				status = "disabled";
+			};
+
+			gmac2: mac@2 {
+				compatible = "mediatek,eth-mac";
+				reg = <2>;
+				status = "disabled";
+			};
+
+			mdio_bus: mdio-bus {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* internal 2.5G PHY */
+				int_2p5g_phy: ethernet-phy@15 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <15>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.43.0


