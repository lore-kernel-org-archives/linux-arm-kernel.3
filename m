Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EF5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1r2R6OONrqy2phTDjM24jkvudNKHdg6QD1pSz1RSbE=; b=NZXTJVQy3ARJYggvMNUekNGESG
	jAa9ZeadjG0Ll8PBgk3jPQopLtmE7JllWYqABvXdI0ehfgEQKnArlOG/qXzE1aE30PbkncPFyhnCC
	1Qa+bGr+8ephYHq7/MmLDQZK8giyi252yK1X8vVLt91dTTftOWtP/Iw1cuGJrwaVyCFyMEIzx5ZTO
	kOy7zwy+2g35Mll/i7OB1oNE0GPSaCzLqTAt2mOyGYxCJ9mQgJ3kORoe3GGGdVuRzve5Wf7bj3cHp
	sdJ6+7MsJflUwTVPqb9PZ7NQL2XMGDX29qYga+EMoxhvOmhSE5tRFPSLyLs7o4JSNoQc8ZTu3x6gV
	qKkEbMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh28g-00000000yuB-0iT5;
	Wed, 30 Jul 2025 08:26:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh26A-00000000yaq-2J3p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 08:23:44 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b73f4ead1so1943785e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753863821; x=1754468621; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1r2R6OONrqy2phTDjM24jkvudNKHdg6QD1pSz1RSbE=;
        b=H5ArbLB9sYH2dVmt3Bb/sIoWcTHpO+SWk90baFJeGsf6bW3OcLlNGOONMMrLoidJht
         FsWDvybhEYqP8YUYvuEJJaQpQhvoTSGeXuoZzukKPdl2KLB4W105O9QtqrUp2v2uthyf
         nMZRfQlf8l8xkteqDEG1iYrgrKb8sC7vxW8Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753863821; x=1754468621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1r2R6OONrqy2phTDjM24jkvudNKHdg6QD1pSz1RSbE=;
        b=MLBRXSYF7567wRNpH03FChBU9F9ezxyOrfjoJk7BuYGLPzRyhTrMbyI04jolH+aNoY
         EA+9lWqFbQzSXtjkSmBtz8waWgg9/ULpjCvdeJbruZQkxwViLf/xc+tKCGL2f/ExDCjj
         44CTLSnIvq9Ul7QxxpNjxrkIuk7imOCC43yYHR2v+y53IQwakaN3aruxhOJdowqsZB0g
         gBXKguXlGLrYwbeZxbSvgrjfpkJ/KvYuCtIXFP1IC9LwALN8TOAUW0/ZBs9ZuBYKkoyk
         C05sZNDhbPXkYSg3llS8j2eIs5Fs+xOythFDgZTLAwtuEx72V3DJRfs30enKxdaUonK3
         KBCw==
X-Forwarded-Encrypted: i=1; AJvYcCWdNpOcE0D8yKkUPCHxQcLpb6KCuhuJGv8211j2Sjmg/iMiyEjqhwaMgCIZQ/p3PmBymew45jgY6+ShMIlp9rY6@lists.infradead.org
X-Gm-Message-State: AOJu0YyFeEZ2FiPAHNYjgADbVLEzgDPSRUU3xEf78c5B+vrqksArz7ha
	xuWNtdg2Oe0QKyOzn0l4zArML+DqiQjeJ2tY28e0SgVzT5y58FR03jlx9mjluONmW3kP0zrea9a
	ke16hQnSsFx2czLjnWbIDjB9ZCovBcrPb9fHstJh0
X-Gm-Gg: ASbGncuGrEs7g55CBcpi1bp9A/ygrbK1Na7/b6/sy5HtVtebesZg3Qe3YpKdt/xJJho
	Y+fHAQyR/ExrpJ6UKDOYNvK441+TeWgNyet59STSNz3XA5mbNM7MR3FfnbBhSosMPAHmME1+NvG
	fPASRQoU1OxC9EwsNsZojMirBnG7Ea3yKO0QklnLmNw2sIfbj0Q+yEn4QT6oOfM56WKqlWDhlpw
	IzaekF2I/dWx9GJJ8sy8awvu2N3f2BhZKU=
X-Google-Smtp-Source: AGHT+IFNNgGe2N+Najma2XgK1xBeO1Tq5z4VdOwxsWj1JkHm5nTTq++sDH5npr//Xe7MrxeLpTLuyirVohv+SG9hXog=
X-Received: by 2002:a05:6512:3a81:b0:553:65bc:4232 with SMTP id
 2adb3069b0e04-55b7c06cb83mr858483e87.31.1753863820791; Wed, 30 Jul 2025
 01:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-3-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-3-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jul 2025 16:23:29 +0800
X-Gm-Features: Ac12FXziz9m63a9IuaHiHsS0x7hGxpkPqvcMpJ0GxNVtaytZnTnRhyBsZaU2UF8
Message-ID: <CAGXv+5FiZJqymDfvGO05SNgzSUYAdOwtFCqE0WPGwC5Dwg7OEA@mail.gmail.com>
Subject: Re: [PATCH v6 02/10] ASoC: mediatek: mt8196: add common header
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
X-CRM114-CacheID: sfid-20250730_012342_605321_D45BDEF8 
X-CRM114-Status: GOOD (  23.11  )
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
> Add header files for register definitions and structures.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-afe-common.h |   213 +
>  .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
>  sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
>  3 files changed, 12402 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-common.h b/sound/soc/me=
diatek/mt8196/mt8196-afe-common.h
> new file mode 100644
> index 000000000000..574003a8a2e4
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-common.h
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-common.h  --  Mediatek 8196 audio driver definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#ifndef _MT_8196_AFE_COMMON_H_
> +#define _MT_8196_AFE_COMMON_H_

Add an empty line here for separation.

> +#include <sound/soc.h>
> +#include <sound/pcm.h>
> +#include <linux/clk.h>
> +#include <linux/list.h>
> +#include <linux/regmap.h>
> +#include "mt8196-reg.h"
> +#include "mtk-base-afe.h"

Please add empty lines between each group of headers. Headers are grouped
by path prefix.

Moreover, the contents of these header files are not required in this
header file. Please push these include statements to the files that
actually need them.

For the pointer to struct types, you can just forward declare the struct
types instead of including the whole header file:

    struct clk;
    struct mtk_base_afe;

[...]

> +struct mt8196_afe_private {
> +       struct clk **clk;

> +       struct clk_lookup **lookup;

This doesn't seem to be used.

> +       struct regmap *vlp_ck;

IIRC this will get removed since the tuner values will be moved to the
clk driver.

> +       int irq_cnt[MT8196_MEMIF_NUM];

> +       int dram_resource_counter;

This seems unused. Please remove.

> +
> +       /* xrun assert */
> +       int xrun_assert[MT8196_MEMIF_NUM];

This doesn't seem to do anything. It is initialized to zero and then
never used.

> +
> +       /* dai */
> +       void *dai_priv[MT8196_DAI_NUM];
> +
> +       /* mck */
> +       int mck_rate[MT8196_MCK_NUM];
> +
> +       /* channel merge */
> +       unsigned int cm_rate[CM_NUM];
> +       unsigned int cm_channels;
> +};
> +
> +int mt8196_dai_adda_register(struct mtk_base_afe *afe);
> +int mt8196_dai_i2s_register(struct mtk_base_afe *afe);
> +int mt8196_dai_tdm_register(struct mtk_base_afe *afe);
> +int mt8196_dai_set_priv(struct mtk_base_afe *afe, int id,
> +                       int priv_size, const void *priv_data);

Please add an empty line here.

> +#endif

[...]


ChenYu

