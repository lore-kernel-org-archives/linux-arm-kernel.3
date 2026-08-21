Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6B7C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RMOVq/yYVJ/t1zHFfNFBFWkMeYoxZiohJENLsBDPSw8=; b=knzOVr9NNpB5bsEYArKi0gp1m8
	aXwb+NSGjEvMqzbx+yVjleJ5+Q/LlZcy4vSl8ofHDBA6ci9nbOyx2KYX5p35t7jWlnYtPNswLn/oY
	R9fgwVmwD0iLReb82IrKHcqq0ZyqatnXM9MHTaSJfTS90xTh13tN5bFwbNiByToZnwfktKfI3Esgh
	by9mOuzna2PmZk07tcDJ3ReFgkeNNWOWZ8dTI/qEwvSDJttV4WKJ5JhUA/PNPILfVOkjTHqh1lSWP
	2VssqDwS4RjWOYqD1mR6/p04Ett1p9vOjBSksdh9ScraBi7vvq9DJ6hNvAVywiPLSiN12ztTwjD9d
	OoMj2NKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPGq-0000000DOs8-3AwE;
	Fri, 21 Aug 2026 13:26:56 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPGn-0000000DOr1-3EXP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787318809; x=1787578009;
	bh=RMOVq/yYVJ/t1zHFfNFBFWkMeYoxZiohJENLsBDPSw8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Jj4+o+sHnk0QyXaTkOcWoRiXcP+0Ztgdi86Jhsn+2sMQ3710fSX//lP+wty6TCqYE
	 7wRkhnCo2wNe53PdYNY6v1xtuvVfBwWISt0ErMpMUJdf6DAapYiIeEZu8Ic0oAPh9x
	 AFY/2esZrVP3qSiw6DgGXvuTJowOOFYeUU/LPrcUOxSVgTrG4m2p8o90M4qypE3CKc
	 PQUBXYBPBPwe844PqosYaVmGF9x1/GtRNTA6ehPU5r0gMJsm8rxkwY9+quaJHWAf55
	 OaaavzlysmX3eNZ8PhNsL5DSqaXtdPo/tFScou0p9YyTJGmMidt6K74w+tZVXdAa1t
	 Y6wBZQkchD6Zw==
Date: Fri, 21 Aug 2026 13:26:43 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76] wifi: mt76: fix wcid teardown ordering in mt76_reset_device()
Message-ID: <20260821-mt76-wcid-null-before-cleanup-v1-1-0e364d9062d6@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 6c7e4c8903af770bdbcc283a100b1d8847502fc7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062653_969128_43B0F5B0 
X-CRM114-Status: UNSURE (   9.36  )
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

mt76_reset_device() tears down each wcid's pktid idr before clearing
dev->wcid[i], which is the reverse of the ordering used on the
sta removal path. Until the pointer is cleared, a concurrent lookup
under status_lock can still find the wcid and access its
already destroyed idr.

Clear dev->wcid[i] before calling mt76_wcid_cleanup(), reproducing
the ordering mac80211 already enforces for normal sta removal (where
mt76_sta_pre_rcu_remove() clears dev->wcid[idx] before
mt76_wcid_cleanup() runs via the .sta_state callback).

Fixes: 065c79df595a ("wifi: mt76: mt7915: fix list corruption after hardwar=
e restart")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wi=
reless/mediatek/mt76/mac80211.c
index abbe65cbcd89..0eb021be837a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -856,8 +856,8 @@ void mt76_reset_device(struct mt76_dev *dev)
 =09=09=09continue;
=20
 =09=09wcid->sta =3D 0;
-=09=09mt76_wcid_cleanup(dev, wcid);
 =09=09rcu_assign_pointer(dev->wcid[i], NULL);
+=09=09mt76_wcid_cleanup(dev, wcid);
 =09}
 =09rcu_read_unlock();
=20

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260821-mt76-wcid-null-before-cleanup-cdb4d640f7de

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



