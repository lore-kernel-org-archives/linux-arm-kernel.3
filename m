Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18D5CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 10:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKoduvLX5z/YUM9feDBQJrglxz3zcKCNGZ5PZ6GJP60=; b=12qU+1mN2QWFTh
	0FbMHsSMUhAARDFzzvojdT6iGgIkZ1tCSRbNUkh50EnvXlwQ1F37XO3ZHZ4n+gRHVqhlAjKPuCsGf
	o4JWyIAndTH2J9jexx4/6N0+Fn0VX85GdO4hObDZpDL9PO8DVbTQjUjt2EOllPFdxb/dpvzGGftjS
	O1WiOQcmwJhB+7J8RIs3lcEryXpfBnGFzbZRRAMVBEx9ZVqIOrRqgQyelI4u9K6UZ2o7p8E8VsU0q
	7dx3EvXtWeARvTa/1Qq53phyAKTZc55reDkOk1T07qkIAaL0FUmXtifsSPDi+6VXlT50+a987DOKQ
	rWDF00pvMCJm0lXTQ+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJ8s-0000000Ee8b-0zYs;
	Sun, 04 Oct 2026 10:08:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJ8r-0000000Ee8O-0PiJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 10:08:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED5E44787
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 10:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F961F000FF
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 10:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791108504;
	bh=vKoduvLX5z/YUM9feDBQJrglxz3zcKCNGZ5PZ6GJP60=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=T6rqwm7ESExS4MLIjLN0ngQpbcP+Y8CYI1EnkaCqr8ErbtEBknpYeBYC86m0tNRSl
	 bnnGYRh2FWcvXBp4/NizZazdkSA5oEUHpOMVROyceCzZq9P/fjBWbXXNQiD2ui0x/w
	 D6BLvGhBWlt6q8IGD6cmXV1J5CUIw3zWzcqvLQqg/BbbUyJecVlDGwqk48O27rHbAQ
	 dyr7hRA6pY11WSrPiFg78UVsANR3d6foPtGTlvLQGyKaRqtlyE3S3xl4V8hxpMBLp2
	 sToAdI52r3tNOCKZ0zwcV8rQROWHVnLblLigxrqgy9V0G1eqB1q0R9aRtWgrdpw4hZ
	 dBWHmExJI4QLA==
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a981d6c5b4so1808051fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 03:08:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByueD1fDmAeOrStjQvq1cW0jU/LCZdpg7xvpECDJSDumEROBdzNKo0Wpn4Dp+RI0ph+DRTlVPykRAsx8VR0iyJ6@lists.infradead.org
X-Gm-Message-State: AFq9FYJvXFQm/rdBF4Ec08Eut9d5LCVrWJoqx6ScnkJ+6pSW7JY/pAQv
	1XIdJwcxG7NVmbXKkMBK3CKmYV/3oB6mlHtiE3R2T1uMxapqakLPAsCSGRGPErKSu6nAeVqM6UZ
	BBoDo6dIxbxQ77gUXqJjHftrNSwpeb9Y=
X-Received: by 2002:a05:651c:150e:b0:3a7:8372:61b7 with SMTP id
 38308e7fff4ca-3a8877e6611mr23833891fa.25.1791108502268; Sun, 04 Oct 2026
 03:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-4-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-4-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 12:08:09 +0200
X-Gmail-Original-Message-ID: <CAGb2v67hYTAMBDXOO7WUqyJCJT-iQcv5HPF_AWd=bi9g92cZgg@mail.gmail.com>
X-Gm-Features: AclHuK_3WsWtq45ADBjf91lBHr1AAi5tH_px4YPNZFZZ2l_iDRXd9C8l96EONSU
Message-ID: <CAGb2v67hYTAMBDXOO7WUqyJCJT-iQcv5HPF_AWd=bi9g92cZgg@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] clk: sunxi-ng: a733: Add PLL clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
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

On Tue, Sep 29, 2026 at 7:28=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add PLL clock support for the main CCU of the Allwinner A733 SoC. The
> structure is mostly similar to the sun55i, with the addition of a
> PLL_REF clock that normalizes the hardware-detected DCXO/hosc frequency
> (19.2MHz, 24MHz, or 26MHz) into a consistent 24MHz reference for all
> subsequent PLLs.
>
> Model the independently gated outputs of the peripheral, video, and DE
> PLLs as programmable-divider child clocks, with each output gate modeled
> separately. Follow the documented hierarchy for the derived peripheral
> PLL outputs.
>
> PLL_AUDIO0 uses SDM parameters from the vendor driver to provide a
> 22.5792MHz * 4 output. PLL_AUDIO1 provides fixed /2 and /5 outputs and
> does not expose fractional rates, but its SDM controls are modeled so
> that stale firmware settings can be disabled when an integer rate is
> programmed.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/Kconfig           |   5 +
>  drivers/clk/sunxi-ng/Makefile          |   2 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 582 +++++++++++++++++++++++++++=
++++++
>  3 files changed, 589 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 202e793dc754..cffa83056934 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -67,6 +67,11 @@ config SUN55I_A523_R_CCU
>         default ARCH_SUNXI
>         depends on ARM64 || COMPILE_TEST
>
> +config SUN60I_A733_CCU
> +       tristate "Support for the Allwinner A733 CCU"
> +       default ARCH_SUNXI
> +       depends on ARM64 || COMPILE_TEST
> +
>  config SUN60I_A733_R_CCU
>         tristate "Support for the Allwinner A733 PRCM CCU"
>         default ARCH_SUNXI
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefil=
e
> index d3702bdb7a23..3a39eb9287da 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_SUN50I_H616_CCU) +=3D sun50i-h616-ccu.o
>  obj-$(CONFIG_SUN55I_A523_CCU)  +=3D sun55i-a523-ccu.o
>  obj-$(CONFIG_SUN55I_A523_MCU_CCU)      +=3D sun55i-a523-mcu-ccu.o
>  obj-$(CONFIG_SUN55I_A523_R_CCU)        +=3D sun55i-a523-r-ccu.o
> +obj-$(CONFIG_SUN60I_A733_CCU)  +=3D sun60i-a733-ccu.o
>  obj-$(CONFIG_SUN60I_A733_R_CCU)        +=3D sun60i-a733-r-ccu.o
>  obj-$(CONFIG_SUN4I_A10_CCU)    +=3D sun4i-a10-ccu.o
>  obj-$(CONFIG_SUN5I_CCU)                +=3D sun5i-ccu.o
> @@ -65,6 +66,7 @@ sun50i-h616-ccu-y             +=3D ccu-sun50i-h616.o
>  sun55i-a523-ccu-y              +=3D ccu-sun55i-a523.o
>  sun55i-a523-mcu-ccu-y          +=3D ccu-sun55i-a523-mcu.o
>  sun55i-a523-r-ccu-y            +=3D ccu-sun55i-a523-r.o
> +sun60i-a733-ccu-y              +=3D ccu-sun60i-a733.o
>  sun60i-a733-r-ccu-y            +=3D ccu-sun60i-a733-r.o
>  sun4i-a10-ccu-y                        +=3D ccu-sun4i-a10.o
>  sun5i-ccu-y                    +=3D ccu-sun5i.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> new file mode 100644
> index 000000000000..430a535919c6
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> @@ -0,0 +1,582 @@

[...]

> +#define SUN60I_A733_PLL_VIDEO0_REG     0x120
> +static struct ccu_nm pll_video0_clk =3D {
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_VIDEO0_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-video0", =
pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_video0_hws[] =3D {
> +       &pll_video0_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video0_4x_clk, "pll-video0-4x",
> +                                pll_video0_hws, SUN60I_A733_PLL_VIDEO0_R=
EG,
> +                                20, 3, BIT(27), 0);
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video0_3x_clk, "pll-video0-3x",
> +                                pll_video0_hws, SUN60I_A733_PLL_VIDEO0_R=
EG,
> +                                16, 3, BIT(26), 0);

You probably want CLK_SET_RATE_PARENT on these child clks, otherwise their
consumers can't properly set any rate they need?

> +
> +#define SUN60I_A733_PLL_VIDEO1_REG     0x140
> +static struct ccu_nm pll_video1_clk =3D {
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_VIDEO1_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-video1", =
pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_video1_hws[] =3D {
> +       &pll_video1_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video1_4x_clk, "pll-video1-4x",
> +                                pll_video1_hws, SUN60I_A733_PLL_VIDEO1_R=
EG,
> +                                20, 3, BIT(27), 0);
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video1_3x_clk, "pll-video1-3x",
> +                                pll_video1_hws, SUN60I_A733_PLL_VIDEO1_R=
EG,
> +                                16, 3, BIT(26), 0);

Same for these two.

> +
> +#define SUN60I_A733_PLL_VIDEO2_REG     0x160
> +static struct ccu_nm pll_video2_clk =3D {
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_VIDEO2_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-video2", =
pll_ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_video2_hws[] =3D {
> +       &pll_video2_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video2_4x_clk, "pll-video2-4x",
> +                                pll_video2_hws, SUN60I_A733_PLL_VIDEO2_R=
EG,
> +                                20, 3, BIT(27), 0);
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_video2_3x_clk, "pll-video2-3x",
> +                                pll_video2_hws, SUN60I_A733_PLL_VIDEO2_R=
EG,
> +                                16, 3, BIT(26), 0);

And these two.

[...]

> +#define SUN60I_A733_PLL_DE_REG         0x2e0
> +static struct ccu_nm pll_de_clk =3D {
> +       .lock           =3D BIT(28),
> +       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 11),
> +       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> +       .common         =3D {
> +               .reg            =3D SUN60I_A733_PLL_DE_REG,
> +               .hw.init        =3D CLK_HW_INIT_PARENTS_HW("pll-de", pll_=
ref_hws,
> +                                                        &ccu_nm_ops,
> +                                                        CLK_SET_RATE_GAT=
E),
> +       },
> +};
> +
> +static const struct clk_hw *pll_de_hws[] =3D {
> +       &pll_de_clk.common.hw
> +};
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_de_4x_clk, "pll-de-4x", pll_de_hws,
> +                                SUN60I_A733_PLL_DE_REG,
> +                                20, 3, BIT(27), 0);
> +static SUNXI_CCU_M_HWS_WITH_GATE(pll_de_3x_clk, "pll-de-3x", pll_de_hws,
> +                                SUN60I_A733_PLL_DE_REG,
> +                                16, 3, BIT(26), 0);

Same here. Do you need CLK_SET_RATE_PARENT?

The rest looks fine.


ChenYu

