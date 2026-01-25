Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7CCE63C85
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 04:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiBlPJX0s+IRRQWG7JFjHdlHBVYRoM9m/mjz77GmB3s=; b=1kfD5we5FTRso4
	mlMFYpl53mHUAhJHDRk5A21D0I51de0legvmAKPfsKMy/xrnINY/unsIDRbIsXQ145CA7MSSXa7n+
	f3xmTR3YSSSGxhlvjDBmiL1YcV11hvkkzzC06YC48L0h0h1g75dzlKE0U4xcNrMfQvvIutzeARKHi
	sDKi0FvkTBVGX6kyCr1Xs0wZ4pfSCf0pM4rjJ7Sz+xaxeIMlgIPsQLc3QkHVEmIYdlQWnwSD9cZia
	dX/WuzMyHTP750Em7wI/n0M/N1WsB7WwFJ3TaKAMQs1anzHi3fGBBPZIRH2Gzw0DawDc9vL+Uxjq6
	7bYefcxjldvhSWzxwoUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrnP-0000000AqRM-1upj;
	Sun, 25 Jan 2026 04:32:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjrnN-0000000AqRE-2cKP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 04:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A141560128
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 04:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B53C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 04:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769315536;
	bh=gUhRHt/swtaI5yVy/woT6OpgSZZQxe0I/o3/nF4YzEA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=niUGfw1Xqq9QKeqCnhVVyRGREqp3jTV9jkuyjHrwsH4KPGg6XsQsCGRcAyYrC9p2L
	 OqQK5pY57soBPFekk+CiL7+eQJapoMgSX5c/+yTJulWDLTrX1Pxv0AfYRxjHI+lLt0
	 g8yMdopI8+sY0uRB3jhal7T+9hffcI7pGbM+6/dxw/cUD8JlLrzJ7CmGr0Q1C497pi
	 bYJkOqpjJn2+OpR63B0coK2PIps7qp5uKhKeOi4uoArCQiQBzSrVNviQ8qDY11Nf8Q
	 cFirZWXO3gYSk8UXdZmObG+MWtt+wqC/OPA8RvYILrREWbPS5rQ0ZOV1EPpbx+vv7O
	 MdHeIKQ4lmgkA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-385d9fb297dso25428591fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 20:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdFzCUVkIeO+0NBxf+fnHO8I3zF9ljYHc814To45YmRZktN3Vjwelr5augkIVFEBOVmzSy7WHWwytk6ZT1NDWb@lists.infradead.org
X-Gm-Message-State: AOJu0YxuuZn8kpHf0RYh5HtQIy2vmN9HCJpx6FzmS7tquw+1laIAjYsu
	y+WiNIQJGwsBnSg70rie4QRluqh8t4vvOOjHGFgvvGHkiuA0+cPm0Hxm5XRt17SeD6PQ1zCnlkM
	L3Ag9DKWiY30yL/DZ5fnB0DWciHP8SMQ=
X-Received: by 2002:a2e:8a88:0:b0:383:20ac:fb57 with SMTP id
 38308e7fff4ca-385fa15a7a0mr2177881fa.28.1769315534289; Sat, 24 Jan 2026
 20:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-4-d359437f23a7@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 25 Jan 2026 12:32:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
X-Gm-Features: AZwV_Qg8xsPvV8sAc15AaOTOljnpBF_VgchagL9AVusH77dKMuI0N9PyP8M8ADw
Message-ID: <CAGb2v65aMMVu8W1PW+6NZM+YM72YFV9_FWVWtj6QHJ1CgetEsA@mail.gmail.com>
Subject: Re: [PATCH 4/7] clk: sunxi-ng: Extract common RTC CCU clock logic
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Extract the IOSC and 32k clock logic from ccu-sun6i-rtc into a shared
> module to simplify adding RTC CCU support for new SoCs. This is needed
> because newer Allwinner SoCs introduce additional DCXO/HOSC logic that
> prevents direct reuse of the existing driver.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/Makefile        |   3 +
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 152 +----------------------------=
------
>  drivers/clk/sunxi-ng/ccu_rtc.c       | 136 +++++++++++++++++++++++++++++=
++
>  drivers/clk/sunxi-ng/ccu_rtc.h       |  37 +++++++++
>  4 files changed, 177 insertions(+), 151 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e
> index a1c4087d7241..c3f810a025a8 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -23,6 +23,9 @@ sunxi-ccu-y                   +=3D ccu_nkmp.o
>  sunxi-ccu-y                    +=3D ccu_nm.o
>  sunxi-ccu-y                    +=3D ccu_mp.o
>
> +# RTC clocks
> +sunxi-ccu-y                    +=3D ccu_rtc.o
> +
>  # SoC support
>  obj-$(CONFIG_SUNIV_F1C100S_CCU)        +=3D suniv-f1c100s-ccu.o
>  obj-$(CONFIG_SUN20I_D1_CCU)    +=3D sun20i-d1-ccu.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index 6f888169412c..562ba752bcec 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -14,37 +14,12 @@
>
>  #include "ccu_common.h"
>
> -#include "ccu_div.h"
>  #include "ccu_gate.h"
>  #include "ccu_mux.h"
> +#include "ccu_rtc.h"
>
>  #include "ccu-sun6i-rtc.h"
>
> -#define IOSC_ACCURACY                  300000000 /* 30% */
> -#define IOSC_RATE                      16000000
> -
> -#define LOSC_RATE                      32768
> -#define LOSC_RATE_SHIFT                        15
> -
> -#define LOSC_CTRL_REG                  0x0
> -#define LOSC_CTRL_KEY                  0x16aa0000
> -
> -#define IOSC_32K_CLK_DIV_REG           0x8
> -#define IOSC_32K_CLK_DIV               GENMASK(4, 0)
> -#define IOSC_32K_PRE_DIV               32
> -
> -#define IOSC_CLK_CALI_REG              0xc
> -#define IOSC_CLK_CALI_DIV_ONES         22
> -#define IOSC_CLK_CALI_EN               BIT(1)
> -#define IOSC_CLK_CALI_SRC_SEL          BIT(0)
> -
> -#define LOSC_OUT_GATING_REG            0x60
> -
> -#define DCXO_CTRL_REG                  0x160
> -#define DCXO_CTRL_CLK16M_RC_EN         BIT(0)
> -
> -#define SUN6I_RTC_AUX_ID(_name)                "rtc_sun6i." #_name
> -
>  struct sun6i_rtc_match_data {
>         bool                            have_ext_osc32k         : 1;
>         bool                            have_iosc_calibration   : 1;
> @@ -53,137 +28,12 @@ struct sun6i_rtc_match_data {
>         u8                              osc32k_fanout_nparents;
>  };
>
> -static int ccu_iosc_enable(struct clk_hw *hw)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -
> -       return ccu_gate_helper_enable(cm, DCXO_CTRL_CLK16M_RC_EN);
> -}
> -
> -static void ccu_iosc_disable(struct clk_hw *hw)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -
> -       return ccu_gate_helper_disable(cm, DCXO_CTRL_CLK16M_RC_EN);
> -}
> -
> -static int ccu_iosc_is_enabled(struct clk_hw *hw)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -
> -       return ccu_gate_helper_is_enabled(cm, DCXO_CTRL_CLK16M_RC_EN);
> -}
> -
> -static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
> -                                         unsigned long parent_rate)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -
> -       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> -               u32 reg =3D readl(cm->base + IOSC_CLK_CALI_REG);
> -
> -               /*
> -                * Recover the IOSC frequency by shifting the ones place =
of
> -                * (fixed-point divider * 32768) into bit zero.
> -                */
> -               if (reg & IOSC_CLK_CALI_EN)
> -                       return reg >> (IOSC_CLK_CALI_DIV_ONES - LOSC_RATE=
_SHIFT);
> -       }
> -
> -       return IOSC_RATE;
> -}
> -
> -static unsigned long ccu_iosc_recalc_accuracy(struct clk_hw *hw,
> -                                             unsigned long parent_accura=
cy)
> -{
> -       return IOSC_ACCURACY;
> -}
> -
> -static const struct clk_ops ccu_iosc_ops =3D {
> -       .enable                 =3D ccu_iosc_enable,
> -       .disable                =3D ccu_iosc_disable,
> -       .is_enabled             =3D ccu_iosc_is_enabled,
> -       .recalc_rate            =3D ccu_iosc_recalc_rate,
> -       .recalc_accuracy        =3D ccu_iosc_recalc_accuracy,
> -};
> -
>  static struct ccu_common iosc_clk =3D {
>         .reg            =3D DCXO_CTRL_REG,
>         .hw.init        =3D CLK_HW_INIT_NO_PARENT("iosc", &ccu_iosc_ops,
>                                                 CLK_GET_RATE_NOCACHE),
>  };
>
> -static int ccu_iosc_32k_prepare(struct clk_hw *hw)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -       u32 val;
> -
> -       if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
> -               return 0;
> -
> -       val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> -       writel(val | IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL,
> -              cm->base + IOSC_CLK_CALI_REG);
> -
> -       return 0;
> -}
> -
> -static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -       u32 val;
> -
> -       if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
> -               return;
> -
> -       val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> -       writel(val & ~(IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL),
> -              cm->base + IOSC_CLK_CALI_REG);
> -}
> -
> -static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
> -                                             unsigned long parent_rate)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -       u32 val;
> -
> -       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> -               val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> -
> -               /* Assume the calibrated 32k clock is accurate. */
> -               if (val & IOSC_CLK_CALI_SRC_SEL)
> -                       return LOSC_RATE;
> -       }
> -
> -       val =3D readl(cm->base + IOSC_32K_CLK_DIV_REG) & IOSC_32K_CLK_DIV=
;
> -
> -       return parent_rate / IOSC_32K_PRE_DIV / (val + 1);
> -}
> -
> -static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
> -                                                 unsigned long parent_ac=
curacy)
> -{
> -       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> -       u32 val;
> -
> -       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> -               val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> -
> -               /* Assume the calibrated 32k clock is accurate. */
> -               if (val & IOSC_CLK_CALI_SRC_SEL)
> -                       return 0;
> -       }
> -
> -       return parent_accuracy;
> -}
> -
> -static const struct clk_ops ccu_iosc_32k_ops =3D {
> -       .prepare                =3D ccu_iosc_32k_prepare,
> -       .unprepare              =3D ccu_iosc_32k_unprepare,
> -       .recalc_rate            =3D ccu_iosc_32k_recalc_rate,
> -       .recalc_accuracy        =3D ccu_iosc_32k_recalc_accuracy,
> -};
> -
>  static struct ccu_common iosc_32k_clk =3D {
>         .hw.init        =3D CLK_HW_INIT_HW("iosc-32k", &iosc_clk.hw,
>                                          &ccu_iosc_32k_ops,
> diff --git a/drivers/clk/sunxi-ng/ccu_rtc.c b/drivers/clk/sunxi-ng/ccu_rt=
c.c
> new file mode 100644
> index 000000000000..cfc10218517c
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_rtc.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +
> +#include "ccu_common.h"
> +
> +#include "ccu_gate.h"
> +#include "ccu_rtc.h"
> +
> +static int ccu_iosc_enable(struct clk_hw *hw)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +
> +       return ccu_gate_helper_enable(cm, DCXO_CTRL_CLK16M_RC_EN);
> +}
> +
> +static void ccu_iosc_disable(struct clk_hw *hw)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +
> +       return ccu_gate_helper_disable(cm, DCXO_CTRL_CLK16M_RC_EN);
> +}
> +
> +static int ccu_iosc_is_enabled(struct clk_hw *hw)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +
> +       return ccu_gate_helper_is_enabled(cm, DCXO_CTRL_CLK16M_RC_EN);
> +}
> +
> +static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
> +                                         unsigned long parent_rate)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +
> +       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> +               u32 reg =3D readl(cm->base + IOSC_CLK_CALI_REG);
> +               /*
> +                * Recover the IOSC frequency by shifting the ones place =
of
> +                * (fixed-point divider * 32768) into bit zero.
> +                */
> +               if (reg & IOSC_CLK_CALI_EN)
> +                       return reg >> (IOSC_CLK_CALI_DIV_ONES - LOSC_RATE=
_SHIFT);
> +       }
> +
> +       return IOSC_RATE;
> +}
> +
> +static unsigned long ccu_iosc_recalc_accuracy(struct clk_hw *hw,
> +                                             unsigned long parent_accura=
cy)
> +{
> +       return IOSC_ACCURACY;
> +}
> +
> +const struct clk_ops ccu_iosc_ops =3D {
> +       .enable                 =3D ccu_iosc_enable,
> +       .disable                =3D ccu_iosc_disable,
> +       .is_enabled             =3D ccu_iosc_is_enabled,
> +       .recalc_rate            =3D ccu_iosc_recalc_rate,
> +       .recalc_accuracy        =3D ccu_iosc_recalc_accuracy,
> +};

You need to export the symbol.

> +
> +static int ccu_iosc_32k_prepare(struct clk_hw *hw)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +       u32 val;
> +
> +       if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
> +               return 0;
> +
> +       val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> +       writel(val | IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL,
> +              cm->base + IOSC_CLK_CALI_REG);
> +
> +       return 0;
> +}
> +
> +static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +       u32 val;
> +
> +       if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
> +               return;
> +
> +       val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> +       writel(val & ~(IOSC_CLK_CALI_EN | IOSC_CLK_CALI_SRC_SEL),
> +              cm->base + IOSC_CLK_CALI_REG);
> +}
> +
> +static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
> +                                             unsigned long parent_rate)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +       u32 val;
> +
> +       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> +               val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> +
> +               /* Assume the calibrated 32k clock is accurate. */
> +               if (val & IOSC_CLK_CALI_SRC_SEL)
> +                       return LOSC_RATE;
> +       }
> +
> +       val =3D readl(cm->base + IOSC_32K_CLK_DIV_REG) & IOSC_32K_CLK_DIV=
;
> +
> +       return parent_rate / IOSC_32K_PRE_DIV / (val + 1);
> +}
> +
> +static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
> +                                                 unsigned long parent_ac=
curacy)
> +{
> +       struct ccu_common *cm =3D hw_to_ccu_common(hw);
> +       u32 val;
> +
> +       if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
> +               val =3D readl(cm->base + IOSC_CLK_CALI_REG);
> +
> +               /* Assume the calibrated 32k clock is accurate. */
> +               if (val & IOSC_CLK_CALI_SRC_SEL)
> +                       return 0;
> +       }
> +
> +       return parent_accuracy;
> +}
> +
> +const struct clk_ops ccu_iosc_32k_ops =3D {
> +       .prepare                =3D ccu_iosc_32k_prepare,
> +       .unprepare              =3D ccu_iosc_32k_unprepare,
> +       .recalc_rate            =3D ccu_iosc_32k_recalc_rate,
> +       .recalc_accuracy        =3D ccu_iosc_32k_recalc_accuracy,
> +};

Same here.

> diff --git a/drivers/clk/sunxi-ng/ccu_rtc.h b/drivers/clk/sunxi-ng/ccu_rt=
c.h
> new file mode 100644
> index 000000000000..1c44c2206a25
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu_rtc.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#ifndef _CCU_RTC_H_
> +#define _CCU_RTC_H_
> +
> +#define IOSC_ACCURACY                  300000000 /* 30% */
> +#define IOSC_RATE                      16000000
> +
> +#define LOSC_RATE                      32768
> +#define LOSC_RATE_SHIFT                        15
> +
> +#define LOSC_CTRL_REG                  0x0
> +#define LOSC_CTRL_KEY                  0x16aa0000
> +
> +#define IOSC_32K_CLK_DIV_REG           0x8
> +#define IOSC_32K_CLK_DIV               GENMASK(4, 0)
> +#define IOSC_32K_PRE_DIV               32
> +
> +#define IOSC_CLK_CALI_REG              0xc
> +#define IOSC_CLK_CALI_DIV_ONES         22
> +#define IOSC_CLK_CALI_EN               BIT(1)
> +#define IOSC_CLK_CALI_SRC_SEL          BIT(0)
> +
> +#define LOSC_OUT_GATING_REG            0x60
> +
> +#define DCXO_CTRL_REG                  0x160
> +#define DCXO_CTRL_CLK16M_RC_EN         BIT(0)

Please keep all internals in the .c file.

ChenYu


> +
> +#define SUN6I_RTC_AUX_ID(_name)                "rtc_sun6i." #_name
> +
> +extern const struct clk_ops ccu_iosc_ops;
> +extern const struct clk_ops ccu_iosc_32k_ops;
> +
> +#endif /* _CCU_RTC_H_ */
>
> --
> 2.52.0
>
>

