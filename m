Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F241CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP3c9SMShxEOwyq3nLN0BBLkAiPxhUwRn01NB/RvErU=; b=xgKTv188Lp0PdQXv1MKoQhaXNX
	CaGY756N7JdcCPJnw/rSKyq+WNQ/7c2UMXhmF7wwK9s5V9emY2PtVVou4nXEpOWDWBESDzY3y7E90
	4Vg6DSlSab85e/3KfczjAaXTa+LBPlzfOAI2A1syXMnU84uZ2Gmac10sxjwPhnZ5th+oky8nVnquB
	QoFW4klybWnaN87ZNbgp9vU4ni1gwepqhq57eR06aovfwNHy/fAqA+rUBSwHKBtKIe4h1GGeX9JM9
	MoNflDR1bPgYh/QzLysmQQUIk65uHD7idYGbdqa3rWTccUctJVNf/LyviBUbQgFG6OIss7rBxCVkV
	VhF+D7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNY8O-0000000BsvM-2olO;
	Mon, 24 Nov 2025 15:05:44 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNY8M-0000000Bsuv-1QDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:05:43 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-7866375e943so33642727b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763996741; x=1764601541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aP3c9SMShxEOwyq3nLN0BBLkAiPxhUwRn01NB/RvErU=;
        b=ixc+ij4WmNcPtwN4awNrUGOj/EWC4IfgYYKzvIQXrJqU4JBvGn+iisdSv7qaf7C9Lw
         L2Au3qkQ3ahaOTWIsN6OU5+EmsZBWlElct5mwlMxZv6gubu5fe09FBKdJOc7u1cYnaw2
         3l2K2g0ga9lTjw0vnlfWVU9pxgG4llACE474lLtTNZ+Sls7jPHs3waQ4YtaKfQD9/Jx/
         ya6++1MTrKFgs5RHWyGeQ4c5vs7UQD45VFGSPKFBkZY//71W7tm6+BzPk7ae55cjyThk
         Rz4LwAvY4Dx6raIvtsRBb3afExbLc+9RfsVNYBP443tHLj/B+wb5G+frcG0epyv89RBh
         XZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996741; x=1764601541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aP3c9SMShxEOwyq3nLN0BBLkAiPxhUwRn01NB/RvErU=;
        b=Ew1wbd4pGnuStcLJb9rUU761acLpbgIHpsmhyrDLiRSxex4Czt66dPV/e6mJ5iIyff
         UUNpKv3ro1COHVdGHb3yY97B+j1IP7wszEl6H5j0q/2FgjjZ+t3j3EA7P8YHHKE1VZxX
         RDmoOD7LfBjsC8ceCksd9jqPvUe5bg/NLQcAhzpFQfWBhhDKj0vBI/9pNCI0hVW2H28k
         xacGY0VLHDkvLjOZc1UPL6SPBumvCiDo/TfkdsY5ssg1EmgoFocJtiKuYR2oOGIfrU5M
         vuAKWe7xN0xNnza4T1Rndk+PuE1/Kz1mFOzWmXJwCuEiohrQBG13hk1fQd7IIAET1JAG
         pWYA==
X-Forwarded-Encrypted: i=1; AJvYcCXftM+B+tG0EF+W8zJe6NmFtCTfA7LZjx6sFtLYMqggZhg8wpgoG7eYWyzlbep1vqRMBLYBZzGDhBA7MwxGFURI@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOcq2npcdkE8vUucn4Nyik51oNmlyc+BiebmTyYMhN3fxzpxH
	AuLuU5WgViCFCXJn8bmsQAPtZEw6HSX9E1qhTJ0J41tRdMzDKd6uo1yCWvuI8eFYYI3BlQvR4xA
	HfmckhLy2a+QzuZxArNc8W2o/OhH/XnM=
X-Gm-Gg: ASbGncvlMUmWI1tqNpQ+JK1wkrjoVux6+AZPzFmTdKvQ9h2jCL+TRK8iJEQTxQG7l2p
	d3ajB7gdo1NVua2pZYYeWHzZAIJPckWw39/yyUFPQAllReR24YYhT/jWEey/zOaCtFXdnBWnuwG
	VphGbtQSNtGB9b+dyY1wugEADz3EsG8zZ8nrqLkKCq//gMrRgJysQDxx2CTPvVEmaPTYLYmBiUQ
	2PJZ0/zYF0ln7+FHgvmp7Uyj9rJZJJ+MDEGgP6WXy04qV0l6OUvSKZHgjRT5cJ1lleGqbsw3Nar
	2dZg
X-Google-Smtp-Source: AGHT+IFcExc3fv4iwEnjwdVElQfQ9ZjwdK/2sF8WqvaZYhh0951LGPDi6Qt6Ua7iwje0oVX+jz1IhOPYeDB7if/Vs7I=
X-Received: by 2002:a53:8547:0:b0:63e:17d8:d985 with SMTP id
 956f58d0204a3-64302ac3230mr6411404d50.53.1763996741097; Mon, 24 Nov 2025
 07:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-3-jszhang@kernel.org>
 <CAOiHx==ttP2T=VLsSE9nLr5Cai_D+Khr6ePJVdOEim8ThWSdmA@mail.gmail.com>
 <CAHp75VcRWODpL2DjAiPm0=bhTJfjs6RdNgtroRbvEW7ong3ALg@mail.gmail.com>
 <CAOiHx==5TkW_-3yoqN_MzhdLKbMFvXRj-pWpuS5ahTM_ccVekw@mail.gmail.com> <aSRwXCfG1RimQZxX@smile.fi.intel.com>
In-Reply-To: <aSRwXCfG1RimQZxX@smile.fi.intel.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 24 Nov 2025 16:05:29 +0100
X-Gm-Features: AWmQ_blzotQnnPxsn4ZXGglW8dyTnG1bAcKi8OqUcRNMcebAISg0ref3oiKykrg
Message-ID: <CAOiHx==4NSMNVdW163nE-vYf_FtDjS5aHfj5chPr3n6D2Mt9Nw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] gpio: brcmstb: Use modern PM macros
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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
X-CRM114-CacheID: sfid-20251124_070542_389044_AEFA8C75 
X-CRM114-Status: GOOD (  24.38  )
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

On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Nov 24, 2025 at 03:20:00PM +0100, Jonas Gorski wrote:
> > On Mon, Nov 24, 2025 at 2:52=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Nov 24, 2025 at 2:40=E2=80=AFPM Jonas Gorski <jonas.gorski@gm=
ail.com> wrote:
> > > > On Mon, Nov 24, 2025 at 1:39=E2=80=AFAM Jisheng Zhang <jszhang@kern=
el.org> wrote:
>
> ...
>
> > > > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > > > -       .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > > > -       .resume_noirq =3D brcmstb_gpio_resume,
> > > > > +       .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > > > +       .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> > > > >  };
>
> ...
>
> > > > > -               .pm =3D &brcmstb_gpio_pm_ops,
> > > > > +               .pm =3D pm_sleep_ptr(&brcmstb_gpio_pm_ops),
> > > >
> > > > won't this cause a "brcmstb_gpio_pm_ops is unused" compile warning =
for
> > > > !CONFIG_PM_SLEEP?
> > > >
> > > > You probably need to add a __maybe_unused to brcmstb_gpio_pm_ops
> > > > (which incidentally DEFINE_NOIRQ_DEV_PM_OPS() also doesn't set, but
> > > > all other *_DEV_PM_OPS() macros do).
>
> Do they? I mean the modern ones and not that are deprecated.
>
> > > Shouldn't it be covered by the same trick as pm_sleep_ptr() does for =
functions?
> >
> > pm_sleep_ptr() becomes NULL for !CONFIG_PM_SLEEP, so there is no
> > reference then anymore to brcmstb_gpio_pm_ops. You would need a
> > wrapper for brcmstb_gpio_pm_ops itself to conditionally define it to
> > avoid the warning, or add __maybe_unused to it to silence it.
>
> PTR_IF() magic is exactly to make sure compiler will have a visibility wh=
ile
> dropping a dead code. Did I miss anything?

No, I just was working with old assumptions, so my bad. I faintly
remember that they used to work that way, but maybe I also
misremember. TIL. So disregard my comment.

> > Note how SIMPLE_DEV_PM_OPS() and UNIVERSAL_DEV_PM_OPS() tag the struct
> > with it (for that reason I assume).
>
> Both are deprecated. Not a good orienteer.
> None of the new approach uses __maybe_unused. (See DEFINE_*() macros in p=
m.h.)

Maybe that some were using it was confusing me into thinking it is required=
.

Best regards,
Jonas

