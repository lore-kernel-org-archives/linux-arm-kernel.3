Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EADD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBaqgurvqpoVTICVOAncLQH0mYsFTxJHDpAlQtvbsJE=; b=NIISHuAhLm8m5zjltLGBI6I2I5
	Ob/FSTom0QiOAfWoiY0bSlKLq3YgdgpJxnZULvr9+jrAghCXgsXIYWDAUOwjO2GvSvJq8l1N3srjU
	mfzj8mr3FW0v5A+Pi0YayXfPcHs7EC9NcopMBuavUdktbDPpJX7/Ncg6NqGesEi6GBw8WbRYH0p5M
	2Npn7/7yGaG1PQrIpUh97eiVCsTTEjt/GKJxR8/nhfS1Ee/33L1ibj9cPMNRineWvpvpPytARI3sr
	tcQFc/96whSSyvy//1mZxxkSiQJyTHuicMQwyVSUc0mfjeasduAZy6J7c3buWadlFvwpsDKr9XLI6
	IJ8vxQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1zd-00000003RYy-2tTc;
	Mon, 01 Dec 2025 11:22:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1za-00000003RUR-2VMk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:22:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C18BD1595;
	Mon,  1 Dec 2025 03:22:45 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A157B3F59E;
	Mon,  1 Dec 2025 03:22:50 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 01 Dec 2025 11:22:06 +0000
Subject: [PATCH 16/19] coresight: trbe: Support trigger mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-trbe_buffer_refactor_v1-1-v1-16-7da32b076b28@arm.com>
References: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
In-Reply-To: <20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Tamas Petz <tamas.petz@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764588125; l=9993;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=zYJhpNe0EK769mhWSNYuRDSmTNRSyJS198EDuKt61lQ=;
 b=EHKqfO6SdCjRT/8ah8Z2CPX8+ZPjYj8MbsNsvZx2QAKpdc1Q/vgPVeGGUr67gPzXCTN8D7uVb
 6seRiq8uTzKDkHxA5KCSOu2LSMXRBPS1W1E2LGSM39R1ZKvzg++o0PX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_032254_741005_57D69974 
X-CRM114-Status: GOOD (  29.87  )
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

The buffer currently operates in fill mode, where tracing stops when it
reaches the end of the buffer and a maintenance interrupt is raised.
However, due to IRQ latency, trace data may be lost during the window in
which tracing is halted but the program continues to run.

To mitigate the issue, this commit enables the trigger count to support
buffer maintenance without disabling tracing.  This is fulfilled with
two modes:

1) Set a trigger count as a watermark and use fill mode to prevent the
   buffer from being overwritten.  Once the count is decremented to
   zero, an interrupt is raised for buffer maintenance, but the hardware
   continues collecting trace data until limit.

          head            watermark tail
     +----+---------------+---------+-------+
     |$$$$|               |         |$$$$$$$|
     +----+---------------+---------+-------+
     base `---- count ----'         limit   base + nr_pages

     $$$ : Filled trace data

2) Use wrap mode so that tracing continues when reach the top of the
   buffer.  The trigger count is configured as "Stop on trigger" to
   guard the trace data not to be overwritten.

              watermark   tail      head
     +--------+-----------+---------+-------+
     |        |           |$$$$$$$$$|       |
     +--------+-----------+---------+-------+
     base                                   base + nr_pages
                                            limit

                                    `------->
     >-- counter ---------'

     $$$ : Filled trace data

The modes are selected by comparing the limit with the trigger position.

An extra TRBE_FAULT_ACT_TRIG state is introduced for fault action, it is
used to distinguish the trigger event from the WRAP event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 101 +++++++++++++++++++++------
 drivers/hwtracing/coresight/coresight-trbe.h |  14 ++++
 2 files changed, 94 insertions(+), 21 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8390d0a8fe23d35945610df15f21751279ee37ee..0551ea9b4f8286c156e3c9c7ac94e2ecd3b9dc3f 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -48,6 +48,7 @@
 #define TRBE_TRACE_MIN_BUF_SIZE		64
 
 enum trbe_fault_action {
+	TRBE_FAULT_ACT_TRIG,
 	TRBE_FAULT_ACT_WRAP,
 	TRBE_FAULT_ACT_SPURIOUS,
 	TRBE_FAULT_ACT_FATAL,
@@ -67,6 +68,7 @@ struct trbe_buf {
 	unsigned long trbe_hw_base;
 	unsigned long trbe_limit;
 	unsigned long trbe_write;
+	unsigned long trbe_count;
 	int nr_pages;
 	void **pages;
 	bool snapshot;
@@ -478,6 +480,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	if (head < tail)
 		limit = round_down(tail, PAGE_SIZE);
 
+	/* If trigger mode is enabled, no need to use limit for watermark */
+	if (!static_branch_unlikely(&trbe_trigger_mode_bypass))
+		goto out;
+
 	/*
 	 * Wakeup may be arbitrarily far into the future. If it's not in the
 	 * current generation, either we'll wrap before hitting it, or it's
@@ -495,6 +501,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
+out:
 	/*
 	 * There is a situation when this can happen i.e limit is before
 	 * the head and hence TRBE cannot be configured.
@@ -518,6 +525,39 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	return 0;
 }
 
+static u64 __trbe_normal_trigger_count(struct perf_output_handle *handle)
+{
+	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_cpudata *cpudata = buf->cpudata;
+	u64 limit, head, wakeup;
+	u64 count = 0;
+
+	if (static_branch_unlikely(&trbe_trigger_mode_bypass))
+		return 0;
+
+	limit = buf->trbe_limit - buf->trbe_base;
+	head = PERF_IDX2OFF(handle->head, buf);
+	wakeup = PERF_IDX2OFF(handle->wakeup, buf);
+
+	/* Set the count to guard the end of free buffer after wrap around */
+	if (limit == buf->nr_pages * PAGE_SIZE && (head + handle->size) > limit)
+		count = handle->size;
+
+	/*
+	 * If the watermark is less than the limit, use the trigger count for
+	 * the watermark maintenance.
+	 */
+	if (handle->wakeup < (handle->head + handle->size) && head <= wakeup) {
+		u64 wakeup_count =
+			round_up(wakeup - head, cpudata->trbe_hw_align);
+
+		if (head + wakeup_count < limit)
+			count = wakeup_count;
+	}
+
+	return count;
+}
+
 static int trbe_normal_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
@@ -542,6 +582,7 @@ static int trbe_normal_offset(struct perf_output_handle *handle)
 		return -ENOSPC;
 
 	buf->trbe_limit = buf->trbe_base + limit;
+	buf->trbe_count = __trbe_normal_trigger_count(handle);
 	return 0;
 }
 
@@ -594,24 +635,40 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
 	trblimitr &= ~TRBLIMITR_EL1_TM_MASK;
 	trblimitr &= ~TRBLIMITR_EL1_LIMIT_MASK;
 
-	/*
-	 * Fill trace buffer mode is used here while configuring the
-	 * TRBE for trace capture. In this particular mode, the trace
-	 * collection is stopped and a maintenance interrupt is raised
-	 * when the current write pointer wraps. This pause in trace
-	 * collection gives the software an opportunity to capture the
-	 * trace data in the interrupt handler, before reconfiguring
-	 * the TRBE.
-	 */
-	trblimitr |= (TRBLIMITR_EL1_FM_FILL << TRBLIMITR_EL1_FM_SHIFT) &
-		     TRBLIMITR_EL1_FM_MASK;
+	if (!buf->trbe_count ||
+	    buf->trbe_write + buf->trbe_count == buf->trbe_limit) {
+		/*
+		 * Fill trace buffer mode is used here while configuring the
+		 * TRBE for trace capture. In this particular mode, the trace
+		 * collection is stopped and a maintenance interrupt is raised
+		 * when the current write pointer wraps. This pause in trace
+		 * collection gives the software an opportunity to capture the
+		 * trace data in the interrupt handler, before reconfiguring
+		 * the TRBE.
+		 */
+		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_FILL) |
+			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_IGNR);
+	} else if (buf->trbe_write + buf->trbe_count < buf->trbe_limit) {
+		/*
+		 * Fill mode is used here to stop trace collection and prevent
+		 * the buffer from being overwritten. Trigger mode continues
+		 * trace collection and raises a maintenance interrupt on a
+		 * trigger event, which acts as a watermark for notifying
+		 * userspace.
+		 */
+		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_FILL) |
+			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_IRQ);
+	} else if (buf->trbe_write + buf->trbe_count > buf->trbe_limit) {
+		/*
+		 * Wrap buffer mode continues trace collection and raises
+		 * maintenance interrupt on buffer wrap. Trigger mode stops
+		 * trace on trigger event to guard the buffer from being
+		 * overwritten.
+		 */
+		trblimitr |= FIELD_PREP(TRBLIMITR_EL1_FM_MASK, TRBLIMITR_EL1_FM_WRAP) |
+			     FIELD_PREP(TRBLIMITR_EL1_TM_MASK, TRBLIMITR_EL1_TM_STOP);
+	}
 
-	/*
-	 * Trigger mode is not used here while configuring the TRBE for
-	 * the trace capture. Hence just keep this in the ignore mode.
-	 */
-	trblimitr |= (TRBLIMITR_EL1_TM_IGNR << TRBLIMITR_EL1_TM_SHIFT) &
-		     TRBLIMITR_EL1_TM_MASK;
 	trblimitr |= (addr & PAGE_MASK);
 	set_trbe_enabled(buf->cpudata, trblimitr);
 }
@@ -623,6 +680,7 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);
+	set_trbe_trigger_count(buf->trbe_count);
 
 	/*
 	 * Synchronize all the register updates
@@ -639,8 +697,6 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	int ec = get_trbe_ec(trbsr);
 	int bsc = get_trbe_bsc(trbsr);
 
-	WARN_ON(is_trbe_running(trbsr));
-
 	if (is_trbe_abort(trbsr)) {
 		err_str = "External abort";
 		goto out_fatal;
@@ -672,8 +728,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	case TRBE_BSC_FILLED:
 		break;
 	case TRBE_BSC_TRIGGERED:
-		err_str = "Unexpected trigger status";
-		goto out_fatal;
+		break;
 	default:
 		err_str = "Unexpected buffer status code";
 		goto out_fatal;
@@ -692,6 +747,9 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 
+	if (is_trbe_trg(trbsr))
+		return TRBE_FAULT_ACT_TRIG;
+
 	return TRBE_FAULT_ACT_SPURIOUS;
 
 out_fatal:
@@ -1180,6 +1238,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 		clr_trbe_status();
 
 	switch (act) {
+	case TRBE_FAULT_ACT_TRIG:
 	case TRBE_FAULT_ACT_WRAP:
 		truncated = !!trbe_handle_overflow(handle, act);
 		break;
diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
index d7f7cd763c0c7139cf322b7336ee563073e3bea0..4c65d164a946ec9860825e7564196745b60d730b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.h
+++ b/drivers/hwtracing/coresight/coresight-trbe.h
@@ -114,6 +114,20 @@ static inline void set_trbe_write_pointer(unsigned long addr)
 	write_sysreg_s(addr, SYS_TRBPTR_EL1);
 }
 
+static inline void set_trbe_trigger_count(unsigned long count)
+{
+	u64 trbsr;
+
+	write_sysreg_s(count, SYS_TRBTRG_EL1);
+
+	/* TRBSR_EL1.TRG has been cleared in clr_trbe_status() */
+	if (!count)
+		return;
+
+	trbsr = read_sysreg_s(SYS_TRBSR_EL1);
+	write_sysreg_s(trbsr | TRBSR_EL1_TRG, SYS_TRBSR_EL1);
+}
+
 static inline unsigned long get_trbe_limit_pointer(void)
 {
 	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);

-- 
2.34.1


