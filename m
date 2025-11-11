Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F6CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGMbS3VEvjhgNpVe1MttoJ7jTkjbM/PBhlD1Dx+012U=; b=rHXGFEh5529xW7ub1hhf+NTQDZ
	J3qwLlS6Q3lZAgsBfJgUis+dW6BNK9H22VX9d8FKunbPC97aFd4w+Xpg3PFXe18U70Xzr/ho4wl5T
	nGQ1ws9dG2Pgpoyp7PEnRYuNbUuz85NTZZ7d5W1/FNnyoObzl/1E0IM8Lgxi8Juap8Bm7tbktUaQV
	4K5BW4ttBXD+oinmx/15RUUlo2z42CWZ8nVLF5JwVT+498QCsiGPROjMCyAnwNObz1LTP9CxHmtRm
	NAV9Unnr6DMTNrDrb+OQAlts13XIPF/jddU+TR2U8GLUotTxIFp7hCGC9sX1qO13h5VrXP+sDRjCH
	K1H78Wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIibN-00000006faU-0GIN;
	Tue, 11 Nov 2025 07:15:41 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIibK-00000006fYb-20S4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:15:40 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-44f9815f385so721073b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 23:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762845333; x=1763450133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGMbS3VEvjhgNpVe1MttoJ7jTkjbM/PBhlD1Dx+012U=;
        b=LXlciulrI3V7A19/4wSpt9nQ/6XmznBSTMH/IKD2Q81Pj2txnVBbSM60yxzqwDP5HD
         fGHmhH3u85MUlXKLoraYWJrPqmIEFmaSipJDGeA73vbnxyDXnHXeoGEMQoGGXomx6BJr
         wOTMbbFb4YeqRmsNVbqRWSjndiw66kJjfIjwm0ve6b8OCyZFjhRU4+zEALBB0djDgSb0
         O0jz3WnOO4Ectf/kJBJopDcl1U4smvOJa2n7HKKe6I87RUbhlEezsZg9UlHrG4+JVX4K
         OAF9NVFk/gNyGo8sCI9doognf4fnO7AhPcpsB0CSi+ZBiiG0SdhCxa/tcKXgCSrr314R
         goJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762845333; x=1763450133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGMbS3VEvjhgNpVe1MttoJ7jTkjbM/PBhlD1Dx+012U=;
        b=ZpboQvJCtPWxkwmvBaICZWtYAZJmuMmhMfsDsLeejnCruZLFHIkKIcWkOIoyk/xIkL
         vYx6aDMSOBJUOhgGU4r1VKaC1eSqLtCaDaR/aVtt3+bO8hAGL/Xq2lDbtkjg+qvBQWR5
         EonhPFND6kN7PMv6cFoh+MknSdh23RT/jVD9Sw9TT4fqnhAFr1dh206qUZIv8jTMAavk
         VDZcP5iTlUQ5QVZsPVlR0julpQCpiYL3Ixpvt6K9usyrIlhmPqNOk/GhEJcT7nrEJpGg
         gAWWBoGxXYP9PTH7nYNL8X8jE8cS7mq20vSObgHpan4+pHRtvdpVYv6BnbuPnOI1c5WK
         eu+A==
X-Forwarded-Encrypted: i=1; AJvYcCXT79pVbxMj9HjwF21h4qopVoGpEzMME/+tqstcA3Q/oTvhvZEgr8Ize7LQI+KP0rt0D7MH/sX33dfxR0WDZxeY@lists.infradead.org
X-Gm-Message-State: AOJu0YyFF7f9ALRglZvqktehG6RyEeYZGE5Fv4OUDhrVfEgOKVFYJmmd
	2OjriIvYtbjp7TQzHPfAIGBRVX0WY9FujM6VV4rzUlRhpuhUTAOs35m644XzzrfffiiIuyx8Lhd
	A/+7iTZewVgF74NPdtMpbAvIHxE4ODX1Yr11jk5b71g==
X-Gm-Gg: ASbGncvtX2i7UGDvMdTGTzoZzcF8d52Yh3+VIhfxiuTe/tqvA0KQYz/W+l7g8CQFdDy
	x9EdJLtMZTLwXok+GfLezQng7C9k1LkCIR1IJ6e1H/jKC7XlUYkquvdmQi+j0IG1y7cDuCXbGKB
	IAzqksdznqoZOf09aCjzHfE3jSeOIUnr3l3fWg0+Mbtb3ETzY/BZma3o0Bqi2W5P7PGpRcrOsmX
	jDqOKpndEUrAGTu/dHSeJkYfABTZJo0prMkW3XR9wIeN8SzobseQOWa3yZ5k1iwJa2Dc58ibw==
X-Google-Smtp-Source: AGHT+IHWbJ4Yp3gQoh0gR8ti6hW2JnDfbC3dn3VOEzDDEL8ykj+19tubGTkAQQf4eOHdb+UN2vP0PrZVV2xFeQuhHI4=
X-Received: by 2002:a05:6808:15a6:b0:44d:badf:f41a with SMTP id
 5614622812f47-4502a2df5d2mr5427044b6e.32.1762845333082; Mon, 10 Nov 2025
 23:15:33 -0800 (PST)
MIME-Version: 1.0
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com> <aQixsIQXTjYyhRVj@willie-the-truck>
 <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com> <aQ3v15yrm9JaWgrm@willie-the-truck>
In-Reply-To: <aQ3v15yrm9JaWgrm@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 11 Nov 2025 15:15:21 +0800
X-Gm-Features: AWmQ_bnoZJigBSCLU3lJje6heEEH-Frt6iL4puU2iLrcXPWUx0zHPoaDlQHxw1Y
Message-ID: <CAEEQ3wnC-xGZ_m4+vJ42KzU4DdQb1CGfZh_=Nz5wkFuXKS7Y3w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_231538_867722_A9BEB4E7 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Will,

On Fri, Nov 7, 2025 at 9:11=E2=80=AFPM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Nov 07, 2025 at 10:42:25AM +0800, yunhui cui wrote:
> > On Mon, Nov 3, 2025 at 9:44=E2=80=AFPM Will Deacon <will@kernel.org> wr=
ote:
> > >
> > > On Tue, Oct 14, 2025 at 11:14:24AM +0800, Yunhui Cui wrote:
> > > > @@ -306,3 +307,85 @@ void __init hardlockup_config_perf_event(const=
 char *str)
> > > >       wd_hw_attr.type =3D PERF_TYPE_RAW;
> > > >       wd_hw_attr.config =3D config;
> > > >  }
> > > > +
> > > > +#ifdef CONFIG_WATCHDOG_PERF_ADJUST_PERIOD
> > > > +/*
> > > > + * Safe maximum CPU frequency in case a particular platform doesn'=
t implement
> > > > + * cpufreq driver. Although, architecture doesn't put any restrict=
ions on
> > > > + * maximum frequency but 5 GHz seems to be safe maximum given the =
available
> > > > + * CPUs in the market which are clocked much less than 5 GHz. On t=
he other
> > > > + * hand, we can't make it much higher as it would lead to a large =
hard-lockup
> > > > + * detection timeout on parts which are running slower (eg. 1GHz o=
n
> > > > + * Developerbox) and doesn't possess a cpufreq driver.
> > > > + */
> > > > +#define SAFE_MAX_CPU_FREQ    5000000000UL // 5 GHz
> > > > +__weak u64 hw_nmi_get_sample_period(int watchdog_thresh)
> > > > +{
> > > > +     unsigned int cpu =3D smp_processor_id();
> > > > +     unsigned long max_cpu_freq;
> > > > +
> > > > +     max_cpu_freq =3D cpufreq_get_hw_max_freq(cpu) * 1000UL;
> > > > +     if (!max_cpu_freq)
> > > > +             max_cpu_freq =3D SAFE_MAX_CPU_FREQ;
> > > > +
> > > > +     return (u64)max_cpu_freq * watchdog_thresh;
> > > > +}
> > >
> > > Why does this function become __weak? Neither arm64 nor riscv overrid=
e
> > > it afaict.
> >
> > Would you say there=E2=80=99s any particular issue here? If some archit=
ectures
> > might need to override the hw_nmi_get_sample_period() function later
> > on, wouldn=E2=80=99t __weak be a more reasonable choice?
>
> __weak is pretty brittle (it can depend on link order if you have multipl=
e
> targets) and I suspect it prevents inlining when LTO isn't enabled. It's
> cleaner and more robust for architectures to provide their hooks by
> #defining the symbol, as is done commonly in other parts of the kernel.
>
> But in this particular case, it's completely unnecessary because there
> isn't an architectural override and so this function should simply be
> static.

Since the function is declared as u64 hw_nmi_get_sample_period(int
watchdog_thresh) in nmi.h, it cannot be static.
I will remove the __weak modifier in the next version.

>
> Will

Thanks,
Yunhui

