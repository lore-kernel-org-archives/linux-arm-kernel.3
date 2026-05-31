Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC507CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG26NKoRdG8Qq2dkwFqK3ASDqtGAcLy5ZudzMubis9M=; b=u/m91VwlhpfpmCBFMoxkeA9KyW
	mT9mrLEQnsveFl4t4tmIcNXtsG1aFMBhOU4GSWZr3ykEE5/FcSEEe9fnkymjpYZeZL+xZHDOY4KYA
	B3Ay8bPbgO9E/AFgLWrnxODJzaBSSChvi8AMjO/Ib6f/aSfXVv4mRUrVkmw6r6MKMWNQV+iU01Noi
	hnpS6VpwTuVeOZwVtbP7snbto8Z9IlhYMPYjxIgmN3J+iitE6fWAc+bMaIsHe3emT2rf8moaglrVv
	9ok5KinGEx2zBZh3DXCm+2HYVsV4W7Q9aBahvqoht+LWEVNDqz1C6nX+XcIMeleo2D5DehYh0PwOS
	I/Ymqeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaJ4-00000009JCH-2BX8;
	Sun, 31 May 2026 07:09:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaJ3-00000009JC8-2An2;
	Sun, 31 May 2026 07:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B730D601D6;
	Sun, 31 May 2026 07:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C001F00893;
	Sun, 31 May 2026 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780211395;
	bh=UG26NKoRdG8Qq2dkwFqK3ASDqtGAcLy5ZudzMubis9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UQB77FHVvID3Bio2Dpiw8g4sF0KWJN43d3LG9SwoQlrKiW3z5uEovMlHO6nwXw5pI
	 Zn65Mgd3kqqmRLuFPzo0obXrLD5hGMx+g5VomywEd/v2qjoXyOKvuXdDkcb41eGn74
	 ShTvB/cplG6R/cv7P8RQE5MB6TMl9ymw/vLoVcS+eQDhA/iOh9DnQIIfa8Bq3sfxNC
	 efIqOD4YemY10cQkk00TP0Zl01tmmF22AjOm+N9ABQXtkpuphOftZsH43v/YapnnRX
	 L0KPxB4KYBqzrd8AcjSt4S1RumFFediF+o+WEx5NTjA17Eb7pA+4RxcnrvXer6m72Y
	 TSkMNE+JxVMaw==
Date: Sun, 31 May 2026 09:09:52 +0200
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,
	"nbd@nbd.name" <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chui-hao Chiu =?utf-8?B?KOmCseWegua1qSk=?= <Chui-hao.Chiu@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Roy-CH Luo <Roy-CH.Luo@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7996: fix reading zeroed
 info->control.flags after mt76_tx_status_skb_add()
Message-ID: <ahvewFh2NuB5MO8t@lore-desk>
References: <20260530-mt76_tx_status_skb_add-overwrite-fix-v1-1-e2c3151c391a@kernel.org>
 <6be1d6e67bcb5500c9d1e92449ce7757f6166d22.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AGJPJ/O6tI6V5QoO"
Content-Disposition: inline
In-Reply-To: <6be1d6e67bcb5500c9d1e92449ce7757f6166d22.camel@mediatek.com>
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


--AGJPJ/O6tI6V5QoO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 2026-05-30 at 17:25 +0200, Lorenzo Bianconi wrote:
> > mt76_tx_status_skb_add() zeroes the mt76_tx_cb struct stored at
> > info->status.status_driver_data via memset(). Since info->control and
> > info->status are members of the same union in ieee80211_tx_info,
> > this overwrites info->control.flags.
> > In mt7996_tx_prepare_skb(), mt76_tx_status_skb_add() is called before
> > mt7996_mac_write_txwi(), which re-reads info->control.flags to
> > extract
> > IEEE80211_TX_CTRL_MLO_LINK. Because the field has been zeroed, the
> > link_id always resolves to 0 for frames using global_wcid, leading to
> > incorrect TXWI configuration.
> > Fix this by passing link_id as an explicit parameter to
> > mt7996_mac_write_txwi(). In mt7996_tx_prepare_skb(), the link_id is
> > already extracted from info->control.flags before the destructive
> > mt76_tx_status_skb_add() call. For the beacon and inband discovery
> > callers in mcu.c, use link_conf->link_id directly.
> >=20
> > Fixes: f0b0b239b8f36 ("wifi: mt76: mt7996: rework
> > mt7996_mac_write_txwi() for MLO support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > =A0drivers/net/wireless/mediatek/mt76/mt7996/mac.c=A0=A0=A0 | 9 +++----=
--
> > =A0drivers/net/wireless/mediatek/mt76/mt7996/mcu.c=A0=A0=A0 | 5 +++--
> > =A0drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 3 ++-
> > =A03 files changed, 8 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > index c98446057282..2d3f80b3e41a 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> > @@ -856,7 +856,8 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev
> > *dev, __le32 *txwi,
> > =A0void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
> > =A0			=A0=A0 struct sk_buff *skb, struct mt76_wcid
> > *wcid,
> > =A0			=A0=A0 struct ieee80211_key_conf *key, int pid,
> > -			=A0=A0 enum mt76_txq_id qid, u32 changed)
> > +			=A0=A0 enum mt76_txq_id qid, u32 changed,
> > +			=A0=A0 unsigned int link_id)
> > =A0{
> > =A0	struct ieee80211_hdr *hdr =3D (struct ieee80211_hdr *)skb-
> > >data;
> > =A0	struct ieee80211_tx_info *info =3D IEEE80211_SKB_CB(skb);
> > @@ -866,7 +867,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev
> > *dev, __le32 *txwi,
> > =A0	bool is_8023 =3D info->flags &
> > IEEE80211_TX_CTL_HW_80211_ENCAP;
> > =A0	struct mt76_vif_link *mlink =3D NULL;
> > =A0	struct mt7996_vif *mvif;
> > -	unsigned int link_id;
> > =A0	u16 tx_count =3D 15;
> > =A0	u32 val;
> > =A0	bool inband_disc =3D !!(changed &
> > (BSS_CHANGED_UNSOL_BCAST_PROBE_RESP |
> > @@ -876,9 +876,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev
> > *dev, __le32 *txwi,
> > =A0
> > =A0	if (wcid !=3D &dev->mt76.global_wcid)
> > =A0		link_id =3D wcid->link_id;
> > -	else
> > -		link_id =3D u32_get_bits(info->control.flags,
> > -				=A0=A0=A0=A0=A0=A0 IEEE80211_TX_CTRL_MLO_LINK);
> > =A0
> > =A0	mvif =3D vif ? (struct mt7996_vif *)vif->drv_priv : NULL;
> > =A0	if (mvif) {
> > @@ -1096,7 +1093,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev
> > *mdev, void *txwi_ptr,
> > =A0	/* Transmit non qos data by 802.11 header and need to fill
> > txd by host*/
> > =A0	if (!is_8023 || pid >=3D MT_PACKET_ID_FIRST)
> > =A0		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb,
> > wcid, key,
> > -				=A0=A0=A0=A0=A0 pid, qid, 0);
> > +				=A0=A0=A0=A0=A0 pid, qid, 0, link_id);
> > =A0
> > =A0	/* MT7996 and MT7992 require driver to provide the MAC TXP
> > for AddBA
> > =A0	 * req
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > index 8be40d60ad29..a14c63438923 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> > @@ -3103,7 +3103,7 @@ mt7996_mcu_beacon_cont(struct mt7996_dev *dev,
> > =A0
> > =A0	buf =3D (u8 *)bcn + sizeof(*bcn);
> > =A0	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL,
> > 0, 0,
> > -			=A0=A0=A0=A0=A0 BSS_CHANGED_BEACON);
> > +			=A0=A0=A0=A0=A0 BSS_CHANGED_BEACON, link_conf-
> > >link_id);
> > =A0
> > =A0	memcpy(buf + MT_TXD_SIZE, skb->data, skb->len);
> > =A0}
> > @@ -3249,7 +3249,8 @@ int mt7996_mcu_beacon_inband_discov(struct
> > mt7996_dev *dev,
> > =A0
> > =A0	buf =3D (u8 *)tlv + sizeof(*discov);
> > =A0
> > -	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL,
> > 0, 0, changed);
> > +	mt7996_mac_write_txwi(dev, (__le32 *)buf, skb, wcid, NULL,
> > 0, 0,
> > +			=A0=A0=A0=A0=A0 changed, link_conf->link_id);
> > =A0
> > =A0	memcpy(buf + MT_TXD_SIZE, skb->data, skb->len);
> > =A0
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> > b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> > index 0dc4198fcf8b..0d6488522ba7 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
> > @@ -874,7 +874,8 @@ void mt7996_mac_enable_nf(struct mt7996_dev *dev,
> > u8 band);
> > =A0void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
> > =A0			=A0=A0 struct sk_buff *skb, struct mt76_wcid
> > *wcid,
> > =A0			=A0=A0 struct ieee80211_key_conf *key, int pid,
> > -			=A0=A0 enum mt76_txq_id qid, u32 changed);
> > +			=A0=A0 enum mt76_txq_id qid, u32 changed,
> > +			=A0=A0 unsigned int link_id);
> > =A0void mt7996_mac_update_beacons(struct mt7996_phy *phy);
> > =A0void mt7996_mac_set_coverage_class(struct mt7996_phy *phy);
> > =A0void mt7996_mac_work(struct work_struct *work);
>=20
> The reason we didn't make the same change is because we use other
> control flags (IEEE80211_TX_CTRL*) of info->control.flags not just MLO
> one. So with this change we still need to copy over the other flags and
> pass them in as well.

Do you mean you are using info->control.flags in mt7996_mac_write_txwi() in
some downstream code? If so, I guess you can use a similar approach and
just pass the required field. Copy the full ieee80211_tx_info struct on
per-packet basis seems unnecessary.

Regards,
Lorenzo

>=20
> Ryder
> >=20
> > ---
> > base-commit: 4913f44167cf35a9536e9eec7352e15b2de0c573
> > change-id: 20260530-mt76_tx_status_skb_add-overwrite-fix-85818a9bb31f
> >=20
> > Best regards,
>=20

--AGJPJ/O6tI6V5QoO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCahvewAAKCRA6cBh0uS2t
rNHKAQCgF6JS3c6ktKzaI4IBFEI0REHQ4gW0I06DRKni7DzpvgEAzywsMjZzJiQj
uw/Weyl2/PAYvoAbfLxMrRoXMQBrnQI=
=xydx
-----END PGP SIGNATURE-----

--AGJPJ/O6tI6V5QoO--

