Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1EDC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBNll6s68KkZtPgX6IfVMIHlXL4kYpjgdtEjWzZ2zTc=; b=3X12888ldb5ce9vJLiG2BDD1et
	/5nI19yLKBo3p1HGmWnyAz6y/2DL8Nh88vxf/D+ZS7C55sQYuJq8Rko1DuAfzjDSoa6jjsv5gARwo
	r45rBiEQzCk8s8B7Fw29TiKclCmyaQzTJJPuW3yeEX2J6npgM7Hsbk4dAXbOEVNM1PUU0r370K+Rj
	yVzAHZA6Yscz0/pRsR0bOGWS8CpMv8ZAvCCq8wcRqIIvHHlOP/SLp9b8jdjpfcD63aoqz0Iyp3KCm
	D060gGDDHZLaXq9NP6siAdUqxHA5EyGDqYJjKy49of6FQTmSwE6xTpTbayUubGOsUTu/rCZ1LQiWU
	g6uk7JPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKHa-00000008GYM-2a4D;
	Wed, 12 Mar 2025 11:29:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2K-00000008DvD-3w6j;
	Wed, 12 Mar 2025 11:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C29F5C4C4C;
	Wed, 12 Mar 2025 11:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FF4C4CEE3;
	Wed, 12 Mar 2025 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778048;
	bh=EG3lLoWPuZSGQkinDAJwVshdVSbc3K3nCOlOSKDN8c4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c7lZNmSqLnR4R79tyF1sYpO+Jiq0dDUAYekJGW+Kzvupt/8lJMwV/feOrNCV8zL/M
	 jweUMGyAFTXugzaht3j4yh/uy95KOlRzl7NppweM/FpRGfOvlK9dorNVL2OfsD6BKx
	 t7p+H2G7JNhZNk0NQaew2j4Fo5tYXuORPWVwuJFwhNfhk1u/Gr16oXi/Bfp+x+vO/q
	 3cefZhUAdXs+FehzMZgAc1Cs7Zbm/BdauUecQehfzSZYp6ANwsLaiFSd3Kb/VyXoC8
	 PobPgiBOgCHFpvNl7t/uHzZq/GbWQ4mRraB/nVM25VrrIxfSV89i2pwqepWXm9tEuK
	 wS6pMAJ7YBgQA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:47 +0100
Subject: [PATCH 03/21] wifi: mt76: mt7996: Add mt7996_mcu_teardown_mld_sta
 rouine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-3-015b3d6fd928@kernel.org>
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
X-CRM114-CacheID: sfid-20250312_041409_069814_B79A79D2 
X-CRM114-Status: GOOD (  12.43  )
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

mt7996_mcu_teardown_mld_sta is used to remove MLO configuration from the
MCU. This is a preliminary patch to enable MLO for MT7996 driver

Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 12 +++++++++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 18 ++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  3 +++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 25dbf086c8ef02307ef2510b21853b1eee28f922..642d633b5126ce81f3d32a9bd912603e2c328c8a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1017,6 +1017,7 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		     struct ieee80211_sta *sta, enum mt76_sta_event ev)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	unsigned long links = sta->valid_links;
 	struct ieee80211_link_sta *link_sta;
 	unsigned int link_id;
 
@@ -1067,11 +1068,16 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 				mt7996_mac_twt_teardown_flow(dev, link,
 							     msta_link, i);
 
-			mt7996_mcu_add_sta(dev, link_conf, link_sta, link,
-					   msta_link, CONN_STATE_DISCONNECT,
-					   false);
+			if (sta->mlo && links == BIT(link_id)) /* last link */
+				mt7996_mcu_teardown_mld_sta(dev, link,
+							    msta_link);
+			else
+				mt7996_mcu_add_sta(dev, link_conf, link_sta,
+						   link, msta_link,
+						   CONN_STATE_DISCONNECT, false);
 			msta_link->wcid.sta_disabled = 1;
 			msta_link->wcid.sta = 0;
+			links = links & ~BIT(link_id);
 			break;
 		}
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ac01eb880e2a6f6ef3a81591bcacd2b90c48986a..46c5e639b9630199ffa601e545fa76690f0101e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2346,6 +2346,24 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
 }
 
+int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
+				struct mt7996_vif_link *link,
+				struct mt7996_sta_link *msta_link)
+{
+	struct sk_buff *skb;
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &link->mt76,
+					      &msta_link->wcid,
+					      MT7996_STA_UPDATE_MAX_SIZE);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
+
+	mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF, sizeof(struct tlv));
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_WMWA_UNI_CMD(STA_REC_UPDATE), true);
+}
+
 static int
 mt7996_mcu_sta_key_tlv(struct mt76_wcid *wcid,
 		       struct sk_buff *skb,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index a91a50b72218c6a2d0dd32968681325ea7e6a042..c2a2916e0647cfdcbee9912e3915241465e32cac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -578,6 +578,9 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		       struct mt7996_vif_link *link,
 		       struct mt7996_sta_link *msta_link,
 		       int conn_state, bool newly);
+int mt7996_mcu_teardown_mld_sta(struct mt7996_dev *dev,
+				struct mt7996_vif_link *link,
+				struct mt7996_sta_link *msta_link);
 int mt7996_mcu_add_tx_ba(struct mt7996_dev *dev,
 			 struct ieee80211_ampdu_params *params,
 			 bool add);

-- 
2.48.1


