Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307D4C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqZJfVYe+6GUsihYR1Vbr5GRhctn1BkfytbpK8QvJt8=; b=fYVsvVMn8xfrvaYTiEOSN1BoEq
	SVzF41KoyADSuzjJTqR0LoOS6OYnuNK6UXyS7V28NOUmj/DYVhYTd2nblgmEggqaQkrr7ArJ5prz1
	QO0DmRUVvyHN+e1uqXZoTm2+nozAwRGN8f3y8EQ7i6QFCPBZlqev+B23Ub9aMG8cbe0mlypUdMu/B
	MAvNIsh/MNy98AZfUjj0OTpNjeFSmXnfYWdn7EvWvapuYNj5hKuH7usqSLG1RuZ7ejI2OuADY1WvJ
	89h3F0KhcLAppxD/E7hdHO3WgWG06Lf3/gM25x5qX44lsJsK15/I+7pvMbBuQ0bQptJ5BniTQ9+dY
	zdOD4D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZpx-00000000vdU-09n9;
	Thu, 15 May 2025 14:45:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZjU-00000000uUp-3DeR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D8ED8614BC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 14:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25515C4CEF4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747319927;
	bh=HY+qJgM0yYWWR5BRYJcoqs5QSVlkgtqqpbluFMxs0w0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XlUNeyHgu1WgqlfjtdehqwZSsxtnbh5JxSjmDdvRvzZIC8dHMp5ZlM3q6gHbE+u0m
	 uWXcNeLT3nQUFcAMydn4hY1VrshtDY1S2MMtFt4TdtmlkRdxfZHqHITwT+V2Ww4LJt
	 rAWa1bPaQ6kuHRnrx7YIe9uWu2XGmjdyzgVODAirrQ0DWUxL4tMOAc7ZhA+LzEpxsb
	 Gpk8gBy0XGQYuyEWsYVtfEZGyQes+VbSai4YAQNKM6TqY0mbEpKeyZ8EhPJ9TVeppt
	 qSlF6NXfthVpAxgzDOezmIxq0q0mzmV78hFXz/h1H4cnZZkEeTKKG5dCxs3BH6RWP2
	 dZ1Kf0pmIbXmg==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-609e7f27c66so414253eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXDng8pdi4k/Y64BWNDQ/iofRDAXWHwajWJ58W1orxy3EPtoeny3wg24V3S0oUz9g74YiDeQ4OEy8U9AO1E7Em@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu/Ug6n1Nwyp7707Nh3E0lASo+xUVt22Nc5pMnLKE2Q6ZVcuHz
	SE1Ka7NHDGtBQMyhSJRn9GR3My/tqhRhyyadd/rVsVZxdMpeiEP5TTIpwZbpvj427O/ftK0RQGM
	gern602SqQ4PH3NRWD8Amzgo5/gM=
X-Google-Smtp-Source: AGHT+IHGdjpe73oLpoH8fkWYunyQ+qiWvEA5aPtzHTJu6wWW6p5XtqkX8NoQ0qeCaUyT8XvFkMDBDMNOpym6MJAH8Cs=
X-Received: by 2002:a05:6820:98d:b0:603:fada:ac53 with SMTP id
 006d021491bc7-609ec1f446dmr1516987eaf.2.1747319926526; Thu, 15 May 2025
 07:38:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20250513203908.205060-2-u.kleine-koenig@baylibre.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Thu, 15 May 2025 23:38:11 +0900
X-Gmail-Original-Message-ID: <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>
X-Gm-Features: AX0GCFuopvJHbf-CNvM7N5xp7U1FlvHL3EE-1-DaHwbFHrhtaHm-zDV1Ez_RZWI
Message-ID: <CAGTfZH2jVrD_Bfu3NZJ+vNdQCjdxo4vygxWob+h0VasyxUa4gA@mail.gmail.com>
Subject: Re: [PATCH v2] PM / devfreq: sun8i-a33-mbus: Simplify by using more
 devm functions
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 14, 2025 at 5:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit

Applied it after removing the above unneeded information.

Thanks,

>
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>
> On Wed, May 14, 2025 at 01:25:51AM +0900, Chanwoo Choi wrote in the
> thread at
> https://lore.kernel.org/linux-pm/CAGTfZH2uk-6-R5QNZwsssQ1UtnqexKeo=3De=3D=
SsXB26NMwqf8c9g@mail.gmail.com:
> > Instead of fix-up patch, I'd like you to send the v2 of patch[1].
> > [1] https://patchwork.kernel.org/project/linux-pm/patch/20241111112237.=
336310-2-u.kleine-koenig@baylibre.com/
>
> Ah, then I misunderstood. Here comes the requested v2. The changes since
> (implicit) v1 are:
>
>  - Fix the build failure that I introduced by forgetting to add the dev
>    parameter to devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
>
>  - Added the Reviewed-by tag for Chen-Yu.
>
>  - Actually compile tested. I would have sworn I did that for v1
>    already, but that is proven to be a perjury now. Don't know how that
>    slipped through.
>
> Best regards and again sorry for the mess
> Uwe
>
>  drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index 7c6ae91ede1f..4bd5657558d6 100644
> --- a/drivers/devfreq/sun8i-a33-mbus.c
> +++ b/drivers/devfreq/sun8i-a33-mbus.c
> @@ -360,7 +360,7 @@ static int sun8i_a33_mbus_probe(struct platform_devic=
e *pdev)
>         if (IS_ERR(priv->reg_mbus))
>                 return PTR_ERR(priv->reg_mbus);
>
> -       priv->clk_bus =3D devm_clk_get(dev, "bus");
> +       priv->clk_bus =3D devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(priv->clk_bus))
>                 return dev_err_probe(dev, PTR_ERR(priv->clk_bus),
>                                      "failed to get bus clock\n");
> @@ -375,24 +375,15 @@ static int sun8i_a33_mbus_probe(struct platform_dev=
ice *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->clk_mbus),
>                                      "failed to get mbus clock\n");
>
> -       ret =3D clk_prepare_enable(priv->clk_bus);
> -       if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "failed to enable bus clock\n");
> -
>         /* Lock the DRAM clock rate to keep priv->nominal_bw in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_dram);
> -       if (ret) {
> -               err =3D "failed to lock dram clock rate\n";
> -               goto err_disable_bus;
> -       }
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_dram);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to lock dram clock=
 rate\n");
>
>         /* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
> -       ret =3D clk_rate_exclusive_get(priv->clk_mbus);
> -       if (ret) {
> -               err =3D "failed to lock mbus clock rate\n";
> -               goto err_unlock_dram;
> -       }
> +       ret =3D devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to lock mbus clock=
 rate\n");
>
>         priv->gov_data.upthreshold      =3D 10;
>         priv->gov_data.downdifferential =3D  5;
> @@ -405,10 +396,8 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
ce *pdev)
>         priv->profile.max_state         =3D max_state;
>
>         ret =3D devm_pm_opp_set_clkname(dev, "dram");
> -       if (ret) {
> -               err =3D "failed to add OPP table\n";
> -               goto err_unlock_mbus;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
>
>         base_freq =3D clk_get_rate(clk_get_parent(priv->clk_dram));
>         for (i =3D 0; i < max_state; ++i) {
> @@ -448,12 +437,6 @@ static int sun8i_a33_mbus_probe(struct platform_devi=
ce *pdev)
>
>  err_remove_opps:
>         dev_pm_opp_remove_all_dynamic(dev);
> -err_unlock_mbus:
> -       clk_rate_exclusive_put(priv->clk_mbus);
> -err_unlock_dram:
> -       clk_rate_exclusive_put(priv->clk_dram);
> -err_disable_bus:
> -       clk_disable_unprepare(priv->clk_bus);
>
>         return dev_err_probe(dev, ret, err);
>  }
> @@ -472,9 +455,6 @@ static void sun8i_a33_mbus_remove(struct platform_dev=
ice *pdev)
>                 dev_warn(dev, "failed to restore DRAM frequency: %d\n", r=
et);
>
>         dev_pm_opp_remove_all_dynamic(dev);
> -       clk_rate_exclusive_put(priv->clk_mbus);
> -       clk_rate_exclusive_put(priv->clk_dram);
> -       clk_disable_unprepare(priv->clk_bus);
>  }
>
>  static const struct sun8i_a33_mbus_variant sun50i_a64_mbus =3D {
>
> base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
> --
> 2.47.2
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

