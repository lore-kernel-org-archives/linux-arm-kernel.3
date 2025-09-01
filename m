Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461A2CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIsHGNsiK2Z/JJXBblLyh2Okd4D4xRnnzFvPUQb5L3k=; b=ATduNGjpZ2xz/HG/1WQK9w+v6C
	YxGy07f+15qyl6oJWTs3Qi+haPvN++GhGLc8wQWj+qTqJzHEadn1UAg2jexAdofnIiKNHwKku9oKs
	5zvP+Ma5t/4vQvLQLyj64bzAOcqqMJv6+MNSAmioqjCY+YPBJsbMS5qg/f8cPx34JG+orq6O87bn1
	aKglZe8uNkTmrlxEiy4HIBsjspve8SRZzr+ij6f1eZNeaLkqtopF2b+1kOTuKqeP/D4KB99DWSxLi
	cZOogyaubfndQtFectdSY/PbcIqusTGvWOKmzS305i1CoCbYoW29mE3Ckq7fRVSJ8YmGvYMmTC9DK
	p0L4sdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnq-0000000EJFQ-2PM9;
	Mon, 01 Sep 2025 23:19:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utBbj-0000000DtHh-16ml;
	Mon, 01 Sep 2025 20:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF5C9600BB;
	Mon,  1 Sep 2025 20:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A3C4CEF0;
	Mon,  1 Sep 2025 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756760310;
	bh=k1s+njTPjCd5rbLQdcWTH0bKYzRVPZIFCmHz60CudLQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=So8XhW/Rc6Xklwtfiulwwb5rbdts4T7m5/cj59AN4ht43JtPH7938fphx9AJ/TcCy
	 mLQ79XKuRv3eDsK6Sws7jF/3Qi45Fvn3GXB1a6vgWpU+QC5NxBPuvurT90k9GtezSL
	 qlbjhFNlTE0lAYzlCuYD9Chvufc2LU03wjk7q2M5r225HZi3Y/q+pbuymz5/3+y7Cs
	 pQeHWHZxxasv6ts3t5DAeQHAOM9V+lC6Y/zlp/RcvqkMxaDByjf0EeEomcbdBcv6j9
	 X8brXLEEe7xQWFRbyxi9TMLvumt69A4lCHycENM1Kq29BJ2R4Az7fvb6vHpCIJ43Zo
	 6EJ9MkkxNNLtQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 01 Sep 2025 22:57:59 +0200
Subject: [PATCH mt76 v2 03/14] wifi: mt76: Differentiate between RRO data
 and RRO MSDU queues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-mt7996-rro-rework-v2-3-1f95086b51d1@kernel.org>
References: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
In-Reply-To: <20250901-mt7996-rro-rework-v2-0-1f95086b51d1@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>, 
 Benjamin Lin <benjamin-jw.lin@mediatek.com>
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

From: Rex Lu <rex.lu@mediatek.com>

This is a preliminary patch to enable WED support for MT7992 Kite
chipset supported by MT7996 driver.

Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Rex Lu <rex.lu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/dma.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76.h | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 18c2a2de59897d038392a00ed5fb5a0de188ac95..68b1dd1dbbe0e2b4850e02ee70253b5e248c69bf 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -477,7 +477,7 @@ mt76_dma_dequeue(struct mt76_dev *dev, struct mt76_queue *q, bool flush,
 	if (!q->queued)
 		return NULL;
 
-	if (mt76_queue_is_wed_rro_data(q))
+	if (mt76_queue_is_wed_rro_data(q) || mt76_queue_is_wed_rro_msdu_pg(q))
 		return NULL;
 
 	if (!mt76_queue_is_wed_rro_ind(q)) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 314221fec512c99cc15b942b7ef7ccecfd1d987e..58d8aa213bb7bf7d1bab0926eca23303d8a733a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1785,8 +1785,14 @@ static inline bool mt76_queue_is_wed_rro_ind(struct mt76_queue *q)
 static inline bool mt76_queue_is_wed_rro_data(struct mt76_queue *q)
 {
 	return mt76_queue_is_wed_rro(q) &&
-	       (FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_RRO_Q_DATA ||
-		FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_RRO_Q_MSDU_PG);
+	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_RRO_Q_DATA;
+}
+
+static inline bool mt76_queue_is_wed_rro_msdu_pg(struct mt76_queue *q)
+{
+	return mt76_queue_is_wed_rro(q) &&
+	       FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) ==
+	       MT76_WED_RRO_Q_MSDU_PG;
 }
 
 static inline bool mt76_queue_is_wed_rx(struct mt76_queue *q)
@@ -1795,7 +1801,8 @@ static inline bool mt76_queue_is_wed_rx(struct mt76_queue *q)
 		return false;
 
 	return FIELD_GET(MT_QFLAG_WED_TYPE, q->flags) == MT76_WED_Q_RX ||
-	       mt76_queue_is_wed_rro_ind(q) || mt76_queue_is_wed_rro_data(q);
+	       mt76_queue_is_wed_rro_ind(q) || mt76_queue_is_wed_rro_data(q) ||
+	       mt76_queue_is_wed_rro_msdu_pg(q);
 
 }
 

-- 
2.50.1


