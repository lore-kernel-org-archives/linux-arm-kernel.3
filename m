Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2355ECDE018
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTlmyLUWq0mqzQzg8SmSzPozKrR4GJXjm7R6oTOX7FI=; b=cG3zhjUTN7Szhy/cqpOpJPuKga
	ZORzLtAWpvdRQ/q1UZI00TcWJtUwEucAcb8gP6kKhwp/OOGYV+pqfkqhbIUIph839VYkSEDHDhi/U
	6Xje+DYToras3qPZegEvGBnHsPqvtnGc5I79iUlkb69G+ZzBCPAsI258Dk7wpo6UBYrLzeZNk+K/0
	WNYtwjHLH+wM/vozVENGZqFeitC8CZIR4uQHyKE3zCF6WuIFAZY9qGHl8J9YVP1UPp5HjJ4nUL8/s
	o06BDCkNeo8+bvvMxTUuyXqUZIEVn9hUET2nbKUkmCipwrj0NC5ARsAMNZ8IigwxLUWBxTZeOw2Z9
	TWlcGmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfP-0000000CEx2-0rWW;
	Fri, 14 Nov 2025 13:16:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtfM-0000000CEuU-3eUK;
	Fri, 14 Nov 2025 13:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC0F6016F;
	Fri, 14 Nov 2025 13:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A88DC4CEF5;
	Fri, 14 Nov 2025 13:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763126199;
	bh=bmUiXuKzR7Y7ZVMjQ0u1D5PLzI5X7SgiDua+J81vZZI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gIyuHu2aYJ/CG6mvi5iolCCXB2MSeOV7a6AsmJ/gA3MPoyiYt0oiC9nvD+BxvpsDA
	 cOZUSTW47PJ79O//i4esT43PWeaIUdW0HCm9ta1YngSx+UGGv+3tEKxFaLrgv/5Qqp
	 YjZ9n9bDKKlBwIEl54tLVnUSU4w2JKQ/aeqmlZW05g9QctPl0WksOzQmoKL2n39zY1
	 tAkotNTU4i0uy+gGA+n7sfN7iUk+6alWdr70wbUTM1voIwoCp2GFG3jZ2os+3r7SRF
	 g9sl8W9HATM93TS4U6+lBIjwJlYPhBGT3UF8qjd8fawz8X6HD9q5AKp6onc8YDUOMb
	 b/Kwn7h6lIsqQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 14 Nov 2025 14:16:22 +0100
Subject: [PATCH mt76 2/4] wifi: mt76: mt7996: Move mt7996_update_beacons
 inside mt76 mutex critical section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-mt76-fix-missing-mtx-v1-2-259ebf11f654@kernel.org>
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

Move mt7996_update_beacons routine inside mt76 mutex critical section
in mt7996_mac_reset_work() in order to run mt7996_vif_conf_link() in
mt7996_mcu_add_beacon routine.

Fixes: f30906c55a400 ("wifi: mt76: mt7996: disable beacons when going offchannel")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3e20132fdbcfe0b1f489694afdc5f..1fac3815c523c05643705b9b6b7263a7fdf2e3a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2599,11 +2599,10 @@ void mt7996_mac_reset_work(struct work_struct *work)
 	local_bh_enable();
 
 	ieee80211_wake_queues(hw);
+	mt7996_update_beacons(dev);
 
 	mutex_unlock(&dev->mt76.mutex);
 
-	mt7996_update_beacons(dev);
-
 	mt7996_for_each_phy(dev, phy)
 		ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 					     MT7996_WATCHDOG_TIME);

-- 
2.51.1


