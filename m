Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ED4C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H0a1CQIGg5sXxmGkEd9IVGyS3yp2N3ok/AxA3NteMO0=; b=2lhCp3JesC9dyqy0fkfXSyWRjf
	Lq+hi4Bic0n1dJnUPygl9VoipGhJxKObgnS5b6v7afc6NdabGJhW/qzni09KCKxwr/NDS9eajtzdq
	6tUaU4PzOTKXy0Ui93Y3Z4mY1HUPOVbSL7NwSCbRGhYl1GOrDk9KrzqlQ2AvoJyjUBCpV8hdDT5DO
	h1N4dMxU2nVTGQdB/H7n1XPwgxdbfexV+ZZuV0uB31CucZSXwWFsDO+j/ClSG4vjF1X/snpVFV+Fk
	rVhVCZfSwIqtR+J51gr8V9BbUcE+B73EAjiCIBaUgPl4xqZQ7jVl7me6wH+cXzJ73gx438390H7JT
	r214pENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPdX-0000000BqvZ-01m5;
	Mon, 10 Aug 2026 13:01:51 +0000
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtPdT-0000000Bquv-30OD;
	Mon, 10 Aug 2026 13:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1786366900; x=1786626100;
	bh=H0a1CQIGg5sXxmGkEd9IVGyS3yp2N3ok/AxA3NteMO0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a75mMLVq8pW1ulubCNe2hWY5yRfUkPWQPJbq5Mxi+r8nmnaLoUWIyWjf5mfDr1OM2
	 3nlqC+LWE1DCFwDai0fhsPeD+2EEU1fcRoMzWHwrzpzKIfvj+iGpjqLWUgQAGwosoe
	 nlv7nmm+SE/fVJPEIsFVHcrLbUlJcjx37yAhX0lnwB7z4HT5gMNNedFjMGuWLqQCyS
	 zWwat40JwsWOY4qi5TC+7MEV510IwS7ZUjh2G7RH07v8a1tP23aeLyFtXqb9JAzGoF
	 D7qCR5Wm4260J0SnJcrfMLAg+DnaEM6lO8P+lv3pHLI14e5yhPeMiaLMGAjqmbF0tG
	 bSGRh4EVPRFLw==
Date: Mon, 10 Aug 2026 13:01:35 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH mt76 v2] wifi: mt76: mt7915: fix thermal zone use-after-free and cooling device leak
Message-ID: <20260810-mt7915-unregister-thermal-v2-1-2a0f51adf56f@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 6a9c3b37ed443ec86e6a41c1e1036b5137affe13
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_060147_913980_2B09A428 
X-CRM114-Status: GOOD (  10.27  )
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

The thermal zone registered against the parent device is never torn
down when the phy is unregistered, so it can still be dereferenced
by the thermal core after the phy is freed. The thermal zone and
cooling device are also left registered if a later hwmon
registration step fails during init, leaking both.

Unregister the thermal zone alongside the cooling device on both the
regular unregister path and the init failure path.

While at it, include the band index in the thermal zone registration
warning to help identify which band failed on multi-band chips.

Fixes: 313f1a27ebcb ("wifi: mt76: mt7915: add thermal zone device registrat=
ion")
Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
Changes in v2:
- Unwind cdev/tzone registration in mt7996_thermal_init() on hwmon registra=
tion failure.
- Link to v1: https://patch.msgid.link/20260810-mt7915-unregister-thermal-v=
1-1-c6d57b4cb368@protonmail.com
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/init.c
index ca46a203aa48..5fe70dc822eb 100644
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
@@ -213,6 +216,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 =09struct thermal_cooling_device *cdev;
 =09struct device *hwmon;
 =09const char *name;
+=09int ret;
=20
 =09name =3D devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7915_%s",
 =09=09=09      wiphy_name(wiphy));
@@ -238,8 +242,8 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
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
@@ -248,7 +252,11 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
=20
 =09hwmon =3D devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy=
,
 =09=09=09=09=09=09       mt7915_hwmon_groups);
-=09return PTR_ERR_OR_ZERO(hwmon);
+=09ret =3D PTR_ERR_OR_ZERO(hwmon);
+=09if (ret)
+=09=09mt7915_unregister_thermal(phy);
+
+=09return ret;
 }
=20
 static void mt7915_led_set_config(struct led_classdev *led_cdev,

---
base-commit: ca800a9302764c445de0da0e84d2252400a770ee
change-id: 20260809-mt7915-unregister-thermal-82e805c618a6

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



