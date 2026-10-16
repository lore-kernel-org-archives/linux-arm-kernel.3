Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CDFCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=toF6oD0GRbEG+jRbvTs5kTSyWBEswkwNlqsY5olsVmA=; b=ruL43RWWQI/Xmuh4YvdzZSV+ns
	DiXpCZAvvYNvF+sCvkj1q/SwEoLlr6efOx8+Fh+znBub6c2YJbShZhN7gSqi+BsXh23Ys57TVKPju
	ZIa43wFSejZyF+RR08i/6nowz7h1Kcjom9DZ2Tt+KH9Kq1B30GRuH4PraQxZZZsMnr58fdaODSsLD
	BZqhWl5sgDeseWBVpc465PxcFdjD+Vt9kdyPgF3lo++a2kqsGFnlgFXLD9uQ+iIEZT4kQ3oHImQTB
	M2sFLhtUzH4mdhrnPCMgijh73xNncVF2cTorUcIOP3LSJ5NkCNZXeYhcWvj47wbIRgYgTltm6hihc
	2WeZtHTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE2-00000003UUt-0xVI;
	Fri, 16 Oct 2026 16:56:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDm-00000003UE4-2GUa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=toF6oD0GRbEG+jRbvTs5kTSyWBEswkwNlqsY5olsVmA=; b=laehKGveGQqoS45MNDvpUaJOGY
	YBiwtefuMcAOKNoHtNYS2603DGL8mHi/hsXNfyuCsHM6Zahb+3Bm7UCiZyKszRhKtPYiVGNQLj63Z
	KO6Gz7fgU/4G+PjD2qpR7kEm8qK2+CC7XFfZRkjnPcoOpBpUiB297qpX0z6r4Q9kUedFEz8Aure4t
	Q7ZafzXxsmbRIvHP6u3Afj1zu3l3LTUJZce6Iepf3k6dANLemxtQgnzk81Qu5ZE+BiRw5V0kZyiFn
	0JIixSgzjGN9LvINZJ9hiyLDK5xMdw5hvT59RhzoHmDtWMmNbbwCSR5+JmjkBHcV8U0wylj8OC3x6
	g+mrodXA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDj-00000001lLn-17s7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BC681477;
	Fri, 16 Oct 2026 09:55:47 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058F33F7B4;
	Fri, 16 Oct 2026 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169750; bh=4SgcwSVaML5euwYOvPkFPgUgMYX6vKYzcKelPwREZuc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vsMJmimUgZNiG6igE9AoQFgLQk8FUCBiYJq8D9vilpU4XZ5An9KldLdhc4FQbQCS6
	 2goc75CbXMiSya9/CjGbPrFhVjcuG4alfVJGNzy++xwXtnxkXE3tjGlkJMta+Pqv4U
	 bAXAPrIbLcM5CMlcuPLw48B6SJ899A62wawboMY4=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:19 +0100
Subject: [PATCH v2 21/23] coresight: trbe: Read TRBSR after prohibiting and
 flushing trace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-21-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=3624;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=4SgcwSVaML5euwYOvPkFPgUgMYX6vKYzcKelPwREZuc=;
 b=477OzZdiNsAyJnw8bKPpjxpHGqxUOHvVzX0vwuJm2GvDc7Edy3omLZA1x5e6HwnweVT0IE9PD
 ji+iO+hRyXUBUWhVioBoboENvfoI7EZcJVUrRIMzcKywbxFvC3OXdc5
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175551_898312_051B504C 
X-CRM114-Status: GOOD (  20.83  )
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

The IRQ handler needs a stable TRBSR_EL1 value before classifying the
interrupt. If the PE can still generate trace, or if pending trace has
not been flushed, TRBSR can still change while the handler is sampling
it. This is especially important for TRBSR.S bit, which is used to
decide whether the TRBE has stopped.

Move the drain buffer into arm_trbe_prohibit_trace(), so the handler
first prohibits trace and flushes trace before reading TRBSR_EL1. Once
this has been done, the IRQ path no longer needs the unconditional
trbe_drain_and_disable_local(); it only needs to disable TRBE before
handling the stopped-buffer status.

Refactor the IRQ exit path accordingly: restore TRFCR on non-truncated
exits, while the truncated path still runs the perf IRQ work to shut
down the event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 40 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index c83c440d4ac13c346bc2a7f9093951c186c90157..36f143a15e680b28aa6ca6a43ad7d3ee134693be 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1207,24 +1207,34 @@ static bool is_perf_trbe(struct perf_output_handle *handle)
 	return true;
 }
 
-static u64 cpu_prohibit_trace(void)
+static u64 arm_trbe_prohibit_trace(void)
 {
 	u64 trfcr = read_trfcr();
 
 	/* Prohibit tracing at EL0 & the kernel EL */
 	write_trfcr(trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE));
+
+	/* Ensure the program-flow trace is flushed */
+	trbe_drain_buffer();
+
 	/* Return the original value of the TRFCR */
 	return trfcr;
 }
 
+static void arm_trbe_allow_trace(u64 trfcr)
+{
+	/* Allow tracing at EL0 & the kernel EL */
+	write_trfcr(trfcr);
+}
+
 static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 {
 	struct trbe_cpudata *cpudata = dev;
 	struct perf_output_handle *handle = cpudata->handle;
 	enum trbe_fault_action act;
-	u64 status;
 	bool truncated = false;
-	u64 trfcr;
+	u64 status, trfcr;
+	irqreturn_t ret;
 
 	if (!handle || !perf_get_aux(handle))
 		return IRQ_NONE;
@@ -1232,22 +1242,25 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	if (!is_perf_trbe(handle))
 		return IRQ_NONE;
 
+	/* Prohibit the CPU from tracing before we disable the TRBE */
+	trfcr = arm_trbe_prohibit_trace();
+
 	/* Reads to TRBSR_EL1 is fine when TRBE is active */
 	status = read_sysreg_s(SYS_TRBSR_EL1);
 	/*
 	 * If the pending IRQ was handled by update_buffer callback
 	 * we have nothing to do here.
 	 */
-	if (!is_trbe_irq(status))
-		return IRQ_NONE;
+	if (!is_trbe_irq(status)) {
+		ret = IRQ_NONE;
+		goto out;
+	}
 
-	/* Prohibit the CPU from tracing before we disable the TRBE */
-	trfcr = cpu_prohibit_trace();
 	/*
 	 * Ensure the trace is visible to the CPUs and
 	 * any external aborts have been resolved.
 	 */
-	trbe_drain_and_disable_local(cpudata);
+	set_trbe_disabled(cpudata);
 	clr_trbe_irq();
 	isb();
 
@@ -1272,12 +1285,15 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	 * Otherwise, restore the trace filter controls to
 	 * allow the tracing.
 	 */
-	if (truncated)
+	if (truncated) {
 		irq_work_run();
-	else
-		write_trfcr(trfcr);
+		return IRQ_HANDLED;
+	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+out:
+	arm_trbe_allow_trace(trfcr);
+	return ret;
 }
 
 static int arm_trbe_save(struct coresight_device *csdev)

-- 
2.34.1


