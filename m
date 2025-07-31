Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD028C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUX+d8JbBBUEyfpNjkucPJkYMplazaOOjMO10Lujajw=; b=ngsxY50CveYfZaW75MaKaXY0q3
	XTyyVbvZOWmWGJdyLfLa7K+l7hK98jfwxWqjzg2S4CCOtw6ghSjJ9ohKwADRGpdxdbfleBmZSg3cv
	yTxVmOfHolQYNqfl7aHkF7ZUoumPimqZeCF1ahr53tSXfbUdMcc0T+cNe57+67eXUgV2u4AgdDtgt
	hNv2byD1SxVT83fZece/P1GFLyRi2N02mGvWjBBx3cNiLrYOnSpWVW8IJt6GkyXD/djRsLDLKBibh
	uZ/X5aHHM85V7wEYAyggTciLxZf+sf4hP8sTGUqVhTm7GhNc5U7dBg96nOHeExtA7HCThJWCGXaMd
	KY4vSRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQsU-00000003PUU-0hB0;
	Thu, 31 Jul 2025 10:51:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQjP-00000003OcB-2FZF;
	Thu, 31 Jul 2025 10:41:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC1DEA55080;
	Thu, 31 Jul 2025 10:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EFFC4CEEF;
	Thu, 31 Jul 2025 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753958510;
	bh=Zv9B1BZcj1iBDiQ4v2rREb+WvVu5FDMKWGif82SnQKA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p7I95YL6cC6m65vfvHBDENenBKmvl3aM1tKl2HjcRjgto6795iom4/kctdssoKPVC
	 RSKeMOjkswPBnVBY76m/A+ILgKsFNVXlZX/Q3+/bI1P5SRit0dmNqsqjR9HoVgNfdj
	 1yyCvehGEA71nfzdC3WRTCyvNsd2/UqthL5Fh7+yT2P8iiWC/Ymsz6wIqbG7Lb3mWi
	 Zqn0G975em3y8ZTKbP23O4Ve4RaoqY0WO1ht6fZaq0OZhwvmV0Q99dpOzMQbmPPKpA
	 9LSDIui1VpAClUWoecT9vLgPprsdnxMDo1RyLBP2sx3DxDLgiUxryz49jGNgW6ZSVa
	 4/+FcnzY26mbA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 31 Jul 2025 12:41:24 +0200
Subject: [PATCH mt76 2/2] wifi: mt76: mt7996: Set proper link destination
 address in mt7996_tx()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-mt7996-mlo-devel-v1-2-7ff4094285d0@kernel.org>
References: <20250731-mt7996-mlo-devel-v1-0-7ff4094285d0@kernel.org>
In-Reply-To: <20250731-mt7996-mlo-devel-v1-0-7ff4094285d0@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_034151_715149_C31CD5F1 
X-CRM114-Status: GOOD (  11.09  )
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

Overwrite 802.11 destination address with in-use link address for MLD
capable VIFs in mt7996_tx routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 34 ++++++++++++++++++++----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 662ce4bb5178a4b8765b2b337ea6baea649d3ef2..3d5ba568243b04465530ff788b7f625c9721e25d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1252,21 +1252,20 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		      struct ieee80211_tx_control *control,
 		      struct sk_buff *skb)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	struct ieee80211_sta *sta = control->sta;
+	struct mt7996_sta *msta = sta ? (void *)sta->drv_priv : NULL;
 	struct mt76_phy *mphy = hw->priv;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
+	struct mt7996_vif *mvif = vif ? (void *)vif->drv_priv : NULL;
 	struct mt76_wcid *wcid = &dev->mt76.global_wcid;
 	u8 link_id = u32_get_bits(info->control.flags,
 				  IEEE80211_TX_CTRL_MLO_LINK);
-	struct mt7996_sta *msta;
-	struct mt7996_vif *mvif;
 
 	rcu_read_lock();
 
-	msta = control->sta ? (void *)control->sta->drv_priv : NULL;
-	mvif = vif ? (void *)vif->drv_priv : NULL;
-
 	/* Use primary link_id if the value from mac80211 is set to
 	 * IEEE80211_LINK_UNSPECIFIED.
 	 */
@@ -1277,6 +1276,31 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 			link_id = mvif->mt76.deflink_id;
 	}
 
+	if (ieee80211_vif_is_mld(vif)) {
+		struct ieee80211_bss_conf *link_conf;
+
+		if (msta) {
+			struct ieee80211_link_sta *link_sta;
+
+			link_sta = rcu_dereference(sta->link[link_id]);
+			if (!link_sta)
+				link_sta = rcu_dereference(sta->link[msta->deflink_id]);
+
+			if (link_sta) {
+				memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
+				if (ether_addr_equal(sta->addr, hdr->addr3))
+					memcpy(hdr->addr3, link_sta->addr, ETH_ALEN);
+			}
+		}
+
+		link_conf = rcu_dereference(vif->link_conf[link_id]);
+		if (link_conf) {
+			memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
+			if (ether_addr_equal(vif->addr, hdr->addr3))
+				memcpy(hdr->addr3, link_conf->addr, ETH_ALEN);
+		}
+	}
+
 	if (mvif) {
 		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
 

-- 
2.50.1


