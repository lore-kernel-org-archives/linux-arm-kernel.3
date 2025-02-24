Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C72C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZwLU+r/bpzuuexUx/f17H1dOMQb6Dmb1357PlWuMVI=; b=jtnreyq2pbMo81UAiZCdtznWTh
	Jv+h4gW/fAs4+CsHDerXF0gAOJKhUmoSFIpvhRZsQzv3uwbv0ErerhIuXoZz7NLuFijCJFKckGVZb
	Bd+nCpRgn73IWxaDwcHQAALrv0hIdUMstFXit7icHGYNTihQKIgpCZnN5k2fMLNQ/Hj/f8djI3HRI
	hOj8AjEFruMKC/JM5GRQvpX9XXjCd8rB7hb7OIPfl56wDMLcYHNEycT8InbHI9TDT8nQQtrKT7ELB
	2pKR9FfjOzjutrBVOvOgVwoZCxQt4XPY2eUXKxo+jodUEEEYCo7KSNV5ELlqu1CP1B0WHtDzBtp3b
	vmUa+otw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaQR-0000000EHxm-2c74;
	Mon, 24 Feb 2025 15:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaAc-0000000EFGc-1cCs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 15:14:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B87E26AC;
	Mon, 24 Feb 2025 07:15:12 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABBE43F6A8;
	Mon, 24 Feb 2025 07:14:53 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 6/8] coresight: perf: Update buffer on AUX pause
Date: Mon, 24 Feb 2025 15:14:21 +0000
Message-Id: <20250224151423.1630639-7-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224151423.1630639-1-leo.yan@arm.com>
References: <20250224151423.1630639-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_071458_472345_7638F491 
X-CRM114-Status: GOOD (  15.52  )
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

Due to sinks like ETR and ETB don't support interrupt handling, the
hardware trace data might be lost for continuous running tasks.

This commit takes advantage of the AUX pause for updating trace buffer
to mitigate the trace data losing issue.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../hwtracing/coresight/coresight-etm-perf.c  | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index d759663a1f7d..667110429de9 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -594,14 +594,48 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 }
 
-static void etm_event_pause(struct coresight_device *csdev,
+static void etm_event_pause(struct perf_event *event,
+			    struct coresight_device *csdev,
 			    struct etm_ctxt *ctxt)
 {
+	int cpu = smp_processor_id();
+	struct coresight_device *sink;
+	struct perf_output_handle *handle = &ctxt->handle;
+	struct list_head *path;
+	unsigned long size;
+
 	if (!ctxt->event_data)
 		return;
 
 	/* Stop tracer */
 	coresight_pause_source(csdev);
+
+	/* Bail out if no need update buffer */
+	if (!ctxt->event_data->update_buf_on_pause)
+		return;
+
+	if (WARN_ON_ONCE(handle->event != event))
+		return;
+
+	path = etm_event_cpu_path(ctxt->event_data, cpu);
+	sink = coresight_get_sink(path);
+	if (WARN_ON_ONCE(!sink))
+		return;
+
+	if (!sink_ops(sink)->update_buffer)
+		return;
+
+	size = sink_ops(sink)->update_buffer(sink, handle,
+					     ctxt->event_data->snk_config);
+	if (READ_ONCE(handle->event)) {
+		if (!size)
+			return;
+
+		perf_aux_output_end(handle, size);
+		perf_aux_output_begin(handle, event);
+	} else {
+		WARN_ON_ONCE(size);
+	}
 }
 
 static void etm_event_stop(struct perf_event *event, int mode)
@@ -615,7 +649,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	struct list_head *path;
 
 	if (mode & PERF_EF_PAUSE)
-		return etm_event_pause(csdev, ctxt);
+		return etm_event_pause(event, csdev, ctxt);
 
 	/*
 	 * If we still have access to the event_data via handle,
-- 
2.34.1


