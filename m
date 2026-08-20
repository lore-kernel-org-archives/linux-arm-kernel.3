Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E53C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AS3sZF4MOHOL/PnrFHGmfd8I3tCjlqKL1VISYbtbo64=; b=mntY4Ckz6stsVXXoFfU2NGWlwZ
	XITqCeziFKJxkX0mCp4jQB/BzyREYWK6QMiTGK7GUSuq9dBSR8rTLJK0Un1IuHJndteJUN7cCea6Q
	HXcwy7JDKuyQ8FZ3kdJRqap3KbRxPjIBqJz6vXRaiEQlNK0MqV+rb3o/T+0W16IcV+C8qUuNsTy8v
	dc2nzNGEwGtAhi1xdKbaGXaQ5R02LQfW8VBnmWlwOAbGot16FTmEHqzjk6dszTIC/kaovhh6YiA2+
	z8Qrc+rljKDjNERIOpkxgK4jtTsgoL742MRu7ySgqbs/hB+CX3c6k+bMlvIOelkXB6qPMMYw3mj2+
	JLlB8KmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx292-0000000BZDe-1f3w;
	Thu, 20 Aug 2026 12:45:20 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx28z-0000000BZCl-1DBA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787229912; x=1787489112;
	bh=AS3sZF4MOHOL/PnrFHGmfd8I3tCjlqKL1VISYbtbo64=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f30/HuIhgSkLsmObikl71bREAHuLWbsagZhJ6Fy8l/A7wYXljz7OjAhw5hPwqPdnn
	 nR1dK47UD9iHzpEcQxcrxTX4ME7pzpH68fg2V9cdaagzFF+x173CD/l2lRcyMl658m
	 ofw0RhIenIquM2joQ7A8D8ILaRft17Ti5iZiE9PSwcBGHynEoNr4u2YWBYp1oU7st2
	 4xhktZU1X0zhZiYXrrGIcLwLCTBoejqXbP8aB7dwGWN17Is3bwMZcNKqxDTal0jZxe
	 kKNnIKIQ7c5M++AXd9Yc+JZCMaiciifjVE7984jXcsT9GWvX8SeBHvWWPkXRvL8aKy
	 7us2bTocPH5KA==
Date: Thu, 20 Aug 2026 12:45:01 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76] wifi: mt76: fix wcid->pktid corruption in mt76_wcid_cleanup()
Message-ID: <20260820-mt76-pktid-idr-race-v1-1-451f176a6495@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: e3e10a410ba36c1cb116a12f4f84991ddc9ac07f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_054517_502207_AE7C203E 
X-CRM114-Status: UNSURE (   8.91  )
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

mt76_wcid_cleanup() releases dev->status_lock before calling
idr_destroy(&wcid->pktid) to tear down the pktid idr. Meanwhile,
mt76_tx_status_skb_add() from tx.c can concurrently insert into
that same idr during tx completion handling:

=09spin_lock_bh(&dev->status_lock);

=09pid =3D idr_alloc(&wcid->pktid, skb, MT_PACKET_ID_FIRST,
=09=09=09MT_PACKET_ID_MASK, GFP_ATOMIC);

Since idr_destroy() runs outside the lock, it can execute concurrently
with idr_alloc() on the same idr, corrupting its internal data
structures. Because idr nodes are freed through the generic slab
allocator, this corruption can resurface later as an unrelated-looking
crash anywhere in the kernel that happens to reuse the same freed
memory.

Fix this by calling idr_destroy() before releasing dev->status_lock,
so that the table teardown and any concurrent insertion are mutually
exclusive.

Closes: https://github.com/openwrt/openwrt/issues/24594
Fixes: bd1e3e7b693c ("mt76: introduce packet_id idr")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wi=
reless/mediatek/mt76/mac80211.c
index abbe65cbcd89..16e53c4593cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1744,9 +1744,12 @@ void mt76_wcid_cleanup(struct mt76_dev *dev, struct =
mt76_wcid *wcid)
=20
 =09mt76_tx_status_lock(dev, &list);
 =09mt76_tx_status_skb_get(dev, wcid, -1, &list);
-=09mt76_tx_status_unlock(dev, &list);
-
+=09/*
+=09 * must run under status_lock to avoid racing mt76_tx_status_skb_add()
+=09 * in tx.c, which allocates pktid entries via idr_alloc() concurrently.
+=09 */
 =09idr_destroy(&wcid->pktid);
+=09mt76_tx_status_unlock(dev, &list);
=20
 =09/* Remove from sta_poll_list to prevent list corruption after reset.
 =09 * Without this, mt76_reset_device() reinitializes sta_poll_list but

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260820-mt76-pktid-idr-race-29f92c15b089

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



