Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2869FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5SqSs5AqefmAeE5V/Z3L3JqaBFSW0y3Aeu4U20RpPQ=; b=NdLXGXEuavsq7JLl2vhWZExAZM
	DU046IyaC2lRBHmTD7MR0Zw5GOITfnTdYUoAb1MHuInN0QqxXalf0mjvVCphuC7dUNG1kpwJcy++L
	H6id60bNDI5VbzknD9gDcr+rVa9av/qjefWw/EDFpW9NrI7ri5e5IwbOr5IX8ELKzR6g7H9l3vg27
	YuutoxHiURHYCEBlIz2gfgHPOwRmcN2wXI0JImq0gUmAR15Xa8zDP3TBl2BhXfkPoneQbq1ODFc4N
	qEXHvJwDDwH4xg4pa2c/C3eUJgh+86Qt4QggMDxh0YIwTZjKEUQm3L3wdunBEPaqZt8kqUWcQaOKp
	xIoDcp5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMH3-00000008JzA-1BIH;
	Fri, 07 Aug 2026 15:14:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMH0-00000008Jyc-16XZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:14:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso416105566b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786115652; cv=none;
        d=google.com; s=arc-20260327;
        b=KIgp7R4dYYUdbEJViwf9O+jucIlp+wmjRQt8oU1eVxPAUr2DfuXibhKgrNe41EDEUa
         kpymi+p6CovyUz3kB0BJmejcVxFnzdBxsvG04gEeLjthKKWfxbkLUAm8kA2yRIOE5T7J
         EpUEbMurvKo6VuiVRU5epDBU3i0E7igN+vJahvb1PlhHHk5EsZXaj53qfhD0AYvquiVk
         Tv99+51gUj3+Q6ngnaubk3jscGDHmsdeYoec1h1jmvRVlBuS6HLjStr0tGHTX4pgkTgZ
         VP48+/fwpMQvtgNp730NDob9sM22ze0U46I7HcAXU+sktmZ4GQCNoc0xM3O/4cosLsDR
         TKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R5SqSs5AqefmAeE5V/Z3L3JqaBFSW0y3Aeu4U20RpPQ=;
        fh=cNU+JGhJCvuFNbLgwZyJnTPWK8RvpbPWnxlTROyNWng=;
        b=noQHSkcf4VF+fZWXDGorBakzDXW/RdfvNFR3wdq7uJ0tiud5vh2XkIEbrkJEf1i2Lx
         POrpKI8Kbz0Zou9hc3V+LrqNjcyVg+u0WgJrMwWssOgTdRwLiNXNkBjmI74U308IQw6P
         OW6Z2RLzMw1evIMbCigyYIuCZbqdcLfQkmZZXUoCqL7dvDrNTuwdFvz2BLp7LtYKnerh
         dXKTC+SWujkncsufsfs4zrkc4cTg3Qp5RUF7lCpuuXAcr2+kjkaTBQGQjrP7zU6DZifq
         Yh1rxEblzZ5LI6J6ggpDD2hTBhEkvEcK6jTz8Wd9LybD+dUKJ/duRLlpUaurR2PrcHU2
         ehXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786115652; x=1786720452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R5SqSs5AqefmAeE5V/Z3L3JqaBFSW0y3Aeu4U20RpPQ=;
        b=nllBATYfe6g4qhSFKBOlk/WuHJAf9KaQLRVIH9TGNT5Xy53/MsVwc4xCbN1KSOiDii
         vzn/tm79TW+tAsmV8AQHdBlnBXRfatmItiRCxt7LjnxaDT0o+hv41utRWLBVRoE8+jnb
         1WW9Vi2iNsKW2W0YN3zh0urhNt281nzpX0FIa7Fg11GHzzfmVR698ZwS/GmYL596Kvt+
         9z+aRgGIqXjF2Ricfor/7X8+Gvqm5ftYDdYY+BsgoAO3t/QMn5S1ABRmJeZpp0ZbhCPf
         pj5ZPyetk3Gj/k05F1h/hEsHT7ciAhFvx34OotbWwtrJLXX+cSP3Sj+U4W0WM0uSvw2G
         1WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786115652; x=1786720452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5SqSs5AqefmAeE5V/Z3L3JqaBFSW0y3Aeu4U20RpPQ=;
        b=e0i9wgIJJKyXP8pyehmZUoapg2KhOuMIPc5hLhWyY02e55e7e6g5a6OWiyiR+83TVk
         p+gsPCdF6fbjJkbQvkC2q07hCXvNRYwIElY8TpUjEgqm4TlUWvWfc5zlDsKj5wkS6tOP
         mPZBk5fxTKsJnJQe8CNoHAqeNsEsuP7m1tSnl8Ewxz82dDzC4qEeR6tcHKruYO+5xlVC
         mMGGL0yLY31tDa3dL1ZPa6DB2b9I3bxTBi9TtgpXdToe+Slu3QnRnuu9YtKhKBTqgOnv
         duZp4T5ToNj5ivdTPu96Z5wFyNm2I+4O2Li+p4tVse2e/f+menNzJK527hzhGx00xN9u
         ZQfA==
X-Forwarded-Encrypted: i=1; AHgh+RpVoI0ryOa55V2iaTXpBXkkJ4CIcMT8XR5W9jXohPJIrLLEGzP2xBFNmIW/h1RCjiGXdpyUEiPocw4rarTbHQEB@lists.infradead.org
X-Gm-Message-State: AOJu0YzbJvyXfzWNz9QD2u4M5kkhfviJW7dN948d+rnckD0x6S1fvmAb
	v5WbMRguFtDPDs+ckrwFrbB4kIjG3GyUDcnqPZnXmeo6/m6jMkf1jtHhi7X86NqRj7I6gIQRpaw
	xHl1lqxN5W8BjKWJ9lNNjJHCtn6By8FoxEHYpkfrs42x7
X-Gm-Gg: AR+sD11NdABBloaZG2eZQCAwXuTlesoxibXJrjYhP/BkOg40g30mHrpUu3dg8sVG9A5
	jhACW03po9POMpcq0s/8jjtU4v2Ic6iDB16bp92MygAPXpQYuGGosdYLwnhv9sUYT8kE3bIae0W
	8qrIP4HtK/nQDBjrkywVyAWlSfNBvK34PQtN31asZyi9WjKonxWLYEKieYoj0dIxtvLo4eMyzzE
	UDtee7QQpr95NAOOPwRRxCWB5h0MtYqKmMKGOBfXrDimMHA3egpbl2Y7dmJRWB6d4kFnFv+oRjp
	M5w2ECNK8yeAbCldFlzzrnAtIBPamM+BVL82dab0emdmEOlIQg30Mjkmmi1g
X-Received: by 2002:a17:907:9286:b0:c1c:6f0d:5b22 with SMTP id
 a640c23a62f3a-c2039c873a2mr1180266066b.11.1786115652150; Fri, 07 Aug 2026
 08:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260806135224.3267890-1-puranjay@kernel.org> <20260806135224.3267890-3-puranjay@kernel.org>
 <20260807100828.GT776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260807100828.GT776954@noisy.programming.kicks-ass.net>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 7 Aug 2026 16:13:57 +0100
X-Gm-Features: AUfX_mxuITlV6KDGW3daEqhmTeXX9cWKEHeC3fVDfiCi88EOTq-NgZeWz2tSt1E
Message-ID: <CANk7y0gKtCV8ja3MNgqikxEMB4q494s62bCsB5S3xdu8Y4XyCg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] perf/core: Run sched_task() for PMUs with only
 CPU-wide events
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Usama Arif <usama.arif@linux.dev>, 
	Will Deacon <will@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_081414_369489_D35ACD38 
X-CRM114-Status: GOOD (  36.65  )
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

On Fri, Aug 7, 2026 at 11:08=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 06, 2026 at 06:52:22AM -0700, Puranjay Mohan wrote:
> > perf_pmu_sched_task() returns early when cpuctx->task_ctx is set and
> > leaves the work to perf_ctx_sched_task_cb(). That one only walks
> > ctx->pmu_ctx_list, so a PMU whose events are all CPU-wide is never
> > visited and its sched_task() callback does not run. With
> >
> >   perf record -b -e cycles -a -- ls
> >
> > armv8pmu_sched_task() is skipped on every switch to a task that has a
> > perf event of its own, and BRBE records leak across the task boundary.
> > intel_pmu_lbr_add() calls perf_sched_cb_inc() unconditionally as well,
> > so LBR records leak the same way on x86.
> >
> > Drop the early return and instead skip the individual CPCs that
> > perf_ctx_sched_task_cb() already handles.
> >
> > That requires the two to agree on which CPC belongs to which path, and
> > they do not. perf_ctx_sched_task_cb() gates on cpc->sched_cb_usage,
> > which perf_sched_cb_inc() sets per CPU for every branch stack user,
> > while the new gate uses cpc->task_epc, which __link_epc() sets only on
> > the CPU the task context is scheduled in on. A task with an event for
> > that PMU pinned to another CPU has an epc on ctx->pmu_ctx_list while
> > cpc->task_epc is NULL, so both paths would run and sched_task() would b=
e
> > called twice per context switch. On x86 the second
> > __intel_pmu_lbr_restore() finds lbr_stack_state =3D=3D LBR_NONE and cal=
ls
> > intel_pmu_lbr_reset(), throwing away the callstack the first one
> > restored. So gate perf_ctx_sched_task_cb() on cpc->task_epc too.
> >
> > For the CPCs that perf_pmu_sched_task() now handles, the callback no
> > longer runs inside the perf_ctx_disable() and perf_ctx_enable() pair in
> > perf_event_context_sched_in(). __perf_pmu_sched_task() disables the PMU
> > around the call itself, so the callback still runs with it disabled.
> >
> > Fixes: bd2756811766 ("perf: Rewrite core context handling")
> > Cc: stable@vger.kernel.org
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  kernel/events/core.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 9815894b67e77..675dd05935f35 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -3757,6 +3757,9 @@ static void perf_ctx_sched_task_cb(struct perf_ev=
ent_context *ctx,
> >       list_for_each_entry(pmu_ctx, &ctx->pmu_ctx_list, pmu_ctx_entry) {
> >               cpc =3D this_cpc(pmu_ctx->pmu);
> >
> > +             if (cpc->task_epc !=3D pmu_ctx)
> > +                     continue;
>
> Why isn't this the inverse condition of the below? That is, we should
> call either this or the other, right?

It should be. There's only one epc per PMU on ctx->pmu_ctx_list, so
!=3D pmu_ctx here is really just "task_epc isn't set", and once the extra
term below goes the two are inverses.

>
> > +
> >               if (cpc->sched_cb_usage && pmu_ctx->pmu->sched_task)
> >                       pmu_ctx->pmu->sched_task(pmu_ctx, task, sched_in)=
;
> >       }
> > @@ -3921,12 +3924,15 @@ static void perf_pmu_sched_task(struct task_str=
uct *prev,
> >       struct perf_cpu_context *cpuctx =3D this_cpu_ptr(&perf_cpu_contex=
t);
> >       struct perf_cpu_pmu_context *cpc;
> >
> > -     /* cpuctx->task_ctx will be handled in perf_event_context_sched_i=
n/out */
> > -     if (prev =3D=3D next || cpuctx->task_ctx)
> > +     if (prev =3D=3D next)
> >               return;
> >
> > -     list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry)
> > +     list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry) {
> > +             if (cpuctx->task_ctx && cpc->task_epc)
>
> I'm not sure I see the need for the first part of that clause; why
> isn't: 'cpuc->task_epc' sufficient?

It is, task_epc can't be set without task_ctx. ctx_sched_in() sets
task_ctx first, ctx_sched_out() clears both, and the window in between
is under ctx->lock with IRQs off so the scheduler never lands in it.
That includes ctx_resched() scheduling out a single pmu, which leaves it
open the longest.

Will fix both in v7.

Thanks,
Puranjay

