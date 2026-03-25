Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB63109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHUpen/jySPlPXicCw6K2Btejcmk1GdwPxdsiDdXFas=; b=X/0trqQ091EHTa
	ttLQfHXT5zshKrKD0TlBlRe/od1bO0tgQhH17ExBixjggcSQkSXOn1qwzNL0RBaUuvWTw1xZletoQ
	hCmNbzAHngQ0fJWcTB/lttiOn4T3VE+UJMk/7fvtskNqz2+OhRCki6vOVEa6fWLlEVvfXBsxHfkBq
	Sv0GBM3ayAC615H9jgoN66gKZ9YTHqOJDmPIffEdorhJfEBrYCIEKpm0mG1FyWFk62QrAjLiq+zQ1
	kCuK7tuaEdKkRWZyU5/iYX6k4uKno/HemEwXCCaXtEMETg8MvyWQ2CXaW3IIgAtCjYI5OdA0tgGFd
	PR8YEV18Ae9inl4FfJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qg1-00000003qOE-4A2v;
	Wed, 25 Mar 2026 16:01:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qfz-00000003qNh-1xpL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B8EE4437F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58726C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 16:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454506;
	bh=aldmRPDOiiniGw503t8LDK2MsDSx7z+uZZ/KCfzSBN4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Gk0/ZngPQjeGn36eOsdWZQWLWprEWy3AkR5hni/lE8ONxCfP3wN9iJXuu5vn2pyMJ
	 nJiG+ExwL18ilB8uMi+50Px+48WLD35cA/KJzXl30cOrLm1XHkP6/u7CfzuhuMgYBp
	 DDxza3CMzAS8sMQyLGYMo2oiYPpT8nggzBl8focYuTSXEM2IAcs5OZqZ1j3YzIY+XT
	 1I001RKPlZrVl+U7XDdwRzb6asn8XwzNOGgT85IMqibPiISmDfL5M3GvsTJxSjcZ3J
	 RB4byEEi8D5lGMQp3KZ85qQNPUmFfiaaLH5yO8GZd2D+YWbKD3ud9QCm4xCljSwmLN
	 AM82iX3FkN6qw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38bf47a6f02so21100531fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 09:01:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdqGV6CbM81NqDsqquDCKKf4upfQh0Y4LVt41aE4z9sFxUWmZmON/jiQy1wPsgIa0JpbE1euJvBu2AI0AWhYFQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2a+qA5km2LaQXM8Hs7HddxczqMmzoOW3Fq72rST7yuMQxFt1r
	fGK80mq0tw4ja/7W194hkvt6pj9ivpvthpF555IkMHNX6nacv6ogc1cuqoDy/7yciGNfGuSaZWp
	04TOEfSHTclqJBKatzq+LbBg2nFNHbcY=
X-Received: by 2002:a05:651c:1469:b0:38c:6b7:ad47 with SMTP id
 38308e7fff4ca-38c43072d48mr15879491fa.7.1774454504493; Wed, 25 Mar 2026
 09:01:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com> <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-3-7e591cce33a3@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Mar 2026 00:01:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
X-Gm-Features: AQROBzDy-rsBXq4Ru9U4FVjZxHD70RtzjKuDaTmPj80U_CHIL3nYWTBGwt2KYN8
Message-ID: <CAGb2v66++ZtfJ_K=de9ah45sqK0sNDkPr0B64C_U+WMhW7jc-w@mail.gmail.com>
Subject: Re: [PATCH 03/10] i2c: sun6i-p2wi: Replace dev_err() with
 dev_err_probe() in probe function
To: Atharv Dubey <atharvd440@gmail.com>
Cc: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	Enrico Zanda <e.zanda1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_090147_545229_27DE1FC9 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, Mar 25, 2026 at 2:27=E2=80=AFAM Atharv Dubey <atharvd440@gmail.com>=
 wrote:
>
> From: Enrico Zanda <e.zanda1@gmail.com>
>
> This simplifies the code while improving log.
>
> Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
> Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 55 ++++++++++++++-----------------=
------
>  1 file changed, 20 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7f..dffbe776a195 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -194,22 +194,16 @@ static int p2wi_probe(struct platform_device *pdev)
>         int ret;
>
>         of_property_read_u32(np, "clock-frequency", &clk_freq);
> -       if (clk_freq > P2WI_MAX_FREQ) {
> -               dev_err(dev,
> -                       "required clock-frequency (%u Hz) is too high (ma=
x =3D 6MHz)",
> -                       clk_freq);
> -               return -EINVAL;
> -       }
> +       if (clk_freq > P2WI_MAX_FREQ)
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "required clock-frequency (%u Hz) is=
 too high (max =3D 6MHz)",
> +                                    clk_freq);
>
> -       if (clk_freq =3D=3D 0) {
> -               dev_err(dev, "clock-frequency is set to 0 in DT\n");
> -               return -EINVAL;
> -       }
> +       if (clk_freq =3D=3D 0)
> +               return dev_err_probe(dev, -EINVAL, "clock-frequency is se=
t to 0 in DT\n");
>
> -       if (of_get_child_count(np) > 1) {
> -               dev_err(dev, "P2WI only supports one target device\n");
> -               return -EINVAL;
> -       }
> +       if (of_get_child_count(np) > 1)
> +               return dev_err_probe(dev, -EINVAL, "P2WI only supports on=
e target device\n");
>
>         p2wi =3D devm_kzalloc(dev, sizeof(struct p2wi), GFP_KERNEL);
>         if (!p2wi)
> @@ -226,11 +220,9 @@ static int p2wi_probe(struct platform_device *pdev)
>         childnp =3D of_get_next_available_child(np, NULL);
>         if (childnp) {
>                 ret =3D of_property_read_u32(childnp, "reg", &target_addr=
);
> -               if (ret) {
> -                       dev_err(dev, "invalid target address on node %pOF=
\n",
> -                               childnp);
> -                       return -EINVAL;
> -               }
> +               if (ret)
> +                       return dev_err_probe(dev, -EINVAL,
> +                                            "invalid target address on n=
ode %pOF\n", childnp);
>
>                 p2wi->target_addr =3D target_addr;
>         }
> @@ -245,26 +237,20 @@ static int p2wi_probe(struct platform_device *pdev)
>                 return irq;
>
>         p2wi->clk =3D devm_clk_get_enabled(dev, NULL);
> -       if (IS_ERR(p2wi->clk)) {
> -               ret =3D PTR_ERR(p2wi->clk);
> -               dev_err(dev, "failed to enable clk: %d\n", ret);
> -               return ret;
> -       }
> +       if (IS_ERR(p2wi->clk))
> +               return dev_err_probe(dev, PTR_ERR(p2wi->clk),
> +                                    "failed to enable clk\n");
>
>         parent_clk_freq =3D clk_get_rate(p2wi->clk);
>
>         p2wi->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> -       if (IS_ERR(p2wi->rstc)) {
> -               dev_err(dev, "failed to retrieve reset controller: %pe\n"=
,
> -                       p2wi->rstc);
> -               return PTR_ERR(p2wi->rstc);
> -       }
> +       if (IS_ERR(p2wi->rstc))
> +               return dev_err_probe(dev, PTR_ERR(p2wi->rstc),
> +                                    "failed to retrieve reset controller=
\n");
>
>         ret =3D reset_control_deassert(p2wi->rstc);
> -       if (ret) {
> -               dev_err(dev, "failed to deassert reset line: %d\n", ret);
> -               return ret;
> -       }
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to deassert reset =
line\n");

You could also simplify this whole block with
devm_reset_control_get_exclusive_deasserted().

Either way,

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>


>         init_completion(&p2wi->complete);
>         p2wi->adapter.dev.parent =3D dev;
> @@ -276,8 +262,7 @@ static int p2wi_probe(struct platform_device *pdev)
>
>         ret =3D devm_request_irq(dev, irq, p2wi_interrupt, 0, pdev->name,=
 p2wi);
>         if (ret) {
> -               dev_err(dev, "can't register interrupt handler irq%d: %d\=
n",
> -                       irq, ret);
> +               dev_err_probe(dev, ret, "can't register interrupt handler=
 irq%d\n", irq);
>                 goto err_reset_assert;
>         }
>
>
> --
> 2.43.0
>

