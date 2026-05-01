Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5253BCD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zuTc7JQh03mFlxTm37dw1uYxppERkg+E/t0qe9MrCk=; b=BoHXiuyelBnGpI06I1t2dS8R3C
	XQmrN9llLDNfsoS54DqVs0HRltygOhhvk/fz5lPqkdboeQNU/Ig2HRvaEYRQ38O2JyBAAg8/n9d5u
	znUcVhJLLZmL4/Z5dAv+QHhXpawLp/EQ/UnDPDwd6efBAQvwz9LzVgNgtgVz2ld6tpbB1+1+iUWQG
	87T7IfTwsgQfjXqfHRd4HkpFa+YFwDvQnLptP3x2oZfxgN8cnX5mIRXmnel1CQKnyhWkeK5zhX1BR
	REDkSA8dAZdOIcWyVw8WsdSeNtBWsMp/nqbNIWACktdYbvUlhMDd5CN1+vAEp9aRyhdMHu0YZvKak
	3JPF/GJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2d-00000007RDP-33bI;
	Fri, 01 May 2026 16:48:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2c-00000007RBF-2kJi
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/zuTc7JQh03mFlxTm37dw1uYxppERkg+E/t0qe9MrCk=; b=rPLyzS2Cbn1L+l2TCS7Qhg4bwQ
	5juZnGZh9YzMPkZpXIWPvTkleRfrprJarSbgOJot4JohXKfxW9PSLKSPLKhdpJmjFR8/znKf3Kv8k
	Jp4AVu+KyfpsmIPjgSPFNRC0oaVFkp9/Fa/CEWxtI31EswuAkTTS0aRtJBbRClqTSI66ZzSkyb7VF
	qlJtDFl1sVlT8SgZv2vORDI6YvAOJTfdYvkli3MP1av8g7L7z8utAXo2VsIe4h+4Ru6+WVRUVPIdI
	T2ARS6XPtexou3kq++D+YlLxG6pK2FMPKuwnvqzeWgO9UWvfECxcWyXLKGB+TEE210aHeVhXDbwsG
	lqd0340Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr2Z-00000009Az1-1Apv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:48:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB2291692;
	Fri,  1 May 2026 09:48:28 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB0ED3F7B4;
	Fri,  1 May 2026 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654114; bh=u6JZ9JeOC4agzoHakr05yAO5hMwOt1aCJWoeOG/Zy5M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A6RC+aZ5t2FYDlyIFpPyQ+0aK4fWkBEOB2nRbI/Ad+wPg/Za2fTGfDnhUYrxBrUwA
	 rrUZcHv3gmmc5YckVUie/NJkWAE87G9E0MRn2s6nHJnQU7D34HIHxI/+wckz2Sax2Q
	 KFelnEuhzUwWB9pbN0JZ09xwrHMvPsFHkbxZOOGo=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:47:50 +0100
Subject: [PATCH v11 09/27] coresight: Grab per-CPU source device during AUX
 setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-9-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654085; l=9804;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=u6JZ9JeOC4agzoHakr05yAO5hMwOt1aCJWoeOG/Zy5M=;
 b=PjHLLr0h0ZRl8eFw5UKBO2YO2MMMF0HzEPXDU87yWsKrK5ux8bgQn/y3VlwW9xRr7ka6QWerQ
 YpSnTxzdCTACgJColdhDRSoNB8YK15wPm4xrYQBFYF/0JRQeMNPlUg9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174835_667944_4A51B6CC 
X-CRM114-Status: GOOD (  35.10  )
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

etm_setup_aux() may access a per-CPU source device while ETM module is
being unloaded, leading to a potential use-after-free.

Therefore, this commit takes references to the device, which is
sufficient to prevent the csdev from being released. This ensures that
csdev can be safely accessed.

Refactor the perf path build code into etm_event_build_path(), making
it easier to use the coresight_{get|put}_percpu_source_ref() pairs.
Update the comments accordingly to reflect the new flow.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     |  29 ++++-
 drivers/hwtracing/coresight/coresight-etm-perf.c | 157 +++++++++++++----------
 drivers/hwtracing/coresight/coresight-priv.h     |   3 +-
 3 files changed, 120 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 6da15f2ef9dc9770e7aa79cc94a7ed3d2f3ad871..b01e63fbbb4b990d4f5ec61c8fa4da63dd59a4b9 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -109,13 +109,38 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
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
+	/* Make sure csdev is safe to access */
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
+	 * When the device's refcount reaches zero, coresight_device_release()
+	 * is invoked. This is safe even in atomic context, as the release
+	 * function does not sleep.
+	 */
+	put_device(&csdev->dev);
 }
 
 struct coresight_device *coresight_get_source(struct coresight_path *path)
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index d3b13ef130439fd501f88395d0de9dd21b84b827..9950ad481f29eed3bfac8fe4ae3a593b53830617 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -338,6 +338,85 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
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
@@ -345,7 +424,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
-	struct coresight_device *user_sink = NULL, *last_sink = NULL;
+	struct coresight_device *user_sink = NULL;
 	struct etm_event_data *event_data = NULL;
 
 	event_data = alloc_event_data(cpu);
@@ -377,80 +456,26 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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


