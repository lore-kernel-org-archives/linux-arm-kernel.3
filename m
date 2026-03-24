Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75702FEC0F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR7C82ByRHf9xHFB+hAjpexhUSxycw9732oruAip0zw=; b=DefPT8evDMVsUz/ytqU+1lXv0Y
	OTS5yoela/PrsYXrnVKRZ162gpo1wKswSlUHqVAFdBTwxMv1hf2zVnFgf4KQI5egy7KW+gHPIPG5e
	4EkAIZsE8LzH8Tif34GaWeryTKc5DA4HtYwk2txA3RxW8fmK2V4LcEc4GunTTBYPP9zje3bXlKDjq
	TUtoyqCt7zxV6N6xx4ZY80hCbnOVG+xHbyvNWA8QwVeU1V5+SwzxZIwo5deDHlbztpUNmuTkk6uvJ
	vFVqee0CryYrMlv552D5/cE6UkZ9BsVa3vOcIafo06CUo6PfoUB8TDBjiu4dDw51J3SGJ9i0A2rNs
	KOOnAzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57NU-000000029Av-19Q6;
	Tue, 24 Mar 2026 19:25:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57NJ-0000000295z-1ImB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 697406012B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 19:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC97C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 19:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774380312;
	bh=W2kqahuI0dRdiWt2FzF8BjyOm6F3ukwameRH6zo7Z/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qbt34olnDFwCcy5hk+3XgKWFFeSX0TNCbAbGaxa8/DeokeewSyrbd5SlqmCnK51JN
	 1y44QvmjzYrvCZ7OM0E6pb2z9cn34rXbMpmNvVtTW5Dj/aUYxCfAp5riiPXuhK/MuX
	 8NBbyJs91vbERo82VwpTnh+VOE1bc7jkAEguAnkQ37g/ylAQVPfju0IzOIHPJHmvUQ
	 ddf0rt/vPg3rPDPQJIg6wE8P29m+8TsqygjOQMq2nvoFSPdB7R4YhqdZEhW/X3f8zJ
	 +BaKJnixBCnf3etiKvrJZjLbOVfQknJ+hp3/SOM56DzlpceXvAeBzu6FJMUTDTIF9t
	 5VhG6GE5FAOyg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a42a0d7f7so1499201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 12:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJ3XiPs6IJ/9BZpR9HNC7VRUiK0Go8895Q10p/pSwerDpiBiAZ1qKxvHsyLvI+ntGC0Uf9dUL0zTO48aQd19F6@lists.infradead.org
X-Gm-Message-State: AOJu0YxmOE7LJmcJsW2NS+v95r3JBZLorfwplobfbej+Cs3N3IwmTcOY
	rxqIlqdEUPNG9Nf8KWBk/S3MYN+mln3Bz5avs8Prs4EDXakB5QIWPXPDbWPqCnGhKnlrUVISeH5
	KoIdZrEXttx3rC7IAACXWUNCIQTBprpM=
X-Received: by 2002:a05:651c:310:b0:387:a16:ee83 with SMTP id
 38308e7fff4ca-38c32931d14mr11373651fa.11.1774380310067; Tue, 24 Mar 2026
 12:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-mt7927-wifi-support-v2-v2-0-d627a7fad70d@jetm.me> <20260319-mt7927-wifi-support-v2-v2-5-d627a7fad70d@jetm.me>
In-Reply-To: <20260319-mt7927-wifi-support-v2-v2-5-d627a7fad70d@jetm.me>
From: Sean Wang <sean.wang@kernel.org>
Date: Tue, 24 Mar 2026 14:24:58 -0500
X-Gmail-Original-Message-ID: <CAGp9LzoYcJEmFKTKGsF3WchxLedyo7HvGCn8Vi=WaEXS1N-VTg@mail.gmail.com>
X-Gm-Features: AQROBzCJFXGOj3qOH6JxvcssVN9WorUl4nD9nSO254z7rVrluItXC4oVHqFFQWg
Message-ID: <CAGp9LzoYcJEmFKTKGsF3WchxLedyo7HvGCn8Vi=WaEXS1N-VTg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] wifi: mt76: mt7925: advertise EHT 320MHz
 capabilities for 6GHz band
To: Javier Tia <floss@jetm.me>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Deren Wu <deren.wu@mediatek.com>, 
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Marcin FM <marcin@lgic.pl>, 
	Cristian-Florin Radoi <radoi.chris@gmail.com>, George Salukvadze <giosal90@gmail.com>, 
	Evgeny Kapusta <3193631@gmail.com>, Samu Toljamo <samu.toljamo@gmail.com>, 
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>, Chapuis Dario <chapuisdario4@gmail.com>, 
	=?UTF-8?Q?Thibaut_Fran=C3=A7ois?= <tibo@humeurlibre.fr>, 
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

Hi,

On Thu, Mar 19, 2026 at 5:26=E2=80=AFPM Javier Tia <floss@jetm.me> wrote:
>
> mt7925_init_eht_caps() only populates EHT MCS/NSS maps for BW <=3D 80
> and BW =3D 160, but never sets BW =3D 320. This means iw phy shows no
> 320MHz MCS map entries even though the hardware supports 320MHz
> operation in the 6GHz band.
>
> Add the missing 320MHz capability bits for 6GHz, following the same
> pattern as mt7996:
>   - PHY_CAP0: IEEE80211_EHT_PHY_CAP0_320MHZ_IN_6GHZ
>   - PHY_CAP1: beamformee SS for 320MHz
>   - PHY_CAP2: sounding dimensions for 320MHz
>   - PHY_CAP6: MCS15 support for 320MHz width
>   - PHY_CAP7: non-OFDMA UL MU-MIMO and MU beamformer for 320MHz
>   - MCS/NSS: populate bw._320 maps for 6GHz band
>
> Introduce is_320mhz_supported() as a generic capability check using the
> mt7925 family ID. This avoids chip-specific references in common code,
> and automatically extends to new chips once they join the
> is_mt7925() family via chip ID helpers.
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
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 28 ++++++++++++++++++=
+++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/n=
et/wireless/mediatek/mt76/mt76_connac.h
> index 813d61bffc2c..554716e01ee6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
> @@ -177,6 +177,11 @@ static inline bool is_mt7925(struct mt76_dev *dev)
>         return mt76_chip(dev) =3D=3D 0x7925;
>  }
>
> +static inline bool is_320mhz_supported(struct mt76_dev *dev)
> +{
> +       return is_mt7925(dev);

I don't think this is correct for mt7925, and it will cause a
regression there. Was this tested on actual mt7925 hardware?

> +}
> +
>  static inline bool is_mt7920(struct mt76_dev *dev)
>  {
>         return mt76_chip(dev) =3D=3D 0x7920;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index f128a198f81d..cd043ac266fb 100644
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
> @@ -230,6 +245,11 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl=
80211_band band,
>                 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
>                 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ;
>
> +       if (band =3D=3D NL80211_BAND_6GHZ && is_320mhz_supported(&phy->de=
v->mt76))
> +               eht_cap_elem->phy_cap_info[7] |=3D
> +                       IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MH=
Z |
> +                       IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ;
> +

I don't think this should be copied from mt7996 as-is for mt7927. I'd
suggest dropping the eht_cap_elem->phy_cap_info[7] change and keeping
it conservative for now.

>         val =3D u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_RX) |
>               u8_encode_bits(nss, IEEE80211_EHT_MCS_NSS_TX);
>
> @@ -239,6 +259,12 @@ mt7925_init_eht_caps(struct mt792x_phy *phy, enum nl=
80211_band band,
>         eht_nss->bw._160.rx_tx_mcs9_max_nss =3D val;
>         eht_nss->bw._160.rx_tx_mcs11_max_nss =3D val;
>         eht_nss->bw._160.rx_tx_mcs13_max_nss =3D val;
> +
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

