Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958BFC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9zCr4E6C6s1IHo3CV32Vcx2IXqO8px9/0+t7//IfjY=; b=1tFeK2Cph5u0/H34LQyxD6yYHi
	oVFf9+ZOtpJ/wWqDSNpNgxhcyWP1ujKljVTzD8idXlMUuF1RKtpT3Ut4O7wQQWFqK8i1XRkJBLXt0
	U39EnJ11eth2jne+rxWLi+Y2d7G12dIrdpR+N2Purz4YeEORn6t/d2pclbivniLJByJ35iQeF3kEh
	3r2CDwUMwZV4wdjpI8M+ie+1j5MoOhni5z/P76oNRFwBeOPHpcTx8+0jLYLYXEmHfaVY7Tl+VytzQ
	FA2noM3tlZYaimYQeDKenLC4/mJFpHe1scSVceJzPanSdgE1g8eeyvF8yqjlWypOg/mPYSWivImbA
	UFEZo76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKpQ-00000008Lp1-48sU;
	Wed, 12 Mar 2025 12:04:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2o-00000008E1L-0uCO;
	Wed, 12 Mar 2025 11:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86F4BA47070;
	Wed, 12 Mar 2025 11:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E4C4CEE3;
	Wed, 12 Mar 2025 11:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741778077;
	bh=kwXliEF7AmGk0jiRQYGQr6F0UQPeJBEZNlQxd/jy6rE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DhFMW9SbohuLzSWVyBtbitguDpab1BJKi0mFG7GhUwo4M3NNsFq32ebGKVZdGL4hR
	 7aZH+V4sC1uB9DAvSOerRXtH1jMo7J+lYBqlShySL95ZE7Q+m7BwEtb7Yh0/SsNgeI
	 LlKWdKKgC+VgGK82DZkbF3qAO7CsDbxTUJiuq9EUMkjiBmxUPviM9om0LoYgs2t214
	 MGDguHZ19fGPdQt9NBlrfGHw2cid79g7Yd8ZpIplIXBShbeS67RKyz88qGzi4uVIjU
	 SYTDnZkRhGXsCrNxZVMREeL1fnozAfKQvJ4+Uz8Q7vVlsstTXz2yOZcttJyAFFYdFb
	 raHD5hJz5/xKA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 12:13:58 +0100
Subject: [PATCH 14/21] wifi: mt76: mt7996: rework mt7996_update_mu_group to
 support MLO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-b4-mt7996-mlo-p2-v1-14-015b3d6fd928@kernel.org>
References: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
In-Reply-To: <20250312-b4-mt7996-mlo-p2-v1-0-015b3d6fd928@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_041438_321289_3BA57497 
X-CRM114-Status: UNSURE (   9.04  )
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

Rework mt7996_update_mu_group routine in order to support multi-link
setup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 4d3098e47dbbc25ced2a4b40c6b92423c451899e..2bf6453975ae584b2ab7cc9a46cc80ad7d73d05d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -700,12 +700,11 @@ mt7996_get_rates_table(struct mt7996_phy *phy, struct ieee80211_bss_conf *conf,
 }
 
 static void
-mt7996_update_mu_group(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+mt7996_update_mu_group(struct ieee80211_hw *hw, struct mt7996_vif_link *link,
 		       struct ieee80211_bss_conf *info)
 {
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	u8 band = mvif->deflink.mt76.band_idx;
+	u8 band = link->mt76.band_idx;
 	u32 *mu;
 
 	mu = (u32 *)info->mu_group.membership;
@@ -831,7 +830,7 @@ mt7996_link_info_changed(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		mt7996_mcu_beacon_inband_discov(dev, vif, changed);
 
 	if (changed & BSS_CHANGED_MU_GROUPS)
-		mt7996_update_mu_group(hw, vif, info);
+		mt7996_update_mu_group(hw, link, info);
 
 	if (changed & BSS_CHANGED_TXPOWER &&
 	    info->txpower != phy->txpower) {

-- 
2.48.1


