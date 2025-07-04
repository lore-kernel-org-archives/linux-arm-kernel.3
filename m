Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FCBC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L77JwyXK6jQrIl0Eb26jqgAwlUkyjI6CZVg9KAk1DtU=; b=QmoNN5oOPnROjIfsmzsi+ePCpT
	Ukb8jgAxrqKmRPy6j6vP6r4ACyqWURiUjRGt8jdt5W1V00t0vkSPV+maqblA0iiXCfmGEWM1WwG4D
	t0x/tV8Rec+N5XlMKdl4BLwuXEtLP7HgG+k0zyskzu1pXpsJ4Dj7VCFXq58xPs5ytEl4UUZnmNbI9
	QzMe1M2HvbJ7W3dx9Zx8j8FnRmmaR9gU6asMvbIa/EOaZnLYTnNXeenTudTCT3XE7IoB2Q9Ci+cpO
	8tCIAqkrj6qs+dl69JbCT86gF674S5HeRJl6RGw7Q0phwcq77OFgF9q0DuSq4QzSQLY+alzngSes0
	c+jWRwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgJI-0000000EURg-3OMd;
	Fri, 04 Jul 2025 13:18:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9Y-0000000ETJE-49ZN;
	Fri, 04 Jul 2025 13:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F4F35C63E1;
	Fri,  4 Jul 2025 13:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CE6C4CEE3;
	Fri,  4 Jul 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634512;
	bh=ILv/QO9c6pKGzlXGfDlAmwZqWVYtSQrj2CTzSCJrX6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YVFxkFs5oFczlYj9RTnTQrGJ2vZGkCS9vnrgBt2OswslWd2UtKnh/lhknqxxrMGuo
	 k/EdHY1KwlTa6zelKZ+NQJgaHRfYhq/TtfW9jt3y8VhwXeEs66Pe+2Pya+t8w6KZ+v
	 tEsZDtfe5vbecBItPX9Wns1pjLKNNeRg8ydLgpr7hOWrHPfLm7U6BH7EhBYvn0iCya
	 1cr1UAs9AUtl5hzYyBFqy47NXoawz0XIVMbwLj/7WkBJEWltqeqvnj0O5Y8JdcKeWW
	 aMX8q05Pdf+znpI7k96FxmB44BPfBo6eGmwCgylZlZDOrhl2iAzCMeKbRfUYcA20Xw
	 GBT/+rimA8MNQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:07 +0200
Subject: [PATCH mt76 3/9] wifi: mt76: mt7996: Rely on
 for_each_sta_active_link() in mt7996_mcu_sta_mld_setup_tlv()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-3-356456c73f43@kernel.org>
References: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
In-Reply-To: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060833_127679_0C169EC1 
X-CRM114-Status: GOOD (  10.46  )
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

Reuse for_each_sta_active_link utility macro in
mt7996_mcu_sta_mld_setup_tlv routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 1bf5632cb0f754d49ec6201254d35652d23c0a8c..0374872db4777cc85eed594f7d977dd822927b6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2216,15 +2216,15 @@ mt7996_mcu_add_group(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 static void
 mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
+			     struct ieee80211_vif *vif,
 			     struct ieee80211_sta *sta)
 {
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
-	unsigned long links = sta->valid_links;
-	unsigned int nlinks = hweight16(links);
+	unsigned int nlinks = hweight16(sta->valid_links);
 	struct mld_setup_link *mld_setup_link;
+	struct ieee80211_link_sta *link_sta;
 	struct sta_rec_mld_setup *mld_setup;
 	struct mt7996_sta_link *msta_link;
-	struct ieee80211_vif *vif;
 	unsigned int link_id;
 	struct tlv *tlv;
 
@@ -2242,7 +2242,7 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	mld_setup->primary_id = cpu_to_le16(msta_link->wcid.idx);
 
 	if (nlinks > 1) {
-		link_id = __ffs(links & ~BIT(msta->deflink_id));
+		link_id = __ffs(sta->valid_links & ~BIT(msta->deflink_id));
 		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
 		if (!msta_link)
 			return;
@@ -2250,9 +2250,8 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	mld_setup->seconed_id = cpu_to_le16(msta_link->wcid.idx);
 	mld_setup->link_num = nlinks;
 
-	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
 	mld_setup_link = (struct mld_setup_link *)mld_setup->link_info;
-	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
+	for_each_sta_active_link(vif, sta, link_sta, link_id) {
 		struct mt7996_vif_link *link;
 
 		msta_link = mt76_dereference(msta->link[link_id], &dev->mt76);
@@ -2344,7 +2343,8 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev,
 		mt7996_mcu_sta_muru_tlv(dev, skb, link_conf, link_sta);
 
 		if (sta->mlo) {
-			mt7996_mcu_sta_mld_setup_tlv(dev, skb, sta);
+			mt7996_mcu_sta_mld_setup_tlv(dev, skb, link_conf->vif,
+						     sta);
 			mt7996_mcu_sta_eht_mld_tlv(dev, skb, sta);
 		}
 	}

-- 
2.50.0


