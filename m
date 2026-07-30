Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1BFC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 19:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=; b=SbUTBcenrqWL+s+wTLLsMMSiQq
	FasjrcmMTzxt5BEj9C9Y8PEAyYYfRf3fktOP0Nafw3ocnyFYxWkptI6xWhrGq8moNVBX/70IBRyW+
	oT4FhwfexMbn9sqHPQRis+HVPEVyz0rCpHfLtCmc2Hj64ycRcQD+chRvhiHkm+i/rplDHGAJPXA+Y
	QbTv5oDPA4mW127+ROmXJE54b7jQPiHvasbxRfinqR6jx6VoEpff8VHXvym04oomf3tvV0s1ZzsZL
	SxJsE4eL/uVOM+a3GqVOksRVj3G3x/yExb0b4ZyEY5t+e1lv988reGe2soIHDn3E6hv8BfvCc+VLq
	AEmV+wsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWrs-0000000BHYh-0xFS;
	Thu, 30 Jul 2026 19:56:36 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpWrd-0000000BHWW-12Rv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 19:56:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84847482584so62878b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 12:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785441380; cv=none;
        d=google.com; s=arc-20260327;
        b=UpPAafiSsZY32alPaOHh5rB1lmEb95kuF5BymBr9hFDrmSKoyMIzyV8xNeLPtn763f
         XK/tSweg/nMnf28S8b/hK6djOUh2cE522o7ur5LZjL+OY5+4SbfdJRwKC1MRvZ3e3ayu
         KiqZOIKdfYFRiplZeny+CpLBj5SZfSm3PJpYc1jFF6FVI/kSpW5WQkecfP2BZ3R1B7nt
         k6fQTknynEohyDm+Lxn+sQuBvp+8GQfoKq6/ewhv/f4cmfx2Mlx6ibHZkNttcYV53pDu
         1FD1vhavC5QiCz5bxnBYRAJBTmhKSwN43dItKxGMQUvSePyYJUWDxww7OdYm72qfC4aF
         3Qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        fh=tFvCb3vKTrC1/jUWWnlCKuSxPu8YRbgxEVcmkwWzHPI=;
        b=K8Hr2joBRayEqQeHIE8ewZXrrMs4gOtSk87JWMNgpLEfdYkd1s+oaXSaCEiIiG4gNZ
         AGnPLkGtLDeG6Vuk5XSB+UF8q492y1q6MVLN1WD/fNGP4f/wJzgP3QCrhXtfIMtY10Aq
         VBS1/RdEzBwWItBxUKNlYJeYOezR11z3OHRd8J4tM9SvXdjbHopTT5wfthf1CTRtnRDU
         6Wrl9IWWdQR5e5/oiCvt3BKq1fhVFbux2Nh8Ghi+R9mh5R3Ct1VkhYG46XY/AWUSjrJC
         MXbdwwZgCmFqZkLNQhAXD9c0FPk1KpnqS9HdMa1Q0vX0WslDR4XYJ/qTSn3sXgCN1JvC
         rcLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785441380; x=1786046180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        b=Ai5E8msTSkutAQmhN0dRVk6RmjeE9tEKOE2u32aho+DuUITjqXDdisVJSolkJaXlTn
         2HHOBINhI+aYw174RR3HOXcmMCfjyER4oKlYFO1/25kNircwBAAu/IIaLAc4H0ZdFkKh
         Ws1NwUZZj2Vrq3M8kPA/n0fGJjVUoSKHGpqgmhbv9sNFrmPR+zWnpBhzYJG9NTEvbDlm
         KNgEQUUSwpOiev58Q4qTnIA+ziyGaduFdVd4ZLeb80PtJIyqYNDPMNhHYkD9WumcRPIH
         Kq7JuUoZb41qtwLAEz8OTpaCVu+/FtwcjAAjJ1hRbEM7ZFNJsMFO2QD8vZbJovmrc28s
         t7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785441380; x=1786046180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3+RQo/HppHWztT11zWZQCBoviyZeuu95fXLxqIvMec=;
        b=mbmdZNd//N1FDpG8krNgSqIjbNU/KixfrFIjtiQjE5evpCxY8fs/Hst1OQBz8qfD+B
         B6VtDFxxWwYrnMsiMHW8EZ0WEW0gozYAcpkKsehWO45Kya1TVIgdXlDC3KlRCdF+mJaw
         dHtLIIAmP/hg0Nfi4TbLZnhb/SRhkMAbSY6mNLcjafgqD+UyG2+Ga7euv0gLryz+WLzj
         zJyQAgRXaETilYQikfuvWOGWuGDdiD5A6Nx9cNo7PakpugzKES9jaUG+CQyHMOFk2XZl
         DfYKElq3WhayAbjmZlsix+hflJT8ZYisNgEiGcowT4no8Trqlr2/8Ov/NW6zIUiThThD
         kjYA==
X-Forwarded-Encrypted: i=1; AHgh+RrQebeB9/JrQv1AOu2Gx0kXpLGgWNI9/VQkm75MTqv+vy+gPmPoFTD2ZQvYMo2p3bijwv1ZTDpW15zUdQmkFwIB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2mk6DFnH+vNZaS1MF4+lvBSTapdeFcJZtlBjjRHy9teCz8Nfv
	tMqCWMcpojlYOthzjQlIn292XrgPunTPMvd5TGXrgMtVj+NrfFgs90mmIiM68+IfxASIhv8bupA
	GwKGOJBOY52u6u64gsij+bz2MAefXd3s=
X-Gm-Gg: AR+sD10PoaZ5XV5sLeEQmxm0FYhB3PaCUUIq1uSyicgOZDMoqOz9lky0sDgSnZE2rkU
	jGw+QSVmW2XTnXcoOSXe1+ErwJpdIlLCQ6dg2ZMnPGvC6bcHSfsqYIzZn2o1G4Bj8CYmtoX0biK
	X/caQZOoT5nqkPxpmYUYkWOrt078haxqzVCiT/+cJV7fDxjp0r+8S9FRKn75HQx8pBJcI8hV8SU
	NR3mkZ8+cKFDQGQer4TCNfu8I45rjjQ/Gzn9VqxdtQfcDeTkTf5Q4Hjfjrl3RUQ0jr7taTR7/I1
	XEmc5e/6EtBLq2JhYKCkgKi8D3vCgejZhJR6pCh/FkoV9cxwe+hPtOR/KKvungIgDhIg7Aoet58
	KhUKscpIuykvbxn40wHGx6v4wlkhRbJCm8maGGlnuEA==
X-Received: by 2002:a05:6a00:b53:b0:845:df5c:2567 with SMTP id
 d2e1a72fcca58-84eca755270mr1251616b3a.25.1785441380230; Thu, 30 Jul 2026
 12:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-2-puranjay@kernel.org>
In-Reply-To: <20260616155716.2631508-2-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 30 Jul 2026 12:56:03 -0700
X-Gm-Features: AUfX_myauPf-9BUS4q5KaEKx2Sh46ySRXTd0ms5asoEI3-_AoZYC3_ia32CZLHo
Message-ID: <CAEf4BzakTaTr16F4xRF4wti46Gfq7Csky=drai=aE_aUSOFbTQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] perf/core: Fix sched_task callbacks for CPU-wide
 branch stack events
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Stephane Eranian <eranian@google.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_125621_298342_D53901B1 
X-CRM114-Status: GOOD (  26.62  )
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

On Tue, Jun 16, 2026 at 8:57=E2=80=AFAM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> perf_pmu_sched_task() returns early when cpuctx->task_ctx is non-NULL,
> deferring to perf_ctx_sched_task_cb() in the context sched_in/out
> paths. But perf_ctx_sched_task_cb() only walks the task context's
> pmu_ctx_list -- PMUs that have only CPU-wide events are not on that
> list and their sched_task callback is silently skipped.
>
> On ARM64 with CPU-wide branch recording:
>
>   perf record -b -e cycles -a -- ls
>
> armv8pmu_sched_task() is skipped whenever the scheduled task has an
> unrelated perf event (e.g. a software event), and branch records leak
> across task boundaries.
>
> A second problem exists in __perf_pmu_sched_task(): it passes
> cpc->task_epc directly to pmu->sched_task(), but task_epc is NULL for
> PMUs with only CPU-wide events. When perf_pmu_sched_task() does reach
> the loop (because cpuctx->task_ctx is NULL), this causes a NULL
> pointer dereference:
>
>   Unable to handle kernel NULL pointer dereference at virtual address 00[=
.]
>   PC is at armv8pmu_sched_task+0x14/0x50
>   Call trace:
>     armv8pmu_sched_task+0x14/0x50 (P)
>     perf_pmu_sched_task+0xac/0x108
>     __perf_event_task_sched_out+0x6c/0xe0
>
> Fix both:
>
>  - Remove the blanket early return in perf_pmu_sched_task() when
>    cpuctx->task_ctx is set. Instead, skip individual CPCs that have a
>    task_epc (those are handled by perf_ctx_sched_task_cb()). CPCs
>    without a task_epc are CPU-only and must be handled here.
>
>  - Fall back to &cpc->epc in __perf_pmu_sched_task() when task_epc is
>    NULL, so the callback always gets a valid pmu_ctx.
>
> Fixes: bd2756811766 ("perf: Rewrite core context handling")
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  kernel/events/core.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>

This looks like perf core bug fix, Peter/Ingo, would you like to take
this directly into your tip/perf/urgent tree?


> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 6d1f8bad7e1c..6604f6e8f352 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3906,7 +3906,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_p=
mu_context *cpc,
>         perf_ctx_lock(cpuctx, cpuctx->task_ctx);
>         perf_pmu_disable(pmu);
>
> -       pmu->sched_task(cpc->task_epc, task, sched_in);
> +       pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
> +                       task, sched_in);
>
>         perf_pmu_enable(pmu);
>         perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
> @@ -3919,12 +3920,20 @@ static void perf_pmu_sched_task(struct task_struc=
t *prev,
>         struct perf_cpu_context *cpuctx =3D this_cpu_ptr(&perf_cpu_contex=
t);
>         struct perf_cpu_pmu_context *cpc;
>
> -       /* cpuctx->task_ctx will be handled in perf_event_context_sched_i=
n/out */
> -       if (prev =3D=3D next || cpuctx->task_ctx)
> +       if (prev =3D=3D next)
>                 return;
>
> -       list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry)
> +       list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_e=
ntry) {
> +               /*
> +                * PMUs with per-task events are handled by
> +                * perf_ctx_sched_task_cb() via perf_event_context_sched_=
in/out
> +                * when a task context is active.
> +                */
> +               if (cpuctx->task_ctx && cpc->task_epc)
> +                       continue;
> +
>                 __perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_=
in);
> +       }
>  }
>
>  static void perf_event_switch(struct task_struct *task,
> --
> 2.53.0-Meta
>

