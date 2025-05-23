Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9817C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQeY0iIN+5GZNG+0tyR2awygnQMNrIb8aLwJMVvtPFI=; b=meG1SacDWJptHs/4XzDhqH3Ny0
	menn7b2Wok6AO6vdMQf28UAwAsUq5Q7knsug1rmxz/zURcNR2n+u1rPHSQUt6zqq8qVDj3nKc5kwo
	IV0fO/FyVVe+4izWt5rkiEGwBtY0Ahjl/J2Sbpga3basq1A7z2b7I6vTETxT3kcC0jKswnCZXgf0n
	RWvvjQB6cGIJeHEDvl1OpKt9a0bWgQ+jZPNJtmSJv5e+WR3shoC4eSPKMs8QXeySHXSd/rJXs/hXg
	2N+3VMRqmz6Tinw1EKjs7awRJOFh7VFhSvUXI8b3XqL/k8op1mq90criwgKpc0AuyCZF6uWW9FYsv
	QYKAw7Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWpV-00000004dR7-3WcC;
	Fri, 23 May 2025 18:09:13 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWnQ-00000004dAf-2v5z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:07:06 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso1111211fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 11:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748023622; x=1748628422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQeY0iIN+5GZNG+0tyR2awygnQMNrIb8aLwJMVvtPFI=;
        b=Bj3PllAG81NNgYeLfI3hT4hjqgQInKMkDnk1ZkxkplAoKSf/jTUg+7HPcwz3nOLcDk
         5szC/ri5oPrFR3UaWrkNpd1n8edRWbzvLs56uN5R5hTB9zqjclxdsBPNVs+bnfBkndLs
         CG+9YqxO6grZacCVOk5S8gYVzcNOJTGiUtfHtOJD0Ip24Y3eshvnbwULtYbtOJ3fEybu
         sgBVHhlvqWKP3JpTMuW8vAPhb+4Im4ZzZlCf4Hwf1ujPcaPOMVzxdZl1Ook1FrG2/W+1
         v/uLQ2eExkPoUQtZsS40fVQoRb4YhErRdXDTT60vJ0aXWoUfaT4C0dspNUmCDBiBBlx6
         XLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023622; x=1748628422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQeY0iIN+5GZNG+0tyR2awygnQMNrIb8aLwJMVvtPFI=;
        b=BKDFzTvaWNQdLmgNOeVAWI6klhFM/AsfDYgenjsly1ujeF1fQ809mJg432B3sLyjbt
         5nJlpdJzLJ1j+LKSRRcnjiVVoZY3TxVRWpB2HZI4NgnCtm6x6CQnEu5MUMufr5XpBsP4
         jO3fRlXdtUacLWe0YRo/bX+yV38jyrvnE2Tt23RprJm8PKy4D5Uy9HCpMugbQLcNJ0tA
         +3hlqhsv2YlcUEwUFaZoeY4WolcSBsr214OXb+CeUpy/konCEn196RrKyluA9akDS9V4
         X90DEGHi4tqHUj563HD1j41ne42BnWvPyiF1TaHGvc85cToMWrSEv1ZcRNhEpzCA9LAM
         Ym1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWyGAlPxabrZQYIiQGwuSbZz+mJziTUK7QZVeim/xntPhLGYJn4G1OQRW1BtcZzz6qvasbeMIKAKzbj/qOxFLx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8U/Im95ICkDvZ1qjKmOrx/l04KFqKs50iGSzvNJobY9PwPb7S
	DD3vshAX6b1gcK+kkg03pRHLig3VIDeygSr+b6NhRwpt1RW3TnKzx2KZKHZ9NSbMIP9bikvXX7k
	BC0DYDGJiwvepIH/hEbOKELGdLz0isHFp+0Be1sS9
X-Gm-Gg: ASbGncsFoTo4zbVzWycdbk1i+55v7PEiMBAZs6SGP/IyGm2OyyETRGJP6hKAGic4fUa
	D7ZoLdrpFHbt7bUwWR/QxO5kLt+3m+CfxL1I0J01vW+RD2r/H7MHe1Ks1VqATCLERSeH0eGk+PV
	xl/X2pnEp+jiXDjNMqvX5+tllfk9zyRbgAGo98/zGikw==
X-Google-Smtp-Source: AGHT+IHnjp9T1CiF3zXUGrVrt9+40P6mtBZ7VGoSvqkcTrUQnB4/c0BQtPeaRLMgOef5bXI10oH49TBo09PLGFm4IkU=
X-Received: by 2002:a05:651c:3048:b0:30c:189d:a169 with SMTP id
 38308e7fff4ca-3295ba6dcd7mr470021fa.25.1748023621621; Fri, 23 May 2025
 11:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
 <aCNctHq6K7uqFF05@mai.linaro.org> <aCUkN301jWUkXJ3_@google.com>
 <6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org> <aDCrGT67ubNNUoUz@google.com>
In-Reply-To: <aDCrGT67ubNNUoUz@google.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 23 May 2025 11:06:24 -0700
X-Gm-Features: AX0GCFud2nCrPMyuCZEHKFYx0zIOalx0cp0aPqDJ0Dgkc2YdrTSGRNkye6koVas
Message-ID: <CAGETcx84OfLNRjMNGh4jS54_DgRuXx+gF5DhfiGrgckoyOfTMQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, John Stultz <jstultz@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_110704_739019_64F2C9D3 
X-CRM114-Status: GOOD (  49.11  )
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

On Fri, May 23, 2025 at 10:06=E2=80=AFAM William McVicker
<willmcvicker@google.com> wrote:
>
> On 05/23/2025, Daniel Lezcano wrote:
> >
> > Hi William,
> >
> > On 15/05/2025 01:16, William McVicker wrote:
> > > On 05/13/2025, Daniel Lezcano wrote:
> > > > On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> > > > > On Tue, Apr 15, 2025 at 9:50=E2=80=AFAM Daniel Lezcano
> > > > > <daniel.lezcano@linaro.org> wrote:
> > > > > > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > > > > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > > > > >
> > > > > > > On Arm64 platforms the Exynos MCT driver can be built as a mo=
dule. On
> > > > > > > boot (and even after boot) the arch_timer is used as the cloc=
ksource and
> > > > > > > tick timer. Once the MCT driver is loaded, it can be used as =
the wakeup
> > > > > > > source for the arch_timer.
> > > > > >
> > > > > >  From a previous thread where there is no answer:
> > > > > >
> > > > > > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa41=
3@linaro.org/
> > > > > >
> > > > > > I don't feel comfortable with changing the clocksource / clocke=
vent drivers to
> > > > > > a module for the reasons explained in the aforementionned threa=
d.
> > > > >
> > > > > I wasn't CC'ed on that, but to address a few of your points:
> > > > >
> > > > > > I have some concerns about this kind of changes:
> > > > > >
> > > > > >    * the core code may not be prepared for that, so loading / u=
nloading
> > > > > > the modules with active timers may result into some issues
> > > > >
> > > > > That's a fair concern, but permanent modules (which are loaded bu=
t not
> > > > > unloaded) shouldn't suffer this issue. I recognize having modules=
 be
> > > > > fully unloadable is generally cleaner and preferred, but I also s=
ee
> > > > > the benefit of allowing permanent modules to be one-way loaded so=
 a
> > > > > generic/distro kernel shared between lots of different platforms
> > > > > doesn't need to be bloated with drivers that aren't used everywhe=
re.
> > > > > Obviously any single driver doesn't make a huge difference, but a=
ll
> > > > > the small drivers together does add up.
> > > >
> > > > Perhaps using module_platform_driver_probe() should do the trick wi=
th
> > > > some scripts updated for my git hooks to check
> > > > module_platform_driver() is not used.
> > >
> > > Using `module_platform_driver_probe()` won't work as that still defin=
es
> > > a `module_exit()` hook. If you want to automatically handle this in c=
ode, then
> > > the best approach is to follow what Saravana did in [1] for irqchip d=
rivers.
> > > Basically by using `builtin_platform_driver(drv_name##_driver)`, you =
will only
> > > define the `module_init()` hook when the driver is compiled as a modu=
le which
> > > ensures you always get a permanent module.
> > >
> > > [1] https://lore.kernel.org/linux-arm-kernel/20200718000637.3632841-1=
-saravanak@google.com/
> >
> > Thanks for the pointer and the heads up regarding the module_exit() pro=
blem
> > with module_platform_driver_probe().
> >
> > After digging into the timekeeping framework it appears if the owner of=
 the
> > clockevent device is set to THIS_MODULE, then the framework automatical=
ly
> > grabs a reference preventing unloading the module when this one is
> > registered.
> >
> > IMO it was not heavily tested but for me it is enough to go forward wit=
h the
> > module direction regarding the drivers.
>
> Great! Thanks for looking into that. I'll add that in the next revision a=
nd
> verify we can't unload the module.

Daniel, is the module_get() done when someone uses the clock source or
during registration? Also, we either want to support modules that can
be unloaded or we don't. In that case, it's better to make it explicit
in the macros too. It's clear and it's set where it matters. Not
hidden deep inside the code -- I tried to find the answer to my
question above and it wasn't clear (showing that it's not obvious).

>
> >
> > One point though, the condition:
> >
> > +#ifdef MODULE
> > [ ... ]
> > +static const struct of_device_id exynos4_mct_match_table[] =3D {
> > +     { .compatible =3D "samsung,exynos4210-mct", .data =3D &mct_init_s=
pi, },
> > +     { .compatible =3D "samsung,exynos4412-mct", .data =3D &mct_init_p=
pi, },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, exynos4_mct_match_table);
> > +
> > +static struct platform_driver exynos4_mct_driver =3D {
> > +     .probe          =3D exynos4_mct_probe,
> > +     .driver         =3D {
> > +             .name   =3D "exynos-mct",
> > +             .of_match_table =3D exynos4_mct_match_table,
> > +     },
> > +module_platform_driver(exynos4_mct_driver);
> > +#else
> >  TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
> >  TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
> > +#endif
> >
> >  is not acceptable as is. We don't want to do the same in all the drive=
rs.
>
> Are you suggesting we create a new timer macro to handle if we want to us=
e
> TIMER_OF_DECLARE() or builtin_platform_driver()?

One you convert a driver to tristate, there's no reason to continue
using TIMER_OF_DECLARE. Just always do the "module" approach. If it
gets built in, it'll just initialize early?

What am I missing?

Thanks,
Saravana

>
> > Furthermore, we should not assume if the modules are enabled in the ker=
nel
> > that implies the driver is compiled as a module.
>
> Ah yes, that's right. The ifdef should be checking
> CONFIG_CLKSRC_EXYNOS_MCT_MODULE.
>
> Thanks,
> Will

