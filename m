Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA770C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wnOAnqRqxrdJ5YAUizJa8VOEsYi98sT3cTAgD1ECcQE=; b=vyaKT679ax1IVpE7viCszdy2Jf
	5Ea1yzNWx6hCg9sI5PiH1KYmWZDDq/Tm4FDcdYxgWxrVGAID4hL3GR0Cs+Gy9djIUEjR8rErdWWth
	owHM9D2Y7cxXB8HmXzQIIRN61/3JEkfd5sl+VBvuPAamZIw7m95p6lSwewbghcvAmDq5rXAKYDXui
	NhxeCNbLPu/SGAnPatm5ywCjraNuI1zHwUQHOeagIo6UalAharhlOJ5D33Zl8wZ5gwBEKds/Y7x/E
	FE3VnMSStrJuTYlNbHW2bebDKSctvR81C5cMjL0LYCE2I1vCF6+FGE8EmKbYgw3B15jC8co5ddIlr
	AW2sO30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYIW-0000000A2LD-1izC;
	Wed, 25 Jun 2025 22:08:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU7O-00000009VU1-3diT;
	Wed, 25 Jun 2025 17:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=wnOAnqRqxrdJ5YAUizJa8VOEsYi98sT3cTAgD1ECcQE=; b=kQrvQPCJqC8lzeCpM5wx5y1TQo
	n1FU3LrjI3A3FyJUJp8WE83hM+Beu8ljWIw7eG5fz/fbmZu0378FULsfIOUGyfzYi+3/mp3imsbX7
	k9FzOrJE++QtGUeImqgQ/DoryWNfzxM/RB0ymY4crR4zyU5SDeT25TY2ocpS6M+5AhhRBKrjq2Rgh
	FvHjSjqGtyYmdZA6q4px5wIMnsMOV0U4C+4OHoGEGrPMTJs+6quirjWcp8tsCsExw6yb3vIrVKmLX
	jeE/8z1WdGcEkr7NSPEilJs9BK2SbeyWR1KtflV6ncKhyTv0s1XjkvNLS7LMzFhM9w5scQSpNlrQS
	BkP21F1w==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU7M-00000005u6m-0dfe;
	Wed, 25 Jun 2025 17:41:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52E285C5A9D;
	Wed, 25 Jun 2025 17:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DD2C4CEEA;
	Wed, 25 Jun 2025 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750873260;
	bh=Al67X+wyrvlZmIUJb011DLtITPEcTdpDYcvQmDhjBS0=;
	h=From:Date:Subject:To:Cc:From;
	b=E5CYvtwZla5r19x/yWIvWJ5UVoglbMyPejYpkx7KxR5sQnb+4O3y5M6snePa/3KzG
	 8Dk80+918QeRDyU0bqriBqjZ3ZCkwRT79cFJ3kXkhEiP0nhzDqXF5Gq4j6wYzRINYf
	 T9/tE4yln7zrDF63xxm+W2++MTGnfe7XKIfuGISSkD+onFa69lay32vj9oUUS5WCdt
	 5uLeEdw9/KppzTbn7DZMvgBgABaDKca1fIYayQieGSReq1NYrnRd9zdJN/nHXLZrU7
	 Dgq2YZIGpH0Y7MRC9JVsX3OzBJRfqLHHqMY0dN544pTFzZAvkLKqI/pyrSSjpORPzQ
	 ZOASr3tUVNhqA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 25 Jun 2025 19:40:30 +0200
Subject: [PATCH mt76] wifi: mt76: Get rid of dma_sync_single_for_device()
 for MMIO devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-mt76-sync-for-device-v1-1-e687e3278e1a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI00XGgC/x3MTQqAIBBA4avErBswI/u5SrQwHWsWWWhEEd49a
 fkW33shUmCKMBQvBLo48u5zVGUBZtV+IWSbG6SQjVCywe1sFcbHG3R7QJuJIax1NQtleqs6B5k
 egRzf/3acUvoAyL+ONGYAAAA=
X-Change-ID: 20250625-mt76-sync-for-device-3a1b06c9d68f
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_184104_501906_710A8E17 
X-CRM114-Status: GOOD (  12.14  )
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

Since the page_pool for MT76 MMIO devices are created with
PP_FLAG_DMA_SYNC_DEV flag, we do not need to sync_for_device each page
received from the pool since it is already done by the page_pool
codebase.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 11 +++--------
 drivers/net/wireless/mediatek/mt76/wed.c |  6 +-----
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 35b4ec91979e6a55b80feec0eca68afa28d2c5b9..87f531297f8513b0caee2d034184ddd8fa3b6a21 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -643,10 +643,8 @@ mt76_dma_rx_fill_buf(struct mt76_dev *dev, struct mt76_queue *q,
 
 	while (q->queued < q->ndesc - 1) {
 		struct mt76_queue_buf qbuf = {};
-		enum dma_data_direction dir;
-		dma_addr_t addr;
-		int offset;
 		void *buf = NULL;
+		int offset;
 
 		if (mt76_queue_is_wed_rro_ind(q))
 			goto done;
@@ -655,11 +653,8 @@ mt76_dma_rx_fill_buf(struct mt76_dev *dev, struct mt76_queue *q,
 		if (!buf)
 			break;
 
-		addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
-		dir = page_pool_get_dma_dir(q->page_pool);
-		dma_sync_single_for_device(dev->dma_dev, addr, len, dir);
-
-		qbuf.addr = addr + q->buf_offset;
+		qbuf.addr = page_pool_get_dma_addr(virt_to_head_page(buf)) +
+			    offset + q->buf_offset;
 done:
 		qbuf.len = len - q->buf_offset;
 		qbuf.skip_unmap = false;
diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wireless/mediatek/mt76/wed.c
index f89e4537555c59ac05a64067a43d4a806917bb1d..63f69e152b1cbb5bc0170a44976be1c7c52f21dc 100644
--- a/drivers/net/wireless/mediatek/mt76/wed.c
+++ b/drivers/net/wireless/mediatek/mt76/wed.c
@@ -34,11 +34,10 @@ u32 mt76_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
 	struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
 	struct mtk_wed_bm_desc *desc = wed->rx_buf_ring.desc;
 	struct mt76_queue *q = &dev->q_rx[MT_RXQ_MAIN];
-	int i, len = SKB_WITH_OVERHEAD(q->buf_size);
 	struct mt76_txwi_cache *t = NULL;
+	int i;
 
 	for (i = 0; i < size; i++) {
-		enum dma_data_direction dir;
 		dma_addr_t addr;
 		u32 offset;
 		int token;
@@ -53,9 +52,6 @@ u32 mt76_wed_init_rx_buf(struct mtk_wed_device *wed, int size)
 			goto unmap;
 
 		addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
-		dir = page_pool_get_dma_dir(q->page_pool);
-		dma_sync_single_for_device(dev->dma_dev, addr, len, dir);
-
 		desc->buf0 = cpu_to_le32(addr);
 		token = mt76_rx_token_consume(dev, buf, t, addr);
 		if (token < 0) {

---
base-commit: 4327120e4c508ad68fec3253b5781f0e52dc8dba
change-id: 20250625-mt76-sync-for-device-3a1b06c9d68f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


