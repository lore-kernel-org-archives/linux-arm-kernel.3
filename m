Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB9610F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZW356JjEwc8AAtICB5jfktRn77mN317hUcXFPhA53c=; b=Feu7J8b+DSNB3h
	feKx+qPkYJINJSbAkPWa7sGA7pagh/UlUW2ZJ/QMhnbHNaRZJzwzhhx5lJnef8Exd+zSdYz3uOzKD
	7COdgrRWaeRtvNfNoXb+Cg7vS5jq2MCjVRNHbjBTW7fmgkvecD3lxNTg3KWHSexGuywqwUj/ZaWG1
	s3EIoJ79Jw0G18ka4wZmEdO6wfslwv9Nq+Vn5RUCMQ5qsrby/qWEmEcAuDm+00o1C9Code3NjTczG
	4101YP9TNOWKAjAn0tAyIC6uteOSHco8FuJemeIWfY5SCm9bEjTvoZ0Scy8zG2hlrMlxsiXGuft39
	C6iJkjded8AP+dvoxtZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VNN-0000000941k-0b9x;
	Sat, 28 Mar 2026 15:15:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VNL-0000000941U-3465
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 15:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B5D660018
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EE7C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774710898;
	bh=L3wtY2yqlTkYjo864f/K2PlE27ul9IfAQh2b7OxhbUg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=OBtNAVWF54ZNsuu2R7va3zMQH9ul/NWNIunHjdb6RR0fjU5XuvBa6chbQgUrekZbU
	 0OjWCL0SH9d6dNsZaResAQfOpsJ2ID6wMlxZhSOwZbTDV9D0Pxd8cIcxW+VXmzlp4Y
	 j3loUy3gLqNvkuR02pUvyy/qgLSCx/4nZAx/4G4pYx4R59ZDM3HoCPfBDTS3wqGUu3
	 ADa2CFsJpqOW6U5VWI+AbfUt2b3HYGkIejR0FCHGaf7ZKtTMhRLE2+TN6HFAsBqrOV
	 NRoJBebzJe84evL0cS2iZeZaSzCd6XA6HoUnueD7ufNLMyMl78nPPSveVSZdp+LUb0
	 bZ5T99cR2jIAw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a01c80c34so27953181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 08:14:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZWv86Cf0vYUAnEfkfD3Cgzl4zWybHodd6Kjbp16L+g8PR3neX4Rn0IJo5SokiwMRCEYVAshjMznBnt4XkCR+P@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg5+LCxRmfLufM0qYgdpYKhoeAhcvPBnP56TN4PUXG35v1/lSF
	NxgldIOO8fDUZrRhxZfyVN5rlIRnA6EoKnT6Q770xENUbzj56t3NYdUGSY5GGYPK02VchLYvjNh
	AKGIprA/SG32B4aVcBL22kySo0XEJcMk=
X-Received: by 2002:a2e:8a89:0:b0:38c:3410:5539 with SMTP id
 38308e7fff4ca-38c7308699cmr17694981fa.6.1774710261477; Sat, 28 Mar 2026
 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech> <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 23:04:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v66uDGLjovxUCxnHDiDBm7J1FMo5udtPJJQrfS5=i_KTDQ@mail.gmail.com>
X-Gm-Features: AQROBzBMgnRTbl4s0nhFjx59fmjHuR7ZH_t-KY0pcN2cCbjY2LeZWftamhL0jSs
Message-ID: <CAGb2v66uDGLjovxUCxnHDiDBm7J1FMo5udtPJJQrfS5=i_KTDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
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

On Tue, Mar 10, 2026 at 4:42=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the Power Reset Clock Management (PRCM) module found in
> the Allwinner A733 SoC. This clock controller manages the clock control
> and reset functions for device modules within the CPUS domain.
>
> The PRCM module includes the management of three primary buses: r-ahb,
> r-apb0, and r-apb1. It also provides clocking for several key
> peripherals, such as R-UART, R-I2C, R-SPI, and the R-RISCV subsystem.
> Additionally, the reset lines for these modules are integrated.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/Kconfig             |   5 +
>  drivers/clk/sunxi-ng/Makefile            |   2 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 276 +++++++++++++++++++++++++=
++++++
>  3 files changed, 283 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 6af2d020e03e..202e793dc754 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
>         default ARCH_SUNXI
>         depends on ARM64 || COMPILE_TEST
>
> +config SUN60I_A733_R_CCU
> +       tristate "Support for the Allwinner A733 PRCM CCU"
> +       default ARCH_SUNXI
> +       depends on ARM64 || COMPILE_TEST
> +
>  config SUN4I_A10_CCU
>         tristate "Support for the Allwinner A10/A20 CCU"
>         default ARCH_SUNXI
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e
> index a1c4087d7241..d3702bdb7a23 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SUN50I_H616_CCU) +=3D sun50i-h616-ccu.o
>  obj-$(CONFIG_SUN55I_A523_CCU)  +=3D sun55i-a523-ccu.o
>  obj-$(CONFIG_SUN55I_A523_MCU_CCU)      +=3D sun55i-a523-mcu-ccu.o
>  obj-$(CONFIG_SUN55I_A523_R_CCU)        +=3D sun55i-a523-r-ccu.o
> +obj-$(CONFIG_SUN60I_A733_R_CCU)        +=3D sun60i-a733-r-ccu.o
>  obj-$(CONFIG_SUN4I_A10_CCU)    +=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)                +=3D sun5i-ccu.o
>  obj-$(CONFIG_SUN6I_A31_CCU)    +=3D sun6i-a31-ccu.o
> @@ -64,6 +65,7 @@ sun50i-h616-ccu-y             +=3D ccu-sun50i-h616.o
>  sun55i-a523-ccu-y              +=3D ccu-sun55i-a523.o
>  sun55i-a523-mcu-ccu-y          +=3D ccu-sun55i-a523-mcu.o
>  sun55i-a523-r-ccu-y            +=3D ccu-sun55i-a523-r.o
> +sun60i-a733-r-ccu-y            +=3D ccu-sun60i-a733-r.o
>  sun4i-a10-ccu-y                        +=3D ccu-sun4i-a10.o
>  sun5i-ccu-y                    +=3D ccu-sun5i.o
>  sun6i-a31-ccu-y                        +=3D ccu-sun6i-a31.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi=
-ng/ccu-sun60i-a733-r.c
> new file mode 100644
> index 000000000000..06679be1eaae
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 rengaomin@allwinnertech.com
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
> + * Based on the A523 CCU driver:
> + *   Copyright (C) 2024 Arm Ltd.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/sun60i-a733-r-ccu.h>
> +#include <dt-bindings/reset/sun60i-a733-r-ccu.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +
> +static const struct clk_parent_data r_ahb_parents[] =3D {
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "losc" },
> +       { .fw_name =3D "iosc" },
> +       { .fw_name =3D "pll-periph0-200m" },
> +       { .fw_name =3D "pll-periph0-300m" },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_ahb_clk, "r-ahb", r_ahb_parents, 0x00=
0,
> +                                0, 5,  /* M */
> +                                24, 3, /* mux */
> +                                0);
> +
> +static const struct clk_parent_data r_apb_parents[] =3D {
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "losc" },
> +       { .fw_name =3D "iosc" },
> +       { .fw_name =3D "pll-periph0-200m" },
> +       { .fw_name =3D "sys-24m" },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_apb0_clk, "r-apb0", r_apb_parents, 0x=
00c,
> +                                0, 5,  /* M */
> +                                24, 3, /* mux */
> +                                0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1", r_apb_parents, 0x=
010,
> +                                0, 5,  /* M */
> +                                24, 3, /* mux */
> +                                0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_p=
arents, 0x100,
> +                                      0, 0,    /* no M */
> +                                      1, 3,    /* P */
> +                                      4, 3,    /* mux */
> +                                      BIT(0),  /* gate */
> +                                      0);

Use SUNXI_CCU_P_DATA_WITH_MUX_GATE(). Same for the other ones.

> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_p=
arents, 0x104,
> +                                      0, 0,    /* no M */
> +                                      1, 3,    /* P */
> +                                      4, 3,    /* mux */
> +                                      BIT(0),  /* gate */
> +                                      0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2", r_apb_p=
arents, 0x108,
> +                                      0, 0,    /* no M */
> +                                      1, 3,    /* P */
> +                                      4, 3,    /* mux */
> +                                      BIT(0),  /* gate */
> +                                      0);
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_p=
arents, 0x10c,
> +                                      0, 0,    /* no M */
> +                                      1, 3,    /* P */
> +                                      4, 3,    /* mux */
> +                                      BIT(0),  /* gate */
> +                                      0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.comm=
on.hw, 0x11c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_twd_clk, "bus-r-twd", &r_apb0_clk.common.=
hw, 0x12c, BIT(0), 0);
> +
> +static const struct clk_parent_data r_pwmctrl_parents[] =3D {
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "losc" },
> +       { .fw_name =3D "iosc" },
> +       { .fw_name =3D "sys-24m" },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl", r_pwmctr=
l_parents, 0x130,

r_pwm_clk, "r-pwm", ...

> +                                   24, 2,      /* mux */
> +                                   BIT(31),    /* gate */
> +                                   0);
> +static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",

bus_r_pwm_clk, "bus-r-pwm".

> +                        &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
> +
> +static const struct clk_parent_data r_spi_parents[] =3D {
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "pll-periph0-200m" },
> +       { .fw_name =3D "pll-periph0-300m" },
> +       { .fw_name =3D "pll-periph1-300m" },
> +       { .fw_name =3D "sys-24m" },
> +};
> +static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x1=
50,
> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.h=
w, 0x15c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.co=
mmon.hw, 0x17c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.com=
mon.hw, 0x18c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.com=
mon.hw, 0x18c, BIT(1), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_i2c0_clk, "bus-r-i2c0", &r_apb1_clk.commo=
n.hw, 0x19c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_i2c1_clk, "bus-r-i2c1", &r_apb1_clk.commo=
n.hw, 0x19c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_i2c2_clk, "bus-r-i2c2", &r_apb1_clk.commo=
n.hw, 0x19c, BIT(2), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_ppu_clk, "bus-r-ppu", &r_apb0_clk.common.=
hw, 0x1ac, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_tzma_clk, "bus-r-tzma", &r_apb0_clk.commo=
n.hw, 0x1b0, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_cpu_bist_clk, "bus-r-cpu-bist", &r_apb0_c=
lk.common.hw,
> +                        0x1bc, BIT(0), 0);
> +
> +static const struct clk_parent_data r_ir_rx_parents[] =3D {
> +       { .fw_name =3D "losc" },
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "sys-24m" },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(r_ir_rx_clk, "r-ir-rx", r_ir_rx_pa=
rents, 0x1c0,
> +                                     0, 5,     /* M */
> +                                     24, 2,    /* mux */
> +                                     BIT(31),  /* gate */
> +                                     0);
> +static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-rx", &r_apb0_clk.com=
mon.hw, 0x1cc, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc", &r_ahb_clk.common.h=
w, 0x20c, BIT(0), 0);
> +
> +static const struct clk_parent_data r_riscv_parents[] =3D {
> +       { .fw_name =3D "hosc" },
> +       { .fw_name =3D "losc" },
> +       { .fw_name =3D "iosc" },
> +};
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_pare=
nts, 0x210,
> +                                 24, 2,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.com=
mon.hw,
> +                        0x21c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0=
_clk.common.hw,
> +                        0x21c, BIT(1), 0);
> +
> +static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg", &r_apb0_clk.c=
ommon.hw,
> +                        0x22c, BIT(0), CLK_IS_CRITICAL);
> +
> +static struct ccu_common *sun60i_a733_r_ccu_clks[] =3D {
> +       &r_ahb_clk.common,
> +       &r_apb0_clk.common,
> +       &r_apb1_clk.common,
> +       &r_cpu_timer0.common,
> +       &r_cpu_timer1.common,
> +       &r_cpu_timer2.common,
> +       &r_cpu_timer3.common,
> +       &bus_r_timer_clk.common,
> +       &bus_r_twd_clk.common,
> +       &r_pwmctrl_clk.common,
> +       &bus_r_pwmctrl_clk.common,
> +       &r_spi_clk.common,
> +       &bus_r_spi_clk.common,
> +       &bus_r_msgbox_clk.common,
> +       &bus_r_uart0_clk.common,
> +       &bus_r_uart1_clk.common,
> +       &bus_r_i2c0_clk.common,
> +       &bus_r_i2c1_clk.common,
> +       &bus_r_i2c2_clk.common,
> +       &bus_r_ppu_clk.common,
> +       &bus_r_tzma_clk.common,
> +       &bus_r_cpu_bist_clk.common,
> +       &r_ir_rx_clk.common,
> +       &bus_r_ir_rx_clk.common,
> +       &bus_r_rtc_clk.common,
> +       &r_riscv_clk.common,
> +       &bus_r_riscv_clk.common,
> +       &bus_r_riscv_cfg_clk.common,
> +       &bus_r_cpucfg_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sun60i_a733_r_hw_clks =3D {
> +       .hws =3D {
> +               [CLK_R_AHB]             =3D &r_ahb_clk.common.hw,
> +               [CLK_R_APB0]            =3D &r_apb0_clk.common.hw,
> +               [CLK_R_APB1]            =3D &r_apb1_clk.common.hw,
> +               [CLK_R_TIMER0]          =3D &r_cpu_timer0.common.hw,
> +               [CLK_R_TIMER1]          =3D &r_cpu_timer1.common.hw,
> +               [CLK_R_TIMER2]          =3D &r_cpu_timer2.common.hw,
> +               [CLK_R_TIMER3]          =3D &r_cpu_timer3.common.hw,
> +               [CLK_BUS_R_TIMER]       =3D &bus_r_timer_clk.common.hw,
> +               [CLK_BUS_R_TWD]         =3D &bus_r_twd_clk.common.hw,
> +               [CLK_R_PWMCTRL]         =3D &r_pwmctrl_clk.common.hw,
> +               [CLK_BUS_R_PWMCTRL]     =3D &bus_r_pwmctrl_clk.common.hw,
> +               [CLK_R_SPI]             =3D &r_spi_clk.common.hw,
> +               [CLK_BUS_R_SPI]         =3D &bus_r_spi_clk.common.hw,
> +               [CLK_BUS_R_MSGBOX]      =3D &bus_r_msgbox_clk.common.hw,
> +               [CLK_BUS_R_UART0]       =3D &bus_r_uart0_clk.common.hw,
> +               [CLK_BUS_R_UART1]       =3D &bus_r_uart1_clk.common.hw,
> +               [CLK_BUS_R_I2C0]        =3D &bus_r_i2c0_clk.common.hw,
> +               [CLK_BUS_R_I2C1]        =3D &bus_r_i2c1_clk.common.hw,
> +               [CLK_BUS_R_I2C2]        =3D &bus_r_i2c2_clk.common.hw,
> +               [CLK_BUS_R_PPU]         =3D &bus_r_ppu_clk.common.hw,
> +               [CLK_BUS_R_TZMA]        =3D &bus_r_tzma_clk.common.hw,
> +               [CLK_BUS_R_CPU_BIST]    =3D &bus_r_cpu_bist_clk.common.hw=
,
> +               [CLK_R_IR_RX]           =3D &r_ir_rx_clk.common.hw,
> +               [CLK_BUS_R_IR_RX]       =3D &bus_r_ir_rx_clk.common.hw,
> +               [CLK_BUS_R_RTC]         =3D &bus_r_rtc_clk.common.hw,
> +               [CLK_R_RISCV]           =3D &r_riscv_clk.common.hw,
> +               [CLK_BUS_R_RISCV]       =3D &bus_r_riscv_clk.common.hw,
> +               [CLK_BUS_R_RISCV_CFG]   =3D &bus_r_riscv_cfg_clk.common.h=
w,
> +               [CLK_BUS_R_CPUCFG]      =3D &bus_r_cpucfg_clk.common.hw,
> +       },
> +       .num =3D CLK_BUS_R_CPUCFG + 1,
> +};
> +
> +static struct ccu_reset_map sun60i_a733_r_ccu_resets[] =3D {
> +       [RST_BUS_R_TIMER]       =3D { 0x11c, BIT(16) },
> +       [RST_BUS_R_PWM]         =3D { 0x13c, BIT(16) },
> +       [RST_BUS_R_SPI]         =3D { 0x15c, BIT(16) },
> +       [RST_BUS_R_MSGBOX]      =3D { 0x17c, BIT(16) },
> +       [RST_BUS_R_UART0]       =3D { 0x18c, BIT(16) },
> +       [RST_BUS_R_UART1]       =3D { 0x18c, BIT(17) },
> +       [RST_BUS_R_I2C0]        =3D { 0x19c, BIT(16) },
> +       [RST_BUS_R_I2C1]        =3D { 0x19c, BIT(17) },
> +       [RST_BUS_R_I2C2]        =3D { 0x19c, BIT(18) },
> +       [RST_BUS_R_IR_RX]       =3D { 0x1cc, BIT(16) },
> +       [RST_BUS_R_RTC]         =3D { 0x20c, BIT(16) },
> +       [RST_BUS_R_RISCV_CFG]   =3D { 0x21c, BIT(16) },
> +       [RST_BUS_R_CPUCFG]      =3D { 0x22c, BIT(16) },
> +};
> +
> +static const struct sunxi_ccu_desc sun60i_a733_r_ccu_desc =3D {
> +       .ccu_clks       =3D sun60i_a733_r_ccu_clks,
> +       .num_ccu_clks   =3D ARRAY_SIZE(sun60i_a733_r_ccu_clks),
> +
> +       .hw_clks        =3D &sun60i_a733_r_hw_clks,
> +
> +       .resets         =3D sun60i_a733_r_ccu_resets,
> +       .num_resets     =3D ARRAY_SIZE(sun60i_a733_r_ccu_resets),
> +};
> +
> +static int sun60i_a733_r_ccu_probe(struct platform_device *pdev)
> +{
> +       void __iomem *reg;
> +
> +       reg =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(reg))
> +               return PTR_ERR(reg);
> +
> +       return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun60i_a733_r_ccu_d=
esc);
> +}
> +
> +static const struct of_device_id sun60i_a733_r_ccu_ids[] =3D {
> +       { .compatible =3D "allwinner,sun60i-a733-r-ccu" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sun60i_a733_r_ccu_ids);
> +
> +static struct platform_driver sun60i_a733_r_ccu_driver =3D {
> +       .probe  =3D sun60i_a733_r_ccu_probe,
> +       .driver =3D {
> +               .name                   =3D "sun60i-a733-r-ccu",
> +               .suppress_bind_attrs    =3D true,
> +               .of_match_table         =3D sun60i_a733_r_ccu_ids,
> +       },
> +};
> +module_platform_driver(sun60i_a733_r_ccu_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_DESCRIPTION("Support for the Allwinner A733 PRCM CCU");
> +MODULE_LICENSE("GPL");

The rest look OK.


ChenYu

