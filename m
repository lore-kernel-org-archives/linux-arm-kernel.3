Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14041D1D893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vs/FDGw1585bnuDVeD08ag5yq6r0BenY0Ae2c8+74SU=; b=TIbmNq1J0/qIZfv2LM4Patxvim
	hU7dY6uyyUBGtO7vhaTMz9IlLcyPb8ZxDOeZutUpu7VagaVp9TiKVJqrd5Mk16GHtEeAojvuXxqda
	MRSgvinPb6cPQqTclLx1F0ijUCPlU/aPesN/jz3cBLfFRiv7Z9IzktUvOaiHUXsRGs7UuD5anfvzK
	UXkJShAQee7wKRRh7q4XunbPXfU7cEe2Nwt8ThbRBlne7rBFvmn9yeZJMfCvjOqFTGLvN9hsjjSVf
	ldzyYDJFzEE7XEngQbyck0IDvJdqNa95Ouq14gsjHUXGypg2LUew5++F9Y36djqAnk0xuVZBCx4yS
	ctA/ai5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R3-00000007eeL-3KX3;
	Thu, 04 Dec 2025 08:11:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4R2-00000007ecz-1yAw;
	Thu, 04 Dec 2025 08:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7BE6601E5;
	Thu,  4 Dec 2025 08:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B5AC16AAE;
	Thu,  4 Dec 2025 08:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764835891;
	bh=EEEUGLWIt7MCMt8Rynlc3HmYVn3aGUZLMUFrSR5Ui+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YH0TMlm8JDMZ7mlorJha+V4h+3DhfINJRq1C+XluvfFbRnBTCd5hjnCcnrLGWqGRw
	 O1NASCoJfVrCuhhxFAIvl993fNj4nacNp0Z7VF1BsUn1DmIbMDCXjFe7GeV5cXYv/5
	 zd6R57+MVu1ks974LbJPaFtWXF2LUIYqTYuenlYkdflx7dVEVYaXmWWCWmqdqrlatv
	 jlNAxZ7B2GB8sjUvW+7HQLj/2giSTQ7dHXcmrHWvQVRP3huwlwvBqBanzHJmGDNCBg
	 150JKnSmCdWxTkUaPHq1i8LBMe9qUT6Cmmooij2ELZj1tT7jzEMCUNx68r9Z5nt5gX
	 WSFUgvByt3tpQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Dec 2025 09:10:45 +0100
Subject: [PATCH mt76 03/11] wifi: mt76: always enable RRO queues for
 non-MT7992 chipset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-mt76-npu-eagle-offload-v1-3-7819c52c0893@kernel.org>
References: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
In-Reply-To: <20251204-mt76-npu-eagle-offload-v1-0-7819c52c0893@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hui Ma <hui.ma@airoha.com>
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

MT7996 NPU binary requires to initialize NPU desc_base after configuring
ring_size. This is a preliminary patch to enable NPU offload for MT7996
(7990-Eagle) chipset.

Tested-by: Hui Ma <hui.ma@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index f240016ed9f0ead27e98e350f4fdb818e1686781..fc2ac463e4e78872f9e4e7dacbdaa34bac383fb7 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -6,6 +6,7 @@
 #include <linux/dma-mapping.h>
 #include "mt76.h"
 #include "dma.h"
+#include "mt76_connac.h"
 
 static struct mt76_txwi_cache *
 mt76_alloc_txwi(struct mt76_dev *dev)
@@ -188,16 +189,18 @@ mt76_dma_queue_magic_cnt_init(struct mt76_dev *dev, struct mt76_queue *q)
 static void
 mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
 {
-	Q_WRITE(q, desc_base, q->desc_dma);
-	if ((q->flags & MT_QFLAG_WED_RRO_EN) && !mt76_npu_device_active(dev))
+	if ((q->flags & MT_QFLAG_WED_RRO_EN) &&
+	    (!is_mt7992(dev) || !mt76_npu_device_active(dev)))
 		Q_WRITE(q, ring_size, MT_DMA_RRO_EN | q->ndesc);
 	else
 		Q_WRITE(q, ring_size, q->ndesc);
 
 	if (mt76_queue_is_npu_tx(q)) {
-		writel(q->desc_dma, &q->regs->desc_base);
 		writel(q->ndesc, &q->regs->ring_size);
+		writel(q->desc_dma, &q->regs->desc_base);
 	}
+
+	Q_WRITE(q, desc_base, q->desc_dma);
 	q->head = Q_READ(q, dma_idx);
 	q->tail = q->head;
 }

-- 
2.52.0


