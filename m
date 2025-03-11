Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673ADC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PclUyHsK2/65if5U9sGLJ+XjH10GG+5GDmvnIOfCUPE=; b=OwAwjQDGAJutmMDp3G4uX9OoTh
	UxzWrT/geuG5GiqHq8uJVOepP/ws3yjyLpyxhsM4eAyC4LDvbHILBV4qkhcLbtoacj4zE2ZLIU3md
	DSbZWSRTP2k8ZsCnXzNjdR7Jv333OauBm8xBqO87MWSv0UmgkB6N46NX7M+8YNQo0KmZkBG3LLCUq
	vVPXdL0P1M91sWXiMH0/eKsBRiyFI0CKplklOGtoWw/2MFVPk5mzhZuKLd6HUnY04zfXbPDgh/VMq
	8fWfkCdEMR5tZt7XwmpcRJkZ/sN7HyM81i+JoaLT//fnkw9cVW+yJOJ21Z9FZxpyIvJZpLi9xTbBQ
	xjlD12EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts41x-00000006ZDd-2vSP;
	Tue, 11 Mar 2025 18:08:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3fr-00000006VK2-1jyc;
	Tue, 11 Mar 2025 17:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2626F5C6554;
	Tue, 11 Mar 2025 17:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43210C4CEEA;
	Tue, 11 Mar 2025 17:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741715150;
	bh=JIhU6JAVFL/APQj30jcuDhgBR6k5qvCBmItYlZMcFKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HYcGBZpQ8Wjl+SydLan7w9Kx9t/CN5dObhPKM4VAT69WmSPv8Q4Zhl7Pgu70SHEmZ
	 RuIiIQNLHpEFiJmyBjvi7DJ9/lo2PHdKqd22cW9KHn+wNjpIWMk7STjhrRKzzuvNqX
	 7sXobGglfDYN9uoEX/VXXhiqAV3o/PIrj3cc5Xw6qjv2VQ9J6ZP3c1LQ3PZTeJ9/A8
	 RlAKWIIEp/enJdRSGr+d+KK21ft1LJWXPUeVlbU8vbk5Px/5hFbr2lavrYn6qXDas+
	 yztZGR2IBYcaYQU/bwYuQJ47pVSMQ7DRpb57jN2IgObsVJV5A46+iMD2nsjSk716EI
	 Qcj4p59QLnu6Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 11 Mar 2025 18:45:12 +0100
Subject: [PATCH v2 13/13] wifi: mt76: mt7996: Rely on mt7996_vif_link and
 mt7996_sta_link in mt7996_mac_twt_teardown_flow signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-mt7996-mlo-v2-13-31df6972519b@kernel.org>
References: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
In-Reply-To: <20250311-mt7996-mlo-v2-0-31df6972519b@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_104551_549166_E04EABBE 
X-CRM114-Status: GOOD (  10.93  )
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

This is a preliminary patch to enable MLO for MT7996 driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c    | 7 +++----
 drivers/net/wireless/mediatek/mt76/mt7996/main.c   | 7 +++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 4a7f6fd9025297f0ffa8ea7e91efd34164a26196..7ddd4b0cadf5d1983379a93ba56da461748ca60e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2691,10 +2691,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 }
 
 void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
-				  struct mt7996_sta *msta,
+				  struct mt7996_vif_link *link,
+				  struct mt7996_sta_link *msta_link,
 				  u8 flowid)
 {
-	struct mt7996_sta_link *msta_link = &msta->deflink;
 	struct mt7996_twt_flow *flow;
 
 	lockdep_assert_held(&dev->mt76.mutex);
@@ -2706,8 +2706,7 @@ void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
 		return;
 
 	flow = &msta_link->twt.flow[flowid];
-	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_DELETE))
+	if (mt7996_mcu_twt_agrt_update(dev, link, flow, MCU_TWT_AGRT_DELETE))
 		return;
 
 	list_del_init(&flow->list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 5ab4f08dba06fdf95ee4e6bc0261749016f07e6a..11ad95e05b94857c95375cdf877518e7ee89f08e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1062,7 +1062,8 @@ mt7996_mac_sta_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			break;
 		case MT76_STA_EVENT_DISASSOC:
 			for (i = 0; i < ARRAY_SIZE(msta_link->twt.flow); i++)
-				mt7996_mac_twt_teardown_flow(dev, msta, i);
+				mt7996_mac_twt_teardown_flow(dev, link,
+							     msta_link, i);
 
 			mt7996_mcu_add_sta(dev, link_conf, link_sta, link,
 					   msta_link, CONN_STATE_DISCONNECT,
@@ -1804,10 +1805,12 @@ mt7996_twt_teardown_request(struct ieee80211_hw *hw,
 			    u8 flowid)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct mt7996_sta_link *msta_link = &msta->deflink;
+	struct mt7996_vif_link *link = &msta->vif->deflink;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
-	mt7996_mac_twt_teardown_flow(dev, msta, flowid);
+	mt7996_mac_twt_teardown_flow(dev, link, msta_link, flowid);
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 962022c7eec9fd82ebba8e0d5aa6b6eae769ee32..84b9ff707d56501d212932a9fa6a3037259a1077 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -709,7 +709,8 @@ void mt7996_mac_dump_work(struct work_struct *work);
 void mt7996_mac_sta_rc_work(struct work_struct *work);
 void mt7996_mac_update_stats(struct mt7996_phy *phy);
 void mt7996_mac_twt_teardown_flow(struct mt7996_dev *dev,
-				  struct mt7996_sta *msta,
+				  struct mt7996_vif_link *link,
+				  struct mt7996_sta_link *msta_link,
 				  u8 flowid);
 void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,

-- 
2.48.1


