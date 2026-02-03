Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5009E8305F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Ry+NWSCCN7z6pnli5crDc4C7kD20vNARto9OvcFV68=; b=MLPsd6ZYWK/JuLhMmHgrS3Qjlg
	SlGgPEJg3s1aH9JJEx+zi99lPrKXqBaT6wi8HlLaaNQ6wCBiCsSApkZsEIFkuOWa16CBsAB5w/mMw
	PnqRw3dY+5LmPJ77pGdYV3HdVZB+vOTfX3oPdVEey/ec5qqjvu6kXj5HK9LzWvWQO92Ryy4RkMlgw
	4e7gkDQKlRqaP/UpuNMiJd/KXTLQt53gfydNdB1TyE1uZRO5x+Hvz7dihJeLeQG1KExfuCbeXsxnM
	/tOExsM+pTbwRuYnYEOAfLSEGgxr9VGFPKwD13LDTEDDjl1cnxxY8eMrMx74nexCAxnoZKnQVgHGj
	bxkTtEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBps-00000006JZe-069t;
	Tue, 03 Feb 2026 08:32:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBpp-00000006JYw-3jaa;
	Tue, 03 Feb 2026 08:32:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3EFC40B62;
	Tue,  3 Feb 2026 08:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160B1C116D0;
	Tue,  3 Feb 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770107551;
	bh=Rxqd6CZwBn18DO82HK4+2RYTRznPltmfeG6JDWGATF8=;
	h=From:Date:Subject:To:Cc:From;
	b=nRuQmNY7tHHkXXX3CEDKDi3qX9Bc9CY+8ueHn7ndQ+m2AIyj6XNX+hj7l6W4xN5XZ
	 svPYoNCZ+OGWSgb/GUklF5Zy1pbOwkCSuuqDEcSk0JXlxmhWEdLXtbG+YbVu+9DFLI
	 Mny2S3v533zHOwz6Vyed4SCRAQ1DpsZ5jAGV/g6ypnNQS9FFLkdFb/cX3UGTDLtqlr
	 Dju9Sb+Ww5xQ3QlGIKmiKanQl7eJFwJL66m9VKiabaVuil53hq2y6M0frODPdXTrVa
	 gcLzyhgXkMk/opPJX3nGTF1CiOS2B/sOEMVHaTkRVhcefC7gaaFk4IHHqSPX94oeqk
	 qz8NjpcU9PjdQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Feb 2026 09:32:02 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: Add eMLSR support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-mt7996-emlsr-v1-1-38ffb3d5110c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNj3dwSc0tLM93U3JziIl3L5GSLRDMLk+TkpEQloJaCotS0zAqwcdG
 xtbUA6rvh0l4AAAA=
X-Change-ID: 20260203-mt7996-emlsr-9cc8a684ccba
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 MeiChia Chiu <MeiChia.Chiu@mediatek.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_003234_096709_D0FAC8B4 
X-CRM114-Status: GOOD (  12.48  )
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

From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>

Implement set_eml_op_mode mac80211 callback in order to introduce eMLSR
support.

Tested-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  9 ++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 16 +++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 55 ++++++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  4 ++
 4 files changed, 84 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index f44977f9093da76a9f5e2b4d7ce147de28c5b18e..b8629c0a1639b3f55d2133bdea28fa6cae552cac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -628,6 +628,13 @@ struct sta_rec_tx_proc {
 	__le32 flag;
 } __packed;
 
+struct sta_rec_eml_op {
+	__le16 tag;
+	__le16 len;
+	u8 link_bitmap;
+	u8 link_ant_num[3];
+} __packed;
+
 /* wtbl_rec */
 
 struct wtbl_req_hdr {
@@ -796,6 +803,7 @@ struct wtbl_raw {
 					 sizeof(struct sta_rec_he_6g_capa) + \
 					 sizeof(struct sta_rec_pn_info) + \
 					 sizeof(struct sta_rec_tx_proc) + \
+					 sizeof(struct sta_rec_eml_op) + \
 					 sizeof(struct tlv) +		\
 					 MT76_CONNAC_WTBL_UPDATE_MAX_SIZE)
 
@@ -832,6 +840,7 @@ enum {
 	STA_REC_PN_INFO = 0x26,
 	STA_REC_KEY_V3 = 0x27,
 	STA_REC_HDRT = 0x28,
+	STA_REC_EML_OP = 0x29,
 	STA_REC_HDR_TRANS = 0x2B,
 	STA_REC_MAX_NUM
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 7046bf26d8ed6776ea114592f8b89c8b2a605339..48e4cd5af9293cedb9018fd9148dceac67bc4653 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -2368,6 +2368,21 @@ mt7996_reconfig_complete(struct ieee80211_hw *hw,
 					     MT7996_WATCHDOG_TIME);
 }
 
+static int
+mt7996_set_eml_op_mode(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		       struct ieee80211_sta *sta,
+		       struct ieee80211_eml_params *eml_params)
+{
+	struct mt7996_dev *dev = mt7996_hw_dev(hw);
+	int ret;
+
+	mutex_lock(&dev->mt76.mutex);
+	ret = mt7996_mcu_set_emlsr_mode(dev, vif, sta, eml_params);
+	mutex_unlock(&dev->mt76.mutex);
+
+	return ret;
+}
+
 const struct ieee80211_ops mt7996_ops = {
 	.add_chanctx = mt76_add_chanctx,
 	.remove_chanctx = mt76_remove_chanctx,
@@ -2431,4 +2446,5 @@ const struct ieee80211_ops mt7996_ops = {
 	.change_vif_links = mt7996_change_vif_links,
 	.change_sta_links = mt7996_mac_sta_change_links,
 	.reconfig_complete = mt7996_reconfig_complete,
+	.set_eml_op_mode = mt7996_set_eml_op_mode,
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8e1c8e1d6a99f093a2b7d7dc3a0c56f3a4bc220b..3098bddc5f6d6d33433bc653d5ef63bbe5c740fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1302,6 +1302,61 @@ int mt7996_mcu_set_protection(struct mt7996_phy *phy, struct mt7996_vif_link *li
 				     MCU_WM_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
+int mt7996_mcu_set_emlsr_mode(struct mt7996_dev *dev,
+			      struct ieee80211_vif *vif,
+			      struct ieee80211_sta *sta,
+			      struct ieee80211_eml_params *eml_params)
+{
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link;
+	struct sta_rec_eml_op *eml_op;
+	struct mt7996_vif_link *link;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+
+	msta_link = mt76_dereference(msta->link[eml_params->link_id],
+				     &dev->mt76);
+	if (!msta_link)
+		return -EINVAL;
+
+	link = mt7996_vif_link(dev, vif, eml_params->link_id);
+	if (!link)
+		return -EINVAL;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &link->mt76,
+					      &msta_link->wcid,
+					      MT7996_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_EML_OP, sizeof(*eml_op));
+	eml_op = (struct sta_rec_eml_op *)tlv;
+	eml_op->link_bitmap = 0;
+
+	if (eml_params->control & IEEE80211_EML_CTRL_EMLSR_MODE) {
+		unsigned long link_bitmap = eml_params->link_bitmap;
+		unsigned int link_id;
+
+		for_each_set_bit(link_id, &link_bitmap,
+				 IEEE80211_MLD_MAX_NUM_LINKS) {
+			struct mt76_phy *mphy;
+
+			link = mt7996_vif_link(dev, vif, link_id);
+			if (!link)
+				continue;
+
+			mphy = mt76_vif_link_phy(&link->mt76);
+			if (!mphy)
+				continue;
+
+			eml_op->link_bitmap |= BIT(mphy->band_idx);
+		}
+	}
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+}
+
 int mt7996_mcu_set_timing(struct mt7996_phy *phy, struct ieee80211_vif *vif,
 			  struct ieee80211_bss_conf *link_conf)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 3ff730e36fa60830cc9ba5311643b008860cec22..c5d60c273cf8e15e3d54e2d851acbd83ce69719d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -875,6 +875,10 @@ int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 				     struct mt7996_vif_link *link,
 				     struct mt7996_sta_link *msta_link);
 int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode);
+int mt7996_mcu_set_emlsr_mode(struct mt7996_dev *dev,
+			      struct ieee80211_vif *vif,
+			      struct ieee80211_sta *sta,
+			      struct ieee80211_eml_params *eml_params);
 #ifdef CONFIG_MAC80211_DEBUGFS
 void mt7996_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir);

---
base-commit: 4eefc435c985f4dfdba9afb1c705f0e17377c084
change-id: 20260203-mt7996-emlsr-9cc8a684ccba

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


