Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFB1D58D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 16:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9LKGHY+n2VuCwFgoMlvBxOpP/MdV9C2CRc1q4v4D50=; b=j+omvkUXkFNyXdh2KDo3aslgKp
	oOFu6biQLeqK35HC3CD6qWoAMcceT5Ca+c+zPUWkx17uoAsxKKbn83kGxNfb9+uDE+yLg2csr8gV6
	Furyd9nklz2ip0+srNfi2hSwAcciY/+NUABcwiZUxroEIbvtr7A46M6oHbm1cPEzE5Ra/BO27belO
	gBiGm+fOKyzw8QxxNO5tIN4f7z+r7mLTSAwEHsnL0WbkOLp9/7IOKuby/aEo4kD5KAmvT4xDZCKxf
	ATDFN44VAQ26WKuQxAEMTmhSYJXLy6m+m7fMITJwwzY+dogZWLb445srSbxHktw+eM2DFduLvl1vO
	Y/oroTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcK5-00000008fXs-0LgQ;
	Mon, 25 Nov 2024 16:52:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFcJ5-00000008fPS-3K7g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 16:51:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so6991125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732553486; x=1733158286; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9LKGHY+n2VuCwFgoMlvBxOpP/MdV9C2CRc1q4v4D50=;
        b=3K8DSs0h4McFLOMCnqTlfV2NJTZ6WMw84ZlrQbCstVKVlrIEE0m/raaJYl2v5XHf1/
         iQyekyyiqQ5MzOVY+u2gATPR+4EQwVME0FIDTx1LVj6AwUXvAFe9ZSRKZKvd8MID6zjS
         u1U2abavF9aqCUVf831zQA0UqVVJl624O441Wfyrcp/N+tvjPu6B9GfDK7Nr2nVKUhnH
         JTMl1Pj0z8j8W/xdG5sYeXb6KzotXTCyVF/SV/3y0qrcxxQFXE7MrBeUEOe27RkmZ1BH
         wB+OWsBPkE3p2uDa6mD2PLqHwWqYzrVfV0XJTQiZ81Z0PDQXsbcBZtjwWkiu2usRhv7j
         v3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732553486; x=1733158286;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9LKGHY+n2VuCwFgoMlvBxOpP/MdV9C2CRc1q4v4D50=;
        b=ItS+oddAcqKHOHHZLNJB67o/0Disibs08EhkaEFlZS8CMwQjpjqvu1oEvFGZOrW88u
         kcl3UpXvJjhtqMN/sDYzPbKSOnXT7H4a3pcLuOxdsryVxMI+Z/ts1WX7evJkEB7/+fJ3
         pW980qDifq1lFGOf1yxuFUHQBcFUSJ4PpP5Q3GwncsgN7+33wiIMPkIHSl+cKfup4mce
         yqFzxLxpxXqEMDVw5ZcW8nNwRys1poKYmRk08FYCzS683wro5akq33bWLiGG75gDnFQz
         I6eboG79Hovs4TyYeg0QD6nW6aaMbV8joU2BoK7lk3eMSXBFnVir5XqISiuxhejm5bgp
         OWqw==
X-Forwarded-Encrypted: i=1; AJvYcCXoD6kb5ciCeRaUt/oZHMrpa4gPs5NZcXRgvUaKdrEt4+gMtyQCFc3+8+zm/nKAAnuLQxO30DgrZuC//UBCxumZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7aJujsc7yIyCdnSglhY7mxan4zFJpIooyPkh0k3bH0Zelg3kD
	PjbcvtgZkIpMw07w73Ll9nWRENlnj13w/nwkOVjbqh88SfAf0pMnL6z84KK4K4w=
X-Gm-Gg: ASbGnctbRzc8BFz9gSqmL2U+5UvoaqnYJ6GNofzHKDzK+60+5NBcr/Mgwll8kkHgphD
	x8R4l8Ll0lBdrblLeGpaS7mcIja/DgHhzq7tMBqwKZmtOFC13GLoCsVdYj9GVKOf0BmDSoGhf3C
	EBGrHcnNL7Du2ZVK3m+1luYlLg/7rgs8dz8HlsuYb5wzKQtBUE1/67Uh1N4X7byVXjaOMlXBJqb
	zlW9GrZSrtpdLMpcpvV0a3PIU5vNzKqwPK8GPU/mi8oo1bT
X-Google-Smtp-Source: AGHT+IEc03COT6wx6erLskD4lox1ydrf6a+Xm0ETvYASVlFq+ced6YaLlCbtJ5DntRbdJVR7ssKeGA==
X-Received: by 2002:a05:6000:23c5:b0:382:3e51:4b1d with SMTP id ffacd0b85a97d-38260b59530mr7966719f8f.20.1732553485455;
        Mon, 25 Nov 2024 08:51:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:97f5:4cdc:1888:403])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825faf9d97sm10809790f8f.35.2024.11.25.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 08:51:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Chuan Liu <chuan.liu@amlogic.com>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  xianwei.zhao@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] clk: meson: add support for the A5 SoC PLL clock
In-Reply-To: <20241120-a5-clk-v2-4-1208621e961d@amlogic.com> (Xianwei Zhao
	via's message of "Wed, 20 Nov 2024 15:01:16 +0800")
References: <20241120-a5-clk-v2-0-1208621e961d@amlogic.com>
	<20241120-a5-clk-v2-4-1208621e961d@amlogic.com>
Date: Mon, 25 Nov 2024 17:51:24 +0100
Message-ID: <1jttbvtfxv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_085127_827124_4B381963 
X-CRM114-Status: GOOD (  26.72  )
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

On Wed 20 Nov 2024 at 15:01, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Add the PLL clock controller driver for the Amlogic A5 SoC family.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig  |  14 ++
>  drivers/clk/meson/Makefile |   1 +
>  drivers/clk/meson/a5-pll.c | 543 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 558 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 78f648c9c97d..3c97b3a1649d 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,20 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
>  
> +config COMMON_CLK_A5_PLL
> +	tristate "Amlogic A5 PLL clock controller"
> +	depends on ARM64
> +	default y
> +	imply COMMON_CLK_SCMI
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_PLL
> +	select COMMON_CLK_MESON_MPLL
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	help
> +	  Support for the PLL clock controller on Amlogic AV40x device, AKA A5.

What is an AV40x ? if it is a SoC that's alright.
If it is a board, then it is not Ok. The driver does not support a
single board, does it ?

> +	  Say Y if you want the board to work, because PLLs are the parent
> +	  of most peripherals.
> +
>  config COMMON_CLK_C3_PLL
>  	tristate "Amlogic C3 PLL clock controller"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index bc56a47931c1..fc4b8a723145 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A5_PLL) += a5-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a5-pll.c b/drivers/clk/meson/a5-pll.c
> new file mode 100644
> index 000000000000..f18700dfd055
> --- /dev/null
> +++ b/drivers/clk/meson/a5-pll.c
> @@ -0,0 +1,543 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Amlogic A5 PLL Controller Driver
> + *
> + * Copyright (c) 2024 Amlogic, inc.
> + * Author: Chuan Liu <chuan.liu@amlogic.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-mpll.h"
> +#include "meson-clkc-utils.h"
> +#include <dt-bindings/clock/amlogic,a5-pll-clkc.h>
> +
> +#define ANACTRL_GP0PLL_CTRL0			0x80
> +#define ANACTRL_GP0PLL_CTRL1			0x84
> +#define ANACTRL_GP0PLL_CTRL2			0x88
> +#define ANACTRL_GP0PLL_CTRL3			0x8c
> +#define ANACTRL_GP0PLL_CTRL4			0x90
> +#define ANACTRL_GP0PLL_CTRL5			0x94
> +#define ANACTRL_GP0PLL_CTRL6			0x98
> +#define ANACTRL_HIFIPLL_CTRL0			0x100
> +#define ANACTRL_HIFIPLL_CTRL1			0x104
> +#define ANACTRL_HIFIPLL_CTRL2			0x108
> +#define ANACTRL_HIFIPLL_CTRL3			0x10c
> +#define ANACTRL_HIFIPLL_CTRL4			0x110
> +#define ANACTRL_HIFIPLL_CTRL5			0x114
> +#define ANACTRL_HIFIPLL_CTRL6			0x118
> +#define ANACTRL_MPLL_CTRL0			0x180
> +#define ANACTRL_MPLL_CTRL1			0x184
> +#define ANACTRL_MPLL_CTRL2			0x188
> +#define ANACTRL_MPLL_CTRL3			0x18c
> +#define ANACTRL_MPLL_CTRL4			0x190
> +#define ANACTRL_MPLL_CTRL5			0x194
> +#define ANACTRL_MPLL_CTRL6			0x198
> +#define ANACTRL_MPLL_CTRL7			0x19c
> +#define ANACTRL_MPLL_CTRL8			0x1a0

Same question as usual, is there clocks and *ONLY* clock between 0x0 and
0x1a0 ?

If you can guarantee that, you'll need to split the controller into
multiple devices.

> +
> +static struct clk_fixed_factor mpll_prediv = {
> +	.mult = 1,
> +	.div = 2,
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll_prediv",
> +		.ops = &clk_fixed_factor_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "fix_dco"
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static const struct reg_sequence mpll0_init_regs[] = {
> +	{ .reg = ANACTRL_MPLL_CTRL2,	.def = 0x40000033 },
> +};
> +
> +static struct clk_regmap mpll0_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = ANACTRL_MPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = ANACTRL_MPLL_CTRL1,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = ANACTRL_MPLL_CTRL1,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = ANACTRL_MPLL_CTRL1,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = mpll0_init_regs,
> +		.init_count = ARRAY_SIZE(mpll0_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll0_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap mpll0 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_MPLL_CTRL1,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll0",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &mpll0_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence mpll1_init_regs[] = {
> +	{ .reg = ANACTRL_MPLL_CTRL4,	.def = 0x40000033 },
> +};
> +
> +static struct clk_regmap mpll1_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = ANACTRL_MPLL_CTRL3,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = ANACTRL_MPLL_CTRL3,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = ANACTRL_MPLL_CTRL3,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = ANACTRL_MPLL_CTRL3,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = mpll1_init_regs,
> +		.init_count = ARRAY_SIZE(mpll1_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll1_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap mpll1 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_MPLL_CTRL3,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll1",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &mpll1_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence mpll2_init_regs[] = {
> +	{ .reg = ANACTRL_MPLL_CTRL6,	.def = 0x40000033 },
> +};
> +
> +static struct clk_regmap mpll2_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = ANACTRL_MPLL_CTRL5,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = ANACTRL_MPLL_CTRL5,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = ANACTRL_MPLL_CTRL5,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = ANACTRL_MPLL_CTRL5,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = mpll2_init_regs,
> +		.init_count = ARRAY_SIZE(mpll2_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll2_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap mpll2 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_MPLL_CTRL5,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll2",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &mpll2_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence mpll3_init_regs[] = {
> +	{ .reg = ANACTRL_MPLL_CTRL8,	.def = 0x40000033 },
> +};
> +
> +static struct clk_regmap mpll3_div = {
> +	.data = &(struct meson_clk_mpll_data){
> +		.sdm = {
> +			.reg_off = ANACTRL_MPLL_CTRL7,
> +			.shift   = 0,
> +			.width   = 14,
> +		},
> +		.sdm_en = {
> +			.reg_off = ANACTRL_MPLL_CTRL7,
> +			.shift   = 30,
> +			.width	 = 1,
> +		},
> +		.n2 = {
> +			.reg_off = ANACTRL_MPLL_CTRL7,
> +			.shift   = 20,
> +			.width   = 9,
> +		},
> +		.ssen = {
> +			.reg_off = ANACTRL_MPLL_CTRL7,
> +			.shift   = 29,
> +			.width	 = 1,
> +		},
> +		.init_regs = mpll3_init_regs,
> +		.init_count = ARRAY_SIZE(mpll3_init_regs),
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll3_div",
> +		.ops = &meson_clk_mpll_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&mpll_prediv.hw
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap mpll3 = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = ANACTRL_MPLL_CTRL7,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = &(struct clk_init_data){
> +		.name = "mpll3",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_hws = (const struct clk_hw *[]) { &mpll3_div.hw },
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence gp0_init_regs[] = {
> +	{ .reg = ANACTRL_GP0PLL_CTRL2, .def = 0x00000000 },
> +	{ .reg = ANACTRL_GP0PLL_CTRL3, .def = 0x6a295c00 },
> +	{ .reg = ANACTRL_GP0PLL_CTRL4, .def = 0x65771290 },
> +	{ .reg = ANACTRL_GP0PLL_CTRL5, .def = 0x3927200a },
> +	{ .reg = ANACTRL_GP0PLL_CTRL6, .def = 0x54540000 }
> +};
> +
> +static const struct pll_mult_range gp0_pll_mult_range = {
> +	.min = 125,
> +	.max = 250,
> +};
> +
> +static struct clk_regmap gp0_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = ANACTRL_GP0PLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &gp0_pll_mult_range,
> +		.init_regs = gp0_init_regs,
> +		.init_count = ARRAY_SIZE(gp0_init_regs),
> +		.frac_max = 100000,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal_24m",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +/* The maximum frequency divider supports is 32, not 128(2^7) */
> +static const struct clk_div_table gp0_pll_od_table[] = {
> +	{ 0,  1 },
> +	{ 1,  2 },
> +	{ 2,  4 },
> +	{ 3,  8 },
> +	{ 4, 16 },
> +	{ 5, 32 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap gp0_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = ANACTRL_GP0PLL_CTRL0,
> +		.shift = 16,
> +		.width = 3,
> +		.table = gp0_pll_od_table,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "gp0_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&gp0_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static const struct reg_sequence hifi_init_regs[] = {
> +	{ .reg = ANACTRL_HIFIPLL_CTRL2, .def = 0x00000000 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL3, .def = 0x6a295c00 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL4, .def = 0x65771290 },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL5, .def = 0x3927200a },
> +	{ .reg = ANACTRL_HIFIPLL_CTRL6, .def = 0x54540000 }
> +};
> +
> +static const struct pll_mult_range hifi_pll_mult_range = {
> +	.min = 125,
> +	.max = 250,
> +};
> +
> +static struct clk_regmap hifi_pll_dco = {
> +	.data = &(struct meson_clk_pll_data) {
> +		.en = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.m = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 0,
> +			.width   = 8,
> +		},
> +		.frac = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
> +		.n = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 10,
> +			.width   = 5,
> +		},
> +		.l = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 31,
> +			.width   = 1,
> +		},
> +		.rst = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL0,
> +			.shift   = 29,
> +			.width   = 1,
> +		},
> +		.range = &hifi_pll_mult_range,
> +		.init_regs = hifi_init_regs,
> +		.init_count = ARRAY_SIZE(hifi_init_regs),
> +		.frac_max = 100000,
> +		/* NOTE: The original design of hifi_pll is to provide
> +		 * clock for audio, which requires clock accuracy.
> +		 * Therefore, flag CLK_MESON_PLL_ROUND_CLOSEST is added
> +		 * to make the output frequency of hifi_pll closer to
> +		 * the target frequency.
> +		 */

The comment format is incorrect. not quite sure the commnet itself is useful.

> +		.flags = CLK_MESON_PLL_ROUND_CLOSEST,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll_dco",
> +		.ops = &meson_clk_pll_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal_24m",
> +		},
> +		.num_parents = 1,
> +	},
> +};
> +
> +static struct clk_regmap hifi_pll = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = ANACTRL_HIFIPLL_CTRL0,
> +		.shift = 16,
> +		/* NOTE: The actual reserved bit width of the od (output
> +		 * divider) of hifi_pll is 3 bit, but its actual maximum
> +		 * effective divider factor is 8. It can just use 2 bit and add
> +		 * flag CLK_DIVIDER_POWER_OF_TWO (max_div = 2^3 = 8).
> +		 */

Same here

> +		.width = 2,

... yet the width is 2 ??

> +		.flags = CLK_DIVIDER_POWER_OF_TWO,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "hifi_pll",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&hifi_pll_dco.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};
> +
> +static struct clk_hw *a5_pll_hw_clks[] = {
> +	[CLKID_MPLL_PREDIV]	= &mpll_prediv.hw,
> +	[CLKID_MPLL0_DIV]	= &mpll0_div.hw,
> +	[CLKID_MPLL0]		= &mpll0.hw,
> +	[CLKID_MPLL1_DIV]	= &mpll1_div.hw,
> +	[CLKID_MPLL1]		= &mpll1.hw,
> +	[CLKID_MPLL2_DIV]	= &mpll2_div.hw,
> +	[CLKID_MPLL2]		= &mpll2.hw,
> +	[CLKID_MPLL3_DIV]	= &mpll3_div.hw,
> +	[CLKID_MPLL3]		= &mpll3.hw,
> +	[CLKID_GP0_PLL_DCO]	= &gp0_pll_dco.hw,
> +	[CLKID_GP0_PLL]		= &gp0_pll.hw,
> +	[CLKID_HIFI_PLL_DCO]	= &hifi_pll_dco.hw,
> +	[CLKID_HIFI_PLL]	= &hifi_pll.hw
> +};
> +
> +/* Convenience table to populate regmap in .probe */
> +static struct clk_regmap *const a5_pll_clk_regmaps[] = {
> +	&mpll0_div,
> +	&mpll0,
> +	&mpll1_div,
> +	&mpll1,
> +	&mpll2_div,
> +	&mpll2,
> +	&mpll3_div,
> +	&mpll3,
> +	&gp0_pll_dco,
> +	&gp0_pll,
> +	&hifi_pll_dco,
> +	&hifi_pll
> +};
> +
> +static const struct regmap_config clkc_regmap_config = {
> +	.reg_bits       = 32,
> +	.val_bits       = 32,
> +	.reg_stride     = 4,
> +	.max_register   = ANACTRL_MPLL_CTRL8,
> +};
> +
> +static struct meson_clk_hw_data a5_pll_clks = {
> +	.hws = a5_pll_hw_clks,
> +	.num = ARRAY_SIZE(a5_pll_hw_clks),
> +};
> +
> +static int aml_a5_pll_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int clkid, ret, i;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	/* Populate regmap for the regmap backed clocks */
> +	for (i = 0; i < ARRAY_SIZE(a5_pll_clk_regmaps); i++)
> +		a5_pll_clk_regmaps[i]->map = regmap;
> +
> +	for (clkid = 0; clkid < a5_pll_clks.num; clkid++) {
> +		/* array might be sparse */
> +		if (!a5_pll_clks.hws[clkid])
> +			continue;
> +
> +		ret = devm_clk_hw_register(dev, a5_pll_clks.hws[clkid]);
> +		if (ret) {
> +			dev_err(dev, "Clock registration failed\n");
> +			return ret;
> +		}
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
> +					   &a5_pll_clks);
> +}
> +
> +static const struct of_device_id a5_pll_clkc_match_table[] = {
> +	{
> +		.compatible = "amlogic,a5-pll-clkc",
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, a5_pll_clkc_match_table);
> +
> +static struct platform_driver a5_pll_driver = {
> +	.probe		= aml_a5_pll_probe,
> +	.driver		= {
> +		.name	= "a5-pll-clkc",
> +		.of_match_table = a5_pll_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a5_pll_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A5 PLL Clock Controller driver");
> +MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
> +MODULE_LICENSE("GPL");

-- 
Jerome

