Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F6CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYFCgT6cpR7Silc59cpTw07o4CL5oWOoqepjbVycthA=; b=Wqf85Yu0O2+CHDNS2uyAoruEY4
	ZQsLwvYX4lqdBSPaGuDNpEx6ebR3b3KoK5RenDYLPGXCXafvyBXB1RfuOty5KqaR9eeZY0meLGxuA
	QbPoI0mhF8qwGrSAvm9Sfx1sJ3nygVviu0Fi68TVVaPHrQwpnv7K7fMxXtT5GgqgUSz03zOGBYPrQ
	vEV4qWqfLmHaMZUfcV1ITpKFfEhNuyIr8hkDyJcxNhV8dQy7PVBwvl3o+XSdgs/IKPHRObKw8MaI4
	l3h/catosjlS9C21ksszGc14yJgGjTGmICBdk0agt13asIAgdiUbqsFk6zJoJdSaddQi2zgtzvbT0
	vcVHPD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPX-00000007Hn7-49NZ;
	Tue, 15 Sep 2026 15:49:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPJ-00000007Hgo-1Uen
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 491A81570;
	Tue, 15 Sep 2026 08:49:13 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8044F3F882;
	Tue, 15 Sep 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487356; bh=rzWBLuFeZQZl5yGb8RvJIlMSZz68zKpAICaDgrSBzSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eKLnsiclKicDCoZ/rB/R70y+EO9DbIexlf1O6Yb10Rv6CSilSlHAE9thwIc2HNElB
	 GoQBWpcBrUfJI+2VVbWemVQF8CA1uJ0t/fcAlO20lzPIZmU0MOG61mgK2i5oHB7x+B
	 hwntAJCW+bFowVKylN+sB+Rjd23zFqkGvfnHFDmM=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:51 +0100
Subject: [PATCH 05/25] coresight: perf: Extract AUX buffer update helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-5-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=4787;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rzWBLuFeZQZl5yGb8RvJIlMSZz68zKpAICaDgrSBzSA=;
 b=4HBcAcKHFe4Z45oSwhpAFqSLMoJr0D0hTz0E5G75YK2+UArFHFbpBZA1FUqME1bRFZPloWGo9
 wkUxKZvL/XuBdi3wav+Q9KeF+huvfDnz/ePbY8xjDF62bWATD2CQMb0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084920_919605_193C9C36 
X-CRM114-Status: GOOD (  23.14  )
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

The pause and stop callbacks duplicate the sequence that updates a sink
buffer and finishes the current AUX output transaction. Move the common
sequence into etm_event_update_buffer() for a single implementation.

The helper first verifies that perf handle is active. It updates the
buffer when PERF_EF_UPDATE is requested and otherwise ends the
transaction without data. The pause callback can then start a new perf
handle for resuming trace.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 89 ++++++++++--------------
 1 file changed, 36 insertions(+), 53 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index a45f69f39f175f3044322b25fe5413fb97154496..13d865ca86f1161b2e21174f096473c4829afc8c 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -637,6 +637,38 @@ static void etm_event_start(struct perf_event *event, int flags)
 	return;
 }
 
+static void etm_event_update_buffer(struct perf_output_handle *handle,
+				    struct etm_event_data *event_data,
+				    struct coresight_device *sink,
+				    int mode)
+{
+	unsigned long size;
+
+	/*
+	 * Make sure the handle is still valid, as the sink may close it from
+	 * the IRQ handler. E.g., the sink driver may fail to restart the
+	 * handle during interrupt handling due to insufficient buffer space.
+	 * The sink driver must serialize update_buffer() with IRQ handling,
+	 * so this should return either a valid handle with a valid size
+	 * (which may be 0), or no handle at all.
+	 */
+	if (!perf_get_aux(handle))
+		return;
+
+	if (!sink_ops(sink)->update_buffer)
+		goto out;
+
+	if (mode & PERF_EF_UPDATE) {
+		size = sink_ops(sink)->update_buffer(sink, handle,
+						     event_data->snk_config);
+		perf_aux_output_end(handle, size);
+		return;
+	}
+
+out:
+	perf_aux_output_end(handle, 0);
+}
+
 static void etm_event_pause(struct coresight_path *path,
 			    struct perf_event *event,
 			    struct etm_ctxt *ctxt)
@@ -644,7 +676,6 @@ static void etm_event_pause(struct coresight_path *path,
 	struct perf_output_handle *handle = &ctxt->handle;
 	struct coresight_device *source, *sink;
 	struct etm_event_data *event_data;
-	unsigned long size;
 
 	if (!path)
 		return;
@@ -669,27 +700,16 @@ static void etm_event_pause(struct coresight_path *path,
 	if (WARN_ON_ONCE(handle->event != event))
 		return;
 
-	if (!sink_ops(sink)->update_buffer)
-		return;
-
 	event_data = READ_ONCE(ctxt->event_data);
-	size = sink_ops(sink)->update_buffer(sink, handle,
-					     event_data->snk_config);
-	if (READ_ONCE(handle->event)) {
-		if (!size)
-			return;
+	etm_event_update_buffer(handle, event_data, sink, PERF_EF_UPDATE);
 
-		perf_aux_output_end(handle, size);
-		perf_aux_output_begin(handle, event);
-	} else {
-		WARN_ON_ONCE(size);
-	}
+	/* Prepare the handle for resuming trace */
+	perf_aux_output_begin(handle, event);
 }
 
 static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
-	unsigned long size;
 	struct coresight_device *source, *sink;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
@@ -742,45 +762,8 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	/* tell the core */
 	event->hw.state = PERF_HES_STOPPED;
 
-	/*
-	 * If the handle is not bound to an event anymore
-	 * (e.g, the sink driver was unable to restart the
-	 * handle due to lack of buffer space), we don't
-	 * have to do anything here.
-	 */
-	if (!handle->event)
-		goto out;
-
-	if (mode & PERF_EF_UPDATE) {
-		if (WARN_ON_ONCE(handle->event != event))
-			goto out;
-
-		/* update trace information */
-		if (!sink_ops(sink)->update_buffer)
-			goto out;
+	etm_event_update_buffer(handle, event_data, sink, mode);
 
-		size = sink_ops(sink)->update_buffer(sink, handle,
-					      event_data->snk_config);
-		/*
-		 * Make sure the handle is still valid as the
-		 * sink could have closed it from an IRQ.
-		 * The sink driver must handle the race with
-		 * update_buffer() and IRQ. Thus either we
-		 * should get a valid handle and valid size
-		 * (which may be 0).
-		 *
-		 * But we should never get a non-zero size with
-		 * an invalid handle.
-		 */
-		if (READ_ONCE(handle->event))
-			perf_aux_output_end(handle, size);
-		else
-			WARN_ON(size);
-	} else {
-		perf_aux_output_end(handle, 0);
-	}
-
-out:
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
 }

-- 
2.34.1


