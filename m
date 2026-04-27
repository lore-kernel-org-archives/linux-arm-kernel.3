Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA48FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SX5sGh83PdK+POB1hhDv0nWhUh1Dh/G9c9i3vKXZIg=; b=gQTk2UfdzjrEGdUqdquzcnkPu7
	El7Q4HaJugAnAlkhqH2ByKgJ1FpWd9Ufyt2qPCwhuU5j3HT83aetm8y8QWK6L+HxWXUPubo8n28ad
	qtP3laFIdBygldzqwgzBxthFzjel6PjUCkMWWQtaIjmcxLYHQFOUmQcSgvFKjqeUd/Ek+T/aCg7pM
	y7Ex9aKSJQJsAaujhUqjCgNZPxy2QdqlrUFadKhBEAsrQ6jN95CFeaDPK6WiVqd0Kb4YhCSeZ2q09
	nl2xtW9mVRKM5rcpwKbflRs3UAnh0x8eipFYBM1YOk7SqPrTIpyiFAiPBCS5G6roUGxqRYh9YvmSU
	CA82Fu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSAf-000000005TI-3JyM;
	Mon, 27 Apr 2026 20:03:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHSAZ-000000005Su-2Q3Y;
	Mon, 27 Apr 2026 20:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72E1340673;
	Mon, 27 Apr 2026 20:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CB7C19425;
	Mon, 27 Apr 2026 20:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777320182;
	bh=iYnt7yet9ai0JZsLISP6KRBiD+RupCZOpDUOsItep6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cJ/uDcp9fWERaaKk+NyuCS5sUYI+Dt7koOIpEOqKh9XNi6Sj06AhGmV+KU1G6qErB
	 wWA/tnoPwoq1nw+OLq2G/WvwsLWrLav8LZBl/Uo+OUOyb4UL9QbERCl3qB/+OviXSI
	 xMo4JOCu/vmY0ekl9Ywr9T4Fol0dXbyrclRjLszJ/JNxJu2yczsuU+batC0PWScz3I
	 orhClTOCmIctqVen/VmV8aV4CIGc1oBjy5c/6WmtlDuT5KIwtdjwxE0p+M5yHnn5zR
	 4zQxvr+zPMQLkfnaebjO8rcHAh068ADa7qtjJTc0omMTk+SNDC3L15LOi+BJzuCEbJ
	 eHvBPph6cipHQ==
Date: Mon, 27 Apr 2026 21:02:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Message-ID: <20260427-safeguard-unthawed-cfb87dc55a32@spud>
References: <20260427034427.881389-1-rosenp@gmail.com>
 <20260427034427.881389-4-rosenp@gmail.com>
 <20260427-hug-baboon-d60bb8fdfa51@spud>
 <CAKxU2N-mhrhjDEc2MnOvDZC5PpMzj=vRgMemNK4qSQzNQ-=BPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4q7PrbiuZdudXYhn"
Content-Disposition: inline
In-Reply-To: <CAKxU2N-mhrhjDEc2MnOvDZC5PpMzj=vRgMemNK4qSQzNQ-=BPQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_130303_663772_295D9CC7 
X-CRM114-Status: GOOD (  27.49  )
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


--4q7PrbiuZdudXYhn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 12:17:04PM -0700, Rosen Penev wrote:
> On Mon, Apr 27, 2026 at 12:09=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> > > mt76_get_of_data_from_mtd has been replaced by
> > > mt76_get_of_data_from_nvmem in all usages.
> >
> > All users in the kernel, but what about other sources of devicetrees?
> > Those built into firmware etc? Are there none of those too?
> I'm actively removing those: https://github.com/openwrt/openwrt/pull/23113
>=20
> Anyway, irrelevant here.

Hardly, you can't break backwards compatibility with old devicetrees.
Removing known users from the kernel is one step in that process, but if
there's devicetrees in other places those cunt too!

With the moving pieces in this patchset alone it's problematic to move
this fast, since you're changing the dts user in the same series as
removing driver support (AFIACT), which means that neither netdev nor
the platform tree will work with their portion applied.

> >
> > Conor.
> >
> > >
> > > Remove it to prevent people from using the deprecated
> > > mediatek,mtd-eeprom binding.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -----------------=
--
> > >  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
> > >  .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
> > >  3 files changed, 92 deletions(-)
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/ne=
t/wireless/mediatek/mt76/eeprom.c
> > > index afdb73661866..092804323d81 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > > @@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev=
 *dev, void *eep, int len)
> > >       return 0;
> > >  }
> > >
> > > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int o=
ffset, int len)
> > > -{
> > > -#ifdef CONFIG_MTD
> > > -     struct device_node *np =3D dev->dev->of_node;
> > > -     struct mtd_info *mtd;
> > > -     const __be32 *list;
> > > -     const char *part;
> > > -     phandle phandle;
> > > -     size_t retlen;
> > > -     int size;
> > > -     int ret;
> > > -
> > > -     list =3D of_get_property(np, "mediatek,mtd-eeprom", &size);
> > > -     if (!list)
> > > -             return -ENOENT;
> > > -
> > > -     phandle =3D be32_to_cpup(list++);
> > > -     if (!phandle)
> > > -             return -ENOENT;
> > > -
> > > -     np =3D of_find_node_by_phandle(phandle);
> > > -     if (!np)
> > > -             return -EINVAL;
> > > -
> > > -     part =3D of_get_property(np, "label", NULL);
> > > -     if (!part)
> > > -             part =3D np->name;
> > > -
> > > -     mtd =3D get_mtd_device_nm(part);
> > > -     if (IS_ERR(mtd)) {
> > > -             ret =3D  PTR_ERR(mtd);
> > > -             goto out_put_node;
> > > -     }
> > > -
> > > -     if (size <=3D sizeof(*list)) {
> > > -             ret =3D -EINVAL;
> > > -             goto out_put_node;
> > > -     }
> > > -
> > > -     offset +=3D be32_to_cpup(list);
> > > -     ret =3D mtd_read(mtd, offset, len, &retlen, eep);
> > > -     put_mtd_device(mtd);
> > > -     if (mtd_is_bitflip(ret))
> > > -             ret =3D 0;
> > > -     if (ret) {
> > > -             dev_err(dev->dev, "reading EEPROM from mtd %s failed: %=
i\n",
> > > -                     part, ret);
> > > -             goto out_put_node;
> > > -     }
> > > -
> > > -     if (retlen < len) {
> > > -             ret =3D -EINVAL;
> > > -             goto out_put_node;
> > > -     }
> > > -
> > > -     if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
> > > -             u8 *data =3D (u8 *)eep;
> > > -             int i;
> > > -
> > > -             /* convert eeprom data in Little Endian */
> > > -             for (i =3D 0; i < round_down(len, 2); i +=3D 2)
> > > -                     put_unaligned_le16(get_unaligned_be16(&data[i]),
> > > -                                        &data[i]);
> > > -     }
> > > -
> > > -#ifdef CONFIG_NL80211_TESTMODE
> > > -     dev->test_mtd.name =3D devm_kstrdup(dev->dev, part, GFP_KERNEL);
> > > -     if (!dev->test_mtd.name) {
> > > -             ret =3D -ENOMEM;
> > > -             goto out_put_node;
> > > -     }
> > > -     dev->test_mtd.offset =3D offset;
> > > -#endif
> > > -
> > > -out_put_node:
> > > -     of_node_put(np);
> > > -     return ret;
> > > -#else
> > > -     return -ENOENT;
> > > -#endif
> > > -}
> > > -EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
> > > -
> > >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> > >                               const char *cell_name, int len)
> > >  {
> > > @@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *de=
v, void *eep, int len)
> > >       if (!ret)
> > >               return 0;
> > >
> > > -     ret =3D mt76_get_of_data_from_mtd(dev, eep, 0, len);
> > > -     if (!ret)
> > > -             return 0;
> > > -
> > >       return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
> > >  }
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/=
wireless/mediatek/mt76/mt76.h
> > > index 527bef97e122..f447ecac664d 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > @@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file,=
 const char *str,
> > >
> > >  int mt76_eeprom_init(struct mt76_dev *dev, int len);
> > >  int mt76_eeprom_override(struct mt76_phy *phy);
> > > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int o=
ffset, int len);
> > >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> > >                               const char *cell_name, int len);
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/dri=
vers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > > index eb92cbf1a284..c24e1276700b 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > > @@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915=
_dev *dev)
> > >
> > >       offs =3D is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
> > >
> > > -     ret =3D mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
> > > -     if (!ret)
> > > -             return ret;
> > > -
> > >       ret =3D mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", s=
ize);
> > >       if (!ret)
> > >               return ret;
> > > --
> > > 2.54.0
> > >

--4q7PrbiuZdudXYhn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae/A8AAKCRB4tDGHoIJi
0mg6AQDTfrPbMafX6AbtPoj/frUQAgZbVD7yhQXZ1kVA5Su3XwD+M/evwPPjGmNv
xvg4zT+bi+MVHWgI6dDaYaaNbUXqcwM=
=UQTF
-----END PGP SIGNATURE-----

--4q7PrbiuZdudXYhn--

