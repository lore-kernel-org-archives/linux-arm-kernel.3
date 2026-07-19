Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F1CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RRUSArPRAtcFhfXiOE6RwyuQ/wneW5pT3ezkOOHGZc=; b=sUPiLwX0FJJzGC
	PGCR/6WTIXOameiNKrg4whnAvSB8LhOKUKJVp6BTxtdYiQIkEq2OTzOl4YqUsT2ZLaf1ButO9Xf6r
	OjtsJeX69zRW9YpWysYsL2BeXiKKpmBNVK46bL6v4Atl1m4rS0M1KcoXXJNauXgt3MjRIXB62TQ8g
	uO6XZWleVRyxZ8u4krQ0EPv+6K91MsCG2Jp5D+I/lwzrJGJGqRWOuADkbRhZXz5M6QNdcOrmYbIa3
	Zd2EWe9TkbaZrY6p4N/BAl/9TAChBh8Qwht9p4e8K7negR4/1jTbP5EZfHRzhusevXLT/eYrC4oVK
	QPF8IcwSNIrXmyAkM0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTsf-000000058cw-3Itp;
	Sun, 19 Jul 2026 15:56:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTsd-000000058cX-4Bbj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:56:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2AB760A77
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 15:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D681F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784476598;
	bh=8RRUSArPRAtcFhfXiOE6RwyuQ/wneW5pT3ezkOOHGZc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UAF1hoTwSbk9oSyvS6M7Zs5vGxHczyCegXVXFnG5kUwF9SiuSuVyvgy/qzRAeFsiV
	 n8Jzo/mr9mchZGQFCQ/uUzOnEXJLyA/cO9sj9MmGOyBnka3CQcD0uOdPBNzhUKuCwy
	 g1biaR8xpLRZKZaeZ7QAph61W+Wj9ahzyR958J9b0Irkwe5p/pWteL2VqSfmnnmYyV
	 rhtv1qpuQ3ZvgiRsSvssFmMta7jbb3q4J7b7efKsCO4/q4r8Qiu1i4oEEjAtL6q8fh
	 cnOmPcdPIasRr5kHVMRpCecA1Zw/liLek9CC7gqUZ4p8EWw1vdpLGpKaZsIdkeirB6
	 6jPXT6PcM7AnQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39b3931e259so83408501fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:56:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RozPapKnY5G0P//NFNMRcwXsq1WZSrt/ceSB8AKIqCr0Rd6DwXbr7Kpk49vNHYPIPu/7gCN7xJFY61XdGqZU+ik@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+y6WjbI+GiJuu36SQH83kqmHmwiOjPZ2a/mwi82Hhu9Q7dCrX
	S6rntpsJXq2aa2SIomiX4CfXK0BOAukfQ/LI5Ak5xL8+ouv/ujYodsDG/VC0JcUYYJub3BAu8up
	iThP4pY0Mu9Yc9/Q2r1wpElwpwBkA9eI=
X-Received: by 2002:a05:651c:4413:20b0:39c:699b:22b6 with SMTP id
 38308e7fff4ca-39eb2807dd7mr14334511fa.18.1784476596626; Sun, 19 Jul 2026
 08:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com>
In-Reply-To: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 19 Jul 2026 23:56:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
X-Gm-Features: AUfX_mzNMkNi91y5cTjDJoGF53Wrr_2fF9iQwmrBcMYClRKkR49p3TJHoGg5tB8
Message-ID: <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
To: Aureal <juanmanuellopezcarrillo@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
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

On Sun, Jul 19, 2026 at 11:31=E2=80=AFPM Aureal
<juanmanuellopezcarrillo@gmail.com> wrote:
>
> From: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@gmail.com>
>
> When a rate change on a ccu_div clock also switches its parent, the
> clk core, in the absence of a .set_rate_and_parent op, programs the
> parent first and the divider second.  If the new parent is faster than
> the old one, the clock transiently runs at new_parent_rate/old_divider
> between the two register writes, overshooting both the old and the
> requested rate and potentially violating the consumer's maximum
> allowed frequency.
>
> This is not theoretical.  On the Allwinner A523/T527 the GPU clock is
> a ccu_div muxing between pll-gpu and the fixed pll-periph0 outputs:
> going from 600 MHz (pll-periph0-600M, M=3D1) down to 400 or 200 MHz
> (both derived from pll-periph0-800M) makes the Mali G57 run at 800 MHz
> for the window between the two writes, 33% above the vendor's maximum
> operating point.  Observed and validated on an Orange Pi 4A (T527)
> with a downstream GPU devfreq setup; mainline does not yet describe
> GPU OPPs for this SoC, but any ccu_div consumer whose set_rate ends up
> crossing parents is affected.
>
> Implement .set_rate_and_parent with the same ordering rule as
> clk_composite_set_rate_and_parent(): if keeping the current divider
> while switching the mux would overshoot the requested rate, program
> the divider first, otherwise switch the mux first.  The intermediate
> rate then never exceeds both the old and the new rate.
>
> Clocks using a prediv feature keep the historical mux-then-divider
> order: the prediv helpers look the prediv up by the current parent,
> which is ambiguous while both are changing.
>
> Fixes: e9b93213103f ("clk: sunxi-ng: Add divider")
> Signed-off-by: Juan Manuel L=C3=B3pez Carrillo <juanmanuellopezcarrillo@g=
mail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

So the patch itself is OK, but I think there is also something wrong
with the GPU mod clock. The GPU clock is not a standard divider, but
actually a fractional one. The formula for the output is

    Clock Source * ((16-M)/16)

with M being 0~15.

And we're also missing a notifier to switch the GPU clock away from
the PLL while the PLL is being changed.


Do you plan on implementing GPU DVFS on mainline?

> ---
> Note: this touches the same area of ccu_div.c as patch 2/4 of the
> pending series "clk: sun6i-rtc: Add support for Allwinner A733 SoC" v5
> (<20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>), which adds
> ccu_rodiv_ops right after ccu_div_ops.  The conflict is trivial
> (context only); happy to rebase on top of it if it lands first.

That is manageable. Thanks for the heads up.


ChenYu

>
>  drivers/clk/sunxi-ng/ccu_div.c | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 62d680ccb..9024bcd8c 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -130,6 +130,41 @@ static int ccu_div_set_parent(struct clk_hw *hw, u8 =
index)
>         return ccu_mux_helper_set_parent(&cd->common, &cd->mux, index);
>  }
>
> +static int ccu_div_set_rate_and_parent(struct clk_hw *hw, unsigned long =
rate,
> +                                      unsigned long parent_rate, u8 inde=
x)
> +{
> +       struct ccu_div *cd =3D hw_to_ccu_div(hw);
> +
> +       /*
> +        * The predivider helpers look it up through the current parent,
> +        * which is ambiguous while both the parent and the divider are
> +        * changing, so keep the mux-then-divider order the core would
> +        * have used for those clocks.
> +        */
> +       if (cd->common.features & (CCU_FEATURE_VARIABLE_PREDIV |
> +                                  CCU_FEATURE_FIXED_PREDIV |
> +                                  CCU_FEATURE_ALL_PREDIV)) {
> +               ccu_div_set_parent(hw, index);
> +               return ccu_div_set_rate(hw, rate, parent_rate);
> +       }
> +
> +       /*
> +        * Same ordering rule as clk_composite_set_rate_and_parent(): if
> +        * switching the mux with the current divider would overshoot the
> +        * requested rate, program the divider first, so the intermediate
> +        * rate never exceeds both the old and the new rate.
> +        */
> +       if (ccu_div_recalc_rate(hw, parent_rate) > rate) {
> +               ccu_div_set_rate(hw, rate, parent_rate);
> +               ccu_div_set_parent(hw, index);
> +       } else {
> +               ccu_div_set_parent(hw, index);
> +               ccu_div_set_rate(hw, rate, parent_rate);
> +       }
> +
> +       return 0;
> +}
> +
>  const struct clk_ops ccu_div_ops =3D {
>         .disable        =3D ccu_div_disable,
>         .enable         =3D ccu_div_enable,
> @@ -141,5 +176,6 @@ const struct clk_ops ccu_div_ops =3D {
>         .determine_rate =3D ccu_div_determine_rate,
>         .recalc_rate    =3D ccu_div_recalc_rate,
>         .set_rate       =3D ccu_div_set_rate,
> +       .set_rate_and_parent =3D ccu_div_set_rate_and_parent,
>  };
>  EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
>
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> --
> 2.47.3
>

