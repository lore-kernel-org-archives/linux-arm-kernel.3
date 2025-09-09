Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1253CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AevxMfx8hdagBiRHxDbrlmI3TiiYJEheAM9Xip8jn5w=; b=rm74TwMVNAk4JWfkyns4RF7Wrk
	q6EgDp6MWUuJHamW+SBa7QNdQTPzqh5GpK4TVEzFG3FnfP8fE5m9WeU7xHIZK1TpH3Q93oFBbRhGP
	ETHXq4xABM4JHZrA7Yre8bCZ21MgEPE9ULG0MaToTldeS+exHPJVPpR52/2DOVjYsyfvYovx0bDwp
	RXw71a7UY2ahJoa7Okcx+Rwu959IE4o0QOwSYO9BtYU+Z2DgJ2/UD1UkVAzQQSkxjWzRWK3vTj3v9
	Ex/BNf9orNVd0BogWemlZOaIRUruWm4nb1oKJOuLxNcxFUu5K814CNRGtMDdNM2afg1gKHRTHojl4
	/CLp+ycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw25p-000000093dQ-19sq;
	Tue, 09 Sep 2025 17:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0PJ-000000087oI-2Znl;
	Tue, 09 Sep 2025 15:37:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B8D7601AC;
	Tue,  9 Sep 2025 15:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D59C4CEF4;
	Tue,  9 Sep 2025 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757432240;
	bh=vL/J10oKnTlXYI5PfdNKE9ajgEubHM/URGlubzfC7hI=;
	h=From:Date:Subject:To:Cc:From;
	b=aAkL1shpFxDQJL4yKhLLjF5ueSGa7SoONAl/2lVLQ3nIOkt0xnKUphuRt9uXu99q5
	 bifMeKd5Wi+aIfMBXSpoE+RW3rh8JX40cxtXoPetVxD+3E1FE5LmPBaRYeEV7OxWyL
	 KtXNoEbuJNDrFVKgS4YGpe7hPJb/OFanvnuv5V/ahdAvMGz4Img1rODxhHs88pBr+5
	 PPSj+0FP1xN4NyIUFnqf1psy9qpLg9mHVWOxkJgb4kBC7i+TA+GdQQj4JxFrSN5QCh
	 b1yYjaC2Wtr1vTXL0TCH1j6kvcm9eD540ojl+i84Y8hTS/BAnxx0sFMXZligj47Q69
	 MuWGf02K199ag==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Sep 2025 17:37:12 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Add missing DMA sync for EAPOL
 frames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-mt7996-mlo-eapol-missing-dma-sync-v1-1-623924fdb875@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKdJwGgC/x3NTQqEMAxA4atI1gZqxZ94FZlF0agB20ojwwzi3
 S0uv817FygnYYWhuCDxV1RiyKjKAqbNhZVR5mywxjaGDKE/O6IW/R6R3RF39KIqYcXZO9R/mJB
 cVS9tY/uaCHLnSLzI732Mn/t+AP4Dvm5zAAAA
X-Change-ID: 20250909-mt7996-mlo-eapol-missing-dma-sync-9a13f6528399
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
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

Add missing DMA sync before updating EAPOL frames 802.11 addresses.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 588f4aed31eda30aa48eeb06cfcbf36a0e147682..14c4c575a99895f6888a7bdb1353e05e84c8a3c9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1067,6 +1067,9 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		if (!link_sta)
 			return -EINVAL;
 
+		dma_sync_single_for_cpu(mdev->dma_dev, tx_info->buf[1].addr,
+					tx_info->buf[1].len, DMA_TO_DEVICE);
+
 		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
 		memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
 		if (ieee80211_has_a4(hdr->frame_control)) {
@@ -1077,6 +1080,9 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		} else if (ieee80211_has_fromds(hdr->frame_control)) {
 			memcpy(hdr->addr3, vif->addr, ETH_ALEN);
 		}
+
+		dma_sync_single_for_device(mdev->dma_dev, tx_info->buf[1].addr,
+					   tx_info->buf[1].len, DMA_TO_DEVICE);
 	}
 
 	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);

---
base-commit: b054061870ecbed6305c0f559ae90f459f17637d
change-id: 20250909-mt7996-mlo-eapol-missing-dma-sync-9a13f6528399

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


