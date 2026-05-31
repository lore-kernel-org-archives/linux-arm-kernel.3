Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2BECD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WhqWP6DPmYaDR0rC46LQ+OMyXf7a0ICQbsIUqtYXqIw=; b=DKBzkF+U6PIk8c6zeQ9J6lTBOT
	XSO9r5TU3aPmrqPCIyBbvdaFhsEZKL1sVLBi5k0bM8eudD54atX5qnIpXYTffYDVIx1VJ2HNmnK1I
	M7vZkI5r19cgzfdsOXyvmOx6qHBk0WDYkq1MkasQZYh1DT9sKqsftWJrMuDPgRx+hwhAFuv9w85Md
	9MNclCw+7PJgKYSOtuJMsXU4bnt5gz/hRu8C6bNYXYAAfWRqQ/RaM/rr6FYhAm+jT0Rhj98u+/ECp
	pGNug9NVNgcEezMJvCgjv+BQOtEeGu1zckW+YkMBLdT0WLBtKZ9j2sJ0bn60tWdcEw72fNcJzXhU3
	65AYsVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcdf-00000009S0t-2vcE;
	Sun, 31 May 2026 09:39:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTcde-00000009S0Z-0I5A;
	Sun, 31 May 2026 09:39:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8B45600AF;
	Sun, 31 May 2026 09:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100951F00893;
	Sun, 31 May 2026 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780220360;
	bh=WhqWP6DPmYaDR0rC46LQ+OMyXf7a0ICQbsIUqtYXqIw=;
	h=From:Date:Subject:To:Cc;
	b=abo8ef2uYFR2vR0XNGCvdxWj1vvc0PxHpY7N+4IQyajdI/ZiAlW9E/QTGkPSbpUiu
	 wclTN/5d2RfoRdh0btOUXEZixtvcVfMwfLqg8feaZl8R2Gp/5f8LK42HlHPrrBia1g
	 Astd/5RV02q8DW+HSeINsUMriStEe9aAwQUkyaQAz6oyGsG7PVY2eSA7zhc7eVeO/D
	 tx8zJkZsMUT5UFhjE9ieFHVUv6phl/8Cn/RGGqcKPkjpqpIpRvxlvp90l+2Mkj0iZo
	 QdKRYalXe+fQHP6118Fp3xXHttvIGi7MHDMMnPWuFNjpsgE0aK5zZ8iZPxmqNOHNfy
	 BfVM8iSsTaKjA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 31 May 2026 11:38:57 +0200
Subject: [PATCH] wifi: mt76: mt7996: Fix possible NULL pointer dereference
 in mt7996_mac_write_txwi_80211()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-mt7996_mac_write_txwi_80211-null-ptr-deref-v1-1-6dd38e1d3422@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77kIS0cZ+pZQQktUuaCqbtAri3
 xs8zhxmDsgkTBkezQFCP878SRX0rYHw9mki5FgZjDK96lqNS7kPQ+8WH9wmXMiVfWNnldEa03e
 ecS2CkYRGtIFsVDaMXeuhBtcqeb9mz9d5/gGVBt/LfAAAAA==
X-Change-ID: 20260531-mt7996_mac_write_txwi_80211-null-ptr-deref-8ce8d08cf53a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>
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

For injected frames (e.g. via radiotap), mac80211 can pass
info->control.vif = NULL, as explicitly noted in struct ieee80211_tx_info.
Check vif pointer before executing ieee80211_vif_is_mld() in
mt7996_mac_write_txwi_80211 routine in order to avoid a possible NULL
pointer dereference.

Fixes: f0b0b239b8f36 ("wifi: mt76: mt7996: rework mt7996_mac_write_txwi() for MLO support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c98446057282..5ed2c73d5c75 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -757,6 +757,7 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 	bool multicast = is_multicast_ether_addr(hdr->addr1);
 	u8 tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	__le16 fc = hdr->frame_control, sc = hdr->seq_ctrl;
+	struct ieee80211_vif *vif = info->control.vif;
 	u16 seqno = le16_to_cpu(sc);
 	bool hw_bigtk = false;
 	u8 fc_type, fc_stype;
@@ -819,7 +820,7 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 		txwi[3] |= cpu_to_le32(MT_TXD3_REM_TX_COUNT);
 	}
 
-	if (multicast && ieee80211_vif_is_mld(info->control.vif)) {
+	if (multicast && vif && ieee80211_vif_is_mld(vif)) {
 		val = MT_TXD3_SN_VALID |
 		      FIELD_PREP(MT_TXD3_SEQ, IEEE80211_SEQ_TO_SN(seqno));
 		txwi[3] |= cpu_to_le32(val);
@@ -839,12 +840,12 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 		txwi[3] &= ~cpu_to_le32(MT_TXD3_HW_AMSDU);
 	}
 
-	if (ieee80211_vif_is_mld(info->control.vif) &&
+	if (vif && ieee80211_vif_is_mld(vif) &&
 	    (multicast || unlikely(skb->protocol == cpu_to_be16(ETH_P_PAE))))
 		txwi[5] |= cpu_to_le32(MT_TXD5_FL);
 
 	if (ieee80211_is_nullfunc(fc) && ieee80211_has_a4(fc) &&
-	    ieee80211_vif_is_mld(info->control.vif)) {
+	    vif && ieee80211_vif_is_mld(vif)) {
 		txwi[5] |= cpu_to_le32(MT_TXD5_FL);
 		txwi[6] |= cpu_to_le32(MT_TXD6_DIS_MAT);
 	}

---
base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
change-id: 20260531-mt7996_mac_write_txwi_80211-null-ptr-deref-8ce8d08cf53a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


