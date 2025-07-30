Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B1F4C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCwMDWtoJ6H58L5kBL4cwqw2CDwhxml2txAA6EJBzFE=; b=B4/dbwU5DVFMi6qYj6XpOAm+mw
	6Fer00HDD3ySC7Jt/lHkDKYHJgd9AvGUSiaV2LULI4fttYLnEkIvVqeUptJhPmnmID6N65Kzd8rmL
	GfStVtgiBWSxG3uZZfKTLH+/uGMW4OBDEOa1H0e8nr/gUyAPCA9lrv/ErP6ft5tH4qRw46rPDTKJj
	EJZ9S1WB7NmyMw5mKgbDuTqHMF34qdn6n3mBqrUid12DDTzLJogvBm4+A0lZh5H1Xxl73kFWfRpC2
	LQIpJ0Oj4wqtsEqwUPyj82+cgQo4w4ZT0z38ICvhXUJ8zHj4WpMY9XWaJsrCJrgsTVz+tPNjIBBpU
	4W78nyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2RL-000000011LG-1J6m;
	Wed, 30 Jul 2025 08:45:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh2Or-0000000116n-2OVs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:43:02 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-558f7fda97eso5417327e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753864980; x=1754469780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCwMDWtoJ6H58L5kBL4cwqw2CDwhxml2txAA6EJBzFE=;
        b=RMzPIU4sOF2KhYoBJmNV/yKI5jkd8IO/R42HuUvkTE7I4qD5+BwUFUmpheqwC6iEvB
         aNbZVQdb5sUmWrvwe16c0cvPmCyb+Ugm+NpJZfrbKHb8no8mm5PsxLUbjSpfj4MtFXGG
         C5fFOQm2ga/aH4MWcD5Tb4TidPJeJkbF/MI9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864980; x=1754469780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCwMDWtoJ6H58L5kBL4cwqw2CDwhxml2txAA6EJBzFE=;
        b=XxbdeHx4VgGxD2kWlV1unNmfC/BOmMv6aDS2LhcEXLPdRhNGPzJ8q+iQk9AvKbl0eC
         WgMUb6BiV4QdnE274yYHkjSTxoskUtfkGm9tHh2tnVqPmPN+KfZPd7IquJVc4wO5VDZN
         zke6JTzuHPNgJsghVS78dbhddJ1uXf8/mn3ExMIU5ua2NEvqD3VqWXurFewFP71cpnHi
         lRSs/oajjAUGLZLRsd122R0BWZANDIDojYmZ1LFeCJ68x23vbmjyK334Z+ltU1EOBDOS
         gouAoOyM0z18XkblVl47r+JGD6w9+XHWENWruvBQLd93TjhcfcbLUD/1YdQiDyLH4SSi
         eg1w==
X-Forwarded-Encrypted: i=1; AJvYcCXSexO4WgAX4l25q9qJK7fRwZaH5GlIrIM6XqJm/39TB592osKjXY2tlmhqkzQWVu0cneoAf8zkUxQyylYlDfU8@lists.infradead.org
X-Gm-Message-State: AOJu0YwNudFn05tsIHeIBreDg/Do6FcDkJfdeE+7Gg/qo+QonEaIQUGu
	Ss9gz6ui1GaS/rhVTbgpsF/zNSpBHmEoul8uzcSYeXC1pvdTGso8w17O4FjhWmPSYCRGZALrhHa
	vKH2fCM4NBl55s7WC+X3zCoyQYCOo5STr2x5p2IOl
X-Gm-Gg: ASbGncs37mue1U0PDT72QkuAkvIfZM7Do2N5DZSkKSRJFl3fyd4SfrKxf1c4RCFOwp5
	ZkbDlLPrHXF95gIr9PNx1Zcoal8Mg2PEnufciOQWte1VpTOuoZHzG4uqvnkqD4zTyLSj9NOFLkV
	UnUu4mT2hTjnmGTP7isfhgVFOphlzUE2Ivx+CLQWAGqpM2HhbnMgtIzjzzSRKMu+9gctD6XoKfF
	jbrgYl/vox+VQJMNVmKMfvplzHVjlJr15HSqCQDNSLIpw==
X-Google-Smtp-Source: AGHT+IFB/Ct3suqH0gmQXFJmF6MnUkKOGS1aalcnnOjIUVn4PpqF7DlFLlC9o8DP1JFLZSIwsJwu/Elj6xSVQfUrxg0=
X-Received: by 2002:a05:6512:3d94:b0:551:f0ce:80e3 with SMTP id
 2adb3069b0e04-55b7c04363dmr699933e87.25.1753864979699; Wed, 30 Jul 2025
 01:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-4-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-4-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jul 2025 16:42:48 +0800
X-Gm-Features: Ac12FXwg35RUtCHSrQDm77AYEC5EjaDvELreyxlzBmCrHt1OYxQRjmdcvB6QXeE
Message-ID: <CAGXv+5EZ99i74_pTp2wKR1ni28K9fwbqo_67CFXwwiN13DB71w@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] ASoC: mediatek: mt8196: support audio clock control
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
X-CRM114-CacheID: sfid-20250730_014301_681039_3E2ACC21 
X-CRM114-Status: GOOD (  26.53  )
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
> Add audio clock wrapper and audio tuner control.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 728 +++++++++++++++++++++
>  sound/soc/mediatek/mt8196/mt8196-afe-clk.h |  80 +++
>  2 files changed, 808 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/media=
tek/mt8196/mt8196-afe-clk.c
> new file mode 100644
> index 000000000000..00f47b485812
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> @@ -0,0 +1,728 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Please add an empty line here for separation.

> +#include "mt8196-afe-common.h"
> +#include "mt8196-afe-clk.h"
> +
> +static const char *aud_clks[MT8196_CLK_NUM] =3D {
> +       /* vlp clk */
> +       [MT8196_CLK_VLP_MUX_AUDIOINTBUS] =3D "top_aud_intbus",
> +       [MT8196_CLK_VLP_MUX_AUD_ENG1] =3D "top_aud_eng1",
> +       [MT8196_CLK_VLP_MUX_AUD_ENG2] =3D "top_aud_eng2",
> +       [MT8196_CLK_VLP_MUX_AUDIO_H] =3D "top_aud_h",
> +       [MT8196_CLK_VLP_CLK26M] =3D "vlp_clk26m",
> +       /* pll */
> +       [MT8196_CLK_TOP_APLL1_CK] =3D "apll1",
> +       [MT8196_CLK_TOP_APLL2_CK] =3D "apll2",
> +       /* divider */
> +       [MT8196_CLK_TOP_APLL1_D4] =3D "apll1_d4",
> +       [MT8196_CLK_TOP_APLL2_D4] =3D "apll2_d4",
> +       [MT8196_CLK_TOP_APLL12_DIV_I2SIN0] =3D "apll12_div_i2sin0",
> +       [MT8196_CLK_TOP_APLL12_DIV_I2SIN1] =3D "apll12_div_i2sin1",
> +       [MT8196_CLK_TOP_APLL12_DIV_FMI2S] =3D "apll12_div_fmi2s",
> +       [MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M] =3D "apll12_div_tdmout_m",
> +       [MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B] =3D "apll12_div_tdmout_b",
> +       /* mux */
> +       [MT8196_CLK_TOP_MUX_AUD_1] =3D "top_apll1",
> +       [MT8196_CLK_TOP_MUX_AUD_2] =3D "top_apll2",
> +       [MT8196_CLK_TOP_I2SIN0_M_SEL] =3D "top_i2sin0",
> +       [MT8196_CLK_TOP_I2SIN1_M_SEL] =3D "top_i2sin1",
> +       [MT8196_CLK_TOP_FMI2S_M_SEL] =3D "top_fmi2s",
> +       [MT8196_CLK_TOP_TDMOUT_M_SEL] =3D "top_dptx",
> +       [MT8196_CLK_TOP_ADSP_SEL] =3D "top_adsp",
> +       /* top 26m*/
> +       [MT8196_CLK_TOP_CLK26M] =3D "clk26m",
> +};
> +
> +int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
> +{
> +       int ret;
> +
> +       if (clk) {

There's no need to check the validity of the pointer. The clk prepare
and enable APIs can take NULL pointers and become no-ops.

> +               ret =3D clk_prepare_enable(clk);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to enable clk\n");

This should be a visible error.

> +                       return ret;
> +               }
> +       } else {
> +               dev_dbg(afe->dev, "NULL clk\n");
> +       }
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt8196_afe_enable_clk);
> +
> +void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
> +{
> +       if (clk)
> +               clk_disable_unprepare(clk);
> +       else
> +               dev_dbg(afe->dev, "NULL clk\n");
> +}
> +EXPORT_SYMBOL_GPL(mt8196_afe_disable_clk);
> +
> +static int mt8196_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk =
*clk,
> +                                  unsigned int rate)
> +{
> +       int ret;
> +
> +       if (clk) {
> +               ret =3D clk_set_rate(clk, rate);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to set clk rate\n");

This should be a visible error.

> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int mt8196_afe_set_clk_parent(struct mtk_base_afe *afe, struct cl=
k *clk,
> +                                    struct clk *parent)
> +{
> +       int ret;
> +
> +       if (clk && parent) {
> +               ret =3D clk_set_parent(clk, parent);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to set clk parent %d\n"=
, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}

Per our offline discussions, explicitly setting clock parents are not
needed.

> +
> +static unsigned int get_top_cg_reg(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return AUDIO_ENGEN_CON0;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return AUDIO_TOP_CON4;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_mask(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +               return AUDIO_26M_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +               return AUDIO_F3P25M_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +               return AUDIO_APLL1_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return AUDIO_APLL2_EN_ON_MASK_SFT;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +               return CG_AUDIO_HOPPING_CK_MASK_SFT;
> +       case MT8196_CG_AUDIO_F26M_CK:
> +               return CG_AUDIO_F26M_CK_MASK_SFT;
> +       case MT8196_CG_APLL1_CK:
> +               return CG_APLL1_CK_MASK_SFT;
> +       case MT8196_CG_APLL2_CK:
> +               return CG_APLL2_CK_MASK_SFT;
> +       case MT8196_PDN_APLL_TUNER2:
> +               return PDN_APLL_TUNER2_MASK_SFT;
> +       case MT8196_PDN_APLL_TUNER1:
> +               return PDN_APLL_TUNER1_MASK_SFT;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_on_val(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return get_top_cg_mask(cg_type);
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return 0;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_off_val(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return 0;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return get_top_cg_mask(cg_type);
> +       default:
> +               return get_top_cg_mask(cg_type);
> +       }
> +}
> +
> +static int mt8196_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned i=
nt cg_type)
> +{
> +       unsigned int reg =3D get_top_cg_reg(cg_type);
> +       unsigned int mask =3D get_top_cg_mask(cg_type);
> +       unsigned int val =3D get_top_cg_on_val(cg_type);
> +
> +       if (!afe->regmap) {
> +               dev_warn(afe->dev, "skip regmap\n");
> +               return 0;

This should be a fatal error.

> +       }
> +
> +       dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask=
, val);
> +       regmap_update_bits(afe->regmap, reg, mask, val);

Should check the return value, since it could fail because these are set as
volatile registers and cannot be updated in cache-only state.

> +       return 0;
> +}
> +
> +static int mt8196_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned =
int cg_type)
> +{
> +       unsigned int reg =3D get_top_cg_reg(cg_type);
> +       unsigned int mask =3D get_top_cg_mask(cg_type);
> +       unsigned int val =3D get_top_cg_off_val(cg_type);
> +
> +       if (!afe->regmap) {
> +               dev_warn(afe->dev, "skip regmap\n");
> +               return 0;
> +       }
> +
> +       dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask=
, val);
> +       regmap_update_bits(afe->regmap, reg, mask, val);

Same here.

> +
> +       return 0;
> +}
> +
> +static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       dev_dbg(afe->dev, "enable: %d\n", enable);
> +
> +       if (enable) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_TOP_MUX_AUD_1]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_CK]);
> +               if (ret)
> +                       return ret;
> +
> +               /* 180.6336 / 4 =3D 45.1584MHz */
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUD_ENG1]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_D4]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUDIO_H]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUDIO_H],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_CK]);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG1],
> +                                               afe_priv->clk[MT8196_CLK_=
VLP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUD_ENG1]);
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_=
MUX_AUD_1]);
> +               mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_V=
LP_MUX_AUDIO_H],
> +                                         afe_priv->clk[MT8196_CLK_VLP_CL=
K26M]);
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUDIO_H]);
> +       }

We've talked about this offline. FTR there's no need to enable intermediate
clocks. When the leaf clock is enabled, the CCF also enables all connected
parents. There's also no need to set parents explicitly. When the clock
rate of the leaf clock gets set, the CCF will take care to reparent it
or the sub-tree to the most appropriate clock parent.

> +       return 0;
> +}
> +
> +static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       dev_dbg(afe->dev, "enable: %d\n", enable);
> +
> +       if (enable) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_TOP_MUX_AUD_2]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_CK]);
> +               if (ret)
> +                       return ret;
> +
> +               /* 196.608 / 4 =3D 49.152MHz */
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUD_ENG2]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_D4]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUDIO_H]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUDIO_H],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_CK]);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG2],
> +                                               afe_priv->clk[MT8196_CLK_=
VLP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUD_ENG2]);
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_=
MUX_AUD_2]);
> +               mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_V=
LP_MUX_AUDIO_H],
> +                                         afe_priv->clk[MT8196_CLK_VLP_CL=
K26M]);
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUDIO_H]);
> +       }

Same for this function.

> +       return 0;
> +}
> +
> +static int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_M=
UX_AUDIO_H]);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_1]);
> +       if (ret)
> +               goto clk_ck_mux_aud1_err;
> +
> +       ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_1],
> +                                       afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> +       if (ret)
> +               goto clk_ck_mux_aud1_parent_err;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_2]);
> +       if (ret)
> +               goto clk_ck_mux_aud2_err;
> +
> +       ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_2],
> +                                       afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> +       if (ret)
> +               goto clk_ck_mux_aud2_parent_err;
> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);

Same here. There's no need to toggle all the intermediate clocks. And since
everything is getting disabled, what parent is selected shouldn't matter.

> +       return 0;
> +
> +clk_ck_mux_aud2_parent_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> +clk_ck_mux_aud2_err:
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_A=
UD_1],
> +                                 afe_priv->clk[MT8196_CLK_TOP_APLL1_CK])=
;
> +clk_ck_mux_aud1_parent_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> +clk_ck_mux_aud1_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> +
> +       return ret;
> +}
> +
> +static void mt8196_afe_apll_init(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       if (!afe_priv->vlp_ck) {
> +               dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
> +               return;
> +       }
> +
> +       regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_APLL1_TU=
NER_CON0_VALUE);
> +       regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_APLL2_TU=
NER_CON0_VALUE);

Per offline discussion, this should be moved to the vlp clk driver.
This was already mentioned to the clk patch owners in a recent review.

> +}

[...]

> +/* mck */
> +struct mt8196_mck_div {
> +       int m_sel_id;
> +       int div_clk_id;
> +};
> +
> +static const struct mt8196_mck_div mck_div[MT8196_MCK_NUM] =3D {
> +       [MT8196_I2SIN0_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_I2SIN0_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> +       },
> +       [MT8196_I2SIN1_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_I2SIN1_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> +       },
> +       [MT8196_FMI2S_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_FMI2S_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> +       },
> +       [MT8196_TDMOUT_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_TDMOUT_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> +       },
> +       [MT8196_TDMOUT_BCK] =3D {
> +               .m_sel_id =3D -1,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> +       },
> +};

In the upstream clk patch submission, the mux and divider have been
combined. So this part could be simplified a bit. Also...

> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int apll =3D mt8196_get_apll_by_rate(afe, rate);
> +       int apll_clk_id =3D apll =3D=3D MT8196_APLL1 ?
> +                         MT8196_CLK_TOP_MUX_AUD_1 : MT8196_CLK_TOP_MUX_A=
UD_2;
> +       int m_sel_id;
> +       int div_clk_id;
> +       int ret;
> +
> +       dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
> +
> +       if (mck_id >=3D MT8196_MCK_NUM || mck_id < 0)
> +               return -EINVAL;
> +
> +       m_sel_id =3D mck_div[mck_id].m_sel_id;
> +       div_clk_id =3D mck_div[mck_id].div_clk_id;
> +
> +       /* select apll */
> +       if (m_sel_id >=3D 0) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[m_sel_id=
]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[m_se=
l_id],
> +                                               afe_priv->clk[apll_clk_id=
]);

This part would be taken care of by the framework as well. There's no
need to do it explicitly.

> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* enable div, set rate */
> +       if (div_clk_id < 0) {
> +               dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> +               return -EINVAL;
> +       }
> +       if (div_clk_id =3D=3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
> +               rate =3D rate * 16;

                  rate *=3D 16;

> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], r=
ate);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int m_sel_id;
> +       int div_clk_id;
> +
> +       dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
> +
> +       if (mck_id < 0) {
> +               dev_err(afe->dev, "mck_id =3D %d < 0\n", mck_id);
> +               return -EINVAL;
> +       }
> +
> +       m_sel_id =3D mck_div[mck_id].m_sel_id;
> +       div_clk_id =3D mck_div[mck_id].div_clk_id;
> +
> +       if (div_clk_id < 0) {
> +               dev_err(afe->dev, "div_clk_id =3D %d < 0\n",
> +                       div_clk_id);
> +               return -EINVAL;
> +       }
> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
> +
> +       if (m_sel_id >=3D 0)
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
> +
> +       return 0;
> +}
> +
> +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       /* bus clock for AFE external access, like DRAM */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]=
);
> +
> +       /* bus clock for AFE internal access, like AFE SRAM */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
INTBUS]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

If you are setting it to 26M, then it probably doesn't matter what parent
it uses? I would just drop this.

> +       /* enable audio vlp clock source */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
_H]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

Same here.

> +
> +       /* AFE hw clock */
> +       /* IPM2.0: USE HOPPING & 26M */
> +       /* set in the regmap_register_patch */
> +       return 0;
> +}
> +
> +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       /* IPM2.0: Use HOPPING & 26M */
> +       /* set in the regmap_register_patch */
> +
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

There's no point in selecting a parent on a clock that is going to be disab=
led.

> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
OINTBUS]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL=
]);
> +       return 0;
> +}
> +
> +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
> +{
> +       mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
> +       return 0;
> +}
> +
> +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
> +{
> +       mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
> +       return 0;
> +}
> +
> +int mt8196_init_clock(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +       int i =3D 0;
> +
> +       afe_priv->clk =3D devm_kcalloc(afe->dev, MT8196_CLK_NUM, sizeof(*=
afe_priv->clk),
> +                                    GFP_KERNEL);
> +       if (!afe_priv->clk)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < MT8196_CLK_NUM; i++) {
> +               afe_priv->clk[i] =3D devm_clk_get(afe->dev, aud_clks[i]);
> +               if (IS_ERR(afe_priv->clk[i])) {
> +                       dev_err(afe->dev, "devm_clk_get %s fail\n", aud_c=
lks[i]);
> +                       return PTR_ERR(afe_priv->clk[i]);
> +               }
> +       }
> +

> +       afe_priv->vlp_ck =3D syscon_regmap_lookup_by_phandle(afe->dev->of=
_node,
> +                                                          "vlpcksys");
> +       if (IS_ERR(afe_priv->vlp_ck)) {
> +               dev_err(afe->dev, "Cannot find vlpcksys\n");
> +               return PTR_ERR(afe_priv->vlp_ck);
> +       }

As mentioned, the tuner bits will be moved to the clk driver, so this
bit is no longer needed.

> +
> +       mt8196_afe_apll_init(afe);
> +
> +       ret =3D mt8196_afe_disable_apll(afe);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/media=
tek/mt8196/mt8196-afe-clk.h
> new file mode 100644
> index 000000000000..854da3844104
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-clk.h  --  Mediatek MT8196 AFE Clock Control definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#ifndef _MT8196_AFE_CLOCK_CTRL_H_
> +#define _MT8196_AFE_CLOCK_CTRL_H_
> +
> +/* vlp_cksys_clk: 0x1c016000 */
> +#define VLP_APLL1_TUNER_CON0 0x02a4
> +#define VLP_APLL2_TUNER_CON0 0x02a8
> +
> +/* vlp apll1 tuner default value*/
> +#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
> +/* vlp apll2 tuner default value + 1*/
> +#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
> +
> +/* APLL */
> +#define APLL1_W_NAME "APLL1"
> +#define APLL2_W_NAME "APLL2"
> +
> +enum {
> +       MT8196_APLL1 =3D 0,
> +       MT8196_APLL2,
> +};
> +
> +enum {
> +       /* vlp clk */
> +       MT8196_CLK_VLP_MUX_AUDIOINTBUS,
> +       MT8196_CLK_VLP_MUX_AUD_ENG1,
> +       MT8196_CLK_VLP_MUX_AUD_ENG2,
> +       MT8196_CLK_VLP_MUX_AUDIO_H,
> +       MT8196_CLK_VLP_CLK26M,
> +       /* pll */
> +       MT8196_CLK_TOP_APLL1_CK,
> +       MT8196_CLK_TOP_APLL2_CK,
> +       /* divider */
> +       MT8196_CLK_TOP_APLL1_D4,
> +       MT8196_CLK_TOP_APLL2_D4,
> +       MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> +       MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> +       MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> +       MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> +       MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> +       /* mux */
> +       MT8196_CLK_TOP_MUX_AUD_1,
> +       MT8196_CLK_TOP_MUX_AUD_2,
> +       MT8196_CLK_TOP_I2SIN0_M_SEL,
> +       MT8196_CLK_TOP_I2SIN1_M_SEL,
> +       MT8196_CLK_TOP_FMI2S_M_SEL,
> +       MT8196_CLK_TOP_TDMOUT_M_SEL,
> +       MT8196_CLK_TOP_ADSP_SEL,
> +       /* top 26m */
> +       MT8196_CLK_TOP_CLK26M,
> +       MT8196_CLK_NUM,

The list should be reworked based on review comments to the DT bindings
and our offline discussions. Basically only clocks that directly feed
into the hardware, or otherwise have a reason to be referenced should
be listed.


ChenYu

> +};
> +
> +struct mtk_base_afe;
> +
> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
> +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
> +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
> +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
> +int mt8196_init_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +int mt8196_apll1_enable(struct mtk_base_afe *afe);
> +void mt8196_apll1_disable(struct mtk_base_afe *afe);
> +int mt8196_apll2_enable(struct mtk_base_afe *afe);
> +void mt8196_apll2_disable(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
> +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
> +
> +#endif
> --
> 2.45.2
>
>

