Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34B4C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dwBgvTSCknFUiyphLuWgAoC1ymQKKR5xHnko+T4uSQ=; b=3y8Gg1g37lh6rkBqO77qD+IDi2
	mTQufkgWRYYDYYZAZrH0T6jECJXvK4Lc6qVh7IHG+WL+t4MWEFGcPCSldEhH9xFedGMIf6SwEINrV
	io46pu1gCEA9owXO+d/CkAjzQ7UH/29vNhF206oFe2hyDwoln5bjSJ9aaqpPN5oiBIB8xhDsQgnMR
	bgZk2bAodNj1Wcvr8V2CXwBPgZfgiA+IzptCBFK50Brk/OvvVx0tGhbIXOEv0R+3WLPKt4bj24Ira
	UtD19d4efcVve2yrWf735Jkr4zTa8CUozeFFKptK7cqOBzP/lVjMm97bc2vt3ThyoAy6WJf5ByFj6
	kL03i6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQe-00000007Imq-3BAs;
	Tue, 15 Sep 2026 15:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VQ5-00000007IKp-2asF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/dwBgvTSCknFUiyphLuWgAoC1ymQKKR5xHnko+T4uSQ=; b=SMiVol+aEy5VDj7Fk1pP3H8aKU
	ebQp6kOTpEyiTTrJACxy6UYtEsnajYWcrnC75oQVDcv9WNicvWvqSBe94z/RK+VObJwTi6o0tR/RE
	REdpncUWnV+girqvWbSQZCJ5iXAXUcbUvI1M10KuOKbXXV14ClvHU8DkcteVjplyfnNNu5yflds3Y
	dPtDEyyAWlo/iDKX2ZvC2h2735kayhqb3PvD/XMtzKGe8S0Nlkvvl+SgjkQPJ3qTFhLP5+Qx6MM0a
	vS9ckR3S3ATXvPdafr/Kas3S8mRbwPoYNA+BAQ8hxvYERpPNHNqztUBwew70DdkOh4F/Hkd4DA1wa
	98bN3NPw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VQ2-00000006yXs-38uz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:50:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 663171BF3;
	Tue, 15 Sep 2026 08:49:58 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CA1B3F882;
	Tue, 15 Sep 2026 08:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487402; bh=RwdsZM+a5uD/u0uXiHq0QhelTuat7HbYA6vpgy4lSvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HA48Op/BWQoUQohLek/bFyrKQzhCJgoB7Fig1/46bRzCj+hp1dwOLeJPUyYywG4eZ
	 LTpK3n8h3aeX+ir5Nwnx5lkQvUhGMyGNuO8UN4lZzJ8iRLPaOokkLori4z8BLJpkro
	 fGyxShcWhCsy0aHs/5rJRHf12WmBx1+YTv49x2To=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:49:08 +0100
Subject: [PATCH 22/25] perf cs-etm: Centralize sample history collection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-22-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487341; l=3619;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RwdsZM+a5uD/u0uXiHq0QhelTuat7HbYA6vpgy4lSvY=;
 b=SzWUV9IxuvwoEnwv1yCjXzzj2D+2HcEKberLOkn9Tby6iG+oqqbtlnqZAh6pNlqSOg3oaD450
 0ecb8mnF72MCUsyXyyY0f2uFtUrBujFTE4yF4UnFXoMoZ41Xi1XlgUA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_165003_065065_CE2EA1AA 
X-CRM114-Status: GOOD (  17.21  )
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

Extract thread lookup, branch history collection and history consumption
from cs_etm__process_sample() into cs_etm__save_sample_history(). This
separates collecting decoded history from attaching it to a perf sample
and provides a common place for adding callchain collection.

Keep history collection to consume branch history so later samples
cannot reuse an earlier trace window. Use the session stored in the
auxtrace state and remove the redundant process_sample() argument.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/cs-etm.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e78c8e089f38eae34faa12bbd2f899f1f72acce4..815a22cedc49e9281b7087f01355bb71b5e41c57 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2048,6 +2048,26 @@ static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
 	return 0;
 }
 
+static int cs_etm__save_sample_history(struct cs_etm_auxtrace *etm,
+				       const struct perf_sample *sample)
+{
+	struct machine *machine = &etm->session->machines.host;
+	struct thread *thread;
+
+	thread = machine__findnew_thread(machine, sample->pid, sample->tid);
+	if (!thread)
+		return -ENOMEM;
+
+	/* Consume branch history so later samples cannot reuse the same window. */
+	thread_stack__br_sample_late(thread, sample->cpu, etm->br_stack,
+				     etm->br_stack_sz, sample->ip,
+				     machine__kernel_start(machine));
+	thread_stack__br_stack_consume(thread, sample->cpu);
+
+	thread__put(thread);
+	return 0;
+}
+
 static int cs_etm__flush(struct cs_etm_queue *etmq,
 			 struct cs_etm_traceid_queue *tidq)
 {
@@ -3088,11 +3108,8 @@ static int cs_etm__br_stack_init(struct cs_etm_auxtrace *etm,
  * the kernel; its thread and trace window still identify valid history.
  */
 static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
-				  struct perf_session *session,
 				  struct perf_sample *sample)
 {
-	struct machine *machine = &session->machines.host;
-	struct thread *thread;
 	int err;
 
 	if (!etm->synth_opts.add_last_branch || sample->branch_stack ||
@@ -3117,28 +3134,13 @@ static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
 	if (err)
 		return err;
 
-	thread = machine__findnew_thread(machine, sample->pid, sample->tid);
-	if (!thread)
-		return -ENOMEM;
-
-	/*
-	 * Take the branch history rather than copying it. The trace window
-	 * belongs to the sample that ends it, so once it has been attached a
-	 * later sample with nothing newly decoded finds an empty stack rather
-	 * than being given an earlier window's branches. That is the common
-	 * case whenever the trace is duty cycled, by AUX pause/resume or by
-	 * ETM strobing.
-	 */
-	thread_stack__br_sample_late(thread, sample->cpu, etm->br_stack,
-				     etm->br_stack_sz, sample->ip,
-				     machine__kernel_start(machine));
-	thread_stack__br_stack_consume(thread, sample->cpu);
+	err = cs_etm__save_sample_history(etm, sample);
+	if (err)
+		return err;
 
 	if (etm->br_stack->nr)
 		sample->branch_stack = etm->br_stack;
 
-	thread__put(thread);
-
 	return 0;
 }
 
@@ -3181,7 +3183,7 @@ static int cs_etm__process_event(struct perf_session *session,
 		return cs_etm__process_switch_cpu_wide(etm, event);
 
 	case PERF_RECORD_SAMPLE:
-		return cs_etm__process_sample(etm, session, sample);
+		return cs_etm__process_sample(etm, sample);
 
 	case PERF_RECORD_AUX:
 		/*

-- 
2.34.1


