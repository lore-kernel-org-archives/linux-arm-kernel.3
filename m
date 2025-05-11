Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07C0C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD6BYkiyI3CzqTv6aejiZ3DH06MKIs5DWSHTwZQG9e4=; b=sfOGwcaGg/cXDGtVoEHVo9CHrk
	Cz8B8G1fh9/puJYs8KKabjjJ/LfM38zXij1gQeGWQFZ8fwm2lIHGVE+6WPhtvRkGW6I8ZIjedVdyI
	cJAtDLBGh4QSu0OuuLq7W8OnUkuYW/BFHLsFwbndMdWSrejjnxVoDCSgegaYam92BhYCRtIRJOzSG
	jUA+NkCMLnT1Xks8rAGY+RzoJFKdz1HB1n4toLoEeuQa4i9pOmF9aV9uLL0G3rOwYhG8W323A3yZs
	nG7LNPeeu5eoIMEKQuLk71pBURIABwiA/vqgLTaG/nlNSIfmG1c+8BRSaPc9anT7z1o7rnLVy2J75
	dymMCEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE5zd-00000007DcM-170x;
	Sun, 11 May 2025 12:41:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE5xc-00000007DWx-47Gn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 12:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28004A40681
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 12:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8E5C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746967154;
	bh=jhQ5SAEJJF3qUfy6D5IHr1j1BdMfMHXPzSP1qRil+xg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HVdMeWgSodlOQnOyxyn/G6NScVBNK/Y1Wmovg68lrItlJZEt+ZD59ixdXwNYivUPT
	 pI091Rmly570u4l5qTu5g8xKK23ttB2HJWyXZdemlZ8PQ3xLbAjsqKVv6Ql73MoGpq
	 Et/z8yHbPMnuC9L0EXtP8PYt8tGVKt8+J7tgC8epvbKtsGqTtDwpa8+OI4ScYKnnlw
	 vP7+Owk8Ywfm/Tgh9zsBzGsZwjWJZ0nQFVXInDh+pV1T7vP1lhK8FU1gGQVy6njI31
	 57fi3/yLUAFcueDt40I5TuMwUsz9NcaPBvL0DBPCy9/54KK2UmwxoKKWjaDBbCJfXS
	 jTtWMqAL6/qcw==
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4033c89f2aaso2276170b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 05:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX66cBHc3IF5+5dhjZ4VS4g9PdxyEYAPnk0vzE7KovVOZo6Sm+qszGDJTtOpajntECZtNPWZMtdlCJ/YxKUtmuy@lists.infradead.org
X-Gm-Message-State: AOJu0YxCsJmHzTReGyHjeKOUdVNCvNGjXhWP9lO6ccIO+aeuCCT+udXz
	1CyOjvbtRz6bRQnwLrnDNNNyLu1gQ1E34gyqbRxkBqxET9rphzvqbF1qAiGm8QCh5Cb0wl1XYDb
	x8iDOiYcjloeipaowUviLEtuLjkc=
X-Google-Smtp-Source: AGHT+IF7frhH9fByp3nqkp8f/ToldoQoeo1EQiod3AeYHymrByNbZlMh+WjPHSM8WDiv77VlPQFYxVdDFh6afTzXars=
X-Received: by 2002:a05:6808:80c7:b0:401:e6c0:3112 with SMTP id
 5614622812f47-4037fe3b729mr6449007b6e.15.1746967153770; Sun, 11 May 2025
 05:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Sun, 11 May 2025 21:38:36 +0900
X-Gmail-Original-Message-ID: <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>
X-Gm-Features: AX0GCFubjq5u_HzT96chHqqtsl5Hck05kSg1tAuxI0qgXnWh6f_KB3_n-4XXW9o
Message-ID: <CAGTfZH1qMMO3ou4cxwaUoah7jS18nu7Y9kgYyraZ9e7jfjrp_A@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_053917_161666_644B6F88 
X-CRM114-Status: GOOD (  20.74  )
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

Hi,

Applied it. I'm sorry for late reply

Thanks.

On Mon, Nov 11, 2024 at 8:25=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  drivers/devfreq/sun8i-a33-mbus.c | 38 ++++++++------------------------
>  1 file changed, 9 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33=
-mbus.c
> index bcf654f4ff96..5b630c6e602e 100644
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
> +       ret =3D devm_clk_rate_exclusive_get(priv->clk_mbus);
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
> base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
> --
> 2.45.2
>
>


--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

