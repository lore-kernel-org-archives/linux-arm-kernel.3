Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F8C44532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 03:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9UUSEVoX23+teHyHVc4XnhVE7Bddxb84RHflEA9fy0=; b=oKUmcemjxRjHRPhWXRJ2DrvFTi
	kD4QNdXchP7U9GR4W1Oq/QKeA5/iwVqiuftvI6G+TxU3uIN8WlQ2AG/j3ORI7EvtlD2aTK7w8U4+3
	79CRBvwk71GDslugdlxLkwIoYR+rCPWhmisq496HAjZ9JC2ZiTdTVPj0181I2IRpi2ERyCs111PnW
	xEyGJLX2arBOfM/rgMlnhGszV0amL5UoT9Qk3GdrKA0FrpOx+41WxY9VU1KF1/ZBmTUcOrmLhTqe/
	5PH/CjHDBWZc7KD1H5Pq0rqTxf2RtJo1lA3SClNCntaEY6N0QVKCuazdiiPeNV39YjcA2/ucAjJy0
	u6mQAdXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmO03-0000000AqZx-0BsI;
	Wed, 22 Jul 2026 03:52:03 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmO00-0000000AqZA-1pjg;
	Wed, 22 Jul 2026 03:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784692314; x=1784951514;
	bh=T9UUSEVoX23+teHyHVc4XnhVE7Bddxb84RHflEA9fy0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=narpR5eI5Dv7nRg39pOtG91KL4+Z/eaWBUeoCzoR5r0rRoFgA/4E2GItrEfmdKLF3
	 JAx6yzJdT2aswrUNP6GQ7b0I1h7AFjcwDDwXDS2DPt28CYyi4eRS+Ageu6lz3Q29Ok
	 xWw2hMYMWh961eHo5f83WjQJepZSZAmktjML6bvLl7edMoriJGWsY+F6gG6K7DfWw1
	 9FUuLR9Fe0i4U+aDpsLTMR0nB2iVb/TzwDJW6D2YTevx2O3vT2b1m8by5WdyNQwOl6
	 ZKzZZ6spVIOHGOTEWWKN9p3TrKMHxNu9Pltsk4sm33yofS+YdAVS1SMM2Stle5AKwb
	 s6EVEw234BUfA==
Date: Wed, 22 Jul 2026 03:51:50 +0000
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Ryan Leung <untilscour@protonmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ryan Leung <untilscour@protonmail.com>
Subject: [PATCH] wifi: mt76: mt7996: add thermal zone device registration
Message-ID: <20260722-mt7996-thermal-zone-v1-1-88896e6e9985@protonmail.com>
Feedback-ID: 184418679:user:proton
X-Pm-Message-ID: 9e14f46cfdb4bf39a41e6629e5d0f893ba5c57c3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_205200_711449_2CF5DE23 
X-CRM114-Status: GOOD (  10.92  )
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

Register the mt7996 phy as a thermal zone sensor using
devm_thermal_of_zone_register() so that device tree thermal-zones
nodes can reference the Wi-Fi chip as a temperature source. This
allows the kernel thermal governor to control external cooling
devices such as PWM fans based on Wi-Fi chip temperature.

Registration is non-fatal: -ENODEV is returned when no
thermal-sensors DT property references this device, which is the
expected case on platforms without a thermal zone configured.

Signed-off-by: Ryan Leung <untilscour@protonmail.com>
---
This is essentially the same as the previous patch for mt7915 [1] but calls
mt7996_mcu_get_temperature without mutex, consistent with the existing hwmo=
n
mt7996_thermal_temp_show callback.

I don't know if mt7996 also needs mutex locks such as those in commit
e733647566ec ("wifi: mt76: mt7915: hold dev->mutex while interacting with t=
he thermal state") [2]

[1] https://patch.msgid.link/20260719-mt7915-thermal-zone-device-registrati=
on-v2-1-0eac68c2741e@protonmail.com
[2] https://patch.msgid.link/20241230194202.95065-10-nbd@nbd.name
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   | 28 ++++++++++++++++++=
++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7996/init.c
index d6f9aa1ab52d..115145f993d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -236,6 +236,23 @@ static const struct thermal_cooling_device_ops mt7996_=
thermal_ops =3D {
 =09.set_cur_state =3D mt7996_thermal_set_cur_throttle_state,
 };
=20
+static int mt7996_thermal_get_temp(struct thermal_zone_device *tz, int *te=
mp)
+{
+=09struct mt7996_phy *phy =3D thermal_zone_device_priv(tz);
+=09int val;
+
+=09val =3D mt7996_mcu_get_temperature(phy);
+=09if (val < 0)
+=09=09return val;
+
+=09*temp =3D val * 1000;
+=09return 0;
+}
+
+static const struct thermal_zone_device_ops mt7996_tz_ops =3D {
+=09.get_temp =3D mt7996_thermal_get_temp,
+};
+
 static void mt7996_unregister_thermal(struct mt7996_phy *phy)
 {
 =09struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
@@ -277,6 +294,17 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 =09phy->throttle_temp[MT7996_CRIT_TEMP_IDX] =3D MT7996_CRIT_TEMP;
 =09phy->throttle_temp[MT7996_MAX_TEMP_IDX] =3D MT7996_MAX_TEMP;
=20
+=09phy->tzone =3D devm_thermal_of_zone_register(phy->dev->mt76.dev,
+=09=09=09=09=09=09   phy->mt76->band_idx, phy,
+=09=09=09=09=09=09   &mt7996_tz_ops);
+=09if (IS_ERR(phy->tzone)) {
+=09=09if (PTR_ERR(phy->tzone) !=3D -ENODEV)
+=09=09=09dev_warn(phy->dev->mt76.dev,
+=09=09=09=09 "failed to register thermal zone%d: %ld\n",
+=09=09=09=09 phy->mt76->band_idx, PTR_ERR(phy->tzone));
+=09=09phy->tzone =3D NULL;
+=09}
+
 =09if (!IS_REACHABLE(CONFIG_HWMON))
 =09=09return 0;
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/n=
et/wireless/mediatek/mt76/mt7996/mt7996.h
index 0d6488522ba7..1207b5c7e98b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -372,6 +372,7 @@ struct mt7996_phy {
=20
 =09struct ieee80211_sband_iftype_data iftype[NUM_NL80211_BANDS][NUM_NL8021=
1_IFTYPES];
=20
+=09struct thermal_zone_device *tzone;
 =09struct thermal_cooling_device *cdev;
 =09u8 cdev_state;
 =09u8 throttle_state;

---
base-commit: 69bd85e933c617a84fa54fcc80e628e98afdc45d
change-id: 20260722-mt7996-thermal-zone-a1de7cb1d728

Best regards,
-- =20
Ryan Leung <untilscour@protonmail.com>



