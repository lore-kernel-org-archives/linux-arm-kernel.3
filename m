Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00761C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U06FOw0zTBDeY3g2InSOUuSYvqPogugUHRDKfzXJCUI=; b=x4AfUC22kvSpZHFz4YGwZa1XK1
	gVO7f6hOTSo7pVdw5ABp/3P5bjTZym82m3ccXiauFpVvwvT8ahNuJfJvkAoZF/PNL4eyhqhWhO4kz
	QuJMC7ClhJGZW3GHq3fpUxzhMTQLuY4VZnpKS2tqbCZcZPMROk9Z/Zg36CIMSXkZMj0msdmUYAloA
	713e09M9xMpZIFpeyuZPH1sQ3ExOmT8OMPxBp6clAb/N2H+8KAVWmFcmU8wGUUS15Q4HaVd5hjBU8
	jkzY6qDmSfIjP1Qrq9Pe5KRcUV2Y5OlsSVkIIDENjn6eDs6pEVRInOHklc+SKogPGiZV0tdhXdCEd
	wxmGsiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklL-00000001isE-2fLd;
	Thu, 09 Jul 2026 09:09:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whklH-00000001ila-0Odj;
	Thu, 09 Jul 2026 09:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783588174;
	bh=IK1gy7Ppi9enq5CKWajmp1bn13CpXmC5UMPqV5WyMhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F0Qvh+4Wa9CFE5fVSWEu7x28MVYPlMZpU1tUBBJf6QrJYuihDWiuYuGpJDvOXosda
	 iTOItCrVixeUdQSwTe/q8PRHT6VZk0hjT5hfEg2CPPKTfal8sWtFyn972HHyNzUoLi
	 SPHBlB8bu/51PrzPJo0UDuFaauc9ICfa+2HxxNYUhlm49URCdWXT+Vve9LYudOeaRP
	 P9Seuz0mZMYerePxMJOPmIfEJVvpk6jXXYEZXIvjGAkzcTLER4oMWWVZNUBzYGiqh2
	 KC/pGcXhaSC8ZwmjoiGnui/ToJw2dTtyAT7vKo9AmNyqhx8hS0h8HWPsDxHJzz9RY4
	 eRkDFf/8+Fcxw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4EE9617E0D33;
	Thu, 09 Jul 2026 11:09:34 +0200 (CEST)
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
Subject: [PATCH v3 2/7] arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
Date: Thu,  9 Jul 2026 11:09:19 +0200
Message-ID: <20260709090924.27056-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
References: <20260709090924.27056-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020939_590386_6E13B503 
X-CRM114-Status: UNSURE (   9.42  )
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
channels to each of the four UART controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..18683d3b08f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -673,6 +673,22 @@ gic: interrupt-controller@10221000 {
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		apdma: dma-controller@11000400 {
+			compatible = "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
+			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <8>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8173-auxadc";
 			reg = <0 0x11001000 0 0x1000>;
@@ -698,6 +714,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -708,6 +726,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -718,6 +738,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


