Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5524DCFA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwvomCI1BwoaMdIOXY7Bw6epo0QG3ROLLVd2yNeflzU=; b=ZlCIeETJOrpN5WBc5vahzTURHB
	xPFmUs/fpVv4y9FBVrYASU9Koly2AX/bxeoUqtjlhzfUO9CBCJvCORUfzizT7wsBfEOIM5pjTccV5
	oe5jLy/SjLb1N095jIFDgoIhCddjnki9Th+nbFiTYbB9XqC2LavwBDkaItcqSRrfiy3Y/nDtDBULx
	Sza7H5+iQibI2/A4obS2Xy8dcxVrJ7OgcyGledWIHd1E6gGuDY2efM0SirID9ju30YHHTC28N0X33
	4Cn4yj5uQ1MMnAOJL0hqbS84litT0/3PKhXZHIZLzNQ0mGpYinAuq8mxjk9SFAl9Z/gjhyhGcz5rk
	PtjGmLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMK78-00000007sfQ-0Rag;
	Fri, 21 Nov 2025 05:55:22 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMK75-00000007seW-2dTj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:55:20 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-37a34702a20so14207861fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 21:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763704517; x=1764309317; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwvomCI1BwoaMdIOXY7Bw6epo0QG3ROLLVd2yNeflzU=;
        b=aA3gPZ0XwWsSDx2EbMhJ88xk20A5U8EaZDPE15Qoz0tNIaIU2LWAkp9T18gbZxGSS9
         rY+WFmyGIfPujSXiDcren70KrD0FB1iy+72jX3whfjUeL3W9dsMrEGDc+yvScLwvMDXh
         qjpHoRvwLyKc1K1lhtuWNkset919jWjQJ4oSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763704517; x=1764309317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zwvomCI1BwoaMdIOXY7Bw6epo0QG3ROLLVd2yNeflzU=;
        b=H7pmlgYXIg8TGp45rTtHMRo4x8NDOyrrLbpIL/WdJm4bay7kF/BtQn0SyHGcEm2X3I
         URxEkLf5lxujmd0dpR4Ye4atfFiVGjC3SAOCSNbrVSSMeDJo/07mQHvcxy5Wfr4Pjasb
         arUD0LMx/QTV5BW5zd4gUwS2Cy3hW5Q3L1yGj8tSN0tBEwkWYTnRyIi+FIz3jC4JfvBp
         bcjyONkstQb3qMl3ofaZidUwx3p4L4fs3ak7oSik6OeM8l+Ss1Xq1RhEiaSX893JnFIr
         gY+V8tx6SjYgmroqgT9Bkjk8h7lqVhPSWZ7XyjA/9G7jmKonS2EEnwZYUz1zddWcB0hV
         SArg==
X-Forwarded-Encrypted: i=1; AJvYcCWrCuOwLcrUJDUABSOXSXt6AdLx3BDT5lLmZ4DzasFw08l6plwy/9oUJkkoGdDMfqWUMJT7biU6Dku2Hat83o2F@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGLaYtofNfdFy/hHLwSYgXSfZ7YzU/kFIXlCdjS32RI0VevY2
	WfMN1iYsOgNfKQ9WoC2CIgMsPwUlFCJCP4OjiPGOJvyPEgOVEJ/2yRCBLgXl+Rqo4r9NS90z3UQ
	T6cZ9CuR6rpOj3QAyEuJ5K8yzCGWzpU11eqFKziRw
X-Gm-Gg: ASbGncun/20sBkVa/+jMaZLxySytHZZf0NCM+Sy+F5fTMe64eJ+XhLR66qVOqDaqSoF
	ry2/BiFNJzEGstVInfdMa/+bRR5+fJKgjANr0osTJ7Gz5m4FddKE3Wgid0paiqS+gxSmLqKxUSa
	47aEXkW5KMhhQrMX7rr2CzbkLSfZAtgK54KwDoJBF/MJ7olo89kPdAxcMb9oyPbZ6wEU/3jyFtb
	6bWm5yb0FDoa7VV1hS+QzAXN86CighHbKw8/Gnktlqf+bIprF4M70rYxjgM5pVuDlD3/BYYzqK7
	tYDsUJuaNNVdu2YG67mp/Vm5xw==
X-Google-Smtp-Source: AGHT+IEDYrCP2AUvrHoGRLMquIrh7OcHVFanViendh+zN/U9VV/Im6NFRvLgmuSn64N/ilxblNrZFfLqTBBGNdSvpjg=
X-Received: by 2002:a05:6512:220f:b0:592:f521:188a with SMTP id
 2adb3069b0e04-596a3ee2889mr332332e87.49.1763704516899; Thu, 20 Nov 2025
 21:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20251121054537.25796-1-ansuelsmth@gmail.com> <20251121054537.25796-4-ansuelsmth@gmail.com>
In-Reply-To: <20251121054537.25796-4-ansuelsmth@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Nov 2025 13:55:05 +0800
X-Gm-Features: AWmQ_bmSFIa1l2iBEM2F1Ns2W5B-YvvlaQwgWNVUEBTmTCIap5cAu57a2ztT9KE
Message-ID: <CAGXv+5HZbB+CeeM7ggCRmxdiyeY-5tXYpLLTyoazEinrLe_jCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_215519_745927_44C17AF5 
X-CRM114-Status: GOOD (  27.22  )
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

On Fri, Nov 21, 2025 at 1:46=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for the Sound system present on Airoha AN7581 SoC. This is
> based on the mediatek AFE drivers.
>
> Also add the machine driver to create an actual sound card for the AFE.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

[...]

> diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediat=
ek/an7581/an7581-wm8960.c
> new file mode 100644
> index 000000000000..5d6c736aa6f2
> --- /dev/null
> +++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Airoha ALSA SoC I2S platform driver for AN7581
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <sound/soc.h>
> +
> +#include "an7581-afe-common.h"
> +
> +static const struct snd_soc_dapm_widget an7581_wm8960_widgets[] =3D {
> +       SND_SOC_DAPM_HP("Headphone", NULL),
> +       SND_SOC_DAPM_MIC("AMIC", NULL),
> +};
> +
> +static const struct snd_kcontrol_new an7581_wm8960_controls[] =3D {
> +       SOC_DAPM_PIN_SWITCH("Headphone"),
> +       SOC_DAPM_PIN_SWITCH("AMIC"),
> +};
> +
> +SND_SOC_DAILINK_DEFS(playback,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
> +                    DAILINK_COMP_ARRAY(COMP_DUMMY()),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +SND_SOC_DAILINK_DEFS(capture,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
> +                    DAILINK_COMP_ARRAY(COMP_DUMMY()),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +SND_SOC_DAILINK_DEFS(codec,
> +                    DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
> +                    DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
> +                    DAILINK_COMP_ARRAY(COMP_EMPTY()));
> +
> +static struct snd_soc_dai_link an7581_wm8960_dai_links[] =3D {
> +       /* FE */
> +       {
> +               .name =3D "wm8960-playback",
> +               .stream_name =3D "wm8960-playback",
> +               .trigger =3D {SND_SOC_DPCM_TRIGGER_POST,
> +                           SND_SOC_DPCM_TRIGGER_POST},
> +               .dynamic =3D 0,
> +               .playback_only =3D 1,
> +               SND_SOC_DAILINK_REG(playback),
> +       },
> +       {
> +               .name =3D "wm8960-capture",
> +               .stream_name =3D "wm8960-capture",
> +               .trigger =3D {SND_SOC_DPCM_TRIGGER_POST,
> +                           SND_SOC_DPCM_TRIGGER_POST},
> +               .dynamic =3D 0,
> +               .capture_only =3D 1,
> +               SND_SOC_DAILINK_REG(capture),
> +       },
> +       /* BE */
> +       {
> +               .name =3D "wm8960-codec",
> +               .no_pcm =3D 1,
> +               .dai_fmt =3D SND_SOC_DAIFMT_I2S |
> +                       SND_SOC_DAIFMT_NB_NF |
> +                       SND_SOC_DAIFMT_CBC_CFC |
> +                       SND_SOC_DAIFMT_GATED,
> +               SND_SOC_DAILINK_REG(codec),
> +       },
> +};
> +
> +static struct snd_soc_card an7581_wm8960_card =3D {
> +       .name =3D "an7581-wm8960",
> +       .owner =3D THIS_MODULE,
> +       .dai_link =3D an7581_wm8960_dai_links,
> +       .num_links =3D ARRAY_SIZE(an7581_wm8960_dai_links),
> +       .controls =3D an7581_wm8960_controls,
> +       .num_controls =3D ARRAY_SIZE(an7581_wm8960_controls),
> +       .dapm_widgets =3D an7581_wm8960_widgets,
> +       .num_dapm_widgets =3D ARRAY_SIZE(an7581_wm8960_widgets),
> +};
> +
> +static int an7581_wm8960_machine_probe(struct platform_device *pdev)
> +{
> +       struct device_node *platform_dai_node, *codec_dai_node;
> +       struct snd_soc_card *card =3D &an7581_wm8960_card;
> +       struct device_node *platform, *codec;
> +       struct snd_soc_dai_link *dai_link;
> +       int ret, i;
> +
> +       card->dev =3D &pdev->dev;
> +
> +       platform =3D of_get_child_by_name(pdev->dev.of_node, "platform");
> +
> +       if (platform) {
> +               platform_dai_node =3D of_parse_phandle(platform, "sound-d=
ai", 0);
> +               of_node_put(platform);
> +
> +               if (!platform_dai_node) {
> +                       dev_err(&pdev->dev, "Failed to parse platform/sou=
nd-dai property\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               dev_err(&pdev->dev, "Property 'platform' missing or inval=
id\n");
> +               return -EINVAL;
> +       }
> +
> +       for_each_card_prelinks(card, i, dai_link) {
> +               if (dai_link->platforms->name)
> +                       continue;
> +               dai_link->platforms->of_node =3D platform_dai_node;
> +       }
> +
> +       codec =3D of_get_child_by_name(pdev->dev.of_node, "codec");
> +
> +       if (codec) {
> +               codec_dai_node =3D of_parse_phandle(codec, "sound-dai", 0=
);
> +               of_node_put(codec);
> +
> +               if (!codec_dai_node) {
> +                       of_node_put(platform_dai_node);
> +                       dev_err(&pdev->dev, "Failed to parse codec/sound-=
dai property\n");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               of_node_put(platform_dai_node);
> +               dev_err(&pdev->dev, "Property 'codec' missing or invalid\=
n");
> +               return -EINVAL;
> +       }
> +
> +       for_each_card_prelinks(card, i, dai_link) {
> +               if (dai_link->codecs->name)
> +                       continue;
> +               dai_link->codecs->of_node =3D codec_dai_node;
> +       }
> +
> +       ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n"=
, ret);
> +               goto err_of_node_put;
> +       }
> +
> +       ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> +       if (ret) {
> +               dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card =
fail\n", __func__);
> +               goto err_of_node_put;
> +       }
> +
> +       return 0;
> +
> +err_of_node_put:
> +       of_node_put(platform_dai_node);
> +       of_node_put(codec_dai_node);
> +       return ret;
> +}
> +
> +static const struct of_device_id an7581_wm8960_machine_dt_match[] =3D {
> +       { .compatible =3D "airoha,an7581-wm8960-sound" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, an7581_wm8960_machine_dt_match);
> +
> +static struct platform_driver an7581_wm8960_driver =3D {
> +       .driver =3D {
> +                  .name =3D "an7581-wm8960",
> +                  .of_match_table =3D an7581_wm8960_machine_dt_match,
> +       },
> +       .probe =3D an7581_wm8960_machine_probe,
> +};
> +module_platform_driver(an7581_wm8960_driver);
> +
> +MODULE_DESCRIPTION("Airoha SoC I2S platform driver for ALSA AN7581");
> +MODULE_LICENSE("GPL");

This machine driver seems very generic. Maybe you could get away with
using the audio graph drivers instead? It avoids tying the platform with
a specific codec just for boilerplate code.


ChenYu

