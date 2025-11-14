Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF71CDE018
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awIR0H2uibZo8Ue9LW7b0Y2AItuDgssJai/elZGXstE=; b=Cy4c8TV6qVn5oiPpfC1mdjBsys
	Kh7Wb4PelJiwoiIddxa+R9DvOV3bhPGO52jobWneDR/CoVV8mNM3FRoGI/SrHwunjVnCxaebptJYo
	oDdnw5sHiB27qrXepE4x/kVTKVWOfi75SlvzW28ZtLIQpQg+ZkYVFJSRgKWyM58pDPpYq9CWJg67P
	4diWRksav93QLExOwqy2RUOypYaHXsmZcHnmIm6m35SkP8mfb1JdJtz3MWZyLu3ntzzONQZKLMYrp
	xOiKu+g/Jwi2xPdtmC+uP9sPDh0DkLAlqicxCznys7Yy25IUk8Oyhsog4kl9aPLAc+7DJV4xKNKM3
	LCX7jtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfT-0000000CF0G-3UsR;
	Fri, 14 Nov 2025 13:16:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfP-0000000CEwU-0tRt;
	Fri, 14 Nov 2025 13:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A585860121;
	Fri, 14 Nov 2025 13:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF770C19421;
	Fri, 14 Nov 2025 13:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763126202;
	bh=B9sQVFNQ2iult3wzpWjgBPdLQuokvzOXDSS+NbRKykU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MFNLCcRko7ggpc2psHhcp3j4YsqbyC87QS1N/ldNIbyF3Gh+wf5yq9i8JvWGXVn/6
	 FbKBr4vm1x+IYwjt2CB3iZlp7R8G/MguKrHsi3V+iZf5N619G0nMFEQQ9u2tp5jO/u
	 9y9eq/fcaelyis/5g5QHYMMnG9EL6Okx4Agrl7vfA58TysvMO2aVmeazjIZcMaiyhq
	 wQTBPImflGhVqo6ojSP/0rzhFTn6QQbMsLSjZxAsLpIehToKxA1k9ZklrGIwkew1tf
	 uGbg2bak0vybCZ1NF9H2/KT99aoSbOTEYvnmAa33uX4DxtkL4h2jfGSso5wGXS1qRC
	 E1r7DnKM2J3XA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 14 Nov 2025 14:16:23 +0100
Subject: [PATCH mt76 3/4] wifi: mt76: Move mt76_abort_scan out of
 mt76_reset_device()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt76-fix-missing-mtx-v1-3-259ebf11f654@kernel.org>
References: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
In-Reply-To: <20251114-mt76-fix-missing-mtx-v1-0-259ebf11f654@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
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

Move mt76_abort_scan routine out of mt76_reset_device() in order to
avoid a possible deadlock since mt76_reset_device routine is running
with mt76 mutex help and mt76_abort_scan_complete() can grab mt76 mutex
in some cases.

Fixes: b36d55610215a ("wifi: mt76: abort scan/roc on hw restart")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c   | 2 --
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 5ceaf78c9ea064bf898c347c611a7ccdf9cb9ebc..5e75861bf6f990dc5745b81224faf705395e894d 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -847,8 +847,6 @@ void mt76_reset_device(struct mt76_dev *dev)
 	}
 	rcu_read_unlock();
 
-	mt76_abort_scan(dev);
-
 	INIT_LIST_HEAD(&dev->wcid_list);
 	INIT_LIST_HEAD(&dev->sta_poll_list);
 	dev->vif_mask = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 1c0d310146d63bc39357d604b549c83e37c8da35..5caf818e8283438ee3c79124384636cbdd641780 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1451,6 +1451,8 @@ mt7915_mac_full_reset(struct mt7915_dev *dev)
 	if (ext_phy)
 		cancel_delayed_work_sync(&ext_phy->mac_work);
 
+	mt76_abort_scan(&dev->mt76);
+
 	mutex_lock(&dev->mt76.mutex);
 	for (i = 0; i < 10; i++) {
 		if (!mt7915_mac_restart(dev))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 1fac3815c523c05643705b9b6b7263a7fdf2e3a4..6fd732a924ab3a4bdc9224b8fd3cc53438e1db60 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2420,6 +2420,8 @@ mt7996_mac_full_reset(struct mt7996_dev *dev)
 	mt7996_for_each_phy(dev, phy)
 		cancel_delayed_work_sync(&phy->mt76->mac_work);
 
+	mt76_abort_scan(&dev->mt76);
+
 	mutex_lock(&dev->mt76.mutex);
 	for (i = 0; i < 10; i++) {
 		if (!mt7996_mac_restart(dev))

-- 
2.51.1


