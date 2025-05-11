Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1B4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxZ32nniQ48sMzhBF0T/7YO0bN/349dEDPJEtWWeR2Q=; b=xi41uHqe/ySxrmrJvls044VKCX
	9EwNfgkNgFOjwMjlg0LbnS6qcA4r6byK1HXbsue7aNcMy45NxO1vMhZzoij3o6jvvZNzV2Us8roJ6
	OcBiPCN/v38Mn/hOi54RoARqXUUecQZOyDFHy7EVDsJdhY/wcrENqQ6w5pATFUYrdZ1JkBnc0O3Jd
	+SyRCiQLomODD6iswkgB3ItyVE2ufGzG7MrDWExh5j0kwdAtXJG3Z+fzYmRsehlHuXa3975XuCapi
	1jSgXr39th1RyhefjnPGhIOKN86pmcpmDsEnK1ZHYuO7dW8o7HUNUxZ6VgwKp94pm+6S5xkTcfLIk
	6G7pX0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8v3-00000007TZ2-29D8;
	Sun, 11 May 2025 15:48:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XF-00000007LYd-3VKQ;
	Sun, 11 May 2025 14:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qxZ32nniQ48sMzhBF0T/7YO0bN/349dEDPJEtWWeR2Q=; b=afcIHfaWvTsLfvQSTWgWZ32ixW
	OzGeSZfAkF1C2GjH7s8AWxWOrafzgMBVigJzdPq8yf2gbA6TDVNbrN/A/gtx2NhXVwmdYW4Xh7zcR
	tRstkXjqu9PHo/oDDbcN10IUXx0gRWJ4BfVsGzYLONhoA54UmJhs45rhhpiprAojwToHsk0Mm9Sez
	zzxJWS46F67xEZE0XI+HJvJ5BCyU53Jg64HLxfV9MOQT0EIGA2PHEuK5MQffofJcJCI+1k4ViycIO
	pI93zlUb1pp2Tn/PACzeIAlOAKAse5/8Gdmb4kvkK5lJs6ONZSG9I6Lqzy0ecg4eA50Cm7FOPe9PO
	Ed1HSICg==;
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7XA-0000000Gci3-2R3h;
	Sun, 11 May 2025 14:20:07 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id C88A95FDD4;
	Sun, 11 May 2025 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qxZ32nniQ48sMzhBF0T/7YO0bN/349dEDPJEtWWeR2Q=;
	b=i6y8r28vjKY8uzVDpC1f8gNShmUvPiASJio/YuScg6OBQgk55IjvO//BYR8N6DxIxEVsLM
	ojhj11kU7ZYGzDcPBplp2oOhyq/2BaIkPP14js+RUOF+Pcf4vRiWXRuzaHTHnm5TLlbE0I
	oiy8WKhWKIfZkKz5178YdQvINq0ciYc=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 8F3D0100500;
	Sun, 11 May 2025 14:19:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 08/14] arm64: dts: mediatek: mt7988: add basic ethernet-nodes
Date: Sun, 11 May 2025 16:19:24 +0200
Message-ID: <20250511141942.10284-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5c8e73b6-e2d6-4898-90c0-375604707c20
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_152004_896030_66DE2C5C 
X-CRM114-Status: GOOD (  10.35  )
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
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 124 +++++++++++++++++++++-
 1 file changed, 121 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 029699e4eb02..aa0947a555aa 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -680,7 +680,28 @@ xphyu3port0: usb-phy@11e13000 {
 			};
 		};
 
-		clock-controller@11f40000 {
+		xfi_tphy0: phy@11f20000 {
+			compatible = "mediatek,mt7988-xfi-tphy";
+			reg = <0 0x11f20000 0 0x10000>;
+			resets = <&watchdog 14>;
+			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
+				 <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
+			clock-names = "xfipll", "topxtal";
+			mediatek,usxgmii-performance-errata;
+			#phy-cells = <0>;
+		};
+
+		xfi_tphy1: phy@11f30000 {
+			compatible = "mediatek,mt7988-xfi-tphy";
+			reg = <0 0x11f30000 0 0x10000>;
+			resets = <&watchdog 15>;
+			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>,
+				 <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
+			clock-names = "xfipll", "topxtal";
+			#phy-cells = <0>;
+		};
+
+		xfi_pll: clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
 			resets = <&watchdog 16>;
@@ -714,19 +735,116 @@ phy_calibration_p3: calib@97c {
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
+			reg = <0 0x15100000 0 0x80000>,
+			      <0 0x15400000 0 0x200000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
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
+			clock-names = "crypto", "fe", "gp2", "gp1",
+				      "gp3",
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
+			mediatek,ethsys = <&ethsys>;
+			mediatek,infracfg = <&topmisc>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			gmac0: mac@0 {
+				compatible = "mediatek,eth-mac";
+				reg = <0>;
+				phy-mode = "internal";
+
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
+				int_2p5g_phy: ethernet-phy@f {
+					reg = <15>;
+					compatible = "ethernet-phy-ieee802.3-c45";
+					phy-mode = "internal";
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.43.0


