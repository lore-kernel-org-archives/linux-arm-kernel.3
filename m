Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDB9CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYXsPOwYmoG8tjODCLwtCU3ztWGeetCxhMf+fomE99I=; b=uiKPJiIdjr0uboxt3X8XOJfmN9
	+Ure7dMaTzBtqVVPB8CYYTa5uVfD82/gutYdZjRaHSis6ICFc98QyuFJnboMt7vHW5bxsAh0vYGds
	+GeMkzOfof0a5CXDpeo7e+hCUPtSTXIxNbxloi5fWd2QI+seG8FDSBvHxUPMaGJGSNX8P5RxTt8JE
	mtLWvmBol1ihHQTlwiSSCbzwoyaCth6RZdma0kg2+/NT1P7MCiSReI01Ezi7zmKfhNzteGDQtBBq2
	ao2wl7H7MhmFXlAt+KBkDwXNSKkbcOP/ad7wnLJU+L5wh4c19u1k+k9gg8pf3ocLxE9C4vOFS0CWd
	QmBIXFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmg-0000000Dx4l-35P2;
	Mon, 27 Oct 2025 12:57:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMmb-0000000Dx00-2EEe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Oct 2025 12:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NYXsPOwYmoG8tjODCLwtCU3ztWGeetCxhMf+fomE99I=; b=q/Gy1oelNgTjbnQs+IgugNF0T+
	S/j5pwq/XzXHjmXrSsHlfvn8INeBz1tXfuh5k6Te2M331WDuZGOKnu8decAhATWfKGNFagINtWNvV
	UjoVSPcCI8/vunEmTLQp6W+O0XGznOn2IOXpeKjauk+Ob21nSRXi/9dO3IA+w/05WxllFfeUG+gCK
	Z7bmXbit98ASsgeYLMRXpqPwlGAJZJQHivPebvz8JaRy/sQl2WpnRr6W+ZTLg5/uP9zHsQpd/ZnL3
	Z7mCRmLCN4MYiB3rJdJHC7oHUtMLjUXE7SuYKafnlmgeBwXxiPfTE1qrMwJGLOPko8ffG5Hnkuble
	gqEIGZqw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLuo-0000000272z-23Px
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC724459F8;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8501BC113D0;
	Mon, 27 Oct 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569821;
	bh=f0SoP/zvRQAOERqGrbZ2nIh2yRiuv79vNh/YNhiYisw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mqs824nK/IIPtizqFpAnhI2rX4aRkfAg+jwVA5oVxmxbdQClrPE7CszShxsjr6iyq
	 mgxON4vZ4z+8asFVhBA1/vTHiHZVoQKfW4Gg6yIicdXWCRcUDfKfQrN5Y/7uT+jRRH
	 0d+3tk6ASvDZs/1+UjUZ9H6wZFQ6d7+0AkcuSDBOzciTavPewMZU/s8NZGjETwOvBe
	 vjPmZFvYXndf/vXJooLdmIjEx09dZtwknBp+gI06mVbEBlLcM+AejPQoXxcLnD0X0E
	 e7bCocBVhxFuAJpGCioLwPnYIXYeMsVZCSWENqXE4FH2uUdnWfYwfuHYfXICYHYDrM
	 dyupOIZ8E8PQg==
Received: by wens.tw (Postfix, from userid 1000)
	id 9AF925FF56; Mon, 27 Oct 2025 20:56:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 06/10] arm64: dts: allwinner: a523: Add device node for SPDIF block
Date: Mon, 27 Oct 2025 20:56:47 +0800
Message-ID: <20251027125655.793277-7-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027125655.793277-1-wens@kernel.org>
References: <20251027125655.793277-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_120134_763651_B1C7DD7D 
X-CRM114-Status: UNSURE (   9.30  )
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

The A523 has a SPDIF interface that is capable of both playback and
capture.

Add a node for it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 8edbd3873199..33f991dbd00b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -818,6 +818,21 @@ mcu_ccu: clock-controller@7102000 {
 			#reset-cells = <1>;
 		};
 
+		spdif: spdif@7116000 {
+			compatible = "allwinner,sun55i-a523-spdif";
+			reg = <0x07116000 0x400>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&mcu_ccu CLK_BUS_MCU_SPDIF>,
+				 <&mcu_ccu CLK_MCU_SPDIF_TX>,
+				 <&mcu_ccu CLK_MCU_SPDIF_RX>;
+			clock-names = "apb", "tx", "rx";
+			resets = <&mcu_ccu RST_BUS_MCU_SPDIF>;
+			dmas = <&mcu_dma 2>, <&mcu_dma 2>;
+			dma-names = "rx", "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		mcu_dma: dma-controller@7121000 {
 			compatible = "allwinner,sun55i-a523-mcu-dma",
 				     "allwinner,sun50i-a100-dma";
-- 
2.47.3


