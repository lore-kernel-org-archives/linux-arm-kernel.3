Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91853C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=; b=j06bmVA8gSXJjzGR7cPc/SxOg5
	vk65WUiZE71pRenM8YN3LEzKvjp9ggHQ3ykkMmcU7ctaggGpYVBgzKamVCo5cL3bkDIW6kdS3g9Qb
	sKI9F4iBnadl9g6G3LQxMgolcG4BgBvcOuGhnM9hnDW/5QszAJ07rTTgy9pmsfTw196nlbxe+VEE3
	qQWLHdJ4UoysMRf7x7P8sSmfws1D1Zb0hAwUDN0AWdclVu/75Ub70TNckBZxcuoBxaHC6RyiPOS6z
	qPkTGHgLlstiAxU2EXhQAT9UeOxWKLK0J3JyOXN3/3pfMOuEfk4G0zdzQXS+GrmFEzxGe3YQSjtwy
	iiHaahdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasz5-000000000hM-2Bnu;
	Sun, 13 Jul 2025 09:26:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasOy-0000000HYcj-0ODV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:49:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-555024588a8so3056252e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396578; x=1753001378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=wx2r35OZxDRDrbfZ9olqEhVLFZAOSTA3AdDQOAwj9buInlN41YlzuYpkftEZEadNDl
         Xdq4jAlR9Zu660spkQJ/AVnxmUan2EBW0Q9oZVPml2Mq1CQ16T3YAmIlQ4mFE5YTWlNm
         aKstGs/3oip49KgOXRZALcYSuAuuYw8aP6JXSK3gfRC3hMWYwb7TfzOhciUXFx0ppXWy
         lGjUVJOR91bxRPOBkgA5xr8znvJtDnuHSyB9BaV2SeNSqBf+g8AQZH/Z1j8rV5PZpXyJ
         ZZWOoZU8UrUPzFvsvPuWn69Oof7ZqtxxuSOsRO2B6Fz97tEvlkMEd88voBDoA7ENOerp
         mhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396578; x=1753001378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i68FJiG6+f1ETXgbeYCotuF64Qw8JxOf1zX940i2cSU=;
        b=eaIWxDlmYPp49GbapJ81avLzpVVREUqoYCKlp/F/EiVaw2tLGipXXNchFt1nU1lctI
         lccBrx/Q2cQDGxnOO3iEwHQ28x0V+26VM88Mdn9QQH1X4U8F422osTdroPjbqxdDuxOW
         zXb32KsLT3w+95hXjaMRrlsK3gx/6pveK3Czu4qpseQyUjjxRIebMh5M2TuYDYAAYnkL
         9GdEVK6UCYq7Pesf2vPz+EGMGk1doBZDJ0VTOS2DZpyiYVBJwdWPjZNOD12oCeLqSChb
         JKUlAnBleIbFeCJsLxGFrcYXj6dKZNbpGZJI+q+pZKag8qm/+VllONuKfGEShmJhj6N1
         NRBg==
X-Forwarded-Encrypted: i=1; AJvYcCX1c1kxDFzi0HDuT9FXJ2rMtGGCBOBg3BE/YbZHoJ0YWrx+wKu/Ldqb+nz/mlZcBCrWaYNjuUv1Q51KLf8QRHKd@lists.infradead.org
X-Gm-Message-State: AOJu0YwDCcs281r7hvB91RsXL6+6p9vGPKSTAKqTyao7RxbhLpXOXEqM
	scBhbE5EabCDNV5aww4r9K/F9fN+uNKxJhxzCavhpb/BLcMpcQWPs2rWeWQ/dFMuJTAGv2oXnyt
	8FtjxV3B/DUWu07/R/18xZhGCJcres5ymUCvz6UC4qg==
X-Gm-Gg: ASbGnct2EHO08DEGCJ1cqYBKd4urLPPa36Ub0mzVw39OX7E5F3v7yjCYI8AeMEMTI1J
	MTTDDiHLmWn5Fdmwp2v3Mk8QYMabDr7PC4H8pXuNWWlinMtAIh6/THlfJW7DCYs+SrPs0Yu02yd
	qnMNx5E9mHBJuxLrsNkqY2L3Ix3Im4/Jhg5n9ze+uGbxJt9pukDtlMSpa2C0NTE5FO1pcAJQ+WG
	gmEXGnEwKIIb1fP5+mvyPc6rdW1cqQFENzEnVV1DcEUwNalqQ==
X-Google-Smtp-Source: AGHT+IHSVlR3f84ykKc18xLN16yOuI1UBS+R1HGXkNcrI5d6VuncH7GOy5up7ZkTvuUg5ocaceSyWG2pJHHAQMTtfQA=
X-Received: by 2002:a05:6512:6cd:b0:553:2355:1f26 with SMTP id
 2adb3069b0e04-55a0463d16fmr3003378e87.50.1752396578149; Sun, 13 Jul 2025
 01:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-1-1a0c36c9deed@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:49:27 +0200
X-Gm-Features: Ac12FXyhZJT7lfbn0I6DoUYvpi_8wvzLxArloCSn9kbjMpsbWPmC7MSTvAUWCwE
Message-ID: <CAMRc=Mc1UyWgWwUFVGw=1EVJb1u4MQYUKcguiQedmbxTK6pY1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: fsl: qe: use new GPIO line value setter callbacks
To: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_014940_133318_09C21D4B 
X-CRM114-Status: GOOD (  19.87  )
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

On Tue, Jun 10, 2025 at 2:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/fsl/qe/gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 3ef24ba0245b75471ffa10f579bb744c0c3b7e43..5391cce4e6efe6d120db7fdf7=
509dc5eb840f344 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -57,7 +57,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned i=
nt gpio)
>         return !!(ioread32be(&regs->cpdata) & pin_mask);
>  }
>
> -static void qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val=
)
> +static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
>  {
>         struct of_mm_gpio_chip *mm_gc =3D to_of_mm_gpio_chip(gc);
>         struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> @@ -75,6 +75,8 @@ static void qe_gpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         iowrite32be(qe_gc->cpdata, &regs->cpdata);
>
>         spin_unlock_irqrestore(&qe_gc->lock, flags);
> +
> +       return 0;
>  }
>
>  static void qe_gpio_set_multiple(struct gpio_chip *gc,
> @@ -317,7 +319,7 @@ static int __init qe_add_gpiochips(void)
>                 gc->direction_input =3D qe_gpio_dir_in;
>                 gc->direction_output =3D qe_gpio_dir_out;
>                 gc->get =3D qe_gpio_get;
> -               gc->set =3D qe_gpio_set;
> +               gc->set_rv =3D qe_gpio_set;
>                 gc->set_multiple =3D qe_gpio_set_multiple;
>
>                 ret =3D of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>
> --
> 2.48.1
>

Christophe: let me reping you here as there's no reason for this
relatively trivial patch to miss the upcoming merge window. Do you
have any objections to me queueing it via the GPIO tree?

Bartosz

