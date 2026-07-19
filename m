Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA87C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 02:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBjAaTvVK2MAeuR8nn6R746ihPtr83agaW7aplO+tzc=; b=bjYPWWbV1rsRCP8FuuKFNgf5vE
	me+LjRny2FepHREWgUrRwJed6MHkcmpv7ewoGkDGgYDrinHsdf1HfU/nZ7S8qpr9CGVPDYbauKdS+
	EctyYQYOoLCAYMwv6fvJ8LeeDW041yy0dMAqH1nqckd4acbuTNsPokjgqp4IKohux1Dq/KeeTyI7d
	xgv4019+IAGuGcJP0y4S27DsJAXMlbeGQVPpdMYyNIwKeGBoGGPuwfD7vHrBl0cL+N2QiYzEhXTNF
	QPtUQp93xtL84wyLB7OBVvkjwmqhwyXV7iHQplYuYCfE0xIaepripTMpcndx1jQGf4SSdE94OLda9
	S04CDm1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlH3N-00000004gqK-1bdi;
	Sun, 19 Jul 2026 02:14:53 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlH3D-00000004gpO-0Klf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 02:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784427269; x=1784686469;
	bh=yBjAaTvVK2MAeuR8nn6R746ihPtr83agaW7aplO+tzc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=p16gr+jg41+XZbVVxShV/guTrsEbRhkDMDpW48sod8U1WPgHibn8ZChXIIF/r2FZI
	 z7HE/TtCFZk5bcvenMNQ24H6P8PLlrfx8MqWIa2hKRxl8yOSICOL6CUMsDVSdY+9NO
	 rmxIL6tOtY5X+UArbnqq4OvehrJvCEMv6G6rQQWqd1XhDGCn66A2N7b+wuyjBm3LyN
	 O228ctlf00+Rr2qd16XBsV2OQdZafytuOF8KixiRXEePhP2Y55/khcxA1UJ/fbAqRJ
	 7ioe+TbgkFnxdlms2tJxpb3fiYPRGXvywQzkQvAFq9F/BoXEsxy9zusNmm4MrL/izi
	 xiQqyfBGYJKkw==
Date: Sun, 19 Jul 2026 02:14:19 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH RESEND mt76 v2] wifi: mt76: mt7915: add thermal zone device registration
Message-ID: <20260719-mt7915-thermal-zone-device-registration-v2-1-0eac68c2741e@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 480d21824b61b802ac8d168e8bd15d29554584de
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_191443_298039_AF9D595C 
X-CRM114-Status: GOOD (  10.39  )
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

Register the mt7915 phy as a thermal zone sensor using
devm_thermal_of_zone_register() so that device tree thermal-zones
nodes can reference the Wi-Fi chip as a temperature source. This
allows the kernel thermal governor to control external cooling
devices such as PWM fans based on Wi-Fi chip temperature.

Registration is non-fatal: -ENODEV is returned when no
thermal-sensors DT property references this device, which is the
expected case on platforms without a thermal zone configured.

Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
v2: Use phy->mt76->band_idx instead of hardcoded 0 as sensor ID
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   | 30 ++++++++++++++++++=
++++
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7915/init.c
index 250c2d2479b0..6568d7b6bc0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -177,6 +177,25 @@ static const struct thermal_cooling_device_ops mt7915_=
thermal_ops =3D {
 =09.set_cur_state =3D mt7915_thermal_set_cur_throttle_state,
 };
=20
+static int mt7915_thermal_get_temp(struct thermal_zone_device *tz, int *te=
mp)
+{
+=09struct mt7915_phy *phy =3D thermal_zone_device_priv(tz);
+=09int val;
+
+=09mutex_lock(&phy->dev->mt76.mutex);
+=09val =3D mt7915_mcu_get_temperature(phy);
+=09mutex_unlock(&phy->dev->mt76.mutex);
+=09if (val < 0)
+=09=09return val;
+
+=09*temp =3D val * 1000;
+=09return 0;
+}
+
+static const struct thermal_zone_device_ops mt7915_tz_ops =3D {
+=09.get_temp =3D mt7915_thermal_get_temp,
+};
+
 static void mt7915_unregister_thermal(struct mt7915_phy *phy)
 {
 =09struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
@@ -213,6 +232,17 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 =09phy->throttle_temp[MT7915_CRIT_TEMP_IDX] =3D MT7915_CRIT_TEMP;
 =09phy->throttle_temp[MT7915_MAX_TEMP_IDX] =3D MT7915_MAX_TEMP;
=20
+=09phy->tzone =3D devm_thermal_of_zone_register(phy->dev->mt76.dev,
+=09=09=09=09=09=09   phy->mt76->band_idx, phy,
+=09=09=09=09=09=09   &mt7915_tz_ops);
+=09if (IS_ERR(phy->tzone)) {
+=09=09if (PTR_ERR(phy->tzone) !=3D -ENODEV)
+=09=09=09dev_warn(phy->dev->mt76.dev,
+=09=09=09=09 "failed to register thermal zone: %ld\n",
+=09=09=09=09 PTR_ERR(phy->tzone));
+=09=09phy->tzone =3D NULL;
+=09}
+
 =09if (!IS_REACHABLE(CONFIG_HWMON))
 =09=09return 0;
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/n=
et/wireless/mediatek/mt76/mt7915/mt7915.h
index bf1d915a3ca2..92e0f9f0169c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -205,6 +205,7 @@ struct mt7915_phy {
=20
 =09struct ieee80211_vif *monitor_vif;
=20
+=09struct thermal_zone_device *tzone;
 =09struct thermal_cooling_device *cdev;
 =09u8 cdev_state;
 =09u8 throttle_state;

---
base-commit: ac798f757d6475dc6fee2ec899980d6740714596
change-id: 20260718-mt7915-thermal-zone-device-registration-e6d7bdc80aa5

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



