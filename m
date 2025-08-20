Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0637ECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuAzH0ykyYiagr/z7lts1D1/bhNuD5Pbem4A9m+m2Tg=; b=17kfTMinOgvtUKBSrt1xsVoi7k
	2GG+gteL3TByQsCvXLsvOIp3LcgZyo3JZCUo2Esoukvsh8+A87RC1NnAmrtAJOiLsY+NY39Bn2ZXD
	evb/Df/z2vMdQmG4W8n3R+E19AJpHR7hqOuJxJo14QSVxFxSXGbawFnrvi+7DeH2TQUsXFEKqpEEv
	GwqYeXp/DoUGFWMMrVbBCAmAsyIqHYyVj1/Rw9VlTo+/54AsvBJ5H9UvJx7Q9LakVq/w5+N9L90dI
	ZunWQm5McWRoQKnP2i6MSk3VAdZL5aWS5kpuiU3jKB6XGUCDORg8xbNoOXSNltavPSidA2uRvZ36j
	FidEuhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosWU-0000000FEn9-2z8U;
	Wed, 20 Aug 2025 23:47:18 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uom5s-0000000ESQO-1uZ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:55:25 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-333f8f0dd71so821771fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755708923; x=1756313723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuAzH0ykyYiagr/z7lts1D1/bhNuD5Pbem4A9m+m2Tg=;
        b=UrTqcVDj5oBCPsGZN65tM6z/5jv6prX32i5yteq67m0jmsckYiyUdLfSlaz1HCcxY+
         //g6vCSg6kfHblzEpi08mSQUd/3qSFoTj0uHKk2asPJCPQDoxKTlqcvSJmXwxSDVahbC
         uDBwrxTtJthqc/3MsLMPPFsLQk7E6gmUOPMOWYfApXiNbebf4frEbfwFlLs9BIJ4VA70
         9OxTf2CrE2WZVju7EJadEfG4KaiEqvFTM2q/DhW09TAxGs6wRm7vDRFKzmGPGdPvjvGk
         tvFZiRmbt+WVhg6LjHXln7ZEsOMvllJKMzU9qHU/7ydF86ZCSkPijXnMsXtB30wcHrAG
         vcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708923; x=1756313723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuAzH0ykyYiagr/z7lts1D1/bhNuD5Pbem4A9m+m2Tg=;
        b=r1BEoqlf6cpU2J7OEvpLBi2Wf1Laayc7SOwkMiZ1i/vdEt9HyHPVOshP/pxMIOd3C0
         1o7wbOtc1VGN7RZ4RJtMcv6rtFg7E3V5sC5AugUV85EjI+eP6VEAylberH0UXyioCTdU
         /kds37Q91Y6fksSLLnfpWt2FdU01EyysZ5TTfoKmaw8Mn+xvThWwSfDGGcOd4aJRGzKW
         SL0u0F78HqLTxoziT1pFz0HXRnW4NFUmlJmtUPP3xO8TiyMRBK4wFe7WDBlNJPf1/6dV
         65FmGvjkoxAqsyVwFZn6NCHcV/T52LaCFJFcRJ3a9qUzT4DqOhwcwpv/6XmYWoZ/XMSw
         /Wdw==
X-Forwarded-Encrypted: i=1; AJvYcCVxtaMnufxBDdHuNcOa7oF+AJWhVKgAE4122ArakfGDzs8fhFMEoMlg/KGUsDflY/kojHk7pzPP3gNQU2TeG2F4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6nuuM1Uy2NKtlURgmdYvcTrkXsD2tUO5XfEC/j8UCN+1qw3YU
	IntI1LkV+F+BlVkZD/UxnhS8JaLD3Eb3uGcNfv4Usf7Xg2TkLOtnToxge/va6BxEt2urxUdVLm6
	gsqXJIFt4TsBV9csWwR49Yzl3NL8UrmA=
X-Gm-Gg: ASbGnctujWOVhkaaH7dQzOoHmkkiIP1632caJZsu7+dsKYOHw5tkm6k5e0HzKhQul4P
	H2mDmAKiJFbUucfxo9YhJU7hjGu98X2U/xJLR2plfW3T8tXq0cfmk/cPUAdNKzBhHVFu/MjE+Br
	YsArdDyy8I77x/qpm+ZZIrNf7K86ucrbUPm1w0agsmDLHwoKQpmJrW/CbbXnz7FwsH+BogWBRcm
	Ntg1VPRiQ==
X-Google-Smtp-Source: AGHT+IG92IoA2AqCrHNZ4KLxUNPzBodaSC8TC/cL/HxR2lwiS6CTezTFwiN6A5FTnbMQgl63MEzKwQKNYnc5KKI+YfE=
X-Received: by 2002:a2e:ae06:0:b0:333:ad65:c549 with SMTP id
 38308e7fff4ca-3353bd0e3f5mr10956591fa.25.1755708922348; Wed, 20 Aug 2025
 09:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-2-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-2-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 19:54:44 +0300
X-Gm-Features: Ac12FXxM7XPYPLdV05A87IZXsfGsg-W3cLkTiT8TRS3erU1NEZV3eHHBOgSvqrU
Message-ID: <CAHp75VfxSBPzvohrW4tywd4VS0r1_mp8WLvdKcN_yn=zNS49HQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_095524_492672_C56EE7DD 
X-CRM114-Status: GOOD (  22.51  )
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

On Wed, Aug 20, 2025 at 6:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
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
> The dwapb_context structure is always embedded into struct
> dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> data overhead for !CONFIG_PM_SLEP.

I don't think it's a good approach to add a lot of data for peanuts in
case of PM_SLEEP=3Dn.
Can you just drop that part from the patch and we can discuss it separately=
?


...

> -#ifdef CONFIG_PM_SLEEP
>  static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
>  {
>         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
>         struct dwapb_gpio *gpio =3D to_dwapb_gpio(gc);
> -       struct dwapb_context *ctx =3D gpio->ports[0].ctx;
> +       struct dwapb_context *ctx =3D &gpio->ports[0].ctx;
>         irq_hw_number_t bit =3D irqd_to_hwirq(d);
>
>         if (enable)
> @@ -372,9 +367,6 @@ static int dwapb_irq_set_wake(struct irq_data *d, uns=
igned int enable)
>
>         return 0;
>  }
> -#else
> -#define dwapb_irq_set_wake     NULL
> -#endif
>
>  static const struct irq_chip dwapb_irq_chip =3D {
>         .name           =3D DWAPB_DRIVER_NAME,
> @@ -384,7 +376,7 @@ static const struct irq_chip dwapb_irq_chip =3D {
>         .irq_set_type   =3D dwapb_irq_set_type,
>         .irq_enable     =3D dwapb_irq_enable,
>         .irq_disable    =3D dwapb_irq_disable,
> -       .irq_set_wake   =3D dwapb_irq_set_wake,
> +       .irq_set_wake   =3D pm_sleep_ptr(dwapb_irq_set_wake),
>         .flags          =3D IRQCHIP_IMMUTABLE,
>         GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };

This is an interesting piece. I haven't seen much similar in other
GPIO drivers, I would suggest to split it to a separate patch. Also, I
would always have a callback assigned.

...

> -static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
> -                        dwapb_gpio_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend, d=
wapb_gpio_resume);

I think Bart wants the 80 limit to be enforced. Can you just make the
split rather logical?

static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops,
              dwapb_gpio_suspend, dwapb_gpio_resume);

--=20
With Best Regards,
Andy Shevchenko

