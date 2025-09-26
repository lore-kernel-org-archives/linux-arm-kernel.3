Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21645CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5FmCZ7m0CyShB1Ycdtz4U9JEqoB4MdA/m7HVOlr6mo=; b=nquxd+ocUboubo6IYaDYchR94T
	lPh6jLcp9W9HhGkClETVZ4QMADZrGDE2uFwdzizUfEcrfTxqiIQJgGimTGWVz+4vfN5AShlWUabIj
	fcrsgMqH7KBBoakMw3lnHnhNRC9rerssSA0gH0tgdprjNNkacvw0bfcrGfYnzw5B8T/u/2BF9+l41
	4PFMDdDbzOrL74doHH0uzw2gcGsZP1ppKk/R6gIXliP+6Tf5dL4im3r1dIo5sKLu4oswVCFxtRBsA
	QiyT2ZrxYcZ/Vc9OcjB/juuzrO0k//Op521R0LBTNIpq4mg9gOi/EPewiHYa8d0q+r2kbULz5tJgl
	O70haQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24tu-000000002lJ-3bhy;
	Fri, 26 Sep 2025 09:38:02 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v24ts-000000002gw-0WQa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 09:38:01 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-61bd4a3f39cso671476eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 02:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758879475; x=1759484275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5FmCZ7m0CyShB1Ycdtz4U9JEqoB4MdA/m7HVOlr6mo=;
        b=CbYmUsqiqSGNApYLv5o2xTS60ZFmGhh6UZXwXJ+whM284cEljzl/fOGzjHiv2b2MGp
         SELFoxOy0JZ++1CRv6rADjlQl4hgPlLe1sUw5LXfx5EbFHTQ+S6Q7ZUMbWlPneQLtEuq
         4jyXmllX1GkXF6DrzAiZmPz/8kpKtr9qPxpX23QUCHFCCAy5XOl5NOA87cGFfK70/v59
         rrHNvLbwiHVYFrU3CnqWCB6U0nyr5DluQ3IPL0Xv644BtZxzWkwuzuHKoff+89G4eB6d
         Un/9hNhv3qa2GapaKuUO7ReElF6ExZ9l8OuFEttfQPMbjfp1feTag0f4+ppZvbHmSXva
         Tp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879475; x=1759484275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5FmCZ7m0CyShB1Ycdtz4U9JEqoB4MdA/m7HVOlr6mo=;
        b=LFzdnL10TRiJiLP6SLDYHMPRhZAUjOB3z4vaIL7Xsz3ocwFUr3b+P5601C8TIStYnn
         iQj8fVoPVNf02nrkazr8rje/DRNswDZGg4DKPQAoqTx/i9sQFUyLR9EWeTWOixGL/WPI
         DS3eVLmkjcKJGRgd2/JyaFq8rhNcijIfgvktxmMWEDguu+hYhRN66w91SXFGIkukAkMf
         FatFQU1h8906Q7YQG/JezFSrK3o3RM/SKV6U+HHHsYiYw1SmQFrnXzFgAEfu9YSS4Ef/
         xMMq2EcUAh7JGku/b5A793VlWqfsud6EXkKuRrhRbAI19xnfyKWpOzAS0YTulB5Knzd4
         xDVg==
X-Forwarded-Encrypted: i=1; AJvYcCUBazyPSAOEcXBxUYGkI+0c/x1sSaMJfG2EN//GJFuT090NtdAEnNmPWzjUj5s2je5aTmK6arQykhVv+SEAU9oS@lists.infradead.org
X-Gm-Message-State: AOJu0YxuTFg7WlxRrM1c5Yk4Z8/3Ld9DNPCGL1euGFaVi+luaAj4OG1G
	I/PGQxkgzNpuTywIMikLbfxQVYCPn+/rX5gA2/rf+qhCd04m0E29NpIGIL227ppJ9ut5j4rIha6
	ZWjCIzgK/nwPwzQwpDQICzJjjMrBC/itnicOq/UxVUA==
X-Gm-Gg: ASbGncsnFlzdbvLCEgHO0BCPnYKIRNPIYKq5og8okTDXWLd9XO3T1iKZwk88AbjM5lF
	PTo9yN+uDL5cP+p38pAye7TEcocmJRdtcaO42Np8dyeNQ/ROA5Mjx6B4GLH3u+YchAQOqjlEhfZ
	n4VDyXNV3dYHC0ehb9hEFr47sFqkas8KlJHgHg0My78I7mQ8bb3dUDJeNfq7KCeLM5awNo22dko
	kwHzsYZtHunljYEM0f2XfqgIdNG3W1b9m44ZQ==
X-Google-Smtp-Source: AGHT+IEc3BE14yCdZtCENJr4UXyf6Y8XkhqfpWh+WHahYzWW5GLDg7SSMeNNAS+2Kw/XzX0+d+blEeRda/r+amoNwkc=
X-Received: by 2002:a05:6808:8843:10b0:43f:5218:878a with SMTP id
 5614622812f47-43f52188986mr2126658b6e.22.1758879475127; Fri, 26 Sep 2025
 02:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
In-Reply-To: <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 26 Sep 2025 17:37:44 +0800
X-Gm-Features: AS18NWBUD0z6jg0TusFj1nphukSzt5aTNsZRJ0rH-JxFSgQYIIkepAcYdgJLzRk
Message-ID: <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>
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
X-CRM114-CacheID: sfid-20250926_023800_507149_A4B10A93 
X-CRM114-Status: GOOD (  18.76  )
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

Hi Doug,

On Fri, Sep 26, 2025 at 4:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Sep 25, 2025 at 1:48=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.c=
om> wrote:
> >
> > @@ -17,6 +17,7 @@
> >  #include <linux/cpu_pm.h>
> >  #include <linux/export.h>
> >  #include <linux/kernel.h>
> > +#include <linux/nmi.h>
> >  #include <linux/perf/arm_pmu.h>
> >  #include <linux/slab.h>
> >  #include <linux/sched/clock.h>
> > @@ -696,10 +697,12 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu=
, int cpu)
> >         return per_cpu(hw_events->irq, cpu);
> >  }
> >
> > -bool arm_pmu_irq_is_nmi(void)
> > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > +bool arch_perf_nmi_is_available(void)
> >  {
> >         return has_nmi;
> >  }
> > +#endif
>
> Should the previous comment move here, AKA:
>
> /*
>  * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns =
off,

Okay, we also need to change it to =E2=80=9Cwatchdog_hardlockup_probe()=E2=
=80=9D

>  * however, the pmu interrupts will act like a normal interrupt instead o=
f
>  * NMI and the hardlockup detector would be broken.
> */
>
>
> > +static int __init init_watchdog_freq_notifier(void)
> > +{
> > +       return cpufreq_register_notifier(&watchdog_freq_notifier,
> > +                                        CPUFREQ_POLICY_NOTIFIER);
>
> I think you need to do something to prevent this from happening on any
> platforms that override hw_nmi_get_sample_period(), right? These
> cpufreq notifiers will be useless in that case...

I understand this is not a problem. watchdog_perf uses
PERF_COUNT_HW_CPU_CYCLES, which means it is inherently limited by the
CPU's main frequency. After we make such a change, a larger value may
be used as the period, so the NMI period will become longer, but this
value will not change after the system starts.

>
>
> -Doug
>

Thanks,
Yunhui

