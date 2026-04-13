Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41C8F531C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjFtx9TVBimLo04LBzVCxDrDPfkzHb5EM3/axl9LJyE=; b=VBfAGWXtiRCI9ZoqhkPkqh7e8M
	ZFtM/z6HzuANWZyOwrZxGtmM7cdUypAF72TRt7QIIX5So47BUZVeSdc5z7Y6a14/vLwBjzKUlCKr/
	omgXC+QqnKZGo50LoyM/qhBWBrvRScDFoowfPLofkNVAjZT5JKoKExB933nIL1ccNTtVndBkwQxZH
	cHnv6bLkzV66hY2rKjZ0aGVVcDowmPYLJJYbjPPeMg1FvHgVIuHe6v7rcvraj8Rz8WlytfV5o6W5U
	o3tyeyiMsSwlMvKfWd6u+1GaTeCeQQFt0sVK6KoXLPrUFss4THf+ZsoerJVaij/gllAvgPaLelhVS
	Bs1OPLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUO-0000000GFCq-1JVC;
	Mon, 13 Apr 2026 18:58:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMUN-0000000GFCT-0FG3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B4856183C;
	Mon, 13 Apr 2026 18:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064C5C2BCAF;
	Mon, 13 Apr 2026 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776106706;
	bh=oWNqShly/dKLm6QH9Zz4OONYsqdxohN3rWDpuNVVnD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hK8Vv8mFgWDEIp9XPGid+4bIdY5R6vAfgVzhC5yYWCbpVPhECmnS2bvbCv5BxyxdM
	 usE7681SvMHyn2wOlNh3VFVCVLOrfc/Xe4wGG+8t4pQZ4g0yMwHEhMXe2YsTQHHrTM
	 z7MP/uKNR0Geo2pb9YqogClOhStG9iRjwNXtC35CdomBUpIKpLOFfmpYKmLLefDPvr
	 QQH3P+VBHZNeZFJzGesa6y28nsQMuRDln61sGFocqRxejcgoUBH4plyc4bjsBAb3o0
	 qOtWLEc091pg2B6yGz7Hdes+cNQJCLpFlpXyrsFZQu4jh/cdU1D6HsI5z42lA5CtTX
	 CvQVceOLPneqQ==
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
Subject: [PATCH v3 1/4] perf/core: Fix NULL pmu_ctx passed to PMU sched_task callback
Date: Mon, 13 Apr 2026 11:57:20 -0700
Message-ID: <20260413185740.3286146-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413185740.3286146-1-puranjay@kernel.org>
References: <20260413185740.3286146-1-puranjay@kernel.org>
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

__perf_pmu_sched_task() passes cpc->task_epc to pmu->sched_task(),
which is NULL when no per-task events exist for this PMU. With CPU-wide
branch-stack events, PMU callbacks that dereference pmu_ctx crash.

On ARM64 this is easily triggered with:

  perf record -b -e cycles -a -- ls

which crashes on the first context switch:

  Unable to handle kernel NULL pointer dereference at virtual address 00[.]
  PC is at armv8pmu_sched_task+0x14/0x50
  Call trace:
    armv8pmu_sched_task+0x14/0x50 (P)
    perf_pmu_sched_task+0xac/0x108
    __perf_event_task_sched_out+0x6c/0xe0

Fall back to &cpc->epc when cpc->task_epc is NULL so the callback
always receives a valid pmu_ctx.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 kernel/events/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1f5699b339ec..2a8fb78e1347 100644
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
-- 
2.52.0


