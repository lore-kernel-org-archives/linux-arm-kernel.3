Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C21C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYL0zDoEF8tBEVV2CM33ngyEh5/p8g2bCwVDJFJP1+w=; b=sktbnyAtmhaqIUadk9NGZMEjaA
	m82p1QuO3CNtQjgjeFYPq55wpbE7NHU9VtqE+UJMp29DPPcvWKD3suV+ec/yvwgogzNRYjLDCJljh
	Cftq1MFyD3998Hyt6uhkISW1qYSwjrboIvKcCKc4d3VI3jVA8g/838gvck1o82XLzgHlXpNTPYLSn
	WnSB6YpVwB59p/oAVf10/o6ILaMlUIlucRuiF7APsBN/cV9CkUKF60LxCkVM4GCdJ41r42dm4DSe4
	+da6i0sAR+H5SZl2AYs9YoSYsLgb12I1XOyn4GqyDSKcU02ZzvHFxIyuusqSISZTctR3RHR6QapfE
	DPsye7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUIP4-00000007ZEI-0PjN;
	Wed, 25 Jun 2025 05:10:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUILB-00000007Ywb-2w2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 05:06:35 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55351af2fc6so6299580e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 22:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750827991; x=1751432791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYL0zDoEF8tBEVV2CM33ngyEh5/p8g2bCwVDJFJP1+w=;
        b=TqlfvKopWzIsPOTiKOMVhv2Lx+kOW7zlA3p1KJ/bv3kJDhLM84U4vrYFo9INhZ/Hti
         IHS7rpCMBzsKSzewkjrUZwaJsR3M47CAxEw96yYwlYdj7XBvmD071Vd9A5axUyswkum3
         a6BeMMwb0wtVvdAiWtLORgHFN7l0sw5uoVgY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750827991; x=1751432791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYL0zDoEF8tBEVV2CM33ngyEh5/p8g2bCwVDJFJP1+w=;
        b=NzL6Du8c2WQohYwBtQY8CVowEmBuuph5akNskYjwaA2Aur//4wdUUTsBWXXeKMmZ6D
         r4vuVoaIuNu+5Ews+8SSDyzjIKWrghp4kWCjJo4UmqwtObT6RzMDCOXMF6eJk4RJUFsW
         ihTZUPnKXJ8wgzZqc9Zuc9B45liSU4y4vXFHWkhH2/Z3qqBZZ3neksuQtaj6gexW9B4Y
         npNhF9WkQEs6RBDxqKJDDDpLMTO28g+K5FYYv82bwrp40nRCuzvl5OKB9d+Mow80o6sS
         VRm9CZSXvFYTeUrPGqzHGl9bkftZDsZTBloTxWzdYre16MhUmthx2pp8X7rbQNUryKoJ
         vmKg==
X-Forwarded-Encrypted: i=1; AJvYcCUhSkvU1ceYx/x7XS36We24xrEOBurDh3G9WaJMaJY9kYjHUrL4ZI6vAKTmP2BsoDcmicbfUr56oGriJJqqx6ZV@lists.infradead.org
X-Gm-Message-State: AOJu0YwbS1KDp++dnKwPSh1HyJhRcjAtytFiUXQKyo2Cg4JZGSNklmaq
	Yr3lZIpml4WA87WtHw0WnZ/ZmEbhZIdWI1Bb+wwI4zgtcnPyC6w3pcyj4pVsWXV04JydqfpMwLc
	cBG9tol3D1mgEkyhtBAYhKQ9EQ87ZLF43SXIvKb/H
X-Gm-Gg: ASbGncskqEltdS5Sw/vQMgC2Ava2DKVSY9vGE8/HJeTwfyytmgPd8jaZdN8bzCR4Rhh
	1nwrfXD6PKcNN/4JnBkyQUSn6hDhygSeXX+acn0bT4njq+Y/x8+4sLslz7EI/xjxUF6IrEVfvkc
	y/J8iVuj+k1QZ15FQMHFjaT8itqWdvespt2S8NJVHBIFJbNuMNjIgV7eH2p37LXT1sXfC4Pw==
X-Google-Smtp-Source: AGHT+IEPnjDPdzCHrxS9FLolva0rhORMM3QulXsmJfUCrp8Q42wqK3RvPIsJ5XM2NL3tU4k3s1Ue9EkMUcYihQ9AaGg=
X-Received: by 2002:a05:6512:b97:b0:553:2f57:f8af with SMTP id
 2adb3069b0e04-554fdce9e0dmr449486e87.20.1750827991225; Tue, 24 Jun 2025
 22:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com> <20250624073548.29732-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250624073548.29732-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Jun 2025 13:06:20 +0800
X-Gm-Features: Ac12FXzHd-cnN4TUsA_r-2fnEM30GQ1asEGL9sR_0RQ8CDW8gNp231ivBudzbiA
Message-ID: <CAGXv+5G-s6+sF-PS0iywC5uxMkrfH1FskWG_HcHAi_tfuHWtZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_220633_769265_F2D5EE35 
X-CRM114-Status: GOOD (  31.89  )
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

On Tue, Jun 24, 2025 at 3:46=E2=80=AFPM AngeloGioacchino Del Regno
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
>
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
> index 6d8988387da4..bca2ebbd89b7 100644
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
> index c0bc7a0f4e67..58643e35d2cc 100644
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
> +               .enable_reg =3D MT6316_BUCK_TOP_CON0,                    =
 \
> +               .enable_mask =3D BIT(vreg_id - 1),                       =
 \
> +               .vsel_reg =3D vs_reg,                                    =
 \
> +               .vsel_mask =3D MT6316_VSEL_MASK,                         =
 \
> +               .of_map_mode =3D mt6316_map_mode,                        =
 \
> +       },                                                              \
> +       .lp_mode_reg =3D MT6316_BUCK_TOP_CON1,                           =
 \
> +       .lp_mode_mask =3D BIT(vreg_id - 1),                              =
 \
> +       .modeset_reg =3D MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0,            =
 \
> +       .modeset_mask =3D BIT(vreg_id - 1),                              =
 \
> +       .debug_reg =3D MT6316_VBUCK##vreg_id##_DBG,                      =
 \
> +}

[...]

> +
> +/* MT6316BP/VP - 2+2 phase buck */
> +static struct mt6316_regulator_info mt6316bv_regulators[] =3D {
> +       MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0)=
,
> +       MT6316_BUCK("vbuck34", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4)=
,

                                    ^
While this is technically correct as the selector does start from 0,
I don't think the regulator can actually go down to 0V. In the past
for the MT6311 / MT6315, MediaTek always added a standard minimum
voltage in the device tree.

I believe a combination of setting .linear_min_sel and adjusting min_uV
and n_voltages is the correct solution.

> +};
> +
> +/* MT6316CP/HP/KP - 3+1 phase buck */
> +static struct mt6316_regulator_info mt6316chk_regulators[] =3D {
> +       MT6316_BUCK("vbuck124", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0=
),
> +       MT6316_BUCK("vbuck3", 3, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR4),
> +};
> +
> +/* MT6316DP/TP - 4 phase buck */
> +static struct mt6316_regulator_info mt6316dt_regulators[] =3D {
> +       MT6316_BUCK("vbuck1234", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR=
0),
> +};
> +
> +static const struct regmap_config mt6316_spmi_regmap_config =3D {
> +       .reg_bits       =3D 16,
> +       .val_bits       =3D 8,
> +       .max_register   =3D 0x1700,
> +       .fast_io        =3D true,
> +};
> +
> +static int mt6316_regulator_probe(struct spmi_device *sdev)
> +{
> +       struct regulator_config config =3D {};
> +       struct mt6316_regulator_info *info;
> +       struct regulator_dev *rdev;
> +       enum mt6316_type type;
> +       int num_vregs, ret;
> +       unsigned int i;
> +       u32 chip_id;
> +
> +       config.regmap =3D devm_regmap_init_spmi_ext(sdev, &mt6316_spmi_re=
gmap_config);
> +       if (IS_ERR(config.regmap))
> +               return PTR_ERR(config.regmap);
> +
> +       /*
> +        * The first read is expected to fail: this PMIC needs to be woke=
n up
> +        * and that can be done with any activity over the SPMI bus.
> +        */
> +       regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
> +
> +       /* The second read, instead, shall not fail! */
> +       ret =3D regmap_read(config.regmap, MT6316_CHIP_ID, &chip_id);
> +       if (ret) {
> +               dev_err(&sdev->dev, "Cannot read Chip ID!\n");
> +               return ret;
> +       }
> +       dev_dbg(&sdev->dev, "Chip ID: 0x%x\n", chip_id);
> +
> +       config.dev =3D &sdev->dev;
> +
> +       type =3D (uintptr_t)device_get_match_data(&sdev->dev);
> +       switch (type) {
> +       case MT6316_TYPE_2PHASE:

Instead of being tied to the compatible string / PMIC variant,
I wonder if this is something that can be read back from the
PMIC. You wouldn't need so many variant compatible strings if
that's the case.

FWIW we do that for some of the X-Powers AXP PMICs.


ChenYu

