Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367B1F01822
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tun5sLl1fZ9aaLwteFwd7eLzPUxp0KA0fct3Hhvv+dE=; b=KZp59Skh00E11B5HXwFPYHsnyR
	AfTNBKjjH5lf/7i36amOV7FjCs+TViX1mxCVZWoyaoPcLKrdmTAX799Qx+1zslNtBPIAskqIH5rcH
	Qkx3ZT0CFpGIFvl4ZIDOW/RZCdoJxK6HNJPY3vT9Pz2AaUvOfhLysjWDfiJH8o0OKkg6fUMO8ZRtL
	UnTRE1wiOSlRs89mCC0jjQDAXXuBeTTuw2s8LOcT65GED56b4+WJ5Be9okADL2j2rvJ9hJrSlfb0h
	AQw//UKkNMrXIAnrHbjpmnpJuDS21vr2mADPRzxquO7aIgM6AtsJqqk/YDpNluvz2Jlj6MwLfvGc+
	j4Cu1I9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPn-00000003Rwd-3FsO;
	Fri, 06 Mar 2026 10:28:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySPj-00000003Rti-0ACH;
	Fri, 06 Mar 2026 10:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9262244488;
	Fri,  6 Mar 2026 10:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB75C2BCB1;
	Fri,  6 Mar 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792889;
	bh=DfxFRRvPfhsfQekJ9GLERkWUaEHye6HnGlGQsfd+/V8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YPoW2XPf8zryedbEvnXEY1z3Rkui1Mq76bYQ2+IMZQcDKEsiJVJamhfm21QsVf38/
	 t8kg4XbI7a0Syith6574h3OK5YDJEZlDy701+OBzVb+L3ONBO4g8vWelMY1+EdUk6z
	 WgzSUC1TCN4nFbYwzSGIoX7N9TsEiMXyxrLF5jy7lNeh1L0Jsq5xIuOHpmC83Qt11r
	 5dwv3iL8bKC1Cb89I4vqxsUH7jL6pIyD9Cd0b2PcnqQTwoansUOf8Cg8M2mSVW+P7Z
	 bQql6RKqsP6Sbhb43I2bTgDzcs2E5OqKwH1ZzHRa8HuMke2Ia+3Gcx8zNpfvlPNB87
	 WqVj3jCMKWgLg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 06 Mar 2026 11:27:52 +0100
Subject: [PATCH mt76 1/4] wifi: mt76: mt7996: Remove link pointer
 dependency in mt7996_mac_sta_remove_links()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-mt7996-deflink-lookup-link-remove-v1-1-7162b332873c@kernel.org>
References: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
In-Reply-To: <20260306-mt7996-deflink-lookup-link-remove-v1-0-7162b332873c@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_022811_121780_D8F5C02C 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Remove link pointer dependency in mt7996_mac_sta_remove_links routine to
get the mt7996_phy pointer since the link can be already offchannel
running mt7996_mac_sta_remove_links(). Rely on __mt7996_phy routine
instead.

Fixes: 344dd6a4c919 ("wifi: mt76: mt7996: Move num_sta accounting in mt7996_mac_sta_{add,remove}_links")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e1e51c9a0767be5a15dae48d627fb45b6f12af21..8b1924778cbd6a5f6a516a689a379fb715cc3097 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1100,8 +1100,7 @@ mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 	for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
 		struct mt7996_sta_link *msta_link = NULL;
-		struct mt7996_vif_link *link;
-		struct mt76_phy *mphy;
+		struct mt7996_phy *phy;
 
 		msta_link = rcu_replace_pointer(msta->link[link_id], msta_link,
 						lockdep_is_held(&mdev->mutex));
@@ -1110,17 +1109,12 @@ mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		mt7996_mac_wtbl_update(dev, msta_link->wcid.idx,
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
-
 		mt7996_mac_sta_deinit_link(dev, msta_link);
-		link = mt7996_vif_link(dev, vif, link_id);
-		if (!link)
-			continue;
 
-		mphy = mt76_vif_link_phy(&link->mt76);
-		if (!mphy)
-			continue;
+		phy = __mt7996_phy(dev, msta_link->wcid.phy_idx);
+		if (phy)
+			phy->mt76->num_sta--;
 
-		mphy->num_sta--;
 		if (msta->deflink_id == link_id) {
 			if (msta->seclink_id == msta->deflink_id) {
 				/* no secondary link available */

-- 
2.53.0


