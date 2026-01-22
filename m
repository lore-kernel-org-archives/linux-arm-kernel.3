Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3F9C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rjs9Optglr3O3VHNCL6sWxh8myDbwYzhmJWtd0zFmS4=; b=g2Dm35neOoRli7hpIGc6uJ6/GW
	iqFoOpqTCCx996amJ+HhQFviXMBpDdCbE5zOMASJOepX442vktk/JDNN9znSiYJN4CINK4Txw1myc
	n5HQOv5V8aUfRontiHuk5NjQODPUJA1QgdaPvgLHyfPs+SCGV4Y3zes+FOUDIcZllD8DPi4QqOCBX
	Ctt3YInn0JfxGqe3axUE7YYNPf7WNHC68WWPi1dLu3qfRSTedOnNK5qcYwSOAJjgp/RUyzQ45UXwg
	nHoJIiPI3QKW3rfSybcQDnENCcCoVjlgZfqmND0qaj5cxFAdEMg2zMIWqilRTO9Kfd+PO2I2jpI5A
	bBPO0jtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7V-00000006sDr-0RYG;
	Thu, 22 Jan 2026 10:40:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7G-00000006rqY-0Z9M;
	Thu, 22 Jan 2026 10:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EF66600CB;
	Thu, 22 Jan 2026 10:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56E5C116C6;
	Thu, 22 Jan 2026 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078441;
	bh=Q09V5A7X3pM/0XY3mGlRPsebpRgqHCxs0F4mulk67UM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EZiVaVuIMTO/2UAW8yzMgdAEjoh6u3221P/AUaWQeW+KSU3jvxOOnXilWpTERER52
	 xdzUp845i0e75PLSiq4h5jDX7J5xyQPAASSG261fmtp/fqeRwvM5rQL0bWRdJknK3J
	 TdtNEdyskBh0eeZczWa6iER3Ibe2Abn387XrRFF+N3+50W0IULXR+EbraC8ElYPgsd
	 26OGDYVn2UJeFJkh7g2kxptN0BeCom85ZFOouD6qYMJ8+cww2wxEMceQgDRjtGrN+D
	 XBCOmD0TP2S5B1hyhgXGu1uDTHHYRI0Di0hZLmK//K862n0TkZloY9FYDHW9L0kzSD
	 /lJ1+C5IepBnw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:58 +0100
Subject: [PATCH mt76 v2 14/17] wifi: mt76: Do not reset idx for NPU tx
 queues during reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-14-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
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

Do not run reset_q callaback with reset_idx set to true for NPU Tx
queues. This is a preliminary patch to properly manage reset procedure
when NPU offloading is enabled.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.h b/drivers/net/wireless/mediatek/mt76/dma.h
index 4a63de6c5bf5a34cb76f10a427649bc04ebe78b2..2a0226c83f3c92a615d34846b8fcb5fafb42d07c 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.h
+++ b/drivers/net/wireless/mediatek/mt76/dma.h
@@ -174,7 +174,9 @@ void mt76_dma_queue_reset(struct mt76_dev *dev, struct mt76_queue *q,
 static inline void
 mt76_dma_reset_tx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 {
-	dev->queue_ops->reset_q(dev, q, true);
+	bool reset_idx = q && !mt76_queue_is_npu_tx(q);
+
+	dev->queue_ops->reset_q(dev, q, reset_idx);
 	if (mtk_wed_device_active(&dev->mmio.wed))
 		mt76_wed_dma_setup(dev, q, true);
 }

-- 
2.52.0


