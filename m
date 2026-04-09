Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76532EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=328He/coesElBgD5e1QY9m5NS4vj8QLQC1DiWdQM608=; b=lHFTfsKKJtwqoMwPFgwQ4E/Pxc
	wN/fRUuvRZEknK2PpHk77/d/kTQIdimDTvphgQ/z5V4AU8tsNF2zbSCB4eoJv+N0gsg9Lo4d8cHk3
	J4kLdmdlkUX9AJAcmYXobUzW01Gm/lyXofMEDsRYxSw6WBzc7cmaCFnPm48QfbFdvsRdD9W9mpkkI
	umg8zkdfhPvGkmVG1kuYA0TSJy8QpackBPzyrCVSvpPq4XrVeTf5M/2kT0mc03uYXkKCPniT+E3GX
	DWvUtrxC1YwhRrhTjspgcwwel4SNoSYVwv30AdwVJC33oXgvG3o+VJLi15mu0+9YWMj5B12LSbWUj
	gcolv5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnb3-0000000AHH1-06lL;
	Thu, 09 Apr 2026 11:30:53 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnb0-0000000AHGe-2xEd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:30:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so1266652a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 04:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775734248; cv=none;
        d=google.com; s=arc-20240605;
        b=USFmw2scT0vngtLEUIJSxip+iDsf5Zw2HfvZ86jOGxRCw4P5Mtq0DFiKAwHh6Htnfd
         1hGbZuve4xVcit0eXM24FJPZa4rJdh/cqYxAj4bkpwmUSLTdxA6ygDiWsrOkVpgLoD07
         iXSg1jBvfmeEkV9dsZ9+WCwVWvhD7+WXc4vFY0E6KZrZNzNDE+hMxkDrbHR9LXrmeC57
         FOT6dP8JJ/tmetOQIs1S3rLa1drpoNf2/YAg4rc3kDfDZMytKfXPxD6urP+dq5Kn1TuS
         AAOiuMPR05GZJEUBrfZiZQRke+/3Hjx5rGs2IvvSBRz2bY+TsIHgwcvMftA0A3gQ8Q7b
         HNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=328He/coesElBgD5e1QY9m5NS4vj8QLQC1DiWdQM608=;
        fh=Oza9Oh6eiMWCcSswHeuIPJRfyMWFR95Fc2BSfnw366U=;
        b=G30OFG9QLgWxsVqSYx0si6ax/Ne3t4R/STHrvCIbDgWCKBQZL6bsR9qH1fGyyzct9I
         GWUF99SA8mBdZF++P5sbmTxluI1SL+N2taO0nf7NVHj4EgFl+nkFQMjl7xzhx7a0/vfQ
         XcLLr0gMqDlcll0OqW6miP25Wzh3KX4YvEVC5l6ui1/roRO5HgUSI5ePQWO16/t1mZMg
         aAlne+HTWCL7Aor4cKKyVUJn3rsu0T1XXXfff8kuuVVQnDXBWCpVTgIH7ulCOUlpaWt4
         XMWEHVOFxnHqUdKcPJTer5BSTYY7vkww5WpPitDt9hhOH12CIXEkG85dDbWeAZgOkqUB
         c6lA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734248; x=1776339048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=328He/coesElBgD5e1QY9m5NS4vj8QLQC1DiWdQM608=;
        b=qTMG1eHsIF5FGrfRsnUDBQjYLnKyIEamoLGnwt9SLCMj1jtetWL6lwShnS62kIX/De
         /SXreBUYuV48R6naZRCwaIq4mmBWF9iKO4YMlo2lbULOLXdn/JDWtKzsCmJwyQEUBxq+
         7OqEiusp24i9DsCMmXrUlJMoTkYft+UmHkh6b+yxrTb/TrXXPARcWW5y1t4+3brzDTHJ
         LaCXX/sVdb8Nm0N7XbCuHMHBg6fLt9U2Yyy+ZspXAfSJbBZrMo8iqLLxz5d0CI9DrjOI
         vEMw156n29f5h6M9i6roJbFEZNC7sNQ/VpbZ/gDBYkJ7jMipNaL/SlI5XKvfgRTHElMR
         ZNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734248; x=1776339048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=328He/coesElBgD5e1QY9m5NS4vj8QLQC1DiWdQM608=;
        b=ZtPBxxfh3fk/S6N61cXj7LD0O6NSMb3xtMkxo3Rgd39fV5QdFtsZFz5Rr52qUuboov
         AHLNvSpTq/YX3hrWxzuc6xVeNxVVQyUE83PRyvnZT9q7pbCKysma9qagczoo3cj/7YgR
         OFTg/9Vquj4IXSVYRO/8w+NhfRts8iw9hLdu58rFCpM3mSpvrdOjucVrdhb/C5+BS6L9
         JKcin3za94trIDB59luXC4tOklTFai8/rjoic0EAW4z3SizLNx5rf+Ba75y1OuDmZFZa
         C10YCQ5U4a46/eLT53TlzTQrSmraBG6E57D89qP7SgeaIqAkfx+kfb1Z7EdmiNHO75TM
         Ol1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiQIv/QSI5LAtxvA3o2r8G2KTSnQt1y7YMVQEcaugDQPFoOFTwy29NFDgH1v70lX8P9juRRv6/H/uZvodU70/e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw870bPEbho3FRa/0cj0RLFN1uOyGLgLDJPjlOi83w+y3AubXdq
	PvV/P3EYXOJowDuKe7ADT3ndHLYJxY+NS6hEPfRDz4raTGowmgZCJl7tJBpzffJMljM25b9RI+5
	BqHNYuYWbjw2BF9AXkg97WGUuDukMQyI=
X-Gm-Gg: AeBDieulU8AUhoFqabzx8O9xIcxmWfOH28bRwuyyDDDoCERA/KE/COS8prCVXuznve0
	xwce9F1gmuiOtCUTMhqkg4ntyQt46fcJpeuJdPaEtVFU+BfkhM3wzC8+HX4YMV7bBsZ4az+hhSc
	tzxNAaMZSWiewS29wkZNwSwjB06qLRzx0xIecSKwzMQs2LOG0nroyhdvi5ZfbfBLw30J0BfaItL
	vioz0d4HMERi6j0uSlMGdMKaFJUxX3u2cOwuFfRMAA5c53EdvcoaoUEBRXLOj5MXa/shOoUMlxv
	h/sobjAIANnVJBlbyuf99qR4KXTlB8mUZw==
X-Received: by 2002:a05:6402:35d4:b0:670:13a3:646a with SMTP id
 4fb4d7f45d1cf-67013a365f5mr1353530a12.15.1775734247839; Thu, 09 Apr 2026
 04:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260318171706.2840512-1-puranjay@kernel.org> <20260318171706.2840512-2-puranjay@kernel.org>
 <20260409112453.GR356832@e132581.arm.com>
In-Reply-To: <20260409112453.GR356832@e132581.arm.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Thu, 9 Apr 2026 12:30:35 +0100
X-Gm-Features: AQROBzACqmc9E5pVvwSPdWHo6z5Px611puIK_CexByaqynTStVAf-jkD8nOFqkU
Message-ID: <CANk7y0j972j3rk25PVprcTB4E8HOysoJOJNRV25iDK03995AOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] perf/arm_pmuv3: Fix NULL pointer dereference in armv8pmu_sched_task()
To: Leo Yan <leo.yan@arm.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, kernel-team@meta.com, 
	James Clark <James.Clark@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_043050_762839_707F6934 
X-CRM114-Status: GOOD (  24.01  )
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

On Thu, Apr 9, 2026 at 12:24=E2=80=AFPM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Puranjay,
>
> On Wed, Mar 18, 2026 at 10:16:55AM -0700, Puranjay Mohan wrote:
> > This is easily triggered with:
> >
> >   perf record -b -e cycles -a -- ls
> >
> > which crashes on the first context switch with:
> >
> >   Unable to handle kernel NULL pointer dereference at virtual address 0=
0[.]
> >   PC is at armv8pmu_sched_task+0x14/0x50
> >   LR is at perf_pmu_sched_task+0xac/0x108
> >   Call trace:
> >     armv8pmu_sched_task+0x14/0x50 (P)
> >     perf_pmu_sched_task+0xac/0x108
> >     __perf_event_task_sched_out+0x6c/0xe0
> >     prepare_task_switch+0x120/0x268
> >     __schedule+0x1e8/0x828
> >     ...
> >
> > perf_pmu_sched_task() invokes the PMU sched callback with cpc->task_epc=
,
> > which is NULL when no per-task events exist for this PMU. With CPU-wide
> > branch-stack events, armv8pmu_sched_task() is still registered and
> > dereferences pmu_ctx->pmu unconditionally, causing the crash.
>
> Would not this is a bug in perf core layer that it should properly
> pass &cpc->epc for CPU wide trace?
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 89b40e439717..a8cd0a26effa 100644
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
>
>
> I checked other archs, most of them don't use the parameter *pmu_ctx
> so the issue never hits.
>
> My understanding is that for CPU-wide (or system-wide) tracing, we still
> need to invalidate the branch record on a task switch so that a branch
> stack is recorded within the same context.

Thanks for your review, and I agree with your reasoning, I will change
the patch to use your diff.

Puranjay

