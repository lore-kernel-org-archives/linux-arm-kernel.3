Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA06C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvtAC/eXbPLJDOSBh2XEp6R8BoHB89iaVxFvJZdhYeU=; b=2ywSfMXSlYbGN4hFQVGy15CvQ4
	LY8Q0cvZ7Cohl6gyUE4MZxuupcrtXiwbA1BPYgzlecLfv9Un/ZrpYlFbzDeNE7fZbzsb2i41xLkqc
	UU8dMWGpSFTWbiLiq5xkFhM3FRsQrSruWG1/FuLYIB+tsH/DGPCC7z/6mRV636KvUGwQdsIDKiEEn
	hT4tJnOMiKRn6UZ4Vb7cIXMT+JuJKnx51to1I3QXWLbLp5gDnzl+VzUPoTXaSOYHhyJ4FRMw94lcw
	uy/mcflBuvlbsnFL9KNmO9t/OztQV6SUD23gE0mAOMWS/bXZslpNxNZz0O7AlkfPpEMYw0LC1jbo1
	Xh6aJ9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6s-00000006rSh-1xia;
	Thu, 22 Jan 2026 10:40:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6o-00000006rPr-1l0p;
	Thu, 22 Jan 2026 10:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6AE4600C4;
	Thu, 22 Jan 2026 10:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3876EC116C6;
	Thu, 22 Jan 2026 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078413;
	bh=jerZlZIqD/n4BQuav9w1m15qyc2xCEnPdzf61DRKMMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aQxFWGLDBNUB2mi34nH4e1GXbCq264QWgz8ZbEB88Hfo9fsUegPTxcQq/mS79xoDn
	 +yoKIm3IuWY6EzrTcVffYVR+iHDDpecohmQvBCdLRwGkhmEovW3IBpwj5YPch1r2zd
	 5V6xI19r2Piq2QIjjBH9Wfuz/iJtzJN+OxvzPN5kC6qfj9bI0JP7GGtfqTLmD2gSCb
	 BBIs0Kxo/ZRyq4xyQKCef3NnuiKQF9xcKfooUUWdpreRrdgpNEbi/xeMx7fuH+T3Qp
	 FsLA8rLMbbdaBcMsTHo2q2Nwy0plDbzy6e3Aj0kfcRKG2Fs9hZPzsLvWA3gy9srqT/
	 jVQazUW6PU2rg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:47 +0100
Subject: [PATCH mt76 v2 03/17] wifi: mt76: always enable RRO queues for
 non-MT7992 chipset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-3-2374614c0de6@kernel.org>
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

MT7990 NPU binary requires to initialize NPU desc_base after configuring
ring_size. This is a preliminary patch to enable NPU offload for MT7996
(Eagle) chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 893ac14285cab3c22f70945d490627a64b643efe..f5c6bb94ccbbda6afe03b24cf245b30c797e855d 100644
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


