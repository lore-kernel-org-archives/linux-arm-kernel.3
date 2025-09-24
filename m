Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6639CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDGC9hXwVm6bS462Izp5vFz+OrkU1zDVyB5kAX8rAMA=; b=2Lv1A4vfgblez++X36VzlXdoVo
	qq+iFc9SpXdwGzoUopGtjyUZIrG6Wx6tsfDUmWl5Tj+YOttV1yoguKXFiIRTMKQD1LlggsXpEIwgG
	LOvMWhjSzIQMPNQXgxpgSm6iuEJ34C5dwB/8AYcsnt3AlpExeCXEw1ZY1SS+ZihqBguGdJXFi3p3P
	9D/5DDEkZLWlC+tXWIdAS7VKupcf6uDv4sycbKqZkdYTR7wqunazZVh2S7XXw+B3QFv1kr4kGyprR
	LLby9um7/PDRxZZwSsebn8BM5tFeDuVgOereII7r+dluIeUplKFgxi2z5fXIMsjWZaApGpUNM/GGZ
	5RzkQ9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PuW-00000000NZ3-3dNb;
	Wed, 24 Sep 2025 13:51:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PuT-00000000NWy-3Qj3;
	Wed, 24 Sep 2025 13:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C2BF43EC8;
	Wed, 24 Sep 2025 13:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9225EC4CEF0;
	Wed, 24 Sep 2025 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758721913;
	bh=2PnF1NHzsZDLHuBnT3GhZhqpwSuMX60FWYPhgeGiYFQ=;
	h=From:Date:Subject:To:Cc:From;
	b=YgPWaB6BDJHLlfanRAGbzN3J6C6T9B3uugL/OopTDyaIjfrDi/0Uzt2ZVM7g70uDv
	 utEdyEfV2sk64BBabYiEFcj5zIFFRD/jYbsZ6b5VbckBtWtUDI86418DfyINGk7acG
	 fr7zsOK4w/lHbPcbAECs7AFArAj91iaY+9vmkf3DkYNxMca6cV1H3hIlJRwQufQbsn
	 ieb6KgQ8bkLc5GlloXs/NdOuEJOXJU8k/cOLWgldGGUkrDot0kSNnEv3oJ6mLEplED
	 3r14dmxjCUxO7n8xG02Unav5tyiOfSrXM87po017zdD3hReY9VovJq7gVfrxbWem8w
	 Qt2aofMIjzFyw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 24 Sep 2025 15:51:39 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Remove unnecessary link_id checks
 in mt7996_tx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-mt76_tx_unnecessary-check-v1-1-e595930a5662@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGr302gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyMT3dwSc7P4kor40ry81OTU4uLEokrd5IzU5GxdyyQjIDSxMEu1SFE
 C6i8oSk3LrACbHR1bWwsA4lXlFGsAAAA=
X-Change-ID: 20250924-mt76_tx_unnecessary-check-9b2b2b486e8d
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_065153_879253_1AA29E0F 
X-CRM114-Status: GOOD (  12.30  )
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

Remove unnecessary link_id checks in mt7996_tx routine since if the link
identifier provided by mac80211 is unspecified the value will be
overwritten at the beginning on the function.

Fixes: f940c9b7aef6 ("wifi: mt76: mt7996: Set proper link destination address in mt7996_tx()")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 581314368c5ba566f6050bee86696c4654619176..de044c16e630c888b181778b4b450c2c75a76939 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1339,12 +1339,10 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 	}
 
 	if (mvif) {
-		struct mt76_vif_link *mlink = &mvif->deflink.mt76;
+		struct mt76_vif_link *mlink;
 
-		if (link_id < IEEE80211_LINK_UNSPECIFIED)
-			mlink = rcu_dereference(mvif->mt76.link[link_id]);
-
-		if (mlink->wcid)
+		mlink = rcu_dereference(mvif->mt76.link[link_id]);
+		if (mlink && mlink->wcid)
 			wcid = mlink->wcid;
 
 		if (mvif->mt76.roc_phy &&
@@ -1352,7 +1350,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 			mphy = mvif->mt76.roc_phy;
 			if (mphy->roc_link)
 				wcid = mphy->roc_link->wcid;
-		} else {
+		} else if (mlink) {
 			mphy = mt76_vif_link_phy(mlink);
 		}
 	}
@@ -1362,7 +1360,7 @@ static void mt7996_tx(struct ieee80211_hw *hw,
 		goto unlock;
 	}
 
-	if (msta && link_id < IEEE80211_LINK_UNSPECIFIED) {
+	if (msta) {
 		struct mt7996_sta_link *msta_link;
 
 		msta_link = rcu_dereference(msta->link[link_id]);

---
base-commit: 1e06a137513dff9835e57f76cff177cb1e2e5475
change-id: 20250924-mt76_tx_unnecessary-check-9b2b2b486e8d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


