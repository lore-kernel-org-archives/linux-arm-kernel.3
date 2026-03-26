Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A12109E54B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYh4N0xMpo1/r7tfakgcVhpozqGy7LPF8N3wXacvOlw=; b=VvbSEaO/+/63/JDz+UZCSQNImo
	SchJ9AwwmMxzwTd22ly2QPZFsqZgAi6Mhkkck5w5CeE7hMn/RisJy+7Cr2Ofy9Vy8gx5VP6BCoQdu
	i0fztJgFXLOLJB/iL3YCMi6kLpZqAnQeLx1too7sGlPxdynoYJc7+dh0JWSuEZJI49DUyUV1Dzqxg
	29DYmXpfqWBCD8ImDJ9+mVgaPhOUx4ry8zxYanHBcilOSwJ2GfG/0qjVASErd/guvf5+ibRjZ1XlE
	+flX7oRBc+nX15a7ATt1b2X2sS3B0G67Vh0cqbTQLvpW4kMyZ6QjXqBKojHmXvzFEu6LvueSbv1p+
	Ynuztwow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5du2-00000004mMf-1luZ;
	Thu, 26 Mar 2026 06:09:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5du1-00000004mMA-0Fan
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:09:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 027206012A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE4BC2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774505347;
	bh=YYJzzBUZ5xCz3VewPGgIe4VjqU3krL4cpevmT2J0q6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VW7PLw9U98ap5cmm0HGJgn8kBNyx9LWjDm5ZwUMF6xoHYiwy7jysd+EM7DB6/+rFy
	 Wmg9Y8V+VjjBW9gfO4eXuoP703pzTrNFwpa/Ukb+BoVKxodZrGDW7mx/er4SoM0KTy
	 SijiYEUN/tvU26aKd8QOaAwnovAHIfG9JiNFiFC0JKNBclaB96suWXPmgfLA5BlRw/
	 CwKG0e1Ucdq8SdHypvZy0wXYdqjMrhNup1Z74iF2uiGLAiTsyFiN7GyvJAgxyrVqmI
	 ImYtVQLGAvuwEMY7kDE0qNjfGLl24U7danZ1ze6cC00PpIf8aMimiboCkeMxEQdHyP
	 hjlwjPPFtqlbA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38ad26e3992so4438081fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 23:09:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgICKC3CArASwfGaJFRkRazzAIVPJkF9RKY8CfhZ3cq+O8Q6qXte6bGj2HsOj1cN8fYHlfOk7udwUTMEqkbDzE@lists.infradead.org
X-Gm-Message-State: AOJu0YxOONXcdHbUjyfOW73kX1rfdeoAbCG+TU9IKNn0JqQP7L4EnmU/
	MySn+jdvytXhPPK3QFYLvPLuMwMBFzX53JHLp/QW/qOsmVrv0cgJPgYlGs5oJqtUkJimNfiqVPf
	3jMpBjICoq8PMNTv1vP3LJlpEapoHuwA=
X-Received: by 2002:a05:651c:1469:b0:38c:6b7:ad47 with SMTP id
 38308e7fff4ca-38c43072d48mr24340281fa.7.1774505345770; Wed, 25 Mar 2026
 23:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260325-mt7927-wifi-support-v2-v3-0-5ca66c97a755@jetm.me> <20260325-mt7927-wifi-support-v2-v3-5-5ca66c97a755@jetm.me>
In-Reply-To: <20260325-mt7927-wifi-support-v2-v3-5-5ca66c97a755@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 26 Mar 2026 01:08:56 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzr1Fgj5Gk2cAUFWq6sfKZZR2Cd6ymrzP7wKQh-7P9eo1A@mail.gmail.com>
X-Gm-Features: AQROBzAUYeAj2eTTTOIP2gLEFHOEoyZYt5R3yZNXfXyqfKxhXOUP9a1iwLeqE3c
Message-ID: <CAGp9Lzr1Fgj5Gk2cAUFWq6sfKZZR2Cd6ymrzP7wKQh-7P9eo1A@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] wifi: mt76: mt7925: advertise EHT 320MHz
 capabilities for 6GHz band
To: Javier Tia <floss@jetm.me>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Deren Wu <deren.wu@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Marcin FM <marcin@lgic.pl>, Cristian-Florin Radoi <radoi.chris@gmail.com>, 
	George Salukvadze <giosal90@gmail.com>, Evgeny Kapusta <3193631@gmail.com>, 
	Samu Toljamo <samu.toljamo@gmail.com>, Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, 
	Chapuis Dario <chapuisdario4@gmail.com>, =?UTF-8?Q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, 
	=?UTF-8?B?5byg5pet5ra1?= <Loong.0x00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Javier

On Wed, Mar 25, 2026 at 5:14=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> mt7925_init_eht_caps() only populates EHT MCS/NSS maps for BW <=3D 80
> and BW =3D 160, but never sets BW =3D 320. This means iw phy shows no
> 320MHz MCS map entries even though the hardware supports 320MHz
> operation in the 6GHz band.
>
> Add the missing 320MHz capability bits for 6GHz:
>   - PHY_CAP0: IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ
>   - PHY_CAP1: beamformee SS for 320MHz
>   - PHY_CAP2: sounding dimensions for 320MHz
>   - PHY_CAP6: MCS15 support for 320MHz width
>   - MCS/NSS: populate bw._320 maps for 6GHz band
>
> Introduce is_320mhz_supported() to gate 320MHz on MT7927 only, since
> MT7925 does not support 320MHz operation.
>
> Tested-by: Marcin FM <marcin@lgic.pl>
> Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
> Tested-by: George Salukvadze <giosal90@gmail.com>
> Tested-by: Evgeny Kapusta <3193631@gmail.com>
> Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
> Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
> Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
> Tested-by: Thibaut Fran=C3=A7ois <tibo@humeurlibre.fr>
> Tested-by: =E5=BC=A0=E6=97=AD=E6=B6=B5 <Loong.0x00@gmail.com>
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac.h |  5 +++++
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 22 ++++++++++++++++++=
+++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index 813d61bffc2c..3785fbf5ac99 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -177,6 +177,11 @@ static inline bool is_mt7925(struct mt76_dev *dev)
>         return mt76_chip(dev) =3D=3D 0x7925;
>  }
>
> +static inline bool is_320mhz_supported(struct mt76_dev *dev)
> +{
> +       return is_mt7927(dev);

This looks like it would cause a build error since is_mt7927() is not
introduced until patch 6.

> +}
> +
>  static inline bool is_mt7920(struct mt76_dev *dev)
>  {
>         return mt76_chip(dev) =3D=3D 0x7920;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index f128a198f81d..cfce851a94e2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -183,6 +183,10 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl=
80211_band band,
>                 IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMER |
>                 IEEE80211_EHT_PHY_CAP0_SU_BEAMFORMEE;
>
> +       if (band =3D=3D NL80211_BAND_6GHZ && is_320mhz_supported(&phy->de=
v->mt76))
> +               eht_cap_elem->phy_cap_info[0] |=3D
> +                       IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ;
> +
>         eht_cap_elem->phy_cap_info[0] |=3D
>                 u8_encode_bits(u8_get_bits(sts - 1, BIT(0)),
>                                IEEE80211_EHT_PHY_CAP0_BEAMFORMEE_SS_80MHZ=
_MASK);
> @@ -193,10 +197,20 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum n=
l80211_band band,
>                 u8_encode_bits(sts - 1,
>                                IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_SS_160MH=
Z_MASK);
>
> +       if (band =3D=3D NL80211_BAND_6GHZ && is_320mhz_supported(&phy->de=
v->mt76))
> +               eht_cap_elem->phy_cap_info[1] |=3D
> +                       u8_encode_bits(sts - 1,
> +                                      IEEE80211_EHT_PHY_CAP1_BEAMFORMEE_=
SS_320MHZ_MASK);
> +
>         eht_cap_elem->phy_cap_info[2] =3D
>                 u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_D=
IM_80MHZ_MASK) |
>                 u8_encode_bits(sts - 1, IEEE80211_EHT_PHY_CAP2_SOUNDING_D=
IM_160MHZ_MASK);
>
> +       if (band =3D=3D NL80211_BAND_6GHZ && is_320mhz_supported(&phy->de=
v->mt76))
> +               eht_cap_elem->phy_cap_info[2] |=3D
> +                       u8_encode_bits(sts - 1,
> +                                      IEEE80211_EHT_PHY_CAP2_SOUNDING_DI=
M_320MHZ_MASK);
> +
>         eht_cap_elem->phy_cap_info[3] =3D
>                 IEEE80211_EHT_PHY_CAP3_NG_16_SU_FEEDBACK |
>                 IEEE80211_EHT_PHY_CAP3_NG_16_MU_FEEDBACK |
> @@ -217,7 +231,8 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl8=
0211_band band,
>                 u8_encode_bits(u8_get_bits(0x11, GENMASK(1, 0)),
>                                IEEE80211_EHT_PHY_CAP5_MAX_NUM_SUPP_EHT_LT=
F_MASK);
>
> -       val =3D width =3D=3D NL80211_CHAN_WIDTH_160 ? 0x7 :
> +       val =3D width =3D=3D NL80211_CHAN_WIDTH_320 ? 0xf :
> +             width =3D=3D NL80211_CHAN_WIDTH_160 ? 0x7 :
>               width =3D=3D NL80211_CHAN_WIDTH_80 ? 0x3 : 0x1;
>         eht_cap_elem->phy_cap_info[6] =3D
>                 u8_encode_bits(u8_get_bits(0x11, GENMASK(4, 2)),
> @@ -239,6 +254,11 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl=
80211_band band,
>         eht_nss->bw._160.rx_tx_mcs9_max_nss =3D val;
>         eht_nss->bw._160.rx_tx_mcs11_max_nss =3D val;
>         eht_nss->bw._160.rx_tx_mcs13_max_nss =3D val;
> +       if (band =3D=3D NL80211_BAND_6GHZ && is_320mhz_supported(&phy->de=
v->mt76)) {
> +               eht_nss->bw._320.rx_tx_mcs9_max_nss =3D val;
> +               eht_nss->bw._320.rx_tx_mcs11_max_nss =3D val;
> +               eht_nss->bw._320.rx_tx_mcs13_max_nss =3D val;
> +       }
>  }
>
>  int mt7925_init_mlo_caps(struct mt792x_phy *phy)
>
> --
> 2.53.0
>
>

