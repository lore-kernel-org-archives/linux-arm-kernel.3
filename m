Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2CEC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5GmgDRwLzjGy8dLnCeLiuAfeTbFgGKNWM+nzJ45dpA=; b=kNrUR8DMerEosS99y3KSw3jP1v
	pFO5MYDRJfdvUrNvgZ05ATdWiawH5fyuBq2A3B53pQrcLP1+Hn6YS1p8nm1gCUtEXblgfXiSrXnYQ
	65jV6zk5RoaExLi8ID56ytkcc9Dsa7wGcng9dUqiNCBm+QZRgKsVYPF78fEmWeIP5DNQ7aRc4ygIc
	NK9ziB9EVoktLAF8X/Ss+6VwOFGCoTCJ3EU9VfPDjO5kv9GHIO6cUD0Yw1loQoySwffJSpjvidol5
	d6cYzOLQJkxXy5iD21uWGT/kaMZ41lj3smCUai2Frw/LoynB/1D+Lz/+s9tMOQl+14A//uRYiMJyR
	zTtOtCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQub-00000007Ydf-49ZG;
	Mon, 11 Aug 2025 11:41:58 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQdS-00000007VIn-3yid
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 11:24:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b85d01b79so4398994e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754911453; x=1755516253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5GmgDRwLzjGy8dLnCeLiuAfeTbFgGKNWM+nzJ45dpA=;
        b=Mrk2koV5zViSUaK1IBSA/gKOcj/es4LHdRLCPj721/fnB3LDf5PebNiZTD3KEekWAY
         LZNttmcGiavVK+TFecG8Oy0GdhWusn747ApG+GpGBQAkWQoIJLueTRLWMWFuvBxK4WdF
         NiNPg0zLgrVndInP9WTkJZcf5RdUYYM/swEtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911453; x=1755516253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5GmgDRwLzjGy8dLnCeLiuAfeTbFgGKNWM+nzJ45dpA=;
        b=mZNGVHE6xMdbIQJwuChfb6tir4ACXMTtYdvftN3SI4XSacYenAF3v7WcHdgCQhSUbb
         HSDMYF2R0QeP8C2Ow6W+JaaMfgKC1eb4a7wm8W/zgm6WfmKYRhjvYy44yuIP9mqQegt5
         DEiJpWnPM/9EHEfXyfLq+yAKzztbgEptpQh8mepQc3EczmCccn2yfomMXjpztJf8FxOT
         HOwrh6pzLEgrjeql23qHSyGInUVcRlVF52ciD0y61QBTNQzcOsJlSLdSU/HMthHUJekt
         UCZwdKQ7+yw3JDl8JsCLlHUf8fv/xk1LHMEq6yP30xXhjLTk6KH0pAVbJh0nTyvUv13H
         9XkA==
X-Forwarded-Encrypted: i=1; AJvYcCU7LUlSac6tlzyjJdpUGMN/2ZPx/WoE8hWEKmPGyTzrT+SITWJPim9QI2+RNiLNucs/F+ZyWsBPHmWx4IYa1VTQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCXxXgO+25p8awXdjNKdhvdlUMsRA8ewispB8QZzgxagudDPh5
	yZBXiqwV3TSgf7CV3KwpEGF4YwmIR/n5BFPn9eUGq2hURApMs6Vo6krSWbr2HwqBg19XdiNM1qL
	LZ8pSLkm7mAtT2jQ76mOHVPTiAH53vt6Ce8Z1JE9a
X-Gm-Gg: ASbGncsYt5eVAyOMFKCezIRTCiguUJaJ3N3a6C1Mwe9+fRwiKlx1MRp1GeO/3XMqxdZ
	Oi3id4pAvdacHtQ5EEoRrIazfkQydQfuzVFwaTnHby4OZRjljB2DOLgQuFvP/V7iGs81yisMjrQ
	HqSg1mR2hurgU8WTuywOsgEtUgPI7WEJqFIVzcmiQCRyfDlStXxQaZQWpT/70K49+lB9iMPahV/
	kKJ32WHVWGUyfaYGQvEkjTqQyB1yS3C1ck=
X-Google-Smtp-Source: AGHT+IFH1xwZU4h8r7iEY3jgrVBtJGh2oYXazOzDlq78D9uq3Av2ACb1cuu5hjNFbP0gck6r2pgb1pAL9b77iA9N8VY=
X-Received: by 2002:a05:6512:3b27:b0:55b:7cc9:41ee with SMTP id
 2adb3069b0e04-55cc0102717mr3789564e87.38.1754911452958; Mon, 11 Aug 2025
 04:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-6-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-6-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Aug 2025 19:24:02 +0800
X-Gm-Features: Ac12FXxeNaT3MP9n4wih87uuXFKen5GCnd1-R8Ou24yHeRKyjqsVqSE_BwKFLpA
Message-ID: <CAGXv+5HW1-GByx6BEd46J_n50FxcHNukUWwREpoDne=CdAnSVQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] ASoC: mediatek: mt8196: support I2S in platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_042414_982365_AE7FAA95 
X-CRM114-Status: GOOD (  24.26  )
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

Sorry for another reply, but I lost some of the context I wanted to reply t=
o.

On Tue, Jul 8, 2025 at 7:34=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 I2S DAI driver support.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 3944 ++++++++++++++++++++
>  1 file changed, 3944 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/media=
tek/mt8196/mt8196-dai-i2s.c
> new file mode 100644
> index 000000000000..59f66ab8fa9f
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> @@ -0,0 +1,3944 @@

[...]

> +static int mtk_afe_i2s_share_connect(struct snd_soc_dapm_widget *source,
> +                                    struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int ret =3D 0;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       ret =3D (i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe, so=
urce->name)) ? 1 : 0;
> +
> +       return ret;

          return i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe,
source->name);

bool casts to int implicitly in the same way you wrote explicitly.

> +}
> +
> +static int mtk_afe_i2s_hd_connect(struct snd_soc_dapm_widget *source,
> +                                 struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int i2s_num;

Rename to "src_i2s_num" to be explicit.

> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       i2s_num =3D get_i2s_id_by_name(afe, source->name);
> +       if (get_i2s_id_by_name(afe, sink->name) =3D=3D i2s_num)

Use i2s_priv->id?

> +               return !mtk_is_i2s_low_power(i2s_num) ||
> +                      i2s_priv->low_jitter_en;
> +
> +       /* check if share i2s need hd en */
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id =3D=3D i2s_num)
> +               return !mtk_is_i2s_low_power(i2s_num) ||
> +                      i2s_priv->low_jitter_en;
> +
> +       return 0;
> +}
> +
> +static int mtk_afe_i2s_apll_connect(struct snd_soc_dapm_widget *source,
> +                                   struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int cur_apll;
> +       int i2s_need_apll;

Rename to needed_apll or desired_apll.

> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, w->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       /* which apll */
> +       cur_apll =3D mt8196_get_apll_by_name(afe, source->name);
> +
> +       /* choose APLL from i2s rate */
> +       i2s_need_apll =3D mt8196_get_apll_by_rate(afe, i2s_priv->rate);
> +
> +       return (i2s_need_apll =3D=3D cur_apll) ? 1 : 0;

          return i2s_need_apll =3D=3D cur_apll;

> +}
> +
> +static int mtk_afe_i2s_mclk_connect(struct snd_soc_dapm_widget *source,
> +                                   struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, sink->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       if (get_i2s_id_by_name(afe, sink->name) =3D=3D

              i2s_priv->id =3D=3D ...

> +           get_i2s_id_by_name(afe, source->name))

Keep a copy of the result ...

> +               return (i2s_priv->mclk_rate > 0) ? 1 : 0;

                  return i2s_priv->mclk_rate > 0;

> +
> +       /* check if share i2s need mclk */
> +       if (i2s_priv->share_i2s_id < 0)
> +               return 0;
> +
> +       if (i2s_priv->share_i2s_id =3D=3D get_i2s_id_by_name(afe, source-=
>name))

and use it here, like in mtk_afe_i2s_hd_connect().

> +               return (i2s_priv->mclk_rate > 0) ? 1 : 0;

                  return i2s_priv->mclk_rate > 0;

> +       return 0;
> +}
> +
> +static int mtk_afe_mclk_apll_connect(struct snd_soc_dapm_widget *source,
> +                                    struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int cur_apll;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, w->name);
> +

Drop empty line between assignment and check.

> +       if (!i2s_priv)
> +               return 0;
> +
> +       /* which apll */
> +       cur_apll =3D mt8196_get_apll_by_name(afe, source->name);
> +
> +       return (i2s_priv->mclk_apll =3D=3D cur_apll) ? 1 : 0;

          return i2s_priv->mclk_apll =3D=3D cur_apll;

> +}

[...]

ChenYu

