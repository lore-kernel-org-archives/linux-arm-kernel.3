Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8BCCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tgxw4cSuVxHYY0msso0oUheIwOTYPybF1krh91UOD7c=; b=xR9ugy+Sj70mbk2cUN7byVzr/k
	kPtDgDbnTz1AwaSbvOTX7u8y+l8S1EndpLA+536lf3rh6gc7vXxQqv3OxIeqo87vEV+SrVCiCCTXO
	UEntsjbyBCwJz/DGPpYXGUX5CodSq3TXOayqr+0DVScDwSGvl2QYzf3L5/HEf+tdZ8Dbu5elRK1S0
	wvNx7zE0ewz2afelzG6MvPdo9UuVw77zF/XbsmCF/TY1sPu/T9Nz/hcEwEJiB5YKFW/XhzBqiPD8e
	blw2LnqgWUmvY43hu8rQX5VjylWHuMzPZ7I/Md4qXp0l+gqEEMgNHsNslQTVfbLueo1XNXVi0WBst
	bjnw4Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usAnC-00000007Isz-2K51;
	Sat, 30 Aug 2025 01:54:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us7Yt-00000006wTb-0hKh;
	Fri, 29 Aug 2025 22:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DFD740933;
	Fri, 29 Aug 2025 22:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAF9C4CEF0;
	Fri, 29 Aug 2025 22:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756506430;
	bh=tNB5HFmWWfIYIDsG4opMaCX9wTee7IZcalG5TFvQ+J8=;
	h=From:Date:Subject:To:Cc:From;
	b=dPmKgKfPLHCtlJIyOlT3PnWoga8MHPmxG0GOwx1ADVbp4+xKrpTgs7Tv5ly80uF+V
	 ojfouIhTxhFZOPrUkgxMJJ0UKiO2jplmIxYTieMbcZDs0FNA+6C8eJLTWyjRv2CoRs
	 bv+d4RjTXYMbBjSqTbeQSLYCm+fSz+i2I4AO1aV5NVj+3lMqOEyFVU3g4iPqJRnW1f
	 eSOaKdy2MJA2jb7YK2x1GYPoneKlAd2cDh6uYUXFct9bYhEbl+KurSfw1wiVx4PvDV
	 uspSnOy5aoa6wt/9fXnKEwUpp1Ai6CRI2UDJwIz7pDd/B6MEzK3VexqoFGlCuE1dfd
	 uN7mRQMlujnVw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 30 Aug 2025 00:26:47 +0200
Subject: [PATCH mt76] wifi: mt76: mt7996: Check phy before init msta_link
 in mt7996_mac_sta_add_links()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250830-mt7996_mac_sta_add_links-fix-v1-1-4219fb8755ee@kernel.org>
X-B4-Tracking: v=1; b=H4sIACYpsmgC/x3MTQqDMBBA4avIrBtIjD9Nr1IkDGbUoTUtmSCCe
 HeDy+8t3gFCiUngVR2QaGPhXywwjwrGBeNMikMx1Lpu9dNqtebeuc6vOHrJ6DEE/+X4ETXxrtC
 ZBq2bTGcRyuKfqOR7/x7O8wKQ+zhzbgAAAA==
X-Change-ID: 20250830-mt7996_mac_sta_add_links-fix-a914a39f163a
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_152711_228238_3DD77EAD 
X-CRM114-Status: UNSURE (   8.80  )
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

In order to avoid a possible NULL pointer dereference in
mt7996_mac_sta_init_link routine, move the phy pointer check before
running mt7996_mac_sta_init_link() in mt7996_mac_sta_add_links routine.

Fixes: dd82a9e02c054 ("wifi: mt76: mt7996: Rely on mt7996_sta_link in sta_add/sta_remove callbacks")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 7f3a117c52bd3438b6bb41a068bbf11658dfba42..0aa90a447156b6e11adc5e0602d3a7b8d3d1057a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1069,16 +1069,17 @@ mt7996_mac_sta_add_links(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 			goto error_unlink;
 		}
 
-		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
-					       link_id);
-		if (err)
-			goto error_unlink;
-
 		mphy = mt76_vif_link_phy(&link->mt76);
 		if (!mphy) {
 			err = -EINVAL;
 			goto error_unlink;
 		}
+
+		err = mt7996_mac_sta_init_link(dev, link_conf, link_sta, link,
+					       link_id);
+		if (err)
+			goto error_unlink;
+
 		mphy->num_sta++;
 	}
 

---
base-commit: 035ba65d13516fa2afa78203ba3ef54fd70584af
change-id: 20250830-mt7996_mac_sta_add_links-fix-a914a39f163a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


