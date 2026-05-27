Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C043CCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvz8PiwvGk6Y72u5ZGZh0QDA7xEjtRQQxZQEXXA8yJQ=; b=d2C9qhw11nv0giF+mscKBIq8uI
	+llaUblevcBmJz2R5chPycMV8vkAfyIMUVZFMBL78ybkYwGUfFiQsmp5jCVJPPd0FSyzbL60O3ieL
	/AWrOqFg+3vSquBinqPJZoWgANN2wJPLDF/DrT5MQ8MeeQ7CbOjjQbUwENlwNvrCvUvy71Z/GwuVu
	DvZuZLNsSx3iBKm8IINAsjwdQG3LwQcLpxDeRLG2uQS/Zrk99bajyfzDRbNSoFmKKo3yJw1jx2zoh
	yNpwukhg1oX2Z2eDB2qg84SQZ484EXlVof9GIP2w2/V7sP40OLLmmRAAod7giWt7RfR4a2a/vbF6n
	YXBuu2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD7s-000000043Of-3xFf;
	Wed, 27 May 2026 12:12:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSD7n-000000043N5-48T8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:12:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19EDC6014C;
	Wed, 27 May 2026 12:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2601F00A3A;
	Wed, 27 May 2026 12:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779883958;
	bh=Gvz8PiwvGk6Y72u5ZGZh0QDA7xEjtRQQxZQEXXA8yJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YfwtHf0fCRwSCsi0j+YSaW/YJZ2YIrGStbHkIksFR7bUuKI0CBtGimWacS+sceB0v
	 3RA84khyfuBEAr35jrluhAudumFm5x4Js412+QPGwuRrWKbO/k1CaPCtlHOM+ZG6Lj
	 ouasmclyuaKE3TJkM1O1Ldlra6/sk2mdoiSXHuIEIQz2kv37voWgJdi/wV8g26lb83
	 GWgi3KODu4gnvHhtn91x7XCiDW46NmRbTWhPQJYaMCFEpzoCXSDsbHG4pmdhdDbYX0
	 HyIb2apud3R6SNaVlE1sbJbUu7JRCb+OEg+u8tdeQgjz8pHHKsxOXNzW2UEYxxFhaE
	 J+252EyBhmNBg==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v4 1/4] perf/core: Fix sched_task callbacks for CPU-wide branch stack events
Date: Wed, 27 May 2026 05:11:57 -0700
Message-ID: <20260527121207.2312181-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260527121207.2312181-1-puranjay@kernel.org>
References: <20260527121207.2312181-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

perf_pmu_sched_task() returns early when cpuctx->task_ctx is non-NULL,
deferring to perf_ctx_sched_task_cb() in the context sched_in/out
paths. But perf_ctx_sched_task_cb() only walks the task context's
pmu_ctx_list -- PMUs that have only CPU-wide events are not on that
list and their sched_task callback is silently skipped.

On ARM64 with CPU-wide branch recording:

  perf record -b -e cycles -a -- ls

armv8pmu_sched_task() is skipped whenever the scheduled task has an
unrelated perf event (e.g. a software event), and branch records leak
across task boundaries.

A second problem exists in __perf_pmu_sched_task(): it passes
cpc->task_epc directly to pmu->sched_task(), but task_epc is NULL for
PMUs with only CPU-wide events. When perf_pmu_sched_task() does reach
the loop (because cpuctx->task_ctx is NULL), this causes a NULL
pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 00[.]
  PC is at armv8pmu_sched_task+0x14/0x50
  Call trace:
    armv8pmu_sched_task+0x14/0x50 (P)
    perf_pmu_sched_task+0xac/0x108
    __perf_event_task_sched_out+0x6c/0xe0

Fix both:

 - Remove the blanket early return in perf_pmu_sched_task() when
   cpuctx->task_ctx is set. Instead, skip individual CPCs that have a
   task_epc (those are handled by perf_ctx_sched_task_cb()). CPCs
   without a task_epc are CPU-only and must be handled here.

 - Fall back to &cpc->epc in __perf_pmu_sched_task() when task_epc is
   NULL, so the callback always gets a valid pmu_ctx.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 kernel/events/core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6d1f8bad7e1c..6604f6e8f352 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3906,7 +3906,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc,
 	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
 	perf_pmu_disable(pmu);
 
-	pmu->sched_task(cpc->task_epc, task, sched_in);
+	pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
+			task, sched_in);
 
 	perf_pmu_enable(pmu);
 	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
@@ -3919,12 +3920,20 @@ static void perf_pmu_sched_task(struct task_struct *prev,
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
 	struct perf_cpu_pmu_context *cpc;
 
-	/* cpuctx->task_ctx will be handled in perf_event_context_sched_in/out */
-	if (prev == next || cpuctx->task_ctx)
+	if (prev == next)
 		return;
 
-	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry)
+	list_for_each_entry(cpc, this_cpu_ptr(&sched_cb_list), sched_cb_entry) {
+		/*
+		 * PMUs with per-task events are handled by
+		 * perf_ctx_sched_task_cb() via perf_event_context_sched_in/out
+		 * when a task context is active.
+		 */
+		if (cpuctx->task_ctx && cpc->task_epc)
+			continue;
+
 		__perf_pmu_sched_task(cpc, sched_in ? next : prev, sched_in);
+	}
 }
 
 static void perf_event_switch(struct task_struct *task,
-- 
2.53.0-Meta


