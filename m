Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7309CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XJ+kKwmeQYzrH/jGKEqsuhyI3KMPbf2VdFFRgwHRao=; b=zWPr81253hoYsuLRicT3Pd+vfw
	mFFMeNCjARpHxKH3flcEP29hbdV4eDkL02FZ9rG1EbitgY1aO9SaDrJP51CGWI61FWPv35g6/fIzP
	MHPbFzVpDhD+LM4ENSVlomgopMGxssDna9WCZNNuHyP6adNLzZck+APCu2zvL0ZYzq8QYF7ovJ+ik
	wzX02zr1uB8Kpa87P1/5Hj0VUFdM3CFFxX4ZcRLh26ruJIS3nX4DoTAOr8NjKY0fa6nEovfsc/WK2
	8IcAooKjulP12PfYGzaJPrEQM130aQx7LlQAZxuCt2wYLx3QHFqtLhD2s/i6oVXEtUfpa62AHwjEp
	ExcICG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhfx-0000000DsFt-13z5;
	Tue, 13 Oct 2026 18:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhfw-0000000DsFX-08zc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 18:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9XJ+kKwmeQYzrH/jGKEqsuhyI3KMPbf2VdFFRgwHRao=; b=eew+NduKR3mh9VxkVBz/WQviqK
	0w+5qHPZgwQ3ksbdszWWWS2yphebGthDgTTMEzNw33b+WkVThDVHumdfEHBodHhMAGcjOtxMxFqa0
	snBio/y0buwBG3sB5O9vJIRJAV3wXijoqvuhhqIJau8FsE2MGcKL1o1q5GBOm23CNFHZHnbltu7DH
	WxPyFu3vAVUUEbVh2WkiSQN5JSvUFZv5b4Lwj5fqKopAm5AMW3/OZbXsyHjZhzwdH1WxBzTdaOTuC
	p6AIow14XjpwGQUUTXN+ijGcOogmL9sN9DRLy73iJPGXAnlUxjMrXRuxjiJ9+xzwKCGpbnDK8r3en
	8WjvDgXg==;
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGhft-0000000FxLJ-05nw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791917793; x=1823453793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9XJ+kKwmeQYzrH/jGKEqsuhyI3KMPbf2VdFFRgwHRao=;
  b=LbyVj+DS6lxAhkZUtbAANngefPkYx3Takh308bcmRl2TFaI6o43/rSkR
   e+9FOfdHyRu7SeiaIyalTpK6cvV4tLJMVSq2s8rzhtU/EWY2adTAlQt62
   pErZv0Pr6x7apzS7lhffB1opA8d77w0PfaRtkcyM+pPRTnAsLUjPrzNIB
   0KtGy48LsOGl6mNpg5BZs4C3K1BvTgFqeK1sCapkEV4CXFVQirtvIqqhG
   48LGuIvZ0y/yHnCF0M5YzN8yUgq+Tte68rJ+LLUpBSAdFd207czWJke0M
   66ATgOS4CX2C+Mk2Z41xxaH6GWM5Me2v6lu5xOBJIK3eebKPCbjbBMZKI
   Q==;
X-CSE-ConnectionGUID: j0FygOHfSyS4sq5lD7S3UQ==
X-CSE-MsgGUID: tU/+8qrKTEa8p78Z7htO3A==
X-IronPort-AV: E=Sophos;i="6.27,156,1787011200"; 
   d="scan'208";a="30957098"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 18:56:28 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:24547]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.46:2525] with esmtp (Farcaster)
 id 0a7120f2-3207-4601-8dac-c72bc561f46d; Tue, 13 Oct 2026 18:56:28 +0000 (UTC)
X-Farcaster-Flow-ID: 0a7120f2-3207-4601-8dac-c72bc561f46d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 13 Oct 2026 18:56:27 +0000
Received: from u34cccd802f2d52.amazon.com (10.187.170.30) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 13 Oct 2026 18:56:26 +0000
From: Haris Okanovic <harisokn@amazon.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
	<jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
	<adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <harisokn@amazon.com>
Subject: [PATCH 1/4] perf/core: Fix perf_pmu_migrate_context() leaving events behind
Date: Tue, 13 Oct 2026 13:56:00 -0500
Message-ID: <20261013185603.1347265-2-harisokn@amazon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013185603.1347265-1-harisokn@amazon.com>
References: <20261013185603.1347265-1-harisokn@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.187.170.30]
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_195633_452900_2803B461 
X-CRM114-Status: GOOD (  13.46  )
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

__perf_pmu_remove() walks the group leaders of a CPU and PMU with
perf_event_groups_for_cpu_pmu(), removing each one as it goes.
perf_remove_from_context() takes the leader out of the groups rbtree,
after which rb_next() on that node returns NULL, prematurely ending the
walk. Other groups stay behind in the source context.

On CPU hotplug, they are then torn down with the dying CPU. They keep
running until teardown, while the PMU's interrupt and migrated events
are on a new CPU, which drivers rely on never happening.

Walk ctx->event_list instead and pick out the PMU's events by their
pmu_ctx.

Fixes: bd2756811766 ("perf: Rewrite core context handling")
Signed-off-by: Haris Okanovic <harisokn@amazon.com>
---
 kernel/events/core.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 7846d70be57f6..7caba4d528301 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -14394,23 +14394,18 @@ perf_event_create_kernel_counter(struct perf_event_attr *attr, int cpu,
 }
 EXPORT_SYMBOL_GPL(perf_event_create_kernel_counter);
 
-static void __perf_pmu_remove(struct perf_event_context *ctx,
-			      int cpu, struct pmu *pmu,
-			      struct perf_event_groups *groups,
+static void __perf_pmu_remove(struct perf_event_context *ctx, struct pmu *pmu,
 			      struct list_head *events)
 {
-	struct perf_event *event, *sibling;
+	struct perf_event *event, *tmp;
+
+	list_for_each_entry_safe(event, tmp, &ctx->event_list, event_entry) {
+		if (event->pmu_ctx->pmu != pmu)
+			continue;
 
-	perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu) {
 		perf_remove_from_context(event, 0);
 		put_pmu_ctx(event->pmu_ctx);
 		list_add(&event->migrate_entry, events);
-
-		for_each_sibling_event(sibling, event) {
-			perf_remove_from_context(sibling, 0);
-			put_pmu_ctx(sibling->pmu_ctx);
-			list_add(&sibling->migrate_entry, events);
-		}
 	}
 }
 
@@ -14486,8 +14481,7 @@ void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu)
 	 */
 	mutex_lock_double(&src_ctx->mutex, &dst_ctx->mutex);
 
-	__perf_pmu_remove(src_ctx, src_cpu, pmu, &src_ctx->pinned_groups, &events);
-	__perf_pmu_remove(src_ctx, src_cpu, pmu, &src_ctx->flexible_groups, &events);
+	__perf_pmu_remove(src_ctx, pmu, &events);
 
 	if (!list_empty(&events)) {
 		/*
-- 
Haris Okanovic
AWS Graviton


