Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF5AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cG0kJOqvQdLpEmchGNMaA8OFTfI/RCLor80J1PgVfZs=; b=p4Pwo+5vI60U7RnjUnRvuKFZqF
	LuMA7y13nA0kUuXGr8vko5auw4slGx4zd6/qMfLVzZV/NwRRmaiaQ96iP7rFXcy9xTc+RmAj/Jlo1
	QofVt7fHgc8y9pFSj0+eTM+E0tS0MU3Pdwbs14r3ZmZXuQraka9+Ja8aCP5Qj8pfcwAneLcFkB1sT
	YGB0nO+VE8rxsZhHMlvXEqqMJfjtHOtnvl9WpMNjXmb2sfji/f7mdGcfBzwydBJ0lXDqTPVyS+Zwx
	9e15x2bJqdk4KWvNaF+F5USDbwkxGfIMiJfHjduwP/RdEb5t3Ct8r9OhjOnwhx9ojmo1h7PssnxbE
	Yce3IeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUw1-00000009x3x-0t7I;
	Tue, 18 Feb 2025 21:15:17 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUPy-00000009p7a-3RwC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:42:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f3ea6207cso2446668f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 12:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739911329; x=1740516129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cG0kJOqvQdLpEmchGNMaA8OFTfI/RCLor80J1PgVfZs=;
        b=O0zbc3vs/3oCmismYGSmSJGE4MQInyiXbBke7d44iHrYHhg2LCnXRgb9SujaWx8cim
         dtldG38bTm4JtmRiOo6/O78w4118+KKZIgC+6G98WP8SI/JsPVB6JLfjE9wdL7aWh5QC
         rjDlJagVDjcJWFpyHMkK6VO5OwnPTHTiJpLRQ6SIn+XENQOs84pWL5K7beeb8O+NN7ca
         ZryUXsqWLtt/5wthXEh1Yy8NrZjfxbgQUcxJiNMXeDiKBXmzuDnLEzEoPGAEko7FATI8
         4mJHGmjGUfSUTjp8gRO2X/zgigyak30rRNWVx2Ev0jo9HD6dQEJBcGE9UZxccqmF4NfY
         UCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739911329; x=1740516129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG0kJOqvQdLpEmchGNMaA8OFTfI/RCLor80J1PgVfZs=;
        b=h9KUhvTHL1arPG/+8U+4sK2RNdH8lQRfxPvs0zXJ7fG2bYtrnbE476xbsDGNPXmIDb
         lOVbkwDYaaw7eH+Biz3dYPwTCQnxhkmzhqjoov/mGx+7dXImo7T9A8WSHKuzkD6J+JJD
         GecxKArrmuML4FV2wfdnE3FPdCcqP2Y5LWSeO54y2bu4xSt8JYp7m0SlkE3lC9ERRqhF
         UfaEkLozJtzPN0H3lrw5D4qmGVpuf6+xSl9owUF3uR6YsWkewFCsC8Fg8pNy+57RBUqs
         u/NwdQpN+cbiGMAa7jFmb6+cosrYwE1nkmq2m6xt/LJvJzokLCI+9/Sdd6Ckv1u9+G87
         0i4w==
X-Forwarded-Encrypted: i=1; AJvYcCWLzf4qcRORAk8BgO1rAzPQzuVZUJ8Z1DUdrZ00Q5dT2MMUL6vGv2NJ6eXXrbHXN9uO7Gd7cN+LEX3vTRk+sx+K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywes2WlIQ35TNVTAYetLSM7cQ5JPY5EfS5EcA+obLomKDCngYe7
	8arqr4uyntS78+USbxsjmaB4e+UjpV8yiV+0gSgYL45KweqiuUBl
X-Gm-Gg: ASbGncvi+80udvg/JPkB3TxuvZPKCe9rRLZAz0O78pfGkIA0Go+tUvhIBKpShfhVih1
	Ku/JqNr85VIPcWvcyHe8woESmBI+NIJgSRXZpFfoOYQlh8GbYNwa+qTd/L4wgxy9hO/XvSDo12R
	2Y3cnhGvMXNp+l6EqQnPTvO8igqk1flhch1vaQwTujG4Uj9tA5mmFyK4B4jga/k5W8QJy7oZ2QP
	dNGoL3mELXPdmOdVjd/MYmO+2rru2jDCwthcTDzGlu4lT8yx8w4A9wFM4sK25Xkxxyq5Hmlch7I
	otllob3BbHykohc+XRZojG+/Ab26gJ2VPE2rdW2JH/9qzvLUHT9jmC7+datBa6uMYKA=
X-Google-Smtp-Source: AGHT+IFO+5jiKhBwvsQewk5Wnf2OG4t+xe1dOa8s/zAgEuRRg3bDgy81GqKdu8oDzQJEtaaIwQMURQ==
X-Received: by 2002:a05:6000:178f:b0:38d:e0be:71a3 with SMTP id ffacd0b85a97d-38f34167cd9mr16618041f8f.54.1739911328838;
        Tue, 18 Feb 2025 12:42:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b4123sm16371069f8f.17.2025.02.18.12.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 12:42:08 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/15] clk: sunxi-ng: add support for the A523/T527 PRCM CCU
Date: Tue, 18 Feb 2025 21:42:06 +0100
Message-ID: <3136553.CbtlEUcBR6@jernej-laptop>
In-Reply-To: <20250214125359.5204-16-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-16-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_124210_864785_1A8CC898 
X-CRM114-Status: GOOD (  25.51  )
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

Dne petek, 14. februar 2025 ob 13:53:59 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The A523/T527 SoCs have clock/reset controls in the PRCM part, like many
> previous SoCs. For a change, the whole PRCM is documented in the A523
> manual, including the system bus tree, so we can describe all those
> clocks correctly based on that. There layout seems to be derived from
> the H6 and H616 PRCM CCUs, though there are more clocks, and many clocks
> have subtly changed.
>=20
> Describe all the mod and gate clocks, including the three bus clocks
> (R_AHB, R_APB0, and R_APB1).
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/Kconfig             |   5 +
>  drivers/clk/sunxi-ng/Makefile            |   2 +
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 245 +++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h |  14 ++
>  4 files changed, 266 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 04efbda847cf9..5830a9d87bf25 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -57,6 +57,11 @@ config SUN55I_A523_CCU
>  	default y
>  	depends on ARM64 || COMPILE_TEST
> =20
> +config SUN55I_A523_R_CCU
> +	tristate "Support for the Allwinner A523/T527 PRCM CCU"
> +	default y
> +	depends on ARM64 || COMPILE_TEST
> +
>  config SUN4I_A10_CCU
>  	tristate "Support for the Allwinner A10/A20 CCU"
>  	default y
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 01a887f7824bb..82e471036de69 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_SUN50I_H6_CCU)	+=3D sun50i-h6-ccu.o
>  obj-$(CONFIG_SUN50I_H6_R_CCU)	+=3D sun50i-h6-r-ccu.o
>  obj-$(CONFIG_SUN50I_H616_CCU)	+=3D sun50i-h616-ccu.o
>  obj-$(CONFIG_SUN55I_A523_CCU)	+=3D sun55i-a523-ccu.o
> +obj-$(CONFIG_SUN55I_A523_R_CCU)	+=3D sun55i-a523-r-ccu.o
>  obj-$(CONFIG_SUN4I_A10_CCU)	+=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)		+=3D sun5i-ccu.o
>  obj-$(CONFIG_SUN6I_A31_CCU)	+=3D sun6i-a31-ccu.o
> @@ -60,6 +61,7 @@ sun50i-h6-ccu-y			+=3D ccu-sun50i-h6.o
>  sun50i-h6-r-ccu-y		+=3D ccu-sun50i-h6-r.o
>  sun50i-h616-ccu-y		+=3D ccu-sun50i-h616.o
>  sun55i-a523-ccu-y		+=3D ccu-sun55i-a523.o
> +sun55i-a523-r-ccu-y		+=3D ccu-sun55i-a523-r.o
>  sun4i-a10-ccu-y			+=3D ccu-sun4i-a10.o
>  sun5i-ccu-y			+=3D ccu-sun5i.o
>  sun6i-a31-ccu-y			+=3D ccu-sun6i-a31.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.c
> new file mode 100644
> index 0000000000000..0dafc38370f22
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Arm Ltd.
> + * Based on the D1 CCU driver:
> + *   Copyright (c) 2020 huangzhenwei@allwinnertech.com
> + *   Copyright (C) 2021 Samuel Holland <samuel@sholland.org>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +
> +#include "ccu-sun55i-a523-r.h"
> +
> +static const struct clk_parent_data r_ahb_apb_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "iosc" },
> +	{ .fw_name =3D "pll-periph" },
> +	{ .fw_name =3D "pll-audio" },

I believe pll-periph has /3 divider and pll-audio x4 multiplier.

> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_ahb_clk, "r-ahb",
> +				 r_ahb_apb_parents, 0x000,
> +				 0, 5,	/* M */
> +				 24, 3,	/* mux */
> +				 0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_apb0_clk, "r-apb0",
> +				 r_ahb_apb_parents, 0x00c,
> +				 0, 5,	/* M */
> +				 24, 3,	/* mux */
> +				 0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
> +				 r_ahb_apb_parents, 0x010,
> +				 0, 5,	/* M */
> +				 24, 3,	/* mux */
> +				 0);
> +
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
> +				      r_ahb_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),
> +				      0);
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
> +				      r_ahb_apb_parents, 0x104,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),
> +				      0);
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
> +				      r_ahb_apb_parents, 0x108,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),
> +				      0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.comm=
on.hw,
> +			 0x11c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_twd_clk,	"bus-r-twd", &r_apb0_clk.common.=
hw,
> +			 0x12c, BIT(0), 0);
> +
> +static const struct clk_parent_data r_pwmctrl_parents[] =3D {
> +	{ .fw_name =3D "hosc" },
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "iosc" },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
> +				  r_pwmctrl_parents, 0x130,
> +				  24, 1,	/* mux */

Mux width is 2.

> +				  BIT(31),
> +				  0);
> +static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
> +			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
> +
> +/* SPI clock is /M/N (same as new MMC?) */

Missing SPI clock (reg 0x150).

Best regards,
Jernej

> +static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
> +			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
> +			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
> +			 &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0",
> +			 &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1",
> +			 &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_i2c0_clk, "bus-r-i2c0",
> +			 &r_apb1_clk.common.hw, 0x19c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_i2c1_clk, "bus-r-i2c1",
> +			 &r_apb1_clk.common.hw, 0x19c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_i2c2_clk, "bus-r-i2c2",
> +			 &r_apb1_clk.common.hw, 0x19c, BIT(2), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_ppu0_clk, "bus-r-ppu0",
> +			 &r_apb0_clk.common.hw, 0x1ac, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_ppu1_clk, "bus-r-ppu1",
> +			 &r_apb0_clk.common.hw, 0x1ac, BIT(1), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_cpu_bist_clk, "bus-r-cpu-bist",
> +			 &r_apb0_clk.common.hw, 0x1bc, BIT(0), 0);
> +
> +static const struct clk_parent_data r_ir_rx_parents[] =3D {
> +	{ .fw_name =3D "losc" },
> +	{ .fw_name =3D "hosc" },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(r_ir_rx_clk, "r-ir-rx",
> +				      r_ir_rx_parents, 0x1c0,
> +				      0, 5,	/* M */
> +				      24, 2,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-rx",
> +			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
> +			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
> +			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
> +			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
> +
> +static struct ccu_common *sun55i_a523_r_ccu_clks[] =3D {
> +	&r_ahb_clk.common,
> +	&r_apb0_clk.common,
> +	&r_apb1_clk.common,
> +	&r_cpu_timer0.common,
> +	&r_cpu_timer1.common,
> +	&r_cpu_timer2.common,
> +	&bus_r_timer_clk.common,
> +	&bus_r_twd_clk.common,
> +	&r_pwmctrl_clk.common,
> +	&bus_r_pwmctrl_clk.common,
> +	&bus_r_spi_clk.common,
> +	&bus_r_spinlock_clk.common,
> +	&bus_r_msgbox_clk.common,
> +	&bus_r_uart0_clk.common,
> +	&bus_r_uart1_clk.common,
> +	&bus_r_i2c0_clk.common,
> +	&bus_r_i2c1_clk.common,
> +	&bus_r_i2c2_clk.common,
> +	&bus_r_ppu0_clk.common,
> +	&bus_r_ppu1_clk.common,
> +	&bus_r_cpu_bist_clk.common,
> +	&r_ir_rx_clk.common,
> +	&bus_r_ir_rx_clk.common,
> +	&bus_r_dma_clk.common,
> +	&bus_r_rtc_clk.common,
> +	&bus_r_cpucfg_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sun55i_a523_r_hw_clks =3D {
> +	.num	=3D CLK_NUMBER,
> +	.hws	=3D {
> +		[CLK_R_AHB]		=3D &r_ahb_clk.common.hw,
> +		[CLK_R_APB0]		=3D &r_apb0_clk.common.hw,
> +		[CLK_R_APB1]		=3D &r_apb1_clk.common.hw,
> +		[CLK_R_TIMER0]		=3D &r_cpu_timer0.common.hw,
> +		[CLK_R_TIMER1]		=3D &r_cpu_timer1.common.hw,
> +		[CLK_R_TIMER2]		=3D &r_cpu_timer2.common.hw,
> +		[CLK_BUS_R_TIMER]	=3D &bus_r_timer_clk.common.hw,
> +		[CLK_BUS_R_TWD]		=3D &bus_r_twd_clk.common.hw,
> +		[CLK_R_PWMCTRL]		=3D &r_pwmctrl_clk.common.hw,
> +		[CLK_BUS_R_PWMCTRL]	=3D &bus_r_pwmctrl_clk.common.hw,
> +		[CLK_BUS_R_SPI]		=3D &bus_r_spi_clk.common.hw,
> +		[CLK_BUS_R_SPINLOCK]	=3D &bus_r_spinlock_clk.common.hw,
> +		[CLK_BUS_R_MSGBOX]	=3D &bus_r_msgbox_clk.common.hw,
> +		[CLK_BUS_R_UART0]	=3D &bus_r_uart0_clk.common.hw,
> +		[CLK_BUS_R_UART1]	=3D &bus_r_uart1_clk.common.hw,
> +		[CLK_BUS_R_I2C0]	=3D &bus_r_i2c0_clk.common.hw,
> +		[CLK_BUS_R_I2C1]	=3D &bus_r_i2c1_clk.common.hw,
> +		[CLK_BUS_R_I2C2]	=3D &bus_r_i2c2_clk.common.hw,
> +		[CLK_BUS_R_PPU0]	=3D &bus_r_ppu0_clk.common.hw,
> +		[CLK_BUS_R_PPU1]	=3D &bus_r_ppu1_clk.common.hw,
> +		[CLK_BUS_R_CPU_BIST]	=3D &bus_r_cpu_bist_clk.common.hw,
> +		[CLK_R_IR_RX]		=3D &r_ir_rx_clk.common.hw,
> +		[CLK_BUS_R_IR_RX]	=3D &bus_r_ir_rx_clk.common.hw,
> +		[CLK_BUS_R_DMA]		=3D &bus_r_dma_clk.common.hw,
> +		[CLK_BUS_R_RTC]		=3D &bus_r_rtc_clk.common.hw,
> +		[CLK_BUS_R_CPUCFG]	=3D &bus_r_cpucfg_clk.common.hw,
> +	},
> +};
> +
> +static struct ccu_reset_map sun55i_a523_r_ccu_resets[] =3D {
> +	[RST_BUS_R_TIMER]	=3D { 0x11c, BIT(16) },
> +	[RST_BUS_R_TWD]		=3D { 0x12c, BIT(16) },
> +	[RST_BUS_R_PWMCTRL]	=3D { 0x13c, BIT(16) },
> +	[RST_BUS_R_SPI]		=3D { 0x15c, BIT(16) },
> +	[RST_BUS_R_SPINLOCK]	=3D { 0x16c, BIT(16) },
> +	[RST_BUS_R_MSGBOX]	=3D { 0x17c, BIT(16) },
> +	[RST_BUS_R_UART0]	=3D { 0x18c, BIT(16) },
> +	[RST_BUS_R_UART1]	=3D { 0x18c, BIT(17) },
> +	[RST_BUS_R_I2C0]	=3D { 0x19c, BIT(16) },
> +	[RST_BUS_R_I2C1]	=3D { 0x19c, BIT(17) },
> +	[RST_BUS_R_I2C2]	=3D { 0x19c, BIT(18) },
> +	[RST_BUS_R_PPU1]	=3D { 0x1ac, BIT(17) },
> +	[RST_BUS_R_IR_RX]	=3D { 0x1cc, BIT(16) },
> +	[RST_BUS_R_RTC]		=3D { 0x20c, BIT(16) },
> +	[RST_BUS_R_CPUCFG]	=3D { 0x22c, BIT(16) },
> +};
> +
> +static const struct sunxi_ccu_desc sun55i_a523_r_ccu_desc =3D {
> +	.ccu_clks	=3D sun55i_a523_r_ccu_clks,
> +	.num_ccu_clks	=3D ARRAY_SIZE(sun55i_a523_r_ccu_clks),
> +
> +	.hw_clks	=3D &sun55i_a523_r_hw_clks,
> +
> +	.resets		=3D sun55i_a523_r_ccu_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun55i_a523_r_ccu_resets),
> +};
> +
> +static int sun55i_a523_r_ccu_probe(struct platform_device *pdev)
> +{
> +	void __iomem *reg;
> +
> +	reg =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun55i_a523_r_ccu_desc);
> +}
> +
> +static const struct of_device_id sun55i_a523_r_ccu_ids[] =3D {
> +	{ .compatible =3D "allwinner,sun55i-a523-r-ccu" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sun55i_a523_r_ccu_ids);
> +
> +static struct platform_driver sun55i_a523_r_ccu_driver =3D {
> +	.probe	=3D sun55i_a523_r_ccu_probe,
> +	.driver	=3D {
> +		.name			=3D "sun55i-a523-r-ccu",
> +		.suppress_bind_attrs	=3D true,
> +		.of_match_table		=3D sun55i_a523_r_ccu_ids,
> +	},
> +};
> +module_platform_driver(sun55i_a523_r_ccu_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_DESCRIPTION("Support for the Allwinner A523 PRCM CCU");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.h
> new file mode 100644
> index 0000000000000..d50f46ac4f3fe
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Arm Ltd.
> + */
> +
> +#ifndef _CCU_SUN55I_A523_R_H
> +#define _CCU_SUN55I_A523_R_H
> +
> +#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +
> +#define CLK_NUMBER	(CLK_BUS_R_CPUCFG + 1)
> +
> +#endif /* _CCU_SUN55I_A523_R_H */
>=20





