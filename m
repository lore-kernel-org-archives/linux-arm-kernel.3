Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAECC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20Yjc/n2Ib6F5lS80pWb9OKE5xBeEql4XyvGsNk67XY=; b=kIWmw7Aae2qty8IBl3AVF7PBlw
	Ypd8TnJecvOnRAUSlRgzrMNINAMOgtiOXBKZv71VljHFhPkpAlmUBlYrleyFdcA5WuSpLbFseeFJy
	32UAuLlxCirviZH26PQD2UmNkojRS+ydRHHwkEPWyPNpJBzpdajw4QgITtA96eMPzRjfab8rE/A4U
	V7eiIzUKBa/8hzS8JCR1+6N7X4JoaZpJa9b4fmCXWWstgGl7CpxhDA1VFUmB4cocer8gcVkdwBquc
	+shG4LrFg46YNFt9Lk/7WnvVXbrTjILpdHu7CiydllcdnhMvsQjzdFUWnB+OfHnC4qTHImur7CRf/
	LP230PCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf8M-00000008G0L-2DyA;
	Tue, 14 Jan 2025 11:30:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXf74-00000008FfW-43zO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 11:29:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38be3bfb045so215341f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 03:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736854177; x=1737458977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20Yjc/n2Ib6F5lS80pWb9OKE5xBeEql4XyvGsNk67XY=;
        b=woZ5vT4Ej3Evio+hMmEVyuwrPIahMW+LToSNml/z8NsLuSwc1NY8rWXgAyN44psyco
         hv5adOSeZV04YJR7Q1eOnzMG6ToacScaxJPpHga8c0bbkDd6Y8XLT7q/luoXs8qpn+7F
         rt2+zW718aAzRoHzNcfQFakLPLftnmqZS/U77kijfUvKN8kA0EoPUbLwW/mW5X2Ki+yb
         SG4rPbvylvU59G9VQTMnMHrb15PsBz6FLqRX69lMEVeNnmjCuDQXozBXKnLV7VlXHhsN
         z9bzPjg02LJDeIDhFiZiv+4SchzGRtYfnRS5MjWZaZnCgPRC2mj26MAhJo+d/8iofQ9X
         lNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854177; x=1737458977;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=20Yjc/n2Ib6F5lS80pWb9OKE5xBeEql4XyvGsNk67XY=;
        b=iNpwwt5UWjv54kBlgboL7VYJufvWn8h3MpTw8oS4funvsC6PXd27XeTDytnxvbylbr
         /2V2OkrOxKh4rKozbBf1xE0nsCiMLzZ7uRSKBdSQ0jIplt+QNzLhlaCmr5bYEAewq8PT
         M5Vj5gxjqPuuBvdk/IppndWL81d86wFPASexdsMem+JgByc7OJ+VCDNPyBqETnSQbvr0
         8nK1hGaJ61EqJvr2jAplNZr9OVJ2uM9MhMaCuNJku2dyO0I4i5GZ3+25JEYKiCSCzTKd
         nqbajwkkfQeKwX2cYzgVmtFgRZkaUD4IVG5+QOajd3xU4rY18BWBbcqjlvOa+fIJkBNC
         V2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV1WC4nqUlAMV0xedjI174yiE8sgEGDhTpJyFORnZHXGd84VMkwbgwkRHGmUxnEsuv3L446xRRhv+fLJQb2/+d8@lists.infradead.org
X-Gm-Message-State: AOJu0YwT9lPAcmI6J1AyYnGbM8hGj1bDotOPeoZvCybGpo6EuKCyCYd0
	UuVEOwekyxd2GNS85uFR0yo3h7Z1jstDUBe2ewXERFzk12j/Pn+KgitpDANOt80=
X-Gm-Gg: ASbGnctTCyiqPj8hK0WpWrU3ELMAwRJB66CulfCNDSVDF4AMNl5wVJSjsG8UoD8ZYT8
	tZhg1PBa2OGwYhgiQ+LWEs/YLYqQnA+K677nZ0EunCcukrYjPHGDfdHKvxuVqEgeg7wZFHz6ydB
	vhxW8laaryX3CfCMkmLSs8wSdhZLYdVQ0N4DRWkSxLiv4dBb7ItcB9upfyEB2wygSu0Cz0GnUjY
	OL0QCRHrhiFnZmqw6yFXX0xb1d+k6SFQlnlgTngQDcGUshyMBscsHDg
X-Google-Smtp-Source: AGHT+IF7o6knngh+kGBhBymoYYO++0k0fEzVPFzyBMQqlFUvEiupbcgJ6G8Oi1ILWV70iXAFlgrJbg==
X-Received: by 2002:a05:6000:4011:b0:386:3d27:b4f0 with SMTP id ffacd0b85a97d-38a8b0d324bmr17534737f8f.14.1736854177449;
        Tue, 14 Jan 2025 03:29:37 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:317c:3d93:b7d4:96cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8116sm14469928f8f.79.2025.01.14.03.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:29:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
  Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] ASoC: meson: s4:support for the on-chip audio
In-Reply-To: <e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com> (Jiebing
	Chen's message of "Tue, 14 Jan 2025 16:16:39 +0800")
References: <20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com>
	<20250113-audio_drvier-v1-2-8c14770f38a0@amlogic.com>
	<1jwmey9451.fsf@starbuckisacylon.baylibre.com>
	<e2f26ca2-4c38-4b07-bf17-95544588a2f2@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 12:29:36 +0100
Message-ID: <1jh6617hwf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_032939_061745_878BBDC8 
X-CRM114-Status: GOOD (  33.95  )
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

On Tue 14 Jan 2025 at 16:16, Jiebing Chen <jiebing.chen@amlogic.com> wrote:

>>> +static const char * const s4_tdmout_sel_texts[] =3D {
>>> +     "TDM_D0", "TDM_D1", "TDM_D2", "TDM_D3", "TDM_D4", "TDM_D5", "TDM_=
D6", "TDM_D7",
>>> +     "TDM_D8", "TDM_D9", "TDM_D10", "TDM_D11", "TDM_D12", "TDM_D13", "=
TDM_D14", "TDM_D15",
>>> +     "TDM_D16", "TDM_D17", "TDM_D18", "TDM_D19", "TDM_D20", "TDM_D21",=
 "TDM_D22", "TDM_D23",
>>> +     "TDM_D24", "TDM_D25", "TDM_D26", "TDM_D27", "TDM_D28", "TDM_D29",=
 "TDM_D30", "TDM_D31"
>>> +};
>> This thing does not belong in ASoC. This is clearly yet another layer of
>> pinctrl. Please deal with it there.
>
> Thanks for your suggestion, add audio pinctrl driver to control the which=
 tdm_dx pin can map the which tdm lane_x
> for example
> 	tdm_d6_pin {
> 		mux {
> 			groups =3D "tdm_d6";
> 			function =3D "tdmoutb_lane0";
> 		};
> 	}
> tdm_d6 pin map the tdmoutb lane 0, right ?

possibly

>
>>> +
>>> +static const struct soc_enum tdmout_sel_enum =3D
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tdmout_sel_texts),
>>> +                     s4_tdmout_sel_texts);
>>> +

[...]

>>> diff --git a/sound/soc/meson/s4-tocodec-control.c b/sound/soc/meson/s4-=
tocodec-control.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..e5d824fae0eba545d38dc36=
e2566e7cee590e7f5
>>> --- /dev/null
>>> +++ b/sound/soc/meson/s4-tocodec-control.c
>> There is already a to-acodec driver a not reason has been provided as to=
 why a
>> completly new driver is required.
>>
>> Please have look at the existing driver and do try to use it.
>> If you need to do things so differently, clear justification are necessa=
ry.
>
> for g12a-toacodec.c, we find the tocodec clock source can't get the=C2=A0=
clock
> id from the tdm Be device,

This is clearly documented limitation of the current to-acodec driver:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sou=
nd/soc/meson/g12a-toacodec.c?h=3Dv6.13-rc7#n91

While it is a limitation, it is a manageable one considering the amount
of master clocks available and the fact the master should be manually
assinged to the output pad, which you did not do.

See the u200:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm64/boot/dts/amlogic/meson-g12a-u200.dts?h=3Dv6.13-rc7#n569

You are more than welcome to help fix this limitation in the current
driver but just adding a fork is not OK

I would suggest to start with what is currently available and move on to
fixing this as a 2nd step, if you want to.

>
> and set it by the kcontrol from user,=C2=A0 For different soc chips, The
> kcontrol value maybe different, The kcontrol configuration doesn't look
> very friendly for user
>
> so we use dapm route path to manage it,
> fe(fddr)->be(tdm)->(tocodec)->(codec),=C2=A0 and use the aux-devs to regi=
ster,=C2=A0
> and sound card only include the
>
> sound-dai =3D <&tdmif_a>
>
> codec-0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sound-dai =3D <&acodec>;
> =C2=A0};
>
> and not include
>
> codec-1 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 sound-dai =3D <&toacodec>;
> =C2=A0};
>
> when tdm work, only connect the tocodec path
>
> =C2=A0"TDM_A Playback" ->"TOACODEC TDMA"->"TOACODEC INPUT SRC"
>
> iterate it find the be device ,and get the struct axg_tdm_stream, so we c=
an
> get the tdm clock id
>
> Take into account behavioral differences, we add new tocodec driver
> for s4

Still not seeing sufficient reason to make another driver.

>
>>> @@ -0,0 +1,376 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2023 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/regmap.h>
>>> +#include <sound/soc.h>
>>> +#include <sound/soc-dai.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include<linux/kstrtox.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/reset.h>
>>> +#include "axg-tdm.h"
>>> +
>>> +#define TOACODEC_CTRL0                       0x0
>>> +
>>> +#define CTRL0_ENABLE_SHIFT           31
>>> +#define CTRL0_BCLK_ENABLE_SHIFT              30
>>> +#define CTRL0_MCLK_ENABLE_SHIFT              29
>>> +#define CTRL0_BLK_CAP_INV_SHIFT              9
>>> +
>>> +#define TDM_IFACE 0
>>> +#define TDM_A_PAD 0
>>> +#define TDM_B_PAD 1
>>> +#define TDM_C_PAD 2
>>> +
>>> +struct toacodec {
>>> +     struct regmap_field *field_dat_sel;
>>> +     struct regmap_field *field_lrclk_sel;
>>> +     struct regmap_field *field_bclk_sel;
>>> +     struct regmap_field *field_mclk_sel;
>>> +};
>>> +
>>> +struct toacodec_match_data {
>>> +     const struct snd_soc_component_driver *component_drv;
>>> +     const struct reg_field field_dat_sel;
>>> +     const struct reg_field field_lrclk_sel;
>>> +     const struct reg_field field_bclk_sel;
>>> +     const struct reg_field field_mclk_sel;
>>> +};
>>> +
>>> +static const struct regmap_config tocodec_regmap_cfg =3D {
>>> +     .reg_bits       =3D 32,
>>> +     .val_bits       =3D 32,
>>> +     .reg_stride     =3D 4,
>>> +     .max_register   =3D 0x1,
>>> +};
>>> +
>>> +#define S4_LANE_OFFSET 8
>>> +
>>> +static const char * const s4_tocodec_lane_sel_texts[] =3D {
>>> +     "Lane0", "Lane1", "Lane2", "Lane3", "Lane4", "Lane5", "Lane6", "L=
ane7"
>>> +};
>>> +
>>> +static const struct soc_enum s4_tocodec_lane_sel_enum =3D
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_lane_sel_t=
exts),
>>> +                     s4_tocodec_lane_sel_texts);
>>> +
>>> +static const struct snd_kcontrol_new s4_tocodec_lane_sel =3D
>>> +     SOC_DAPM_ENUM("TOCODEC LANE SEL", s4_tocodec_lane_sel_enum);
>>> +
>>> +static const char * const s4_tocodec_src_sel_texts[] =3D {
>>> +     "TDMA", "TDMB", "TDMC"
>>> +};
>>> +
>>> +static const struct soc_enum s4_tocodec_src_sel_enum =3D
>>> +     SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(s4_tocodec_src_sel_te=
xts),
>>> +                     s4_tocodec_src_sel_texts);
>>> +
>>> +static const struct snd_kcontrol_new s4_tocodec_src_sel =3D
>>> +     SOC_DAPM_ENUM("TOCODEC SEL", s4_tocodec_src_sel_enum);
>>> +
>>> +static const struct snd_kcontrol_new s4_toacodec_out_enable =3D
>>> +     SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>>> +                                 CTRL0_ENABLE_SHIFT, 1, 0);
>>> +
>>> +static struct snd_soc_dai *tocodec_tdm_get_ahead_be(struct snd_soc_dap=
m_widget *w)
>>> +{
>>> +     struct snd_soc_dapm_path *p;
>>> +     struct snd_soc_dai *be;
>>> +
>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>> +             if (!p->connect)
>>> +                     continue;
>>> +             if (p->source->id =3D=3D snd_soc_dapm_dai_in)
>>> +                     return (struct snd_soc_dai *)p->source->priv;
>>> +             be =3D tocodec_tdm_get_ahead_be(p->source);
>>> +             if (be && be->id =3D=3D TDM_IFACE)
>>> +                     return be;
>>> +     }
>>> +     return NULL;
>>> +}
>>> +
>>> +static unsigned int aml_simple_strtoull(const char *cp)
>>> +{
>>> +     unsigned int result =3D 0;
>>> +     unsigned int value =3D 0;
>>> +     unsigned int len =3D strlen(cp);
>>> +
>>> +     while (len !=3D 0) {
>>> +             len--;
>>> +             value =3D isdigit(*cp);
>>> +             if (value) {
>>> +                     value =3D *cp - '0';
>>> +             } else {
>>> +                     cp++;
>>> +                     continue;
>>> +             }
>>> +             cp++;
>>> +             result =3D result * 10 + value;
>>> +     }
>>> +     return result;
>>> +}
>>> +
>>> +static int aml_get_clk_id(const char *name)
>>> +{
>>> +     int clk_id =3D 0;
>>> +
>>> +     if (strstr(name, "mst_a"))
>>> +             clk_id =3D 0;
>>> +     else if (strstr(name, "mst_b"))
>>> +             clk_id =3D 1;
>>> +     else if (strstr(name, "mst_c"))
>>> +             clk_id =3D 2;
>>> +     else if (strstr(name, "mst_d"))
>>> +             clk_id =3D 3;
>>> +     else if (strstr(name, "mst_e"))
>>> +             clk_id =3D 4;
>>> +     else if (strstr(name, "mst_f"))
>>> +             clk_id =3D 5;
>>> +
>>> +     return clk_id;
>>> +}
>>> +
>>> +static int aml_tocodec_sel_set(struct snd_soc_dapm_widget *w)
>>> +{
>>> +     struct snd_soc_dai *be;
>>> +     struct axg_tdm_stream *stream;
>>> +     struct axg_tdm_iface *iface;
>>> +     struct snd_soc_component *component =3D snd_soc_dapm_to_component=
(w->dapm);
>>> +     struct toacodec *priv =3D snd_soc_component_get_drvdata(component=
);
>>> +     unsigned int tdm_id =3D TDM_A_PAD;
>>> +     const char *dai_widget_name;
>>> +     struct snd_soc_dapm_path *p;
>>> +     unsigned int lane =3D 0;
>>> +     unsigned int val =3D 0;
>>> +     struct clk *sclk, *mclk;
>>> +     char *clk_name;
>>> +     int mclk_id, sclk_id;
>>> +
>>> +     be =3D tocodec_tdm_get_ahead_be(w);
>>> +     if (!be) {
>>> +             dev_err(component->dev, "%s not find the be\n", __func__);
>>> +             return -EINVAL;
>>> +     }
>>> +     stream =3D snd_soc_dai_dma_data_get_playback(be);
>>> +     if (!stream) {
>>> +             dev_err(component->dev, "%s not find the stream\n", __fun=
c__);
>>> +             return -EINVAL;
>>> +     }
>>> +     /*we like to use dai id, but it is fixed val*/
>>> +     dai_widget_name =3D be->stream[SNDRV_PCM_STREAM_PLAYBACK].widget-=
>name;
>>> +     if (strstr(dai_widget_name, "TDM_A"))
>>> +             tdm_id =3D TDM_A_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_B"))
>>> +             tdm_id =3D TDM_B_PAD;
>>> +     else if (strstr(dai_widget_name, "TDM_C"))
>>> +             tdm_id =3D TDM_C_PAD;
>>> +     snd_soc_dapm_widget_for_each_source_path(w, p) {
>>> +             if (p->connect && p->name) {
>>> +                     lane =3D aml_simple_strtoull(p->name);
>>> +                     val =3D lane + tdm_id * S4_LANE_OFFSET;
>>> +                     regmap_field_write(priv->field_dat_sel, val);
>>> +             }
>>> +     }
>>> +     iface =3D stream->iface;
>>> +     mclk =3D iface->mclk;
>>> +     sclk =3D iface->sclk;
>>> +     mclk_id =3D aml_get_clk_id(__clk_get_name(mclk));
>>> +     sclk_id =3D aml_get_clk_id(__clk_get_name(sclk));
>>> +     regmap_field_write(priv->field_mclk_sel, mclk_id);
>>> +     regmap_field_write(priv->field_bclk_sel, sclk_id);
>>> +     regmap_field_write(priv->field_lrclk_sel, sclk_id);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int tocodec_sel_event(struct snd_soc_dapm_widget *w,
>>> +                          struct snd_kcontrol *control,
>>> +                          int event)
>>> +{
>>> +     struct snd_soc_component *component =3D snd_soc_dapm_to_component=
(w->dapm);
>>> +     int ret =3D 0;
>>> +
>>> +     switch (event) {
>>> +     case SND_SOC_DAPM_PRE_PMU:
>>> +             ret =3D aml_tocodec_sel_set(w);
>>> +             break;
>>> +
>>> +     case SND_SOC_DAPM_PRE_PMD:
>>> +             break;
>>> +
>>> +     default:
>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int tocodec_clk_enable(struct snd_soc_dapm_widget *w,
>>> +                           struct snd_kcontrol *control,
>>> +                           int event)
>>> +{
>>> +     int ret =3D 0;
>>> +     unsigned int mask =3D 0, val =3D 0;
>>> +     struct snd_soc_component *component =3D snd_soc_dapm_to_component=
(w->dapm);
>>> +
>>> +     snd_soc_component_update_bits(component, TOACODEC_CTRL0,
>>> +                                   1 << CTRL0_BLK_CAP_INV_SHIFT, 1 << =
CTRL0_BLK_CAP_INV_SHIFT);
>>> +     switch (event) {
>>> +     case SND_SOC_DAPM_PRE_PMU:
>>> +             mask =3D 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_E=
NABLE_SHIFT;
>>> +             val =3D 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_EN=
ABLE_SHIFT;
>>> +             snd_soc_component_update_bits(component, TOACODEC_CTRL0, =
mask, val);
>>> +             break;
>>> +     case SND_SOC_DAPM_PRE_PMD:
>>> +             mask =3D 1 << CTRL0_MCLK_ENABLE_SHIFT | 1 << CTRL0_BCLK_E=
NABLE_SHIFT;
>>> +             val =3D 0 << CTRL0_MCLK_ENABLE_SHIFT | 0 << CTRL0_BCLK_EN=
ABLE_SHIFT;
>>> +             snd_soc_component_update_bits(component, TOACODEC_CTRL0, =
mask, val);
>>> +             break;
>>> +     default:
>>> +             dev_err(component->dev, "Unexpected event %d\n", event);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] =3D {
>>> +     SND_SOC_DAPM_MUX_E("Lane SRC", SND_SOC_NOPM, 0, 0,
>>> +                        &s4_tocodec_lane_sel, tocodec_sel_event,
>>> +                        (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
>>> +     SND_SOC_DAPM_MUX("INPUT SRC", SND_SOC_NOPM, 0, 0, &s4_tocodec_src=
_sel),
>>> +     SND_SOC_DAPM_SWITCH_E("OUT EN", SND_SOC_NOPM, 0, 0,
>>> +                           &s4_toacodec_out_enable, tocodec_clk_enable,
>>> +                             (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_=
PMD)),
>>> +     SND_SOC_DAPM_AIF_IN("TDMA", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_AIF_IN("TDMB", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_AIF_IN("TDMC", NULL, 0, SND_SOC_NOPM, 0, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane0", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane1", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane2", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane3", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane4", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane5", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane6", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUT_DRV("Lane7", SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +     SND_SOC_DAPM_OUTPUT("TDM_TO_ACODEC"),
>>> +};
>>> +
>>> +static const struct snd_soc_dapm_route s4_tocodec_dapm_routes[] =3D {
>>> +     { "INPUT SRC", "TDMA", "TDMA"},
>>> +     { "INPUT SRC", "TDMB", "TDMB"},
>>> +     { "INPUT SRC", "TDMC", "TDMC"},
>>> +     { "Lane0", NULL, "INPUT SRC" },
>>> +     { "Lane1", NULL, "INPUT SRC"},
>>> +     { "Lane2", NULL, "INPUT SRC"},
>>> +     { "Lane3", NULL, "INPUT SRC"},
>>> +     { "Lane4", NULL, "INPUT SRC"},
>>> +     { "Lane5", NULL, "INPUT SRC"},
>>> +     { "Lane6", NULL, "INPUT SRC"},
>>> +     { "Lane7", NULL, "INPUT SRC"},
>>> +     { "Lane SRC", "Lane0", "Lane0"},
>>> +     { "Lane SRC", "Lane1", "Lane1"},
>>> +     { "Lane SRC", "Lane2", "Lane2"},
>>> +     { "Lane SRC", "Lane3", "Lane3"},
>>> +     { "Lane SRC", "Lane4", "Lane4"},
>>> +     { "Lane SRC", "Lane5", "Lane5"},
>>> +     { "Lane SRC", "Lane6", "Lane6"},
>>> +     { "Lane SRC", "Lane7", "Lane7"},
>>> +     { "OUT EN", "Switch", "Lane SRC"},
>>> +     { "TDM_TO_ACODEC", NULL, "OUT EN"},
>>> +
>>> +};
>>> +
>>> +static const struct snd_soc_component_driver s4_tocodec_component_drv =
=3D {
>>> +     .dapm_widgets           =3D s4_toacodec_widgets,
>>> +     .num_dapm_widgets       =3D ARRAY_SIZE(s4_toacodec_widgets),
>>> +     .dapm_routes            =3D s4_tocodec_dapm_routes,
>>> +     .num_dapm_routes        =3D ARRAY_SIZE(s4_tocodec_dapm_routes),
>>> +};
>>> +
>>> +static const struct toacodec_match_data s4_toacodec_match_data =3D {
>>> +     .component_drv  =3D &s4_tocodec_component_drv,
>>> +     .field_dat_sel  =3D REG_FIELD(TOACODEC_CTRL0, 16, 20),
>>> +     .field_lrclk_sel =3D REG_FIELD(TOACODEC_CTRL0, 12, 14),
>>> +     .field_bclk_sel =3D REG_FIELD(TOACODEC_CTRL0, 4, 6),
>>> +     .field_mclk_sel =3D REG_FIELD(TOACODEC_CTRL0, 0, 2),
>>> +};
>>> +
>>> +static const struct of_device_id s4_tocodec_of_match[] =3D {
>>> +     {
>>> +             .compatible =3D "amlogic,s4-tocodec",
>>> +             .data =3D &s4_toacodec_match_data,
>>> +     }, {}
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, s4_tocodec_of_match);
>>> +
>>> +static int tocodec_probe(struct platform_device *pdev)
>>> +{
>>> +     const struct toacodec_match_data *data;
>>> +     struct device *dev =3D &pdev->dev;
>>> +     struct toacodec *priv;
>>> +     void __iomem *regs;
>>> +     struct regmap *map;
>>> +     int ret;
>>> +
>>> +     data =3D device_get_match_data(dev);
>>> +     if (!data)
>>> +             return dev_err_probe(dev, -ENODEV, "failed to match devic=
e\n");
>>> +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     platform_set_drvdata(pdev, priv);
>>> +
>>> +     ret =3D device_reset(dev);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     regs =3D devm_platform_ioremap_resource(pdev, 0);
>>> +     if (IS_ERR(regs))
>>> +             return PTR_ERR(regs);
>>> +
>>> +     map =3D devm_regmap_init_mmio(dev, regs, &tocodec_regmap_cfg);
>>> +     if (IS_ERR(map))
>>> +             return dev_err_probe(dev, PTR_ERR(map), "failed to init r=
egmap\n");
>>> +
>>> +     priv->field_dat_sel =3D devm_regmap_field_alloc(dev, map, data->f=
ield_dat_sel);
>>> +     if (IS_ERR(priv->field_dat_sel))
>>> +             return PTR_ERR(priv->field_dat_sel);
>>> +
>>> +     priv->field_lrclk_sel =3D devm_regmap_field_alloc(dev, map, data-=
>field_lrclk_sel);
>>> +     if (IS_ERR(priv->field_lrclk_sel))
>>> +             return PTR_ERR(priv->field_lrclk_sel);
>>> +
>>> +     priv->field_bclk_sel =3D devm_regmap_field_alloc(dev, map, data->=
field_bclk_sel);
>>> +     if (IS_ERR(priv->field_bclk_sel))
>>> +             return PTR_ERR(priv->field_bclk_sel);
>>> +
>>> +     priv->field_mclk_sel =3D devm_regmap_field_alloc(dev, map, data->=
field_mclk_sel);
>>> +     if (IS_ERR(priv->field_mclk_sel))
>>> +             return PTR_ERR(priv->field_mclk_sel);
>>> +
>>> +     return devm_snd_soc_register_component(dev,
>>> +                     data->component_drv, NULL, 0);
>>> +}
>>> +
>>> +static struct platform_driver tocodec_pdrv =3D {
>>> +     .probe =3D tocodec_probe,
>>> +     .driver =3D {
>>> +             .name =3D "s4-tocodec",
>>> +             .of_match_table =3D s4_tocodec_of_match,
>>> +     },
>>> +};
>>> +
>>> +module_platform_driver(tocodec_pdrv);
>>> +
>>> +MODULE_DESCRIPTION("Amlogic to codec driver");
>>> +MODULE_AUTHOR("jiebing.chen@amlogic.com");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
>>> index 571f65788c592050abdca264f5656d4d1a9d99f6..2db1cd18cf2cea507f3d728=
2054e03d953586648 100644
>>> --- a/sound/soc/meson/t9015.c
>>> +++ b/sound/soc/meson/t9015.c
>>> @@ -89,10 +89,7 @@ static struct snd_soc_dai_driver t9015_dai =3D {
>>>                .channels_min =3D 1,
>>>                .channels_max =3D 2,
>>>                .rates =3D SNDRV_PCM_RATE_8000_96000,
>>> -             .formats =3D (SNDRV_PCM_FMTBIT_S8 |
>>> -                         SNDRV_PCM_FMTBIT_S16_LE |
>>> -                         SNDRV_PCM_FMTBIT_S20_LE |
>>> -                         SNDRV_PCM_FMTBIT_S24_LE),
>>> +             .formats =3D (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_=
S32_LE),
>> Again, mixed up changes with zero justification.
>>
>> This drops S8 and S16 format support for the existing SoCs (such as GXL)
>> which is known to work and add S32 support on an HW documented as 24bits
>> only. Can you explain ?
>>
>>>        },
>>>        .ops =3D &t9015_dai_ops,
>>>   };
>> --
>> Jerome

--=20
Jerome

