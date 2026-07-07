Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94FDC44502
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxoXdKu0aZgTfLu+tdeQc3a7BLtcyg1jnW1Stht1zpU=; b=kvNr9A2OLoJ04n4W2R8eC9M76E
	ryx7/YOLSr+zTorA0j/yRxmyPab9bq38Xo6Y4LUTiuiVRRd1pufeFlGNcHhOOzcOrXLinbwtwYxKv
	1iQnT03EswKWHDlt61hynHXk+8v2iJd4GonJ6NgQO8xptTQPD8cHvazo9SuBO/udNCP4/Jit/qN+B
	AVIx2eG88uqe8L9ZI3zfS6QtTJpVNtWWAaSrekhoYILIJK+GIVAuzfRMFutrr/zIgjTx9ZSjHDwn1
	yui5p28bavAhy/IhSn52yVB/NhsvySCSCBif00gkiPFkE1MJBK8m3IkY06Zxqnu6XHmqy151VpQfo
	mok6sG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82b-0000000FNtA-3Gb7;
	Tue, 07 Jul 2026 15:48:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh82U-0000000FNjw-1ewk;
	Tue, 07 Jul 2026 15:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783439327;
	bh=e25H5Na1/muGraQAVFfOJYCZXZYjdwCnio/1tbgHD50=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xkt0+L5TYJmtPyA+k8eVQvKG6uuwcV/1k9Aoq2iC3Cs68pBsifKGMTmCsLGe+e9nn
	 kf/sYRxuFZH/Ulrfa6CYQcuabrGAt94rw/YttxNpUVfO4HavAiV75luEg46nRgQfWx
	 IvmqC8m2kPOWi8evooz59H582kyIHpsJXFIODmUD+SY1CXMSb6NnztZBe2WzdPu8pU
	 kfkCCLWP4klv6aJPD1GG7JIevZEMuu7Cg2hWMgNtwlc/c36XeArRVZSNsqR/ihbUKO
	 zVmICCPw+Nn2XGH6zgEbOEEKUE9HH/7D1P0O16PiJYpntYqUnjGfGPaO7kaDS+CYUk
	 l2Db6mcM1/TIA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D94CB17E0E95;
	Tue, 07 Jul 2026 17:48:46 +0200 (CEST)
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
Subject: [PATCH v2 6/7] arm64: dts: mediatek: mt8192: Add and use UART AP_DMA controller
Date: Tue,  7 Jul 2026 17:48:40 +0200
Message-ID: <20260707154841.198870-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
References: <20260707154841.198870-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_084850_598904_2260356E 
X-CRM114-Status: UNSURE (   9.00  )
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
channels to its two uart controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9f8f115edd4c..898953acdb61 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -741,6 +741,19 @@ spmi: spmi@10027000 {
 			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
 		};
 
+		apdma: dma-controller@10217a80 {
+			compatible = "mediatek,mt8192-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10217a80 0 0x80>, <0 0x10217b00 0 0x80>,
+			      <0 0x10217b80 0 0x80>, <0 0x10217c00 0 0x80>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <4>;
+		};
+
 		gce: mailbox@10228000 {
 			compatible = "mediatek,mt8192-gce";
 			reg = <0 0x10228000 0 0x4000>;
@@ -765,6 +778,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -775,6 +790,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


