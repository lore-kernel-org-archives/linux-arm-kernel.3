Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB2CC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=; b=mIwwh12bJ6ilaIeyyTyhLfyUer
	q2+8MoXk3300r5qQjvz71bfV0qmmjViXyJ7Go0QTJuWubGQNqlVMGywg7osiLaLG2lWjWPRNLxi+p
	wKKNAzqLbedS5031nV5FC5WXfYRCNsdkTlBQSj5C9Gf+x3OAkFW+hF8IpKgtBTf/mwukEMExecKUd
	Fd+0bhnqaD5jKggD4S7188L1UVHbvRYVmiqA9h2/4r86YLtJ5I5vtvjRmjbSKBw4+IPo/ch5IHqqb
	WcDkYmAIIvXiEon0TZu4nQKYzDTX86cJS+WT6Vt67PtKCExOdL+M4EEthwwPe59xuKBQzq936sA0S
	nnQp+ruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5RT-00000001KAZ-3scq;
	Tue, 22 Jul 2025 05:21:31 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Ow-00000001JwK-0UBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 05:18:55 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso42707951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753161531; x=1753766331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=;
        b=GOKsWYC7pe7sE0Ia5/+O2YxDDbCCM6AQkdCXr/6+AmZdRReRdh/Zh+jAV4DcF92zA/
         eR1RqlWTSDE/AaAj2NsuOYCQSt9EMaqBkmBr4FxuUHDl6YgYB/mlwmDHBrKjNv5sPTbW
         FiJFCdeTWxvDLzH6mdjt+wy/u+KraFZ93vXHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753161531; x=1753766331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=;
        b=CD70IQxijb1AuL8Kdldp3lSvbhOqhcZIexnvPrNF4Vrw2Lw7YAuaQ0ogc1aYPUzR5Y
         hvxm2nGBPaXlTjulnyHiGqgdGachVZ97GsNm3ZPRdTfE2DwI6eHYelkR93lCJsKjbPAm
         v4Fpu2af8h9FTmLgM74UIGyqBTZojsNEB7+C1ypQNxjj3Luub4RqmpmLl7up5bPyFsZq
         LxftrYFZEgFbeZPk0FjwjONfbRR9zfuHwU124eYM06CmJ+R2aYbfFv5Tl1IBtp+ZXm2Q
         L/bphh7rULl81O76QfBge4fb8LtbuF6BoVEsemHKyO1Zed5L9oNwooWG6z+GjAX53VwC
         XWug==
X-Forwarded-Encrypted: i=1; AJvYcCUOa2cwbSedZdHpf6dd76usGvosGlNAbtvD+htkRuK52jCFeRH4F+FqGBHlFLiAvlhaVPFCxSfBFBVkPDoxK/hB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwd8Dhc4yCFXBdpt2GglRcX5OrYTfux9qiVwsbFngv/ZsGXAbi
	us+CA7lVhVf3TMRIrfNA1RTmA97uymcwrJco34nqvVBGktI88a79o4ciDpoKNfIhYYKyK8nRbBH
	SxM99npmZT57qvSsdXrc/Dn0ZtZaoPqtTGaPc1UpJ
X-Gm-Gg: ASbGncuUKkDyLNecf8+tGuSD6vuYuAsXJ4VBIbWtC5pzJwsFTVsGAYpFvq48RubWLqv
	NFgUweX4555sMfX0EcOFri+nd35ka6G0jSA+bZjaG6+1siXuSdcApyIgpzrfICMXyEomjGHCJB4
	GGen+zLDZLKZ+EAWIMzu7a71dvZCp9mb5+cp6xa0m76k4fBdCfbwlbIeWVdyijTbYmlJY6YlAPV
	hn2QHwwq0qXlNcJDvTdIe+2jkC2TpQjS50=
X-Google-Smtp-Source: AGHT+IHXtp8/VRaNj5ad5vofsP+NxzY4Q7oTBNoQECt/CXJUr6VzTFYU6ZxOTJqcdAuOysJwJg5n/tSQs5v+X4qLoE4=
X-Received: by 2002:a2e:a984:0:b0:32b:7ddd:278d with SMTP id
 38308e7fff4ca-3309a466439mr46938661fa.3.1753161531420; Mon, 21 Jul 2025
 22:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com> <20250715140224.206329-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 13:18:40 +0800
X-Gm-Features: Ac12FXxOEwd1JP0Dvkx8jUbcy4EUYQzj1kXlmFlLaoGVbfWV7CBCgyEc3biTeW0
Message-ID: <CAGXv+5GiKOTqmaJai-494XWDqk+onvrpqFyvwANr+_4_y-1WuA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_221854_168931_8B82B70C 
X-CRM114-Status: GOOD (  27.05  )
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

On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver for the regulators found on all types of the MediaTek
> MT6316 SPMI PMIC, fully controlled by SPMI interface and featuring
> four step down DCDC (buck) converters.
>
> In particular, this includes support for:
>  - MT6316(BP/VP):    2+2 Phase (Phase 1: buck1+2, Phase 2: buck3+4)
>  - MT6316(CP/HP/KP): 3+1 Phase (Phase 1: buck1+2+4, Phase 2: buck3)
>  - MT6316(DP/TP):    4+0 Phase (Single phase, buck1+2+3+4)

You should probably mention here or in the driver with comments that
some parts are not described in the datasheet, or even contradict what
the datasheet says. Examples include:

  - set / clear registers for the enable bits
  - voltage selector being in weird format

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/regulator/Kconfig            |   9 +
>  drivers/regulator/Makefile           |   1 +
>  drivers/regulator/mt6316-regulator.c | 345 +++++++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 7423954153b0..81f2acd0f960 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -864,6 +864,15 @@ config REGULATOR_MT6315
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6316
> +       tristate "MT6316 SPMI PMIC regulator driver"
> +       depends on SPMI || COMPILE_TEST
> +       help
> +          Say Y here to enable support for 2+2, 3+1 and 4 phase regulato=
rs
> +          found in the MediaTek MT6316 BP, CP, DP, HP, VP and TP SPMI PM=
ICs.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6323
>         tristate "MediaTek MT6323 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index be98b29d6675..46c0e75f6107 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MP886X) +=3D mp886x.o
>  obj-$(CONFIG_REGULATOR_MPQ7920) +=3D mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) +=3D mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6315) +=3D mt6315-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6315)  +=3D mt6316-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) +=3D mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6331) +=3D mt6331-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6332) +=3D mt6332-regulator.o
> diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6=
316-regulator.c
> new file mode 100644
> index 000000000000..952852bbe923
> --- /dev/null
> +++ b/drivers/regulator/mt6316-regulator.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 MediaTek Inc.
> +// Copyright (c) 2025 Collabora Ltd
> +//                    AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/spmi.h>
> +
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define MT6316_BUCK_MODE_AUTO                  0
> +#define MT6316_BUCK_MODE_FORCE_PWM             1
> +#define MT6316_BUCK_MODE_LP                    2
> +
> +#define MT6316_CHIP_ID                         0x20b
> +#define MT6316_BUCK_TOP_CON0                   0x1440
> +#define EN_SET_OFFSET                          0x1
> +#define EN_CLR_OFFSET                          0x2
> +
> +#define MT6316_BUCK_TOP_CON1                   0x1443
> +
> +#define MT6316_BUCK_TOP_ELR0                   0x1448
> +#define MT6316_BUCK_TOP_ELR2                   0x144a
> +#define MT6316_BUCK_TOP_ELR4                   0x144c
> +#define MT6316_BUCK_TOP_ELR6                   0x144e
> +#define MT6316_VSEL_MASK                       GENMASK(8, 0)
> +
> +#define MT6316_VBUCK1_DBG                      0x14a8
> +#define MT6316_VBUCK2_DBG                      0x1528
> +#define MT6316_VBUCK3_DBG                      0x15a8
> +#define MT6316_VBUCK4_DBG                      0x1628
> +#define MT6316_BUCK_QI                         BIT(0)
> +
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0    0x1688
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0       0x1690
> +
> +enum mt6316_type {
> +       MT6316_TYPE_2PHASE,
> +       MT6316_TYPE_3PHASE,
> +       MT6316_TYPE_4PHASE
> +};
> +
> +/**
> + * struct mt6316_regulator_info - MT6316 regulators information
> + * @desc: Regulator description structure
> + * @debug_reg: Debug register for regulator status
> + * @lp_mode_reg: Low Power mode register (normal/idle)
> + * @lp_mode_mask: Low Power mode regulator mask
> + * @modeset_reg: AUTO/PWM mode register
> + * @modeset_mask: AUTO/PWM regulator mask
> + */
> +struct mt6316_regulator_info {
> +       struct regulator_desc desc;
> +       u16 debug_reg;
> +       u16 lp_mode_reg;
> +       u16 lp_mode_mask;
> +       u16 modeset_reg;
> +       u16 modeset_mask;
> +};
> +
> +#define MT6316_BUCK(match, vreg_id, min, max, step, vs_reg)            \
> +{                                                                      \
> +       .desc =3D {                                                      =
 \
> +               .name =3D match,                                         =
 \

.supply_name should probably be added for completeness.

> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6316_vreg_setclr_ops,                        =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D (max - min) / step + 1,                  =
 \
> +               .min_uV =3D min,                                         =
 \
> +               .uV_step =3D step,                                       =
 \

Given that the selector _always_ starts from 0 volts, I think this
should have:

                  .linear_min_sel =3D min / step,

So that different minimum values work. Or the minimum value should just
be dropped altogether to prevent miscalculation.

See below for more.

[...]

> +/* MT6316BP/VP - 2+2 phase buck */
> +static struct mt6316_regulator_info mt6316bv_regulators[] =3D {
> +       MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0)=
,

I just noticed that the overview section of the datasheet mentions that
the lowest voltage is 0.4V for all the regulators.


ChenYu

[...]

