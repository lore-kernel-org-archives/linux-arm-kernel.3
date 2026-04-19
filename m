Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F5EA71AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnvllSrzhJ4rjnpEQR8MIlgAmz9CwNiZVI3rOKuiD10=; b=ATwBHs0ktPj+3vRwEfkpAGdKVx
	sKTjfeaWAjOuTWltfDW1WaZoV5cPTpXd4NaOOpmbUYmGx/5mqcmQZesOgfcPeupWteppifQR7Nitl
	qNr3SL4ujUEBcONjVCKmgVqrQsaIALSQLL6RzxLQZB37goheERxqXga8sXugrdKvN7c9+B2mruYb7
	uYtLN/XtMK2oGwr71zO6Xtj20ZAv9hK6UObQIK82UhlCsPWCiNRUc90FNFtQL8bbHIGMNYIhR3M94
	hVmMEq+oPeE52wtA1cE6tH3toH6VfK+KpTWw7fnlwO7syBVFI9u7DuyXh5PiIZrv1gaR0lLgAN9Jf
	4NctBgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZmn-000000066RZ-2fCl;
	Sun, 19 Apr 2026 21:34:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZml-000000066R3-36Aq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35ED460103
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D0FC2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776634472;
	bh=XikKA9okOWpqYy6BizuQYG95CVPEXUggob/mHGCo650=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BGnjblmp0/yintTjMODejt0EkQS8DRzgsOAC4fM4wVWMQb8XMTjcXtRYaNbOccbR2
	 Qr2TWXAfIVtwY76dsiUaNZg2iEiuaUF+rybRF7z/qb1Z86Poj4tKw8YJT5mh1MzuWN
	 dspspIFH2K2LjVf0Xi4BQgknubISHS2lbw9UOBuizQbqRIZnfLmFdZV40JYN+ANLKJ
	 E2ud0nisFlt4uKKSlq0Of7TeW+4Gc2sbjWHpwB3UrXcMfTSzLbI9K18VCgOnXB07PQ
	 mKa8sp7mxCHP1k3yd6HAajZeGONjxGqpFmlWZLzRpIpxzboF6D+zerSbSJRl2obZtB
	 6fVT9St44fAqg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso2600729e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 14:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+uvHBMd0kuQM63S8yiHiBnlABx+abilpHbhd8Mh/37mxu7pQyhEYWwthMSwbVkii8vQTnLQJXT8ppUxioWlAB@lists.infradead.org
X-Gm-Message-State: AOJu0YxXqar0MgWfpShNUrr8EpF8e4Vr9rcgz7TC+LYIvrv5m5L9sOL3
	LGRlCHaXpg8rM+bs7VohkzPvWEp6X0p9pmI1zzPzPCdUmtA0qrpCDF1NzUTUu4gTl67gQVXNwZY
	35lkFOfkxFdS9IeouXWxKjvNvkvfp9uE=
X-Received: by 2002:ac2:5b4a:0:b0:5a4:178d:9174 with SMTP id
 2adb3069b0e04-5a4178d91bcmr2244072e87.19.1776634471587; Sun, 19 Apr 2026
 14:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260413154727.3051321-1-lgs201920130244@gmail.com>
 <CAD++jLnC5MGg1e_Suv6BD_=XKbsn1aLxHxRfCdD3Nos+2XRzfw@mail.gmail.com> <aa801626-2e33-489a-931f-600540fe4ae3@roeck-us.net>
In-Reply-To: <aa801626-2e33-489a-931f-600540fe4ae3@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:34:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLkv=5rJhGv6t9H-oP9k5MY8s-fH1=gHVC88ctbiaMPC7A@mail.gmail.com>
X-Gm-Features: AQROBzAWdTk5eKPuadf02OlssZp85G7z5VJoMspySJ9Be8ONr5PC74pXWoY6xQM
Message-ID: <CAD++jLkv=5rJhGv6t9H-oP9k5MY8s-fH1=gHVC88ctbiaMPC7A@mail.gmail.com>
Subject: Re: [PATCH] watchdog: ixp4xx: fix reference leak on
 platform_device_register() failure
To: Guenter Roeck <linux@roeck-us.net>
Cc: Guangshuo Li <lgs201920130244@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
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

On Sun, Apr 19, 2026 at 11:08=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> On 4/19/26 13:22, Linus Walleij wrote:

> > Hi Guangshuo,
> >
> > thanks for your patch!
> >
> > On Mon, Apr 13, 2026 at 5:47=E2=80=AFPM Guangshuo Li <lgs201920130244@g=
mail.com> wrote:
> >
> >> ixp4xx_timer_probe() directly returns the result of
> >> platform_device_register(&ixp4xx_watchdog_device). When registration
> >> fails, the embedded struct device in ixp4xx_watchdog_device has alread=
y
> >> been initialized by device_initialize(), but the failure path does not
> >> drop the device reference, leading to a reference leak.
> > (...)
> >
> >> -       return platform_device_register(&ixp4xx_watchdog_device);
> >> +       ret =3D platform_device_register(&ixp4xx_watchdog_device);
> >> +       if (ret)
> >> +               platform_device_put(&ixp4xx_watchdog_device);
> >
> > If the problem in the description is indeed there, it seems the bug
> > is inside platform_device_register(), surely a function returning an
> > error code is supposed to clean up any resources it takes before
> > returning an error. It seems wrong to try to fix this in all the
> > consumers.
> >
>
>  From platform_device_register():
>
> /**
>   * platform_device_register - add a platform-level device
>   * @pdev: platform device we're adding
>   *
>   * NOTE: _Never_ directly free @pdev after calling this function, even i=
f it
>   * returned an error! Always use platform_device_put() to give up the
>   * reference initialised in this function instead.
>   */
>
> Not that any code actually does that as far as I can see, but isn't
> the above doing exactly what the comment suggests ?

Yeah and Johan Hovold wrote that comment and he usually knows
what he's doing so let's go with this then, I'm convinced!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

