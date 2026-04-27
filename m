Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D9FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 19:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=; b=G26Gvune3/ROWsjXyLeix6PiQF
	Ssp9+uu1MreXe9t9haXPpweSC8z+4j0jUbft18sU0xpZICenvy3rkqmMKqGK2Vy+OAXE64GS2GmPp
	chL2jJVMNYLiCvkAH8paQQzTQ0RtgrNa62/NG0tkubZwW5i91mDhnah/pnNyhHx9frknP9eNUzidw
	tZrwQqHDT4oN032gHUblA5lsJbvVaE4ApsAr1Qfr5C3jimkWAh2uOzac4eTozO0eebAxVpuFqhGj3
	6nAoP4/ZXV6xRFpf/uE+3hhIhY7si0/CgzXeRtqmpCjLnjmf1Eo2p84Zt3BdQB32OC4uIGBfNzE10
	R0Wf2rog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRSN-000000003Gn-0o4v;
	Mon, 27 Apr 2026 19:17:23 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHRSJ-000000003FZ-3ui9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 19:17:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso14548650a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 12:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777317438; cv=none;
        d=google.com; s=arc-20240605;
        b=BPFJ5gSvBArGySlDWDk1oK1H12J4p0vO5SF8+DVqwWk4j1pL+B0KIM3aDXodNthNd1
         RsDpmgM48KZ5lRJuSP2VxKC10McX835ae7ueCp4d4QvW5XxyeovBYpRNaqreTOp3pF7X
         t+Oqxv4KB+wuPKJFCRa5CkQogjDY79pVWP8kcuDxzfn2r6WSiGLfqkrdjPXaxGaHHxek
         lPAnwQR/SSsINUjIMDGm09cUuVYMPCT3fim47CQjonmkAPXSYFht+mHSp9A9Ye+HRtV5
         NFlIPhasUpUxW66YxLfwC0I1JZJV3y+BGG23woxbMqPvx8qK+orf+wTqhXJmiueIFD3U
         UcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        fh=U3HntYTGO49hxAFnpgtpN2lJGluKZYScr2eb6cgIbWk=;
        b=TI577QBn4PErTn+gzSrAXCC2Ci0Sd5rxxyB8+Kf7EzaYE8+v+KyxoGw2+rDonIg0lw
         D2qw7SIDeh7LCmNwjqozie9zyL+4Hyoc7kF4H/PoWqV6YygY18pVAlMi8hGe0Q+meKX1
         mlO1YUkA5vz80+ipfOf9Jz27atKRv2rVYLk0fuwXxNX3oqsEFUHcsGl8hnrwLVoQTV5j
         zZ2muKkJG1FNLtX+Uwo+BwFGLT8goHcFlY8CueVoj7Czg5WfMDu5REzwNdc5XXlEYdlw
         QgnjWK/PRD9gAaZrbHlbOoxyV9MAUDbO/E+RFtqa1GQiDLLU9hB/3AjpAKFldlVwPy+v
         s5NQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777317438; x=1777922238; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=kNa9xscH3SNai0sQnpVgmWVEf5AIEHCfMsCtYm0mLllRLXPb5CSJGis7o3QSENJ08U
         o/t8c8vq1Un90yUijKEM/+EtdttlDjyYatbnNFPjGN11m2PIH12xOXxdT+rY+oVA14rE
         p4bH8qDXSqUruRsomTYLJelwZ9KIyJiFwXV3P6NP7sbHf5uN+cuIOzWT+gy0uD3PuqaL
         xnCgVQcF2d4ThD2qOssGzww130kr55qnvYsL+6iZ39ZFUL7S1bV5hqkTdLSXrf9enjZi
         iMwv7yqhoNTxPtVsc3fcxQQqYhf6GweNLTGGPrhdoIelyu42srlsi1eoB1T7GWnUlIea
         LYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777317438; x=1777922238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEwJ0lK1FRVhZ82nSuKWtqBlS4HOBMbpzPCG8GR79rM=;
        b=MSU4H4Ni6B6vRfALbeev3w792n9P/WiU5PRZMCqOpUcxWdrXtYQ/EZDpV9n+jODPi0
         P7a31MT7Jbgm87b3ZrRgxHQAtFfurC8lTkArIgNOvYvnnLQbmqZ54xl+ueDv6J3BE3P9
         /o9vGM1ei+nXBa+Wh+5DRfWdj51h+n2XZ95TrkNnE9JoS9Ll0OwpWqELaUc9i9Mib2xl
         Sc9djCLRwKIU7zU1DVW5ouUOo8Kv2u8dtj14HnIV8K/Vwbt4ayTQrSG7cgFZNZlXV0se
         KP5fYE/oTfB3ZZC1qPYpQsPhVAY2eHJHKLp/euQKYXgqE9/HWl6xqiUb0+3aJxA44CoZ
         sGmg==
X-Forwarded-Encrypted: i=1; AFNElJ/V0KrQBQjyvJba1kXeOJXX2WUMkXSdtQ2kTzvL57KEq8iWY2uy7ShrW5uSRHedfigFMSPkikD2oH/Jzmbvfsyx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv3mT4vUQATIQ4UfA84lCH3xjqWw9PLhPqIu0NfWlQlujD+VaH
	xhaXb7i8cOhK+182l7tUDyAHUXlH0Jr1/A9tNmxejxEuSNspSDXYboih6uCY1Bb65RbLG+Vs4uS
	xHgwE8hrkZn48mprqDcHQTTkwIYI3Ejk=
X-Gm-Gg: AeBDiesy+c+fcgv+NIzeIO2Bo05EWKRpMdOdiS2yHedD/wutEGI/Q/LZud6khZFCrGK
	Uiw3rdetHA9eLSuiyCo9yJheJequSjuNDGHLP0kbqZfG4m7/eS6ODMa+ghZaftCk+/xVX7C0bO9
	QcJ4GALmHZJXBjW0J6WfsXcPbKObxjOz5UeKsVnb7278mzQViR5U/+n36ygbPfmdBxtiyUrUWp7
	RPgjJvcrQyU83HahE9he332YtlOOw5adofqVYraFYsdrsE6gzkiKLf/FKjYqMSooFgUxsyt3sNf
	yVHfXM4SCHgXUBn8nZJttIiYVQdMDr1Zc/6WY3g4Sv1j8PPRMM2OhP+9xaOXvk763nFwdYH0MK/
	rUe6SmGPBCs92wzfw0IkGL+xWOy3tN4vxejMvDCmHXa1koHb0
X-Received: by 2002:a17:907:9453:b0:ba4:73da:c with SMTP id
 a640c23a62f3a-bb80530197fmr4956166b.47.1777317437558; Mon, 27 Apr 2026
 12:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260427034427.881389-1-rosenp@gmail.com> <20260427034427.881389-4-rosenp@gmail.com>
 <20260427-hug-baboon-d60bb8fdfa51@spud>
In-Reply-To: <20260427-hug-baboon-d60bb8fdfa51@spud>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 27 Apr 2026 12:17:04 -0700
X-Gm-Features: AVHnY4JrG3QUmyGyx0Gb_wy-V9vfTB4Vk66pF2gttwnm5MDKbGyJbNEFCLFWIDI
Message-ID: <CAKxU2N-mhrhjDEc2MnOvDZC5PpMzj=vRgMemNK4qSQzNQ-=BPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_121720_007460_12D01E0B 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Apr 27, 2026 at 12:09=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> > mt76_get_of_data_from_mtd has been replaced by
> > mt76_get_of_data_from_nvmem in all usages.
>
> All users in the kernel, but what about other sources of devicetrees?
> Those built into firmware etc? Are there none of those too?
I'm actively removing those: https://github.com/openwrt/openwrt/pull/23113

Anyway, irrelevant here.
>
> Conor.
>
> >
> > Remove it to prevent people from using the deprecated
> > mediatek,mtd-eeprom binding.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/eeprom.c   | 87 -------------------
> >  drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
> >  .../wireless/mediatek/mt76/mt7915/eeprom.c    |  4 -
> >  3 files changed, 92 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/=
wireless/mediatek/mt76/eeprom.c
> > index afdb73661866..092804323d81 100644
> > --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> > @@ -35,89 +35,6 @@ static int mt76_get_of_eeprom_data(struct mt76_dev *=
dev, void *eep, int len)
> >       return 0;
> >  }
> >
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len)
> > -{
> > -#ifdef CONFIG_MTD
> > -     struct device_node *np =3D dev->dev->of_node;
> > -     struct mtd_info *mtd;
> > -     const __be32 *list;
> > -     const char *part;
> > -     phandle phandle;
> > -     size_t retlen;
> > -     int size;
> > -     int ret;
> > -
> > -     list =3D of_get_property(np, "mediatek,mtd-eeprom", &size);
> > -     if (!list)
> > -             return -ENOENT;
> > -
> > -     phandle =3D be32_to_cpup(list++);
> > -     if (!phandle)
> > -             return -ENOENT;
> > -
> > -     np =3D of_find_node_by_phandle(phandle);
> > -     if (!np)
> > -             return -EINVAL;
> > -
> > -     part =3D of_get_property(np, "label", NULL);
> > -     if (!part)
> > -             part =3D np->name;
> > -
> > -     mtd =3D get_mtd_device_nm(part);
> > -     if (IS_ERR(mtd)) {
> > -             ret =3D  PTR_ERR(mtd);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (size <=3D sizeof(*list)) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     offset +=3D be32_to_cpup(list);
> > -     ret =3D mtd_read(mtd, offset, len, &retlen, eep);
> > -     put_mtd_device(mtd);
> > -     if (mtd_is_bitflip(ret))
> > -             ret =3D 0;
> > -     if (ret) {
> > -             dev_err(dev->dev, "reading EEPROM from mtd %s failed: %i\=
n",
> > -                     part, ret);
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (retlen < len) {
> > -             ret =3D -EINVAL;
> > -             goto out_put_node;
> > -     }
> > -
> > -     if (of_property_read_bool(dev->dev->of_node, "big-endian")) {
> > -             u8 *data =3D (u8 *)eep;
> > -             int i;
> > -
> > -             /* convert eeprom data in Little Endian */
> > -             for (i =3D 0; i < round_down(len, 2); i +=3D 2)
> > -                     put_unaligned_le16(get_unaligned_be16(&data[i]),
> > -                                        &data[i]);
> > -     }
> > -
> > -#ifdef CONFIG_NL80211_TESTMODE
> > -     dev->test_mtd.name =3D devm_kstrdup(dev->dev, part, GFP_KERNEL);
> > -     if (!dev->test_mtd.name) {
> > -             ret =3D -ENOMEM;
> > -             goto out_put_node;
> > -     }
> > -     dev->test_mtd.offset =3D offset;
> > -#endif
> > -
> > -out_put_node:
> > -     of_node_put(np);
> > -     return ret;
> > -#else
> > -     return -ENOENT;
> > -#endif
> > -}
> > -EXPORT_SYMBOL_GPL(mt76_get_of_data_from_mtd);
> > -
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len)
> >  {
> > @@ -163,10 +80,6 @@ static int mt76_get_of_eeprom(struct mt76_dev *dev,=
 void *eep, int len)
> >       if (!ret)
> >               return 0;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(dev, eep, 0, len);
> > -     if (!ret)
> > -             return 0;
> > -
> >       return mt76_get_of_data_from_nvmem(dev, eep, "eeprom", len);
> >  }
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wi=
reless/mediatek/mt76/mt76.h
> > index 527bef97e122..f447ecac664d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > @@ -1339,7 +1339,6 @@ void mt76_seq_puts_array(struct seq_file *file, c=
onst char *str,
> >
> >  int mt76_eeprom_init(struct mt76_dev *dev, int len);
> >  int mt76_eeprom_override(struct mt76_phy *phy);
> > -int mt76_get_of_data_from_mtd(struct mt76_dev *dev, void *eep, int off=
set, int len);
> >  int mt76_get_of_data_from_nvmem(struct mt76_dev *dev, void *eep,
> >                               const char *cell_name, int len);
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drive=
rs/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > index eb92cbf1a284..c24e1276700b 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> > @@ -29,10 +29,6 @@ static int mt7915_eeprom_load_precal(struct mt7915_d=
ev *dev)
> >
> >       offs =3D is_mt7915(&dev->mt76) ? MT_EE_PRECAL : MT_EE_PRECAL_V2;
> >
> > -     ret =3D mt76_get_of_data_from_mtd(mdev, dev->cal, offs, size);
> > -     if (!ret)
> > -             return ret;
> > -
> >       ret =3D mt76_get_of_data_from_nvmem(mdev, dev->cal, "precal", siz=
e);
> >       if (!ret)
> >               return ret;
> > --
> > 2.54.0
> >

