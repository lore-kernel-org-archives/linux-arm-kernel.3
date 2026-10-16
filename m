Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A893CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5pbw+EjYsPXTQHFedZbkGufrex07JrCC4mJKBhxDf0=; b=NRSjDQUN6fIsH5xvBspqS2NUA/
	XpTQN2whT7gp/ozWxz3Iv4KZVQtkeaTV2Q2MV1EEDAugp2lLxe6mx/It/uNNhONpeKpXBiluEB1SM
	4EiWVdoRpgfAXEi6+58gJlmSbkLl3b26vqHIL7zjUu0BYZwTuohVa5miU+3ky9RR5fI8DF1mRm5WV
	PVkmX65FdDnoGUroJr5+PuDJtKp6HgQS/IILUxfhqMnzwwcyCGd8jfOO6FmVS4NhOE5p8GtZad+dL
	3jA6q2X8jt3wS42LGBGL8J5wXBaoHDJ3Cp5CroGksI+V/2EFZ6ko2Ap1zSt09EyfB8rkDEreFENXu
	tZJ1n69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSi-00000002hlh-49DF;
	Fri, 16 Oct 2026 10:46:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfSc-00000002hdv-1I1C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:46:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49ff680331aso33239445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 03:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147608; x=1792752408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g5pbw+EjYsPXTQHFedZbkGufrex07JrCC4mJKBhxDf0=;
        b=lBIVm0S+AmDVndSMKU43OQJfNty2ZgFwwtUPQx7axr8yJJt7+ZDceYS0OaD2h4pRHb
         srJfolvS7aaSicX2OBMUxf+fmREFzZglb3kyMxhxgNcu/mrYqe1wY2WnhVhpHLpNwz7B
         NBAdNnmQ3yuEOd6epkZ/IcYxEWOQeLZEKpfWupMNQbn6Okp9fDppHrnbdWhYGX1BRFXj
         E1goPmGKskISmW8e8Fxpf9kHKO9Rxny1uIxGNiYty+gPxLFhOE1wNMbd5vLN7dNgEAXi
         /80AdZCoFmUGqG74WqsB2XON+2rNBzrRmUqGhg3q53GYVhnA+U+GDF7t4yMfLa8Xx25r
         9faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147608; x=1792752408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5pbw+EjYsPXTQHFedZbkGufrex07JrCC4mJKBhxDf0=;
        b=BD27Ec8lnhCY+YxxIoRazcdFbaP0Av91owVgNT7aGNyA6IHhdEumnnEhygyvuUTQzk
         V5Lv8uOBObsgWHDzs0D6+aPGAoT+YcoTMWl0dQd96Rp99HImvsXDLieOvW1rdQdf563d
         rcDnj1Jg2/jRZPNoO1eVQnIIViLgemKifZsNSy1yWJodVzMGukPn2HhMuskGwhQia1IA
         55U0YWkVIKt45im1up0iO1vKxJTViG0pLujLaOQIMI8RNxV0RZv7oal273yLe6j406W8
         pclGnrt4/vXkK1iGjJaGBIhKSGo1aguNuWkUzf4b5lH5Iro7xnL3jgbGTWjhxLemBulp
         kGeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMxSCCVg8JgS/STsKs6nEtoqZbiCrMc5o8JBjdebRZpmv0K0By28ybv96W+k4Klb4iXW15m0RP7+gGMcVBFRiH@lists.infradead.org
X-Gm-Message-State: AFq9FYJjWnMaJ0SudAqjnIv/VtvSjqMdfxRzOhdIfn+0wRDa+WOpckvB
	U8/mEYDUMMJDkNIw/G6auOdcp5ti+xYxRz5gUNPvvA9MeIsCE9jxFRfTx6BlAYM8Eww=
X-Gm-Gg: AYBFou2pJ8jUjZQOXQ2cCJxCwTPRdQ8Ec0UTJGCry3/I1hWtRIYlEVoES48QT3ZIXe5
	a2Nyu1JLDkE/P0PXFq0YL0DxE5F/VOzvT6M6dTk6GEkWdD1ssG5mLbxQRMOiV0S3uvTbsrHQwdL
	OPH7G2pQjEZpXs5HoMO1iynak/lssZX6sLzx+ptdoR3iZsKPv64RHFUDP6JSEIXuG6K2wNl7UMb
	lWkXlu0NfFQ2QLYXxZr0S1NmE1LATw+S3Bcayz4zkwS6adSHYFceEp+wwMU/DHoRFFwZZLLDTQV
	OkrP0DXirz8a5vHTGfYG8b+RNbufaLJsvy8Hyx0+8Is/7GnFDSAwqg2J8QVghJVo1+XEFZSYSiY
	NsCOTe97JUNsyGa0jCMMOPR0eD7pHidHP/RzQKnVdIbzSz89z2YzXqDBFRFpTViSHyrQ8mQ0PI/
	DuVuqUnthYCj27NSTfbxcceZxMDJBHc/88NWh1sJ+gzOXSpoZPOr5WWWVXSEwBGHD4+aa3PFMv1
	Q==
X-Received: by 2002:a05:600c:524a:b0:4a1:8824:c9ba with SMTP id 5b1f17b1804b1-4a18e49234fmr450919035e9.18.1792147606553;
        Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 16 Oct 2026 11:46:15 +0100
Subject: [PATCH v4 05/10] coresight: etm-perf: Prevent sink sharing at
 setup time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-james-cs-multiple-per-threads-v4-5-dedf961aca0e@linaro.org>
References: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
In-Reply-To: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_034652_628513_74294EDA 
X-CRM114-Status: GOOD (  38.33  )
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

To simplify lower level code in individual sinks and make tracing more
deterministic, check for potential sharing at setup time. Sharing rules
are currently enforced after scheduling in the enable() callback, and
the user who was not allowed to trace silently drops trace. This isn't
ideal because there is no feedback and behaviour depends on scheduling
and the actions of other users. It seems to be have designed that way
because of a misunderstanding that multiple concurrent per-thread events
would be prevented by the perf core exclusive PMU rules, but they are
not.

This removes the use case that different users could successfully trace
together as long as they collaborate to ensure that their events aren't
scheduled concurrently, but in practice, all working use cases when
sinks are shared would be single user.  It also removes the use case
that one user could open multiple per-thread events, but this was
already broken and also not supported in Perf userspace decode. With
1:1 sink to ETRs, there is no change.

Sink sharing rules and ownership lifetimes are identical to the trace ID
map, so add owning PID into the ID map and re-use the same lock.
coresight_trace_id_perf_start() can then be made the place to gate
sharing and return -EBUSY when sharing rules prevent starting the
session.

Now that coresight_trace_id_perf_start() can fail, we might as well do
it before attempting to allocate traceIDs. This has the benefit of
making ID allocations deterministic during concurrent session activation
because another session that fails to claim the sink doesn't claim trace
IDs only to release them again and perturb the successful user.

Use the TGID of the mmap() caller to determine ownership.
event->owner may be NULL if the thread that did perf_event_open() has
exited, and using the thread group means that we now support sharing in
multithreaded use cases.

Walk the registered topology and save the single-source classification
when admitting the first session. Keep it until the last session ends,
and reject new sessions if the topology has gained sources while existing
sessions rely on private buffers.

Fixes: 880af782c6e8 ("coresight: tmc-etf: Add support for CPU-wide trace scenarios")
Fixes: 8d03cfd16a72 ("coresight: tmc-etr: Add support for CPU-wide trace scenarios")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c     | 62 +++++++++++++++
 drivers/hwtracing/coresight/coresight-etm-perf.c | 41 ++++++----
 drivers/hwtracing/coresight/coresight-priv.h     |  1 +
 drivers/hwtracing/coresight/coresight-trace-id.c | 97 +++++++++++++++++++++---
 drivers/hwtracing/coresight/coresight-trace-id.h | 26 +++++--
 include/linux/coresight.h                        | 26 +++++--
 6 files changed, 217 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a635c51c25ac..fe64c509bf67 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -50,6 +50,68 @@ struct coresight_node {
 	struct list_head link;
 };
 
+static int coresight_add_upstream_node(struct list_head *nodes,
+				       struct coresight_device *csdev)
+{
+	struct coresight_node *node;
+
+	list_for_each_entry(node, nodes, link)
+		if (node->csdev == csdev)
+			return 0;
+
+	node = kmalloc_obj(*node);
+	if (!node)
+		return -ENOMEM;
+
+	node->csdev = csdev;
+	list_add_tail(&node->link, nodes);
+	return 0;
+}
+
+/* Count registered CPU sources, ignoring source filters. */
+int coresight_count_cpu_sources(struct coresight_device *csdev)
+{
+	struct coresight_node *node, *tmp;
+	LIST_HEAD(nodes);
+	int i, ret, count = 0;
+
+	lockdep_assert_held(&coresight_mutex);
+
+	/* Per-CPU sinks have an implicit connection to their source. */
+	if (coresight_is_percpu_sink(csdev))
+		return 1;
+
+	ret = coresight_add_upstream_node(&nodes, csdev);
+	if (ret)
+		return ret;
+
+	/* Retain visited devices to handle converging paths and cycles. */
+	list_for_each_entry(node, &nodes, link) {
+		csdev = node->csdev;
+		if (coresight_is_percpu_source(csdev)) {
+			count++;
+			continue;
+		}
+
+		for (i = 0; i < csdev->pdata->nr_inconns; i++) {
+			struct coresight_connection *conn = csdev->pdata->in_conns[i];
+
+			if (!conn)
+				continue;
+			ret = coresight_add_upstream_node(&nodes, conn->src_dev);
+			if (ret)
+				goto out;
+		}
+	}
+
+out:
+	list_for_each_entry_safe(node, tmp, &nodes, link) {
+		list_del(&node->link);
+		kfree(node);
+	}
+	return ret ? ret : count;
+}
+
 /*
  * When losing synchronisation a new barrier packet needs to be inserted at the
  * beginning of the data collected in a buffer.  That way the decoder knows that
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index a9adf1cca7a8..5261061e4dd4 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -240,7 +240,7 @@ static void etm_free_aux(void *data)
 			 * a refcount is used so that the last event to call
 			 * coresight_trace_id_perf_stop() frees all IDs.
 			 */
-			coresight_trace_id_perf_stop(&sink->perf_sink_id_map);
+			coresight_trace_id_perf_stop(sink);
 
 			coresight_release_path(*ppath);
 		}
@@ -337,6 +337,7 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
 static int etm_event_build_path(struct perf_event *event, int cpu,
 				struct coresight_device *user_sink,
 				struct coresight_device *match_sink,
+				struct etm_event_data *event_data,
 				struct coresight_path **path)
 {
 	struct coresight_device *source, *sink;
@@ -358,7 +359,7 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 	     !source_ops(source)->resume_perf)) {
 		dev_err_once(&source->dev, "AUX pause is not supported.\n");
 		ret = -EINVAL;
-		goto out;
+		goto out_src;
 	}
 
 	/* If sink has been specified by user, directly use it */
@@ -381,11 +382,11 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 		/* Silently skip ETMs with no reachable sink loaded */
 		sink = coresight_find_default_sink(source);
 		if (!sink)
-			goto out;
+			goto out_src;
 
 		/* Silently skip sinks incompatible with the last sink. */
 		if (match_sink && !sinks_compatible(match_sink, sink))
-			goto out;
+			goto out_src;
 	}
 
 	/*
@@ -398,20 +399,27 @@ static int etm_event_build_path(struct perf_event *event, int cpu,
 		if (ret == -ENOENT)
 			ret = 0;
 		*path = NULL;
-		goto out;
+		goto out_src;
 	}
 
+	ret = coresight_trace_id_perf_start(sink, event, event_data);
+	if (ret)
+		goto out_path;
+
 	/* Reject whole event if we can't allocate a trace ID for this CPU */
 	ret = coresight_path_assign_trace_id(*path, CS_MODE_PERF);
-	if (ret) {
-		coresight_release_path_locked(*path);
-		*path = NULL;
-		goto out;
-	}
+	if (ret)
+		goto out_trace_id_started;
 
-	coresight_trace_id_perf_start(&sink->perf_sink_id_map);
+	coresight_put_percpu_source_ref(source);
+	return 0;
 
-out:
+out_trace_id_started:
+	coresight_trace_id_perf_stop(sink);
+out_path:
+	coresight_release_path_locked(*path);
+	*path = NULL;
+out_src:
 	coresight_put_percpu_source_ref(source);
 	return ret;
 }
@@ -457,7 +465,14 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	for_each_cpu(cpu, mask) {
 		struct coresight_path *path;
 
-		if (etm_event_build_path(event, cpu, user_sink, sink, &path))
+		/*
+		 * Use event_data as the unique identifier for this event. Event
+		 * itself is not stable and there are some horrible edge cases
+		 * where it's freed and re-used while another event redirecting
+		 * to the same aux buffer keeps the sink allocation alive.
+		 */
+		if (etm_event_build_path(event, cpu, user_sink, sink,
+					 event_data, &path))
 			goto err;
 
 		if (!path) {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index edec5a7d2be3..51313fe2cd0e 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -14,6 +14,7 @@
 
 extern struct mutex coresight_mutex;
 extern const struct device_type coresight_dev_type[];
+int coresight_count_cpu_sources(struct coresight_device *csdev);
 
 /*
  * Coresight management registers (0xf00-0xfcc)
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.c b/drivers/hwtracing/coresight/coresight-trace-id.c
index 7ed337d54d3e..debc30d0de8f 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.c
+++ b/drivers/hwtracing/coresight/coresight-trace-id.c
@@ -7,9 +7,11 @@
 #include <linux/coresight-pmu.h>
 #include <linux/cpumask.h>
 #include <linux/kernel.h>
+#include <linux/sched/signal.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "coresight-priv.h"
 #include "coresight-trace-id.h"
 
 enum trace_id_flags {
@@ -128,14 +130,11 @@ static void coresight_trace_id_free(int id, struct coresight_trace_id_map *id_ma
  */
 static void coresight_trace_id_release_all(struct coresight_trace_id_map *id_map)
 {
-	unsigned long flags;
 	int cpu;
 
-	raw_spin_lock_irqsave(&id_map->lock, flags);
 	bitmap_zero(id_map->used_ids, CORESIGHT_TRACE_IDS_MAX);
 	for_each_possible_cpu(cpu)
 		atomic_set(per_cpu_ptr(id_map->cpu_map, cpu), 0);
-	raw_spin_unlock_irqrestore(&id_map->lock, flags);
 	DUMP_ID_MAP(id_map);
 }
 
@@ -284,17 +283,95 @@ void coresight_trace_id_put_system_id(int id)
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_put_system_id);
 
-void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map)
+int coresight_trace_id_perf_start(struct coresight_device *sink,
+				  struct perf_event *event,
+				  struct etm_event_data *event_data)
 {
-	atomic_inc(&id_map->perf_cs_etm_session_active);
-	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
+	struct coresight_perf_session_id *session = &sink->perf_sink_id_map.session;
+	struct coresight_trace_id_map *id_map = &sink->perf_sink_id_map;
+	bool migratable = event->cpu == -1;
+	int nr_sources;
+
+	/* The caller holds coresight_mutex through path building and admission. */
+	nr_sources = coresight_count_cpu_sources(sink);
+	if (nr_sources < 0)
+		return nr_sources;
+
+	guard(raw_spinlock)(&id_map->lock);
+
+	if (!session->refcount) {
+		session->single_source = nr_sources == 1;
+	} else if (session->single_source && nr_sources != 1) {
+		/* Existing sessions relied on this sink having only one source. */
+		return -EBUSY;
+	}
+
+	/*
+	 * In addition to the Perf core exclusive PMU rules, prevent disjointed
+	 * sessions when sinks may shared. The following restrictions simplify
+	 * ETR buffer management so we don't have to support
+	 * per-thread/migratable bounce buffers moving to other sinks while
+	 * still in use by other threads on the current sink. Not sharing
+	 * between migratable and non-migratable events also means that we can
+	 * assume a buffer is either always attached to a sink, or always
+	 * attached to an event.
+	 */
+	if (!session->single_source) {
+		/*
+		 * Use 'current' instead of event->owner because that's NULL if
+		 * a worker thread calls perf_event_open() and then exits before
+		 * mmap(). Also allow sink sharing between anyone in the thread
+		 * group to support multithreaded auxtrace mmap() calls.
+		 */
+		struct pid *this_pid = task_pid_type(current, PIDTYPE_TGID);
+
+		if (session->owner) {
+			/*
+			 * Prevent mixing event types per sink, regardless of
+			 * owner.
+			 */
+			if (!!session->migratable_event != migratable)
+				return -EBUSY;
+
+			/*
+			 * Limit migratable events to a single event per sink,
+			 * regardless of owner.
+			 */
+			if (migratable &&
+			    session->migratable_event != event_data)
+				return -EBUSY;
+
+			/* Share non migratable events between the same owner */
+			if (session->owner != this_pid)
+				return -EBUSY;
+		} else {
+			if (migratable)
+				session->migratable_event = event_data;
+			session->owner = get_pid(this_pid);
+		}
+	}
+
+	session->refcount++;
+	PERF_SESSION(session->refcount);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_start);
 
-void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map)
+void coresight_trace_id_perf_stop(struct coresight_device *sink)
 {
-	if (!atomic_dec_return(&id_map->perf_cs_etm_session_active))
-		coresight_trace_id_release_all(id_map);
-	PERF_SESSION(atomic_read(&id_map->perf_cs_etm_session_active));
+	struct coresight_perf_session_id *session = &sink->perf_sink_id_map.session;
+	struct coresight_trace_id_map *id_map = &sink->perf_sink_id_map;
+	struct pid *old_pid = NULL;
+
+	scoped_guard(raw_spinlock, &id_map->lock) {
+		if (--session->refcount <= 0) {
+			coresight_trace_id_release_all(id_map);
+			old_pid = session->owner;
+			id_map->session = (struct coresight_perf_session_id) {};
+		}
+		PERF_SESSION(session->refcount);
+	}
+
+	put_pid(old_pid);
 }
 EXPORT_SYMBOL_GPL(coresight_trace_id_perf_stop);
diff --git a/drivers/hwtracing/coresight/coresight-trace-id.h b/drivers/hwtracing/coresight/coresight-trace-id.h
index db68e1ec56b6..cd592b0e9076 100644
--- a/drivers/hwtracing/coresight/coresight-trace-id.h
+++ b/drivers/hwtracing/coresight/coresight-trace-id.h
@@ -139,21 +139,31 @@ void coresight_trace_id_put_system_id(int id);
 /**
  * Notify the Trace ID allocator that a perf session is starting.
  *
- * Increase the perf session reference count - called by perf when setting up a
- * trace event.
+ * Assign 'current' as the owner of the trace ID map and increment the session
+ * refcount.
  *
- * Perf sessions never free trace IDs to ensure that the ID associated with a
- * CPU cannot change during their and other's concurrent sessions. Instead,
- * this refcount is used so that the last event to finish always frees all IDs.
+ * The caller must hold coresight_mutex while checking the registered topology
+ * and admitting the session. The first session saves whether the sink has only
+ * one CPU source, and subsequent sessions retain that classification.
+ *
+ * Return 0 on success, -EBUSY if sharing rules don't permit this task to share
+ * the map, or -ENOMEM if walking the topology fails.
+ *
+ * Note: Perf sessions never free trace IDs to ensure that the ID associated
+ * with a CPU cannot change during their and other's concurrent sessions.
+ * Instead, this refcount is used so that the last event to finish always frees
+ * all IDs.
  */
-void coresight_trace_id_perf_start(struct coresight_trace_id_map *id_map);
+int coresight_trace_id_perf_start(struct coresight_device *sink,
+				  struct perf_event *event,
+				  struct etm_event_data *event_data);
 
 /**
  * Notify the ID allocator that a perf session is stopping.
  *
  * Decrease the perf session reference count. If this causes the count to go to
- * zero, then all Trace IDs will be released.
+ * zero, then all Trace IDs and owner PID will be released.
  */
-void coresight_trace_id_perf_stop(struct coresight_trace_id_map *id_map);
+void coresight_trace_id_perf_stop(struct coresight_device *sink);
 
 #endif /* _CORESIGHT_TRACE_ID_H */
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index edf2a2fc697c..e718580ea547 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -235,18 +235,34 @@ struct coresight_sysfs_link {
 /* architecturally we have 128 IDs some of which are reserved */
 #define CORESIGHT_TRACE_IDS_MAX 128
 
+/**
+ * Identification of the Perf owner of a trace ID map / sink
+ *
+ * @refcount:		Number of Perf sessions using this ID map.
+ * @single_source:	Sessions were admitted with only one upstream CPU source.
+ *			Kept unchanged until the last session releases the map.
+ * @owner:		PID that owns the active sessions.
+ * @migratable_event:	Unique pointer to identify the owning event if it's
+ *			migratable (event->cpu == -1).
+ */
+struct coresight_perf_session_id {
+	int refcount;
+	bool single_source;
+	struct pid *owner;
+	struct etm_event_data *migratable_event;
+};
+
 /**
  * Trace ID map.
  *
- * @used_ids:	Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
- *		Initialised so that the reserved IDs are permanently marked as
- *		in use.
- * @perf_cs_etm_session_active: Number of Perf sessions using this ID map.
+ * @used_ids:   Bitmap to register available (bit = 0) and in use (bit = 1) IDs.
+ *              Initialised so that the reserved IDs are permanently marked as
+ *              in use.
  */
 struct coresight_trace_id_map {
 	DECLARE_BITMAP(used_ids, CORESIGHT_TRACE_IDS_MAX);
 	atomic_t __percpu *cpu_map;
-	atomic_t perf_cs_etm_session_active;
+	struct coresight_perf_session_id session;
 	raw_spinlock_t lock;
 };
 

-- 
2.43.0


