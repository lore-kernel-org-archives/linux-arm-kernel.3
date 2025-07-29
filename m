Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1227FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvU8hum8qe2aqvNrj+SC56dU8YWl4qMnPgrm0y/93TM=; b=O4UlGag5ID9iR2L0v7fxRhGDab
	PvY2V01FeUXZEP1mor4GpACCEnZuuhfVY1zed8C/MMRcUrHOUErmp3eGATs1B35L9EeAx39YN/apV
	H2ZPH7jm2J5i/g587lQ0TYigkxtCu2SGcYB1wdS27NUtqUHMxHyJGBhNRm+S1UIx9gCPA1faptVfG
	RF4VQrAExszmglupG/pQbX5XFi/L9GlhG+Nz/RupWxbQHM4/ha+gwNMAKXwntXYxoDewKyNmlF863
	MesW1m6DNJrXHecJyamtHF/uz8AY1wlNUNNrGFhkYq4fVqKISWaB4WaFx5tz2oKc16OahXNKlesdx
	XN1jj4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugioe-0000000GeYk-3dnZ;
	Tue, 29 Jul 2025 11:48:20 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugimB-0000000GePZ-0vTq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 11:45:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-553d771435fso5599040e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753789545; x=1754394345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvU8hum8qe2aqvNrj+SC56dU8YWl4qMnPgrm0y/93TM=;
        b=i4XBGjcwY/fxtKB4AjBMlEp18jDq+R9FQyhPtvmcJ6SJIpU3xQmkAIg4NNxrlsLYkG
         z0Ijq0lQNucdC7kJwmdFfMFUHmLIzkY7I9mzhYnPVDyn0tuQcUWoxMazJ8y07yZaggYB
         4o7dCkzcNTejh766gjN+cdIab4UWhHJtqiuZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753789545; x=1754394345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvU8hum8qe2aqvNrj+SC56dU8YWl4qMnPgrm0y/93TM=;
        b=aYwI4uiLwB/QDs35pZDaf5pvp0bfiM9B5gZVfMp8IjQS10f2UTx98KMGtn86Tz/hbV
         z3dvhdHT13cEVXoHfJp5oZhWaXQld28kuPPtuB0mRap8vV2iw9qVdVP4hRpq0EHXoNKq
         cdDlvpTAUID6eSgsSM5HnQW1vJIFghgcXtofMTr2BvJe0lCqae8JlzAebyfGSBgLpLi6
         KBK+bKsKDK1YYUbLgQudeY+C9eozNE0cp+1KRvsPZnlC0wsrf2SYyerjbFHgIH2gC4LS
         14k1DiDj/K0GYGxeBdUQFAe6cMywqngeBiC9OmtzH5sxPKFtQHqxkB6BMN4pc8iRsGZP
         16HA==
X-Forwarded-Encrypted: i=1; AJvYcCVnRpHFPNPwpVu1KY7hqzA9Qk9JVGtp5mHRpax2wcd8gIcg2P1E9xbaXYvnExuKlFudkvSk90yFz99TREFDyFMU@lists.infradead.org
X-Gm-Message-State: AOJu0YzheN85yj6JfDVuv9+djPweH77xcFm0r1S5VKxcpkj3ljBaGfa4
	4LfXjedXiFhvQjws/Xiy9sErHTAFhyvgFyk086+k79vRqRswkZDhGUO887+q4o0yD5MMCn4pU/g
	ozlFtXzJfs3+gnOGm8+btrwNHWApugAKR0INyEe+U
X-Gm-Gg: ASbGncsLKUioEDzsdA5mo0pSy2WmgUF9+/Ix82r5M/wJ1mGUb3LtJ9Lnsrvx3/rjHJs
	augeGDrB2NeYYMJu54BGMNZ/9mtded/5t7eDD+VPMK2ren5tUi1UKm38T31CXdqyEIf1l8DepPy
	Jcm53XqWAzsT5FSGbib264n2D/2ybT7k1ry098Br+CpPhDWOOzbGYl82XA71D6cEqz6umhTw+Ww
	0SYJ7Cq4HOfbG0Gi/VF5EqENhAn4dDcCKvDgYEOrTTI
X-Google-Smtp-Source: AGHT+IH9dV1TYULqEJcOG5ei2Y/B2t6swYB5rhyu6zMe2KpGzObUuKioZ3LumIhJWTnVf+1LBk/V2P+kADExeNkE0hA=
X-Received: by 2002:a05:6512:3501:b0:55b:5b29:61ef with SMTP id
 2adb3069b0e04-55b5f50d012mr4132836e87.56.1753789544591; Tue, 29 Jul 2025
 04:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-5-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-5-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 29 Jul 2025 19:45:32 +0800
X-Gm-Features: Ac12FXxLbtSlFodhdJf7BRw2LIFc5tMFEEnn1_7E9iQ9STfYQ6fuWXbpbgw0AyQ
Message-ID: <CAGXv+5Fo4NmH-DJ8LDe3ey-BoA=kRC9jZJOPuZJeAbSQseA2eg@mail.gmail.com>
Subject: Re: [PATCH v6 04/10] ASoC: mediatek: mt8196: support ADDA in platform driver
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
X-CRM114-CacheID: sfid-20250729_044547_428882_0C78D67C 
X-CRM114-Status: GOOD (  23.58  )
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

On Tue, Jul 8, 2025 at 7:34=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 ADDA DAI driver support.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-dai-adda.c | 888 ++++++++++++++++++++
>  1 file changed, 888 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-adda.c b/sound/soc/medi=
atek/mt8196/mt8196-dai-adda.c
> new file mode 100644
> index 000000000000..e44332ffd0c4
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-adda.c
> @@ -0,0 +1,888 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI ADDA Control
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/delay.h>

Please sort by name. And add an empty line here to separate the groups.

> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mt8196-interconnection.h"
> +
> +enum {
> +       UL_IIR_SW =3D 0,
> +       UL_IIR_5HZ,
> +       UL_IIR_10HZ,
> +       UL_IIR_25HZ,
> +       UL_IIR_50HZ,
> +       UL_IIR_75HZ,
> +};
> +
> +enum {
> +       MTK_AFE_ADDA_UL_RATE_8K =3D 0,
> +       MTK_AFE_ADDA_UL_RATE_16K =3D 1,
> +       MTK_AFE_ADDA_UL_RATE_32K =3D 2,
> +       MTK_AFE_ADDA_UL_RATE_48K =3D 3,
> +       MTK_AFE_ADDA_UL_RATE_96K =3D 4,
> +       MTK_AFE_ADDA_UL_RATE_192K =3D 5,
> +       MTK_AFE_ADDA_UL_RATE_48K_HD =3D 6,
> +};
> +
> +enum {
> +       MTK_AFE_MTKAIF_RATE_8K =3D 0x0,
> +       MTK_AFE_MTKAIF_RATE_12K =3D 0x1,
> +       MTK_AFE_MTKAIF_RATE_16K =3D 0x2,
> +       MTK_AFE_MTKAIF_RATE_24K =3D 0x3,
> +       MTK_AFE_MTKAIF_RATE_32K =3D 0x4,
> +       MTK_AFE_MTKAIF_RATE_48K =3D 0x5,
> +       MTK_AFE_MTKAIF_RATE_64K =3D 0x6,
> +       MTK_AFE_MTKAIF_RATE_96K =3D 0x7,
> +       MTK_AFE_MTKAIF_RATE_128K =3D 0x8,
> +       MTK_AFE_MTKAIF_RATE_192K =3D 0x9,
> +       MTK_AFE_MTKAIF_RATE_256K =3D 0xa,
> +       MTK_AFE_MTKAIF_RATE_384K =3D 0xb,
> +       MTK_AFE_MTKAIF_RATE_11K =3D 0x10,
> +       MTK_AFE_MTKAIF_RATE_22K =3D 0x11,
> +       MTK_AFE_MTKAIF_RATE_44K =3D 0x12,
> +       MTK_AFE_MTKAIF_RATE_88K =3D 0x13,
> +       MTK_AFE_MTKAIF_RATE_176K =3D 0x14,
> +       MTK_AFE_MTKAIF_RATE_352K =3D 0x15,

Same comments from other patches about enum value assignments and macros
apply here as well.

> +};
> +
> +struct mtk_afe_adda_priv {
> +       int dl_rate;
> +       int ul_rate;
> +};
> +
> +static unsigned int adda_ul_rate_transform(struct mtk_base_afe *afe,
> +                                          unsigned int rate)
> +{
> +       switch (rate) {
> +       case 8000:
> +               return MTK_AFE_ADDA_UL_RATE_8K;
> +       case 16000:
> +               return MTK_AFE_ADDA_UL_RATE_16K;
> +       case 32000:
> +               return MTK_AFE_ADDA_UL_RATE_32K;
> +       case 48000:
> +               return MTK_AFE_ADDA_UL_RATE_48K;
> +       case 96000:
> +               return MTK_AFE_ADDA_UL_RATE_96K;
> +       case 192000:
> +               return MTK_AFE_ADDA_UL_RATE_192K;
> +       default:
> +               dev_info(afe->dev, "rate %d invalid, use 48kHz!!!\n", rat=
e);

Make it a warning.

> +               return MTK_AFE_ADDA_UL_RATE_48K;
> +       }
> +}
> +
> +static unsigned int mtkaif_rate_transform(struct mtk_base_afe *afe,
> +                                         unsigned int rate)
> +{
> +       switch (rate) {
> +       case 8000:
> +               return MTK_AFE_MTKAIF_RATE_8K;
> +       case 11025:
> +               return MTK_AFE_MTKAIF_RATE_11K;
> +       case 12000:
> +               return MTK_AFE_MTKAIF_RATE_12K;
> +       case 16000:
> +               return MTK_AFE_MTKAIF_RATE_16K;
> +       case 22050:
> +               return MTK_AFE_MTKAIF_RATE_22K;
> +       case 24000:
> +               return MTK_AFE_MTKAIF_RATE_24K;
> +       case 32000:
> +               return MTK_AFE_MTKAIF_RATE_32K;
> +       case 44100:
> +               return MTK_AFE_MTKAIF_RATE_44K;
> +       case 48000:
> +               return MTK_AFE_MTKAIF_RATE_48K;
> +       case 96000:
> +               return MTK_AFE_MTKAIF_RATE_96K;
> +       case 192000:
> +               return MTK_AFE_MTKAIF_RATE_192K;
> +       default:
> +               dev_info(afe->dev, "rate %d invalid, use 48kHz!!!\n", rat=
e);

Make it a warning.

> +               return MTK_AFE_MTKAIF_RATE_48K;
> +       }
> +}
> +
> +enum {
> +       SUPPLY_SEQ_ADDA_AFE_ON,
> +       SUPPLY_SEQ_ADDA_FIFO,
> +       SUPPLY_SEQ_ADDA_AP_DMIC,
> +       SUPPLY_SEQ_ADDA_UL_ON,
> +};
> +
> +static int mtk_adda_ul_src_dmic_phase_sync(struct mtk_base_afe *afe)

mtk_adda_ul_set_src_dmic_phase_sync() ?

Without a verb in the name, it's unclear what this function does.

[...]

> +
> +static int mtk_adda_ul_src_dmic_phase_sync_clock(struct mtk_base_afe *af=
e)

mtk_adda_ul_set_src_dmic_phase_sync_clock() ?

[...]

> +
> +static int mtk_adda_ul_src_dmic(struct mtk_base_afe *afe, int id)

mtk_adda_ul_enable_src_dmic() ?

> +{
> +       unsigned int reg_con0 =3D 0, reg_con1 =3D 0;
> +
> +       dev_dbg(afe->dev, "id: %d\n", id);
> +
> +       switch (id) {
> +       case MT8196_DAI_ADDA:
> +       case MT8196_DAI_AP_DMIC:
> +               reg_con0 =3D AFE_ADDA_UL0_SRC_CON0;
> +               reg_con1 =3D AFE_ADDA_UL0_SRC_CON1;
> +               break;
> +       case MT8196_DAI_ADDA_CH34:
> +       case MT8196_DAI_AP_DMIC_CH34:
> +               reg_con0 =3D AFE_ADDA_UL1_SRC_CON0;
> +               reg_con1 =3D AFE_ADDA_UL1_SRC_CON1;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       switch (id) {
> +       case MT8196_DAI_AP_DMIC:
> +               dev_dbg(afe->dev, "clear mtkaifv4 ul ch1ch2 mux\n");
> +               regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4_RX_CFG0=
,
> +                                  MTKAIFV4_UL_CH1CH2_IN_EN_SEL_MASK_SFT,
> +                                  0x0 << MTKAIFV4_UL_CH1CH2_IN_EN_SEL_SF=
T);
> +               break;
> +       case MT8196_DAI_AP_DMIC_CH34:
> +               dev_dbg(afe->dev, "clear mtkaifv4 ul ch3ch4 mux\n");
> +               regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4_RX_CFG0=
,
> +                                  MTKAIFV4_UL_CH3CH4_IN_EN_SEL_MASK_SFT,
> +                                  0x0 << MTKAIFV4_UL_CH3CH4_IN_EN_SEL_SF=
T);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       /* choose Phase */
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          UL_DMIC_PHASE_SEL_CH1_MASK_SFT,
> +                          0x0 << UL_DMIC_PHASE_SEL_CH1_SFT);
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          UL_DMIC_PHASE_SEL_CH2_MASK_SFT,
> +                          0x4 << UL_DMIC_PHASE_SEL_CH2_SFT);
> +
> +       /* dmic mode, 3.25M*/
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          DIGMIC_3P25M_1P625M_SEL_CTL_MASK_SFT,
> +                          0x0);
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          DMIC_LOW_POWER_MODE_CTL_MASK_SFT,
> +                          0x0);
> +
> +       /* turn on dmic, ch1, ch2 */
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          UL_SDM_3_LEVEL_CTL_MASK_SFT,
> +                          0x1 << UL_SDM_3_LEVEL_CTL_SFT);
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          UL_MODE_3P25M_CH1_CTL_MASK_SFT,
> +                          0x1 << UL_MODE_3P25M_CH1_CTL_SFT);
> +       regmap_update_bits(afe->regmap, reg_con0,
> +                          UL_MODE_3P25M_CH2_CTL_MASK_SFT,
> +                          0x1 << UL_MODE_3P25M_CH2_CTL_SFT);
> +
> +       /* ul gain:  gain =3D 0x7fff/positive_gain =3D 0x0/gain_mode =3D =
0x10 */
> +       regmap_update_bits(afe->regmap, reg_con1,
> +                          ADDA_UL_GAIN_VALUE_MASK_SFT,
> +                          0x7fff << ADDA_UL_GAIN_VALUE_SFT);
> +       regmap_update_bits(afe->regmap, reg_con1,
> +                          ADDA_UL_POSTIVEGAIN_MASK_SFT,
> +                          0x0 << ADDA_UL_POSTIVEGAIN_SFT);
> +       /* gain_mode =3D 0x10: Add 0.5 gain at CIC output */
> +       regmap_update_bits(afe->regmap, reg_con1,
> +                          GAIN_MODE_MASK_SFT,
> +                          0x02 << GAIN_MODE_SFT);
> +       return 0;
> +}
> +
> +static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
> +                            struct snd_kcontrol *kcontrol,
> +                            int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +
> +       dev_dbg(afe->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               /* should delayed 1/fs(smallest is 8k) =3D 125us before a=
fe off */
> +               usleep_range(120, 130);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
> +                                 struct snd_kcontrol *kcontrol,
> +                                 int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +
> +       dev_dbg(afe->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               /* should delayed 1/fs(smallest is 8k) =3D 125us before a=
fe off */
> +               usleep_range(120, 130);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_adda_ul_ap_dmic_event(struct snd_soc_dapm_widget *w,
> +                                    struct snd_kcontrol *kcontrol,
> +                                    int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +
> +       dev_info(afe->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               /* should delayed 1/fs(smallest is 8k) =3D 125us before a=
fe off */
> +               usleep_range(120, 130);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_adda_ch34_ul_ap_dmic_event(struct snd_soc_dapm_widget *w,
> +                                         struct snd_kcontrol *kcontrol,
> +                                         int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +
> +       dev_dbg(afe->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               /* should delayed 1/fs(smallest is 8k) =3D 125us before a=
fe off */
> +               usleep_range(120, 130);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}

This function is duplicated four times. Please just have one copy.
And name it something like "mtk_adda_sleep_on_pmd_event(...)".

> +
> +static const struct snd_kcontrol_new mtk_adda_controls[] =3D {
> +};

Please remove this if it is empty.

> +
> +/* ADDA UL MUX */
> +#define ADDA_UL_MUX_MASK 0x3
> +enum {
> +       ADDA_UL_MUX_MTKAIF =3D 0,
> +       ADDA_UL_MUX_AP_DMIC,
> +       ADDA_UL_MUX_AP_DMIC_MULTICH,
> +};
> +
> +static const char *const adda_ul_mux_map[] =3D {
> +       "MTKAIF", "AP_DMIC", "AP_DMIC_MULTI_CH",
> +};
> +
> +static int adda_ul_map_value[] =3D {
> +       ADDA_UL_MUX_MTKAIF,
> +       ADDA_UL_MUX_AP_DMIC,
> +       ADDA_UL_MUX_AP_DMIC_MULTICH,
> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(adda_ul_mux_map_enum,
> +                                 SND_SOC_NOPM,
> +                                 0,
> +                                 ADDA_UL_MUX_MASK,
> +                                 adda_ul_mux_map,
> +                                 adda_ul_map_value);
> +
> +static const struct snd_kcontrol_new adda_ul_mux_control =3D
> +       SOC_DAPM_ENUM("ADDA_UL_MUX Select", adda_ul_mux_map_enum);
> +
> +static const struct snd_kcontrol_new adda_ch34_ul_mux_control =3D
> +       SOC_DAPM_ENUM("ADDA_CH34_UL_MUX Select", adda_ul_mux_map_enum);
> +
> +static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] =3D {
> +       /* inter-connections */
> +       SND_SOC_DAPM_SUPPLY_S("ADDA Enable", SUPPLY_SEQ_ADDA_AFE_ON,
> +                             AUDIO_ENGEN_CON0, AUDIO_F3P25M_EN_ON_SFT, 0=
,
> +                             NULL, 0),
> +       SND_SOC_DAPM_SUPPLY_S("ADDA Capture Enable", SUPPLY_SEQ_ADDA_UL_O=
N,
> +                             AFE_ADDA_UL0_SRC_CON0,
> +                             UL_SRC_ON_TMP_CTL_SFT, 0,
> +                             mtk_adda_ul_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),

The event callback does nothing for SND_SOC_DAPM_PRE_PMU. Please drop the f=
lag.

> +       SND_SOC_DAPM_SUPPLY_S("ADDA CH34 Capture Enable", SUPPLY_SEQ_ADDA=
_UL_ON,
> +                             AFE_ADDA_UL1_SRC_CON0,
> +                             UL_SRC_ON_TMP_CTL_SFT, 0,
> +                             mtk_adda_ch34_ul_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),

Same here.

> +       SND_SOC_DAPM_SUPPLY_S("AP_DMIC_EN", SUPPLY_SEQ_ADDA_AP_DMIC,
> +                             AFE_ADDA_UL0_SRC_CON0,
> +                             UL_AP_DMIC_ON_SFT, 0,
> +                             mtk_adda_ul_ap_dmic_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),

Same here.

> +       SND_SOC_DAPM_SUPPLY_S("AP_DMIC_CH34_EN", SUPPLY_SEQ_ADDA_AP_DMIC,
> +                             AFE_ADDA_UL1_SRC_CON0,
> +                             UL_AP_DMIC_ON_SFT, 0,
> +                             mtk_adda_ch34_ul_ap_dmic_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),

Same here.

> +       SND_SOC_DAPM_SUPPLY_S("ADDA_FIFO", SUPPLY_SEQ_ADDA_FIFO,
> +                             AFE_ADDA_UL0_SRC_CON1,
> +                             FIFO_SOFT_RST_SFT, 1,
> +                             NULL, 0),
> +       SND_SOC_DAPM_SUPPLY_S("ADDA_CH34_FIFO", SUPPLY_SEQ_ADDA_FIFO,
> +                             AFE_ADDA_UL1_SRC_CON1,
> +                             FIFO_SOFT_RST_SFT, 1,
> +                             NULL, 0),
> +       SND_SOC_DAPM_MUX("ADDA_UL_Mux", SND_SOC_NOPM, 0, 0,
> +                        &adda_ul_mux_control),
> +       SND_SOC_DAPM_MUX("ADDA_CH34_UL_Mux", SND_SOC_NOPM, 0, 0,
> +                        &adda_ch34_ul_mux_control),
> +       SND_SOC_DAPM_INPUT("AP_DMIC_INPUT"),
> +       SND_SOC_DAPM_INPUT("AP_DMIC_CH34_INPUT"),
> +};
> +
> +static const struct snd_soc_dapm_route mtk_dai_adda_routes[] =3D {
> +       /* capture */
> +       {"ADDA_UL_Mux", "MTKAIF", "ADDA Capture"},
> +       {"ADDA_UL_Mux", "AP_DMIC", "AP DMIC Capture"},
> +       {"ADDA_UL_Mux", "AP_DMIC_MULTI_CH", "AP DMIC MULTICH Capture"},
> +       {"ADDA_CH34_UL_Mux", "MTKAIF", "ADDA CH34 Capture"},
> +       {"ADDA_CH34_UL_Mux", "AP_DMIC", "AP DMIC CH34 Capture"},
> +       {"ADDA_CH34_UL_Mux", "AP_DMIC_MULTI_CH", "AP DMIC MULTICH Capture=
"},
> +
> +       {"AP DMIC Capture", NULL, "ADDA Enable"},
> +       {"AP DMIC Capture", NULL, "ADDA Capture Enable"},

Since "ADDA Enable" is the overall enable bit for the whole block,
you could just have the route point from "ADDA Enable" to "ADDA Capture
Enable". This also solves the sequencing order.

> +       {"AP DMIC Capture", NULL, "ADDA_FIFO"},
> +       {"AP DMIC Capture", NULL, "AP_DMIC_EN"},
> +
> +       {"AP DMIC CH34 Capture", NULL, "ADDA Enable"},
> +       {"AP DMIC CH34 Capture", NULL, "ADDA CH34 Capture Enable"},

Same here.

> +       {"AP DMIC CH34 Capture", NULL, "ADDA_CH34_FIFO"},
> +       {"AP DMIC CH34 Capture", NULL, "AP_DMIC_CH34_EN"},
> +
> +       {"AP DMIC MULTICH Capture", NULL, "ADDA Enable"},
> +       {"AP DMIC MULTICH Capture", NULL, "ADDA Capture Enable"},
> +       {"AP DMIC MULTICH Capture", NULL, "ADDA CH34 Capture Enable"},
> +       {"AP DMIC MULTICH Capture", NULL, "ADDA_FIFO"},
> +       {"AP DMIC MULTICH Capture", NULL, "ADDA_CH34_FIFO"},
> +       {"AP DMIC MULTICH Capture", NULL, "AP_DMIC_EN"},
> +       {"AP DMIC MULTICH Capture", NULL, "AP_DMIC_CH34_EN"},

Nit: I'd add an empty line here for separation.

> +       {"AP DMIC Capture", NULL, "AP_DMIC_INPUT"},
> +       {"AP DMIC CH34 Capture", NULL, "AP_DMIC_CH34_INPUT"},
> +       {"AP DMIC MULTICH Capture", NULL, "AP_DMIC_INPUT"},
> +};
> +
> +/* dai ops */
> +static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
> +                                 struct snd_pcm_hw_params *params,
> +                                 struct snd_soc_dai *dai)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       unsigned int rate =3D params_rate(params);
> +       unsigned int mtkaif_rate =3D 0;
> +       int id =3D dai->id;
> +       struct mtk_afe_adda_priv *adda_priv;
> +
> +       if (id >=3D MT8196_DAI_NUM || id < 0)
> +               return -EINVAL;
> +
> +       adda_priv =3D afe_priv->dai_priv[id];
> +
> +       dev_info(afe->dev, "id %d, stream %d, rate %d\n",
> +                id,
> +                substream->stream,
> +                rate);

dev_dbg() please.

> +
> +       if (!adda_priv)
> +               return -EINVAL;
> +
> +       if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {

I suggest moving each block (playback and capture) into smaller functions.
That way each function is easier to read, and the indentation is decreased.

> +               adda_priv->dl_rate =3D rate;
> +
> +               /* get mtkaif dl rate */
> +               mtkaif_rate =3D
> +                       mtkaif_rate_transform(afe, adda_priv->dl_rate);

This should fit on one line.

> +               if (id =3D=3D MT8196_DAI_ADDA) {
> +                       /* MTKAIF sample rate config */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_TXIF_INPUT_MODE_MASK_=
SFT,
> +                                          mtkaif_rate << MTKAIFV4_TXIF_I=
NPUT_MODE_SFT);
> +                       /* AFE_ADDA_MTKAIFV4_TX_CFG0 */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_TXIF_FOUR_CHANNEL_MAS=
K_SFT,
> +                                          0x0 << MTKAIFV4_TXIF_FOUR_CHAN=
NEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_ADDA_OUT_EN_SEL_MASK_=
SFT,
> +                                          0x1 << MTKAIFV4_ADDA_OUT_EN_SE=
L_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_ADDA6_OUT_EN_SEL_MASK=
_SFT,
> +                                          0x1 << MTKAIFV4_ADDA6_OUT_EN_S=
EL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_TXIF_V4_MASK_SFT,
> +                                          0x1 << MTKAIFV4_TXIF_V4_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_TX_CFG0,
> +                                          MTKAIFV4_TXIF_EN_SEL_MASK_SFT,
> +                                          0x0 << MTKAIFV4_TXIF_EN_SEL_SF=
T);
> +                       /* clean predistortion */
> +               } else {
> +                       /* MTKAIF sample rate config */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_TX_CFG0,
> +                                          ADDA6_MTKAIFV4_TXIF_INPUT_MODE=
_MASK_SFT,
> +                                          mtkaif_rate << ADDA6_MTKAIFV4_=
TXIF_INPUT_MODE_SFT);
> +                       /* AFE_ADDA6_MTKAIFV4_TX_CFG0 */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_TX_CFG0,
> +                                          ADDA6_MTKAIFV4_TXIF_FOUR_CHANN=
EL_MASK_SFT,
> +                                          0x0 << ADDA6_MTKAIFV4_TXIF_FOU=
R_CHANNEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_TX_CFG0,
> +                                          ADDA6_MTKAIFV4_TXIF_EN_SEL_MAS=
K_SFT,
> +                                          0x1 << ADDA6_MTKAIFV4_TXIF_EN_=
SEL_SFT);
> +               }
> +       } else {
> +               unsigned int voice_mode =3D 0;
> +               unsigned int ul_src_con0 =3D 0;   /* default value */
> +
> +               adda_priv->ul_rate =3D rate;
> +
> +               /* get mtkaif dl rate */
> +               mtkaif_rate =3D
> +                       mtkaif_rate_transform(afe, adda_priv->ul_rate);

This fits in one line. No need to wrap the line.

> +
> +               voice_mode =3D adda_ul_rate_transform(afe, rate);
> +
> +               ul_src_con0 |=3D (voice_mode << 17) & (0x7 << 17);

There should be macros for the shift and mask?

> +
> +               /* enable iir */
> +               ul_src_con0 |=3D (1 << UL_IIR_ON_TMP_CTL_SFT) &
> +                               UL_IIR_ON_TMP_CTL_MASK_SFT;
> +               ul_src_con0 |=3D (UL_IIR_SW << UL_IIRMODE_CTL_SFT) &
> +                               UL_IIRMODE_CTL_MASK_SFT;
> +
> +               regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4_RX_CFG0=
,
> +                                  MTKAIFV4_RXIF_INPUT_MODE_MASK_SFT,
> +                                  mtkaif_rate << MTKAIFV4_RXIF_INPUT_MOD=
E_SFT);
> +
> +               regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV4_RX_CFG=
0,
> +                                  ADDA6_MTKAIFV4_RXIF_INPUT_MODE_MASK_SF=
T,
> +                                  mtkaif_rate << ADDA6_MTKAIFV4_RXIF_INP=
UT_MODE_SFT);
> +
> +               switch (id) {
> +               case MT8196_DAI_ADDA:
> +               case MT8196_DAI_AP_DMIC:
> +               case MT8196_DAI_AP_DMIC_MULTICH:
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_RXIF_INPUT_MODE_MASK_=
SFT,
> +                                          mtkaif_rate << MTKAIFV4_RXIF_I=
NPUT_MODE_SFT);
> +                       /* AFE_ADDA_MTKAIFV4_RX_CFG0 */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_RXIF_FOUR_CHANNEL_MAS=
K_SFT,
> +                                          0x1 << MTKAIFV4_RXIF_FOUR_CHAN=
NEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_RXIF_EN_SEL_MASK_SFT,
> +                                          0x0 << MTKAIFV4_RXIF_EN_SEL_SF=
T);
> +                       /* [28] loopback mode
> +                        * 0: loopback adda tx to adda rx
> +                        * 1: loopback adda6 tx to adda rx
> +                        */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_TXIF_EN_SEL_MASK_SFT,
> +                                          0x0 << MTKAIFV4_TXIF_EN_SEL_SF=
T);
> +
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_UL_CH1CH2_IN_EN_SEL_M=
ASK_SFT,
> +                                          0x1 << MTKAIFV4_UL_CH1CH2_IN_E=
N_SEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_UL_CH3CH4_IN_EN_SEL_M=
ASK_SFT,
> +                                          0x1 << MTKAIFV4_UL_CH3CH4_IN_E=
N_SEL_SFT);
> +
> +                       /* 35Hz @ 48k */
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_02_01, 0x00000=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_04_03, 0x00003=
FB8);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_06_05, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_08_07, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_10_09, 0x0000C=
048);
> +
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_SRC_CON0, ul_src_con0);
> +
> +                       /* mtkaif_rxif_data_mode =3D 0, amic */
> +                       regmap_update_bits(afe->regmap,
> +                                          AFE_MTKAIF1_RX_CFG0,
> +                                          0x1 << 0,
> +                                          0x0 << 0);
> +
> +                       /* 35Hz @ 48k */
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_IIR_COEF_02_01, 0x00000=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_IIR_COEF_04_03, 0x00003=
FB8);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_IIR_COEF_06_05, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_IIR_COEF_08_07, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_IIR_COEF_10_09, 0x0000C=
048);
> +
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL0_SRC_CON0, ul_src_con0);
> +
> +                       /* mtkaif_rxif_data_mode =3D 0, amic */
> +                       regmap_update_bits(afe->regmap,
> +                                          AFE_MTKAIF0_RX_CFG0,
> +                                          0x1 << 0,
> +                                          0x0 << 0);
> +                       break;
> +               case MT8196_DAI_ADDA_CH34:
> +               case MT8196_DAI_AP_DMIC_CH34:
> +                       /* AFE_ADDA_MTKAIFV4_RX_CFG0 */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_RXIF_FOUR_CHANNEL_MAS=
K_SFT,
> +                                          0x1 << MTKAIFV4_RXIF_FOUR_CHAN=
NEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_RXIF_EN_SEL_MASK_SFT,
> +                                          0x0 << MTKAIFV4_RXIF_EN_SEL_SF=
T);
> +
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_UL_CH1CH2_IN_EN_SEL_M=
ASK_SFT,
> +                                          0x1 << MTKAIFV4_UL_CH1CH2_IN_E=
N_SEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_UL_CH3CH4_IN_EN_SEL_M=
ASK_SFT,
> +                                          0x1 << MTKAIFV4_UL_CH3CH4_IN_E=
N_SEL_SFT);
> +
> +                       /* 35Hz @ 48k */
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_02_01, 0x00000=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_04_03, 0x00003=
FB8);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_06_05, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_08_07, 0x3FB80=
000);
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_IIR_COEF_10_09, 0x0000C=
048);
> +
> +                       regmap_write(afe->regmap,
> +                                    AFE_ADDA_UL1_SRC_CON0, ul_src_con0);
> +
> +                       /* mtkaif_rxif_data_mode =3D 0, amic */
> +                       regmap_update_bits(afe->regmap,
> +                                          AFE_MTKAIF1_RX_CFG0,
> +                                          0x1 << 0,
> +                                          0x0 << 0);
> +
> +                       break;
> +               case MT8196_DAI_ADDA_CH56:
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_RX_CFG0,
> +                                          ADDA6_MTKAIFV4_RXIF_INPUT_MODE=
_MASK_SFT,
> +                                          mtkaif_rate << ADDA6_MTKAIFV4_=
RXIF_INPUT_MODE_SFT);
> +                       /* AFE_ADDA6_MTKAIFV4_RX_CFG0 */
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_RX_CFG0,
> +                                          ADDA6_MTKAIFV4_RXIF_FOUR_CHANN=
EL_MASK_SFT,
> +                                          0x1 << ADDA6_MTKAIFV4_RXIF_FOU=
R_CHANNEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_MTKAIFV4=
_RX_CFG0,
> +                                          MTKAIFV4_UL_CH5CH6_IN_EN_SEL_M=
ASK_SFT,
> +                                          0x1 << MTKAIFV4_UL_CH5CH6_IN_E=
N_SEL_SFT);
> +                       regmap_update_bits(afe->regmap, AFE_ADDA6_MTKAIFV=
4_RX_CFG0,
> +                                          ADDA6_MTKAIFV4_RXIF_EN_SEL_MAS=
K_SFT,
> +                                          0x1 << ADDA6_MTKAIFV4_RXIF_EN_=
SEL_SFT);
> +                       break;
> +               default:
> +                       break;
> +               }
> +
> +               /* ap dmic */
> +               switch (id) {
> +               case MT8196_DAI_AP_DMIC:
> +               case MT8196_DAI_AP_DMIC_CH34:
> +                       mtk_adda_ul_src_dmic(afe, id);
> +                       break;
> +               case MT8196_DAI_AP_DMIC_MULTICH:
> +                       regmap_update_bits(afe->regmap, AFE_ADDA_ULSRC_PH=
ASE_CON1,
> +                                          DMIC_CLK_PHASE_SYNC_SET_MASK_S=
FT,
> +                                          0x1 << DMIC_CLK_PHASE_SYNC_SET=
_SFT);
> +                       mtk_adda_ul_src_dmic_phase_sync(afe);
> +                       mtk_adda_ul_src_dmic(afe, MT8196_DAI_AP_DMIC);
> +                       mtk_adda_ul_src_dmic(afe, MT8196_DAI_AP_DMIC_CH34=
);
> +                       mtk_adda_ul_src_dmic_phase_sync_clock(afe);
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_dai_ops mtk_dai_adda_ops =3D {
> +       .hw_params =3D mtk_dai_adda_hw_params,
> +};
> +
> +/* dai driver */
> +#define MTK_ADDA_PLAYBACK_RATES (SNDRV_PCM_RATE_8000_48000 |\
> +                                SNDRV_PCM_RATE_96000 |\
> +                                SNDRV_PCM_RATE_192000)
> +
> +#define MTK_ADDA_CAPTURE_RATES (SNDRV_PCM_RATE_8000 |\
> +                               SNDRV_PCM_RATE_16000 |\
> +                               SNDRV_PCM_RATE_32000 |\
> +                               SNDRV_PCM_RATE_48000 |\
> +                               SNDRV_PCM_RATE_96000 |\
> +                               SNDRV_PCM_RATE_192000)
> +
> +#define MTK_ADDA_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> +                         SNDRV_PCM_FMTBIT_S24_LE |\
> +                         SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static struct snd_soc_dai_driver mtk_dai_adda_driver[] =3D {
> +       {
> +               .name =3D "ADDA",
> +               .id =3D MT8196_DAI_ADDA,
> +               .playback =3D {
> +                       .stream_name =3D "ADDA Playback",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_PLAYBACK_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .capture =3D {
> +                       .stream_name =3D "ADDA Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },
> +       {
> +               .name =3D "ADDA_CH34",
> +               .id =3D MT8196_DAI_ADDA_CH34,
> +               .playback =3D {
> +                       .stream_name =3D "ADDA CH34 Playback",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_PLAYBACK_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .capture =3D {
> +                       .stream_name =3D "ADDA CH34 Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },
> +       {
> +               .name =3D "ADDA_CH56",
> +               .id =3D MT8196_DAI_ADDA_CH56,
> +               .capture =3D {
> +                       .stream_name =3D "ADDA CH56 Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },
> +       {
> +               .name =3D "AP_DMIC",
> +               .id =3D MT8196_DAI_AP_DMIC,
> +               .capture =3D {
> +                       .stream_name =3D "AP DMIC Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },
> +       {
> +               .name =3D "AP_DMIC_CH34",
> +               .id =3D MT8196_DAI_AP_DMIC_CH34,
> +               .capture =3D {
> +                       .stream_name =3D "AP DMIC CH34 Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 2,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },
> +       {
> +               .name =3D "AP_DMIC_MULTICH",
> +               .id =3D MT8196_DAI_AP_DMIC_MULTICH,
> +               .capture =3D {
> +                       .stream_name =3D "AP DMIC MULTICH Capture",
> +                       .channels_min =3D 1,
> +                       .channels_max =3D 4,
> +                       .rates =3D MTK_ADDA_CAPTURE_RATES,
> +                       .formats =3D MTK_ADDA_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_adda_ops,
> +       },

I think this is a weird setup. AFAIK there is only one ADDA, but here
it is expanded into 6 backend DAIs for different setups. However only
one is actually usable: enabling a second one would clobber the hardware
configuration setup by the first one. This seems very fragile.

> +};
> +
> +static int init_adda_priv_data(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_adda_priv *adda_priv;
> +       static const int adda_dai_list[] =3D {
> +               MT8196_DAI_ADDA,
> +               MT8196_DAI_ADDA_CH34,
> +               MT8196_DAI_ADDA_CH56,
> +               MT8196_DAI_AP_DMIC_MULTICH
> +       };
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(adda_dai_list); i++) {
> +               adda_priv =3D devm_kzalloc(afe->dev,
> +                                        sizeof(struct mtk_afe_adda_priv)=
,
> +                                        GFP_KERNEL);
> +               if (!adda_priv)
> +                       return -ENOMEM;
> +
> +               afe_priv->dai_priv[adda_dai_list[i]] =3D adda_priv;
> +       }
> +
> +       /* ap dmic priv share with adda */
> +       afe_priv->dai_priv[MT8196_DAI_AP_DMIC] =3D
> +               afe_priv->dai_priv[MT8196_DAI_ADDA];
> +       afe_priv->dai_priv[MT8196_DAI_AP_DMIC_CH34] =3D
> +               afe_priv->dai_priv[MT8196_DAI_ADDA_CH34];
> +
> +       return 0;
> +}
> +
> +int mt8196_dai_adda_register(struct mtk_base_afe *afe)
> +{
> +       struct mtk_base_afe_dai *dai;
> +
> +       dai =3D devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +       if (!dai)
> +               return -ENOMEM;
> +
> +       list_add(&dai->list, &afe->sub_dais);

The DAI should be added to the list only if everything succeeds.


ChenYu

> +       dai->dai_drivers =3D mtk_dai_adda_driver;
> +       dai->num_dai_drivers =3D ARRAY_SIZE(mtk_dai_adda_driver);
> +
> +       dai->controls =3D mtk_adda_controls;
> +       dai->num_controls =3D ARRAY_SIZE(mtk_adda_controls);
> +       dai->dapm_widgets =3D mtk_dai_adda_widgets;
> +       dai->num_dapm_widgets =3D ARRAY_SIZE(mtk_dai_adda_widgets);
> +       dai->dapm_routes =3D mtk_dai_adda_routes;
> +       dai->num_dapm_routes =3D ARRAY_SIZE(mtk_dai_adda_routes);
> +
> +       return init_adda_priv_data(afe);
> +}
> +
> --
> 2.45.2
>
>

