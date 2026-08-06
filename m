Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EE8C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNFDGBasAzdtMYMXr/QlbpUhNB9kt+XhO0QxWK3ASd8=; b=151JPS8iBm3FJ+x/wTyMqnoCx5
	yceqzDZb9PcYAFYaOOtFKECND1YpQggeauai6JODdf6jwWsEonrPkX0hAH2GAGOB22zWWdZ+jTnzl
	2AvRWt2rEMd/4e27+hhbt29qN5NBvcHhWYsHxw26RqVnkK+Yl14oNUg+mnwKfsfKOsNQY/Zs/G76/
	pgsAT83E6SqvR6jgawvsykAIARCNfMzdFYM1suPHVlUUdOdovC7MhZxjQ5Vc5iOgU3+1z1vtcNe6Z
	Qx/14NR+uT1mfsl58gDkxE9Gb3A2FDfKSuLGz1gxqI/4Et0bB6fwRfIU9Z6xvgTwTB168H/Q4a6nI
	eKIcu0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryXA-00000005wW1-3pDO;
	Thu, 06 Aug 2026 13:53:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wryXA-00000005wVt-1J6E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:53:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F5B460A99;
	Thu,  6 Aug 2026 13:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347CB1F000E9;
	Thu,  6 Aug 2026 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024399;
	bh=CNFDGBasAzdtMYMXr/QlbpUhNB9kt+XhO0QxWK3ASd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dNi74+4psZcWvuyypQ6jT4auh3Kr9dB0kfp8MHGrNCRMh4o/O7lwSaSoLkHHzdGzK
	 gDm1LX8DUtLnGKzq4JEnFQ5U648Hrj0zzQNEDayOU2Er0E5hfyanaBpX7sJd85RBtP
	 5dxGQqLJVCykmwLMNLyEcBtu4NXOu5YyA8sePqMKRnpbPsVwilm2zl1IeUqap1NPdL
	 V+WNX8tHbeM3iLUF+iZN8Si6b/y7ejToEiEoIN0qwuh1PmZM3wSnGUkfaWgAdN8MHF
	 EXJEaSVaV46HagYmueFLHrjlk740OTb6HSR5QAzRw1efmMg3boy/m/p3O/WlPtjjrY
	 ST5oIHhRfD1CA==
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
Subject: [PATCH v6 1/3] perf/core: Fix NULL pmu_ctx passed to pmu->sched_task()
Date: Thu,  6 Aug 2026 06:52:21 -0700
Message-ID: <20260806135224.3267890-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260806135224.3267890-1-puranjay@kernel.org>
References: <20260806135224.3267890-1-puranjay@kernel.org>
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

Pass &cpc->epc instead. __perf_init_event_pmu_context() sets its ->pmu
when the PMU is registered; ->ctx stays NULL until a CPU-wide event
attaches. That is enough here because armv8pmu_sched_task() is the only
in-tree implementation that dereferences the argument at all, and it
only reads ->pmu. The oops therefore needs BRBE, which arrived in v6.17.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Cc: stable@vger.kernel.org
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 kernel/events/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index b282de3e7d7ca..9815894b67e77 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -3907,7 +3907,8 @@ static void __perf_pmu_sched_task(struct perf_cpu_pmu_context *cpc,
 	perf_ctx_lock(cpuctx, cpuctx->task_ctx);
 	perf_pmu_disable(pmu);
 
-	pmu->sched_task(cpc->task_epc, task, sched_in);
+	pmu->sched_task(cpc->task_epc ? cpc->task_epc : &cpc->epc,
+			task, sched_in);
 
 	perf_pmu_enable(pmu);
 	perf_ctx_unlock(cpuctx, cpuctx->task_ctx);
-- 
2.53.0-Meta


