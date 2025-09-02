Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12418CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dBbIB5m1DHGjW3dGy8CaaRyVJeWDx6pJBl/YIaO5YPE=; b=eAjig39fZOxZO2lJwnvCtcvX6W
	Sa4iuh+x4jeJ6kRwrhI2fkPFf5ptRaYxv+TKXxvzPnW+4c5yG3vZqydkdrCQechc5rXNNS2mgeYSK
	TzVmL/USH6/YgjvZeVKvVb6iL1YSoKxgaKV9KwVqTzc+b4OP/L5D0u1D2/4yGcoGOJObfTAk9q7SQ
	JyqQQJ0LGuN/nAW5vCTQI12mlrye8gA/yp8Tih/iyFImiBV6xEwVMUsjqJyJRRucm59TbVFIZyF6C
	UChH0RIBbXMFOWYtFlJ656COfLIGUxec9qC934NFQVC3gUC3yRes9mpoZH2DBMZ8VPku9ys+vIzPY
	d7ENgw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKyA-0000000FdTT-0lw0;
	Tue, 02 Sep 2025 06:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utKvR-0000000Fcu7-00Ru;
	Tue, 02 Sep 2025 06:55:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69EF3601FF;
	Tue,  2 Sep 2025 06:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C115EC4CEED;
	Tue,  2 Sep 2025 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756796128;
	bh=Q0svYiUz24i1uAu8o1H7UT5McD0Sxs7M3FJhmIbgAjg=;
	h=From:Date:Subject:To:Cc:From;
	b=fyBUYRotO0ds+7TGd9jowdfMUE4JQgrKn8sBUg2RLotujQn+TC/95Xg1f1ncAzWsb
	 84NFn9EvEBzit/FNREiWZRmwuuVyuw7Y5CKPRJoYfTsy2k3qeSh8Gl28OqQZfxgsrv
	 MJtD+dkSvBsRZ3gcfqAw3mtXrxwh9ByiRoin2So6eV/sUbrT1rJ1+u3oWVShb4Kk+l
	 CvWSxLzEfUefAsTYKyZoO9Li3LepLzqgKitCrufiWcciDpmLMhA+zrIQ3TN+WwDp5v
	 q6eqD/CpokcspvpzS6VY3Dj32Vt7eqZgCu79HsPK0MNRXoDUd/isq+SWhdsr9pWVjQ
	 H9P7wz8rBDQVQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 02 Sep 2025 08:55:12 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Use proper link info in
 mt7996_mcu_add_group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-mt7996_mcu_add_group-fix-v1-1-312e14794dee@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM+UtmgC/x2MWwqAIBAArxL7naBBml0lQjQ3248eaEUg3T3pc
 wZmMiSMhAn6KkPEmxLtWwFRVzAtdgvIyBeGhjct11yw9VRaS7NOl7HemxD362AzPUyiU27uhNR
 cQcmPiEX/62F83w+50VTXagAAAA==
X-Change-ID: 20250901-mt7996_mcu_add_group-fix-6eb7bf816907
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

Do not always use default link in mt7996_mcu_add_group routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 01bdd0ecfcfe88d461d07e5cfeccd78a7d3e6a1b..dbd95d096c06bdf0305b41a140c788243ae35cf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2325,13 +2325,10 @@ int mt7996_mcu_add_rate_ctrl(struct mt7996_dev *dev, struct mt7996_sta *msta,
 }
 
 static int
-mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
-		     struct ieee80211_sta *sta)
+mt7996_mcu_add_group(struct mt7996_dev *dev, struct mt7996_vif_link *link,
+		     struct mt76_wcid *wcid)
 {
 #define MT_STA_BSS_GROUP		1
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct mt7996_sta_link *msta_link;
-	struct mt7996_sta *msta;
 	struct {
 		u8 __rsv1[4];
 
@@ -2346,13 +2343,10 @@ mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		.tag = cpu_to_le16(UNI_VOW_DRR_CTRL),
 		.len = cpu_to_le16(sizeof(req) - 4),
 		.action = cpu_to_le32(MT_STA_BSS_GROUP),
-		.val = cpu_to_le32(mvif->deflink.mt76.idx % 16),
+		.val = cpu_to_le32(link->mt76.idx % 16),
+		.wlan_idx = cpu_to_le16(wcid->idx),
 	};
 
-	msta = sta ? (struct mt7996_sta *)sta->drv_priv : NULL;
-	msta_link = msta ? &msta->deflink : &mvif->deflink.msta_link;
-	req.wlan_idx = cpu_to_le16(msta_link->wcid.idx);
-
 	return mt76_mcu_send_msg(&dev->mt76, MCU_WM_UNI_CMD(VOW), &req,
 				 sizeof(req), true);
 }
@@ -2492,7 +2486,7 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		}
 	}
 
-	ret = mt7996_mcu_add_group(dev, link_conf->vif, sta);
+	ret = mt7996_mcu_add_group(dev, link, wcid);
 	if (ret) {
 		dev_kfree_skb(skb);
 		return ret;

---
base-commit: fdac540331e118584c5b0acf4991af37ebf0e5f4
change-id: 20250901-mt7996_mcu_add_group-fix-6eb7bf816907

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


