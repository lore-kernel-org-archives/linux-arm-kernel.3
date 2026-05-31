Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F7DCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6TGpPgHfFm56JUjwdlaeKJfpJw7m6x4u70bcMACQbLI=; b=OjEdd9BCLGlrklPNoWNhB2pS7p
	G6gaZjbYbvzta2OdC1FC+1nJtrlfhf8TKMu8m8SAJGGesNX1REsDlx6EK4IFLWfV5Qqp7smoay/ou
	Xa2JHAqESThkX4yC4V3wC21icXon4jgfxyXjUm7cgbSeredvjuy3ETxizwQ47DFWeZwa9go8bi58Q
	XFudvNNYfni0sVP0bM1sY2E5m4G/Tf7anaBoYRUiX2bWxLom2pVnqhCyUczVqf4MdObn2yz/9t1E0
	gh6eslZYE6g3ZUbTd19nDlb3bQvA98X6wDsq85vVaqoH5S93r18hNIP6Cuddfs5r4P9mUPyy1il3D
	lozWE/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcCS-00000009PRH-416x;
	Sun, 31 May 2026 09:11:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcCS-00000009PQP-1fmq;
	Sun, 31 May 2026 09:11:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0495600AF;
	Sun, 31 May 2026 09:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9011F00893;
	Sun, 31 May 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780218675;
	bh=6TGpPgHfFm56JUjwdlaeKJfpJw7m6x4u70bcMACQbLI=;
	h=From:Date:Subject:To:Cc;
	b=RGV/adLubwTrr/AqpfjX+pOOAKqhivsYI7PU3+V/5v3JUCJI1TksqC8F4B6byVAFT
	 W5nEQqF7nebdpMI5nMGTeHVwG29wkJUFnK7yqOcZ/4fhGEbC5x49OpsY7RkV1wblHl
	 y7ETvm4+RRW4X3f7/8GP9ndTX+J5uwXQVDV9aLhd/jMndfqwG4Vcar1KAweCPmnJ0d
	 KpHS+1FjVVpgH/gpCAbaXPlRD+IBYhHiZlIpXesBuJDZvShDagnPuvayo3jmvVkZum
	 87ZOQ7MoroWrml2H+gPVP8TgZ+Ae6vIBtHvThSybFCXLGqAJxqQZAJ7muiQ8h4HLJZ
	 ib4e1Z798ieMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 31 May 2026 11:10:59 +0200
Subject: [PATCH] wifi: mt76: mt7996: Fix possible token leak in
 mt7996_tx_prepare_skb()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mt7996_tx_prepare_skb-token-leack-v1-1-2b9c9f59ceb1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NUQrCMBAFr1L224U0amy9ikhI01ddomlJghRK7
 27o58Aws1FGEmS6Nxsl/CTLHCu0p4b828UXWMbKpJU26npu+VtufW9sWe2SsLgEm8PAZQ6I/IH
 zgTsNfVFj542ZqHaqN8l6PB7Pff8DNkwQJnMAAAA=
X-Change-ID: 20260531-mt7996_tx_prepare_skb-token-leack-82e240d8c66f
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

If link_conf or link_sta lookup fails in mt7996_tx_prepare_skb routine,
mt7996 driver leaks an already allocated tx token. Fix the issue
releasing the token in case of error.

Fixes: 7ef0c7ad735b0 ("wifi: mt76: mt7996: Implement MLD address translation for EAPOL")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 8 ++++++--
 drivers/net/wireless/mediatek/mt76/tx.c         | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c98446057282..8c56344d211b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1067,11 +1067,11 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 
 		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
 		if (!link_conf)
-			return -EINVAL;
+			goto error_relase_token;
 
 		link_sta = rcu_dereference(sta->link[wcid->link_id]);
 		if (!link_sta)
-			return -EINVAL;
+			goto error_relase_token;
 
 		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
 					tx_info->buf[1].len, DMA_TO_DEVICE);
@@ -1176,6 +1176,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	tx_info->nbuf = MT_CT_DMA_BUF_NUM;
 
 	return 0;
+
+error_relase_token:
+	mt76_token_release(mdev, id, NULL);
+	return -EINVAL;
 }
 
 u32 mt7996_wed_init_buf(void *ptr, dma_addr_t phys, int token_id)
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 22f9690634c9..f96d9c471853 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -933,7 +933,7 @@ mt76_token_release(struct mt76_dev *dev, int token, bool *wake)
 #endif
 	}
 
-	if (dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
+	if (wake && dev->token_count < dev->token_size - MT76_TOKEN_FREE_THR &&
 	    dev->phy.q_tx[0]->blocked)
 		*wake = true;
 

---
base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
change-id: 20260531-mt7996_tx_prepare_skb-token-leack-82e240d8c66f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


