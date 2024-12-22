Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EC2E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlz2LOWxC4ZL1ezJ/U8+YOy1mneK8Pcrb6gV8siPKTc=; b=n6YuCrJApZig6o
	L7Bn03aOhIA14E/hVZN74KwsLrTc3JIYRhS/THRH0JcsGXJCqF6UfiIJhE42FAJZI9BvINkoKAPLh
	mipPGXfp9MqN5I5GTOqduK2k3hRe9rroUf8cgXsGHtuCFvCQZz+5MV2FZjTj75f6Lv6jDRTnserlH
	/9p3wMNUKMxDoW65LHxSVpLHUwfYQ4BQhGsRwFRJ80xf2Q05nzRyRd5lXLiZgsebwxQja7O4Vj0aw
	nP5Ns9HB+RozBuQzRtJCqrGhuQgGie7Co2DFGU+xZWzYyOde7nkPeF8Rl/J0iNSo/99RMvUaZx39W
	kkz3RdgWJu+jXdDtu5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPlZ-00000008b1X-1XK6;
	Sun, 22 Dec 2024 17:29:21 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPYC-00000008ZNz-0cHE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:15:33 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso44620121fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887728; x=1735492528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlz2LOWxC4ZL1ezJ/U8+YOy1mneK8Pcrb6gV8siPKTc=;
        b=S4ZyS9JQs+sRDxV+MbE/4ReaHpD9gfVBX4M4/ri9WyWy4l1Ndl4mVNIh6YP/cvmtlV
         xinF5D69Zd/4MaRVg68zz11yup/R4Fr4VdBSCVpceaja4PmdC43RG+mAPl3bwWf6j9/b
         xQNF2xqRqHEwbtEyhCusAyv2wBUUUN3MHRRYRGvtxMGVlCYLCPt1qu7mkK6zc5Lm1hRf
         H5Ucy27O4Bv/8PHA9xjo2iAPYZiRdoKyZZwOSZD0dIFDDi3KFHUWFSKCRLEQ6TDwwUQM
         w4ur6m9e0Fg5r0VX95EeMNSWMpw5Q6VfnOyXERPlOHZ56ffshMWEBRStiQhwRs2zmKLT
         KRKw==
X-Forwarded-Encrypted: i=1; AJvYcCUnYqTaDId76hVX8rm+LAuJj4FbFDeSXrR3a9RySYChSb9LzGEUGLePcMyCVMkGXch1Lzharyo7H5zGsAfSRLC5@lists.infradead.org
X-Gm-Message-State: AOJu0YzETpc5TwFE0Voa8SqHVTriP7w7vFXPodaXhPF6fnHlgl8WE7pq
	VzXd41vaHuA8H8oSdxvQYqUYWLyS0TDF4NIeQ2BGuIy2rECYn1soOcEh84dX
X-Gm-Gg: ASbGncvdr7aNH5ch6+MKb903u+aT2l+/2cOkR5xholIh7BtKT0CgdRYd60LTpNDFHGS
	SSEmhgW36U2KjbNreSnyeyR4FRl5zDYgIj49XHOYclzuGa1RdmD7uaNQ+qVGQVS9yXaEVgAJljY
	vtJ+aXNdcS7voY2viznoM6ZHZ/I6AjqXpcBomXimFDXL+wOj2fDTU5TwR74Uf9h1F9UchfgIpGQ
	J0Hp1i4Ja8qIM+VaeiCUp81QIcseicJr0041Jo+sYZgvsqSHGWKFrKjTP8USJs18fGK6mbjITUU
	q8Xt4L0aTSuZNA==
X-Google-Smtp-Source: AGHT+IEoS1nMP+RiS67DNfFiu4VPSId1bwo6/6qW46pAyVf1YAUXHHCTkT990YmtgutjiD12XU5qmw==
X-Received: by 2002:a05:6512:1094:b0:542:2930:4377 with SMTP id 2adb3069b0e04-54229586738mr3053513e87.56.1734887727867;
        Sun, 22 Dec 2024 09:15:27 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f782csm1000634e87.38.2024.12.22.09.15.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:15:27 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso44619711fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4oSbW1+jJDKu7AQnD578D1kDd37OVOopXIPzPShPi1E0BlkQl5kDdyO1gQHp7LLn2v1CDRumurnYWQs23JV0N@lists.infradead.org
X-Received: by 2002:a05:6512:31d3:b0:540:1e5e:3876 with SMTP id
 2adb3069b0e04-5422957ace2mr3418251e87.52.1734887726415; Sun, 22 Dec 2024
 09:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20241221094122.27325-1-ryan@testtoast.com> <20241221094122.27325-3-ryan@testtoast.com>
In-Reply-To: <20241221094122.27325-3-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:15:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
Message-ID: <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_091532_190931_4F1E4BE9 
X-CRM114-Status: GOOD (  27.42  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add support for GPIO headphone detection with the hp-det-gpios
> property. In order for this to properly disable the path upon
> removal of headphones, the output must be labelled Headphone which
> is a common sink in the driver. Note this patch also adds the output
> of Headphone for the H616 codec.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  sound/soc/sunxi/sun4i-codec.c | 59 +++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.=
c
> index 933a0913237c8..5f718dd3fcf0a 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -21,6 +21,7 @@
>  #include <linux/gpio/consumer.h>
>
>  #include <sound/core.h>
> +#include <sound/jack.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -272,6 +273,7 @@ struct sun4i_codec {
>         struct clk      *clk_module;
>         struct reset_control *rst;
>         struct gpio_desc *gpio_pa;
> +       struct gpio_desc *gpio_hp;
>
>         /* ADC_FIFOC register is at different offset on different SoCs */
>         struct regmap_field *reg_adc_fifoc;
> @@ -1302,6 +1304,49 @@ static struct snd_soc_dai_driver dummy_cpu_dai =3D=
 {
>         .ops =3D &dummy_dai_ops,
>  };
>
> +static struct snd_soc_jack sun4i_headphone_jack;
> +
> +static struct snd_soc_jack_pin sun4i_headphone_jack_pins[] =3D {
> +       { .pin =3D "Headphone", .mask =3D SND_JACK_HEADPHONE},
> +};
> +
> +static struct snd_soc_jack_gpio sun4i_headphone_jack_gpio =3D {
> +       .name =3D "hp-det",
> +       .report =3D SND_JACK_HEADPHONE,
> +       .debounce_time =3D 150,
> +};
> +
> +static int sun4i_codec_machine_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_card *card =3D rtd->card;
> +       struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(card);
> +       int ret;
> +
> +       if (scodec->gpio_hp) {
> +               ret =3D snd_soc_card_jack_new_pins(card, "Headphone Jack"=
,
> +                                                SND_JACK_HEADPHONE,
> +                                                &sun4i_headphone_jack,
> +                                                sun4i_headphone_jack_pin=
s,
> +                                                ARRAY_SIZE(sun4i_headpho=
ne_jack_pins));
> +               if (ret) {
> +                       dev_err(rtd->dev,
> +                               "Headphone jack creation failed: %d\n", r=
et);
> +                       return ret;
> +               }
> +
> +               sun4i_headphone_jack_gpio.desc =3D scodec->gpio_hp;
> +               ret =3D snd_soc_jack_add_gpios(&sun4i_headphone_jack, 1,
> +                                            &sun4i_headphone_jack_gpio);
> +
> +               if (ret) {
> +                       dev_err(rtd->dev, "Headphone GPIO not added: %d\n=
", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *d=
ev,
>                                                         int *num_links)
>  {
> @@ -1327,6 +1372,7 @@ static struct snd_soc_dai_link *sun4i_codec_create_=
link(struct device *dev,
>         link->codecs->name      =3D dev_name(dev);
>         link->platforms->name   =3D dev_name(dev);
>         link->dai_fmt           =3D SND_SOC_DAIFMT_I2S;
> +       link->init              =3D sun4i_codec_machine_init;
>
>         *num_links =3D 1;
>
> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver sun5=
0i_h616_codec_codec =3D {
>  };
>
>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D {
> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
> +       SOC_DAPM_PIN_SWITCH("Speaker"),

Why?

>  };
>
>  static const struct snd_soc_dapm_widget sun50i_h616_codec_card_dapm_widg=
ets[] =3D {
> +       SND_SOC_DAPM_HP("Headphone", NULL),
>         SND_SOC_DAPM_LINE("Line Out", NULL),
>         SND_SOC_DAPM_SPK("Speaker", sun4i_codec_spk_event),
>  };
> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_creat=
e_card(struct device *dev)
>
>         card->dev               =3D dev;
>         card->owner             =3D THIS_MODULE;
> -       card->name              =3D "H616 Audio Codec";
> +       card->name              =3D "h616-audio-codec";

Why?

>         card->driver_name       =3D "sun4i-codec";
>         card->controls          =3D sun50i_h616_card_controls;
>         card->num_controls      =3D ARRAY_SIZE(sun50i_h616_card_controls)=
;
> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_devic=
e *pdev)
>                 return ret;
>         }
>
> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allwinne=
r,hp-det",
> +                                                 GPIOD_IN);

Just put it on the same line. Lines can go up to 100 characters.

> +       if (IS_ERR(scodec->gpio_hp)) {
> +               ret =3D PTR_ERR(scodec->gpio_hp);
> +               dev_err_probe(&pdev->dev, ret, "Failed to get hp-det gpio=
\n");
> +               return ret;
> +       }
> +
>         /* reg_field setup */
>         scodec->reg_adc_fifoc =3D devm_regmap_field_alloc(&pdev->dev,
>                                                         scodec->regmap,
> --
> 2.47.1
>
>

