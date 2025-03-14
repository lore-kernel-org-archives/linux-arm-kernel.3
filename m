Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116A3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OnvxGuWLwbsMGDx+dnr65e/zpVFA0sGZSJfUiswNflE=; b=z4lu110dhQ9WguuWAOiP9ltcmy
	Nxrjh4I3BkKVf7vHMBFYe7lOGAFZiigwzIFIuNmDXPwodaBG87csVravwHABsrfSSBQdG2QPwg1M8
	XPWu0dYQxh0AYHYA5HSgehaHaHn8aEiGayWA4qo6cMz8dyyJQfWDWa2XVuSBxRV7if2czigCycnMI
	Gdrtgk1gA7kcskrzXmLDzUiJ1MojvGr1+oMMiA3sAGcvqrCggJwnOnpvUOWXLSX2dH++kEmCZa1xQ
	7YqjOfnWeHUT/XER2cG78wvSvXn4Q8AYdfllmzysxE9iXI/uunyseRl64vFK5mdpzWQnIcIvt/RP+
	Q8ZeKmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0af-0000000DW39-0Isd;
	Fri, 14 Mar 2025 08:40:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0NM-0000000DSMn-4477
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:26:43 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so15709431fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741940799; x=1742545599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnvxGuWLwbsMGDx+dnr65e/zpVFA0sGZSJfUiswNflE=;
        b=fr7+uLslahDlux5FRWnZL+VOc0rbVLg2qRgLypSftzEf1a28KreiubpYb09P1wUn2P
         LdmBdiVTwAiyNjUns2T3l6i7mHPDSGo5FtoY3Q+mXTWw1BL3eEIp3IDEYoPeIqJwKcir
         vjyN2yjQr8yv7mOXUiYDkHRS95botahqzWL2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741940799; x=1742545599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnvxGuWLwbsMGDx+dnr65e/zpVFA0sGZSJfUiswNflE=;
        b=lOyvDHzXmVmxkiW+yU5U9b0DNr9bE3Bpa9uZM5Sj67FmY1mwka6eQfTDtr1bSBtW2T
         NV9vh1SHJ4fG5yD/syDTmCxr2dGLWbFlUOTkCsTQtWaTgS48A3JlY0fzZOzy56JgmdJ3
         Rl+P90EIN/brJQnjqv3rtqd6UbLg/2+IaW4a/RybuATQNxVPcVPF48ATZHXR6MMsS9KD
         60BHE4fKvHQ6kBKkOoVKWZN8H/UrCSRzvY4GddCGQ8qkjI1tM906r07URzUMdQGB6V6a
         UdgENPHy9L99VeSQ9rCjPIsP1j+nPpbjFoOqMbL3K4WbpY0aCs/LTrvdYAoVzJE2QgzE
         lWTA==
X-Forwarded-Encrypted: i=1; AJvYcCVRVNm1kXz65+vo0aYPuC9z1khl1VSLJ7GVd7CK6dERtnAjjJwuNcoDxGoqCBuhV0fWilzm/DwJF9rk77D3ISXh@lists.infradead.org
X-Gm-Message-State: AOJu0YzBD8JgjQJ6boDaHOt0ZaTSGFIdR0VBP5kR0d/dldnyNr/1qPha
	aXmULOehhbdV4dHOWwOBBPXdSrZU1IDO2NnlRMhE0sLJLatmcdS2VMrnOzG+gyqUlXqY0gY3PUF
	armLN1H6x0hWhNHyXPh+J4xo0OHBy1XV2P4ma
X-Gm-Gg: ASbGncslBSow7f7AGhMXEHOEyohmHbHH71MSyKVFd3OEM1ViN0iz0O5whZFSESSQnxz
	zammTwcwfXlVr2Bn5k6RJP3E2O05llpU8DeeGAzY6i4jIRtY6iKfch4l+IuK1kZqHcr+IwytPyb
	cHMl519gAeM6riDn98zHrZIK/cpxJ2B3XusTwDd6C4b8hlT+7O8qcR
X-Google-Smtp-Source: AGHT+IGhGekMc4WNzl4bX/a7xx8QwbG9qEqQGafoM6+ZmPbzyfrg7VUUE+RgQdSUqTpLaqiQqjrSmQApdPtRAeOIkr0=
X-Received: by 2002:a05:6512:2245:b0:549:4d73:641b with SMTP id
 2adb3069b0e04-549c398d3bdmr566692e87.52.1741940798475; Fri, 14 Mar 2025
 01:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250314073307.25092-1-Lu.Tang@mediatek.com> <20250314073307.25092-3-Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-3-Lu.Tang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 14 Mar 2025 16:26:27 +0800
X-Gm-Features: AQ5f1JoUxxaW4R1DHW8NvTP3v8QIgiu0MnuEYNVzwemC1viyE2X19Q5KKrrECK4
Message-ID: <CAGXv+5FKLz2sK5UOwtj33xZEh6kKznSAdeHhc6d0oSxbQqpEmA@mail.gmail.com>
Subject: Re: [PATCH 2/5] pmic: mediatek: Add pmic regulator driver
To: "Lu.Tang" <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sen Chu <shen.chu@mediatek.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012641_018021_6957BF36 
X-CRM114-Status: GOOD (  31.20  )
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

On Fri, Mar 14, 2025 at 3:58=E2=80=AFPM Lu.Tang <Lu.Tang@mediatek.com> wrot=
e:
>
> From: "Lu.Tang" <lu.tang@mediatek.com>
>
> Add pmic mt6316/mt6373/mt6363 regulator driver

Please split this into one patch per PMIC. That will make the patch
size much more manageable. And the patch subject should just say what
PMIC is added.

> Signed-off-by: Lu Tang <lu.tang@mediatek.com>
> ---
>  drivers/regulator/Kconfig                  |   34 +
>  drivers/regulator/Makefile                 |    3 +
>  drivers/regulator/mt6316-regulator.c       |  381 +++++++

How much of the MT6316 driver is the same or similar to MT6315?
AFAICT they are both 4 buck regulators where some of the outputs
can be combined into a polyphase output.

>  drivers/regulator/mt6363-regulator.c       | 1106 ++++++++++++++++++++
>  drivers/regulator/mt6373-regulator.c       |  826 +++++++++++++++
>  include/linux/regulator/mt6316-regulator.h |   48 +
>  include/linux/regulator/mt6363-regulator.h |  424 ++++++++
>  include/linux/regulator/mt6373-regulator.h |  318 ++++++
>  8 files changed, 3140 insertions(+)
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>  create mode 100644 drivers/regulator/mt6363-regulator.c
>  create mode 100644 drivers/regulator/mt6373-regulator.c
>  create mode 100644 include/linux/regulator/mt6316-regulator.h
>  create mode 100644 include/linux/regulator/mt6363-regulator.h
>  create mode 100644 include/linux/regulator/mt6373-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 39297f7d8177..7b2d47fee535 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -853,6 +853,16 @@ config REGULATOR_MT6315
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6316
> +       tristate "MediaTek MT6316 PMIC"
> +       depends on SPMI
> +       select REGMAP_SPMI
> +       help
> +         Say y here to select this option to enable the power regulator =
of
> +         MediaTek MT6316 PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6323
>         tristate "MediaTek MT6323 PMIC"
>         depends on MFD_MT6397
> @@ -916,6 +926,18 @@ config REGULATOR_MT6360
>           2-channel buck with Thermal Shutdown and Overload Protection
>           6-channel High PSRR and Low Dropout LDO.
>
> +config REGULATOR_MT6363
> +       tristate "MT6363 SPMI Regulator driver"
> +       depends on MFD_MTK_SPMI_PMIC
> +       help
> +         Say y here to select this option to enable the power regulator =
of
> +         MediaTek MT6363 PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
> +         The driver can also be build as a module.
> +         If so, the module will be called mt6363_regulator
> +
>  config REGULATOR_MT6370
>         tristate "MT6370 SubPMIC Regulator"
>         depends on MFD_MT6370
> @@ -924,6 +946,18 @@ config REGULATOR_MT6370
>           This driver supports the control for DisplayBias voltages and o=
ne
>           general purpose LDO which is commonly used to drive the vibrato=
r.
>
> +config REGULATOR_MT6373
> +       tristate "MT6373 SPMI Regulator driver"
> +       depends on MFD_MTK_SPMI_PMIC
> +       help
> +         Say y here to select this option to enable the power regulator =
of
> +         MediaTek MT6373 PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
> +         The driver can also be build as a module.
> +         If so, the module will be called mt6373_regulator
> +
>  config REGULATOR_MT6380
>         tristate "MediaTek MT6380 PMIC"
>         depends on MTK_PMIC_WRAP
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 3d5a803dce8a..b54a64522499 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -102,6 +102,7 @@ obj-$(CONFIG_REGULATOR_MP886X) +=3D mp886x.o
>  obj-$(CONFIG_REGULATOR_MPQ7920) +=3D mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) +=3D mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6315) +=3D mt6315-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6316) +=3D mt6316-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) +=3D mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6331) +=3D mt6331-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6332) +=3D mt6332-regulator.o
> @@ -109,7 +110,9 @@ obj-$(CONFIG_REGULATOR_MT6357)      +=3D mt6357-regul=
ator.o
>  obj-$(CONFIG_REGULATOR_MT6358) +=3D mt6358-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6359) +=3D mt6359-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6360) +=3D mt6360-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6363) +=3D mt6363-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6370) +=3D mt6370-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6373) +=3D mt6373-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) +=3D mt6380-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) +=3D mt6397-regulator.o
>  obj-$(CONFIG_REGULATOR_MTK_DVFSRC) +=3D mtk-dvfsrc-regulator.o
> diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6=
316-regulator.c
> new file mode 100644
> index 000000000000..1c069a0d4cff
> --- /dev/null
> +++ b/drivers/regulator/mt6316-regulator.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 MediaTek Inc.
> +
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6316-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define SET_OFFSET     0x1
> +#define CLR_OFFSET     0x2
> +
> +#define MT6316_REG_WIDTH       8
> +
> +#define MT6316_BUCK_MODE_AUTO          0
> +#define MT6316_BUCK_MODE_FORCE_PWM     1
> +#define MT6316_BUCK_MODE_NORMAL                0
> +#define MT6316_BUCK_MODE_LP            2
> +
> +#define BUCK_PHASE_3                   3
> +#define BUCK_PHASE_4                   4
> +
> +struct mt6316_regulator_info {
> +       struct regulator_desc desc;
> +       u32 da_reg;
> +       u32 qi;
> +       u32 modeset_reg;
> +       u32 modeset_mask;
> +       u32 lp_mode_reg;
> +       u32 lp_mode_mask;
> +       u32 lp_mode_shift;
> +};
> +
> +struct mt6316_init_data {
> +       u32 id;
> +       u32 size;
> +};
> +
> +struct mt6316_chip {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       u32 slave_id;
> +};
> +
> +#define MT_BUCK(match, _name, volt_ranges, _bid, _vsel)        \
> +[MT6316_ID_##_name] =3D {                                        \
> +       .desc =3D {                                       \
> +               .name =3D #_name,                         \
> +               .of_match =3D of_match_ptr(match),        \
> +               .ops =3D &mt6316_volt_range_ops,          \
> +               .type =3D REGULATOR_VOLTAGE,              \
> +               .id =3D MT6316_ID_##_name,                \
> +               .owner =3D THIS_MODULE,                   \
> +               .n_voltages =3D 0x1ff,                    \
> +               .linear_ranges =3D volt_ranges,           \
> +               .n_linear_ranges =3D ARRAY_SIZE(volt_ranges),\
> +               .vsel_reg =3D _vsel,                      \
> +               .vsel_mask =3D 0xff,                      \
> +               .enable_reg =3D MT6316_BUCK_TOP_CON0,     \
> +               .enable_mask =3D BIT(_bid - 1),           \
> +               .of_map_mode =3D mt6316_map_mode,         \
> +       },                                              \
> +       .da_reg =3D MT6316_VBUCK##_bid##_DBG8,            \
> +       .qi =3D BIT(0),                                   \
> +       .lp_mode_reg =3D MT6316_BUCK_TOP_CON1,            \
> +       .lp_mode_mask =3D BIT(_bid - 1),                  \
> +       .lp_mode_shift =3D _bid - 1,                      \
> +       .modeset_reg =3D MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0,\
> +       .modeset_mask =3D BIT(_bid - 1),                  \
> +}
> +
> +static const struct linear_range mt_volt_range1[] =3D {
> +       REGULATOR_LINEAR_RANGE(0, 0, 0x1fe, 2500),
> +};
> +
> +static int mt6316_regulator_enable(struct regulator_dev *rdev)
> +{
> +       return regmap_write(rdev->regmap, rdev->desc->enable_reg + SET_OF=
FSET,
> +                           rdev->desc->enable_mask);
> +}
> +
> +static int mt6316_regulator_disable(struct regulator_dev *rdev)
> +{
> +       return regmap_write(rdev->regmap, rdev->desc->enable_reg + CLR_OF=
FSET,
> +                           rdev->desc->enable_mask);
> +}
> +
> +static unsigned int mt6316_map_mode(u32 mode)
> +{
> +       switch (mode) {
> +       case MT6316_BUCK_MODE_AUTO:
> +               return REGULATOR_MODE_NORMAL;
> +       case MT6316_BUCK_MODE_FORCE_PWM:
> +               return REGULATOR_MODE_FAST;
> +       case MT6316_BUCK_MODE_LP:
> +               return REGULATOR_MODE_IDLE;
> +       default:
> +               return REGULATOR_MODE_INVALID;
> +       }
> +}
> +
> +static int mt6316_regulator_set_voltage_sel(struct regulator_dev *rdev, =
unsigned int selector)
> +{
> +       unsigned short reg_val =3D 0;
> +       int ret =3D 0;
> +
> +       reg_val =3D ((selector & 0x1) << 8) | (selector >> 1);
> +       ret =3D regmap_bulk_write(rdev->regmap, rdev->desc->vsel_reg, (u8=
 *) &reg_val, 2);
> +
> +       return ret;
> +}
> +
> +static int mt6316_regulator_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +       int ret =3D 0;
> +       unsigned int reg_val =3D 0;
> +
> +       ret =3D regmap_bulk_read(rdev->regmap, rdev->desc->vsel_reg, (u8 =
*) &reg_val, 2);
> +       if (ret !=3D 0) {
> +               dev_err(&rdev->dev, "Failed to get mt6316 regulator volta=
ge: %d\n", ret);
> +               return ret;
> +       }
> +       ret =3D ((reg_val >> 8) & 0x1) + ((reg_val & rdev->desc->vsel_mas=
k) << 1);
> +
> +       return ret;
> +}
> +
> +static unsigned int mt6316_regulator_get_mode(struct regulator_dev *rdev=
)
> +{
> +       struct mt6316_regulator_info *info;
> +       int ret =3D 0, regval =3D 0;
> +       u32 modeset_mask;
> +
> +       info =3D container_of(rdev->desc, struct mt6316_regulator_info, d=
esc);
> +       ret =3D regmap_read(rdev->regmap, info->modeset_reg, &regval);
> +       if (ret !=3D 0) {
> +               dev_err(&rdev->dev, "Failed to get mt6316 buck mode: %d\n=
", ret);
> +               return ret;
> +       }
> +
> +       modeset_mask =3D info->modeset_mask;
> +
> +       if ((regval & modeset_mask) =3D=3D modeset_mask)
> +               return REGULATOR_MODE_FAST;
> +
> +       ret =3D regmap_read(rdev->regmap, info->lp_mode_reg, &regval);
> +       if (ret !=3D 0) {
> +               dev_err(&rdev->dev, "Failed to get mt6316 buck lp mode: %=
d\n", ret);
> +               return ret;
> +       }
> +
> +       if (regval & info->lp_mode_mask)
> +               return REGULATOR_MODE_IDLE;
> +       else
> +               return REGULATOR_MODE_NORMAL;
> +}
> +
> +static int mt6316_regulator_set_mode(struct regulator_dev *rdev, u32 mod=
e)
> +{
> +       struct mt6316_regulator_info *info;
> +       int ret =3D 0, val, curr_mode;
> +       u32 modeset_mask;
> +
> +       info =3D container_of(rdev->desc, struct mt6316_regulator_info, d=
esc);
> +       modeset_mask =3D info->modeset_mask;
> +
> +       curr_mode =3D mt6316_regulator_get_mode(rdev);
> +       switch (mode) {
> +       case REGULATOR_MODE_FAST:
> +               ret =3D regmap_update_bits(rdev->regmap, info->modeset_re=
g,
> +                                        modeset_mask, modeset_mask);
> +               break;
> +       case REGULATOR_MODE_NORMAL:
> +               if (curr_mode =3D=3D REGULATOR_MODE_FAST) {
> +                       ret =3D regmap_update_bits(rdev->regmap, info->mo=
deset_reg,
> +                                                modeset_mask, 0);
> +               } else if (curr_mode =3D=3D REGULATOR_MODE_IDLE) {
> +                       ret =3D regmap_update_bits(rdev->regmap, info->lp=
_mode_reg,
> +                                                info->lp_mode_mask, 0);
> +                       usleep_range(100, 110);
> +               }
> +               break;
> +       case REGULATOR_MODE_IDLE:
> +               val =3D MT6316_BUCK_MODE_LP >> 1;
> +               val <<=3D info->lp_mode_shift;
> +               ret =3D regmap_update_bits(rdev->regmap, info->lp_mode_re=
g, info->lp_mode_mask, val);
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +               goto err_mode;
> +       }
> +
> +err_mode:
> +       if (ret !=3D 0) {
> +               dev_err(&rdev->dev, "Failed to set mt6316 buck mode: %d\n=
", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mt6316_get_status(struct regulator_dev *rdev)
> +{
> +       int ret =3D 0;
> +       u32 regval =3D 0;
> +       struct mt6316_regulator_info *info;
> +
> +       info =3D container_of(rdev->desc, struct mt6316_regulator_info, d=
esc);
> +       ret =3D regmap_read(rdev->regmap, info->da_reg, &regval);
> +       if (ret !=3D 0) {
> +               dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", =
ret);
> +               return ret;
> +       }
> +
> +       return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STAT=
US_OFF;
> +}
> +
> +static void mt6316_buck_phase_init(struct mt6316_chip *chip, unsigned in=
t *s6_buck_phase)
> +{
> +       int ret =3D 0;
> +       u32 val =3D 0;
> +
> +       ret =3D regmap_read(chip->regmap, MT6316_BUCK_TOP_4PHASE_TOP_ELR_=
0, &val);
> +       if (ret) {
> +               dev_err(chip->dev, "Failed to get mt6316 buck phase: %d\n=
", ret);
> +               return;
> +       }
> +
> +       dev_info(chip->dev, "S%d RG_4PH_CONFIG:%d\n", chip->slave_id, val=
);
> +       if (chip->slave_id =3D=3D MT6316_SLAVE_ID_6)
> +               *s6_buck_phase =3D val;
> +}
> +
> +static const struct regulator_ops mt6316_volt_range_ops =3D {
> +       .list_voltage =3D regulator_list_voltage_linear_range,
> +       .map_voltage =3D regulator_map_voltage_linear_range,
> +       .set_voltage_sel =3D mt6316_regulator_set_voltage_sel,
> +       .get_voltage_sel =3D mt6316_regulator_get_voltage_sel,
> +       .set_voltage_time_sel =3D regulator_set_voltage_time_sel,
> +       .enable =3D mt6316_regulator_enable,
> +       .disable =3D mt6316_regulator_disable,
> +       .is_enabled =3D regulator_is_enabled_regmap,
> +       .get_status =3D mt6316_get_status,
> +       .set_mode =3D mt6316_regulator_set_mode,
> +       .get_mode =3D mt6316_regulator_get_mode,
> +};
> +
> +static struct mt6316_regulator_info mt6316_regulators[] =3D {
> +       MT_BUCK("vbuck1", VBUCK1, mt_volt_range1, 1, MT6316_BUCK_TOP_ELR0=
),
> +       MT_BUCK("vbuck2", VBUCK2, mt_volt_range1, 2, MT6316_BUCK_TOP_ELR2=
),
> +       MT_BUCK("vbuck3", VBUCK3, mt_volt_range1, 3, MT6316_BUCK_TOP_ELR4=
),
> +       MT_BUCK("vbuck4", VBUCK4, mt_volt_range1, 4, MT6316_BUCK_TOP_ELR6=
),
> +};
> +
> +static struct mt6316_init_data mt6316_3_init_data =3D {
> +       .id =3D MT6316_SLAVE_ID_3,
> +       .size =3D MT6316_ID_3_MAX,
> +};
> +
> +static struct mt6316_init_data mt6316_6_init_data =3D {
> +       .id =3D MT6316_SLAVE_ID_6,
> +       .size =3D MT6316_ID_6_MAX,
> +};
> +
> +static struct mt6316_init_data mt6316_7_init_data =3D {
> +       .id =3D MT6316_SLAVE_ID_7,
> +       .size =3D MT6316_ID_7_MAX,
> +};
> +
> +static struct mt6316_init_data mt6316_8_init_data =3D {
> +       .id =3D MT6316_SLAVE_ID_8,
> +       .size =3D MT6316_ID_8_MAX,
> +};
> +
> +static struct mt6316_init_data mt6316_15_init_data =3D {
> +       .id =3D MT6316_SLAVE_ID_15,
> +       .size =3D MT6316_ID_15_MAX,
> +};
> +
> +static const struct of_device_id mt6316_of_match[] =3D {
> +       {
> +               .compatible =3D "mediatek,mt6316-3-regulator",
> +               .data =3D &mt6316_3_init_data,
> +       }, {
> +               .compatible =3D "mediatek,mt6316-6-regulator",
> +               .data =3D &mt6316_6_init_data,
> +       }, {
> +               .compatible =3D "mediatek,mt6316-7-regulator",
> +               .data =3D &mt6316_7_init_data,
> +       }, {
> +               .compatible =3D "mediatek,mt6316-8-regulator",
> +               .data =3D &mt6316_8_init_data,
> +       }, {
> +               .compatible =3D "mediatek,mt6316-15-regulator",
> +               .data =3D &mt6316_15_init_data,
> +       }, {
> +               /* sentinel */
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, mt6316_of_match);
> +
> +static int mt6316_regulator_probe(struct platform_device *pdev)
> +{
> +       const struct of_device_id *of_id;
> +       struct device *dev =3D &pdev->dev;
> +       struct regmap *regmap;
> +       struct mt6316_init_data *pdata;
> +       struct mt6316_chip *chip;
> +       struct regulator_config config =3D {};
> +       struct regulator_dev *rdev;
> +       struct device_node *node =3D pdev->dev.of_node;
> +       u32 val =3D 0;
> +       int i;
> +       unsigned int s6_buck_phase;
> +
> +       regmap =3D dev_get_regmap(dev->parent, NULL);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       chip =3D devm_kzalloc(dev, sizeof(struct mt6316_chip), GFP_KERNEL=
);
> +       if (!chip)
> +               return -ENOMEM;

Replace the following block:

> +       of_id =3D of_match_device(mt6316_of_match, dev);
> +       if (!of_id || !of_id->data)
> +               return -ENODEV;
> +
> +       pdata =3D (struct mt6316_init_data *)of_id->data;

with

    pdata =3D of_device_get_match_data(dev);

pdata should never be NULL since the driver is probed only when an
OF match happens, and all the entries in mt6316_of_match[] have .data
set.

> +       chip->slave_id =3D pdata->id;

If the ID is supposed to be the SPMI ID, then there should be no
reason to tie it to the compatible string. Simply get the ID from
the device tree.

> +       if (!of_property_read_u32(node, "buck-size", &val))
> +               pdata->size =3D val;

As mentioned in downstream review, the chip has 4 buck regulators,
regardless of whether they are being used or not. This is not the
right way to describe unused regulators.

> +       chip->dev =3D dev;
> +       chip->regmap =3D regmap;
> +       dev_set_drvdata(dev, chip);
> +
> +       dev->fwnode =3D &(dev->of_node->fwnode);
> +       if (dev->fwnode && !dev->fwnode->dev)
> +               dev->fwnode->dev =3D dev;
> +
> +       config.dev =3D dev;
> +       config.driver_data =3D pdata;
> +       config.regmap =3D regmap;
> +
> +       mt6316_buck_phase_init(chip, &s6_buck_phase);
> +       for (i =3D 0; i < pdata->size; i++) {
> +               if (pdata->id =3D=3D MT6316_SLAVE_ID_6 &&
> +                   s6_buck_phase =3D=3D BUCK_PHASE_4 &&
> +                   (mt6316_regulators + i)->desc.id =3D=3D MT6316_ID_VBU=
CK3) {
> +                       dev_info(dev, "skip registering %s.\n", (mt6316_r=
egulators + i)->desc.name);
> +                       continue;
> +               }
> +
> +               rdev =3D devm_regulator_register(dev, &(mt6316_regulators=
 + i)->desc, &config);
> +               if (IS_ERR(rdev)) {
> +                       dev_err(dev, "failed to register %s\n", (mt6316_r=
egulators + i)->desc.name);
> +                       continue;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static struct platform_driver mt6316_regulator_driver =3D {

The MT6316 only has regulators. Why does it need to go through another
layer, instead of this driver being the SPMI driver?

> +       .driver         =3D {
> +               .name   =3D "mt6316-regulator",
> +               .of_match_table =3D mt6316_of_match,
> +       },
> +       .probe =3D mt6316_regulator_probe,
> +};
> +
> +module_platform_driver(mt6316_regulator_driver);
> +
> +MODULE_AUTHOR("Lu Tang <lu.tang@mediatek.com>");
> +MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6316 PMIC");
> +MODULE_LICENSE("GPL");

[...]

Skipping the other two PMICs for now.

> diff --git a/include/linux/regulator/mt6316-regulator.h b/include/linux/r=
egulator/mt6316-regulator.h
> new file mode 100644
> index 000000000000..dd11b3d856fd
> --- /dev/null
> +++ b/include/linux/regulator/mt6316-regulator.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + */
> +
> +#ifndef __LINUX_REGULATOR_MT6316_H
> +#define __LINUX_REGULATOR_MT6316_H
> +
> +#define MT6316_SLAVE_ID_3      3
> +#define MT6316_SLAVE_ID_6      6
> +#define MT6316_SLAVE_ID_7      7
> +#define MT6316_SLAVE_ID_8      8
> +#define MT6316_SLAVE_ID_15     15
> +
> +#define MT6316_ID_3_MAX                3
> +#define MT6316_ID_6_MAX                3
> +#define MT6316_ID_7_MAX                3
> +#define MT6316_ID_8_MAX                3
> +#define MT6316_ID_15_MAX       2
> +
> +enum {
> +       MT6316_ID_VBUCK1 =3D 0,
> +       MT6316_ID_VBUCK2,
> +       MT6316_ID_VBUCK3,
> +       MT6316_ID_VBUCK4,
> +       MT6316_ID_MAX,
> +};
> +
> +/* Register */
> +#define MT6316_TOP_CFG_ELR4                    0x143
> +#define MT6316_BUCK_TOP_CON0                   0x1440
> +#define MT6316_BUCK_TOP_CON1                   0x1443
> +#define MT6316_BUCK_TOP_ELR0                   0x1448
> +#define MT6316_BUCK_TOP_ELR2                   0x144A
> +#define MT6316_BUCK_TOP_ELR4                   0x144C
> +#define MT6316_BUCK_TOP_ELR6                   0x144E
> +#define MT6316_VBUCK1_DBG4                     0x14A4
> +#define MT6316_VBUCK1_DBG8                     0x14A8
> +#define MT6316_VBUCK2_DBG4                     0x1524
> +#define MT6316_VBUCK2_DBG8                     0x1528
> +#define MT6316_VBUCK3_DBG4                     0x15A4
> +#define MT6316_VBUCK3_DBG8                     0x15A8
> +#define MT6316_VBUCK4_DBG4                     0x1624
> +#define MT6316_VBUCK4_DBG8                     0x1628
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0     0x1688
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0       0x1690
> +
> +#endif /* __LINUX_REGULATOR_MT6316_H */

AFAICT, no part of this file is used by other parts of the kernel. It
can be moved under drivers/regulator/, or even recombined with the
.c file.


Thanks
ChenYu

