Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DACC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQt5swvuF12n5Otn7tsGHWDcpa/igFQMxHInIlP0Ljg=; b=N3a/HOOGBAXbywVtb7u5p6ukJJ
	rSg1k1KgKsyVBbXbuA9qWW6tUi+WI8aCVcmTqKD3O6bIeiKFaNDuveVz7Y4giVgTQ+PfCVA4mKK7y
	nB2/sBbgvcecYPBGHAPFEBl4TxhmR9Tst3LmS4pH6qa/yjhmVqOULzn9Qx0S03crOaXrkeUxVujLi
	Pyzp26tNgYRWO1kOgmZKYkmn/GSbajU7qHuXSW7r+1G5R7E39DIohICD2YmTZLki2C0ycunCxTyDb
	j6Vy+q6hkjp7QltXLQBE2PQwhnwxZ4iSqx2o0VYA7kR9o7CcE68vN+cYNZKGx4wpL0ta8WuiM3Gy0
	ss4LYWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgNv-0000000EV3R-1tXm;
	Fri, 04 Jul 2025 13:23:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9e-0000000ETKK-30dp;
	Fri, 04 Jul 2025 13:08:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEA01A53C04;
	Fri,  4 Jul 2025 13:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490BEC4CEE3;
	Fri,  4 Jul 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634517;
	bh=xmmgkhOPdCsWqSjAy5GTYM9jvYGbAUUkSpjcX1s/OSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dmrnlXC7ahhj3kDevkJ8gOZkG8ke2rnFdOuDCXkCP/R3rVv9F7H3YmGC/CWCogpWo
	 pCGvIiiXYrReHsfsMsm79I0Vns6o+adslhypGlc8BR2UvjvfKwcImgdcpUle4E+gZ1
	 pGmXW0it45pUTv/HZL+10lsNztGurBN/GOhOB9YsAgpFQPSdJjxbKjGambxlZAZRFu
	 aPuDp3pAw2Bea1YoM/L9ck6PUSNA7hWQjqn/UTcy1eoM6Lig7ALeeVgIXP7pSbIIWx
	 onA4fQyqYQZ9/feTDg/lM4u8g637re+OCELS8BseyLtTVOMhBvoxuOmapZtRw2Welu
	 ZQkeovx3UgNUA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 04 Jul 2025 15:08:09 +0200
Subject: [PATCH mt76 5/9] wifi: mt76: mt7996: Fix mlink lookup in
 mt7996_tx_prepare_skb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mt7996-mlo-fixes-v1-5-356456c73f43@kernel.org>
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
X-CRM114-CacheID: sfid-20250704_060838_829281_DD214E98 
X-CRM114-Status: UNSURE (   9.32  )
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

Use proper link_id in mt7996_tx_prepare_skb routine for mlink lookup.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0dbd4662bc842947abf09f9ae3aa4a1d4b86cba8..0844f27b8458fe53c0765ece70fe91acdfc6510a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1087,9 +1087,9 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		if (wcid->offchannel)
 			mlink = rcu_dereference(mvif->mt76.offchannel_link);
 		if (!mlink)
-			mlink = &mvif->deflink.mt76;
+			mlink = rcu_dereference(mvif->mt76.link[wcid->link_id]);
 
-		txp->fw.bss_idx = mlink->idx;
+		txp->fw.bss_idx = mlink ? mlink->idx : mvif->deflink.mt76.idx;
 	}
 
 	txp->fw.token = cpu_to_le16(id);

-- 
2.50.0


