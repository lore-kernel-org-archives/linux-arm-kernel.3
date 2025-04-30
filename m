Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A517C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pN+DR+yPqC8p0Q70MqMCrxDUhE4F9RRyfqwUtO3uXjw=; b=4hwt9p3KJWLkjcblwAUN7unXnu
	Su3RBd07PAyUVWqwha39S8pBCYscTEkdm8gZq4/cfLL0bocsCa1sJovDkENsj5HmM40on/MWaF5vK
	VxvJE5K2tXnXK9Hoh40y1kVdn6gd+65HDQn1nSWPx9zZ03VOhh0fbrFuIZEzgAZoWqNOQNd9avud5
	PTC6VgR0feLyH/qpuaLZDMnIIxlPo2mpPJ1fCsWF1ESWZm/JR7Q05reUJksp5nCjZnkE9Jz2sP6Wu
	W9TVD91MDpyP1oVTD7TvaCfuT8WrKQqM9ud3aE90NOQwr1wtieJXuHcpzEQWr1MDZuAYmln+QMi9z
	Tedl9SZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0D8-0000000BmeB-0iFW;
	Wed, 30 Apr 2025 05:42:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA04J-0000000Blcr-2DGt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pN+DR+yPqC8p0Q70MqMCrxDUhE4F9RRyfqwUtO3uXjw=; b=gjwzmI3c3PFQsELdlNzIkMnJ3x
	PG1I1ofCESUFd1pBmh5xbFitDYNwM8Y7xYuSLINLJmawmkzwx5ygQdomgGq1Ed98Sjz9zWZPhmfzL
	egGd7NqzA8xm7q48Dkpt5TrQg6IRHDDi7MIGVKphR3lg+HOO5E/ZMShqSNdXjp2zGSBOKjCd9Y+g5
	lp1eZPHyzBNJOrH54Zi2Kzd/t0FOi8X/atKNc5t2J7dBnMprMjA1fvC/PTnf7UfG2Veir6qpKy+yB
	hLwaofhwIejJ2UwuL/sO8Y28OW2Bhx47Sl6eSXQNBcOTrMZ3PuG02EXKMW2O02iSCZ29kjbtMdnfe
	ISOefm/Q==;
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA04A-0000000DhFT-2XTA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:33:13 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 47F13342FF2;
	Wed, 30 Apr 2025 05:32:57 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 30 Apr 2025 13:32:05 +0800
Subject: [PATCH v3 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-01-sun55i-emac0-v3-3-6fc000bbccbd@gentoo.org>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2563; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=jcSk9XlWcTHAuaWk6k7yBAgv5mcN5gJJEZhxrUiXlA4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEbXqfMro5EpesqztKi/IHjQSAG+BRljr4Vx3v
 ZbpW+havXaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBG16l8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fQ5EACY7OotR7YXC8hcJW
 40EvcHd8QAkmRLuiT+aeOAzMzXTj1A4Zo5jGGyFp+D8GQxtws/8ij/iQPR4081svXWOQ+QnrBAo
 M90t/I/C0QmDlcHJCoXXIhTsGzbpf5h7CM3XAKx0lfkW0T3E0PH7uYxR348Xyt3zEbozUnZJB/R
 PF/kNAL2hUNLUf5+ScMZHLcYaAHm04NF24xA/ubFYk00x+n0vty20G8VKBtN5TlGV/XwcfST+Vt
 8qDHmWhhAzcdd70Y9pClLvaq8K0HZ18RUbVhrvXwfVyx77CkIHiyOzK5TW81siobKQ4DCspEXR2
 lmIFSBWSpIQTJppKptvezQbcglpooEd4B37uajUVgEf5ng6Epu5qi5U9SmLnIZyNdl58TPlNImF
 Tse4/rVTMgWT3xAzJuSHUYRl4TFeasZrZ8kZ54RXe7pPF6Kd42OS8SYMahDS+iB4FZMuQdg98OJ
 7UqiBohvA5nsgoe/21LRT49J1LdgaFTwe/PNQgfTGE0f+llpB2bbZduRssnVgC9wX3awETTCQS1
 yxbEAttAhjCAba5lFOlTVwuvuF+V7racc3nMaNPwVDnXn2wpSLmocVVKTnbFSw/MNLXxbD3Llkn
 M9erKjS8AJc3Ro5mmrBlzyHrVxSdXb+iGNxl5UZvDjL9EgbK5zxFq/2FT9HORhaCd9nw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_063309_753124_F14365F7 
X-CRM114-Status: UNSURE (   9.28  )
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

Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
including the A527/T527 chips. MAC0 is compatible to the A64 chip which
requires an external PHY. This patch only add RGMII pins for now.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 41 ++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ee485899ba0af69f32727a53de20051a2e31be1d..8b7cbc2e78f500e1dc704e9a6bee87e70285509f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -126,6 +126,16 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			rgmii0_pins: rgmii0-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				allwinner,pinmux = <5>;
+				function = "emac0";
+				drive-strength = <40>;
+				bias-disable;
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
 				allwinner,pinmux = <2>;
@@ -409,6 +419,15 @@ i2c5: i2c@2503400 {
 			#size-cells = <0>;
 		};
 
+		syscon: syscon@3000000 {
+			compatible = "allwinner,sun55i-a523-system-control",
+				     "allwinner,sun50i-a64-system-control";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+		};
+
 		gic: interrupt-controller@3400000 {
 			compatible = "arm,gic-v3";
 			#address-cells = <1>;
@@ -521,6 +540,28 @@ ohci1: usb@4200400 {
 			status = "disabled";
 		};
 
+		emac0: ethernet@4500000 {
+			compatible = "allwinner,sun55i-a523-emac0",
+				     "allwinner,sun50i-a64-emac";
+			reg = <0x04500000 0x10000>;
+			clocks = <&ccu CLK_BUS_EMAC0>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC0>;
+			reset-names = "stmmaceth";
+			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			pinctrl-names = "default";
+			pinctrl-0 = <&rgmii0_pins>;
+			syscon = <&syscon>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun55i-a523-r-ccu";
 			reg = <0x7010000 0x250>;

-- 
2.49.0


