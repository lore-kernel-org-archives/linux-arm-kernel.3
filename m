Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B87BCCF2C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiacV80sYON2cf3V4t9bQDuvUv7yy/1hf3FdILsOjk=; b=GxK1F+U5iCJGhB3ymAVhWUh6t5
	mM1/zo4LcUjVejM1N2VpbWaTkCbm3tfcCDUzNTKhgH6F3Duiiy6lgFIi+/GXVJ+x0QFnV8VeQBm75
	H6UzzUJ0G/DnKoypFWC2JJkmBI5H/8ZWz1IvSzwbxJfRvOVi/z/9tHGhii7539SKG4tE6N+OBPJAl
	roVq0H98MY7yUy5Kj563ExtV0vpaafySn7uGV6aI9ktYkr+QV/VYZOxyuhhq88G3viImjAOJFI0kS
	LlS5jwNIWFrO1ZR1zRSPSa6HDfL4oZfbJnHMP1fterPstVR57FBBFErYgPZH3l5wtUiC4X5I0th2f
	Jw5+Deqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE1-00000003UT8-0lqK;
	Fri, 16 Oct 2026 16:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDk-00000003U9s-17OC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B4FC1516;
	Fri, 16 Oct 2026 09:55:43 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55CA33F7B4;
	Fri, 16 Oct 2026 09:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169746; bh=rIh/UAykOJyTEPi/bLjye+Bj0nQKIhap4gWn0QP/qa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LIZexuLOsFCbR1WWGmqMuoX80Y4SqEfcBhTi2OlXxvcuIVgYie9TX+IeXGSQbPYTk
	 fOOxzOy9+v//OEuCU5TOgeT06vIKonR7jzbll2v+GU6uUPtTSoDS+nTDquYYhs+efr
	 8hSTuFJcX//YHo6aN9zlKeNiL5G8X05qw4C51N0M=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:17 +0100
Subject: [PATCH v2 19/23] coresight: trbe: Reload the AUX buffer on
 overflow restart
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-19-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3773;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=rIh/UAykOJyTEPi/bLjye+Bj0nQKIhap4gWn0QP/qa8=;
 b=LPnRmMUspIZbhgulTelsB5rdzGZRjyOj6MD2Yi1syh9t9Mtx3R6bUoCBdroJ+Oil6Lzd7PnPt
 cYICEp4R9xEB3EfHAjL3mMJDN8GepliKsBV9xGXv7ePch7opFMHyoj8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_095553_359163_50912CEE 
X-CRM114-Status: GOOD (  14.78  )
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

PERF_EVENT_IOC_SET_OUTPUT lets events share another event's mapped output
buffer. For AUX events, this also selects the associated AUX area and
sink configuration. Perf normally establishes this sharing during setup.

Consider the following hypothetical live-redirection sequence, permitted
by the inspected perf-core paths. P is a parent event and C is its
inherited event, with C->parent = P. A and B are mapped AUX destination
buffers owned by separate, disabled cs_etm events in different task
contexts. All three are per-task events restricted to the same CPU, with
compatible output settings. P has no mmap of its own, allowing its output
to be redirected while A and B remain mapped through their owner events.

1. P's output is redirected to A. C inherits from P and begins tracing
   on the selected CPU, so its open AUX transaction and TRBE hardware
   both use A. P can be inactive while C is running because their
   events are scheduled with their respective tasks.
2. A userspace controller calls PERF_EVENT_IOC_SET_OUTPUT on P to select
   B. ring_buffer_attach() calls perf_event_stop(P, 0), which returns for
   inactive P without stopping C. P->rb now selects B, but C's existing
   handle and hardware still use A.
3. C's next buffer overflow invokes trbe_handle_overflow() from the IRQ
   handler. It saves buf for A, ends that AUX transaction, then calls
   perf_aux_output_begin(handle, C). AUX begin follows C->parent and
   reads P's current rb, rebinding the same handle to B.

This is a hypothetical API sequence, not a reproduced TRBE failure or
an observed buffer switch in normal perf record operation.

Without reloading buf, __arm_trbe_enable() calculates the next buffer
using B through the handle, but its workaround and hardware setup still
receive A. If B has never been enabled, its missing CPU association can
cause the normal-offset calculation to dereference NULL. With a snapshot
buffer, hardware may instead keep using A while perf accounts output to B.

Reload the sink configuration after perf_aux_output_begin() so the buffer
and handle refer to the same AUX transaction. If the buffer is missing or
its CPU association does not match the interrupt's CPU data, truncate the
new transaction and leave TRBE disabled. Truncation requests perf to stop
the event; a subsequent normal restart installs the buffer and its CPU
association through the sink enable path.

Stopping inherited writers during output redirection remains a separate
perf-core fix.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 2328aab0a084a0ac123e950f846f404d120ec2c0..f1f102df6c387f53feaa12b89d3df89f734afcdb 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1161,6 +1161,20 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
 	if (!event_data)
 		return -EINVAL;
 
+	/*
+	 * Reload the buffer after perf_aux_output_begin() so it matches the
+	 * handle. A race with PERF_EVENT_IOC_SET_OUTPUT may select a buffer
+	 * that has not been installed on this CPU and has no valid cpudata.
+	 * If the buffer is missing or its CPU association does not match,
+	 * truncate the trace to stop the event. A subsequent normal restart
+	 * installs the buffer and its CPU association through sink enable.
+	 */
+	buf = etm_perf_sink_config(handle);
+	if (!buf || buf->cpudata != cpudata) {
+		trbe_truncate_event(handle);
+		return -EINVAL;
+	}
+
 	return __arm_trbe_enable(buf, handle);
 }
 

-- 
2.34.1


