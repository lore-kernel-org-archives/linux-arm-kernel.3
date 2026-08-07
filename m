Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD32C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+lNGc2wq23H6MJ/sOQHuT0aX2LUv/n1NhY2pqg5I/E=; b=RH6z16XizB6BP8fwyPXp5oTHRW
	LtQegycMFTGv8qHoVOLuVOF3zqu2rdZ5snsOmRTKc8LVZ9T5K7EIkozB+1EXigSH9Oyxe93v3ELmr
	xpA4vTL58DmFnNx5paWe0qAEtASMfqHDzaeKc/LOLynF5hRRFgqcXu5WfQA5aoOr+cDmqSIeOGYWr
	WKIj2Xd6/rA4WzSDpPLs72rgotdifLHAULXSEJ05y60hX4/H8oAbSc+Y2coeLkrrCW5FWDqpC/I65
	8BE5ED2Fkg051DTz4OVmX9tpkxEsTjlNlcbHJYbtqSuQZDC+DZXrACeqxxgKGARu7nmoPBpp7bPUu
	8bYsposA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFxw-00000007Pu1-1WtA;
	Fri, 07 Aug 2026 08:30:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFxt-00000007PtS-25RF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 08:30:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4954afac04bso34620285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786091403; x=1786696203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+lNGc2wq23H6MJ/sOQHuT0aX2LUv/n1NhY2pqg5I/E=;
        b=oD7VcFNdC9nL8zCcO5BpfkxR4Qvc7GWsTltqJbW5abRZO5TTBac0rgaWYAKQQP617f
         U2I7p1d8oIKsnNKOHJdqZ51g0btAI2EUOqpdyG3Twcz947rUy44niz/jY4Gv9SIK/32H
         b/wFcRHVwXmPhwxXQA8gtJwRQ9K5VT5P+aKyYO6r4tdzMHQd0R3mJqxICMMqGuMxdKYp
         C9o8VmEWh8VnnOKDxBgGvryapeh7FZc7Mi/bLsJKLGd17W2N8i7od2tLM+RuYewq4M4F
         J7tWhH28I9vdQL2NtZuiqSxsFJsuecLsIyloNRw8eUoKBE29EGn54ZtOPiuXkLR6zyEc
         FWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091403; x=1786696203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+lNGc2wq23H6MJ/sOQHuT0aX2LUv/n1NhY2pqg5I/E=;
        b=DGxZm85O00e2ZvJYAjjONgS+3sL+AsHZ/WzpTqzkroQbNRLKNC5oMgyU9A/XeF5+PE
         WLwBz/mFK0KG08jJY0JmpMocBFcU3xxykWHeyXjHkvoKkxZLnFcSmOh59CI8e/H3f4yX
         jEDzN8PQasHLpMCjjfXZLz3awd6lJYvaG3u6niDyez48Y4HP2VwAJLnH+vDyZPioh9pD
         TRoInncmwWI+J5UpxyJInLpsGJYLdkURDNTlJ8B5WPO9vR5UQXb1Oqj7PQ8zIWkZtM5F
         V8gHZg81I3a4tRCuWNZtXp5Ocl5oBmZfsRQ+HdyXfFW0PBGJvvMeShNr9OkDYZZabfnB
         jjuw==
X-Forwarded-Encrypted: i=1; AHgh+RoCdKHJ4BBVJH5iAa9rpomDq3rDpkn5cqTPLmIzluhwLPqLbORv6YeEIQ4VUVlIw1hxC9MtPpr8VftRYjcfT8Bq@lists.infradead.org
X-Gm-Message-State: AOJu0YyHsZWlT+MzaoA4UvhR90Zt0IlqNfNZ+XGw63NVG91HP1C4azZ4
	Gm6B9xK0YagZUkcG0x9HZU9y8fLpipu4vVbB3p2lFbcgXnDtDFlzVu559nimPsG3w3Y=
X-Gm-Gg: AR+sD12RWmuZxkcEC+EqRt2AQNQr4XzcJD8SCiduH4QIiM+MG2IsQv2XjFn+P2AW6a5
	Ngh5tchpaA/+6fcQpAnCqK/JH47FlzmSB9bXmcoSsiuWqnZSOexeCuwZNdfMX1ZdAaQJX7OhKRT
	RtXd9ZZ5vIu2GgfRMKJa7pgzJh7zPQK8oMhK51/UF26Ton0t/ld9PTfeYIa+eDETTiTXYrlXai8
	SLd894S8Sgf8e/PaH8kABH9fcrcVFwa98ercEtt4poSPcTAk4wzrUmIxJPkVfOqLi2q8MLSLbB+
	fRKUMkspYIrSMwHIlqxsrJ5+ZpfN8B4NkuyXPSPZiL4YArSRPNrVmbsMA23yNE1uSKU1kSarRpw
	8mHF0HysfURt0mOAeCbObHQS3ciXM4MvJBGjneo1k1MDJV1+aYPt5+85OI0tOqOlPw9cd+5c7di
	tez2oe5xx9lqI8ww5HySehMj4lsAUU+zB7jKl+cssohRaJ/RIJUue/PiyIMBaXcy31oVfXQizyE
	vqTWw==
X-Received: by 2002:a05:600c:1f86:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-49952aba5b3mr163509935e9.1.1786091403124;
        Fri, 07 Aug 2026 01:30:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm4085508f8f.18.2026.08.07.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:30:02 -0700 (PDT)
Message-ID: <71b4a5c6-33d5-4d7f-9378-7f913143d0f8@linaro.org>
Date: Fri, 7 Aug 2026 09:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] perf/core: sched_task() dispatch and branch entry
 fixes
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Usama Arif <usama.arif@linux.dev>,
 Will Deacon <will@kernel.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20260806135224.3267890-1-puranjay@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260806135224.3267890-1-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_013005_619313_F204B36D 
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



On 06/08/2026 14:52, Puranjay Mohan wrote:
> These three fixes were found while adding BRBE support for
> bpf_get_branch_snapshot() on arm64 and have been carried in that series
> since v1 [1]. They do not depend on it, so they go on their own from
> here; the version number continues from that series to avoid two
> numbering schemes for the same patches.
> 
> Patch 1 stops __perf_pmu_sched_task() passing a NULL pmu_ctx to
> pmu->sched_task(). armv8pmu_sched_task() is the only implementation that
> dereferences the argument, so the oops needs BRBE.
> 
> Patch 2 makes perf_pmu_sched_task() visit PMUs whose events are all
> CPU-wide. They are skipped today whenever the scheduled task has a perf
> event of its own, so branch records leak across task boundaries with
> perf record -b -a. intel_pmu_lbr_add() calls perf_sched_cb_inc()
> unconditionally, so x86 LBR is affected the same way.
> 
> Dropping the early return alone leaves both dispatch paths running for
> one case, so perf_ctx_sched_task_cb() gains a matching gate. The two
> could instead be collapsed into perf_pmu_sched_task() alone, since
> __perf_pmu_sched_task() already passes the same epc, but that would move
> the callback out of the perf_ctx_disable() window for every PMU rather
> than just that one case, which seemed like too much for a fix tagged for
> stable.
> 
> Patch 3 clears struct perf_branch_entry with a single struct assignment.
> perf_clear_branch_entry_bitfields() had drifted from the struct: new_type
> and priv were never cleared, and arm_pmuv3.c allocates the per-CPU branch
> stack with kmalloc().
> 
> Tested on a 128 CPU arm64 machine with BRBE. A WARN_ON_ONCE() at the gate
> patch 2 adds to perf_ctx_sched_task_cb() fires within seconds of running
> perf record -b -a alongside a task-bound event pinned to a different CPU.
> 
> Changes in v6:
> - Split the sched_task() fix into patches 1 and 2; the NULL dereference
>    and the missed dispatch are separate bugs with different reachability.
> - Gate perf_ctx_sched_task_cb() on cpc->task_epc. v5 removed the early
>    return in perf_pmu_sched_task() without it, so both paths ran for a
>    task whose event for that PMU is pinned to another CPU. Caught by the
>    WARN_ON_ONCE() described above.
> - Tag patches 1 and 2 for stable.
> - Send separately from the BRBE series, rebased onto tip perf/core.
> 
> [1] https://lore.kernel.org/all/20260616155716.2631508-1-puranjay@kernel.org/
> 
> Based on tip perf/core (f4dfab174244).
> 
> Puranjay Mohan (3):
>    perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
>    perf/core: Run sched_task() for PMUs with only CPU-wide events
>    perf/core: Clear the whole branch entry in perf_clear_branch_entry()
> 
>   arch/x86/events/amd/brs.c   |  2 +-
>   arch/x86/events/amd/lbr.c   |  2 +-
>   arch/x86/events/intel/lbr.c |  6 +++---
>   drivers/perf/arm_brbe.c     |  2 +-
>   include/linux/perf_event.h  | 16 ++--------------
>   kernel/events/core.c        | 15 +++++++++++----
>   6 files changed, 19 insertions(+), 24 deletions(-)
> 

Reviewed-by: James Clark <james.clark@linaro.org>


