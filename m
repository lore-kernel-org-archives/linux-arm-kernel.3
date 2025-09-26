Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345DBCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH2Sfk58/GaFMno98E5ZZZ0Jezt1oWfRMccsDmLi3+U=; b=htXLDlS+UzWD6zjaN/2g3psTi5
	BlsUF5rhvDNAv2KFJkOLmtV4L+wEJIsaR3LGBipvVAFGkzf6MKLUTctpyUcEX9hxZgQTUN8ZCVywb
	TVPtPHwdhziahrrKM1GSXn+7t2soZkk/ai4ewORkmbKp7rcCOhmI6aPahC/nldWvOLz3fOW1rlv59
	ZC490nUECsiBCoYlopfLh2jivzcfjUR5CEYxtCe2vMzZafrdBBFSNC1YPvImD+SSAZicJ587C+wRE
	Yh9lCyccxdvuZQbiZ2BM3RGAbGwrmTn89AcBOuAg4KagNx/BAoRZrBvG7Q54rxFZ3Lv2PP0I9mx5Z
	epoRdoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FVk-00000004Tgj-1IJt;
	Fri, 26 Sep 2025 20:57:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FVh-00000004TeI-2c1m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 20:57:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-77f68fae1a8so3624816b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758920264; x=1759525064; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lH2Sfk58/GaFMno98E5ZZZ0Jezt1oWfRMccsDmLi3+U=;
        b=LoBjKzxOhuR9tDnUYSCoC1iwyxVX06g+as4+KaryPxkY/Kgh//56YdP9ze5rB4/fJw
         BGMojXXqmSXtcGpBEkSgJzMxxxCpaxUSdpXUMhHOdE9lp5A5MBx1bKOy22Lr1TtY3N5S
         IVkvwnX7uLOFyOkZRGD0qdMf2j3y1TuFIbhG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920264; x=1759525064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH2Sfk58/GaFMno98E5ZZZ0Jezt1oWfRMccsDmLi3+U=;
        b=jM/CxxSrsmQYA18ykzX+RVpaQtlPYg+Ue7glY3sGTTH0QT9jXefEokdZ6MqrlSeueL
         gcb1GtaTnGFEknTUSv7SYZ3CSX/UZJE/9hhNh3oBV+cZuidSXXtD9ThXh8OzoRB6e+RI
         O0hPUnAa4xB8XewOgcMhTlJUQcZEQYb5Bd8S5bmADjPEqTqGQd0HhNKG03fy9fI4PWNG
         K+eIx6gjRurStaVKE2HX/O52ueGMNJ4yFjXH8BUjs+v93/6sraG2UXOAeW+4SbRUfnP9
         U4TwCTLiEwP5zEFXlbQPlOY+IkMwXV+vTQK4MUSAURbM5UZTa7Q9j3OH9nB6QnEFBurr
         lb0g==
X-Forwarded-Encrypted: i=1; AJvYcCXT8Kop2O9GXYLORS5wZBElMJF3uC5vN3j9ikEit1h+0LxCldeOrZgdcg3jW2mC8adPtuvyIq2m1YrSSuhT7i9n@lists.infradead.org
X-Gm-Message-State: AOJu0YwrH83kOddaDx5xnx/WwzP3nisolPfUgsIdZoK/73OebtF4LLNL
	kT841KVaLsQypp4s3yPhadIbB/jlhJKPIYmQ8s5zwcnk/J/d2fliFrNjsHEzXpg5VO/Z1UZHfoo
	zCG4=
X-Gm-Gg: ASbGncsbb2burx/LHurAEX6cEwxTO39fFEs3763AMhrQedEfZTNlL+rUTveWMarHMNP
	pMXyzgk2Aq8+6i9HQ9XfFbUntfNhPaV6P0o3b4IDWWRUaJIKRJVhzFFJVM2u69KQowy679cBNww
	aOGpk4rHqFGocFKj8CiND8CqIxI1Pqp3oZ4QMzBUAlpy+djGeREDoQr1hR2cOi0HWu+jswqcc/s
	2YjXAYAuQLJfffxsyV2txKyCgRn0P0fNt4XYSQQM4AfndCYI5bPrrqGGqhX3OgINMvrKC/MJXMA
	KUbZDFTSAyfmnmwRHGJE24w/Jv3pUKWhvZKHr5MS3Sv9jLy3aOR613c0SdB1yvb7YWRKOyhAtho
	5mAP5o+th6V0CNQxeASniNXTtGPFo+q9PZAEQhNVU+HlPS72WeuVUNW43ht3jNgaUMg==
X-Google-Smtp-Source: AGHT+IEW88SqOi6LZtTpw6qOmpTLnjM3a/2/XfBrctKiFCztXVwR+XWWLPjBwB11wSJigz1wNW0z7g==
X-Received: by 2002:a17:90b:1d8a:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-3352eef4edcmr4087090a91.33.1758920264491;
        Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be1474asm9846009a91.17.2025.09.26.13.57.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-271067d66fbso27834895ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/nubEo0jcc0ts3Ymib6eBE2Ua3x9vOgQAABs2LEb4zSvEjoMXrJklm4pTeF8sWnhGMA6iqY+tjjxTcbwcBdgt@lists.infradead.org
X-Received: by 2002:a17:902:c402:b0:25c:d4b6:f119 with SMTP id
 d9443c01a7336-27ed49df307mr105837165ad.12.1758920263386; Fri, 26 Sep 2025
 13:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
In-Reply-To: <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Sep 2025 13:57:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
X-Gm-Features: AS18NWDVMqIM3NdX-t4tF69rrS3UxfWVNc7ZvIbAVZlF3PJHNdBYWzKZ9mUJzVc
Message-ID: <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	johannes@sipsolutions.net, lihuafei1@huawei.com, mark.rutland@arm.com, 
	masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_135745_704604_C0D2AD3F 
X-CRM114-Status: GOOD (  25.34  )
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

On Fri, Sep 26, 2025 at 2:37=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Doug,
>
> On Fri, Sep 26, 2025 at 4:00=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance=
.com> wrote:
> > >
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/cpu_pm.h>
> > >  #include <linux/export.h>
> > >  #include <linux/kernel.h>
> > > +#include <linux/nmi.h>
> > >  #include <linux/perf/arm_pmu.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/sched/clock.h>
> > > @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct arm_pmu *p=
mu, int cpu)
> > >         return per_cpu(hw_events->irq, cpu);
> > >  }
> > >
> > > -bool arm_pmu_irq_is_nmi(void)
> > > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > > +bool arch_perf_nmi_is_available(void)
> > >  {
> > >         return has_nmi;
> > >  }
> > > +#endif
> >
> > Should the previous comment move here, AKA:
> >
> > /*
> >  * hardlockup_detector_perf_init() will success even if Pseudo-NMI turn=
s off,
>
> Okay, we also need to change it to =E2=80=9Cwatchdog_hardlockup_probe()=
=E2=80=9D
>
> >  * however, the pmu interrupts will act like a normal interrupt instead=
 of
> >  * NMI and the hardlockup detector would be broken.
> > */
> >
> >
> > > +static int __init init_watchdog_freq_notifier(void)
> > > +{
> > > +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> > > +                                        CPUFREQ_POLICY_NOTIFIER);
> >
> > I think you need to do something to prevent this from happening on any
> > platforms that override hw_nmi_get_sample_period(), right? These
> > cpufreq notifiers will be useless in that case...
>
> I understand this is not a problem. watchdog_perf uses
> PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited by the
> CPU's main frequency. After we make such a change, a larger value may
> be used as the period, so the NMI period will become longer, but this
> value will not change after the system starts.

I'm not sure I follow. On x86, hw_nmi_get_sample_period() is:

u64 hw_nmi_get_sample_period(int watchdog_thresh)
{
  return (u64)(cpu_khz) * 1000 * watchdog_thresh;
}

On PowerPC it's:

u64 hw_nmi_get_sample_period(int watchdog_thresh)
{
  return ppc_proc_freq * watchdog_thresh;
}

Neither of those are necessarily based on the results the cpufreq
reports. ...so therefore I don't think you should be taking the
cpufreq reported numbers and assuming they're OK on x86 and powerpc.

-Doug

