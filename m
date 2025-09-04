Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E012CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gbXS5kIAJbaa3+Ndiyde30EBh5kNcPiDlQdLez9DaI=; b=0rgHlvhdSPPf/r1U5pq55yS3KT
	CcwMw+a+zG+vwj+NRjIDbB+sILnkQ2CSBbtBxl81ubHCtuMLMXPStHlTqxPXN0beYbGEYVVTRM6OA
	+ElTuu4yU9PsEGHkETydEwdJknZSoFbUK3jPfIqzJkxS4XE4nQvI6tKytv4qwsLeXb2urxXUAMVY0
	mJMmv6lWi0EtULQZczi0EwXJm8HXOQaN44ZQ+b1RdOtK7MVBV/iistQRLjxA7KGIMlX7HicaPjj1o
	J/gKlCiueIeuDYxW0DEftU2YZ/PXRd001tFu85CGnuztb0dgvYNt0lGb8pKA5qpFcC78edvepVJRI
	miZTb+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5KL-0000000AER4-1ECQ;
	Thu, 04 Sep 2025 08:28:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qK-0000000A2lM-3L3k;
	Thu, 04 Sep 2025 07:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CD0D60053;
	Thu,  4 Sep 2025 07:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6AEC4CEF0;
	Thu,  4 Sep 2025 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972635;
	bh=nH1eMkt9+F83fYnXjSaQxEn/zpIxbfy/fTkLBMIxBic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F2PEC7P7PfI5B1Dttu09Dy3C+hMeE9l9PrulUsn+Yqs4HUe1VQaXNcOjTPXvZcIev
	 vQq75jfjCk8hq8czRGbCcsHt0p730fKi7KOEJjYkrmY1+8Az9+hbMQwiBr+qOCGpQH
	 FUg+LBDYS0UyNuO86PzMFzj/S06EEFvDNBPbY/VDYBIXJR+tjvdrho4pMMewWYhgFS
	 9kzhaWAQMzFdWEViVCa92gdXPuvgApcTOD4euW8AVDEeXW8A0Afxi9HAfdkRQFaw+q
	 pZ99Le7B5gGJBoELZot/b8+J85xp2lru3lQlVtVI7FZVnNpnsJbPmGhvFLxpIPJpD8
	 03yEUhmaupDMA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 09:56:39 +0200
Subject: [PATCH mt76 1/4] wifi: mt76: mt7996: Fix
 mt7996_reverse_frag0_hdr_trans for MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-mlo-more-fixes-v1-1-89d8fed67f20@kernel.org>
References: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
In-Reply-To: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

From: Shayne Chen <shayne.chen@mediatek.com>

Update mt7996_reverse_frag0_hdr_trans routine to support MLO.

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c525fe68897d5ba5412dabb8c1341a5ce55205d8..646c6f2f72918bbbdceddb5321c862f326d803b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -229,7 +229,9 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 {
 	struct mt76_rx_status *status = (struct mt76_rx_status *)skb->cb;
 	struct ethhdr *eth_hdr = (struct ethhdr *)(skb->data + hdr_gap);
-	struct mt7996_sta *msta = (struct mt7996_sta *)status->wcid;
+	struct mt7996_sta_link *msta_link = (void *)status->wcid;
+	struct mt7996_sta *msta = msta_link->sta;
+	struct ieee80211_bss_conf *link_conf;
 	__le32 *rxd = (__le32 *)skb->data;
 	struct ieee80211_sta *sta;
 	struct ieee80211_vif *vif;
@@ -246,8 +248,11 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	if (!msta || !msta->vif)
 		return -EINVAL;
 
-	sta = container_of((void *)msta, struct ieee80211_sta, drv_priv);
+	sta = wcid_to_sta(status->wcid);
 	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	link_conf = rcu_dereference(vif->link_conf[msta_link->wcid.link_id]);
+	if (!link_conf)
+		return -EINVAL;
 
 	/* store the info from RXD and ethhdr to avoid being overridden */
 	frame_control = le32_get_bits(rxd[8], MT_RXD8_FRAME_CONTROL);
@@ -260,7 +265,7 @@ static int mt7996_reverse_frag0_hdr_trans(struct sk_buff *skb, u16 hdr_gap)
 	switch (frame_control & (IEEE80211_FCTL_TODS |
 				 IEEE80211_FCTL_FROMDS)) {
 	case 0:
-		ether_addr_copy(hdr.addr3, vif->bss_conf.bssid);
+		ether_addr_copy(hdr.addr3, link_conf->bssid);
 		break;
 	case IEEE80211_FCTL_FROMDS:
 		ether_addr_copy(hdr.addr3, eth_hdr->h_source);

-- 
2.50.1


