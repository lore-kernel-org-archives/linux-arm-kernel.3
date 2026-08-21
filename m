Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D3FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1cswTBQwlfyKLjgpL/0p/xOuHzHelUpb/0O/Tv/eGo=; b=mblOocsB4tZfrozMQQKv5N1Kzu
	Pprh9UbScVWc+7Dkf7gyu648z7UIUeNXgaUG2yNjiQNBlugDpb/SlmuqI7WJpxbpE0Ne71bAn3gcz
	Tak5Nmg9IeEZCwGpEH30WnPunVkENwTVw6b/SJo90WhuZFwzYdJKugXHlsH8K8P7LvclDuJIb4wb9
	gZ/QvHQsJlEFgBqhq8Zi2XQvFAjJs7g5mUaBB6vVIUptvtpuradSMBPXsh25l9WcCqAYNgH0sdsXA
	nyxPCH0zKGeZh9WCAPBil4Rn6iTEsjd63/h+3VVb2H2BZNaob5g5UxCmi0DGv3dPyJMt1rgt16WGY
	Lemft4Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMfm-0000000D6cL-0FNv;
	Fri, 21 Aug 2026 10:40:30 +0000
Received: from mail-4325.protonmail.ch ([185.70.43.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMfi-0000000D6bj-2xcc;
	Fri, 21 Aug 2026 10:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787308823; x=1787568023;
	bh=q1cswTBQwlfyKLjgpL/0p/xOuHzHelUpb/0O/Tv/eGo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a23QH3JPSszQ13w6n0oiuoHgBRAQHbon7SzTKxP9V/uxWtwJU/wZ7TrAOCo3g43gT
	 Y7v7yp4lJ6HqVCcmcHo4ML2mZSQLxH6IZ5VaxKAH6BZFTGNVaAZuPu75EJv5I2zhGD
	 o34NUq1SNPSPJzkfaJ3PxRm/7XAQjRSW9OI4BRDHxTqk0QQ1hgzweu/X/cQWjCWO4K
	 0brCshKKN6jO4/4azjTk733D7cdtlY5DugvAc2iVNx74nsg3gNd60mS685t3l7lzil
	 tmQuOcm4gPj7qHoxj+zmBNyNgE7CB1eOi4DFlHth3JjEtn/ke29zbR+O7W3R00rhx4
	 U/PvaoMiZ/DBg==
Date: Fri, 21 Aug 2026 10:40:18 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH] wifi: mt76: fix unlocked wcid check in mt76_tx_status_skb_add()
Message-ID: <20260821-mt76-stale-wcid-race-v1-1-d6de3f842506@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 020a7b2af528b10c02e7f3b790153a0ef2cff700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_034026_898593_37EA7E2B 
X-CRM114-Status: UNSURE (   8.21  )
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

mt76_tx_status_skb_add() checks rcu_access_pointer(dev->wcid[wcid->idx])
before taking dev->status_lock, then allocates a pktid afterwards. A
concurrent mt76_wcid_cleanup() can run between the check and the lock,
letting a stale wcid be re-added to dev->wcid_list after teardown.

Move the check inside the status_lock section, so that it is atomic
with the idr_alloc() and wcid_list update.

Fixes: fcfe1b5e162b ("mt76: fix tx status related use-after-free race on st=
ation removal")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless=
/mediatek/mt76/tx.c
index 3707ee19e4ae..fa635fe84ec2 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -129,7 +129,7 @@ mt76_tx_status_skb_add(struct mt76_dev *dev, struct mt7=
6_wcid *wcid,
=20
 =09memset(cb, 0, sizeof(*cb));
=20
-=09if (!wcid || !rcu_access_pointer(dev->wcid[wcid->idx]))
+=09if (!wcid)
 =09=09return MT_PACKET_ID_NO_ACK;
=20
 =09if (info->flags & IEEE80211_TX_CTL_NO_ACK)
@@ -147,6 +147,11 @@ mt76_tx_status_skb_add(struct mt76_dev *dev, struct mt=
76_wcid *wcid,
=20
 =09spin_lock_bh(&dev->status_lock);
=20
+=09if (!rcu_access_pointer(dev->wcid[wcid->idx])) {
+=09=09pid =3D MT_PACKET_ID_NO_ACK;
+=09=09goto out;
+=09}
+
 =09pid =3D idr_alloc(&wcid->pktid, skb, MT_PACKET_ID_FIRST,
 =09=09=09MT_PACKET_ID_MASK, GFP_ATOMIC);
 =09if (pid < 0) {

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260821-mt76-stale-wcid-race-4d92f898437b

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



