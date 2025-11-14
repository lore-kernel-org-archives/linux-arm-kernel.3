Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8FCD8CBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBM3vq37SG4A6w1IUkBk6VD1Hqp+KmIvSGnOQB9SSPA=; b=YzSY7QSC+z/+gyW9dZvCgVYTjX
	w9BEtw6bJ8vOkv2vsicUpEYC3WOV/1mFku8pKFwbyEgGpO+mfchvO4v0ii3qMItceKP4Y/8PhuNZc
	XtXOd7782d5vF5GGfgPdStrM/mzZmZuw7fW5ClEEyDaRLh9RCE0hfJbw1NhjBG/Fnz9KtcYa+2A0d
	MXzTMB789WsQRYwrz1gMJ2ucpsUS41ilSibRHPF6hj64r1ny4e4hjAHCYsWsgJMTlmy81MCzNrmCJ
	nTSvxG8905Rw7bOvEamauCaYhNLVeDvMYP2Qbqnctq+OpePQO4Td6JtOeLMg11oM3UtgH7RyI5hGX
	X2N/mIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjJA-0000000BPH7-2BsE;
	Fri, 14 Nov 2025 02:13:05 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjJ7-0000000BPFm-1iTy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 02:13:03 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4503ee5c160so693063b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 18:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763086374; x=1763691174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBM3vq37SG4A6w1IUkBk6VD1Hqp+KmIvSGnOQB9SSPA=;
        b=AxJs5IU3Ex7V7beompP1UGxRQNs1VlzlUiYP09xRs4MXUjQ21+cOKvMcBb6OaUNLNT
         fPDGK2But6AP/ZUHm7stIDguZbXmoXNGfaUnC9Ao3RwcYwf9rY7lQF3nePflYk6gEy3Y
         xd2RjJlHHP/bAZTreTc41GUimGHruCRaPBsoMHxnennj+P3t/UMQzhCNjHOOYhxE0dK3
         ZwW2GOjWfFEJnMIWCK9bN8kzhKdcxaD3iGD+iYPGV/sKhpfpEr+14BuihWxFL/YzN24z
         NKXfXZwtEXzziA9XgQRu6sq7KPd8IYy9YAOzoIOJTjEd12Qmse9Qwlk3ufHxMYYDcVDq
         XIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763086374; x=1763691174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SBM3vq37SG4A6w1IUkBk6VD1Hqp+KmIvSGnOQB9SSPA=;
        b=m711g0W3AIrRJ0QczSNY+R21svQwZHQzba2h8cA08dzlf8mi0MLg5+wOTrBMdeD3ys
         FtMqdfNYJLS14WroCpyWCXBMppd5RkJURoARRhZ0FwORgv/Gr+/3NyMgRohxUuqVp0zO
         TRil46pBS3zNVl829cUtbXHHuX2+3E/1gyC03sDmwj7dXv/sMeYuSn4r/5BrHLwbK0mL
         YLr429C6Oqm3XPngfEczqihBkgMVfdhzGE5IRN/6BzS7uysurg1InKJlKHC1m8UpEIiM
         vH11bm1VknWh0GCBs6DdJ05TOHYk6WLGhKyXn/6qrUJbLBs+TBW8LUr/eyVTk2RCs9Ep
         Wydg==
X-Forwarded-Encrypted: i=1; AJvYcCWeb1SkV332ZSH3J64VuB776KfoPxJiT/7Eh5Gy6kQXCLLIecfZQkctBoOpSwVBNyowNc9U/IM5YEVmyB8WKIWb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8A+SBp4u4o4E8svk7zvBmW8fqWoHSnC55eNwj8/WNKg5RjOJy
	/YEeR3wGGLeB7kF50gE0gRiiXCw6EU8WFWCin3ERHL5Qoyw8LzEWDv1FJtdDpVpfq4mDEQZGv4C
	AZajdPLIiDU2pU/Bx/+2O7AhI76PpNQFVaMA297RrNA==
X-Gm-Gg: ASbGncvanA9BiZRGggTcGs9qLEPuFqQauvD586k8Mq+QpY5HOr/fKEXGtgMTMDQzJrS
	DbrERmVEY1Yna9QcY+UoDii7T4lqPgX/D3T+2C2vZWXKRZWnu/zpnWeZRdduXvHLnVvZehGIV7U
	Aeh6Z0gDK557HKYFn9UFv3gPJOJs/UC8Ge2+oOZUBM/SVLglMLog0fuJB1u7IcZ7tz4iJWG2IcN
	3txC7ALR5OUvng3Cg/1w+3mku3vbGYllF9D3Ud//fdoTssgILwrlLeu0+2PK2sYTJ7amgrdT33/
	tXwgF2D4
X-Google-Smtp-Source: AGHT+IHy0n4gQ/6J6Qsut3+AMNzWOn2pYSEr7TLktEg1mu/utZ4gYoyrlrE9G2GmaDzmMmkxvEL9sFE1ukImX70O6Wg=
X-Received: by 2002:a05:6808:221f:b0:450:76f:b1a8 with SMTP id
 5614622812f47-450973ba31emr745094b6e.30.1763086373692; Thu, 13 Nov 2025
 18:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20251111073459.44030-1-cuiyunhui@bytedance.com> <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
In-Reply-To: <CAD=FV=VGvp5XsT9R9-LR-dSbGAZ5YVcm=HxBYibCcSdVnNkyPA@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 14 Nov 2025 10:12:41 +0800
X-Gm-Features: AWmQ_bkAOsbu28DhTbtm-Wf7KobQu9Ki7D8PlLDLwgn0w5kVCtpXXRPq6fTQ_oc
Message-ID: <CAEEQ3wnGUDW_dqbbhM8nLeDH0kL=s89=8x2ESYs=Nm6AMzkV4A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF
 support for RISC-V
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
X-CRM114-CacheID: sfid-20251113_181301_653352_77334A8F 
X-CRM114-Status: GOOD (  23.93  )
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

On Fri, Nov 14, 2025 at 6:51=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Nov 10, 2025 at 11:35=E2=80=AFPM Yunhui Cui <cuiyunhui@bytedance.=
com> wrote:
> >
> > After discussion [1],[2], hardlockup_perf cannot be completely replaced=
 by
> > the hardlockup_buddy approach, so this patch is still being submitted.
> >
> > v1->v2:
> > The contents of arch/arm64/watchdog_hld.c are directly consolidated int=
o
> > kernel/watchdog_perf.c.
> >
> >
> > v2->v3:
> > Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update log=
ic,
> > select it by default on arm64 and riscv, without affecting other arches
> > like x86 and PPC.
> >
> > v3->v4:
> > Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECT=
OR_PERF && CPU_FREQ"
> > in the Kconfig files for arm64 and riscv in one line, with no line brea=
ks.
> >
> > v4->v5:
> > Remove __weak from hw_nmi_get_sample_period()
> >
> > Link: https://lore.kernel.org/all/CAD=3DFV=3DUEhVCD6JehQi1wor2sSmtTLDyf=
=3D37xfo-DOTK1=3Du1xzA@mail.gmail.com/ [1]
> > Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao60=
0@gmail.com/ [2]
> >
> > Yunhui Cui (2):
> >   watchdog: move arm64 watchdog_hld into common code
> >   riscv: add HARDLOCKUP_DETECTOR_PERF support
> >
> >  arch/arm64/Kconfig               |  1 +
> >  arch/arm64/kernel/Makefile       |  1 -
> >  arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
> >  arch/riscv/Kconfig               |  3 +
> >  drivers/perf/arm_pmu.c           | 10 +++-
> >  drivers/perf/riscv_pmu_sbi.c     | 10 ++++
> >  include/linux/perf/arm_pmu.h     |  2 -
> >  kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
> >  lib/Kconfig.debug                |  8 +++
> >  9 files changed, 114 insertions(+), 98 deletions(-)
> >  delete mode 100644 arch/arm64/kernel/watchdog_hld.c
>
> Perhaps you missed that (I think) Andrew had already dropped your v4
> due to the Kernel Test Robot finding a problem. See:
>
> https://lore.kernel.org/r/202510240701.eB6r97V3-lkp@intel.com
>
> I don't think you've fixed these problems in v5, have you? I think you
> need a v6 for it? I haven't dug all the way, but I'd suspect the
> compile error is if "HARDLOCKUP_DETECTOR_PERF" is defined but not
> "CPU_FREQ". Indeed, that matches the config in the report...
>

Thanks for the reminder. I indeed missed replying to the email dated
October 26th regarding the error "ld.lld: error: undefined symbol:
hw_nmi_get_sample_period".
We can fix it directly as follows:
-       select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
&& CPU_FREQ
+       select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
Because when CPU_FREQ is not defined, there is a stub function, and
the corresponding max_cpu_freq will be set to SAFE_MAX_CPU_FREQ.

>
> -Doug

Thanks,
Yunhui

