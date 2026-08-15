Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C3CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0OgYR5cG7RLSaxiqpMZoRB+CAStVXsS8fZioSnlSgzg=; b=DMiy5mpcHYfPVOF5AN5YTuGow4
	dCt73jz7LYv8MFqpFBR3sc25Yy+CWd1KjCH6LjHavNHOoI9H/YUW/sui8dnxmvwUak6VXPNxfTZA/
	5P0D6yUa/ACBB0CoSYS1DRnGo/kFgJbg/eielLpXV2Xi3aPEA/LE/P//QXSTW/OJMyoUXrzaPoiSM
	OXh+dSzx4J92/DvVGp6y8eO3aVg0/TTDQqj9E9MJvpWrT44dwTWg5cEvHAklvOsJzmn0XqXXs6wFR
	UbSn07aIUMwXtw7qj9drgjBztx5e2/ncgZBeWChhGwgDDpEXaajcIYIal8UrexxJ1l7DphFMLYeg7
	a9NZ/W6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBq1-00000003klT-0FBG;
	Sat, 15 Aug 2026 10:42:05 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBpr-00000003kjW-131B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 10:41:58 +0000
Received: by chaosmail.tech (Postfix) id 27B8F1C9866;
	Sat, 15 Aug 2026 10:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786790512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OgYR5cG7RLSaxiqpMZoRB+CAStVXsS8fZioSnlSgzg=;
	b=g/NBGHmnzwZVgfjiJ1k8rovpGanAjlkOQiYmsco+as1lG/G51U8uSnzXWCXASlS/CI404i
	AGaQAh3X/p+Vr6eas1HZbmoeBcj57pVv0Hl8y/rHm3KMcu7EHZuD1hp6ZGFsaMcrXOSsHV
	bQ5LGQLlsmZG5BmgCS93DI8czYL9hxE=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 15 Aug 2026 12:41:39 +0200
Subject: [PATCH v4 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-t603x-admac-v4-2-1149e342dcb0@chaosmail.tech>
References: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
In-Reply-To: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786790508; l=2802;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=6o2SmQ7oKeKKGo+Lr0gJTUIospqUw8y5xkGfdrNx5Ms=;
 b=89yI0A4qNo+x/fuUfTR6XYKzUK9iB42AIpO5joowlOWPM3xLQr6jeuT+bPQJRlVt0fuB1/eE5
 D5iEC64VRP3Cx4O0q5SCRJm03b0musrcktSb0SeySEw/c87Posf7LUI
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_034155_794341_F38ED5D9 
X-CRM114-Status: GOOD (  13.85  )
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

The admacs present on t8122 and t603x SoCs need additional writes in
order to operate correctly. The exact purpose of this register
is unknown

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/dma/apple-admac.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..9a1c79c12268 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -39,10 +39,14 @@
 
 #define FLAG_DESC_NOTIFY	BIT(16)
 
+#define T8122_UNK_28_VAL	0x200000
+
 #define REG_TX_START		0x0000
 #define REG_TX_STOP		0x0004
 #define REG_RX_START		0x0008
 #define REG_RX_STOP		0x000c
+#define REG_UNK_28		0x0028
+#define REG_UNK_2C		0x002c
 #define REG_IMPRINT		0x0090
 #define REG_TX_SRAM_SIZE	0x0094
 #define REG_RX_SRAM_SIZE	0x0098
@@ -85,6 +89,10 @@
 struct admac_data;
 struct admac_tx;
 
+struct admac_hw {
+	bool set_unk28;
+};
+
 struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
@@ -127,6 +135,7 @@ struct admac_data {
 	struct mutex cache_alloc_lock;
 	struct admac_sram txcache, rxcache;
 
+	const struct admac_hw *hw;
 	int irq;
 	int irq_index;
 	int nchannels;
@@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
 	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
 		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
 
+	if (ad->hw->set_unk28) {
+		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
+		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
+	}
+
 	switch (is_tx ? config->dst_addr_width : config->src_addr_width) {
 	case DMA_SLAVE_BUSWIDTH_1_BYTE:
 		wordsize = 1;
@@ -800,11 +814,18 @@ static int admac_device_config(struct dma_chan *chan,
 	return 0;
 }
 
+static const struct admac_hw admac_base_hw = {};
+
+static const struct admac_hw admac_t8122_hw = {
+	.set_unk28 = true,
+};
+
 static int admac_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct admac_data *ad;
 	struct dma_device *dma;
+	const struct admac_hw *hw;
 	int nchannels;
 	int err, irq, i;
 
@@ -822,6 +843,8 @@ static int admac_probe(struct platform_device *pdev)
 	ad->dev = &pdev->dev;
 	ad->nchannels = nchannels;
 	mutex_init(&ad->cache_alloc_lock);
+	hw = of_device_get_match_data(&pdev->dev);
+	ad->hw = hw ? hw : &admac_base_hw;
 
 	/*
 	 * The controller has 4 IRQ outputs. Try them all until
@@ -936,6 +959,7 @@ static void admac_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id admac_of_match[] = {
+	{ .compatible = "apple,t8122-admac", .data = &admac_t8122_hw },
 	{ .compatible = "apple,t8103-admac", },
 	{ .compatible = "apple,admac", },
 	{ }

-- 
2.55.0


