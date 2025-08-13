Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4082C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bvxi9qrsXhO8wuinm/FXeXJXC40RoV1gkSoB05dz/h4=; b=AxH7JoXxsX0QyxiIVAsrQi1V5q
	T2pANs3QEYp8+VTpPwM3pN50B04mEPLjcUYUJg+maG3fwkBUg9xw3BSZKVflSudb1s4CX6rVFWQU4
	Q7/5BUJdK9Dmr4BjXHEEbVd0nKzn7DqKu/QV0mRwDxqOaOJ3D4LjDbP4Bvi8WMSp0bu28HBgMCCvH
	ostbrgM823Di0mbXGINyAysCRsWkRBf3dVsWxPJegGAzRTm3Gx7qWRsd9rNaGgdpAbbvm4OMBxRqb
	NbpNE8lNPpbMV/ZF8C9tug5tkjUdtKF+3t0EkaX6C9N9wvPSAxeGuGMskf/9/r+P7jMc8i+TbHQ96
	Ei1RsjJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDBj-0000000E9Gs-3R5M;
	Wed, 13 Aug 2025 15:14:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtQ-0000000E4rB-0mtJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Bvxi9qrsXhO8wuinm/FXeXJXC40RoV1gkSoB05dz/h4=; b=JlfBjIRkCkgJROPznLZgkt1S/2
	juChIjhQ6YODpg6vGDS9e0mRGaFj6UqhcWrCmifW70ZNkrbvCVYnZl66w+vZB0R8t7JVJ93MWKf4i
	cFx/gODRCo5N9k3psHP7cwTkcWoU0Q6/mL6CukjgydwW6tQQQNDS6+Q3fHKBHhuMqjtHM3qcoEJBq
	xFQd/4q3TZ2w4tY8nuECWQ4oqpMbddpIdzd3foXAB9EmDOTgc9Aun78H6GD73u7mIEv/+fvASaJE+
	eGWvZf6d52qc4scZNvPtCDVe8/Zwn7pcl0qorhTha1Ge7X6aGSKoyOda+HDoA5Rl5Cf7FjxBjrjZ0
	WKTu1d+w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtM-0000000G73R-2lPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7167D5C6C9D;
	Wed, 13 Aug 2025 14:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C95EC4CEEF;
	Wed, 13 Aug 2025 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096950;
	bh=yKrAHC0riAXESr1YT7TRrWp4LLqyhsj+D6V4VUG4krM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aRn5niKhjq2Lr784ZyGMYtj4dP5OyKaAccRzguObTv7W4Sc/RbtOv3LjL57ayXrU/
	 78WOYTPUMq8EbhBQuRUTYNQKM+TYCstHvrw/FlUCsyyJ67Ja9OqbUeRPc/NzvwkQs2
	 g3mOu0LRsw60EqW1JPt3SMufrSys39+DP+o4T69EsKuN4NVyjuNiyfNZMBNdkgY2dE
	 GQvZPTne4nMKSAJFO5LclIqSl+xdpLhOjDq6HfP3czTfYrnG0tHNU7BQiG5OhbglBo
	 4fZoQNi6q/h8Gk3qr8xf8sMS49PXUbF3AyIAMvZhT9QolKqNcH7LvXIV56LyXfLNX8
	 26bS6VUl2vJLQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 38A3E5FEEF; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v2 05/10] arm64: dts: allwinner: a523: Add GMAC200 ethernet controller
Date: Wed, 13 Aug 2025 22:55:35 +0800
Message-Id: <20250813145540.2577789-6-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155553_060328_CBE720FF 
X-CRM114-Status: GOOD (  12.35  )
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

From: Chen-Yu Tsai <wens@csie.org>

The A523 SoC family has a second ethernet controller, called the
GMAC200. It is not exposed on all the SoCs in the family.

Add a device node for it. All the hardware specific settings are from
the vendor BSP.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Changes since v1:
- Fixed typo in tx-queues-config
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 6b6f2296bdff..449bcafbddcd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -180,6 +180,16 @@ rgmii0_pins: rgmii0-pins {
 				bias-disable;
 			};
 
+			rgmii1_pins: rgmii1-pins {
+				pins = "PJ0", "PJ1", "PJ2", "PJ3", "PJ4",
+				       "PJ5", "PJ6", "PJ7", "PJ8", "PJ9",
+				       "PJ11", "PJ12", "PJ13", "PJ14", "PJ15";
+				allwinner,pinmux = <5>;
+				function = "gmac1";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
@@ -601,6 +611,51 @@ mdio0: mdio {
 			};
 		};
 
+		gmac1: ethernet@4510000 {
+			compatible = "allwinner,sun55i-a523-gmac200",
+				     "snps,dwmac-4.20a";
+			reg = <0x04510000 0x10000>;
+			clocks = <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
+			clock-names = "stmmaceth", "mbus";
+			resets = <&ccu RST_BUS_EMAC1>;
+			reset-names = "stmmaceth";
+			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			pinctrl-names = "default";
+			pinctrl-0 = <&rgmii1_pins>;
+			power-domains = <&pck600 PD_VO1>;
+			syscon = <&syscon>;
+			snps,fixed-burst;
+			snps,axi-config = <&gmac1_stmmac_axi_setup>;
+			snps,mtl-rx-config = <&gmac1_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac1_mtl_tx_setup>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac1_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <1>;
+
+				queue0 {};
+			};
+
+			gmac1_stmmac_axi_setup: stmmac-axi-config {
+				snps,wr_osr_lmt = <0xf>;
+				snps,rd_osr_lmt = <0xf>;
+				snps,blen = <256 128 64 32 16 8 4>;
+			};
+
+			gmac1_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <1>;
+
+				queue0 {};
+			};
+		};
+
 		ppu: power-controller@7001400 {
 			compatible = "allwinner,sun55i-a523-ppu";
 			reg = <0x07001400 0x400>;
-- 
2.39.5


