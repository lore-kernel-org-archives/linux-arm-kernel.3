Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756E4C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=; b=c15K6MSxRoNn+NQrprUr24chS+
	juvZatsP+kFc7Q2b8c3AsL3C/4Cn0YFvr3VTJD69u8i6GwdMy+ldj7e127aTy5KuEMkHoE1jnQyZ5
	8uc0fB8mythalv3Id16TzfdhhJk/YqLFVhOL7soxiN6nfgHyzQyEQk+UAUwLYXt3uqRk7F9/SDQsZ
	SbTFTwCMs8NW1djnkRLl0UOpz3D3vgJ+k1SZ5NBanIWinjQc11CzURSO9XzIHaBrpuGZadSBylo6u
	MGTmIKjRJtyFxcBt8pKtGC67idVf+8TBaASdAo4S2jcnILNufoL/TE6L1TffJk2vhvq6Vyp5HysvH
	TyvIMCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bo7-000000081rN-2L1c;
	Tue, 15 Sep 2026 22:39:19 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bo5-000000081qx-2eRo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 22:39:18 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-5306706e89dso46501cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 15:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789511956; cv=none;
        d=google.com; s=arc-20260327;
        b=LmAtunDInLm5/f/JPahszb/E5Fti1T4gsHNaVPkSWgq16hlBaiXq5fCPtp2ehaVrOg
         FOGkDEkgBTJayUcHBgqlnDozVpMCVS2+05PWD4k0WvZKB8C3qNFpCJyIO3mkZ78/u7lI
         87d+exxBRBX9R/aicP4CexJpaMz0NgDQycB9VujWn7d35XBeKFISjBNV41n3P7Wwve/o
         XMkVbOxtGfn9qHVXLoFHhC62PpLJpec3KnC/IakDowHOHjpPU0W/v/sHPZafwZSSckSQ
         KtP0qYe4b3YwTF7sb+xLOjtWQTzD5rJ2pSpj9V6ec6mu1ebx9Eb9TOlWFNC4xZJXRmzq
         aj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        fh=R54NnTTUGxTsxGlpgJPOAykUr17XfQ8TXNyDe2StmsI=;
        b=pPQMnjWCd4bsrRcfwfevMg+kZoP9bhwyJBJa3isaBPI7IMlJUGgbwwYVdv/J4dwps+
         G+Xxf2BDDEHeMKodmMYTdgmNjb+WpI1nf3zOqzBAqthqBJ72fwIejqhCPG76R/tiVF2o
         uFrevBhHZYL2/LtMghwqWKP8ewJFKLzGaLfeCvV4NSNvWNQE2p+8LGbVqqhpJ6oUfu37
         TovV9+6ZT100jxyN4qItCQvzxZ2pogV3Sf9c6Pw2xK/KyGWkYqskLSB7o5gmJ+K1Ne2G
         MzqhQkis6DXdYZeKNmJz49Zb2wgmBft5S8i8ViVTENuXKYSd+SqvzQHmcO+5mx8iAUTs
         LHzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789511956; x=1790116756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        b=lGMtl7t/Z2qJQ80ZQF10Ii9C+h/2mRRoLyPQ46DW0IcnV8f8K47Dt5mGT6U+M7JgnA
         Lm+sB7TygilLMf2EYGRHFCkXc6IRbuXHyec8Bll8iVafXfXM4WUceVnKTTbt5mN0aKg4
         97t7nIu/TnYXNkwFF4t8hNZuEV1GoV7+vn/Dc1pRH1YEq0Xz2eHtE+eVTOhxyfIKxArz
         H6Nnljc34Wz4RemCUbueXMMK4AYL9I/lnBN7qVPC9vq9JiPPTQDkPXiaLl6vnzzMhaFi
         LpRw+x1TlVHbWLcoOGnjOLpydEU7N09IvjUsjQsq9oD2LR31f2ZJi/EnedpUcJand0rJ
         G8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511956; x=1790116756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJsCws3FamyI5nwIu6NR9CwJlE0an5auOcy5PUi3Br4=;
        b=x122EduxJcKympVZEIka8ANbWy8iybo4mF5EnxwTkxm841NuSgPTGQsVC0P565vVO+
         aJFvjoin/GZETyy6IH47Z1W7TUCW5n4AvoFQQYzu85LcbUYm6l1i1qwxSgmtupvFNasx
         Kob88wxhoIqcJO1Fx6ffFx/twltIehwxqLBXsfY57qTYU6ZfOG1pJ9adI7oUcD+P2lcu
         NnAk3YVcW7WnysxqzKvwWiuVMcy3r0xh4x8pZ0mv/J90rBDCagV2/QPl/1boaIFIuptT
         KHZ9gpOc2+QWiNmmqohApJtK3iTK/mQJqO3CMQAypF/wj5oIEhEvs9xbyxNqqZfsFu55
         h0ww==
X-Forwarded-Encrypted: i=1; AKwUvByddBvmdiqTWkCQovZMX3I7JSPt4775XsAxQP8bN0k6vroEDLC/ZR45qE94uf3vW+p1uJhRKP0QXU/cNF87E/Yb@lists.infradead.org
X-Gm-Message-State: AFuF++kfme20T44MX01NsafN2L5U2BHbYCNDpkM5WcngLL3luDMLe7jn
	sCqrFZ2f1LQvKKaKlwVJMOzszEDAOM4HT9CfnW9MlUiddm/uNIZpDAIKt/lSs9YP0129oa8kmFI
	wQJwoOFeg8uirR+vPME0CGeS7Gj6CfvCSgdlfF9Vi
X-Gm-Gg: AYBFou3gCyRYBUuu7Jh8hOK+bqLb8+356WgNiEFKRnZUviXzRlTcBPRgi7ePU5aZLWh
	oExNxrI9+Pqpj48SVpZd5A6cdsEhuBe/ap3UAXQ0/9DFPVUpmkUvPqGPqJRHhvGrcAWxIWedYin
	+0x92a+BjD3X9IlFAaLt2Co7AmwT6+Xf6d7GrhcMNyoCY1EsPbmJp76lxrcND9xLYtxgFfeOc57
	6ifUoiw1LLKs9zmdYkKZqFKTkhNX3GAnB1ujENkSN/bYR8GozN2XN4Qhwiv75W9FBLgrF+r7YKo
	Zay/yjPJh9QW9gYunkfiO+PvRvDJ3dfTf9sSWTIq89IMNfADDWZHi9VB63d4V1mPB8cz90tjuie
	q6/uyushMBimYuZM/K07E
X-Received: by 2002:a05:622a:4d8c:b0:531:34b9:2532 with SMTP id
 d75a77b69052e-5327ed8004emr2058291cf.4.1789511954807; Tue, 15 Sep 2026
 15:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260810133540.1947118-1-puranjay@kernel.org> <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
In-Reply-To: <4f755a7f-0a55-4292-892a-28346ed235a4@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 15 Sep 2026 15:39:03 -0700
X-Gm-Features: AcwNN1VJtEici--U7gAI-B9LpTV32UhMFNQSbZNGUEhTbibENqFgMN18MX5xm4g
Message-ID: <CAP-5=fUepMzyctDcUqYNJMG+xBOK0bdUF_cXPtQ43AxfFVL+Zw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf/core: sched_task() dispatch and branch entry fixes
To: wuyifan <wuyifan50@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260915_153917_712886_F1A2C349 
X-CRM114-Status: GOOD (  19.97  )
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

On Thu, Sep 3, 2026 at 7:45=E2=80=AFPM wuyifan <wuyifan50@huawei.com> wrote=
:
>
> Hi Puranjay,
>
> On 8/10/2026 9:35 PM, Puranjay Mohan wrote:
> > These three fixes were found while adding BRBE support for
> > bpf_get_branch_snapshot() on arm64 and were carried in that series unti=
l
> > v6 [1]. They do not depend on it, so they go on their own; the version
> > number continues from that series to avoid two numbering schemes for th=
e
> > same patches.
> perf record -C <cpu> -b [<command>] triggers a NULL pointer dereference
> in armv8pmu_sched_task().
>
> Commit fa9d27773873 ("perf: arm_pmu: Kill last use of per-CPU cpu_armpmu
> pointer") changed armv8pmu_sched_task() from reading the per-CPU
> cpu_armpmu variable to dereferencing pmu_ctx->pmu via
> to_arm_pmu(pmu_ctx->pmu). Meanwhile, commit bd2756811766 ("perf:
> Rewrite core context handling") made __perf_pmu_sched_task() pass
> cpc->task_epc to pmu->sched_task(). cpc->task_epc is only non-NULL
> while a task context is scheduled in; CPU-bound events do not schedule a
> task context, so cpc->task_epc stays NULL. The NULL argument is dereferen=
ced
> and crashes.
>
> With the patches applied, perf record -C <cpu> -b no longer crashes,
> and system-wide perf record -b -e <event> -a alongside a task-bound event
> on a different CPU runs without any WARN_ON.
>
> Tested-by: Yifan Wu <wuyifan50@huawei.com>

Hi,

Is there anything that needs doing to land this series? Avoiding a
perf crash seems worthwhile. I believe Peter and Ingo are best placed
to review the changes to kernel/events/core.c.

Thanks,
Ian

