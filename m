Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7098BE64ABB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh6O5hcOma4p8AZfLng5WyXnPkEX/xU+8B4IUyvO9lw=; b=tiGaWsokcz3XyF
	dVkLzklZ2ensbaQuGnmdD4Hsk0V2sMgm6fneoXAgPdhg6FuQg7GLHtcRv5Gr3wWIVUG9NyVm7q4fF
	z/Nhq4o24lBgiWqujbvu4801akTbfmR1GJGQnFfZMeEVxDcOYiAqq1vJRxDz/H/omuT9H7qK383Mq
	skHqErbSiTMrWvBKiZMr9zxzQTB81sLBHumqxFuc4eQtoVoeXo5w+JD8LQqKSY7qUrXaTLaL3PiqB
	TeF/EwwiDyeRi1AC04W5tgvybVQSyMqQbOd3+pNrbQ08ztVmhJ7k2x3h900YF2KNQ1EcKDZxKLOl1
	c2qAdQ7J4gCa3E7gE/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUyN-00000009xaO-0SLF;
	Tue, 03 Dec 2024 15:37:59 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUxI-00000009xJm-3g2O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 15:36:53 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53df80eeeedso5876593e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240209; x=1733845009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dh6O5hcOma4p8AZfLng5WyXnPkEX/xU+8B4IUyvO9lw=;
        b=jX3Ag9HUI8gpI+4U8OdeOZL9HUjvdG7fNtJhuvsAQ+B8ggo8bB1KuselrS9KZZA3Jm
         3wqx5bIuYcmOduV8C8MbmuazH2wz7DKxDPmFh8necFtNd2mrU6spDpDc4O9RR7itKjA+
         lfwhkS08bboCbL3UdtpfkGatquOEgtHvcqxR9Sl+VMCa7Ym5t4AuNoAU9UWADPzezVyH
         /txWqUV/BXAVuZMH/pQ4evH5h6WFC5KOVljL121+yBdIWS3aMHHtILTmGhqBsYjJHi29
         sgrkTphhXMeDqU7vMnhnsLnO0f0Lq9bG8eYqRZbRiSfRdnXguVJWwAKYhjNaOCi7ec5m
         IiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlxA57XS3Ym09mpkukXmq8Duu2L10OsMkBJoAYUtvHTqLN+1ecb3eRiErFQq6p1LN6PQhR8C34IHK9l1p9bAUS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz293400eZkc9IkyP8AZV0p7fGQKcz1TE4ceSZae9rtX1h3oSW3
	ubHoPrJK3aaOyebk+3wLwgsq+xdMhMVsCakFs/N8SGWy6j/F+NzNp92DXD1W
X-Gm-Gg: ASbGnctGNlFNInZLXagj1DA2m2sRWGqREMHaTLZcMzdp2VqPgp1RYKTWXDsc+wVbqI7
	XaBIgGiUw/IG39ylYdsue8S0vGHfaNF/ZnDxNBxL43d6lEVSV7S8Vajcy5GumxLQaKjDeSbpP7U
	up0IqWZYl3iKJUIooSMhlmhunxOnoNLrWEYTJLGBtuO8snBKWECXzHGr5hWDnhBGzcM0XaGkWFz
	T8s+M3JogATbGxgL1Y2Oey9ocWtkAQK7tpQ3tJWcuy8ymDWAdgP+dNVurdBi2jEk9reKUr3hQ02
	mPlP5LI=
X-Google-Smtp-Source: AGHT+IEJnljaqNPOkW4j1TDGOwaKAf7qG1LfgZdZ6cJJ8xFiUlbIbSoyUN3BZ9RGVGKWHZCAbpDeAQ==
X-Received: by 2002:a05:6512:3a8e:b0:53d:a550:2885 with SMTP id 2adb3069b0e04-53e12a34282mr1562916e87.47.1733240208877;
        Tue, 03 Dec 2024 07:36:48 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1366311asm237434e87.5.2024.12.03.07.36.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 07:36:48 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffdf564190so65724711fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 07:36:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDXY3uN7fbEFDNAzEtXv8c/pSCQSns50xlFmpDtTR5nxCVv2tjushQHdy0rEV9wucD3w2C7ru/cPhyEpqkOQdy@lists.infradead.org
X-Received: by 2002:a2e:bc83:0:b0:2fb:955e:5c17 with SMTP id
 38308e7fff4ca-30009cc52cfmr17349571fa.40.1733240208287; Tue, 03 Dec 2024
 07:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20241111112237.336310-2-u.kleine-koenig@baylibre.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Dec 2024 23:36:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v65i=Ttij+pnK9nhdPzsk9kTdP0ZXS1MGboAud+QudbEDA@mail.gmail.com>
Message-ID: <CAGb2v65i=Ttij+pnK9nhdPzsk9kTdP0ZXS1MGboAud+QudbEDA@mail.gmail.com>
Subject: Re: [PATCH] PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_073652_912084_E50912E2 
X-CRM114-Status: GOOD (  20.73  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Nov 11, 2024 at 7:22=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Use devm allocators for enabling the bus clock and
> clk_rate_exclusive_get(). This simplifies error handling and the remove
> callback.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

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

