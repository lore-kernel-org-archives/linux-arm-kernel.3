Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D33BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7aoi7iDnEPU3KXLwcvJh+y+bvu9z1UExF3xdy/AKzk=; b=2lEPzRGGQ0p0RX
	/zajw0ESvJuv8yU54Q5ZjW/4mu4ny1eNsjsonpWEtpvrZf1ZCMKc2su/OZSrdkuAUjW61PZnpLNJN
	4aQVeP/9G88I2Y8BSe9mtkkzO5C4qX4Y1y6qFH/yuJXxYOvITZBSpRBNa95r6JATKOAQDkrmURupH
	tL8Ny8ioh5fcSP3l03UyMRObW+v3f6izSVNjanXODlq+3i/qUnT4IwuyHE6xnFeWxvjzg5FVrnpCL
	O79CTGiJAOWGTlgi1MX5V+9AB6yg7Tnh2+vHw/q/8iYy32CkCNSvO9as/jQ74iPDlaEnlAUDXZNHT
	b182W7LJVIEYNNgK9/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglZO-0000000Cx7w-4B5R;
	Mon, 06 Jul 2026 15:49:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglZO-0000000Cx7l-0g72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:49:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E84FD43B1D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 15:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADF71F01559
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783352957;
	bh=x7aoi7iDnEPU3KXLwcvJh+y+bvu9z1UExF3xdy/AKzk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=NssBhG6OWSogreUfjnBrNElKqA+l46MsjNYMWeKs4z/Ib79yPFqrxuxiEvOqNOFbj
	 k9I57Pa8Jvc5PhKKi/mMMWB5QA7u6vl8CDKeBmFf0zdzvkrf2Kn2wXYPR149zXzBsB
	 qFkBIGoZySQzH2/602ENObjxGrF0j8nndKYNnK5dGzvTe+PKBeUMuUFIXCYgLcdsx/
	 4DQT7WpdyChNpweoI+6Cfu9q0IlfN+ney66mI/W+6OPkbHrNrifngU2JLQDs+Q7ZkK
	 fSQcoSE18HJzQxM9iLS86xphv6eabE4fEDOPH50tqnv2Pkx8pSwoM6CC4SHGhi46b7
	 tMrZXJ9jCh5lw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3995e22ef81so34625251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:49:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOLBH9VcGdcEgkMCIABbtUCphD4f7lmV6wyNriyLoiSP/pwIEm3pxnLlo35UAgLiOtjInyrn0LPlF7g5HXaD4s@lists.infradead.org
X-Gm-Message-State: AOJu0YxOf0B+Q6lqBwlfMm0qtk7VrrPfhaG3Gpo6WMnBU32FetIJm0YX
	wRPkgHRreQ0UNd5GGoi/Bnypuah149R6T7qY75Sk91iUeUofObcgzJi8ABwjFCujjg6Pc4XKyYD
	GsLxEY/n3i8jGhZ1FWbBOGxlpKQpL3wQ=
X-Received: by 2002:a2e:a989:0:b0:393:aa48:8243 with SMTP id
 38308e7fff4ca-39b4536de31mr31562521fa.18.1783352955971; Mon, 06 Jul 2026
 08:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com> <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-8-f330728db3d3@baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 6 Jul 2026 23:49:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v67P9W9v-iWshJFqQfuB_qhD2S1PRCdwowGEcRBi=-ZHDw@mail.gmail.com>
X-Gm-Features: AVVi8CeWczpk78VcWF1dP30DqhdG3iRBi9A4c_ikMSI7IzDTUwpjlrCHftcPHAU
Message-ID: <CAGb2v67P9W9v-iWshJFqQfuB_qhD2S1PRCdwowGEcRBi=-ZHDw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] clk: sunxi-ng: sun6i-rtc: split main oscillator
 div and gate.
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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

On Mon, Jul 6, 2026 at 5:32=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On the a733 the "osc24M-32k" clock has the same gate bits as the previous=
ly
> supported SoC but a different divider implementation.
>
> Instead of a fixed 750 divider, the divider is selected based on the
> rate of the oscillator. It can be seen as a simple read-only divider.
>
> To easily replace the divider part depending the SoC, split the divider
> and gate into two separate clock entities.

Actually, an even bigger reason to do this is because the read-only divider
and gate are in different registers, something that our combined clocks
don't support. So they need to be separate clock entities.

I think this should be mentioned. Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
>  drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.c
> index b24c8b196e66..25dd87e78eb7 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
> @@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] =3D {
>         { .fw_name =3D "hosc", .name =3D "osc24M" }
>  };
>
> -static struct ccu_gate osc24M_32k_clk =3D {
> -       .enable =3D BIT(16),
> -       .common =3D {
> -               .reg            =3D LOSC_OUT_GATING_REG,
> -               .prediv         =3D 750,
> -               .features       =3D CCU_FEATURE_ALL_PREDIV,
> -               .hw.init        =3D CLK_HW_INIT_PARENTS_DATA("osc24M-32k"=
, osc24M,
> -                                                          &ccu_gate_ops,=
 0),
> -       },
> +static struct clk_fixed_factor osc24M_32k_div_clk =3D {
> +       .mult =3D 1,
> +       .div =3D 750,
> +       .hw.init =3D CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
> +                                           osc24M,
> +                                           &clk_fixed_factor_ops,
> +                                           0),
>  };
>
> +static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_c=
lk.hw,
> +                        LOSC_OUT_GATING_REG, BIT(16), 0);
> +
>  static const struct clk_hw *rtc_32k_parents[] =3D {
>         &osc32k_clk.common.hw,
>         &osc24M_32k_clk.common.hw
> @@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_cl=
ks =3D {
>                 [CLK_EXT_OSC32K_GATE]   =3D &ext_osc32k_gate_clk.common.h=
w,
>                 [CLK_OSC24M_32K]        =3D &osc24M_32k_clk.common.hw,
>                 [CLK_RTC_32K]           =3D &rtc_32k_clk.common.hw,
> +               [CLK_OSC24M_32K_DIV]    =3D &osc24M_32k_div_clk.hw,
>         },
>  };
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/=
ccu-sun6i-rtc.h
> index 9ae821fc2599..ab7b92b47f59 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
> @@ -9,7 +9,8 @@
>  #define CLK_EXT_OSC32K_GATE    4
>  #define CLK_OSC24M_32K         5
>  #define CLK_RTC_32K            6
> +#define CLK_OSC24M_32K_DIV     7
>
> -#define CLK_NUMBER             (CLK_RTC_32K + 1)
> +#define CLK_NUMBER             (CLK_OSC24M_32K_DIV + 1)
>
>  #endif /* _CCU_SUN6I_RTC_H */
>
> --
> 2.47.3
>

