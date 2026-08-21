Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D223C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jjKPMwvPqtf/gUezHlyDyQGNtBYP8TfCL07SrlXZxuY=; b=cwyi0vrBLFPV2kgAx+7vhTZhp/
	clRgx2arcn09Sc45qX/+cYZgLDZYEUMxVakTPvn24i63LrLB7HXG1XIdKUtMN3mjh2ktbJw0yTuxe
	nmBhF8HBqhtidXljl/+llPH83WFdptQiyuMYJHWPtMqYM4Gkw2PeT9tCIqomlkV3d1bQzku2ifBm2
	ke0ZSTX7gV+gGIHiSsmmhE4GzDvVbvzh18St/cPEV0qbhu63X5y1KzpM3PzOlNtWKc2bs07lzFlIO
	OTXFeh4htBEZYNROIN9rDCJE7+yd9BWpEkOWbeSaxG/GNIk4+XieqlecqemMZqws3BI7Tt1Pe/3GC
	0khsOClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNeF-0000000DD5O-3BP4;
	Fri, 21 Aug 2026 11:42:59 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNeD-0000000DD4K-1bbF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1787312573; x=1787571773;
	bh=jjKPMwvPqtf/gUezHlyDyQGNtBYP8TfCL07SrlXZxuY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=g2m3bnfd51Jj38PRgNL9Gm5kKdQWw87vtLK0N/oPBRFDXEIH+gOFzqOMLVZoIVtx4
	 MP/ASCPT+DBlYB+wOX1RDmiA5yV/sNeSi7dAYhDCATwfqWUdMDVRAvZ9++kNFf3u0g
	 7cKJ1WQ7BduiLLz66rRIF60B6ldZXeL8s+iAmGdmgBTsAuCtXDAFF7VdTjcsgE/3P3
	 3Er4TOjnOID0UGtN/eWD3durdF7fBDuZOHUylmT1iq1MUroDsDVljOW56JEYWRvC8T
	 K5xA/hzk61oLrIsLVgrkyQMdnAiHq8xvTU1OBRsdULnQf82AXwaE1MGAFw4/QuP2AJ
	 P18m+iHQMaw1g==
Date: Fri, 21 Aug 2026 11:42:49 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76 v2] wifi: mt76: fix unlocked wcid check in mt76_tx_status_skb_add()
Message-ID: <20260821-mt76-stale-wcid-race-v2-1-8f41ee96fb73@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 5be2479b9671e0d2d5fe00c1fbaec1404868cb17
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_044257_585199_B38EC3B9 
X-CRM114-Status: GOOD (  10.58  )
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
Worse, the check only tests for a non-NULL slot, so it also passes if a
different wcid has since been published at the same idx.

Move the check under status_lock, alongside idr_alloc(), and compare
identity (rcu_access_pointer(dev->wcid[wcid->idx]) !=3D wcid) instead of
just testing for non-NULL, so that a reused index is correctly rejected.

Fixes: fcfe1b5e162b ("mt76: fix tx status related use-after-free race on st=
ation removal")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
Changes in v2:
- check that dev->wcid[wcid->idx] still points at this wcid, not just
  that it is non-NULL, since the slot can be reused by a different
  station between the unlocked check and the lock being taken.
- Link to v1: https://patch.msgid.link/20260821-mt76-stale-wcid-race-v1-1-d=
6de3f842506@protonmail.com
---
 drivers/net/wireless/mediatek/mt76/tx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless=
/mediatek/mt76/tx.c
index 3707ee19e4ae..0f74d808d328 100644
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
+=09if (rcu_access_pointer(dev->wcid[wcid->idx]) !=3D wcid) {
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



