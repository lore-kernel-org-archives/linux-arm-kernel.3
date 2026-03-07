Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDF1F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObkqC6JeKczN+XsPAQiHdTfYRX0KkAhUsLcs6RbDm+0=; b=GD1lmd3bCfYJKFv1c7s1VMcNOT
	PyLv19/9OefJ3pewiCSC8Tz3Sus4ikIYRc9jfsac5GwdnrfJ1UdmRnI6IfmeCsBdAuB+0nucJ0Fjn
	z/7i7+fcoe1oj2RyKwuSLudzyWmR/E0dxtQ+BK1dRXBqTajdoXWDiQ7gTTqB7HzUqy3YqLMxrCf+R
	B3s3wCF9Gdoigq1mLyGHITLTbh70opmL79o84fCyfAjuQ4+e3qQAFnZg5C1go5gHICgh6faami8JA
	eDchqtgFVDw+DTrrC8i4VPIf/FAPlR0jtP9ZGSPU9Cfo4mycDgFFWi+dgI8eA42eRHf9yUvveBm6w
	Y8ctNFUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysBg-00000005F1D-3dkm;
	Sat, 07 Mar 2026 13:59:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vysBf-00000005F14-3wF1;
	Sat, 07 Mar 2026 13:59:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEC2260018;
	Sat,  7 Mar 2026 13:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19A85C19422;
	Sat,  7 Mar 2026 13:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772891962;
	bh=17VMiHgUST28gqV1LVY05XoOYBeoqqpg16VhStBb1bQ=;
	h=From:Date:Subject:To:Cc:From;
	b=V0DsEfh7iMNnVVZG5fBUfZPwhwBeo2F7G9lKiy9lspZa2n/Lm1VGVTGp8bg5fmK2t
	 h1KMOwpjzdmlaWQiY7zDW5gc1wjmeXZCw2viVCsU23nxdUwnQVb2qWyY2vxkc8fA7k
	 4NGVCu26Qoz67WVzjk4oqODuvkgRWU9FQ0y2iY3oMksvB0M6sIBOqLBqMZmgOd41/o
	 t+Vp5iNyv2sPbT2QX88JS+FGlqgISYAeM/+sdYet2ZJJWsFT1hpBjajVRrfhoAujPK
	 I7aInXZ7QUsufmG+cbbh6C0X82N6v67TaP7hwAnthn0+TxayNmjEEGtGHwF1PVchaA
	 w+gNxl8LwMrTA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 07 Mar 2026 14:59:12 +0100
Subject: [PATCH mt76] wifi: mt76: mt7996: Switch deflink to seclink only if
 link lookup does not fail
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-mt7996-sta-sec-link-fix-v1-1-d9c4ed7a85d8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G6hbS/2KeFAbNahVGhFB/LvF4
 wzMPCAUmATq5IFAFwvvPkKWJjDMnZ8I2UWGXOVaFcrgdhprNcrZodCAK/sFR77ROO1KS5WmvoR
 YH4Gi/s9N+74fZkvNxWkAAAA=
X-Change-ID: 20260307-mt7996-sta-sec-link-fix-7d6d49e56eb4
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

Do not switch default link to the secondary link in
mt7996_mac_sta_remove_links routine if the lookup for the secondary
msta_link fails.

Fixes: d7e5444f9eb02 ("wifi: mt76: mt7996: Switch to the secondary link if the default one is removed")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index e1e51c9a0767be5a15dae48d627fb45b6f12af21..00e0e5915afe32b70205f1128f32a07ac02223e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1122,21 +1122,22 @@ mt7996_mac_sta_remove_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		mphy->num_sta--;
 		if (msta->deflink_id == link_id) {
-			if (msta->seclink_id == msta->deflink_id) {
+			msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+			if (msta->seclink_id == link_id) {
 				/* no secondary link available */
-				msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
 				msta->seclink_id = msta->deflink_id;
 			} else {
 				struct mt7996_sta_link *msta_seclink;
 
 				/* switch to the secondary link */
-				msta->deflink_id = msta->seclink_id;
 				msta_seclink = mt76_dereference(
 						msta->link[msta->seclink_id],
 						mdev);
-				if (msta_seclink)
+				if (msta_seclink) {
+					msta->deflink_id = msta->seclink_id;
 					mt7996_sta_init_txq_wcid(sta,
 						msta_seclink->wcid.idx);
+				}
 			}
 		} else if (msta->seclink_id == link_id) {
 			msta->seclink_id = msta->deflink_id;

---
base-commit: 030eea77accf40477be540445fc5a5be52d810a3
change-id: 20260307-mt7996-sta-sec-link-fix-7d6d49e56eb4

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


