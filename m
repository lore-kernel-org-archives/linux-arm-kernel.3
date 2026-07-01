Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D063CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk0CHQDIu54yoTI84j0GdmcUXZZzNmbZteOC+PWQueM=; b=JxR9bThiRYz2KEfZsT6UPlkfMX
	+Lcw58bRBG4T9uvnMm7HV1tvCQF+sAmggUT6D6II5mbV17OIMjdXmb6OLSZUWNXVF/Hoofjt0Gzra
	Q/5mdKcJRsVJCpaeuTwg3mawWKYmtW885dkVoazem6xil7vWk4xiVtdYcqPpT6vrBgzxgQX5dgyvh
	1mvuKkuWxVbJxUeGCG3kjU20nSZIk3gOca4JUYvlZqxhheqrRZOKtcXfCrovLjdSZveV8t8+6FYs7
	9Gcrhd3jVL6yN69mlNONbSfePa1dUVv15Zaikw4hTNB7O6vrkxgArUIZLzrwaQWk86kt5GUcILy2I
	HZsUuKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuo-00000001pUB-1SJ7;
	Wed, 01 Jul 2026 12:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetul-00000001pIg-18aL;
	Wed, 01 Jul 2026 12:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Rk0CHQDIu54yoTI84j0GdmcUXZZzNmbZteOC+PWQueM=; b=YBQfGCOXcJURFcdoGrkvnJxUUA
	OWya8MIgfVUO9nseVWTygEGuM2waS7MAJOnB+teSOW74smYWscPdzFKVk86/hygnU5K1TPF3FOVKF
	vyuixwa2S4T5zMkD/ydLjovHG0BlYXo29XwVPci5ecBOxV5l4Ob13D4Yd8GcTBbj4dv5Cxf94x+Fs
	429HErBXmdpURRCAU8NSnjBqsy3/gqwKbXshBAnIpjOaGjy3imbCh6Ozuek1bbsSa4gTmkNxWuzlX
	BZGdrllLcQqnm+JyzZacRbinF2zwBkpeNwIS5gYzAmeT1pOAjMJjIpsMhsmWsvTghpWWKmBHd//dN
	PlAzZvJw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetui-00000002iuz-1z8a;
	Wed, 01 Jul 2026 12:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908375;
	bh=XSxEVk1EzRiGc7ijX1vpKsfL4RKBfE4EiFVihc5cv/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ncMHCWt8sy0Tn8kWWoHWvbPugkp32tDvDcvTiuROsRRlqQZcsJBPbyPQSasdIx05Y
	 pQ8QaeZZ/qNEF+9m0Gk4phYrsrAqRqTP99mHhxQ1lyhdzjQA01fGsn3aJn08/dnpkT
	 w6Tj1VD9l36GWDOtFlTB8AhB10XhMKMsb1+tIr9hwjdP/J44bpc1ZkG5PUFqYJpY98
	 7NpMoZrDO8Bkrax6Y14LNezwv3dyW+0q/I80mdLplOtQtKaQRraWJ/pY0vw6/C94vP
	 WYKtvoCj0Aslk/jzEZwAktWseHqyWNTkal/go/ODIHy+o/84iocnfD05L6Ip4LBU93
	 wj+ubjkVHDX3w==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCA6D17E1411;
	Wed,  1 Jul 2026 14:19:34 +0200 (CEST)
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
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8195: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:29 +0200
Message-ID: <20260701121929.19374-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131936_655638_54D08ABB 
X-CRM114-Status: UNSURE (   9.05  )
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
channels to each uart controller.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index c4d400cd7638..9bec9011d0c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -865,6 +865,31 @@ systimer: timer@10017000 {
 			clocks = <&clk13m>;
 		};
 
+		apdma: dma-controller@10220880 {
+			compatible = "mediatek,mt8195-uart-dma", "mediatek,mt6835-uart-dma";
+			reg = <0 0x10220880 0 0x80>, <0 0x10220900 0 0x80>,
+			      <0 0x10220980 0 0x80>, <0 0x10220a00 0 0x80>,
+			      <0 0x10220a80 0 0x80>, <0 0x10220b00 0 0x80>,
+			      <0 0x10220b80 0 0x80>, <0 0x10220c00 0 0x80>,
+			      <0 0x10220c80 0 0x80>, <0 0x10220d00 0 0x80>,
+			      <0 0x10220d80 0 0x80>, <0 0x10220e00 0 0x80>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			#dma-cells = <1>;
+			dma-requests = <12>;
+		};
+
 		pwrap: pwrap@10024000 {
 			compatible = "mediatek,mt8195-pwrap", "syscon";
 			reg = <0 0x10024000 0 0x1000>;
@@ -1028,6 +1053,8 @@ uart0: serial@11001100 {
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1038,6 +1065,8 @@ uart1: serial@11001200 {
 			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1048,6 +1077,8 @@ uart2: serial@11001300 {
 			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1058,6 +1089,8 @@ uart3: serial@11001400 {
 			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1068,6 +1101,8 @@ uart4: serial@11001500 {
 			interrupts = <GIC_SPI 724 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART4>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 8>, <&apdma 9>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -1078,6 +1113,8 @@ uart5: serial@11001600 {
 			interrupts = <GIC_SPI 725 IRQ_TYPE_LEVEL_HIGH 0>;
 			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART5>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 10>, <&apdma 11>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


