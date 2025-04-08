Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C53CC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3il7lZ7NV+i8uHyNhjDA+1oWEheFMkyVCCeRZLCDFI=; b=cmFbsgcaxZcNbuqUqzjV/Au7lT
	d/GhysIXQkh6LJ5ZHOR1++Gwtz51GjFsUryutnOSe5eYgVKpcCZEiyHHtGJKOqNFDocRKCk2mNb1v
	afJ61HcvxE4HO8gMLkhMO6UKFa5nZbVVHueRDu0SOqJYwIFA17+sti+7UyAOnf55QXMrv4ZOssYiL
	WsDlh5ETGPVjZP09YXdrNuF4hYb3Y5T+jn6vPs3EHbg0vzdizYN3MvJNC35ZcJ5eHeFJSyKJS8f6b
	YSONKOZzeHC4hkd0K5+mVNiMz96cqo6bTuSHMCjY1T2tyVuayrgDbhd7qSVvGBwvbpCehkG8Z073R
	YMRnAEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Cv2-00000005020-1390;
	Tue, 08 Apr 2025 17:39:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2CYl-00000004wjt-3ysW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 17:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=V3il7lZ7NV+i8uHyNhjDA+1oWEheFMkyVCCeRZLCDFI=; b=lnGgRItWF5dDF82kd46WtIno+p
	Nez0NcBaipa+jWRTifhdpRTgsUZF1FhIe4Fono31X+sjQgrBcOoeXmNGW0maMW2bsxI/r2PiF28f4
	zhLc9rSlhQ6hDOKh12ht98rEWDoObC/qrygR1jmqVxyShyQLy3WxvQ3u2LVNMCfZCvtj7kr+QGPbL
	1Mj8jnZsE2ElA5sSZRhomoXwMXmDfNsrRgLnf49P1ivIVWRYMInM9LOhBKwBVjddY2KbDahbIx9Ox
	FfCxrXLP9rS2MEiV/Wm4Tw8GS+hHamlOTa32oDxOiN9Da3Fwlg2qQstc26BSum+W5zj7Wn8/gAWFe
	5YiFfe4Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2CYg-00000008LcY-4BxK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 17:16:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0062A1688;
	Tue,  8 Apr 2025 10:16:23 -0700 (PDT)
Received: from e128066.cambridge.arm.com (e128066.cambridge.arm.com [10.1.26.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EA4F3F59E;
	Tue,  8 Apr 2025 10:16:18 -0700 (PDT)
From: mark.barnett@arm.com
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	irogers@google.com
Cc: ben.gainey@arm.com,
	deepak.surti@arm.com,
	ak@linux.intel.com,
	will@kernel.org,
	james.clark@arm.com,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Barnett <mark.barnett@arm.com>
Subject: [PATCH v4 3/5] perf: Allow adding fixed random jitter to the sampling period
Date: Tue,  8 Apr 2025 18:15:28 +0100
Message-Id: <20250408171530.140858-4-mark.barnett@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408171530.140858-1-mark.barnett@arm.com>
References: <20250408171530.140858-1-mark.barnett@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_181623_437652_9B6EB88B 
X-CRM114-Status: GOOD (  16.50  )
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

From: Ben Gainey <ben.gainey@arm.com>

This change modifies the core perf overflow handler, adding some small
random jitter to each sample period when the high-frequency sample
period is in use. A new flag is added to perf_event_attr to opt into
this behaviour.

This change follows the discussion in [1], where it is recognized that it
may be possible for certain patterns of execution to end up with biased
results.

[1] https://lore.kernel.org/linux-perf-users/Zc24eLqZycmIg3d2@tassilo/

Signed-off-by: Ben Gainey <ben.gainey@arm.com>
Signed-off-by: Mark Barnett <mark.barnett@arm.com>
---
 include/linux/perf_event.h |  1 +
 kernel/events/core.c       | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index be006965054e..78a6fd14b412 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -233,6 +233,7 @@ struct hw_perf_event {
 
 #define PERF_SPS_HF_ON			0x00000001
 #define PERF_SPS_HF_SAMPLE		0x00000002
+#define PERF_SPS_HF_RAND		0x00000004
 	u32				sample_period_state;
 
 	/*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 5752ac7408b1..bc6991a33048 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -56,6 +56,7 @@
 #include <linux/buildid.h>
 #include <linux/task_work.h>
 #include <linux/percpu-rwsem.h>
+#include <linux/prandom.h>
 
 #include "internal.h"
 
@@ -472,6 +473,8 @@ static int perf_sample_period_ns __read_mostly	= DEFAULT_SAMPLE_PERIOD_NS;
 static int perf_sample_allowed_ns __read_mostly =
 	DEFAULT_SAMPLE_PERIOD_NS * DEFAULT_CPU_TIME_MAX_PERCENT / 100;
 
+static DEFINE_PER_CPU(struct rnd_state, sample_period_jitter_rnd);
+
 static void update_perf_cpu_limits(void)
 {
 	u64 tmp = perf_sample_period_ns;
@@ -10224,6 +10227,19 @@ static int __perf_event_overflow(struct perf_event *event,
 	 *
 	 * By ignoring the HF samples, we measure the actual period.
 	 */
+
+	/*
+	 * Apply optional jitter to the overall sample period
+	 */
+	if (hwc->sample_period_state & PERF_SPS_HF_RAND
+			&& !(hwc->sample_period_state & PERF_SPS_HF_SAMPLE)) {
+		struct rnd_state *state = &get_cpu_var(sample_period_jitter_rnd);
+		u64 rand_period = 1 << event->attr.hf_sample_rand;
+
+		sample_period -= rand_period / 2;
+		sample_period += prandom_u32_state(state) & (rand_period - 1);
+	}
+
 	if (hwc->sample_period_state & PERF_SPS_HF_ON) {
 		u64 hf_sample_period = event->attr.hf_sample_period;
 
@@ -12756,6 +12772,14 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	if (attr->hf_sample_period)
 		hwc->sample_period_state |= PERF_SPS_HF_ON;
 
+	if (attr->hf_sample_rand) {
+		/* high-frequency jitter is only valid with a high-freq period */
+		if (!attr->hf_sample_period)
+			return ERR_PTR(-EINVAL);
+
+		hwc->sample_period_state |= PERF_SPS_HF_RAND;
+	}
+
 	/*
 	 * Disallow uncore-task events. Similarly, disallow uncore-cgroup
 	 * events (they don't make sense as the cgroup will be different
@@ -14367,6 +14391,7 @@ static void __init perf_event_init_all_cpus(void)
 	zalloc_cpumask_var(&perf_online_pkg_mask, GFP_KERNEL);
 	zalloc_cpumask_var(&perf_online_sys_mask, GFP_KERNEL);
 
+	prandom_seed_full_state(&sample_period_jitter_rnd);
 
 	for_each_possible_cpu(cpu) {
 		swhash = &per_cpu(swevent_htable, cpu);
@@ -14384,6 +14409,7 @@ static void __init perf_event_init_all_cpus(void)
 		cpuctx->online = cpumask_test_cpu(cpu, perf_online_mask);
 		cpuctx->heap_size = ARRAY_SIZE(cpuctx->heap_default);
 		cpuctx->heap = cpuctx->heap_default;
+
 	}
 }
 
-- 
2.43.0


