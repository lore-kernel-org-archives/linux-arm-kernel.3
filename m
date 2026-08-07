Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B13C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzS5XFrgTuiPjNnu38gbVxPmnnD5h/HbpvqKJVfoMMI=; b=j8wh18tTQ2uE6gZ6gYubGMyb6a
	/frAGP2lmKgaWTtkY8EhQHAcAQ+zZ/J1XqWEQAfla221uOC20+Mzdf/XEFOlmt8QwCqyopsvs6cJm
	kZkK9A5D7KbrQQKdaRRwJofHHBGGTf0KO6khISRVBfd+uFXMnB+ptaNrBWotJZmsLzm9kfbvg9aVH
	iJt5fFJTkeg/YV6XkuMZ4JG+4TTsNgmkOGYkOfyqFaFiGvp/fAT724ulKj+32rAEajlhyfCC/KxWl
	CEbB1+sM45ytdYOKKgjhgBufS9/KyByzlSoE0xPBWCmvpYpuL5+FS7sj65LUsGPBfLP+Uq5/Zdvh4
	JPdn/Mxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLMK-00000008Eu8-394Q;
	Fri, 07 Aug 2026 14:15:40 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLMH-00000008EtV-0wx3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 14:15:39 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c15c42a45adso313093366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 07:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786112135; cv=none;
        d=google.com; s=arc-20260327;
        b=cN0Z4LMdOsGWubB5w1LeOJ6tcL4hi7MVL5XF4aTZ0abSwtb7PtOzek6hqQnOowQMHS
         KVSYXQ0ktxb6cWD8QbU66Q5MVIvQlysR5JJTMZdZn0b341e/wVPxydnZjqrnWib/wSaS
         jp7JRLVm2N1zdh03DY79pWQ+ymPvYu8132qmxH7TvZZ967CT8s+jpJ9+qwb+E5EqZg5e
         oud7/d8B5uEl6VZAtU0nnOpaCcJHHzEo+S77mHOVN2zTTx4lhACFde8WJM/xzcB7+FOM
         nnsktHPnN1uBxysxrFZsp96OoQjL6NBW3O8fD2zE+7zGrflM7m4t2gNjudpHWFzZ2nuC
         cGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MzS5XFrgTuiPjNnu38gbVxPmnnD5h/HbpvqKJVfoMMI=;
        fh=EL2IowZd4j2GFlQ2sDImReTPShfooFW6CxBjmAXwk4Q=;
        b=NRt+tbuP+6UmhyvS3WgVIQISx2zzQE7tj/c2NmXBmgkJY7280yH0G6ih1KW95tPVvw
         JiM9z7nc+p1i8Ywsez7JA1chGGtpI/+h+0pqS6wGESAcJqyHIPEBjBMXUR7b+emwMyvj
         PZ5M7dtj5V7dzqVRUoP/T05lxg8z4S4GcXmeZpPIGqjdUyW9NpT/19MYKQa+sxC70zEM
         B5dJl7INN1nmFwiSy/9E9T1cuhPNpvWgf0NI5zEg1/B49aeWcqtZCy9H6O/E4Hy2I5HJ
         x/qV40bvLNTYAHPOuF4NO4Wc9+OqITbTd34gdYQ0KSfRv0fU4Zs1sBj/nqR8kOk3ZPhz
         0sOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112135; x=1786716935; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzS5XFrgTuiPjNnu38gbVxPmnnD5h/HbpvqKJVfoMMI=;
        b=R+uUYavb41Z+w3zpU9mxvr+rlu494vQsedlIkyrea0njIPr6/jVFjKFRI1OnMgFu2g
         gzmKUsUhA2p62utqDXBUZ5XfmmqVfTMQFc3bv+8NSi7WALzNa+rLVmMrtv3yZmQEFpsQ
         6+fpiOA2brdJqAjrjMzjHViFVpeVvBBx7wkBhpAAPDTjZmicty2jovTfP0HGqP6KiIo7
         Niglhr170a0uPPpqnRNaINS3+PMvc85X+AlfloLHcbDAvvOZrcMKTua3IEYyY0uhtrmo
         vifPbWe5+3uh8XNTApf0eFjb+YiWUpM8nRCxkOjon4HaCCqM9kiOPDeQGbsd6c9mvEZD
         YqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112135; x=1786716935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzS5XFrgTuiPjNnu38gbVxPmnnD5h/HbpvqKJVfoMMI=;
        b=ghiX5hEO6xLiYkCAt86wRP6IqHhc5Zx2QsK6dx114j8FZqOS/P3nKLI4KkBULxi7Sg
         TpUBfa7JQATNN1GmoSgBRqRCaewFdXmWbRXIF068aWYYjmlHELw2V1n9kEL/7dqyhGdL
         mxEgaEMW57Ay2XtlK+qLDHVlau9ZMXb87cIM4+saYoO/JI2Oz+Xw1VwS1Cde5EaN8scH
         OUjPDZZwBXTaMNwfaErhW7WfbR8CjZ8HJbi8NGx9MZjHdrmjDlwEWmq3d3n3EThnVi1f
         U9z4OxwkvdrmUsG6gMSlfDrMTLJYZEbWntZ9u4h9JsV+g8/lZzoyY9Ia7wzo6DwsNzA5
         ckWQ==
X-Forwarded-Encrypted: i=1; AHgh+RovgLvnxknDwdim1QFl+QmveiyTPQNaZdO1diGZ/JjGxVS1EWIvR+njMvSNDxPmoR2J69M4lfhnDOIbk2bIZLa4@lists.infradead.org
X-Gm-Message-State: AOJu0YynQZzK+spzjOyJaXCx3oW+vbTHEwtvKu1rnziln1Dh4Z0zwrSP
	wmDBYRHkMOr7zNym36S3jWbBdvB30RtV3f2x5TjwJnHpxvjqKTzNJTaXjCFKNux316sILRaXvpL
	8NmgxnvLbCoexkGhDTnCFhq7surHdsFs=
X-Gm-Gg: AR+sD11W9hE5r5LBwjLROu94g7/UPiMacqSJnxa/4aJr5V+qiy4vcIk0LnIycqjJCem
	GHLPAqVjC0LUcL+XzDHugHUdOcLZ7ik40WrL1Qfe2xKq9OFmv1WAS570PidVUh9K1nTCS8qcICl
	K4e50W/V5C+dGcB4riUpltUaRRJXazI2sexXPdvzu7HOQ4fetc8VaKwD6r8slCZmvcUlQ0pFS81
	HKtUxOpE479++iX3eX7qwuWxKcf8ItSzOJJA5yF4TTgmK7PMgW2snohoEEhJkA/2nZfAD3m05dS
	xnMbtqSR9Nwm0Br6aoExeLkgeopUcwELt3LzkRA6mkXTJx4V/vr/m/NMZH6J
X-Received: by 2002:a17:907:a606:b0:c1f:df40:1d83 with SMTP id
 a640c23a62f3a-c2057e093demr807232966b.5.1786112134646; Fri, 07 Aug 2026
 07:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260806135224.3267890-1-puranjay@kernel.org> <20260806135224.3267890-2-puranjay@kernel.org>
 <20260807093951.GS776954@noisy.programming.kicks-ass.net>
In-Reply-To: <20260807093951.GS776954@noisy.programming.kicks-ass.net>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 7 Aug 2026 15:15:21 +0100
X-Gm-Features: AUfX_mwZEiydqK_HU1_ia3MF27eq51puWHtYC7ZlluNhh2_0hfgI6nV6cPYk91Q
Message-ID: <CANk7y0hq3w+bRNmuT1PWvhZb=ob=6Y5keN7-25vRSbx5nxakNA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
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
X-CRM114-CacheID: sfid-20260807_071537_290370_DC788D60 
X-CRM114-Status: GOOD (  24.85  )
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

On Fri, Aug 7, 2026 at 10:40=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 06, 2026 at 06:52:21AM -0700, Puranjay Mohan wrote:
> > perf_pmu_sched_task() returns early when cpuctx->task_ctx is set, and
> > cpc->task_epc is only non-NULL while a task context is scheduled in on
> > this CPU. __perf_pmu_sched_task() therefore always passes NULL:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
0
> >   pc : armv8pmu_sched_task+0x14/0x50
> >   Call trace:
> >    armv8pmu_sched_task+0x14/0x50 (P)
> >    perf_pmu_sched_task+0xac/0x108
> >    __perf_event_task_sched_out+0x6c/0xe0
> >
> > Pass &cpc->epc instead. __perf_init_event_pmu_context() sets its ->pmu
> > when the PMU is registered; ->ctx stays NULL until a CPU-wide event
> > attaches. That is enough here because armv8pmu_sched_task() is the only
> > in-tree implementation that dereferences the argument at all, and it
> > only reads ->pmu. The oops therefore needs BRBE, which arrived in v6.17=
.
> >
> > Fixes: bd2756811766 ("perf: Rewrite core context handling")
> > Cc: stable@vger.kernel.org
> > Acked-by: Usama Arif <usama.arif@linux.dev>
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  kernel/events/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index b282de3e7d7ca..9815894b67e77 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -3907,7 +3907,8 @@ static void __perf_pmu_sched_task(struct perf_cpu=
_pmu_context *cpc,
> >       perf_ctx_lock(cpuctx, cpuctx->task_ctx);
> >       perf_pmu_disable(pmu);
> >
> > -     pmu->sched_task(cpc->task_epc, task, sched_in);
> > +     pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
> > +                     task, sched_in);
>
> This can be written like: cpc->task_epc ?: &cpc->epc.
>
> However, if cpc-task_epc is always NULL, then this all seems like an
> overly complicated way of writing: &cpc->epc. What gives?

Nothing, you're right, it should just be &cpc->epc.

I wrote the ternary expecting patch 2 to make cpc->task_epc reachable
here, but it does not.

Will fix it in v7.

Thanks,
Puranjay

