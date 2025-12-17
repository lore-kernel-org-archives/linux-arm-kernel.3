Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44180D6406C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 03:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/2RYz5g89Oo7ClB5gtL8Za3r2Xr3F25uufbNGZ7CVQ=; b=v8aLBKOGdvgLTfCi84NQuYItws
	NrclC/dEyGbAJRiqgp0qhN3u2xPDs8zSik4N0VD06EDj2tActR04OmpGHstGX+EzrGETaJfsit+US
	j1Zcx31uPdRXL1HUXBMb92QIE2pRiOa8qHPBSGZY1s7hVk6fg9cfoETizD8ruVWbEUYAi+me2bJiA
	c5VRKyo862ICvPr2FWweMChu8L9QKluxZFyaYDf7SLJ8gFOW2a8nLpSoD6N8qsD6n+Df2VTeeBkJG
	6fA/eVKDuXHH/RF+LgWwDAZBUa+2njvaOoE+Kq3xFONpP+OFVakh5B/2Ac2GceqWmumJWcZEDw+py
	X3/5X9dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhlr-000000065Yq-40g3;
	Wed, 17 Dec 2025 03:00:11 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhlp-000000065Y6-1Xrz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 03:00:10 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7c6ce4f65f7so4570675a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 19:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765940408; x=1766545208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/2RYz5g89Oo7ClB5gtL8Za3r2Xr3F25uufbNGZ7CVQ=;
        b=Q9X7s8gWRMlImBaBiipykwN0HEWiQ67pDbWRHZqqso4nlZHUJ99C5OMxnjmo6d7Nqr
         6diINqtAsMyWVEYr2eYbevwC+bMBJIuMfVftxDuQAv8qsEt0M3w7klAneTyXC6wiAw4C
         L8Jv9OKfUvo7RCQ/94FnAKc5xUlxHgKYR3gh7kElMQmPkl5q6z6i3yMlDcp8ywYXnWC2
         ldv3+zcH0F1gXzbbDTHlprd67asQhuvfIdRlAtjjC4lbIvckTUXVOCZO56qTRKKCto80
         8ft4mEV4NAU9Bw4huAxnUaRaqZrHa/AbZIAg469IF7dCXkeD9bGhC3JR9AaDnaZMRWPN
         92+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765940408; x=1766545208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/2RYz5g89Oo7ClB5gtL8Za3r2Xr3F25uufbNGZ7CVQ=;
        b=jFyPMpSP0XyB3PSIbIfnYhGGHOGYM+VRtNQQUbbZsv06D95RKKyMyiiyVX618OF1qj
         c3wh0UN36Qs6WRUa9cLN/uLHT0FkE94ljsb/IrPZZNQCBUAhK/LIOf4Eop8Hs8+AinUV
         DJpOW8aWTAjTKK4StjgSEWWgOHxAR9e4Fa6Q+X//wFXzZ0qVePf85Sp51JZSMIgErhAn
         Xn3ELj9c1aR95q3t4W346T/26UAKcqnCXZUONebxJBBmJzbmYg2eFawtGUn0UCvAGYJ8
         /eKMFUCsZTcWBTXq1jCIZHUdfZOtWPfmMLaZ4pDLVYExHT49L5z8A87zfSycQZ7j1lWb
         vD9w==
X-Forwarded-Encrypted: i=1; AJvYcCUXYwD9GEBeGW1GK+c215D3hHYq0iLBuK+BsiOJfudWm7I4XD4XeQEHIjCX6C5HtfAbknA2Z8qBJ+y8z8rdS+G3@lists.infradead.org
X-Gm-Message-State: AOJu0YwBM8saTth7IhM8Qdv3+z2iCqSSIuBHN1UjZaWDP0o6sLa5gWo1
	aYi7ie7JFeDS9wpXW13MKGIT2cmXo4estVWXKuGV3wdrj5+n/36N82ACQxaZla3EiuvsEagY4zy
	ZyV33ZRNv7aZLWXV6U8h21BddOiTMBtQm9WD0jqmh/g==
X-Gm-Gg: AY/fxX7Z+aZSB0owo5FqnB/Iq+R6CamlHyavuXcofchic6r0Ov26PEJzG7T7Aph0l/F
	spHW+b1vOhIs8OUU97kr56VIFfbu5cggfhdPF7Xu6v4bf6iui3bjJtkpJn/TPptA9QNZ6oCI43h
	EJ7tyNPfqpyfSJ+yyeFMNNYuXDVMxs9tWntbqPK6qWMgaUWL7/ZBuiPka2q4FBFJWo39ClF6UFQ
	TGnTcu8vy7ReyzaYNfhcWKM9Y+kWR4LsU64o7NOekjkA+g08fdFhAc0sy4hUYO4gQzyjY8GA6hs
	cw==
X-Google-Smtp-Source: AGHT+IGOsDttJF6uFgQs8b9z12RN3EHncAP/ev9NC4wtQBWY1BR7zun1IGjSOjiTZhdxNQQtrm1spYA/0On3N4VLzFM=
X-Received: by 2002:a05:6808:a5d7:20b0:455:d5d1:8abe with SMTP id
 5614622812f47-455d5d1a911mr2707386b6e.34.1765940408215; Tue, 16 Dec 2025
 19:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
 <20251114033243.76509-3-cuiyunhui@bytedance.com> <96fd2a69-baf4-4109-8341-0d4bb6c60393@picoheart.com>
In-Reply-To: <96fd2a69-baf4-4109-8341-0d4bb6c60393@picoheart.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 17 Dec 2025 10:59:57 +0800
X-Gm-Features: AQt7F2oBwdHtfuscheWe6RG8WNJwqi88AjsGeaDU19qa6XfrY_huTLBuOPV3-Pk
Message-ID: <CAEEQ3wkq5P=WE_XsPDFOK5ESZDP6igQ9dAcN7Bd6-LkEv7N17g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, geshijian@picoheart.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_190009_416974_1A6AC2A4 
X-CRM114-Status: GOOD (  22.50  )
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

Hi Yicong,

On Fri, Dec 5, 2025 at 2:12=E2=80=AFPM Yicong Yang <yang.yicong@picoheart.c=
om> wrote:
>
> Hi Yunhui,
>
> this has conflicts on the mainline master. looks like you have a dependen=
cy
> on the SSE PMU support patchset [1], need to mention it for the maintaine=
r
> to apply.
>
> [1] https://lore.kernel.org/linux-riscv/20250908181717.1997461-5-cleger@r=
ivosinc.com/
>
> one comment below.
>
> On 2025/11/14 11:32, Yunhui Cui wrote:
> > Enable the HARDLOCKUP_DETECTOR_PERF function based on RISC-V SSE.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Acked-by: Paul Walmsley <pjw@kernel.org>
> > ---
> >  arch/riscv/Kconfig           |  3 +++
> >  drivers/perf/riscv_pmu_sbi.c | 10 ++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index fadec20b87a8e..46ccd33732fa8 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -186,6 +186,9 @@ config RISCV
> >       select HAVE_PAGE_SIZE_4KB
> >       select HAVE_PCI
> >       select HAVE_PERF_EVENTS
> > +     select HAVE_PERF_EVENTS_NMI if RISCV_PMU_SBI_SSE
> > +     select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_=
EVENTS_NMI
> > +     select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF
> >       select HAVE_PERF_REGS
> >       select HAVE_PERF_USER_STACK_DUMP
> >       select HAVE_POSIX_CPU_TIMERS_TASK_WORK
> > diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.=
c
> > index c852f64a50221..0c7c5924687c9 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/sched/clock.h>
> >  #include <linux/soc/andes/irq.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/nmi.h>
> >
> >  #include <asm/errata_list.h>
> >  #include <asm/sbi.h>
> > @@ -1192,6 +1193,13 @@ static int pmu_sbi_setup_sse(struct riscv_pmu *p=
mu)
> >  }
> >  #endif
> >
> > +#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
> > +bool arch_perf_nmi_is_available(void)
> > +{
> > +     return IS_ENABLED(CONFIG_RISCV_PMU_SBI_SSE);
>
> this looks incorrect per implementation in [1]. we'll fallback to the nor=
mal
> interrupt if failed to register the SSE event, in which case NMI is not
> available for the PMU. Check the kconfig is not sufficient.
>
> you can check pmu->sse_evt instead for the NMI support here, or cached th=
e
> NMI status somewhere like how arm_pmu does.
>
> Thanks.
>

Well, based on CONFIG_RISCV_PMU_SBI_SSE, further check registration success=
.

> > +}
> > +#endif
> > +
> >  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *n=
ode)
> >  {
> >       struct riscv_pmu *pmu =3D hlist_entry_safe(node, struct riscv_pmu=
, node);
> > @@ -1618,6 +1626,8 @@ static int __init pmu_sbi_devinit(void)
> >       /* Notify legacy implementation that SBI pmu is available*/
> >       riscv_pmu_legacy_skip_init();
> >
> > +     lockup_detector_retry_init();
> > +
> >       return ret;
> >  }
> >  device_initcall(pmu_sbi_devinit)

Thanks,
Yunhui

