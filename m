Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3E7CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7/UvMP8pF2d0Di4W7qdfx/D73nsmwZpf5H8xyBvB+I=; b=Awve4PzHXQv5jm+FGk156iNTPC
	98EnobTzW+Is307wadTEw0pGUZGbLOzUC1O7y+qgRUZ0ccbqpClA+RDBzTidNuF3AW3EVyZY/od2m
	N4b9XKRAqGdiNLe2wt7ZyC1NyzruraT4Kxkys4xDWA0BJxsrGfmu6+VcYGXaZQIPXMeGihCq4+Xtx
	wtrF2RPsSr92mYNtAQ6Cv5Xk/B4CbSIwXFeTf0Jih6AC1MPKRUD9GHDRUzQ+mFJ0Ue7TLvkd0zkw7
	y4aTQ4qdmb4jwAyAwDg59TJfC79qt3OdQq0xHjlo7WcQth5PymfyWptQm7urFQGoxYUqyApF2G5TE
	YSBRNScQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78Wa-00000007zo1-0M8u;
	Fri, 10 Oct 2025 08:30:52 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78WW-00000007zn8-3315
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:30:50 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-780fe73e337so15730997b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760085048; x=1760689848; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M7/UvMP8pF2d0Di4W7qdfx/D73nsmwZpf5H8xyBvB+I=;
        b=ZyCb1NIH+SYR2gMbD9Sw2cApG/bI6dCsCVxtLIXXSawe0v2OTU9F+5/zin9JETHn1I
         KEoYnOxKFC0zD6fsNjkeUoTAPfryjztGaObtWr6biR6gcMW/PVsHhbVDU8xL3Q/hzO9t
         r2cZVAi7CA7bvYF77Z6t+SHSS9+dUnCBsAiizBqOwTuTW/T1/ssr69+EinWG2n8o2OQ5
         nPfvRcJniY5kh27vKLO+yH9eNx4No7TUHTmFc3nSym9LbEXMBnH3D8RNlJdUFg1ljUUw
         xVz5qJpzMt1PL1nQzJLAi3gU6zFCZZa8V+97XwXNDFQVnHgs2c5prKeI4tQhZR70nvvv
         5JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760085048; x=1760689848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7/UvMP8pF2d0Di4W7qdfx/D73nsmwZpf5H8xyBvB+I=;
        b=EHSufc9QEXXENRpkJmgtJd6Ry7L6kvZiJboaI1YkDWfzDgcx0Vo1modH49mxg2ySq7
         5Pbuq/N+aMV+Vmrl7PQDQhAukYJ/KNc92LUttnKvP7kAQQd/eBZ0d2sErOgJBeK3VHiv
         Zr3A8/zvbYHokTrBJ/DBh4OE1z21eVwVYqExECiG4xeMFR4bFs5kg3FF1whFVQD6XrcW
         6osQjibZvgN7q64/ame7ih1ApBfxxWxC1/aIigxma2U2unGm3O07v7ezbGowQz+ZMiRr
         UDbVT6BQ6UBS3c8o0Jhan6BXXKJJALWB220nshiS1ydsSNJi9pLLwbAA6JUlJtLECeu9
         falQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMzcAWxcj1/eSDbsrAii2e68oVSe+GFKeLfPLbcH9PqXyhaM4oGX3VqK3pPd5k+31+UHqdY7dwMSLpZxfV436S@lists.infradead.org
X-Gm-Message-State: AOJu0YwRgTsTizrKyEctI1aGugXi2DXDdH2lyG6q4vNWua1jNshPWqXe
	EiahkiCEVRhYp2AkiuqyH+ocwExmmo+UnrXAYEqHyIeiyBfcf56u1kKzH+zYEbhI2KPqX3isOhH
	sKhSdZIum4xy99gk1oByQK6M5xM13EGUe6Vwtqd6syg==
X-Gm-Gg: ASbGncus2wJxajJXuM/wsQ/2JCYKhaEFT/WjSSQFPumDEUnibIfS17nKCaPD4BrtBLI
	FlYD7C6S3edTDqlmT8DpLvtWXJSaOxbdJnJS8SGmGU1DVUU9UzV83D+XHYC6RLyCIMB0RZzVATX
	dIJ8JTsgnxPCG6KwVNzqmq8z1382kORo0fkikf7mQDP9vKyZ7eGYILNIDyba/PDEyx3OfoCytmu
	by8iTZFAE1RCj7j69mYNDoG0kGyMxsq2KDclkHbGw==
X-Google-Smtp-Source: AGHT+IELcVFwUCUEmhVUGDnSnGJlpWYHNQOXe5296t/FoFUefz+C1OeDjmmVZXYWz/J3fiD3QdzX5PFMMDEjuQIT79o=
X-Received: by 2002:a05:690e:1a99:b0:63b:a4fa:202e with SMTP id
 956f58d0204a3-63ccb8db942mr7870853d50.41.1760085047581; Fri, 10 Oct 2025
 01:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org> <865xcsyqgs.wl-maz@kernel.org>
In-Reply-To: <865xcsyqgs.wl-maz@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Oct 2025 10:30:11 +0200
X-Gm-Features: AS18NWBt9HOnP-sXI05iFB0KpurINCBSnZcmko0s_eAswoddpw0G_kSGehKntmY
Message-ID: <CAPDyKFq4RgL0=hPhB0cwTQF-A+mXH8dxsZAYTB1CFuLxxxTujg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
To: Marc Zyngier <maz@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_013049_146536_6B66E851 
X-CRM114-Status: GOOD (  32.07  )
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

On Mon, 6 Oct 2025 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 03 Oct 2025 16:02:44 +0100,
> Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > To add support for keeping track of whether there may be a pending IPI
> > scheduled for a CPU or a group of CPUs, let's implement
> > cpus_has_pending_ipi() for arm64.
> >
> > Note, the implementation is intentionally lightweight and doesn't use any
> > additional lock. This is good enough for cpuidle based decisions.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  arch/arm64/kernel/smp.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index 68cea3a4a35c..dd1acfa91d44 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -55,6 +55,8 @@
> >
> >  #include <trace/events/ipi.h>
> >
> > +static DEFINE_PER_CPU(bool, pending_ipi);
> > +
> >  /*
> >   * as from 2.5, kernels no longer have an init_tasks structure
> >   * so we need some other way of telling a new secondary core
> > @@ -1012,6 +1014,8 @@ static void do_handle_IPI(int ipinr)
> >
> >       if ((unsigned)ipinr < NR_IPI)
> >               trace_ipi_exit(ipi_types[ipinr]);
> > +
> > +     per_cpu(pending_ipi, cpu) = false;
> >  }
> >
> >  static irqreturn_t ipi_handler(int irq, void *data)
> > @@ -1024,10 +1028,26 @@ static irqreturn_t ipi_handler(int irq, void *data)
> >
> >  static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
> >  {
> > +     unsigned int cpu;
> > +
> > +     for_each_cpu(cpu, target)
> > +             per_cpu(pending_ipi, cpu) = true;
> > +
>
> Why isn't all of this part of the core IRQ management? We already
> track things like timers, I assume for similar reasons. If IPIs have
> to be singled out, I'd rather this is done in common code, and not on
> a per architecture basis.

The idea was to start simple, avoid running code for architectures
that don't seem to need it, by using this opt-in and lightweight
approach.

I guess we could do this in generic IRQ code too. Perhaps making it
conditional behind a Kconfig, if required.

>
> >       trace_ipi_raise(target, ipi_types[ipinr]);
> >       arm64_send_ipi(target, ipinr);
> >  }
> >
> > +bool cpus_has_pending_ipi(const struct cpumask *mask)
> > +{
> > +     unsigned int cpu;
> > +
> > +     for_each_cpu(cpu, mask) {
> > +             if (per_cpu(pending_ipi, cpu))
> > +                     return true;
> > +     }
> > +     return false;
> > +}
> > +
>
> The lack of memory barriers makes me wonder how reliable this is.
> Maybe this is relying on the IPIs themselves acting as such, but
> that's extremely racy no matter how you look at it.

It's deliberately lightweight. I am worried about introducing
locking/barriers, as those could be costly and introduce latencies in
these paths.

Still this is good enough to significantly improve cpuidle based
decisions in this regard. Please have a look at the commit message of
patch3.

That said, for sure I am open to suggestions on how to improve the
"racyness", while still keeping it lightweight.

Kind regards
Uffe

