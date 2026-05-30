Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6299FCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iecpMyBy5MTB0RQzT2oRMj4VPEdKJVOMMF3dhEPLQ5A=; b=YtSyuSOT41H6npsMTaX2kbp0s0
	/WYLmS2aguy+vD+mw2Cexc53S6ImIRszuSfJO3sHOBTT62G2IBEdYd561An5JENqOpJ9Q8g6bVxlI
	rpNxX63WI2EF95FdNCoFVdrzkvYzlUh9YImqWwu30LalGpecdhkHH36fnEmAFMZPMXPBb2phjCHPH
	x47iIXEoZwl+u+7Bqbs+NTk/Fe3zWSF+YijMg1ugRFWt2jAk6P5KZjnnN7RST28AkNeZ0qyZ1Zk0Q
	Twvt3RpTG98DgcgVA/mLQtSRrQptkGyzLwXR/XUm4GBzYi4Gs4ZogLEdE9o1l/gTFoUX9Jb6mfCFJ
	FoetD65g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLZG-00000008sbb-0ZM0;
	Sat, 30 May 2026 15:25:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTLZD-00000008sbB-1yUv;
	Sat, 30 May 2026 15:25:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A678040978;
	Sat, 30 May 2026 15:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF681F00893;
	Sat, 30 May 2026 15:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780154738;
	bh=iecpMyBy5MTB0RQzT2oRMj4VPEdKJVOMMF3dhEPLQ5A=;
	h=From:Date:Subject:To:Cc;
	b=CTE9Cz4CnOBOBMH4lbuzHJRRx6S4pJAjmaSczNC8VC5sRDnJTx7I7837TS5Bpm46U
	 ll9yL07TMB9RYVEB0+CTM0dh9GMY00t240I1pkPMa89qgY/onkSXA9jy2nqwKhctYL
	 GAcPfvF9iUiobumycm/nNMbZGKoCVc7Vi4tAoL4pvvKmTEB8fLaTuKo3JBA+C4mXWD
	 Vh9UtzQAQa/a6WgmcSkgQYUyTyJbd6Kua0aIcC6DbgAoLv9pyPEjcHj6GzRDw8BXrt
	 L6Mt1+AUoXAUEiTexw5RK8LqXAVr2R0SxFgtfHYavFeviFSmdBFNg24RQIj4NbXb8S
	 pPJh+KOTDcCmQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 May 2026 17:25:22 +0200
Subject: [PATCH] wifi: mt76: mt7996: fix reading zeroed info->control.flags
 after mt76_tx_status_skb_add()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-mt76_tx_status_skb_add-overwrite-fix-v1-1-e2c3151c391a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2UC7sVn9FZHS2kyDuEkS52Ds3
 y0+3j3cbaAkTArnZgOhhZXnqYI/NHB7pOlOyKUytK4dXN85fNlxiLZGtWQfjfrMMZWC80LyFTb
 CkVcMffAhnXLu/Ag19Raq+r+5XPf9B00r8Lh2AAAA
X-Change-ID: 20260530-mt76_tx_status_skb_add-overwrite-fix-85818a9bb31f
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Roy Luo <roy-ch.luo@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_082539_577634_CBF21E5D 
X-CRM114-Status: GOOD (  11.28  )
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

mt76_tx_status_skb_add() zeroes the mt76_tx_cb struct stored at
info->status.status_driver_data via memset(). Since info->control and
info->status are members of the same union in ieee80211_tx_info,
this overwrites info->control.flags.
In mt7996_tx_prepare_skb(), mt76_tx_status_skb_add() is called before
mt7996_mac_write_txwi(), which re-reads info->control.flags to extract
IEEE80211_TX_CTRL_MLO_LINK. Because the field has been zeroed, the
link_id always resolves to 0 for frames using global_wcid, leading to
incorrect TXWI configuration.
Fix this by passing link_id as an explicit parameter to
mt7996_mac_write_txwi(). In mt7996_tx_prepare_skb(), the link_id is
already extracted from info->control.flags before the destructive
mt76_tx_status_skb_add() call. For the beacon and inband discovery
callers in mcu.c, use link_conf->link_id directly.

Fixes: f0b0b239b8f36 ("wifi: mt76: mt7996: rework mt7996_mac_write_txwi() for MLO support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 9 +++------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 3 ++-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index c98446057282..2d3f80b3e41a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -856,7 +856,8 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, int pid,
-			   enum mt76_txq_id qid, u32 changed)
+			   enum mt76_txq_id qid, u32 changed,
+			   unsigned int link_id)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
@@ -866,7 +867,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	bool is_8023 = info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP;
 	struct mt76_vif_link *mlink = NULL;
 	struct mt7996_vif *mvif;
-	unsigned int link_id;
 	u16 tx_count = 15;
 	u32 val;
 	bool inband_disc = !!(changed & (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
@@ -876,9 +876,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 
 	if (wcid != &dev->mt76.global_wcid)
 		link_id = wcid->link_id;
-	else
-		link_id = u32_get_bits(info->control.flags,
-				       IEEE80211_TX_CTRL_MLO_LINK);
 
 	mvif = vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
 	if (mvif) {
@@ -1096,7 +1093,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
 	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
 		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
-				      pid, qid, 0);
+				      pid, qid, 0, link_id);
 
 	/* MT7996 and MT7992 require driver to provide the MAC TXP for AddBA
 	 * req
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 8be40d60ad29..a14c63438923 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3103,7 +3103,7 @@ mt7996_mcu_beacon_cont(struct mt7996_dev *dev,
 
 	buf = (u8 *)bcn + sizeof(*bcn);
 	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL, 0, 0,
-			      BSS_CHANGED_BEACON);
+			      BSS_CHANGED_BEACON, link_conf->link_id);
 
 	memcpy(buf + MT_TXD_SIZE, skb->data, skb->len);
 }
@@ -3249,7 +3249,8 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 
 	buf = (u8 *)tlv + sizeof(*discov);
 
-	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL, 0, 0, changed);
+	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL, 0, 0,
+			      changed, link_conf->link_id);
 
 	memcpy(buf + MT_TXD_SIZE, skb->data, skb->len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 0dc4198fcf8b..0d6488522ba7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -874,7 +874,8 @@ void mt7996_mac_enable_nf(struct mt7996_dev *dev, u8 band);
 void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, int pid,
-			   enum mt76_txq_id qid, u32 changed);
+			   enum mt76_txq_id qid, u32 changed,
+			   unsigned int link_id);
 void mt7996_mac_update_beacons(struct mt7996_phy *phy);
 void mt7996_mac_set_coverage_class(struct mt7996_phy *phy);
 void mt7996_mac_work(struct work_struct *work);

---
base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
change-id: 20260530-mt76_tx_status_skb_add-overwrite-fix-85818a9bb31f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


