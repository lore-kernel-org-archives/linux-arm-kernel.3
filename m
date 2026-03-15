Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5A2D58B19
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zsk135Aqp/VhKoq1aD0571vI4B+T9wMp7N4TRiljrw=; b=ik5FkfQX8jwqkz2Kc3be9wFK0G
	3xKDhVr5lqK9QKH0AuC3yvCZkkGVRiGaiUqGMs48PcZbREHNo3+52wPP3gMs47KpcKhMtFA2QVus4
	/wzk/XqogLVDxt1MLEa7yrkONDLBwRx6zcLLv9mbqfDeTrwStfb+kwYanT4HbLTDnWuwO29EStl12
	zwGQ4yzRDrCyLHWGNrBzvf8RwGj1u+nfWPICpAuf+5Kmw5Bz5eA8Kbh1Ev3eS2XJ1PYPRIbGx2d6a
	EIsMGhiWrofOrlgax53b58NQgIPQDMqSpMeG7tfL4RB68L4nH5wTEoz7IdS45H+YviIKLKDuCvDAB
	QJTofV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igo-00000002XQe-4BLU;
	Sun, 15 Mar 2026 10:27:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1igm-00000002XOj-2FNK;
	Sun, 15 Mar 2026 10:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB7CB42D70;
	Sun, 15 Mar 2026 10:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BDBC19424;
	Sun, 15 Mar 2026 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773570433;
	bh=Yk5aZX4HYMGAQBKmnXgiQoyzfn2nipKRDLJoOYEKA80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B4fXPru/rNezggcTwvAaQ4Um8IoJZBv8orPpuAXNpQHDHsZDQutPOZn+hUSv41L9r
	 jDoJoBSheKH//xDraG1uHTGct1tXvFKPBSCtL0AmHicreRR78vldm8Zui628i3t2oj
	 Ymm+SnFdvWK/TzBn5kpUHAa+JwjKhRObwFlORJtPda0x65Dq6T2W9cs4kwurps2c8z
	 8Lw+mA8D6AdXIFRlccBfOXdNrRQQD+s/QoCRU5e8uXoBWAnWYXH/Xdi7WUqjUxyilj
	 H0WxnlQz8Rkwcf2ou8/aTb8zZ75caPIs2IUG1DsCSFXt8dRlp68RDcw3A+jqd/6DRA
	 kSWnjx4JLcQ3Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 15 Mar 2026 11:26:24 +0100
Subject: [PATCH mt76 1/6] wifi: mt76: mt7996: Rely on msta_link link_id in
 mt7996_vif_link_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-mt7996-mlo-link-reconf-v1-1-a8a634fbc927@kernel.org>
References: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
In-Reply-To: <20260315-mt7996-mlo-link-reconf-v1-0-a8a634fbc927@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_032716_660898_80DD8F48 
X-CRM114-Status: GOOD (  11.12  )
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

Rely on msta_link link_id value in mt7996_vif_link_remove routine
instead of using link_conf pointer. This assumption is correct since
msta_link link_id is set to link_conf link_id value in mt7996_vif_link_add
routine.
Moreover, fallback to default ieee80211_bss_conf struct if the link_conf
pointer in mt7996_vif_link_remove() is NULL.
MT7996 hw requires to remove AP MLD links from MCU configuration during
AP tear-down process (e.g. running mt7996_remove_interface()). Doing so,
we can't assume link_conf pointer is always non-NULL running
mt7996_vif_link_remove routine.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 834edd31458d57a21fc2e02d429ea139057aa60b..21a240f0c8c275b9fb5532ff74bbf76b741dac84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -396,17 +396,21 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	struct mt7996_vif_link *link = container_of(mlink, struct mt7996_vif_link, mt76);
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
 	struct mt7996_sta_link *msta_link = &link->msta_link;
+	unsigned int link_id = msta_link->wcid.link_id;
 	struct mt7996_phy *phy = mphy->priv;
 	struct mt7996_dev *dev = phy->dev;
 	struct mt7996_key_iter_data it = {
 		.cmd = SET_KEY,
-		.link_id = link_conf->link_id,
+		.link_id = link_id,
 	};
 	int idx = msta_link->wcid.idx;
 
 	if (!mlink->wcid->offchannel)
 		ieee80211_iter_keys(mphy->hw, vif, mt7996_key_iter, &it);
 
+	if (!link_conf)
+		link_conf = &vif->bss_conf;
+
 	mt7996_mcu_add_sta(dev, link_conf, NULL, link, NULL,
 			   CONN_STATE_DISCONNECT, false);
 	mt7996_mcu_add_bss_info(phy, vif, link_conf, mlink, msta_link, false);
@@ -416,10 +420,9 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
 
 	if (vif->txq && !mlink->wcid->offchannel &&
-	    mvif->mt76.deflink_id == link_conf->link_id) {
+	    mvif->mt76.deflink_id == link_id) {
 		struct ieee80211_bss_conf *iter;
 		struct mt76_txq *mtxq;
-		unsigned int link_id;
 
 		mvif->mt76.deflink_id = IEEE80211_LINK_UNSPECIFIED;
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
@@ -427,7 +430,7 @@ void mt7996_vif_link_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 		for_each_vif_active_link(vif, iter, link_id) {
 			struct mt7996_vif_link *link;
 
-			if (link_id == link_conf->link_id)
+			if (link_id == msta_link->wcid.link_id)
 				continue;
 
 			link = mt7996_vif_link(dev, vif, link_id);

-- 
2.53.0


