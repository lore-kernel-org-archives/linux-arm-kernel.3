Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0319CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVKq2ofJtZZwfzsFBSnZCZG0o+hDi7JCHHG+Wj8ChZg=; b=eSZEb2lVZ0++GXkn3cxUwfQf8h
	t3bUS7Pee+K3BBK0cT6bFWYZgTxkmBsoW4czGC2bcPc7xlSJr1dcyuHxBLVaW9omSqcshcb4Hx6bP
	hpDIJUuwycXLu8DLskDFlwAtBNflSE0I4Vo/VKCJFoqo1OpRl3OWXlL24c/rmr8ANJiWN/ZdqGSNQ
	t5puTc+h5y3NExNPHK3iJ8sq1vo1pitY5ELVebF/Ln7Ul9pD25C3LhD8FnNscW5glAKjPmXYNuWsv
	R3LA69h3Oy4VTVB25WGqI/LJxvXkOXJmgeEifWbB32r+G3p5ncCY4+ZFaLptz+qnpPyeb4gNSKCnn
	xZ0bP32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYg6-000000060hS-13x7;
	Thu, 14 May 2026 16:12:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYg2-000000060gN-1xNe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:12:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d7e23defbso4895998f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778775164; x=1779379964; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CVKq2ofJtZZwfzsFBSnZCZG0o+hDi7JCHHG+Wj8ChZg=;
        b=A0IVfsL5IQejz3Q/Ai0UgioNaLDFuWWOOIrFV4b9NA+nsNVlbu4DpKTxDnXNBP1uWG
         qqf4XkrdmdSMpxeqoWzJr1gEt1In6u3sz8jLOfETgmOlLjNAajE2m/iWRj35zDTbQtff
         KkhKFCpUWROt8WkQINF6uuRNJygaJjWU+q5FAh4rBll9s4lMIPaIaL6ceTtHcBrsXtq+
         XsECmu0tfnKakom+dvuFaTBKd3x8GwveQdnFumGj0IhVt7lwfbWrsyPSxcCe6t9tG4oL
         gHnhhnZP/c7IrgVfEvuuDMRhaZfcD7J4fifUxu/Ryk64ALfIhyR1R9XBGRgXVgwNImQL
         TWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778775164; x=1779379964;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CVKq2ofJtZZwfzsFBSnZCZG0o+hDi7JCHHG+Wj8ChZg=;
        b=Dj6qFbqW2y9/DQCRV2YelFCkPJf+gS20owAH9YJVuDgN6eltchGGw+fluOXSOjrs8/
         fVR2MZ65Gu03iIub46c5pR5dkeMJ615OxLSTflO4EAYwro4yKW5tK5xDWLMapy5D0YTJ
         1a4JS7bBXh2WYFdsOC+b7ofA5wjKMXvhEHxXkJVu1UyaFKtCqG5l8bsSVQICXA2Ek0rj
         p/UMbPnErc+VJPvMEqeKZfPlHQ8jUJFAQTfQGenkC6+RHtYZVXgfLqm50qA2Sl0uZ8Vg
         f3n5uPxSdx/nfq941347kN2PC+R3HQjFo4bI9wswmEF3XNOmADP3TxpcnLKGCpz/gFJm
         4J3w==
X-Forwarded-Encrypted: i=1; AFNElJ9gkyhFkl8QFtrD9dOCHurns648dRMOtLqF2638GFvTSVoH4QCZQWIUqsUWZOD6oac7LKSL2c94UEp0xGO+G6jU@lists.infradead.org
X-Gm-Message-State: AOJu0YwGpKy3ZtL/dyFI50Dy4CUfPe31WLd+5q26hqlv40I6mjYOg6dd
	Hg+vZArROS+VNM4lkR5h9MW/L9JWP7MHD7ixd/MxUGShfobV4C8vr+oRBcpA9CECFfs=
X-Gm-Gg: Acq92OHCIUlY96redGGd35X2AmmyZY3AXuGMwrTdDgpIqlW8DknMLrOKkOByfJis6aC
	ICM1qZ3MH2NSyHa/He+eFc8hSDCjkUrAgocmq1yB/9EGEcE2R94jM5qcTvZz58C5oHwVwUtK3W3
	VE+aAqToUaNK0R1bxqeCP0K0APPU9JSb4E665fyXLaFB7bMtIPp/EvX2NRCoRANVJQHSsV8DFzV
	k6z5/wvkTfOx0GLFPun9Ua+OsZH9IhYjtrgeaI6ef/AGJ2paOE2W3GcgYIl3nK+TcU78vsm/NKi
	DsDe337MZgVHVixxNuwpghOLkVk0aRcwYeqOtswEGCtiRBw3nx6RcVhm0no5Ch2Emdh6mbelJfj
	+e8ubLjSCW5dqtDTmd96lpyEKyrXbaCc+jfk3/emitgGUqJFelLeC+ONx8aeVFrkYHm3bygCDaM
	JoFy39psMVlncOUh4+FH0=
X-Received: by 2002:a05:6000:2c01:b0:456:e27d:d6aa with SMTP id ffacd0b85a97d-45c5762d196mr13168131f8f.2.1778775163814;
        Thu, 14 May 2026 09:12:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ed30110sm8435696f8f.13.2026.05.14.09.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 09:12:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/10] clk: amlogic: Add A9 PLL clock controller driver
In-Reply-To: <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:30 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 18:12:41 +0200
Message-ID: <1jh5oa6kcm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_091246_865027_20F0C298 
X-CRM114-Status: GOOD (  31.64  )
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

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> Add the PLL clock controller driver for the Amlogic A9 SoC family.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig  |  13 +
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/a9-pll.c | 831 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 845 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index cf8cf3f9e4ee..3549e67d6988 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
>  
> +config COMMON_CLK_A9_PLL
> +	tristate "Amlogic A9 SoC PLL controller support"
> +	depends on ARM64
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_PLL
> +	imply COMMON_CLK_SCMI
> +	help
> +	  Support for the PLL clock controller on Amlogic A311Y3 based
> +	  device, AKA A9. PLLs are required by most peripheral to operate.
> +	  Say Y if you want A9 PLL clock controller to work.
> +
>  config COMMON_CLK_C3_PLL
>  	tristate "Amlogic C3 PLL clock controller"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index c6719694a242..77636033061f 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-pll.c b/drivers/clk/meson/a9-pll.c
> new file mode 100644
> index 000000000000..84b591c3afff
> --- /dev/null
> +++ b/drivers/clk/meson/a9-pll.c
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-pll-clkc.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "meson-clkc-utils.h"
> +
> +#define GP0PLL_CTRL0			0x00
> +#define GP0PLL_CTRL1			0x04
> +#define GP0PLL_CTRL2			0x08
> +#define GP0PLL_CTRL3			0x0c
> +#define GP0PLL_CTRL4			0x10
> +
> +/* HIFI0 and HIFI1 share the same IP and register offset layout. */
> +#define HIFIPLL_CTRL0			0x00
> +#define HIFIPLL_CTRL1			0x04
> +#define HIFIPLL_CTRL2			0x08
> +#define HIFIPLL_CTRL3			0x0c
> +#define HIFIPLL_CTRL4			0x10
> +
> +/* MCLK0 and MCLK1 share the same IP and register offset layout. */
> +#define MCLKPLL_CTRL0			0x00
> +#define MCLKPLL_CTRL1			0x04
> +#define MCLKPLL_CTRL2			0x08
> +#define MCLKPLL_CTRL3			0x0c
> +#define MCLKPLL_CTRL4			0x10
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +	MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit) \
> +	MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
> +/*
> + * Compared with previous SoC PLLs, the A9 PLL input path has an inherent
> + * 2-divider. The N pre-divider follows the same calculation rule as OD,
> + * where the pre-divider ratio equals 2^N.
> + *
> + * A9 PLL is composed as follows:
> + *
> + *                      PLL
> + *         +---------------------------------+
> + *         |                                 |
> + *         |             +--+                |
> + *  in/2 >>---[ /2^N ]-->|  |      +-----+   |
> + *         |             |  |------| DCO |----->> out
> + *         |  +--------->|  |      +--v--+   |
> + *         |  |          +--+         |      |
> + *         |  |                       |      |
> + *         |  +--[ *(M + (F/Fmax) ]<--+      |
> + *         |                                 |
> + *         +---------------------------------+
> + *
> + * out = in / 2  * (m + frac / frac_max) / 2^n
> + */
> +
> +static struct clk_fixed_factor a9_gp0_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gp0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_gp0_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = GP0PLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};

When document something, be sure it matches what you are doing
afterward. It is confusing otherwise. Your comments above clearly miss
this gate.

A fixed 2 divider followed by a power of 2 divider ? Is it actually how
the HW works or your modelisation power of 2 that's shifted by 1,
mapping :
 * 0 -> 2
 * 1 -> 4
 * etc ...

?

> +
> +/* The output frequency range of the A9 PLL_DCO is 1.4 GHz to 2.8 GHz. */
> +static const struct pll_mult_range a9_pll_mult_range = {
> +	.min = 117,
> +	.max = 233,
> +};

If PLL restriction is actually the DCO output rate, and only the reason
to keep the pre-devider in the range above, I would definitely welcome a
rework to express the constraints properly and split the pre-divider out.

> +
> +static const struct reg_sequence a9_gp0_pll_init_regs[] = {
> +	{ .reg = GP0PLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = GP0PLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = GP0PLL_CTRL2, .def = 0x1219b010 },
> +	{ .reg = GP0PLL_CTRL3, .def = 0x00008010 }
> +};
> +
> +static struct clk_regmap a9_gp0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = GP0PLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = GP0PLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_gp0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_gp0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* For gp0, hifi and mclk pll, the maximum value of od is 4. */
> +static const struct clk_div_table a9_pll_od_table[] = {
> +	{ 0,  1 },
> +	{ 1,  2 },
> +	{ 2,  4 },
> +	{ 3,  8 },
> +	{ 4,  16 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap a9_gp0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = GP0PLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_gp0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a9_hifi0_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi0_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_hifi0_pll_init_regs[] = {
> +	{ .reg = HIFIPLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = HIFIPLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = HIFIPLL_CTRL2, .def = 0x1219b010 },
> +	{ .reg = HIFIPLL_CTRL3, .def = 0x00008010 }
> +};

It look like GP0 and HIFI PLL are exactly the same IP, you've even
documented it as such. Yet all the code is duplicated. That's not OK.

I understand that way we statically declared the clocks so far pushed
you in that direction. That's something I'd like to fix properly
someday.

In the meantime, you could at least duplicate the memory at runtime to
avoid copy/pasting the code. A minor change to clkc utils as suggested
at the end of this message could help you do so.

Same probably applies to mclks.

> +
> +static struct clk_regmap a9_hifi0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_hifi0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_hifi0_pll_init_regs),
> +		.frac_max = 100000,
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_fixed_factor a9_hifi1_in_div2_div = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "hifi1_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi1_in_div2 = {
> +	.data = &(struct clk_regmap_gate_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.bit_idx = 27,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_in_div2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_in_div2_div.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_hifi1_pll_init_regs[] = {
> +	{ .reg = HIFIPLL_CTRL0, .def = 0x00010000 },
> +	{ .reg = HIFIPLL_CTRL1, .def = 0x11480000 },
> +	{ .reg = HIFIPLL_CTRL2, .def = 0x1219b011 },
> +	{ .reg = HIFIPLL_CTRL3, .def = 0x00008010 }
> +};
> +
> +static struct clk_regmap a9_hifi1_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.frac = {
> +			.reg_off = HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.l = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = HIFIPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_hifi1_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_hifi1_pll_init_regs),
> +		.frac_max = 100000,
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_hifi1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = HIFIPLL_CTRL0,
> +		.shift = 20,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_hifi1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +/*
> + * Unlike GP0 and HIFI PLLs, the input divider 2 of MCLK PLL is
> + * enabled by default and has no enable control bit.
> + */
> +static struct clk_fixed_factor a9_mclk0_in_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk0_in_div2_div",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence a9_mclk0_pll_init_regs[] = {
> +	{ .reg = MCLKPLL_CTRL1, .def = 0x00422000 },
> +	{ .reg = MCLKPLL_CTRL2, .def = 0x60000100 },
> +	{ .reg = MCLKPLL_CTRL3, .def = 0x02000200 },
> +	{ .reg = MCLKPLL_CTRL4, .def = 0xd616d616 }
> +};
> +
> +static struct clk_regmap a9_mclk0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.l = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_mclk0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_mclk0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 0,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_0_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 3,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_0_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_0_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk0_0_parents[] = {
> +	{ .hw = &a9_mclk0_0_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk0_0, MCLKPLL_CTRL3, 12, 0x3, a9_mclk0_0_parents);
> +static A9_COMP_DIV(mclk0_0, MCLKPLL_CTRL3, 10, 1);
> +static A9_COMP_GATE(mclk0_0, MCLKPLL_CTRL3, 8);
> +
> +static struct clk_regmap a9_mclk0_1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 16,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk0_1_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 19,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk0_1_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk0_1_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk0_1_parents[] = {
> +	{ .hw = &a9_mclk0_1_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk0_1, MCLKPLL_CTRL3, 28, 0x3, a9_mclk0_1_parents);
> +static A9_COMP_DIV(mclk0_1, MCLKPLL_CTRL3, 26, 1);
> +static A9_COMP_GATE(mclk0_1, MCLKPLL_CTRL3, 24);
> +
> +static struct clk_fixed_factor a9_mclk1_in_div2 = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mclk1_in_div2",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "in0",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 9,
> +		},
> +		.n = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 12,
> +			.width   = 3,
> +		},
> +		.l = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.l_detect = {
> +			.reg_off = MCLKPLL_CTRL0,
> +			.shift   = 30,
> +			.width   = 1,
> +		},
> +		.range = &a9_pll_mult_range,
> +		.init_regs = a9_mclk0_pll_init_regs,
> +		.init_count = ARRAY_SIZE(a9_mclk0_pll_init_regs),
> +		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
> +			 CLK_MESON_PLL_N_POWER_OF_TWO |
> +			 CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_in_div2.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 0,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_0_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 3,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_0_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_0_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk1_0_parents[] = {
> +	{ .hw = &a9_mclk1_0_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk1_0, MCLKPLL_CTRL3, 12, 0x3, a9_mclk1_0_parents);
> +static A9_COMP_DIV(mclk1_0, MCLKPLL_CTRL3, 10, 1);
> +static A9_COMP_GATE(mclk1_0, MCLKPLL_CTRL3, 8);
> +
> +static struct clk_regmap a9_mclk1_1_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 16,
> +		.width = 3,
> +		.table = a9_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_1_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap a9_mclk1_1_pre = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = MCLKPLL_CTRL3,
> +		.shift = 19,
> +		.width = 5,
> +		.flags = CLK_DIVIDER_MAX_AT_ZERO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "mclk1_1_pre",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_mclk1_1_pll.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct clk_parent_data a9_mclk1_1_parents[] = {
> +	{ .hw = &a9_mclk1_1_pre.hw },
> +	{ .fw_name = "in0" },
> +	{ .fw_name = "in1" },
> +	{ .fw_name = "in2" }
> +};
> +
> +static A9_COMP_SEL(mclk1_1, MCLKPLL_CTRL3, 28, 0x3, a9_mclk1_1_parents);
> +static A9_COMP_DIV(mclk1_1, MCLKPLL_CTRL3, 26, 1);
> +static A9_COMP_GATE(mclk1_1, MCLKPLL_CTRL3, 24);
> +
> +static struct clk_hw *a9_gp0_hw_clks[] = {
> +	[CLKID_GP0_IN_DIV2_DIV]		= &a9_gp0_in_div2_div.hw,
> +	[CLKID_GP0_IN_DIV2]		= &a9_gp0_in_div2.hw,
> +	[CLKID_GP0_PLL_DCO]		= &a9_gp0_pll_dco.hw,
> +	[CLKID_GP0_PLL]			= &a9_gp0_pll.hw,
> +};
> +
> +static struct clk_hw *a9_hifi0_hw_clks[] = {
> +	[CLKID_HIFI0_IN_DIV2_DIV]	= &a9_hifi0_in_div2_div.hw,
> +	[CLKID_HIFI0_IN_DIV2]		= &a9_hifi0_in_div2.hw,
> +	[CLKID_HIFI0_PLL_DCO]		= &a9_hifi0_pll_dco.hw,
> +	[CLKID_HIFI0_PLL]		= &a9_hifi0_pll.hw,
> +};
> +
> +static struct clk_hw *a9_hifi1_hw_clks[] = {
> +	[CLKID_HIFI1_IN_DIV2_DIV]	= &a9_hifi1_in_div2_div.hw,
> +	[CLKID_HIFI1_IN_DIV2]		= &a9_hifi1_in_div2.hw,
> +	[CLKID_HIFI1_PLL_DCO]		= &a9_hifi1_pll_dco.hw,
> +	[CLKID_HIFI1_PLL]		= &a9_hifi1_pll.hw,
> +};
> +
> +static struct clk_hw *a9_mclk0_hw_clks[] = {
> +	[CLKID_MCLK0_IN_DIV2]		= &a9_mclk0_in_div2.hw,
> +	[CLKID_MCLK0_PLL_DCO]		= &a9_mclk0_pll_dco.hw,
> +	[CLKID_MCLK0_0_PLL]		= &a9_mclk0_0_pll.hw,
> +	[CLKID_MCLK0_0_PRE]		= &a9_mclk0_0_pre.hw,
> +	[CLKID_MCLK0_0_SEL]		= &a9_mclk0_0_sel.hw,
> +	[CLKID_MCLK0_0_DIV]		= &a9_mclk0_0_div.hw,
> +	[CLKID_MCLK0_0]			= &a9_mclk0_0.hw,
> +	[CLKID_MCLK0_1_PLL]		= &a9_mclk0_1_pll.hw,
> +	[CLKID_MCLK0_1_PRE]		= &a9_mclk0_1_pre.hw,
> +	[CLKID_MCLK0_1_SEL]		= &a9_mclk0_1_sel.hw,
> +	[CLKID_MCLK0_1_DIV]		= &a9_mclk0_1_div.hw,
> +	[CLKID_MCLK0_1]			= &a9_mclk0_1.hw,
> +};
> +
> +static struct clk_hw *a9_mclk1_hw_clks[] = {
> +	[CLKID_MCLK1_IN_DIV2]		= &a9_mclk1_in_div2.hw,
> +	[CLKID_MCLK1_PLL_DCO]		= &a9_mclk1_pll_dco.hw,
> +	[CLKID_MCLK1_0_PLL]		= &a9_mclk1_0_pll.hw,
> +	[CLKID_MCLK1_0_PRE]		= &a9_mclk1_0_pre.hw,
> +	[CLKID_MCLK1_0_SEL]		= &a9_mclk1_0_sel.hw,
> +	[CLKID_MCLK1_0_DIV]		= &a9_mclk1_0_div.hw,
> +	[CLKID_MCLK1_0]			= &a9_mclk1_0.hw,
> +	[CLKID_MCLK1_1_PLL]		= &a9_mclk1_1_pll.hw,
> +	[CLKID_MCLK1_1_PRE]		= &a9_mclk1_1_pre.hw,
> +	[CLKID_MCLK1_1_SEL]		= &a9_mclk1_1_sel.hw,
> +	[CLKID_MCLK1_1_DIV]		= &a9_mclk1_1_div.hw,
> +	[CLKID_MCLK1_1]			= &a9_mclk1_1.hw,
> +};
> +
> +static const struct meson_clkc_data a9_gp0_data = {
> +	.hw_clks = {
> +		.hws = a9_gp0_hw_clks,
> +		.num = ARRAY_SIZE(a9_gp0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_hifi0_data = {
> +	.hw_clks = {
> +		.hws = a9_hifi0_hw_clks,
> +		.num = ARRAY_SIZE(a9_hifi0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_hifi1_data = {
> +	.hw_clks = {
> +		.hws = a9_hifi1_hw_clks,
> +		.num = ARRAY_SIZE(a9_hifi1_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_mclk0_data = {
> +	.hw_clks = {
> +		.hws = a9_mclk0_hw_clks,
> +		.num = ARRAY_SIZE(a9_mclk0_hw_clks),
> +	},
> +};
> +
> +static const struct meson_clkc_data a9_mclk1_data = {
> +	.hw_clks = {
> +		.hws = a9_mclk1_hw_clks,
> +		.num = ARRAY_SIZE(a9_mclk1_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a9_pll_clkc_match_table[] = {
> +	{ .compatible = "amlogic,a9-gp0-pll",	.data = &a9_gp0_data, },
> +	{ .compatible = "amlogic,a9-hifi0-pll",	.data = &a9_hifi0_data, },
> +	{ .compatible = "amlogic,a9-hifi1-pll",	.data = &a9_hifi1_data, },
> +	{ .compatible = "amlogic,a9-mclk0-pll",	.data = &a9_mclk0_data, },
> +	{ .compatible = "amlogic,a9-mclk1-pll", .data = &a9_mclk1_data, },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a9_pll_clkc_match_table);
> +
> +static struct platform_driver a9_pll_clkc_driver = {
> +	.probe		= meson_clkc_mmio_probe,
> +	.driver		= {
> +		.name	= "a9-pll-clkc",
> +		.of_match_table = a9_pll_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a9_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A9 PLL Clock Controller Driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- >8 --
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index 870f50548e26..f95a0d9212fa 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -26,16 +26,12 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 }
 EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
-static int meson_clkc_init(struct device *dev, struct regmap *map)
+static int meson_clkc_init(struct device *dev, struct regmap *map,
+	const struct meson_clkc_data *data)
 {
-	const struct meson_clkc_data *data;
 	struct clk_hw *hw;
 	int ret, i;
 
-	data = of_device_get_match_data(dev);
-	if (!data)
-		return -EINVAL;
-
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
@@ -59,6 +55,7 @@ static int meson_clkc_init(struct device *dev, struct regmap *map)
 
 int meson_clkc_syscon_probe(struct platform_device *pdev)
 {
+	const struct meson_clkc_data *data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct regmap *map;
@@ -71,7 +68,11 @@ int meson_clkc_syscon_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
-	return meson_clkc_init(dev, map);
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return -EINVAL;
+
+	return meson_clkc_init(dev, map, data);
 }
 EXPORT_SYMBOL_NS_GPL(meson_clkc_syscon_probe, "CLK_MESON");
 
@@ -102,7 +103,7 @@ int meson_clkc_mmio_probe(struct platform_device *pdev)
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	return meson_clkc_init(dev, map);
+	return meson_clkc_init(dev, map, data);
 }
 EXPORT_SYMBOL_NS_GPL(meson_clkc_mmio_probe, "CLK_MESON");

