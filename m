Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB234CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVT+P2Q2FNbO4yzzfNdRhD+z/9sACB9TSBL1VHafyeM=; b=TnnYoQJEklhTR4YSGUxpHaMSvn
	sheGjZ890Vpbuyrxvpax2KnoUvXyvzTsrYVyldjdZFkGpAlCApJF13csbhSa51Rqx2cVfnHMZ8ZVL
	rzuGwk2thgxfKTnj2bd1FQzTw0mfWEs2r+ZVp8UYWwvlAQAKfFbXcceYjB+SOvpSxUHdMNONaa5l/
	JDI4d6NekVKWEp+pu8ktsXK3Rug2O1RRS++344XRnMw7V89IoA4oNJ5t+y3k0zt7L5HEnbR6TVLBQ
	dm/Mfq/LkpVcZLxXOsvCgAgEkiesHzG87RCCiuGkpr3KuGyjvszZxBJJWqMhh7DmULegVQ78WVckt
	b8tJyyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVrb-0000000BfCS-2AQ0;
	Mon, 24 Nov 2025 12:40:15 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVrZ-0000000BfBx-2xeg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 12:40:14 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-642fcb38f35so2780092d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763988012; x=1764592812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVT+P2Q2FNbO4yzzfNdRhD+z/9sACB9TSBL1VHafyeM=;
        b=LL6SgA+G4n1mZ2kwzaoH0vRCQhNIJp5Cr3sjNrpsMjZg5YvYCDy9khV6zuUSDNDZe5
         nXv/FfXd/F/7imfZcye98CLrtH0BKvfEpclfa/dAMMBgb22cFKJ/wwa43iEaSva+7u0s
         LgOuhWmxULTnAK1tLNN1GFqa5bCrOsQfoOrJhC9eca4CHyH7ltmCxbHDWwbKnXnQeBDF
         lMJmZLn/0a9HBIQnJLDRqFybS4zfWiqwTw/qNahlHeHCUVfXsII4Q3fXqV8C0oOD0ZcL
         S58gUsAj3YpurcX/K+aj65vVWPuFoI3N8kNhiMzdr7PV271zf94+G9MrNaAChEqQHu8l
         En2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988012; x=1764592812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oVT+P2Q2FNbO4yzzfNdRhD+z/9sACB9TSBL1VHafyeM=;
        b=kZOlHAsDgRyKCNXNSZUPowtViPS17vMqp25RGvFO1kGiYlbAg3tIGQSjVHOEMjCU0N
         7tnR6EHfomLFL3MfGvtnWcNFJ2XU9KjlV1/+XMWJs/ZTXqIwGMzlW0mM/s76uVKC9TTY
         IooAEc3UXcj3D7aJir16yUX65Dhc/UaKzRl6tALD/ue+kKj9UfVtjsC/enbeES423VuG
         E9E2sRiWXHKwrP7D0RuXEBycQnYytkQMWjyLE/J+xbWht0TMzZ5N3pM3k0X7GxpFiCkL
         tj8EjMiNoiBCBDKqjWfZkgZj8NuRhNtMFnp6Vy5mtUJssvrpKo6VEV+9aXriQINRnXPO
         VEvw==
X-Forwarded-Encrypted: i=1; AJvYcCXZENcoUuRG2fl0No4h7L/tjqEJRb/jujeh4O2ENg5Ppw0Z213jZS7FGKVaEiPZbHr1HoSi6cEVjN4DOLzdawJc@lists.infradead.org
X-Gm-Message-State: AOJu0YzxQGj3bz6y2BeEbvjtYhWeg6gH53st40M02L/RpQh54B3ZykkM
	4F2kG1EEtW3SReQWbRzKjVUzA1zH/KLKuqAoNbBRNFE2DW631xxqDrk2jCtr2gQ5z9bRlfNaMIz
	1ekHZwTvy6Y3cgudCJWeKT/nbD7JbOzE=
X-Gm-Gg: ASbGncs9AfidAgDVEFfP7eeZnS5bbnY0j3sr+zAMCtWDeDgQw/wXrUkeNp/vSfJc//K
	jPobcdioTOH9fOSiEyMd18NGQndys5FOL8XVgMl40lzJsKWDwh5egsf2PkGWb5axaHhq60Rcxgm
	QFeaqR150xhTiJu3hGhrrAQCcCBMx66o9tCCk3WIJKVfDYfSlhq6fovV/Vax449yAckbN3csQJF
	PMwC49KJXcj5FHM5ofwrdjvXfB/JLe3oqCY4IAotLDwEjZJG/UAinvrRHDzzgrSwADBhw==
X-Google-Smtp-Source: AGHT+IE1Llqkx1CcVPt39GnPt1w3RJWhFY7IsrU1F2MFCRvzmfovoyNjDStaDNVwB1QPHBPj5tW2Qo84aqI3y8Nh/Kc=
X-Received: by 2002:a53:c0d0:0:b0:63f:7d36:ac28 with SMTP id
 956f58d0204a3-64302acba70mr5672331d50.59.1763988012200; Mon, 24 Nov 2025
 04:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
In-Reply-To: <20251124002105.25429-3-jszhang@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 13:40:01 +0100
X-Gm-Features: AWmQ_blA870SHKIPqlSbPujYnm4wsQ6WId53r5BZ0bZ7_9yU2yeH8bEzT4EwQes
Message-ID: <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
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
X-CRM114-CacheID: sfid-20251124_044013_796645_7D30AFDF 
X-CRM114-Status: GOOD (  23.01  )
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

On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Doug Berger <opendmb@gmail.com>
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-brcmstb.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index f40c9472588b..af9287ff5dc4 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -533,7 +533,6 @@ static void brcmstb_gpio_shutdown(struct platform_dev=
ice *pdev)
>         brcmstb_gpio_quiesce(&pdev->dev, false);
>  }
>
> -#ifdef CONFIG_PM_SLEEP
>  static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
>                                       struct brcmstb_gpio_bank *bank)
>  {
> @@ -572,14 +571,9 @@ static int brcmstb_gpio_resume(struct device *dev)
>         return 0;
>  }
>
> -#else
> -#define brcmstb_gpio_suspend   NULL
> -#define brcmstb_gpio_resume    NULL
> -#endif /* CONFIG_PM_SLEEP */
> -
>  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> -       .resume_noirq =3D brcmstb_gpio_resume,
> +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
>  };
>
>  static int brcmstb_gpio_probe(struct platform_device *pdev)
> @@ -755,7 +749,7 @@ static struct platform_driver brcmstb_gpio_driver =3D=
 {
>         .driver =3D {
>                 .name =3D "brcmstb-gpio",
>                 .of_match_table =3D brcmstb_gpio_of_match,
> -               .pm =3D &brcmstb_gpio_pm_ops,
> +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),

won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
!CONFIG_PM_SLEEP?

You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
(which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
all other *_DEV_PM_OPS() macros do).

Best regards,
Jonas

