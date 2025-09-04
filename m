Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD0ECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=On26V9ME5akQIBaMC6tlSg3QQFD9LnqlMMGLQBVdmoU=; b=chqpjpCWqWTvA74fz+2gkZUP9w
	GpDBn6EdLVNCGfKPwDf7MJ6tmAqgSxuE/VHB30d4wyHrGw/JLbKf/gl44OpdWIgNktOa2TiwH8x9I
	y0ZR4cajJZDrY/K6o+isQskwkgu7GS968qUg1AHsLifQSNUh5kPMAKir2cLEaTV5kRiGAvQibPsU0
	urBrGkGNAeeExOqpEi+ywofP7ZycTUdl8ybImkWV0DjiR1C5HmnDIg/4uXzmY+a/81A4XbIW52Pda
	zInjEwx9Bk1VcKpu0S+Ww30dS66+7/YyqWMbCCNiCZU6t12t30Lhkt/UhfWZiBmykoFcxa7ttkuUW
	YerheeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5Pk-0000000AGEd-3bbE;
	Thu, 04 Sep 2025 08:33:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4qQ-0000000A2nT-0w8n;
	Thu, 04 Sep 2025 07:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F696601A4;
	Thu,  4 Sep 2025 07:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E98C4CEF0;
	Thu,  4 Sep 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756972641;
	bh=c57YH64GVVAeKyKzS1CU5NHKdgxvqrYzn8ZtqROVA0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fXBluWIykJ2uls6NGRZjd9d6LuD/afp5QlqIKv+8/dGw3zWGC1kOVlGY43OeDmc9e
	 ZSjrUHMgtoGnYrPnlgwba+5GnEZrn1Qcc7A4gBLXRcJecBO1vgyqop4TInKy4Ijeht
	 j3HYQmj/vJmSYuoWRqiqyM3c3Ti2CiEMe9074cjjgD63qWWuPpfK7hbUJxnv3sCZG2
	 OqzxWtj3+JBAWIuCQ7ILSFG5i/8iPnwRfgIaY4zVOk1wPdO1KjO3RKXA+Ik6RYog3A
	 zDg2N/Q6+G5m/IkCHgRrY2HlYQDujmIb3YRRECwSQw1bcES0ilHi1aUtiWqYZ1l7qS
	 vEr3d5K2LowYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 04 Sep 2025 09:56:41 +0200
Subject: [PATCH mt76 3/4] wifi: mt76: mt7996: Implement MLD address
 translation for EAPOL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mt7996-mlo-more-fixes-v1-3-89d8fed67f20@kernel.org>
References: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
In-Reply-To: <20250904-mt7996-mlo-more-fixes-v1-0-89d8fed67f20@kernel.org>
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

From: Shayne Chen <shayne.chen@mediatek.com>

Do the MLD to link address translation for EAPOL frames in driver.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 32 ++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 33eb05dc5fc4826b5752fcee923213e051107074..588f4aed31eda30aa48eeb06cfcbf36a0e147682 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -962,7 +962,8 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	txwi[5] = cpu_to_le32(val);
 
 	val = MT_TXD6_DAS;
-	if (q_idx >= MT_LMAC_ALTX0 && q_idx <= MT_LMAC_BCN0)
+	if ((q_idx >= MT_LMAC_ALTX0 && q_idx <= MT_LMAC_BCN0) ||
+	    skb->protocol == cpu_to_be16(ETH_P_PAE))
 		val |= MT_TXD6_DIS_MAT;
 
 	if (is_mt7996(&dev->mt76))
@@ -1049,6 +1050,35 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (id < 0)
 		return id;
 
+	/* Since the rules of HW MLD address translation are not fully
+	 * compatible with 802.11 EAPOL frame, we do the translation by
+	 * software
+	 */
+	if (tx_info->skb->protocol == cpu_to_be16(ETH_P_PAE) && sta->mlo) {
+		struct ieee80211_hdr *hdr = (void *)tx_info->skb->data;
+		struct ieee80211_bss_conf *link_conf;
+		struct ieee80211_link_sta *link_sta;
+
+		link_conf = rcu_dereference(vif->link_conf[wcid->link_id]);
+		if (!link_conf)
+			return -EINVAL;
+
+		link_sta = rcu_dereference(sta->link[wcid->link_id]);
+		if (!link_sta)
+			return -EINVAL;
+
+		memcpy(hdr->addr1, link_sta->addr, ETH_ALEN);
+		memcpy(hdr->addr2, link_conf->addr, ETH_ALEN);
+		if (ieee80211_has_a4(hdr->frame_control)) {
+			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
+			memcpy(hdr->addr4, vif->addr, ETH_ALEN);
+		} else if (ieee80211_has_tods(hdr->frame_control)) {
+			memcpy(hdr->addr3, sta->addr, ETH_ALEN);
+		} else if (ieee80211_has_fromds(hdr->frame_control)) {
+			memcpy(hdr->addr3, vif->addr, ETH_ALEN);
+		}
+	}
+
 	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
 	memset(txwi_ptr, 0, MT_TXD_SIZE);
 	/* Transmit non qos data by 802.11 header and need to fill txd by host*/

-- 
2.50.1


