Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B2CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INCiY9x+Bh3ERQ0/ipdoAtOitbm2xwwhGXBDe6MCpA4=; b=qBDRVZxChrvN6vdykLpzUTxy3e
	6hTNytjm2gn85iXFWP7EXxPctDd6SwxkwhNTxFZ09tf9L+jAIwpZirAeIHZsjpM48bcz7gF8Jc6Fu
	bQ3OM5cRDN7H3WOmg3Jr4QVaSMEkmmNtbH7DQnkgv0iJkpqAnXh6L7CI3HQKWoMXyHOhN0ZpDrT5N
	V+7O/PO7YVJ6rL1rVR2szxwcSwtJczCmBqM/DOASrD5PYyb30tGzdX+SuLxgHBV3FMTyZYU0KHvY7
	MgPZc+xOH4VZZS4VAX4BViTrvKe1+2crvH5Jz3cdxJ8hxfqVs1T2qKDF26lhTDfnvLghLrZaVtdBZ
	92TB7psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKFx-00000008G7Q-2TYv;
	Wed, 12 Mar 2025 11:28:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2I-00000008Dum-3H5l;
	Wed, 12 Mar 2025 11:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEF4CA44D86;
	Wed, 12 Mar 2025 11:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB78C4CEE3;
	Wed, 12 Mar 2025 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778045;
	bh=396UolmAlJjmtiMEGbuRYd+dsfKtturf84IWVxp1530=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=elMndYpcqUKvty7Sl5y3/UeZhNTLYf1Rf/f6sp8HhKjVlveRVaXbbcVGS7frZyEBT
	 BPhR6B/ioRQeR4GktcVvo2L3YFOa+y2Cl9LrGYCkGJ8lAC0bsZ0M6e3hjvRPWMyErI
	 eqDm3xulWxj14RL8PaLbOuEV1Of7eu05kmF0qrHJYYB+dzPyeNqyV/eYIrogTMO3PG
	 Utpf4oszuxXPNNkcn655Jb8ZzgJSKgr+CiUx5ShZ+v/YKLaS8tIGMUAZROGP1HHKEb
	 lF57v5zbCQtv+JA1fa1nDsiWEes2UM8fYtWB2nOQIWs1ZdLs/m7lEpWcEp7JYpGT9l
	 B+RaKv7GEeWIQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:46 +0100
Subject: [PATCH 02/21] wifi: mt76: mt7996: Add
 mt7996_mcu_sta_mld_setup_tlv() and mt7996_mcu_sta_eht_mld_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-2-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>, 
 Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041406_962746_C8D4A21B 
X-CRM114-Status: GOOD (  12.65  )
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

mt7996_mcu_sta_mld_setup_tlv is needed to push MLO configuration to the
MCU. This is a preliminary patch to enable MLO for MT7996 driver

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 79 +++++++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h | 32 ++++++++++
 2 files changed, 111 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 0cc822a8a6799a4552fa537cab2f13d6537bb1a8..ac01eb880e2a6f6ef3a81591bcacd2b90c48986a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2197,6 +2197,80 @@ mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 				 sizeof(req), true);
 }
 
+static void
+mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
+			     struct ieee80211_sta *sta)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	unsigned long links = sta->valid_links;
+	unsigned int nlinks = hweight16(links);
+	struct mld_setup_link *mld_setup_link;
+	struct sta_rec_mld_setup *mld_setup;
+	struct mt7996_sta_link *msta_link;
+	struct ieee80211_vif *vif;
+	unsigned int link_id;
+	struct tlv *tlv;
+
+	msta_link = mt76_dereference(msta->link[msta->deflink_id], &dev->mt76);
+	if (!msta_link)
+		return;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MLD,
+				      sizeof(struct sta_rec_mld_setup) +
+				      sizeof(struct mld_setup_link) * nlinks);
+
+	mld_setup = (struct sta_rec_mld_setup *)tlv;
+	memcpy(mld_setup->mld_addr, sta->addr, ETH_ALEN);
+	mld_setup->setup_wcid = cpu_to_le16(msta_link->wcid.idx);
+	mld_setup->primary_id = cpu_to_le16(msta_link->wcid.idx);
+
+	if (nlinks > 1) {
+		link_id = __ffs(links & ~BIT(msta->deflink_id));
+		msta_link = mt76_dereference(msta->link[msta->deflink_id],
+					     &dev->mt76);
+		if (!msta_link)
+			return;
+	}
+	mld_setup->seconed_id = cpu_to_le16(msta_link->wcid.idx);
+	mld_setup->link_num = nlinks;
+
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	mld_setup_link = (struct mld_setup_link *)mld_setup->link_info;
+	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt7996_vif_link *link;
+
+		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
+		if (!msta_link)
+			continue;
+
+		link = mt7996_vif_link(dev, vif, link_id);
+		if (!link)
+			continue;
+
+		if (!msta_link)
+			continue;
+
+		mld_setup_link->wcid = cpu_to_le16(msta_link->wcid.idx);
+		mld_setup_link->bss_idx = link->mt76.idx;
+		mld_setup_link++;
+	}
+}
+
+static void
+mt7996_mcu_sta_eht_mld_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
+			   struct ieee80211_sta *sta)
+{
+	struct sta_rec_eht_mld *eht_mld;
+	struct tlv *tlv;
+	int i;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_EHT_MLD, sizeof(*eht_mld));
+	eht_mld = (struct sta_rec_eht_mld *)tlv;
+
+	for (i = 0; i < ARRAY_SIZE(eht_mld->str_cap); i++)
+		eht_mld->str_cap[i] = 0x7;
+}
+
 int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		       struct ieee80211_bss_conf *link_conf,
 		       struct ieee80211_link_sta *link_sta,
@@ -2255,6 +2329,11 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		mt7996_mcu_sta_eht_tlv(skb, link_sta);
 		/* starec muru */
 		mt7996_mcu_sta_muru_tlv(dev, skb, link_conf, link_sta);
+
+		if (sta->mlo && conn_state != CONN_STATE_DISCONNECT) {
+			mt7996_mcu_sta_mld_setup_tlv(dev, skb, sta);
+			mt7996_mcu_sta_eht_mld_tlv(dev, skb, sta);
+		}
 	}
 
 	ret = mt7996_mcu_add_group(dev, link_conf->vif, sta);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 5fdc47dad28c66a46c12a1fcede9ef10c7e6d44e..2ab6a53bee869a69d2ee7c0f342e379450c3d6dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -625,6 +625,35 @@ struct sta_rec_hdr_trans {
 	u8 mesh;
 } __packed;
 
+struct sta_rec_mld_setup {
+	__le16 tag;
+	__le16 len;
+	u8 mld_addr[ETH_ALEN];
+	__le16 primary_id;
+	__le16 seconed_id;
+	__le16 setup_wcid;
+	u8 link_num;
+	u8 info;
+	u8 __rsv[2];
+	u8 link_info[];
+} __packed;
+
+struct sta_rec_eht_mld {
+	__le16 tag;
+	__le16 len;
+	u8 nsep;
+	u8 __rsv1[2];
+	u8 str_cap[__MT_MAX_BAND];
+	__le16 eml_cap;
+	u8 __rsv2[4];
+} __packed;
+
+struct mld_setup_link {
+	__le16 wcid;
+	u8 bss_idx;
+	u8 __rsv;
+} __packed;
+
 struct hdr_trans_en {
 	__le16 tag;
 	__le16 len;
@@ -798,6 +827,9 @@ enum {
 					 sizeof(struct sta_rec_eht) +		\
 					 sizeof(struct sta_rec_hdrt) +		\
 					 sizeof(struct sta_rec_hdr_trans) +	\
+					 sizeof(struct sta_rec_mld_setup) +	\
+					 sizeof(struct mld_setup_link) * 3 +	\
+					 sizeof(struct sta_rec_eht_mld) +	\
 					 sizeof(struct tlv))
 
 #define MT7996_MAX_BEACON_SIZE		1338

-- 
2.48.1


