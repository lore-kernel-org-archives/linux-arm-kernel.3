Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A78FC982CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYi2rDbZNL0pz7r6YlMeQykxAd+EClrCbw8q8ByInKA=; b=ojmdul5E9FnObtBD97K7J7UqQH
	UD+26xutNsHirbqG/W9hbEduOhJF4GV0z59GejXYTGyP9al3K8r6/n3i2Cc9gVxGAtHJ7R6Rk+9S7
	8wvUACKvrTa7DfZY24Zq0IMwu07JUaQZM3EvG0Ni/YBFysNnEst57ByVzfVUiOef3ljCK7ieO2XER
	Hx4tBpMlE4Pi9vM9PORSqPJB0pAJbDRaKpjJuftL5PqSbnBk2Todt7UaDYw2/dZlfZv//01ug5Adu
	q3PkF6cDceEmW83c9dZokxYy1Y7Tfb4F6humKp0MTy2X+6rQQKNhwHnMBHEmJOgr+RrjWXa+tm44D
	+oIZRcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPm-00000007HzK-40eL;
	Tue, 15 Sep 2026 15:49:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPZ-00000007HoV-2cec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347E115A1;
	Tue, 15 Sep 2026 08:49:29 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DD113F882;
	Tue, 15 Sep 2026 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487372; bh=02XRQdNwi/IGyKd7CRNCUbJzgLtRFPbMVPvVQ+wGuSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ITgQMlk7KScRhJvAsV94GJ3Q/FcOEOg0nxH1PyBFkLA1PlkvgXyZuP9e1K4i9cn6J
	 gq6VcE/FF7rHXGaLtT5aYfCJC4Y4fbROkSHgEhRKy5WNAMlVVrWselp5Sf+fjhpK6N
	 P2Hk7ZCIZeo7SNS/fSmvHJJLBpzITT/+OH51l91Y=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:57 +0100
Subject: [PATCH 11/25] coresight: trbe: Use circular buffer mode for
 snapshots
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-11-35cf6f297d20@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=6164;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=02XRQdNwi/IGyKd7CRNCUbJzgLtRFPbMVPvVQ+wGuSU=;
 b=vDRlFc0M1ouvf1Jy/YdiGbtMpi7/VnoZFyVq4lqtEPl3G7unJkBzaLtZy5OAF5HbmS4gy/cCN
 cmmnFBu3nmjBR5lxKTUoj+/fJ+FcZdw9RNJkGjBYOsfamkgKYHq8POj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084935_043106_FE3537FA 
X-CRM114-Status: GOOD (  22.40  )
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

TRBE uses Fill mode for snapshots, stopping trace collection and raising
a maintenance interrupt at each wrap. Circular buffer mode retains the
most recent trace without stopping collection or generating wrap
interrupts.

Use circular buffer mode for snapshots unless the CPU requires the write
out-of-range workaround. Keep Fill mode and its guard page on affected
CPUs. Select the mode on each enable to handle task migration.

Calculate the minimum known trace advance from the write pointer and the
WRAP flag, since additional complete laps cannot be counted. Advance the
AUX head by this amount, then clamp the reported size to one buffer of
retained trace.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 61 +++++++++++++++++++++-------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index a31f2ebc327cd681344a62de28c0b3840505a9cb..ab3c5c7d27f3d272b07eade1e6452559808b196c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -69,6 +69,7 @@ struct trbe_buf {
 	int nr_pages;
 	void **pages;
 	bool snapshot;
+	bool circular;
 	struct trbe_cpudata *cpudata;
 };
 
@@ -324,9 +325,11 @@ static void trbe_stop_and_truncate_event(struct perf_output_handle *handle)
  * When the write pointer reaches the address just before the limit pointer, it gets
  * wrapped around again to the base pointer. This is called a TRBE wrap event, which
  * generates a maintenance interrupt when operated in WRAP or FILL mode. This driver
- * uses FILL mode, where the TRBE stops the trace collection at wrap event. The IRQ
- * handler updates the AUX buffer and re-enables the TRBE with updated WRITE and
- * LIMIT pointers.
+ * uses FILL mode for non-overwrite buffers, where the TRBE stops trace collection
+ * at a wrap event. The IRQ handler updates the AUX buffer and re-enables the TRBE
+ * with updated WRITE and LIMIT pointers. Snapshot buffers use Circular Buffer
+ * mode where possible, overwriting old trace without stopping or interrupting
+ * the CPU when the write pointer wraps.
  *
  *	Wrap around with an IRQ
  *	------ < ------ < ------- < ----- < -----
@@ -628,6 +631,7 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
 {
 	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
 	unsigned long addr = buf->trbe_limit;
+	u64 mode = buf->circular ? TRBLIMITR_EL1_FM_CBUF : TRBLIMITR_EL1_FM_FILL;
 
 	WARN_ON(!IS_ALIGNED(addr, (1UL << TRBLIMITR_EL1_LIMIT_SHIFT)));
 	WARN_ON(!IS_ALIGNED(addr, PAGE_SIZE));
@@ -638,15 +642,11 @@ static void set_trbe_limit_pointer_enabled(struct trbe_buf *buf)
 	trblimitr &= ~TRBLIMITR_EL1_LIMIT_MASK;
 
 	/*
-	 * Fill trace buffer mode is used here while configuring the
-	 * TRBE for trace capture. In this particular mode, the trace
-	 * collection is stopped and a maintenance interrupt is raised
-	 * when the current write pointer wraps. This pause in trace
-	 * collection gives the software an opportunity to capture the
-	 * trace data in the interrupt handler, before reconfiguring
-	 * the TRBE.
+	 * Circular mode keeps the most recent trace in a snapshot buffer
+	 * without generating wrap interrupts. Use Fill mode otherwise so
+	 * the IRQ handler can collect the trace before it is overwritten.
 	 */
-	trblimitr |= (TRBLIMITR_EL1_FM_FILL << TRBLIMITR_EL1_FM_SHIFT) &
+	trblimitr |= (mode << TRBLIMITR_EL1_FM_SHIFT) &
 		     TRBLIMITR_EL1_FM_MASK;
 
 	/*
@@ -757,6 +757,26 @@ static unsigned long trbe_get_trace_size(struct perf_output_handle *handle,
 	return size;
 }
 
+static unsigned long trbe_get_circular_size(struct perf_output_handle *handle,
+					    struct trbe_buf *buf, u64 status)
+{
+	u64 start = PERF_IDX2OFF(handle->head, buf);
+	u64 write = get_trbe_write_pointer() - buf->trbe_base;
+
+	/*
+	 * WRAP indicates at least one crossing of the limit. Any additional
+	 * full laps cannot be determined, so account only for the trace
+	 * known to have been collected. This also preserves the write offset
+	 * when updating the head.
+	 */
+	if (is_trbe_wrap(status))
+		write += (u64)buf->nr_pages << PAGE_SHIFT;
+	else if (WARN_ON_ONCE(write < start))
+		return 0;
+
+	return write - start;
+}
+
 static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
 				   struct perf_event *event, void **pages,
 				   int nr_pages, bool snapshot)
@@ -887,14 +907,19 @@ static unsigned long arm_trbe_update_buffer(struct coresight_device *csdev,
 		wrap = true;
 	}
 
-	size = trbe_get_trace_size(handle, buf, wrap);
+	if (buf->circular)
+		size = trbe_get_circular_size(handle, buf, status);
+	else
+		size = trbe_get_trace_size(handle, buf, wrap);
 
 done:
 	local_irq_restore(flags);
 
 	if (buf->snapshot)
 		handle->head += size;
-	return size;
+
+	/* At most one full buffer of trace is available */
+	return min(size, (unsigned long)buf->nr_pages << PAGE_SHIFT);
 }
 
 
@@ -973,7 +998,8 @@ static int trbe_apply_work_around_before_enable(struct trbe_buf *buf)
 	 *  - At trace collection:
 	 *     - Pad the 256bytes skipped above again with IGNORE packets.
 	 */
-	if (trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
+	if (!buf->circular &&
+	    trbe_has_erratum(buf->cpudata, TRBE_WORKAROUND_OVERWRITE_FILL_MODE)) {
 		if (WARN_ON(!IS_ALIGNED(buf->trbe_write, PAGE_SIZE)))
 			return -EINVAL;
 		buf->trbe_hw_base = buf->trbe_write;
@@ -1056,6 +1082,13 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 	cpudata->mode = mode;
 	buf->cpudata = cpudata;
 
+	/*
+	 * A CPU affected by the write out-of-range erratum cannot use circular
+	 * mode, as the TRBE continues tracing after wrapping and may write out
+	 * of range. Fall back to FILL mode so the IRQ handler can fix this up.
+	 */
+	buf->circular = buf->snapshot && !trbe_may_write_out_of_range(cpudata);
+
 	return __arm_trbe_enable(buf, handle);
 }
 

-- 
2.34.1


