Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD29BCF8545
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h66YPwiuusOoOHGuoiDE/UsCsZR1/DmojPL2kq1y5BU=; b=gHGfGRRKcr9mSWjntLMPaV6FZm
	By1AG98T3o2mRjB4WJN6Fofq5BwQle7YYUaOFOWHQnsmVUdTs2BUbSsk6AaD32Bpqnp5tNW7pHK6i
	750BroMiqTCz/jc594+P5WeuHvi/odvPZVwsLq6mhvW0OntYQxpTVBiRGHcjwaxDhYZ3abRuT7JOz
	WJFN4QGUh4ZZPn/6r2n4vv6TswYVkMByITgK88nlm9Y4+2IQdmLyUy5aK6ZxHZ0PHjOivthlNjIna
	8dVNXzvT623fwfmKaT4/eq5ZD/cqt6SVqUQQt0f/Bk+OdphsL7nQ0+dbx68+tvlethMGrrHS7EeGg
	3f52h/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLygW-00000006GXP-2mHz;
	Thu, 20 Nov 2025 07:02:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLygU-00000006GWu-1URx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 07:02:27 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b73b24f1784so94735866b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763622144; x=1764226944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h66YPwiuusOoOHGuoiDE/UsCsZR1/DmojPL2kq1y5BU=;
        b=X48BDtflWoHYp5DIQryN06IhJzGKaqJsLju2mxSOvFZcKXrj6mFh1oheK1Antu0hsN
         XSbBCqP/yw0vlIYJOFsVNUXaJwUGGWC+aygNaJ5Yo8MjOjni0Bg/mOAYt7NaVMss3Mdv
         QMy5FqJJeJ3qrAaEKkHthTIbYnlTNAy0OplrvVFLjv0CumPcqHJty8CxAN7aYcBARzQh
         pQc9UBUfN7PMUvXOxDnKWVNA2RaFUElDJMzUHg9WgU6Z8ZWsWCztGVbTPK+tqgAJoSu+
         9ObxkYqrjh8fvjj5vwa/Lk8fc5olPZnlkB3quatLvrD3Dp/ibmPHP6ciJ2ruPtjgeGQJ
         avRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622144; x=1764226944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h66YPwiuusOoOHGuoiDE/UsCsZR1/DmojPL2kq1y5BU=;
        b=SMSpBaKtcJKDOjzmrsn/5V/x5YzGak9NoQUszb2MdM8fe8hvQbWd5Ayig0rUCWwPZE
         hsyUFEP+VjMZpK3jHEtoj+FR5jPK/+9AxGQg+1/PPXoPwEg3euBsMyAqNwe7VfgMMWAK
         9gv2Xp7JvEPjMErksCpimdB+VeZo4yUsZgB37U6KPMCXE26xTjHC4gj8nmjPF6uzqRlg
         nEWAH/RMaXPeDXjG7UHq4HJRm2icyq3AS3h1Zyex2U2ECSjbYJvjpUAT202eMopBvxZe
         +FzX6o0efxZF6xbDPDz9vtJ2N+NKiqPJuXtWZmg8nA61SmK8i3/gY00Y2lGvCZajWYE5
         HU1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfMZTQVoaIT9ypkUREUVvbmj3Aj0Evvl6ry5OgQeSWIGpGiUx5fu/xVcfuzUhbTDRRr3/0j9x7O1DdSI73hmr9@lists.infradead.org
X-Gm-Message-State: AOJu0Yya5FYX2ABt/xl9RmboXDa3pjBPMVq7ghj75FPW/wXONPgQMl+w
	oSquxqI1WWGnk+J2T0RsNvIZ7+ZwmlbdeZUmr8Q0J0AKqG3LJ8Hf67ou8fU2tbnNK6LBAcRXG33
	lcNkGsqhZM+XGRusmKVtGyAUFR5BGu+A=
X-Gm-Gg: ASbGncuPMDORKmf+iO+HrTjrfvm5boWhQ1O/cHd15gPMFR7QXH4ilbNdWyoC7UVbpGQ
	vjmf18atXeooTuUXElMs4QpwVNpbzS+rym5q7g55kSZ/2j7zpCkADnfP4yl11Bnd1kHTygUAi9V
	flgbTPQk93+MPx6BSF/w0Vz14hZJTJI3cBbEdQAyEe0cI4Lzokth7009znADbOds3kx6AnO1fMP
	ehJsGZ9DhaqIxbkn6tmbJpzgDfzm0s1w5LDTtwRYzw3V+ZEGsnDRDWm7MqVsp/my7O/7TPuoHbU
	sdJpE/atD0VxD/NmiFmTeJKsnGirZaS5i0hToK6ibz5oikS+7iaGgnVXuh5PcagXVlGmNN0=
X-Google-Smtp-Source: AGHT+IEk3RIdmZAd32vyrP20JestktT+itI+PPN3KJuXUupqYUfp4iURjkSs5UCODIk4JVUsGFSxVopuxLJmiq4qA3E=
X-Received: by 2002:a17:906:ee8d:b0:b70:d1ea:2748 with SMTP id
 a640c23a62f3a-b7657172ed1mr165753666b.11.1763622144146; Wed, 19 Nov 2025
 23:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org> <20251119163327.16306-6-jszhang@kernel.org>
 <aR4BWLo4BdyKhnlI@smile.fi.intel.com> <aR5fwvGYqf1MAbq7@xhacker>
In-Reply-To: <aR5fwvGYqf1MAbq7@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Nov 2025 09:01:48 +0200
X-Gm-Features: AWmQ_blKOKHefxeqx726AC27OYdlPCxDej14EKybN8SCdR_1tmXYwtbtFauUs6U
Message-ID: <CAHp75VdW1JDPmFm2Vt=j20BKf7V+yOdoaQG=sBYKdL0OGj-Bzg@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_230226_429507_D9BB0E89 
X-CRM114-Status: GOOD (  22.39  )
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

On Thu, Nov 20, 2025 at 2:42=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 07:41:44PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 20, 2025 at 12:33:17AM +0800, Jisheng Zhang wrote:
> > > Use the modern PM macros for the suspend and resume functions to be
> > > automatically dropped by the compiler when CONFIG_PM or
> > > CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> > >
> > > This has the advantage of always compiling these functions in,
> > > independently of any Kconfig option. Thanks to that, bugs and other
> > > regressions are subsequently easier to catch.

...

> > >  static struct syscore_ops pxa_gpio_syscore_ops =3D {
> > > -   .suspend        =3D pxa_gpio_suspend,
> > > -   .resume         =3D pxa_gpio_resume,
> > > +   .suspend        =3D pm_ptr(pxa_gpio_suspend),
> > > +   .resume         =3D pm_ptr(pxa_gpio_resume),
> > >  };
> >
> > I believe this needs to be thoroughly checked and thought through as
> > this is *not* a dev_pm_ops.
>
> pm_ptr()/pm_sleep_ptr() is defined in pm.h, so I think we can make use
> of it for syscore_ops as well.
> E.g This patch makes use of pm_ptr() to optimize out .suspend/.resume whe=
n !PM
> while get in them when PM. Thus the same result can be acchieved between
> before and after this patch.

At bare minimum this should be mentioned in the commit message that
you were/are aware of the data type differences.

--=20
With Best Regards,
Andy Shevchenko

