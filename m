Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53BBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRaHPwqAO39+ginV50RZiTHA2UDHP679knscTPmYeGM=; b=0z9ZfvLjc29N9DImkqTg29n1SO
	IUPM6inAuqQE/xrrbHbnjicmVgL6+ylrRuKtjfrOwqnnJPs8To6Um2H9FH5Y56ISDwPWEFyaz/Ifu
	KDRnWQgHmFuFYHPjbs4TEItVu0ctyXSWDaem4OciP29CW2wKzptqrvlIQK/mlIKvP7L7AiySYUXhR
	RUZfP4bYovj1s5yU1Xf+s3AYNdSXb/tN5p6pFeN6+Uhe4UFBaQFtGZnaGO3zLDDG5RCCJFBVthStF
	9V8EmfGSLXFyeQ5uiRRMqnr5caHkJSHh3AMpph9PAIp7S6hRDZn+rIfurcI0/Kd19cl21xACb+DWv
	ppDynDfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82Y-0000000FNpY-3IZZ;
	Tue, 07 Jul 2026 15:48:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82R-0000000FNia-3fQd;
	Tue, 07 Jul 2026 15:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439326;
	bh=Wi+pjJ04jdpYMqQlHXj7Rh2kBrwW+ijBZ7HQHCOQ/XE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IXSBO860ERmOkmyUI7RRdxLIHTtZoZLmNi5DSTCjGOhb1edx5baGSuV2PrRIxgdQp
	 xV1cMrCyaWY8RgvlOJEKjPf5EevrrpCE6XQJmcGsCTWD+rJ7RBvK8+IVw/BS0OsE9c
	 l32qEAm1z25Zyss++y+I/xwGTFUO/Oo2Kojf1MoayytxssmPEG8QifxUotzseEpcqc
	 R6JMnhGkWGqJpO7W1wWEEaOH4FG2tZ9wlUqcWZKJIRQm1HI0zbNaEo/47pVmEc6+E2
	 F7Kv3E3Y56KazeTEah+LpKu5ZCucjENznnl9i8ezwil8Iii5QLy4Xjmcil0egFetXh
	 +tdZyza+vVp5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF35117E0DE6;
	Tue, 07 Jul 2026 17:48:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com
Subject: [PATCH v2 4/7] arm64: dts: mediatek: mt8186: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:38 +0200
Message-ID: <20260707154841.198870-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084848_150373_6D0DFDCF 
X-CRM114-Status: UNSURE (   9.68  )
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

This SoC has a DMA controller (AP_DMA) that provides one channel
for each data direction (transmit and receive) for all of the
UART controllers in the SoC.

In order to increase the efficiency of data TX/RX over the UART
controllers, add the UART DMA controller and assign the right
channels to each of the three UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index fded6345d422..9fe60dee0b79 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1142,6 +1142,22 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10200d80 {
+			compatible = "mediatek,mt8186-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10200d80 0 0x80>, <0 0x10200e00 0 0x80>,
+			      <0 0x10200e80 0 0x80>, <0 0x10200f00 0 0x80>,
+			      <0 0x10200f80 0 0x80>, <0 0x10201000 0 0x80>;
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 380 IRQ_TYPE_LEVEL_LOW 0>,
+				     <GIC_SPI 381 IRQ_TYPE_LEVEL_LOW 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <6>;
+		};
+
 		gce: mailbox@1022c000 {
 			compatible = "mediatek,mt8186-gce";
 			reg = <0 0X1022c000 0 0x4000>;
@@ -1218,6 +1234,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1228,6 +1246,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1482,6 +1502,8 @@ uart2: serial@11018000 {
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


