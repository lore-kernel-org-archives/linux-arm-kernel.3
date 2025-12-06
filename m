Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F51D3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxEE6YFCrywRRLGygEARIDA06aPKgmiMBn7nXQjzdiI=; b=ksKbiDDcF6aY+Rid0iKxyu5hIa
	31oAep0FJK/KfduGnWR/0pspAnv2vD4Zzgh/EUXWPx+68vVUbclK8sIbXH5dyuxDdF1rZUh55er/Z
	dmCb2cbZGA53fQAcifRPb+jNUrWBDfYcQEpw+4/+quZlitbNWhEf2b6u2OXpZJGTHWeOoQYfYA4OT
	3Z+ux2X1HeojuzSTfgL6rnNY4se0pvKxtMZ0DUYlo5dg7O5YHCSgEA7Woct9Ud9L2pJF6SWckBZ64
	pY2VTnapWa/w2N35HAY5FTXox3rEgtq+kdtY4CBHDQnUeyXkeJchrSfBphhWKg8vSqCnwKbX5s1VA
	4NXlX/9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzS-0000000AEBB-2Pbd;
	Sat, 06 Dec 2025 00:17:34 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRfzQ-0000000AE7B-04CM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:17:33 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso3051509a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980251; x=1765585051; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UxEE6YFCrywRRLGygEARIDA06aPKgmiMBn7nXQjzdiI=;
        b=2sxwtTmuZWu9mWMgDWh+OhAwHXsMx6BX2MC7ismblGafRkvY/sJ0LLcky8im/hrtlH
         NpCvP8UfgZy5y+qvSJ+4YuiH8x0eOaDaiZEPZOY+K3owuEXQBu8+10RUv3esFE/MNrfc
         lfurWkueNwB4mu2dM7dc8gcB/5gC7guY0LJ1sooKkBcop7+GoTQkO1b7zm0Ul2+ziwkD
         cjrSsYHnNPFhlkszlXDnNerpYQElY79rzbV9zVHVOTDLJ4tla0Iy/F+ioWg8mC0i8Tb4
         JfITzaXGwyVzhXj3kSAsjZCC6hRREA7IcPpD2YbPeLyvm522+a+mMQal9EynFJecvP05
         H+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980251; x=1765585051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxEE6YFCrywRRLGygEARIDA06aPKgmiMBn7nXQjzdiI=;
        b=GwFS4TRZSkMLmqTtbnN0JqUSz+8uqTmmgiKI5UkZWDOZaULxr9/x5+bp5bUrvgcBtr
         bhnVGGWhLMW9iX4ALgVj53pyWJd8BEjBhIxZ7+AtbWvQ2EAKGr3tLXw2rX24CvEZdKpO
         ZBJ3myuRds4DFLd/v1nv/398VPZkHReruDdlmP3fwSoVlU/vdKSW4eGbgzNTVWeKGR8H
         VQX0AFLj2XHF30B18SSYE4e1IBWZKTDoaFHOhwYjJuVBf9iasdBBNVKqc0Oa/SArhwf3
         AL6k31Q61rbj28g/ftiD2X4j9BMKDor4ZAPrBI64Ytg+yapCOFpgYXB83Izju4zfJnFN
         vdeQ==
X-Gm-Message-State: AOJu0YxHBOSTjQyzNtHnlkf0XduTtJW4ZF5zjodOd+aNxyrfQDR1jqsT
	mw/qVitvybgSH9pxTQG1RzwPfJ3VUcBGw/dJuEjdTpFgPwugNRFy5qtpczM3HD2qL4MWZ0Kb6JC
	Rsf+8lA==
X-Google-Smtp-Source: AGHT+IHjg9edpOr3D1FDjetV+9fqRbGzj3yZXk9Coy0VtACLss4vYlJyIABW7Xcv++xOTx44sX1NPQCjnv8=
X-Received: from pjbkr8.prod.google.com ([2002:a17:90b:4908:b0:343:387b:f2fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:38d0:b0:349:8116:a2e1
 with SMTP id 98e67ed59e1d1-349a25fe29fmr699857a91.20.1764980251086; Fri, 05
 Dec 2025 16:17:31 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:38 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-3-seanjc@google.com>
Subject: [PATCH v6 02/44] perf: Add generic exclude_guest support
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_161732_062011_596EBD76 
X-CRM114-Status: GOOD (  10.82  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kan Liang <kan.liang@linux.intel.com>

Only KVM knows the exact time when a guest is entering/exiting. Expose
two interfaces to KVM to switch the ownership of the PMU resources.

All the pinned events must be scheduled in first. Extend the
perf_event_sched_in() helper to support extra flag, e.g., EVENT_GUEST.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/events/core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4cc95dd15620..1e37ab90b815 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2872,14 +2872,15 @@ static void task_ctx_sched_out(struct perf_event_context *ctx,
 
 static void perf_event_sched_in(struct perf_cpu_context *cpuctx,
 				struct perf_event_context *ctx,
-				struct pmu *pmu)
+				struct pmu *pmu,
+				enum event_type_t event_type)
 {
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_PINNED | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_PINNED);
-	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_PINNED | event_type);
+	ctx_sched_in(&cpuctx->ctx, pmu, EVENT_FLEXIBLE | event_type);
 	if (ctx)
-		 ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE);
+		ctx_sched_in(ctx, pmu, EVENT_FLEXIBLE | event_type);
 }
 
 /*
@@ -2935,7 +2936,7 @@ static void ctx_resched(struct perf_cpu_context *cpuctx,
 	else if (event_type & EVENT_PINNED)
 		ctx_sched_out(&cpuctx->ctx, pmu, EVENT_FLEXIBLE);
 
-	perf_event_sched_in(cpuctx, task_ctx, pmu);
+	perf_event_sched_in(cpuctx, task_ctx, pmu, 0);
 
 	for_each_epc(epc, &cpuctx->ctx, pmu, 0)
 		perf_pmu_enable(epc->pmu);
@@ -4153,7 +4154,7 @@ static void perf_event_context_sched_in(struct task_struct *task)
 		ctx_sched_out(&cpuctx->ctx, NULL, EVENT_FLEXIBLE);
 	}
 
-	perf_event_sched_in(cpuctx, ctx, NULL);
+	perf_event_sched_in(cpuctx, ctx, NULL, 0);
 
 	perf_ctx_sched_task_cb(cpuctx->task_ctx, task, true);
 
-- 
2.52.0.223.gf5cc29aaa4-goog


