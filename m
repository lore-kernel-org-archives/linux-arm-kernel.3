Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF1FC5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNT7bjfQ5ypnw0lOWzF1yyyxocddeiAffZrZpT0iW/c=; b=s19CHb4CRkKheNKbRYcvu2BPVZ
	B4yOGBZE9o99+LpNjGA0bu9oCufgbcsFVH+zPaki8Ygx8DnaYGy4+Eu0njFgDWjQAbDnqN1e20vKL
	JjPHFzlMM1xrn1wEbYhOijllbF/KYyPgTQC6D+pZFv6exm2AmLyFITB694nX7pRhLXGyPRy8mn6xC
	Ttmzrr/2Szy2taLZLPxckmqJksuxKHNWrQGhNhKO/MHCzOEJC4shhQl29PStDlU4CwkY8ivq31UW4
	FcbliMrTYbCG7KSpRP5ABfWd/JI8dtNDsJZ7ZXXzKv6JRqCyqyfFfR+N+QwIxROCYpdmT7Vm3nQdD
	iLLGYREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAR-0000000BucF-3BZQ;
	Mon, 10 Aug 2026 13:35:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQAQ-0000000Bubt-3257
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 13:35:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C795F601E0;
	Mon, 10 Aug 2026 13:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609B91F000E9;
	Mon, 10 Aug 2026 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368949;
	bh=gNT7bjfQ5ypnw0lOWzF1yyyxocddeiAffZrZpT0iW/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X6sAuLM7PSbNKjIqL5Inn5dbxuj6R3Jjv4N9KexgPyTH/woXMpcvOw9bjRRHqNkS5
	 Ak5ID5Pl9iAEMcp07Y+K6+UHahvFTFJMIQpZyd+jPUrn+GttdTFz7zPIiS0RLgerZU
	 Srh7e9TR9+6wneRLif7eiTv3xBp09puNC+fHTtryjGK4WIjxEroVHRJFnUmgt5vQSz
	 i0AciJNQbSNH3gteOgkLq4MbgsbXDjMvgLoUx3muvky00oEJ7VmKyXKMnogPjJlFLM
	 7r0gbDzwQHXpuFGFLVi0nS4Gq2OxA72jiGmMIBfez+IsSodTzDSGts8IOjyV6p88SJ
	 7nE+UlO3R1KmQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Usama Arif <usama.arif@linux.dev>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	x86@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 1/3] perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
Date: Mon, 10 Aug 2026 06:35:34 -0700
Message-ID: <20260810133540.1947118-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810133540.1947118-1-puranjay@kernel.org>
References: <20260810133540.1947118-1-puranjay@kernel.org>
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

perf_pmu_sched_task() returns early when cpuctx->task_ctx is set, and
cpc->task_epc is only non-NULL while a task context is scheduled in on
this CPU. __perf_pmu_sched_task() therefore always passes NULL:

  Unable to handle kernel NULL pointer dereference at virtual address 00
  pc : armv8pmu_sched_task+0x14/0x50
  Call trace:
   armv8pmu_sched_task+0x14/0x50 (P)
   perf_pmu_sched_task+0xac/0x108
   __perf_event_task_sched_out+0x6c/0xe0

Pass &cpc->epc instead, the CPU-wide context for this PMU, which the
function already dereferences a few lines up to find pmu.

armv8pmu_sched_task() is the only in-tree implementation that
dereferences the argument, and it only reads ->pmu, so the oops needs
BRBE, added in v6.17.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Cc: stable@vger.kernel.org
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4638544205f28..05635217696c2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3907,7 +3907,7 @@ static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc,
 	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
 	perf_pmu_disable(pmu);
 
-	pmu->sched_task(cpc->task_epc, task, sched_in);
+	pmu->sched_task(&cpc->epc, task, sched_in);
 
 	perf_pmu_enable(pmu);
 	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
-- 
2.53.0-Meta


