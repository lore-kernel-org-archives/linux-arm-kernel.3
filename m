Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65523C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gntzzHgR7hVfcxIHz+wXqJ/img6vkZtc4/PYkuXugA=; b=bzYjwUShRuZkB7MSDmMsAMc6hx
	CpZ4w9ghy+GZssDuLbqwKUVxI07B6GUzek5h41VHmOIxTYhJ9TCdmJg3/umR1DRIjORTUJZyvyLrE
	IszLaaiyHXXJP5t4MtIUrVh72e3jbAjxQwmI4kzo700X7+FrMjx5dfVwPpJokiVZymb2NObnEQJ14
	+yxKSJJsfntRMz3rxZCsIsG7yVCA1F/k3aco4OMJTlMZ9+A4FI/UitZ8+wBeHe+XWwexypBalc7Jz
	PcU9e3hXCCwW/OMF9pz2YOpuVsSD/ALudWIrkoU/F8zO6eTJBRLBUP+shM0n2ZGNKYJdTlEUO87D8
	obSgt9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7oz-00000007Ncn-0E81;
	Sun, 11 May 2025 14:38:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XG-00000007LYc-0rOc;
	Sun, 11 May 2025 14:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2gntzzHgR7hVfcxIHz+wXqJ/img6vkZtc4/PYkuXugA=; b=kDqIIznaiUjPAJRRNSn0FeFx1r
	dKFLh+RvLe+qT1QJ2MjVUAg/tANzgFbygeQyAcSr3yMNdrIneAYImYpW6P34zPEsfbccegrW8vxUA
	b70hkKySLRD/NXTdvpp0bjE1gBR8VHatSWWZ3jV7hSSnJGnXNd+0w+onBPx8dBZkO8HZa2gonPDVt
	bZXOs8456js2r6+WD+dyYQbtoc2rWbYG+5pZdIAsCfskSPu5wgSrIQPVtydjmFIMZ+z6CVtXtJRe4
	v82/+uH/Gh/KavNsMuLaJZcYm3I+GrIwlMcdvF4a/7tdFtBBgl/78BEJpUMwDU80jL0gKf33pjboN
	16y4ZSsg==;
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7XA-0000000Gcgt-2R1c;
	Sun, 11 May 2025 14:20:07 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id C8D515FA5F;
	Sun, 11 May 2025 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gntzzHgR7hVfcxIHz+wXqJ/img6vkZtc4/PYkuXugA=;
	b=gYWP3sZwAhxZTSl1XMLbT0UyOQ0aJ4LcREUZ12FDO3FyR6DvzBD8ieFhxWRBJ6tLyxp9Jm
	d1m5vhDc/xh3p1LSMvHdlqa4WlDGjydR1vrw936bbYxfrIrEV86MFlb8Wqhrf1V9LOSt1Y
	tjlNMMM8ldXtJvgMxTEXqYvMPzEuajo=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 98799100500;
	Sun, 11 May 2025 14:19:55 +0000 (UTC)
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
Subject: [PATCH v1 04/14] arm64: dts: mediatek: mt7988: add spi controllers
Date: Sun, 11 May 2025 16:19:20 +0200
Message-ID: <20250511141942.10284-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5110cbfc-28b8-49e4-b9da-560d0bd630a5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_152004_862027_D9CB8D65 
X-CRM114-Status: UNSURE (   8.45  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add SPI controllers for mt7988.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8f6d1dfae24a..8c31935f4ab0 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -311,6 +311,51 @@ i2c2: i2c@11005000 {
 			status = "disabled";
 		};
 
+		spi0: spi@11007000 {
+			compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
+			reg = <0 0x11007000 0 0x100>;
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI0>,
+				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@11008000 {
+			compatible = "mediatek,mt7988-spi-single", "mediatek,spi-ipm";
+			reg = <0 0x11008000 0 0x100>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPIM_MST_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI1>,
+				 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@11009000 {
+			compatible = "mediatek,mt7988-spi-quad", "mediatek,spi-ipm";
+			reg = <0 0x11009000 0 0x100>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_MPLL_D2>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
+				 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk",
+				      "hclk";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		lvts: lvts@1100a000 {
 			compatible = "mediatek,mt7988-lvts-ap";
 			#thermal-sensor-cells = <1>;
-- 
2.43.0


