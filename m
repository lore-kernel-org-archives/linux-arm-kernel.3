Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6ABC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=; b=MZj+cwrG1sDY1BvjmOXmDlKeZw
	DnypNrR/biaObX52uUAfuCzXrh94k2E5O2sy5gilDsa2D9Zmxg3gUBA29l92x1IrSQCMWIIqZgbUL
	HC2ZpxLeXZrqdoUAM6Otm74bqlrUC8KOiGr4ZlNgOxPBtOuDV3IevvWUnUHUAk3zAcc3U1P0pwsM6
	mSb9o6tcYgODhiVnYBGKw/GbpGvFVjmLMELbrVXs6vUEtpGfyF8KT8pfRgAIKnrOXIedb2NO2r6Xk
	/ySHKE7tlMU8urs6q7H4SSbjtpZV51QOZque9h2dGgC6bpumuHsU9va+SAJ0xzWIJF4pMrKwEREJ9
	MBs5+kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Br-00000006Xqw-0grH;
	Tue, 22 Sep 2026 20:34:11 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Bo-00000006XpU-2fmW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:34:09 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c3304784so237945a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109247; cv=none;
        d=google.com; s=arc-20260327;
        b=kVcFKm31YRx7zFVndJidnaYZ+ZEXfIZ6lbNNiWs/CvX8zDU56adsQZ7JCzqMzEQn9T
         ewHbqP/NKyT2IPYfKiI6LRqMFeOJobOCItjjuSPCxTPUqW5i401zRfZNXAuzngzcCQ1Q
         zeug2JpInc4+8TWJNUUb1Hz5SHNvyUvfW/ZBlOlZXLJ54ryBkkE01+AlWsDaGNucXUS8
         L2vEPrmfh4ZkEatdOp57FiQxbd8K6XL4AgcHKK0cCf1MOAKu0B6ORzfIo7Ing2uVCdwt
         2m+whnizjFQ7dKO2H5+CpBQR3s2qNnHSwAlgKips2eWQHFeqxqfHKuRI3QnRVXKSEAhR
         2c8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        fh=898cGwmNutEc1i1BGMM92LbkL7+9L83ARStAyh3jZtM=;
        b=fd1Nkn8J8qrnvQIh9SIvzFdNNuqKK3sReRYFTga8d+kVqsOm6G4ILGhc2vd1ttXkHF
         KkARqqY6Mj4bJ6+mOFZ5WIG//5xfUO7SLPlYt0YBmdK8IFmr5kgbWooZc0wVixd4Sr/P
         0KS2gBSvjbC2MJ/6D5fZKEFunvgW7ZLBnz5pddZnqcMjHqypTSkuC7PzX9B8CZs3hGkv
         Pq7cMY/QLxqNhHXKb2rFoWUrDLJDMys+rqrrMqsPqmsifiKpRs20VZ3KtuXLtzZKOOSg
         SA18XNwLi9NLVHSqQJ98RChGtJrkvCrqOWU7ud80w0/YE8b/DVhJwxz6dGc9IAeK76l5
         VCCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109247; x=1790714047; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        b=FpuogIxpSULpHJkumxAtYJb12lq/WJ6jBEFUa7HYi1KrccJ07v1yolHAs8J75yYiXv
         2RWoOK+7s+dzitDX6AGUFa0k8OlJcoSlnghqbM7ebfUXzY5HQq1jm1mnRhfidhp2KhQV
         WLxVHiCx6SqjCs3zWu5wRAVl3R0aDavP5hTlC3AwPPTNu38FSlytJ1tbmZe9AtP7nWY1
         qDa4Kfiqz4wrube8K1k5+4n7HCQ0VQyPPZA5WihHGJoiqqD4GaDkfh9Up5ARSD6vF5G5
         805mLtSskRCZ6FpugyiqPJ0JI+oVsFSy119Xb8SDlRkfWPL9RAy3EG84nyQs7EHJbWpa
         UsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109247; x=1790714047;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxcnKx8aTyQRysco9yob8teG0Hm7pIWhDCbbc7ogXSM=;
        b=mAcpSitGoNu6o7d6Pl4NMeQYXIRvP+N9MCSpqtW76U6PIAG6kBtGhXFYZVz7SFF9T8
         U1kRloosfAWbAZOgTAJhTg8C3s98D5/VBwsXnAE72O8PP0QXgc1KfmHBpPjsuK1XYFP2
         M3Du55IsSS2EkmMA2ktqUtUZrU6S091g0QaBG5dSAWGOwzgM6d+ED5ZlxK6heSy4DzX7
         vrnXl158Bh0Kg3tRornnCDVLFflEja9b5kFwB/Pnz56KP5y9Sg+9Le6HvO844y7e647m
         9SruQLjK29cuPLNplA4nYJYwvrS7n8AMuHTmBdP1ZYn4CmDKHT4AlF4kHKxLealGdwo0
         XPMg==
X-Forwarded-Encrypted: i=1; AKwUvBwGbi8VjMlOJbqsc8W69S5qSpkshOmgq3ObF12p4denOfi9eGLh0tVpYYWfqpbKKIn46/tDp49hk6n0R9OrKRSK@lists.infradead.org
X-Gm-Message-State: AFuF++kvXmb2SRuo2LJZ1IxNyxuck7X6qwwGiqflSCuS3brwBHJVx8y/
	lEyShzJr3W8AO7O103UxX6axYyRKgBG7eAzZ+BpIYklMBvNC9eeQZg3f5Xaz5SccvHNzQldo/FD
	DEXVJUWWUvc12dd9lDbpnbNFah5nZn7E=
X-Gm-Gg: AYBFou3yysOKcagNGX8oje/lcb+GY312pMW9G945qHa1lhmyQg2NGwJqTobVTv1j396
	teOYu3fi852nKM7vuMHwgjel0zRj55ddQ1Qth8dVHOEo23e0ZIw1hliqtIxLrq8VSLR2E4yibIA
	OBcZ9g0rlk8gvLlFF3cR7FDlg1abPF8exuwm6JU9PWIPMW7H5pGlirb66FdZY5sSeMt6sMHV/ao
	tBnywF47Hm5rjQXMhsR/sHlgz5N+UV00BdulhadIVzJ1ijbYoQypkkF5ubPeiuZGPHPuqG2nzD8
	TuK/mGzdsKzu9aj7cqVO8ZByzSjsld4OYW8KLvrs6spQOSF20PY4u34EQf9HXsbF0DHOityDTNC
	04beLh//HwIi0Nm7cxhN9o4XNExyFPpzIoQbekw9NvKyssH8f3PuDgV5T6bFGEME=
X-Received: by 2002:a17:90b:4a45:b0:39e:2530:2102 with SMTP id
 98e67ed59e1d1-3a07e56552cmr499070a91.11.1790109247222; Tue, 22 Sep 2026
 13:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260810133540.1947118-1-puranjay@kernel.org> <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
 <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
In-Reply-To: <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Sep 2026 13:33:52 -0700
X-Gm-Features: AcwNN1WthkF5BlZ1QMNrqoVSwR9HYVD5IHCsPcWIws_60KwDdxRC38bx-LOITwg
Message-ID: <CAEf4BzZZOqFvSfjp7YMAvEabQSrziv7j26P_SRwMczKf56WZ4A@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry fixes
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: wuyifan <wuyifan50@huawei.com>, Ian Rogers <irogers@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Usama Arif <usama.arif@linux.dev>, Will Deacon <will@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_133408_688086_4156E3AF 
X-CRM114-Status: GOOD (  23.32  )
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

On Tue, Sep 15, 2026 at 3:47=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> On Thu, Sep 3, 2026 at 7:45=E2=80=AFPM wuyifan <wuyifan50@huawei.com> wro=
te:
> >
> > Hi Puranjay,
> >
> > On 8/10/2026 9:35 PM, Puranjay Mohan wrote:
> > > These three fixes were found while adding BRBE support for
> > > bpf_get_branch_snapshot() on arm64 and were carried in that series un=
til
> > > v6 [1]. They do not depend on it, so they go on their own; the versio=
n
> > > number continues from that series to avoid two numbering schemes for =
the
> > > same patches.
> > perf record -C <cpu> -b [<command>] triggers a NULL pointer dereference
> > in armv8pmu_sched_task().
> >
> > Commit fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpm=
u
> > pointer") changed armv8pmu_sched_task() from reading the per-CPU
> > cpu_armpmu variable to dereferencing pmu_ctx->pmu via
> > to_arm_pmu(pmu_ctx->pmu). Meanwhile, commit bd2756811766 ("perf:
> > Rewrite core context handling") made __perf_pmu_sched_task() pass
> > cpc->task_epc to pmu->sched_task(). cpc->task_epc is only non-NULL
> > while a task context is scheduled in; CPU-bound events do not schedule =
a
> > task context, so cpc->task_epc stays NULL. The NULL argument is derefer=
enced
> > and crashes.
> >
> > With the patches applied, perf record -C <cpu> -b no longer crashes,
> > and system-wide perf record -b -e <event> -a alongside a task-bound eve=
nt
> > on a different CPU runs without any WARN_ON.
> >
> > Tested-by: Yifan Wu <wuyifan50@huawei.com>
>
> Hi,
>
> Is there anything that needs doing to land this series? Avoiding a
> perf crash seems worthwhile. I believe Peter and Ingo are best placed
> to review the changes to kernel/events/core.c.
>

another ping... seems like worthwhile problems to fix

> Thanks,
> Ian
>

