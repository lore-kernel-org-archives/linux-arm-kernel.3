Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5783FCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wg2zHGB5zztBBw+YwC6xPEqCyuBrIzgcAowaUGYZRs=; b=42r//nxLvfSC1d3WQ+7F1Hj/Hk
	B4vH+Ik45Ug25ozbM4RCCtKSzHDjt3wZPsYrDB9xm6oXlNDDBFlq0r3ZTWpYkHy3uDFPICVyl2ZcL
	UmeCC8AyFHqDiRex8fZLMLUaRYRNjZ9DVvCMovkKVRLmLXsnB57xIBvwJ74EhiJRZAgBJ8GczABTg
	xhblunkMdDd+VY211WoPt5TM2B/qYxG2F9+8LTj+fVQxw/TUKB1yHlnggw8XkMRwN3Au+2IOFtM3k
	yLZRcGoqLLIG7s/sbxNspkv5ClWz2mR9jtlrbX+HlSZEhrln6gJ5LLjXVJIw9sbxqHEknE14aMWAo
	7O95hRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYM-0000000DFjH-2FbQ;
	Mon, 11 May 2026 11:12:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY3-0000000DFLR-4C6j
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7wg2zHGB5zztBBw+YwC6xPEqCyuBrIzgcAowaUGYZRs=; b=glb/Zm3uKdjO+yxk/b3CwC/3V5
	8vkDn7XPjHBuhKQet+grdK7WP8HTusmqnANJHmUSGK/DBKEUZUDJy2XQFeBbZHqAu2PHCEzcGaGAI
	hRuDpXXLO8BgPt3SyXey4pWQBSNatzjvXi7wIfAS/qRkJbrPAWVtmJ9//iykrMk0Rmq6O/YRnv6zc
	gmg0Oo9QbfSVMkbpw6A14nnVLG1LQOor+COmGsrgnq3kysAJ/CPEk8PlOMSbl4jy5uMudiVyubP0s
	fA4R9LFYu2+LIL4wu5fq32RnCSMBTrkpjnQzdF/meTMRUnUIzptNSPwpw30OBP02UwO0qfzU8HtbZ
	vUNZ4F3g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXu-0000000BQiw-3XhW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C6521713;
	Mon, 11 May 2026 04:11:28 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FD373F85F;
	Mon, 11 May 2026 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497893; bh=xRQYUNYKQ+7/fKvgqSDeqcRoxwhT/EIr/3uPsa7gG3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Axfj3bGfbqsf93dpHiZMT4NovHHmBaeqXW1RW+qWfPiuZ/Tu3wnBm8RvCprbsfKda
	 HKa2a95wFBT3elH9JDxDUCdxrbGnEOQCpBD8DW3fApger2tR4LXp6kfJH7Upxnv00s
	 XUWH5yxZZKh+hotaxnwkvg1OLzK6w2431t82mts8=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:54 +0100
Subject: [PATCH v12 10/28] coresight: Take per-CPU source reference during
 AUX setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-10-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=10743;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=xRQYUNYKQ+7/fKvgqSDeqcRoxwhT/EIr/3uPsa7gG3g=;
 b=ypLk7ieGjIHOhZP3r4kV5+qHBp6WabfbNXqPEMTYujCWvW/OrBCeC7OQwFaBtqYjxcOxjbpXb
 ietTzGuQMa+BwsSZZjcJHpFuLp8PJd2QLD+RDwZPt2bo6whlTsjwhPj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121137_138813_E4156DCF 
X-CRM114-Status: GOOD (  34.63  )
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

etm_setup_aux() fetches the per-CPU source pointer while preparing perf
AUX trace paths. This can race with CoreSight device unregistration, the
ETM device may has been released while the AUX setup still use it,
leading to use-after-free.

Move per-CPU path construction into etm_event_build_path() and use
the coresight_{get|put}_percpu_source_ref() pairs to take and drop
the device references, this ensures the device is safe to access during
path construction.

Update comments accordingly. Document a PREEMPT_RT corner case: the
put_device() may release resources while coresight_dev_lock (a raw
spinlock) is held, and the release may attempt to acquire a spinlock
that becomes sleepable under PREEMPT_RT. This will be fixed in the
future.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     |  38 +++++-
 drivers/hwtracing/coresight/coresight-etm-perf.c | 157 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-priv.h     |   3 +-
 3 files changed, 129 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index c2a290903cbf416651e7ec7057a1ee0b36bb6a8b..b8d9a457458018a776c716341966824eb5080143 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -109,13 +109,47 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
 	per_cpu(csdev_source, csdev->cpu) = NULL;
 }
 
-struct coresight_device *coresight_get_percpu_source(int cpu)
+struct coresight_device *coresight_get_percpu_source_ref(int cpu)
 {
+	struct coresight_device *csdev;
+
 	if (WARN_ON(cpu < 0))
 		return NULL;
 
 	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
-	return per_cpu(csdev_source, cpu);
+
+	csdev = per_cpu(csdev_source, cpu);
+	if (!csdev)
+		return NULL;
+
+	/*
+	 * Holding a reference to the csdev->dev ensures that the
+	 * coresight_device is live for the caller. The path building
+	 * logic can safely either build a path to the sink or fail
+	 * if the device is being unregistered (if there was a race).
+	 * The caller can skip the "source" device, if no path could
+	 * be built.
+	 */
+	get_device(&csdev->dev);
+
+	return csdev;
+}
+
+void coresight_put_percpu_source_ref(struct coresight_device *csdev)
+{
+	if (!csdev || !coresight_is_percpu_source(csdev))
+		return;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+
+	/*
+	 * TODO: coresight_device_release() is invoked to release resources when
+	 * the device's refcount reaches zero. It then calls free_percpu(),
+	 * which acquires pcpu_lock — a sleepable lock when PREEMPT_RT is
+	 * enabled. Since the raw spinlock coresight_dev_lock is held, this can
+	 * lead to a potential "scheduling while atomic" issue.
+	 */
+	put_device(&csdev->dev);
 }
 
 struct coresight_device *coresight_get_source(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index b9891c8ac078d99fc2180c858dc56b1e7dbec2d9..e416d2717a99aa3b573f8e53adec19518851d635 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -343,6 +343,85 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 	return path;
 }
 
+static struct coresight_path *
+etm_event_build_path(struct perf_event *event, int cpu,
+		     struct coresight_device *user_sink,
+		     struct coresight_device *match_sink)
+{
+	struct coresight_path *path = NULL;
+	struct coresight_device *source, *sink;
+
+	source = coresight_get_percpu_source_ref(cpu);
+
+	/*
+	 * If there is no ETM associated with this CPU or ever we try to trace
+	 * on this CPU, we handle it accordingly.
+	 */
+	if (!source)
+		return NULL;
+
+	/*
+	 * If AUX pause feature is enabled but the ETM driver does not
+	 * support the operations, skip for this source.
+	 */
+	if (event->attr.aux_start_paused &&
+	    (!source_ops(source)->pause_perf ||
+	     !source_ops(source)->resume_perf)) {
+		dev_err_once(&source->dev, "AUX pause is not supported.\n");
+		goto out;
+	}
+
+	/* If sink has been specified by user, directly use it */
+	if (user_sink) {
+		sink = user_sink;
+	} else {
+		/*
+		 * No sink provided - look for a default sink for all the ETMs,
+		 * where this event can be scheduled.
+		 *
+		 * We allocate the sink specific buffers only once for this
+		 * event. If the ETMs have different default sink devices, we
+		 * can only use a single "type" of sink as the event can carry
+		 * only one sink specific buffer. Thus we have to make sure
+		 * that the sinks are of the same type and driven by the same
+		 * driver, as the one we allocate the buffer for. We don't
+		 * trace on a CPU if the sink is not compatible.
+		 */
+
+		/* Find the default sink for this ETM */
+		sink = coresight_find_default_sink(source);
+		if (!sink)
+			goto out;
+
+		/* Check if this sink compatible with the last sink */
+		if (match_sink && !sinks_compatible(match_sink, sink))
+			goto out;
+	}
+
+	/*
+	 * Building a path doesn't enable it, it simply builds a
+	 * list of devices from source to sink that can be
+	 * referenced later when the path is actually needed.
+	 */
+	path = coresight_build_path(source, sink);
+	if (IS_ERR(path))
+		goto out;
+
+	/* ensure we can allocate a trace ID for this CPU */
+	coresight_path_assign_trace_id(path, CS_MODE_PERF);
+	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
+		coresight_release_path(path);
+		path = NULL;
+		goto out;
+	}
+
+	coresight_trace_id_perf_start(&sink->perf_sink_id_map);
+
+out:
+	coresight_put_percpu_source_ref(source);
+	return IS_ERR_OR_NULL(path) ? NULL : path;
+}
+
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
@@ -350,7 +429,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
-	struct coresight_device *user_sink = NULL, *last_sink = NULL;
+	struct coresight_device *user_sink = NULL;
 	struct etm_event_data *event_data = NULL;
 
 	event_data = alloc_event_data(cpu);
@@ -382,80 +461,26 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	 */
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
-		struct coresight_device *csdev;
 
-		csdev = coresight_get_percpu_source(cpu);
-		/*
-		 * If there is no ETM associated with this CPU clear it from
-		 * the mask and continue with the rest. If ever we try to trace
-		 * on this CPU, we handle it accordingly.
-		 */
-		if (!csdev) {
+		path = etm_event_build_path(event, cpu, user_sink, sink);
+		if (!path) {
+			/*
+			 * Failed to create a path for the CPU, clear it from
+			 * the mask and continue to next one.
+			 */
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
 
-		/*
-		 * If AUX pause feature is enabled but the ETM driver does not
-		 * support the operations, clear this CPU from the mask and
-		 * continue to next one.
-		 */
-		if (event->attr.aux_start_paused &&
-		    (!source_ops(csdev)->pause_perf || !source_ops(csdev)->resume_perf)) {
-			dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
-			cpumask_clear_cpu(cpu, mask);
-			continue;
-		}
 
 		/*
-		 * No sink provided - look for a default sink for all the ETMs,
-		 * where this event can be scheduled.
-		 * We allocate the sink specific buffers only once for this
-		 * event. If the ETMs have different default sink devices, we
-		 * can only use a single "type" of sink as the event can carry
-		 * only one sink specific buffer. Thus we have to make sure
-		 * that the sinks are of the same type and driven by the same
-		 * driver, as the one we allocate the buffer for. As such
-		 * we choose the first sink and check if the remaining ETMs
-		 * have a compatible default sink. We don't trace on a CPU
-		 * if the sink is not compatible.
-		 */
-		if (!user_sink) {
-			/* Find the default sink for this ETM */
-			sink = coresight_find_default_sink(csdev);
-			if (!sink) {
-				cpumask_clear_cpu(cpu, mask);
-				continue;
-			}
-
-			/* Check if this sink compatible with the last sink */
-			if (last_sink && !sinks_compatible(last_sink, sink)) {
-				cpumask_clear_cpu(cpu, mask);
-				continue;
-			}
-			last_sink = sink;
-		}
-
-		/*
-		 * Building a path doesn't enable it, it simply builds a
-		 * list of devices from source to sink that can be
-		 * referenced later when the path is actually needed.
+		 * The first found sink is saved here and passed to
+		 * etm_event_build_path() to check whether the remaining ETMs
+		 * have a compatible default sink.
 		 */
-		path = coresight_build_path(csdev, sink);
-		if (IS_ERR(path)) {
-			cpumask_clear_cpu(cpu, mask);
-			continue;
-		}
-
-		/* ensure we can allocate a trace ID for this CPU */
-		coresight_path_assign_trace_id(path, CS_MODE_PERF);
-		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
-			cpumask_clear_cpu(cpu, mask);
-			coresight_release_path(path);
-			continue;
-		}
+		if (!user_sink && !sink)
+			sink = coresight_get_sink(path);
 
-		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
 		*etm_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 7ce79fa36232bb1b0af768423777bab27cacee95..a1aab67e23db7fdea5139100312b3eb7cd31df51 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,7 +249,8 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_source(struct coresight_path *path);
-struct coresight_device *coresight_get_percpu_source(int cpu);
+struct coresight_device *coresight_get_percpu_source_ref(int cpu);
+void coresight_put_percpu_source_ref(struct coresight_device *csdev);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);

-- 
2.34.1


