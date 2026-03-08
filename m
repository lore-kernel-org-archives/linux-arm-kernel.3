Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9003DF5513F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y6KYX64S6Zs1ktdftIkzn6LLMFQMeNQdbYnpw6juQYI=; b=YfvP6zRYzd+CkFzxUXf9UroRxf
	IFtZQoHqL7box6ERNwKWqhOz7KGnhG+XKkBcJDYSCcW4w7KsIep2RxhATQmIB00LMYyNrBES7ILvn
	JDDJSfVoxB8dRc0j2r36FM7Z05mNsksF81yJN9ATP6vKCA9CB2GCkKvCKgKImzYqxcxK0KKjOqCWL
	qc6X/rbL3aJTr4kqtQxO49wO8GGrDcCwobMKx96OqvJ4dkp4h3mEsDXNkSeV0lVHfKk4wGtKC33lx
	MlU2xg5Ar0s3MHppFcpVUTfLfpGQda0UUhE11hzoW64qnEpWF0ngltuCAc1jO8d+gFnXhGA20b8Cf
	HcIkAQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzE8b-000000063Lz-3Tkn;
	Sun, 08 Mar 2026 13:25:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzE8a-000000063Lq-0VjB;
	Sun, 08 Mar 2026 13:25:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA73460054;
	Sun,  8 Mar 2026 13:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A154C116C6;
	Sun,  8 Mar 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772976338;
	bh=td/5Za+N+HHAJ/2WojWGJFdEXrRuLM/SqKZCZyaAjA0=;
	h=From:Date:Subject:To:Cc:From;
	b=asPYyX08YKLuNZTvEcOL++nLkGAONi5kqwbfiyxe2ifrdpTmGMyx84HqVn8UF32nR
	 KqivguLOWTL7z7VHWFMce9QVeMcYmVjAP2ksRUm0/PHOw3y8hQ05KoSe6Yz3cZt/L4
	 e4wO3L/dsP4xN4aMhmf3QtJlOie4x/PXQy57qleJ68ThbuW3djKP2oGkNl60rDB8+w
	 fZ+XMR8mDWVgEgAzmfRnQtcMxYvdsWhl5lp+qQ2I+7vxzS6tGdonYsidpiWFsZGKc2
	 wQxBwzJ4JIVabLwtiyvwO9YZXC4hwXnyF8AE/jAWTWpvntVAB5F89k4Zq6rs9KBSe1
	 7rS1L32N2U8+g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 08 Mar 2026 14:25:20 +0100
Subject: [PATCH mt76] wifi: mmt76: mt7996: Decrement sta counter removing
 the link in mt7996_mac_reset_sta_iter()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-mt7996_mac_reset_vif_iter-fix-v1-1-57f640aa2dcf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrBuIU9CkVyklBP2js4gtkyCCe
 PcGl99bvJMKVFDo1Z2k2KXId2voHx1Na9wWGJmbiS0P9mmdyXX0fgg5TkFRUMMuKUiFmiSHYQc
 eObrUW1B7/BQt3//357r+IcBLiG8AAAA=
X-Change-ID: 20260308-mt7996_mac_reset_vif_iter-fix-28e272a8f10e
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

Decrement the phy station counter  in mt7996_mac_reset_sta_iter routine
destroying the station link.

Fixes: ace5d3b6b49e8 ("wifi: mt76: mt7996: improve hardware restart reliability")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index a415cc610eeec8cb160aeac8219f421742d75bad..6591c07a147a5fdce7a8f7ff13da7f9eb136b002 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2361,6 +2361,7 @@ mt7996_mac_reset_sta_iter(void *data, struct ieee80211_sta *sta)
 
 	for (i = 0; i < ARRAY_SIZE(msta->link); i++) {
 		struct mt7996_sta_link *msta_link = NULL;
+		struct mt7996_phy *phy;
 
 		msta_link = rcu_replace_pointer(msta->link[i], msta_link,
 						lockdep_is_held(&dev->mt76.mutex));
@@ -2368,6 +2369,10 @@ mt7996_mac_reset_sta_iter(void *data, struct ieee80211_sta *sta)
 			continue;
 
 		mt7996_mac_sta_deinit_link(dev, msta_link);
+		phy = __mt7996_phy(dev, msta_link->wcid.phy_idx);
+		if (phy)
+			phy->mt76->num_sta--;
+
 		if (msta_link != &msta->deflink)
 			kfree_rcu(msta_link, rcu_head);
 	}

---
base-commit: 030eea77accf40477be540445fc5a5be52d810a3
change-id: 20260308-mt7996_mac_reset_vif_iter-fix-28e272a8f10e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


