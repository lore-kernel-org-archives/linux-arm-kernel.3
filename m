Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89944C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 09:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FjkEHMV8CZWrCpqrknnBFBiHfGfqn8UHNDmsIRcjvwo=; b=OuzQHpAjPqdASWlItjIK2dEju6
	riufxyYt0IVfb0MxdEQvLJmx3Q1PBrDdoI4nCDb4EYPrHNskHWkafOeZ5gDMGFJbf7+vLRlITcvyb
	6xNwJdBJtj0ZuRY720imeTPjaRZ8cJJy4pMUMotApkGzv4mN/XodxInXjoNRQoIoSoInyhPr8Z5p9
	fowS6pOObEIs1r3HA6162m7isjw6HHZv91pRI6orS5XmarpJaSO73cxbJsPE+wPJGT4iYJhgePSij
	pcDYT3LQO4m5GTUvjKMbnaVQRE9C3Hu9Sva1/PE0I7aP3XMFatoSSm5CJlMXYA0ig5y0JqeHzXQK+
	hcVLfkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMlp-0000000BRgc-1W4E;
	Mon, 10 Aug 2026 09:58:13 +0000
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtMlm-0000000BRfR-3xT0;
	Mon, 10 Aug 2026 09:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786355887; x=1786615087;
	bh=FjkEHMV8CZWrCpqrknnBFBiHfGfqn8UHNDmsIRcjvwo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=urbdkUTWmyojU0WvGdgllvJ/SVQwOK61hFZoP8bbC19X70dBFjdjWugF8iHp/Mi6m
	 Ee60bY9W1HbrO3wFPVxdnicc8QCB9ZKPKXBSDNDAc+G2wbIRi/zt9iRwnCuV4ukzck
	 fF9/mePf8GUG815kQ9Cs8PSutuJPqvgQEWe6owB89RH/h/WNZGfrnkN3FXT3ixJr/a
	 3swPhzBSpLE/dhDzPu56CDeINjQQPN/V2S47GnCjEOMz87RzV5AqB4Uv1Ohdv7FivS
	 EfyExTT8TnzztP14RJjAklD8RBPxN5GaX++Al3pTyPzbBGbq7NnJrGDzMIqwr4DJx1
	 Vn8aFNm9rRm7A==
Date: Mon, 10 Aug 2026 09:57:59 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76] wifi: mt76: mt7915: fix thermal zone use-after-free on unregister
Message-ID: <20260810-mt7915-unregister-thermal-v1-1-c6d57b4cb368@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: bdfc05f714111930a08a7bf935deca3457c14f2a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_025811_144123_EC9C1C07 
X-CRM114-Status: UNSURE (   8.29  )
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

phy->tzone is registered with devm_thermal_of_zone_register() against
the parent device, so its cleanup runs only after .remove() returns.
But mt7915_unregister_thermal() never unregisters it, while the phy
memory is freed earlier via mt76_free_device()/ieee80211_free_hw()
in that same .remove() path, leaving a use-after-free window.

Explicitly unregister it with devm_thermal_of_zone_unregister()
in mt7915_unregister_thermal() before the phy is freed.

While at it, include phy->mt76->band_idx in the dev_warn() message
emitted when devm_thermal_of_zone_register() fails, to help identify
which band's thermal zone registration failed on multi-band chips.

Fixes: 313f1a27ebcb ("wifi: mt76: mt7915: add thermal zone device registrat=
ion")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/init.c
index ca46a203aa48..e0376da79dda 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -200,6 +200,9 @@ static void mt7915_unregister_thermal(struct mt7915_phy=
 *phy)
 {
 =09struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
=20
+=09if (phy->tzone)
+=09=09devm_thermal_of_zone_unregister(phy->dev->mt76.dev, phy->tzone);
+
 =09if (!phy->cdev)
 =09=09return;
=20
@@ -238,8 +241,8 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 =09if (IS_ERR(phy->tzone)) {
 =09=09if (PTR_ERR(phy->tzone) !=3D -ENODEV)
 =09=09=09dev_warn(phy->dev->mt76.dev,
-=09=09=09=09 "failed to register thermal zone: %ld\n",
-=09=09=09=09 PTR_ERR(phy->tzone));
+=09=09=09=09 "failed to register thermal zone %d: %ld\n",
+=09=09=09=09 phy->mt76->band_idx, PTR_ERR(phy->tzone));
 =09=09phy->tzone =3D NULL;
 =09}
=20

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260809-mt7915-unregister-thermal-82e805c618a6

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



