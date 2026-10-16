Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB20CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeMl9uql1AFyJurPPbhyn9zcg6a0jaSRIelhEhPEu38=; b=0x+PaaMhhCmyUNf5xcu0giG/eM
	B0BLz1e88a5V9B0vNwGgU96GWkiR0BLeXusoS/p/COJ2/HfRnQ1AZc3wqCW6jhf9ZxLK+AuwTrP3R
	t9f0dJgeiEWptZvqcRK6ldZQADMbrEg8BPO3J8GM/jDj4hFVOfw9+hnNY1PIbIk7bVeyghHAzu3ZR
	uxS5bk49PrGpSk7nH6f6cmqYwGkYcvjTAXO1s8sdpwMlunZhCa8FQzb0nZhvljc7w7FZA4hzJN5k5
	iRaKYmOj+yNmHFlt7tlxjWeyzJRh/y5wOUdVBujC4U5PgTgLTYjh7D6py6ibmoNH04lWrPY+mofgS
	guitFrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpE2-000000044C6-45kZ;
	Fri, 16 Oct 2026 21:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDj-0000000444X-1NjU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UeMl9uql1AFyJurPPbhyn9zcg6a0jaSRIelhEhPEu38=; b=JyKnyAQvhdTAEgGkky2bg/OaD8
	8ecT65tg8sQVIzhmmbkKa10s7/nYMoU9G/ndJ1ojynX34+pMF4eEje8Hn2s4kWzpZEDkDoniLOWyW
	1Dry5k2rzv8mVuoaRovGTDX23yhjcdnHGuUPjaJPHoERVYI5CqbQiGXOOYVaWpNwcGG/tjl5vfvCE
	0D29VQOArI8vSoFFRb8jHXrLGIFfmg+TuPAHF0NJknG2r8WY+E268fTnuLZ6zrRWHWF0aWPh/sYhQ
	JRPKGOaEZLH/Nnixmi9VaeiuCNRyaCZZU1Jc4TcLLDnHyKbYAAC3hFQus3d30mSFSr8qbo3qlp7+o
	m6kPJpyg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDf-00000001xSD-4Al2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:12:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F4C14BF;
	Fri, 16 Oct 2026 14:11:58 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E09113F673;
	Fri, 16 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185121; bh=QDqbFTNQ8Jyz1W6hfN8VAlMEIi6t7zvXVwMS9WRaAkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gx7CmBRHhvUfexRU2b0z4P9k9I/YmhxyheDLluMD1XTZyon8vTzl27LwfXyuhYI0p
	 kLPSeM8DRi5zv6MUUF9/jH0jMLPIYwZPJ0vvENhaAQZv2VbgtPZ0foiKku03GpA5RR
	 fzJqL1vCeyntte9aurYZDPD9+MmZazho6yGbzDEU=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:42 +0100
Subject: [PATCH v2 04/11] coresight: trbe: Use trigger mode for buffer
 maintenance
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-4-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=15895;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=QDqbFTNQ8Jyz1W6hfN8VAlMEIi6t7zvXVwMS9WRaAkk=;
 b=XvfPi9FHI6HXlF2tj0Ji0dP0kf6vz3uGYsra5MFMxjb0jNOSieXa/NcmImRsIdjd93zvpWztt
 maihuO5fS6fAayawm3ASiamH0d7BNB9sSw9IvQ4lLsI/ABrMn2c3iB9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221204_474915_127631AE 
X-CRM114-Status: GOOD (  34.52  )
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

TRBE currently uses FILL mode for AUX record. When the write pointer
reaches LIMIT, trace collection stops and a maintenance interrupt is
raised. However, due to IRQ latency, trace data may be lost during the
window in which tracing is halted but the program continues to run.

Use TRBTRG_EL1 to request maintenance without always stopping trace.

 1) If the perf wakeup point is before the programmed LIMIT, program a
    trigger event at the wakeup point while keeping FILL mode so LIMIT
    remains the hard stop.

          head            watermark tail
     +----+---------------+---------+-------+
     |$$$$|               |         |$$$$$$$|
     +----+---------------+---------+-------+
     base `---- count ----'         limit   base + nr_pages

     $$$ : Filled trace data

 2) If the writable range extends past the end of the buffer, use WRAP
    mode with Stop-on-trigger so tracing continues past the limit but
    stops at the trigger before overwriting unconsumed data.

    Do not program a trigger count that exceed the 32-bit TRBTRG_EL1.TRG
    field.

              watermark   tail      head
     +--------+-----------+---------+-------+
     |        |           |$$$$$$$$$|       |
     +--------+-----------+---------+-------+
     base                                   base + nr_pages
                                            limit

                                    `------->
     >-- counter ---------'

The available AUX space can be unaligned even when the head and tail
are aligned, because perf reserves one byte to distinguish a full ring
from an empty one. Round the wrap-protection count down to the
TRBIDR_EL1.Align granule before programming TRBTRG_EL1. Use the LIMIT
fallback if the rounded count no longer extends beyond the limit.

Keep the LIMIT-based wakeup path when trigger mode is bypassed. Add a
TRIG fault action so trigger events can be handled separately from WRAP
events. Keep access not allowed stops ahead of WRAP and TRG classification.
The driver sets TRG when arming the counter, so a set TRG bit alone does
not establish that the counter has expired.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 193 ++++++++++++++++++++-------
 drivers/hwtracing/coresight/coresight-trbe.h |  18 +++
 2 files changed, 166 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 92cd9c28cb4f6d9da7d41aa9eeedf4295a810006..95bbdbaca81bd59ac97b272216489c2f66393fa7 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -49,6 +49,7 @@
 #define TRBE_TRACE_MIN_BUF_SIZE		64
 
 enum trbe_fault_action {
+	TRBE_FAULT_ACT_TRIG,
 	TRBE_FAULT_ACT_WRAP,
 	TRBE_FAULT_ACT_SPURIOUS,
 	TRBE_FAULT_ACT_FATAL,
@@ -68,6 +69,7 @@ struct trbe_buf {
 	unsigned long trbe_hw_base;
 	unsigned long trbe_limit;
 	unsigned long trbe_write;
+	unsigned long trbe_trg_count;
 	int nr_pages;
 	void **pages;
 	bool snapshot;
@@ -169,6 +171,13 @@ struct trbe_drvdata {
 	struct platform_device *pdev;
 };
 
+/* Compute the buffer next state */
+struct trbe_buf_next {
+	u64 head;
+	u64 limit;
+	u32 count;
+};
+
 static void trbe_check_errata(struct trbe_cpudata *cpudata)
 {
 	int i;
@@ -291,6 +300,7 @@ static void trbe_reset_local(struct trbe_cpudata *cpudata)
 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
 	isb();
 	trbe_drain_buffer();
+	write_sysreg_s(0, SYS_TRBTRG_EL1);
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);
 	write_sysreg_s(0, SYS_TRBSR_EL1);
@@ -392,6 +402,77 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
 	return size;
 }
 
+/*
+ * Wakeup may be arbitrarily far into the future. If it's not in the
+ * current generation, either we'll wrap before hitting it, or it's
+ * in the past and has been handled already.
+ *
+ * Return true when the wakeup point belongs to the current writable
+ * generation and is located between the current head but before tail.
+ *
+ *	head		wakeup	tail
+ * +----|---------------|-------|-------+
+ * |$$$$|###############|%%%%%%%|$$$$$$$|
+ * +----|---------------|-------|-------+
+ * trbe_base		limit		trbe_base + nr_pages
+ */
+static bool trbe_wakeup_before_tail(struct perf_output_handle *handle,
+				    u64 head, u64 wakeup)
+{
+	return ((handle->wakeup - handle->head) < handle->size &&
+		head <= wakeup);
+}
+
+static u32 trbe_normal_trigger_count(struct perf_output_handle *handle,
+				     u64 head, u64 wakeup, u64 limit)
+{
+	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_cpudata *cpudata = buf->cpudata;
+	const u64 bufsize = buf->nr_pages * PAGE_SIZE;
+	u64 count;
+
+	if (!cpudata->trig_is_supported)
+		return 0;
+
+	/*
+	 * Set a trigger at the watermark if it can be reached before the
+	 * programmed limit.
+	 */
+	if (trbe_wakeup_before_tail(handle, head, wakeup)) {
+		count = round_up(wakeup - head, cpudata->trbe_hw_align);
+		if (count && head + count < limit)
+			goto out;
+	}
+
+	if (limit != bufsize)
+		return 0;
+
+	/*
+	 * Otherwise, when LIMIT is at the end of the buffer and the writable
+	 * region wraps, use a trigger count to stop before unconsumed data
+	 * can be overwritten after wrap.
+	 *
+	 *	wakeup          tail    head
+	 * +----|---------------|-------|-------+
+	 * |####|###############|$$$$$$$|#######|
+	 * +----|---------------|-------|-------+
+	 * trbe_base                            trbe_base + nr_pages
+	 *                                      limit
+	 *
+	 *                              |>>>>>>>>
+	 * >>>>>>>>>>>>>>>>>>>>>|
+	 *   ` Trigger counter covers the writable region, rounded down
+	 *     to the hardware alignment.
+	 */
+	count = round_down(handle->size, cpudata->trbe_hw_align);
+	if (count <= limit - head)
+		return 0;
+
+out:
+	/* Ensure the count fits in the 32-bit TRBTRG_EL1.TRG field */
+	return count > U32_MAX ? 0 : count;
+}
+
 /*
  * TRBE Limit Calculation
  *
@@ -402,13 +483,15 @@ static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
  * %%%% - Free area, disabled, trace will not be written
  * ==== - Free area, padded with ETE_IGNORE_PACKET, trace will be skipped
  */
-static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
+static unsigned long __trbe_normal_offset(struct perf_output_handle *handle,
+					  struct trbe_buf_next *next)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	struct trbe_cpudata *cpudata = buf->cpudata;
 	const u64 bufsize = buf->nr_pages * PAGE_SIZE;
 	u64 limit = bufsize;
 	u64 head, tail, wakeup;
+	u32 count = 0;
 
 	head = PERF_IDX2OFF(handle->head, buf);
 
@@ -453,10 +536,12 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	wakeup = PERF_IDX2OFF(handle->wakeup, buf);
 
 	/*
-	 * Lets calculate the buffer area which TRBE could write into. There
-	 * are three possible scenarios here. Limit needs to be aligned with
-	 * PAGE_SIZE per the TRBE requirement. Always avoid clobbering the
-	 * unconsumed data.
+	 * Calculate the buffer limit. There are three possible scenarios.
+	 * The limit needs to be aligned with PAGE_SIZE per the TRBE
+	 * requirement. Always avoid clobbering the unconsumed data.
+	 *
+	 * How tracing proceeds after the limit is reached (e.g. wrapping
+	 * or stopping) depends on the subsequent buffer management.
 	 *
 	 * 1) head < tail
 	 *
@@ -466,9 +551,8 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * +----|-----------------------|-------+
 	 * trbe_base			limit	trbe_base + nr_pages
 	 *
-	 * TRBE could write into [head..tail] area. Unless the tail is right at
-	 * the end of the buffer, neither an wrap around nor an IRQ is expected
-	 * while being enabled.
+	 * TRBE could write into [head..tail] area. Programming the limit at
+	 * 'tail' prevents from overwriting into unconsumed data.
 	 *
 	 * 2) head == tail
 	 *
@@ -500,20 +584,20 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 		limit = round_down(tail, PAGE_SIZE);
 
 	/*
-	 * Wakeup may be arbitrarily far into the future. If it's not in the
-	 * current generation, either we'll wrap before hitting it, or it's
-	 * in the past and has been handled already.
+	 * The trigger count is used either to generate an early maintenance
+	 * interrupt at the watermark or to guard unconsumed data before
+	 * wrapping.
+	 */
+	count = trbe_normal_trigger_count(handle, head, wakeup, limit);
+
+	/*
+	 * A zero count value indicates that no trigger should be programmed,
+	 * so notification relies on the programmed limit.
 	 *
 	 * If there's a wakeup before we wrap, arrange to be woken up by the
 	 * page boundary following it. Keep the tail boundary if that's lower.
-	 *
-	 *	head		wakeup	tail
-	 * +----|---------------|-------|-------+
-	 * |$$$$|###############|%%%%%%%|$$$$$$$|
-	 * +----|---------------|-------|-------+
-	 * trbe_base		limit		trbe_base + nr_pages
 	 */
-	if ((handle->wakeup - handle->head) < handle->size && head <= wakeup)
+	if (!count && trbe_wakeup_before_tail(handle, head, wakeup))
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*
@@ -532,8 +616,12 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * +------------|------|--------|-------+
 	 * trbe_base				trbe_base + nr_pages
 	 */
-	if (limit > head)
+	if (limit > head) {
+		next->head = head;
+		next->limit = limit;
+		next->count = count;
 		return limit;
+	}
 
 	trbe_pad_buf(handle, handle->size);
 	return 0;
@@ -542,8 +630,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 static int trbe_normal_offset(struct perf_output_handle *handle)
 {
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	u64 limit = __trbe_normal_offset(handle);
-	u64 head = PERF_IDX2OFF(handle->head, buf);
+	struct trbe_buf_next next = { };
+	u64 limit;
+
+	limit = __trbe_normal_offset(handle, &next);
 
 	/*
 	 * If the head is too close to the limit and we don't
@@ -553,16 +643,16 @@ static int trbe_normal_offset(struct perf_output_handle *handle)
 	 * We might have to do this more than once to make sure
 	 * we have enough required space.
 	 */
-	while (limit && ((limit - head) < trbe_min_trace_buf_size(handle))) {
-		trbe_pad_buf(handle, limit - head);
-		limit = __trbe_normal_offset(handle);
-		head = PERF_IDX2OFF(handle->head, buf);
+	while (limit && next.limit - next.head < trbe_min_trace_buf_size(handle)) {
+		trbe_pad_buf(handle, next.limit - next.head);
+		limit = __trbe_normal_offset(handle, &next);
 	}
 
 	if (!limit)
 		return -ENOSPC;
 
-	buf->trbe_limit = buf->trbe_base + limit;
+	buf->trbe_limit = buf->trbe_base + next.limit;
+	buf->trbe_trg_count = next.count;
 	return 0;
 }
 
@@ -607,6 +697,7 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
 {
 	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
 	unsigned long addr = buf->trbe_limit;
+	u64 to_limit = buf->trbe_limit - buf->trbe_write;
 
 	WARN_ON(!IS_ALIGNED(addr, (1UL << TRBLIMITR_EL1_LIMIT_SHIFT)));
 	WARN_ON(!IS_ALIGNED(addr, PAGE_SIZE));
@@ -616,24 +707,32 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
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
+	if (!buf->trbe_trg_count || buf->trbe_trg_count == to_limit) {
+		/*
+		 * No separate trigger is needed. Use FILL mode so tracing stops
+		 * and raises a maintenance interrupt when the write pointer
+		 * reaches the limit.
+		 */
+		trblimitr |= TRBE_LIMIT_MODE(TRBLIMITR_EL1_FM_FILL,
+					     TRBLIMITR_EL1_TM_IGNR);
+	} else if (buf->trbe_trg_count < to_limit) {
+		/*
+		 * The trigger lies before the limit. Use FILL mode to preserve
+		 * the limit as the hard stop, and enable trigger IRQs for
+		 * early maintenance, such as watermark handling.
+		 */
+		trblimitr |= TRBE_LIMIT_MODE(TRBLIMITR_EL1_FM_FILL,
+					     TRBLIMITR_EL1_TM_IRQ);
+	} else if (buf->trbe_trg_count > to_limit) {
+		/*
+		 * The trigger lies beyond the limit. Use WRAP mode so tracing
+		 * can continue past the limit, and stop on the trigger before
+		 * it can overwrite unconsumed trace data.
+		 */
+		trblimitr |= TRBE_LIMIT_MODE(TRBLIMITR_EL1_FM_WRAP,
+					     TRBLIMITR_EL1_TM_STOP);
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
@@ -645,6 +744,7 @@ static void trbe_enable_hw(struct trbe_buf *buf)
 	WARN_ON(buf->trbe_write >= buf->trbe_limit);
 	set_trbe_base_pointer(buf->trbe_hw_base);
 	set_trbe_write_pointer(buf->trbe_write);
+	set_trbe_trigger_count(buf->trbe_trg_count);
 
 	/*
 	 * Synchronize all the register updates
@@ -692,8 +792,7 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	case TRBSR_EL1_BSC_FILLED:
 		break;
 	case TRBSR_EL1_BSC_TRIGGER_EVENT:
-		err_str = "Unsupported trigger event";
-		goto out_fatal;
+		break;
 	case TRBSR_EL1_BSC_MANUAL_STOP:
 		err_str = "Unsupported manual stop";
 		goto out_fatal;
@@ -716,6 +815,9 @@ static enum trbe_fault_action trbe_get_fault_act(struct perf_output_handle *hand
 	if (is_trbe_wrap(trbsr))
 		return TRBE_FAULT_ACT_WRAP;
 
+	if (is_trbe_trg(trbsr))
+		return TRBE_FAULT_ACT_TRIG;
+
 	return TRBE_FAULT_ACT_SPURIOUS;
 
 out_fatal:
@@ -1370,6 +1472,7 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
+	case TRBE_FAULT_ACT_TRIG:
 	case TRBE_FAULT_ACT_WRAP:
 		truncated = !!trbe_handle_overflow(cpudata, act,
 						   !is_trbe_running(status));
diff --git a/drivers/hwtracing/coresight/coresight-trbe.h b/drivers/hwtracing/coresight/coresight-trbe.h
index 8ba9ef4056e4dc3968816c6a7cbf2859f2bbed36..fe84af94525f8c2dc40ac9c472bec5c1117a40b9 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.h
+++ b/drivers/hwtracing/coresight/coresight-trbe.h
@@ -19,6 +19,10 @@
 
 #include "coresight-etm-perf.h"
 
+#define TRBE_LIMIT_MODE(fm, tm) \
+	(FIELD_PREP(TRBLIMITR_EL1_FM_MASK, (fm)) | \
+	 FIELD_PREP(TRBLIMITR_EL1_TM_MASK, (tm)))
+
 static inline bool is_trbe_available(void)
 {
 	u64 aa64dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
@@ -104,6 +108,20 @@ static inline void set_trbe_write_pointer(unsigned long addr)
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


