Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB90C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejMKBHWNKl9mQoEViy73YjZohnREweBs4rwRhvOzSEQ=; b=CSSOw9ymY2lgxdPlF6s/BXJlm/
	rHueYe8kvUfWD+J6AYCExZSXG6c/YCC490gzIaBGNyeDD4XNjrHnZ9JIHBrq5oP0bKcg8Lbir1Z32
	zIn9RMXADhDSNtU4byw6MAFSkVxTyjZzKpOqMz8Q1TX0hag6rNw0JQ0warjY3DX34mtLUfd4aYGVt
	J1idld0yH2DxlgSJHtzIse1ONqk6tbWkgs7OSsPsFHodSUZzeAtzI5TCEIY6ZHTYl7xKd5EcrnTZ6
	OJyRr4c63Jahpwou/W8tZHYoqlU5K2Qmw09WfWHKokRS3TGNX6Rg12Jk21YRW8cywkNWiH5jg3QGe
	w980B9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhID-0000000EefW-3q5d;
	Fri, 04 Jul 2025 14:21:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9T-0000000ETIN-3Mau;
	Fri, 04 Jul 2025 13:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CA735C6526;
	Fri,  4 Jul 2025 13:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EABAC4CEE3;
	Fri,  4 Jul 2025 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634507;
	bh=tQbN0zpDKtZUkhv/MpLlcCccFqUgkW64nZndPIHZEfQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=anzXzF2uMEeKjaXubq2vr+o1Z7qkBGyYRG8NnDMFZjsAS97unymxdNGhOc/dMEgQF
	 LPVTDBCkbTypHKFZ1Sy1TpmG+/e1XEkYmNXTnf76JqeRvGF4B9wJXdZxDeUD4gwCbx
	 85lTxmunxhPgLQGfv99kyBbinH5gsHyAMcLTP4RGaHADZLUGAyFnRXZMshq8LeB599
	 aMS+Z6AC3lJlyOX6FMFdFrQb0ymYcdAL3SOrH0if4xNa6NSSPqehmNKcDOrT2JEdmt
	 +Oul4BJruit9wb5uZA52gIuQFpoGAjVfUk//kF+gvEzqGHhgCPljHN3iYmltiHSuLe
	 tIggKCmSRq4/Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:05 +0200
Subject: [PATCH mt76 1/9] wifi: mt76: fix vif link allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-1-356456c73f43@kernel.org>
References: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
In-Reply-To: <20250704-mt7996-mlo-fixes-v1-0-356456c73f43@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060827_890735_BE9B6F25 
X-CRM114-Status: GOOD (  11.16  )
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

From: Felix Fietkau <nbd@nbd.name>

Reuse the vif deflink for link_id = 0 in order to avoid confusion with
vif->bss_conf, which also gets a link id of 0.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/channel.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt76.h    | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/channel.c b/drivers/net/wireless/mediatek/mt76/channel.c
index cc2d888e3f17a58512e6282686b446109ec7ab3c..77b75792eb488e9c5da9ca8026c04157182c13a4 100644
--- a/drivers/net/wireless/mediatek/mt76/channel.c
+++ b/drivers/net/wireless/mediatek/mt76/channel.c
@@ -173,13 +173,13 @@ void mt76_unassign_vif_chanctx(struct ieee80211_hw *hw,
 	if (!mlink)
 		goto out;
 
-	if (link_conf != &vif->bss_conf)
+	if (mlink != (struct mt76_vif_link *)vif->drv_priv)
 		rcu_assign_pointer(mvif->link[link_id], NULL);
 
 	dev->drv->vif_link_remove(phy, vif, link_conf, mlink);
 	mlink->ctx = NULL;
 
-	if (link_conf != &vif->bss_conf)
+	if (mlink != (struct mt76_vif_link *)vif->drv_priv)
 		kfree_rcu(mlink, rcu_head);
 
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 14927a92f9d1b313253158c0e53dce8fab9fba18..022d83bb03da1803440c942c9343b709d76aecd4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1865,6 +1865,9 @@ mt76_vif_link(struct mt76_dev *dev, struct ieee80211_vif *vif, int link_id)
 	struct mt76_vif_link *mlink = (struct mt76_vif_link *)vif->drv_priv;
 	struct mt76_vif_data *mvif = mlink->mvif;
 
+	if (!link_id)
+		return mlink;
+
 	return mt76_dereference(mvif->link[link_id], dev);
 }
 
@@ -1875,7 +1878,7 @@ mt76_vif_conf_link(struct mt76_dev *dev, struct ieee80211_vif *vif,
 	struct mt76_vif_link *mlink = (struct mt76_vif_link *)vif->drv_priv;
 	struct mt76_vif_data *mvif = mlink->mvif;
 
-	if (link_conf == &vif->bss_conf)
+	if (link_conf == &vif->bss_conf || !link_conf->link_id)
 		return mlink;
 
 	return mt76_dereference(mvif->link[link_conf->link_id], dev);

-- 
2.50.0


