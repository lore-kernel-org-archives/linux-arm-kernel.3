Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AC1CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8WOzmiFfBrAe/Oe3rHa3h1CnFfol+AsZ/xb5/Ndfqc=; b=TNyFMvSEkTwMJs5EfXZwn5JUfo
	l4qSWdltIxMnVRjzktmZ1OC+RVh5ounKeiX248mGnZ1iDuvDeHT2JYFgHd6XfKSqq5C7exIP2Rc4q
	/nV51CBTDWYt3tq0Sl2/ZkPDuN2LoXffTjI3jefpAu3QKn3A0WvEZyEpXLfIMs5Ovvnsx4nomlSJL
	AV+q8aZMDIvjrIjfkODauNvPKNi0Mcfx3EJsIf6W5FylqkTeYlvL5VXECgVWdYcuTwyH6OTcxYxyf
	Uj4VLkEMAV2Nsv+YR3tmIpjEjcamlsLyibZFjR3IcTaJCOWN9BX0v4ek7GeJ1NFsPlgqV3zNdODKx
	x+HjudCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE3-00000003UXw-3FeR;
	Fri, 16 Oct 2026 16:56:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDo-00000003UGD-3ujV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=j8WOzmiFfBrAe/Oe3rHa3h1CnFfol+AsZ/xb5/Ndfqc=; b=YohsjFzUehrhvaQHbqWJrqET8F
	Y9NIgIfRXP2Gro+nP0t/hKmJdT95SeRckdTba0LBa7l6zEhaF+rHR7GeJjsXKx10u6TPcjAmdYz17
	LrY1g90NfQ53C9Qt4UWeJBsp/5omJylL1gD3zgOnXYc+XkVgSyY+dEWuH4hN5fXk0lhh1YhmKMYDF
	8xzh1ZB8+2zHPM+Ia7Qcclu5KFvzLflA/nLdH4Diybn252yrn1aWxj8Zon/rTwvhlmxeLG/rHFxlI
	fj96S8JYA/4ynut5Z2cgltEdxyDttORC9TWcrOvcryl3PTB17f6mWXY7xUrcooD4z0EGjSQoC2FsY
	C7HJGonA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDm-00000001lOW-0OKc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26F94175A;
	Fri, 16 Oct 2026 09:55:49 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1B783F7B4;
	Fri, 16 Oct 2026 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169752; bh=BvLu6cpm6zpybvEvvULEk+E4+hqOj0523fLkGhrmUY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nxUWApFdIF5go77go/gkUIQHLh4gWSAbExADi3FKHUv7lHOwGeEhjfHRjUC5Sf2Er
	 ER0OUY6Sp7ytIRoHtuFa9nMnA6Sn+EnOCcRzLJb5hbXNTK7G+MVfTCNviXRcT11Q1n
	 vXMArzs0sKQdr3+kfxG04CeIl3qAZHww2Nbe08JA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:20 +0100
Subject: [PATCH v2 22/23] coresight: trbe: Restart trace source for stopped
 buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-22-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=5429;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BvLu6cpm6zpybvEvvULEk+E4+hqOj0523fLkGhrmUY8=;
 b=OP/ONtQmKrOtKCR6nHRXZ/27H//JIwhmkJ+eFab6S1eyGwtVsbnd71xN9jWIpBHFJchZLlq9T
 Yofrkqaw+H8CfglI7U5uP+DT6h2HNAujQgniblJTN5BbXU1rBZxKrFn
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175554_456270_6CD85282 
X-CRM114-Status: GOOD (  24.17  )
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

When TRBSR reports a stopped buffer, the IRQ handler closes the current
AUX buffer and programs TRBE for the next run. This creates a trace
discontinuity. User tool has to reset the decoder when moving to the
next AUX data block, which can reduce decoded trace coverage.

Stop and restart the trace source around TRBE reprogramming for stopped
buffers. This emits ASYNC packets, allowing the decoder to recognize
discontinuity without a full reset.

This duplicates part of the trace source enable/disable code in the
ETMv4 driver. Reusing that code would require splitting the ETMv4
callbacks into finer-grained helpers that TRBE can call, which would
make the change much larger. Keep the TRBE change self-contained for
now.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 121 +++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 36f143a15e680b28aa6ca6a43ad7d3ee134693be..6bc82d5b55539795059da37039d2929b4ea504e3 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -17,9 +17,11 @@
 
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <linux/iopoll.h>
 #include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
 
+#include "coresight-etm4x.h"
 #include "coresight-self-hosted-trace.h"
 #include "coresight-trbe.h"
 
@@ -1132,14 +1134,106 @@ static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
 	set_trbe_enabled(cpudata, trblimitr);
 }
 
+static u64 read_sys_trcstatr(void)
+{
+	/* Context synchronization for each polling */
+	isb();
+	return read_sysreg_s(SYS_TRCSTATR);
+}
+
+static int arm_trbe_start_tracer(u64 trcprgctlr)
+{
+	u64 val;
+
+	/* A pending IRQ after AUX pause? */
+	if (!(trcprgctlr & BIT(0)))
+		return 0;
+
+	/* Restore the saved tracer state */
+	write_sysreg_s(trcprgctlr, SYS_TRCPRGCTLR);
+
+	/*
+	 * Context synchronization between writing to the TRCPRGCTLR and
+	 * reading the TRCSTATR.
+	 */
+	isb();
+
+	/* Wait for TRCSTATR.IDLE to go down to 0 */
+	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
+				     !(val & BIT(TRCSTATR_IDLE_BIT)),
+				     1,		/* delay_us */
+				     TIMEOUT_US, /* timeout_us */
+				     false)) {	/* delay_before_read */
+		pr_err("TRBE: timeout for TRCSTATR IDLE\n");
+		return -ETIME;
+	}
+
+	/* Context synchronization after programming the tracer */
+	isb();
+
+	return 0;
+}
+
+static int arm_trbe_stop_tracer(u64 *trcprgctlr)
+{
+	u64 val;
+
+	/* Disable tracer and save trcprgctlr */
+	*trcprgctlr = read_sysreg_s(SYS_TRCPRGCTLR);
+
+	/* No need to stop tracer again */
+	if (!(*trcprgctlr & BIT(0)))
+		return 0;
+
+	write_sysreg_s(*trcprgctlr & ~BIT(0), SYS_TRCPRGCTLR);
+
+	/*
+	 * Context synchronization between writing to the TRCPRGCTLR and
+	 * reading the TRCSTATR.
+	 */
+	isb();
+
+	/*
+	 * PMSTABLE alone does not permit re-enabling the tracer.
+	 * Wait for TRCSTATR.IDLE to go to 1.
+	 */
+	if (read_poll_timeout_atomic(read_sys_trcstatr, val,
+				     val & BIT(TRCSTATR_IDLE_BIT),
+				     1,
+				     TIMEOUT_US,
+				     false)) {
+		pr_err("TRBE: timeout for TRCSTATR IDLE=1\n");
+		return -ETIME;
+	}
+
+	/* Context synchronization after programming the tracer */
+	isb();
+
+	return 0;
+}
+
 static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
-				enum trbe_fault_action act)
+				enum trbe_fault_action act,
+				bool is_buffer_stopped)
 {
 	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	unsigned long size;
 	struct etm_event_data *event_data;
+	u64 trcprgctlr = 0;
+	int ret = 0;
+
+	/*
+	 * Since the trace buffer has stopped, disable and re-enable the
+	 * tracer to generate ASYNC packets. This allows the decoder to
+	 * recognize the discontinuity in the trace stream.
+	 */
+	if (is_buffer_stopped) {
+		ret = arm_trbe_stop_tracer(&trcprgctlr);
+		if (ret)
+			goto truncate_event;
+	}
 
 	/*
 	 * Clear the status. No context synchronization is required here,
@@ -1172,11 +1266,27 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 	 */
 	buf = etm_perf_sink_config(handle);
 	if (!buf || buf->cpudata != cpudata) {
-		trbe_truncate_event(handle);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto truncate_event;
+	}
+
+	ret = __arm_trbe_enable(buf, handle);
+	if (ret)
+		return ret;
+
+	if (is_buffer_stopped) {
+		ret = arm_trbe_start_tracer(trcprgctlr);
+		if (ret) {
+			trbe_drain_and_disable_local(cpudata);
+			goto truncate_event;
+		}
 	}
 
-	return __arm_trbe_enable(buf, handle);
+	return 0;
+
+truncate_event:
+	trbe_truncate_event(handle);
+	return ret;
 }
 
 static bool is_perf_trbe(struct perf_output_handle *handle)
@@ -1267,7 +1377,8 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(cpudata, act);
+		truncated = !!trbe_handle_overflow(cpudata, act,
+						   !is_trbe_running(status));
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
 		trbe_handle_spurious(cpudata);

-- 
2.34.1


