Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D97C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqGtlgZEYCI95N9DJUurPCghJw7MFIlkGVBezzzioz8=; b=WvVC5xV+/HLftU+D/lOyOOt3X6
	GIQW2T5GEGmFsEIuOGBn0AnjUDFiLpw0mBzUf9ErWQeldT8lSWmdvLHGV2/Jdny0AuSAORCj4vgjP
	BA++g18I2fkqMStDnAB/YAq1fDKPZ32RyNE+ykaSdmyTSu2MkOBxvkwGYEvHdnai8PsREfpCvkaRu
	aGWnmfJ5Ev/14Avyd4FY4LkT2uYuAAWSQuQxeHqnxKbNTEoldi6jnsiakdC9AkasbzcZSmMej44PE
	rDMdLEJvCaWi4pwPyZ4SXEgUMSgfVLoA0n3Df3kR6UsB80zH6XmQADR7biQhDlrrD1PrHeysMXh48
	glgICAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetui-00000001pE9-3Bp4;
	Wed, 01 Jul 2026 12:19:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetuf-00000001p69-3vBc;
	Wed, 01 Jul 2026 12:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908372;
	bh=Zo8DY2p+sclgU6ZpYmPwfUACzcUgRe8O1TmDoQnLwC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDl/DVCXk2tNVL9sOF4qxGbOLecvBw950BACdrGC2BKKomPbyz4hPfiMZ91eHOqXh
	 VKrmrPmXh7lXli0R9Jh2JBj4DTwFI7NtqfOmGAzMQUgvYjxgGTbn4i7GyMopdM99rg
	 ND4d5vsPh2hiMRgS4q2BUS28ewCNkLjrxk/Za6Pi5ANeWn5P/VdyITiUg1iiZRP5GM
	 7cD1zrTPx5bLQwhYDvsaAUk02vLxQo7CEnygjwFrR/YGsyzMNMXwDSxm0y9HwQWIng
	 0BffvRTUnXVce3p+7FWryICHRNeDvsIH+EZOAGB8xkUnpznSMyv06WsBOV7lAVM/R3
	 FQILpxT/DSzBw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B061C17E0FAA;
	Wed,  1 Jul 2026 14:19:31 +0200 (CEST)
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
Subject: [PATCH 2/7] arm64: dts: mediatek: mt8173: Add and use UART AP_DMA controller
Date: Wed,  1 Jul 2026 14:19:24 +0200
Message-ID: <20260701121929.19374-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
References: <20260701121929.19374-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051934_127684_E392BB34 
X-CRM114-Status: UNSURE (   9.90  )
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
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 81ddb4eec48e..43159ae6da8f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -673,6 +673,25 @@ gic: interrupt-controller@10221000 {
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		apdma: dma-controller@11000300 {
+			compatible = "mediatek,mt8173-uart-dma", "mediatek,mt6577-uart-dma";
+			reg = <0 0x11000300 0 0x80>, <0 0x11000380 0 0x80>,
+			      <0 0x11000400 0 0x80>, <0 0x11000480 0 0x80>,
+			      <0 0x11000500 0 0x80>, <0 0x11000580 0 0x80>,
+			      <0 0x11000600 0 0x80>, <0 0x11000680 0 0x80>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 98 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 99 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_AP_DMA>;
+			#dma-cells = <1>;
+			dma-requests = <8>;
+		};
+
 		auxadc: auxadc@11001000 {
 			compatible = "mediatek,mt8173-auxadc";
 			reg = <0 0x11001000 0 0x1000>;
@@ -688,6 +707,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 0>, <&apdma 1>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -698,6 +719,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 2>, <&apdma 3>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -708,6 +731,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 4>, <&apdma 5>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
@@ -718,6 +743,8 @@ uart3: serial@11005000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
 			clock-names = "baud", "bus";
+			dmas = <&apdma 6>, <&apdma 7>;
+			dma-names = "tx", "rx";
 			status = "disabled";
 		};
 
-- 
2.54.0


