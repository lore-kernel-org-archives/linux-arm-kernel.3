Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6859C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZihR01Q6zLaxuApmE0vKoHkOk585JLTJ4EcwD+KnuE=; b=4F+H3pnzkSfwozb7Z6E/54N3lP
	XUGM9kyj99IxcDiH3zue8Ajx1aYhtoz+hRle5rk7TDMUGt3M+KkI9mc21aZI59jLyZVdkYYYjBDm0
	FShtB7aAYu9LJsp6Xw+7ljXTdRUse13wtAeUPftczYJxxPIEGCfNTYt5V8m8p9mHQACtna35DeDgP
	xOa0Z7wEmW1ICYggL8teoGnoWrgvej+vRMeeiJKr8WNx6gCf4RwU7vEV8BbyrdSXb+iRMvRP70piJ
	Od3qe7lSLsqaIKH6SDv8JIGdjsPpHmZ6N+pVCvPejJAoJIdDX3S92K1GPyAOWAVvxmsayw8Kiunkv
	XimG1Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgSZ-0000000EW1B-0lnn;
	Fri, 04 Jul 2025 13:28:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9j-0000000ETLc-0wFu;
	Fri, 04 Jul 2025 13:08:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F420344B38;
	Fri,  4 Jul 2025 13:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C08C4CEEE;
	Fri,  4 Jul 2025 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634522;
	bh=fQPKqzqJoG96BUl5U70JlrV6PqD4K4Oa2dVm9yr0HrM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SaE70Tj1OwyMqvxqvf4eScob+UgLUdi3MVNFhhU4ujlwlXvcJ5OYtvVcpzf9xcv7c
	 h7ht+/EmmhKE5sKm8bvC2vOJGYwdoJ82Y9J+8HoHxWNKPbO7svZyn2+K7N3ppmjdSM
	 AhdHp1iJbQklTm0P358/jsWybTSeLkr0WTu9tv62qcXUeIHedRGUU08lbBP7sjSvqt
	 bbKTIgqXsj2vXidw0x1yuPDnDT0SCP1lf/v2YxUao1cRJKoEfAWgJkn9Lu30t27DYS
	 AYEosCe7na9RtFOguLn/sw6aRBdryTeW+mgn+QQNcXs0ngRV8WSiEjKcOf4Dh9a7PH
	 KCTVyzRehoYbw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:11 +0200
Subject: [PATCH mt76 7/9] wifi: mt76: mt7996: Fix valid_links bitmask in
 mt7996_mac_sta_{add,remove}
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-7-356456c73f43@kernel.org>
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
X-CRM114-CacheID: sfid-20250704_060843_283822_BCF2EE92 
X-CRM114-Status: UNSURE (   9.90  )
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

sta->valid_links bitmask can be set even for non-MLO client.

Fixes: dd82a9e02c054 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 6404514556419f75b69a783d96b0920157263e04..ea0cdd092a3f396c2a8cb655ff941b833fb9983e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1061,7 +1061,7 @@ mt7996_mac_sta_add(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
 	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	unsigned long links = sta->mlo ? sta->valid_links : BIT(0);
+	unsigned long links = sta->valid_links ? sta->valid_links : BIT(0);
 	int err;
 
 	mutex_lock(&mdev->mutex);
@@ -1155,7 +1155,7 @@ mt7996_mac_sta_remove(struct mt76_phy *mphy, struct ieee80211_vif *vif,
 {
 	struct mt76_dev *mdev = mphy->dev;
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
-	unsigned long links = sta->mlo ? sta->valid_links : BIT(0);
+	unsigned long links = sta->valid_links ? sta->valid_links : BIT(0);
 
 	mutex_lock(&mdev->mutex);
 

-- 
2.50.0


