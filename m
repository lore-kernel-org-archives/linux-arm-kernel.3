Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E8DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=; b=ImnUrgopG8QYNm/Bm3thrcbvKU
	ag3Bn5vHLi9Mzl3gb9/NIEWaytqgI9ino8nlG1umIcwi2fUpBhktzmit3H8KrpQF5z/i/WHmMhqHm
	G2pA2XlQTMaCozh5l2VxqoQtg30osTeMn2n4zGULGWekMakT6598+uGBA8OkM4uN2D/qoe1/uPHmP
	pybPQr0KdeWfHmq6aCt94MB7TXdsOQoEF/cqIfN/v9ne6IQVtzccB4Xv+RCN/cMBJDETBS0bnNOr3
	qeZas/MyhmjYO4i1EervZzvvw7RzvlLikq20cd85LTcho8GJtE437npvgtvcIL7L4j/OT0U8nkdmw
	dXKFjweA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6hn-0000000CWBG-3fTz;
	Wed, 15 Jan 2025 16:57:23 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY6gV-0000000CW0M-3dQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 16:56:04 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-303489e8775so63649621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736960162; x=1737564962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=ungdyJ0Sg5DxuVakwCWUk7rtYSruVRgmJNVRsYAjj/H6Bf5Em7L+iuvH1gU4GBTvFy
         WEPgg98kjO006i3L9PoEpj6uqBFo/lsf+r/dQ+/IjlJUo5fxdlubNGRSCx9CWuWou+u3
         1D75VWTp1sqwarC7B/f0eP3wu8fuehDkeCE560o46EYuYbLM1/KSviCrLlWFlXlOdG+s
         5v1ugM5J/yf/e/ujarWOG+80fOcK3JCojh+BrW6ZjK82RaicvzZGS2o505gCKd6Yb/IK
         0+a5fDOcrJsqMTCBYLW1b81XlOmp1rn/zVRyGCG3G8QOsc5iIwM6adPkFiWFnWgQPdRs
         K2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960162; x=1737564962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=wBfrsB9IfVcd6/3bcTDFGkmISyJAvUmTHCWqzd5rpxcKqUTHIY1g1Vt4wP2hznJFPs
         2ezznd8cTzUvuSiNUNXithtoZcdE097/pP33Tlp7wsnkLVGTmuYy8GvFmzA61eni5Nw0
         S36mPKtPCPsji12uv4dEF1xuB9qyww2rHkuBJ8b1ieAHohockiK53YUEMsEM2z/i+OXm
         hhQu7rjk62EL2ReLapvKSf8JbkSIeX3tGawyZ2fGFeSMPp7GnBHm9baaC7v+r+Ounk7i
         /AIR1YaWnfNrbpSxlsLuXFekcsB4EMt5yO10pPhPM5+RmLdd7cLsLWyrEpbngFiXj0A0
         Zbzg==
X-Forwarded-Encrypted: i=1; AJvYcCVDjC46rospU0SuNxSoTi2eeG4xSsA7FDLg3Ar2scjqYEo8sCA1q0kDce2kb/tY5cIcDW1ewVa0GR8byj/PjT8S@lists.infradead.org
X-Gm-Message-State: AOJu0YzRMDtCBeWdrhJsj1MOblMDOxT2PL6l41T1GzCZZi2Dvalg3vHc
	FneWNpXjHzfynKBn8icMnQ57Be+XEIMiLfSrX1aie97F7CEtrilLO4/rNTRacbqniuniqiQIgFB
	V4EpwBG4pyg/t6Ylq5yRZ7UwQjszMNQnGUWtJIA==
X-Gm-Gg: ASbGnctZ1VxxvSB5Hih/FNL+IUu4GDxJWVEK1SvViYlRUYVi3tJkAKaJFmTbsjUMS1v
	JkP5I7Ka2v5k1aSRrLe3OAgo2SO/3XzhOyoCi+uwiaWUqmixOayFY53ytknEKxP7NYY+stQ==
X-Google-Smtp-Source: AGHT+IGVCtsxu4Nxc8II+Al+gawBhAtzB4MYz+9Ecl8oqi13xJMRfbsu1WNLIppYV5ME9m0nmbvdoGhE02xkVmEh7JE=
X-Received: by 2002:a05:651c:508:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-305f4531690mr91529781fa.6.1736960161839; Wed, 15 Jan 2025
 08:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:55:51 +0100
X-Gm-Features: AbW1kvYbGBKWyTqAigHygOqZRSa-0z8NaBAPzFESViEk5Er4NeXPKYxQ6sb6LgU
Message-ID: <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_085603_901734_B11F870D 
X-CRM114-Status: GOOD (  17.72  )
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

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.
>
> Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/gpio/gpio-mxc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b420=
9f01b49ad1cbdb0 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         port->gc.request =3D mxc_gpio_request;
>         port->gc.free =3D mxc_gpio_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
> -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
> -                                            pdev->id * 32;
> +       port->gc.base =3D of_alias_get_id(np, "gpio") * 32;
>
>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
>
> --
> 2.39.5
>

This looks like I can pick it up separately from the rest? Is that right?

Bart

