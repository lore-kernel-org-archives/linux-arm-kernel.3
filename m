Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CC9D2AB30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Idi7mW1U/PRXaQCkWe/8k2CB2lHuMJvDPUFBBqLYcGc=; b=OQtBYCFcZEqlmn3/kjzJ2ElCTS
	aWHab1PuyPWbBqGdcXjAxWmSi9joNSzZtI1guQL8z4y4n1w5hEcH47RU9q9biU5gQnBY3QiAMRQf2
	m5BXGTatd+q3azOqFn+8rrfjQHl6ZSYvjLi9pR/JCylNIYh086NBRqwbYmr6oCxHjTzMOYKKNeZnK
	LtAISO1gtaZQOKefTwZjSbS1IVFvpYtDf6YDyYE0pw6rBq2aCopm//H8m/f9FF4ujW2TP048iDt92
	bO7GOK/pJor6NGkt6ySnHrrfsJXzGL2kIsqV9ksUrnA82Xek2cFfMFvOw2IJS2PwDfRt3Ihz0VM8T
	MGfGUV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5l4i-0000000EMTg-1dEv;
	Tue, 29 Oct 2024 12:11:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kRZ-0000000EF0u-3R68
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 291D15C59A2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 11:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D414FC4CECD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 11:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730201484;
	bh=b3iDHqbap1LmKFhPTuu1Qqk4svOtioflicE0/GgpTbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FdtekhKLhC3d/47DQcpqir6P9jrHeh/KQ3dbRMElLhUWBbCPiD/wxpAj6swRfKlcv
	 l9y/mwOJ5uivr4TmsTKzbyOOz2zaC76a2fNCHcxdG0YV0vacvF4rQ4BbN80Ecf+CNc
	 cAezVQPUku0aL6ZYvrHAksowSYgq2HszMc80q/rxdUdHBA5zHC2gvQy4qc5gvApgV4
	 v05AE1JGw7pQE7KYADRciW6kB1I+IiFmKim8zeHXAUjPSkAn0QXEFHJjlZPQRMXmhq
	 gZV8fcIXD3EMTR1ulwX6Gfp2ENkLhpapFwHK+Ug9chxCxWpA5bc2kmvZAJa+sWXMXS
	 3hkh0rhoZSv3g==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-290d8d5332cso965251fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 04:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXk/yCQZ17LA0Y2wikz1DvYIYZRB+S6jZqDXSKmRx4JTwz/xMikHYdYAdLEwspLKzEyQEKqkAqzQEQ+rXKeb6U+@lists.infradead.org
X-Gm-Message-State: AOJu0YxMHqCx2o510Y/o1Fx6K8p5Sc/Qu5zbHLD+hj4UPKhJyKpciC55
	xtaQhMAR6kQSKar8iyIid3apgfYBOaBt/tRisTYEx9opBy5JMrHBZN36EHWS84i22sBn3+mF5XF
	xMrd3sJrGUr4DCYnReCyqQfAdk6Y=
X-Google-Smtp-Source: AGHT+IEkBtXhRClA2cm6t78kcyGJpyo2fCtEeh/HZcjhxwG2r5DEwf1//i8B3FFywZwUiFp2Jvl4f95iRwVJ4NKyimU=
X-Received: by 2002:a05:6870:82a5:b0:288:59d3:2a03 with SMTP id
 586e51a60fabf-29051dd1728mr9737620fac.39.1730201484141; Tue, 29 Oct 2024
 04:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-2-beata.michalska@arm.com> <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
In-Reply-To: <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 29 Oct 2024 12:31:11 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i2KUPXfeAKhkimetOMpx+5opgt26URJF8cstnZsaeZwA@mail.gmail.com>
Message-ID: <CAJZ5v0i2KUPXfeAKhkimetOMpx+5opgt26URJF8cstnZsaeZwA@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Beata Michalska <beata.michalska@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org, 
	catalin.marinas@arm.com, rafael@kernel.org, sumitg@nvidia.com, 
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com, 
	lihuisong@huawei.com, zhanjie9@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_043125_964425_3BE041CF 
X-CRM114-Status: GOOD (  30.90  )
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

On Tue, Oct 29, 2024 at 8:04=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Apologies for the delay from my side. September was mostly holidays
> for me and then I was stuck with other stuff plus email backlog and
> this series was always a painful point to return to :(
>
> On 13-09-24, 14:29, Beata Michalska wrote:
> > Currently the CPUFreq core exposes two sysfs attributes that can be use=
d
> > to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> > and scaling_cur_freq. Both provide slightly different view on the
> > subject and they do come with their own drawbacks.
> >
> > cpuinfo_cur_freq provides higher precision though at a cost of being
> > rather expensive. Moreover, the information retrieved via this attribut=
e
> > is somewhat short lived as frequency can change at any point of time
> > making it difficult to reason from.
> >
> > scaling_cur_freq, on the other hand, tends to be less accurate but then
> > the actual level of precision (and source of information) varies betwee=
n
> > architectures making it a bit ambiguous.
> >
> > The new attribute, cpuinfo_avg_freq, is intended to provide more stable=
,
> > distinct interface, exposing an average frequency of a given CPU(s), as
> > reported by the hardware, over a time frame spanning no more than a few
> > milliseconds. As it requires appropriate hardware support, this
> > interface is optional.
>
> From what I recall, the plan is to:
> - keep cpuinfo_cur_freq as it is, not expose for x86 and call ->get()
>   for ARM.

Yes.

> - introduce cpuinfo_avg_freq() and make it return frequency from hw
>   counters for both ARM and Intel and others who provide the API.

Yes.

> - update scaling_cur_freq() to only return the requested frequency or
>   error in case of X86

Yes.

Preferably, -ENOTSUPP for "setpolicy" drivers without the .get() callback.

>   and update documentation to reflect the same.
>   Right now or after some time ? How much time ?

After some time, I think at least two cycles, so people have the time
to switch over, but much more may be necessary if someone is stuck
with RHEL or similar user space.

Anyway, x86 will be the only one affected and there may be a Kconfig
option even to allow it to be changed at the kernel build time.

The documentation for cpuinfo_avg_freq() needs to be added along with it.

> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 04fc786dd2c0..3493e5a9500d 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -752,6 +752,16 @@ __weak unsigned int arch_freq_get_on_cpu(int cpu)
> >       return 0;
> >  }
> >
> > +__weak int arch_freq_avg_get_on_cpu(int cpu)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> > +static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *p=
olicy)
> > +{
> > +     return arch_freq_avg_get_on_cpu(policy->cpu) >=3D 0;
> > +}
>
> And why aren't we simply reusing arch_freq_get_on_cpu() here ?
>
> --
> viresh

