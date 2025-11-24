Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC83FCFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=; b=BAZIHZ7L+ifa8vRChpCU7eILRl
	coGa6iUceUyH1/YyIOB90S4zzAXyiWyrIaBiMLvOskCJ9tY8rtGjOijBneKzFJWfTjrXkafDNbvBR
	031s0HxQzCDilf560qmjZNAyDA2qVO+81lXLz5bWgt0LaGsAAXht2mLwqvi+NX3I3aUv9451IOoRk
	y/qqNmsB69zRV4DxXLXCynu2zrULI9iRCq1i79RFlPfBPFRttzGqekMcVicxRzeYd1pTb6C1oX4qE
	cE+n50NvcAPBzpmb+SSnG5cBmO4M+kvZt8vVIUUVqwNeOi6Z0CPt5kY6liG0vDu/KmLPxUU4UxQMQ
	W5OwketA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXQN-0000000BpoV-3yTT;
	Mon, 24 Nov 2025 14:20:15 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNXQL-0000000Bpo6-3pAF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 14:20:15 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-642fcb9c16aso3157437d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 06:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763994013; x=1764598813; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=lLdbYWA0WQLBfRw9iNNQKUb6DDo8WSSVJ0MW9d4GiQb2++tfxoDCF37jlsB7Qe8EYX
         Jha5H0zBDatpQ65HTg4VohehCs8EPWa/eQ7BzblzSVmaGlLTnoMNJNGm+t3jG7KH6CaG
         6iskkn2dk5OQqBnpQ7rmwdFSelvx+LLAwfVSGXg8dPtSXI7sw9qBGwMfwGmN39arc6Uw
         KZiRtYAztezzkCz8qOhVJrnKZ+WTJBp3tyr89UpE7SOC9De1YMfI86H3wwHbFdHxHCQg
         YPH2vYdVm25JqGY9zuc53e9m1KhWfabxrNDvMbtqu66LdANaLIhcQHIh9VUzTfDmRmCl
         nT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763994013; x=1764598813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTsU3/VBT7OkJy6nyHJhlew8G/sSBpilG7m0hm09+DI=;
        b=sWvSCqvGIuUZE9f3SnL7bNP/b6LRJnJp+AxREVYoz6H8t87uuNL353ZrMWX01ei/4h
         CnMY1csSqCmHUOVMFIldgd1UQh2/MGyw0n/8d1fSNfyer7syZfhsGngzeORRmbtZzebH
         84Rkg3jSeGYvCypbkUMC0zwgO10WPnE1tWUya3MRhLmY9u0ZKYVqRgAljdPWQsJ5H9ZX
         OL5Or7pm+vMaEaxzOhOuZzxRGpvmLkPrSa8Wxl9qd2GrcX16haWuSMRelizNy63KzI+2
         gpWLLXWYgLRHBrmsvhkw66FjbBMawgcBJ9uP6mEOAxFCGIRBp0UBv2r/SdFBxqVyiFz+
         uT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDDs/D1MtdRULno/W1N8IhDLB/4AiIGpC8Y55cjXeVhdzUK4s/uqOD/hbDshgxu8komPJcsKGgz5pRo1mCk0UB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2E8eTToWQtFlC7lZTIEago0PY1NBckeqJmG9XoNZfVvBUx0HD
	EAjyFDbJ+EP1cmT9ELxOgWyzg1xdOSOFCzOeIGflwmo32gM81Jt0f6x0aCRbnXjqCGBuSZjyG8m
	gAFZsO46gmY6k3YLgG55ixtXomDHmo+g=
X-Gm-Gg: ASbGncuBF33vTuaBZ2XABiZbb2GWrVtORwhONQiwmrYnmNY3ANj36E/fPnw+aOJ3xUl
	JaGg3lIsLOP4kTIv4+8LffH+1560+qPxZVNLF4avtnBHTtqqgGtYbdLTSJhQvbR3bf4OXGCOzUU
	l1LDwiKe8w6DG8t515g4PoEthb2Qvpx6+KMREc+GlkjJXFIYJqDpD4iZ9qfhokl7x/2UPtEocMJ
	0ijDi4aPnQbz2fKPbReqftTXvIC5UVJLqSPs3AMyM2NuguM8uXeR7Iwvig0OtR/uCxi/A==
X-Google-Smtp-Source: AGHT+IGXDHAnoYqNvGl6qbUdw4DMm1fGVB/3Tpw1uJs9W3Glb48smmRl2MqryTURWd1WdtrIiMUU5XKD2nAkGvh+X6Q=
X-Received: by 2002:a05:690c:74c5:b0:786:5712:46b8 with SMTP id
 00721157ae682-78a8b47af0bmr176562577b3.5.1763994012509; Mon, 24 Nov 2025
 06:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com> <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
In-Reply-To: <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 15:20:00 +0100
X-Gm-Features: AWmQ_bmwAL8s4vZ9H815tlfRFg29LQmJQkA9Zmf12Y25EoI_zAX2FlKPyt9VVWc
Message-ID: <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
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
X-CRM114-CacheID: sfid-20251124_062013_980052_BC9D816B 
X-CRM114-Status: GOOD (  15.35  )
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

On Mon, Nov 24, 2025 at 2:52=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gmail.=
com> wrote:
> > On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kernel.o=
rg> wrote:
>
> ...
>
> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -       .resume_noirq =3D brcmstb_gpio_resume,
> > > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> > >  };
>
> ...
>
> > > -               .pm =3D &brcmstb_gpio_pm_ops,
> > > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> >
> > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning for
> > !CONFIG_PM_SLEEP?
> >
> > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > all other *_DEV_PM_OPS() macros do).
>
> Shouldn't it be covered by the same trick as pm_sleep_ptr() does for func=
tions?

pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
reference then anymore to brcmstb_gpio_pm_ops. You would need a
wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
avoid the warning, or add __maybe_unused to it to silence it.

Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
with it (for that reason I assume).

Best regards,
Jonas

