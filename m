Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC97DD3E774
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Tfp+kt6EeLErLEVv0I8PpE8RVWyGWlaG6f1mvrWPCE=; b=Zh9yYSlRIwQh8VY7bvWqIzMQtL
	EMfqs6Ow3MLAoAT/21ilrQ8YycbAz3/xWB0mB7+Ro3bvOYKYPSUTS/GTEfLGC7VQ0BprKYQj1P0ah
	9yUTFLS+BgiAgqqxGjrKtEmTR0ELggjI0pVsRnu9D9gcyesmh7bNssL3eo1pDqrD0EW4qp5hT9GkL
	DZTfFgb2K8z7Vq1BZ0gOsS+90oSSR8G3v5oY5fR2jQgJaEQoUWGTVsL50RULBeePKsTu0lbdxYe+P
	aXa/MIcN1JwfGuGYBGYcDNknSXn1yg3vN3/gKo4qGzczcvifEpKcgeEvIWqDxrB4TvAz+fxml45+W
	Rj/hNm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RA5-00000000s9e-3UUo;
	Tue, 05 Nov 2024 21:32:30 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8R7h-00000000riy-083C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:30:02 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so63427551fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730842197; x=1731446997; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Tfp+kt6EeLErLEVv0I8PpE8RVWyGWlaG6f1mvrWPCE=;
        b=ggCfLzBUpu+VIID4YgWq86rhZna01gMBWUnSX3QYl+aB0C/DGYSrK8lT4RHq9bLd+D
         dIRaLkGYKAhewXwITv/osJRfbunr3QXGzYN6dl79zVMDFM3tgyKVKiQYGNpsUY4flI/E
         GjSiMTd1lDDJRgkzsw0iuYeQqQQuZRvccABaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730842197; x=1731446997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Tfp+kt6EeLErLEVv0I8PpE8RVWyGWlaG6f1mvrWPCE=;
        b=AGE/TDgeabWIQhd2+V+IAGcjFQy1vhbjh1qXshCFR7KKjJ81fPf7uZyK2DJtiKrdQp
         ksSjqvb2frTfy+QKWKqkzQBefNG+cEJupKzt/fmUTX7ckrlqKTgeeA0VIQvzZQqevyEn
         ddKx44ST/7soh2HAF/SSQviiD8ZT8qN98sMeuMlieFUivlZB71y/+DQwlq1/HkdB5KAI
         aXfe7XI6RzXbvB1edYuGNhEUd2feza0F858NGkz+x4kam+BY0MrzGda2QJpGLw6FzxNV
         kv0Qy5xzAhM39EKkIYcViKi1dCiG0557JBHqE8Ql331pEia9I/tr0GmRKdSRrBqRiOQN
         Tuyg==
X-Forwarded-Encrypted: i=1; AJvYcCWxLSbB7L15+8pMeAzChrDhkvkrGlAKCQ9Yjbm6wMPe1fO7V9EJMOxKQpalE0kf4/a6NRZNXMi3GlYt+968r69f@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqk5yJT0vg9dIwGYE1zm+afL/h/UWxYqqprkyJppEXEKFzmnw+
	fX1auzB+Ip85sMo9QhoNMnXh1lcv9dkTmyqplaPEr5mVfFw7OL1z/xb9095Nupx0vl90ZlerVE6
	OKw==
X-Google-Smtp-Source: AGHT+IEH/5Sc9wHVFkMktjVdW/qlgXpjBQv0tdAdsk/8T7o4tyftbYyTk4qBrr6NOUA7EF1FCygU3Q==
X-Received: by 2002:a05:651c:19ab:b0:2ef:243b:6dce with SMTP id 38308e7fff4ca-2fedb770dfdmr90242501fa.10.1730842197299;
        Tue, 05 Nov 2024 13:29:57 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d62acsm22431751fa.33.2024.11.05.13.29.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 13:29:56 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so63427261fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 13:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQqP7/unkRjk2JUmak7kXbeTmlk1fOcoJag5hBQv/TEPZeu+F0d3FjLTeNToVIiPFcgJ+wg3CAU9BAXuZTOdKi@lists.infradead.org
X-Received: by 2002:a2e:bd08:0:b0:2fa:cf5b:1e8e with SMTP id
 38308e7fff4ca-2fedb758b32mr81564941fa.2.1730842195431; Tue, 05 Nov 2024
 13:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20241105161820.32512-1-jiashengjiangcool@gmail.com> <20241105161820.32512-3-jiashengjiangcool@gmail.com>
In-Reply-To: <20241105161820.32512-3-jiashengjiangcool@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Nov 2024 13:29:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
Message-ID: <CAD=FV=VzqKa=fo4KRw4FSpPcH4mVnt8jBMo=FMzsGkdGrXCfxg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: rk3x: Add check for clk_enable()
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: andi.shyti@kernel.org, rmk@dyn-67.arm.linux.org.uk, max.schwarz@online.de, 
	david.wu@rock-chips.com, heiko@sntech.de, vz@mleia.com, wsa@kernel.org, 
	manabian@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_133001_136684_6CFA0003 
X-CRM114-Status: GOOD (  27.93  )
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

On Tue, Nov 5, 2024 at 8:18=E2=80=AFAM Jiasheng Jiang
<jiashengjiangcool@gmail.com> wrote:
>
> Add check for the return value of clk_enable() in order to catch the
> potential exception. Moreover, convert the return type of
> rk3x_i2c_adapt_div() into int and add the check.
>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
>
> v1 -> v2:
>
> 1. Remove the Fixes tag.
> 2. Use dev_err_probe to simplify error handling.
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 51 +++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 14 deletions(-)

Wow, this is a whole lot of code to add to check for an error that
can't really happen as far as I'm aware. Turning on a clock is just
some MMIO writes and can't fail, right? Is this really worth it? Maybe
just wrap clk_enable() and spam an error to the logs if it fails? If
we ever see that error we can figure out what's going on and if
there's a sensible reason it could fail we could add the more complex
code.


> @@ -883,7 +883,9 @@ static void rk3x_i2c_adapt_div(struct rk3x_i2c *i2c, =
unsigned long clk_rate)
>         ret =3D i2c->soc_data->calc_timings(clk_rate, t, &calc);
>         WARN_ONCE(ret !=3D 0, "Could not reach SCL freq %u", t->bus_freq_=
hz);
>
> -       clk_enable(i2c->pclk);
> +       ret =3D clk_enable(i2c->pclk);
> +       if (ret)
> +               return dev_err_probe(i2c->dev, ret, "Can't enable bus clk=
 for rk3399: %d\n", ret);

Officially you're only supposed to use "dev_err_probe()" from probe or
calls indirectly called from probe. You're now using it in a whole lot
of other places.

...also note that dev_err_probe() already prints the error so you
don't need to include it in your error message.


> @@ -942,19 +946,27 @@ static int rk3x_i2c_clk_notifier_cb(struct notifier=
_block *nb, unsigned long
>                         return NOTIFY_STOP;
>
>                 /* scale up */
> -               if (ndata->new_rate > ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->new_rate);
> +               if (ndata->new_rate > ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
> +                               return NOTIFY_STOP;
> +               }
>
>                 return NOTIFY_OK;
>         case POST_RATE_CHANGE:
>                 /* scale down */
> -               if (ndata->new_rate < ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->new_rate);
> +               if (ndata->new_rate < ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->new_rate))
> +                               return NOTIFY_STOP;
> +               }
> +
>                 return NOTIFY_OK;
>         case ABORT_RATE_CHANGE:
>                 /* scale up */
> -               if (ndata->new_rate > ndata->old_rate)
> -                       rk3x_i2c_adapt_div(i2c, ndata->old_rate);
> +               if (ndata->new_rate > ndata->old_rate) {
> +                       if (rk3x_i2c_adapt_div(i2c, ndata->old_rate))
> +                               return NOTIFY_STOP;

I'm not convinced you can actually return NODIFY_STOP from the
POST_RATE_CHANGE or ABORT_RATE_CHANGE. Have you confirmed that is
actually sensible?


> @@ -1365,9 +1385,12 @@ static int rk3x_i2c_probe(struct platform_device *=
pdev)
>         }
>
>         clk_rate =3D clk_get_rate(i2c->clk);
> -       rk3x_i2c_adapt_div(i2c, clk_rate);
> +       ret =3D rk3x_i2c_adapt_div(i2c, clk_rate);
>         clk_disable(i2c->clk);
>
> +       if (ret)
> +               goto err_clk_notifier;

This one seems especially comical to add since the only way
rk3x_i2c_adapt_div() could fail would be if a nested clk_enable()
failed. ...and I'm 99% sure that's not possible.

-Doug

