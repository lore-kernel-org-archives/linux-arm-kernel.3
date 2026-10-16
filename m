Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863C1CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/Z8XFWsq6LtUxoUzzb0FzHPSNNkSN8I1TF8y52/Oas=; b=Ao7hjSTwwWS3CladoGVPIwODtt
	QM6CagsFaGsFj8kdVJgpkR+i70rtbILG17oY1sCdcTgYdNOF/W8BvCiOiYGViPaREpA4lqRvvgFE3
	rbx10hVYZY88YKx4ByjTX65mTqNIBYfxc08Bfc46S54WRrUKwV0qLuv71uvrm8d2SiUC1uOyF3VPf
	YUjjadiLXMmA1sbN6SNV0hdUrGek+ViTQXwKRXd+4/C/wLF8kvn1vs1YK/98gQ++Ot0n1aXYV9TcV
	gf559rK93Fh3oWA+tbkM2ufNwDnEFXAHoC34w0q/HT1if0ZBVDoKvSF8zzqn4vN5f4vHQAZ2s65jh
	6dlpU93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlE0-00000003USN-2vZc;
	Fri, 16 Oct 2026 16:56:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlDj-00000003UB9-1NRh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 16:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F/Z8XFWsq6LtUxoUzzb0FzHPSNNkSN8I1TF8y52/Oas=; b=WkILb66y9wG1+qEV6pL8uk7hGX
	JHTJkD3EuidJLn1sT3Rc+MNJmBP8jpSOj6cTODT+2KDuhGo4WT+auA0W+ViNPsRjHYKWvVi0/aNfT
	hNKRp1kVJ2fCiw0V6WHkw60LzQTeT7TRSw4IDXMMnf7X40220Psm4FvdC/iWtk5ELAC01GjMzfrW/
	lnQTHQBVwNevHL486ycC9RRF2xIjA2Z+EHXnB1Gy9CZlhRUjkxcNdw/1qQLQcKwcTOwkpuuTM32rI
	lGHjb+uLPYjm8wEOIDvIK7aEPy1liQ+seqBZriykpbNrYDlzAkk/iukOuSHHvp8hk+Q9M935ZJxod
	NQcWj1og==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlDe-00000001lLn-3ww5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:55:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3A4D1477;
	Fri, 16 Oct 2026 09:55:41 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DAC53F7B4;
	Fri, 16 Oct 2026 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792169745; bh=jQSDfTX7KCQlGmetCLaTuTzuwp7c813o4Owy5qOzP5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cRBRyz/+8IvKSIgFbSMvA9uvCSG+7tuNdOevrrp5ZPluwJdMZBbv7Ht1VQu3LNdad
	 nRS/uVQYbqfynQRItAWey2VCbDFb0wA86wCUGEBBjQo91S5fwT39zapEJ9KVL/J+Lh
	 /1BVkk48fkqlZLpUTcnA9s2obzlN8DgjjqeWdIao=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 17:55:16 +0100
Subject: [PATCH v2 18/23] coresight: trbe: Keep the perf handle in per-CPU
 data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-18-3f57cf3199b1@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792169710; l=6252;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jQSDfTX7KCQlGmetCLaTuTzuwp7c813o4Owy5qOzP5k=;
 b=84njST0tvAq3njdeyxxpj5VhIeB3ZB9auar3XXibVCo/xfmzc5wtv/DsEjQBI58X6AyvpxEOp
 4CLncgktzulAZOOdJKQnC4dRK1PsHGm17jZ+1bwo8G+z/xwf2M1jWzL
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_175547_332708_150FA798 
X-CRM114-Status: GOOD (  20.95  )
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

Arm SPE owns a per-CPU perf output handle for the PMU lifetime. TRBE
instead receives a handle from CoreSight when enabling its sink.

Store that session handle in trbe_cpudata instead of a separate per-CPU
pointer array, and pass the CPU data as the per-CPU IRQ context. Use this
context directly for overflow and spurious interrupt handling so local
hardware control does not depend on the current AUX buffer configuration.

Allocate the CPU data before registering the IRQ and free it after
releasing the IRQ, keeping the IRQ context valid throughout registration.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 44 ++++++++++++----------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 9a469c8009ce8a8a8b804c2b63a68e741f1dceaa..2328aab0a084a0ac123e950f846f404d120ec2c0 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -139,6 +139,7 @@ struct trbe_save_state {
  * @cpu			- CPU this TRBE belongs to.
  * @mode		- Mode of current operation. (perf/disabled)
  * @buf			- Buffer configuration retained for the enabled session.
+ * @handle		- Perf output handle from successful enable until disable.
  * @drvdata		- TRBE specific drvdata
  * @errata		- Bit map for the errata on this TRBE.
  */
@@ -149,6 +150,7 @@ struct trbe_cpudata {
 	int cpu;
 	enum cs_mode mode;
 	struct trbe_buf *buf;
+	struct perf_output_handle *handle;
 	struct trbe_drvdata *drvdata;
 	struct trbe_save_state save_state;
 	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
@@ -156,7 +158,6 @@ struct trbe_cpudata {
 
 struct trbe_drvdata {
 	struct trbe_cpudata __percpu *cpudata;
-	struct perf_output_handle * __percpu *handle;
 	struct hlist_node hotplug_node;
 	int irq;
 	cpumask_t supported_cpus;
@@ -1091,7 +1092,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 		return ret;
 	}
 
-	*this_cpu_ptr(drvdata->handle) = handle;
+	cpudata->handle = handle;
 	cpudata->buf = buf;
 	cpudata->mode = mode;
 	return 0;
@@ -1112,16 +1113,15 @@ static int arm_trbe_disable(struct coresight_device *csdev)
 	trbe_drain_and_disable_local(cpudata);
 	clr_trbe_status();
 
-	*this_cpu_ptr(drvdata->handle) = NULL;
 	buf->cpudata = NULL;
+	cpudata->handle = NULL;
 	cpudata->buf = NULL;
 	cpudata->mode = CS_MODE_DISABLED;
 	return 0;
 }
 
-static void trbe_handle_spurious(struct perf_output_handle *handle)
+static void trbe_handle_spurious(struct trbe_cpudata *cpudata)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	u64 trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
 
 	/*
@@ -1129,11 +1129,12 @@ static void trbe_handle_spurious(struct perf_output_handle *handle)
 	 * back without modifying the buffer parameters to
 	 * retain the trace collected so far.
 	 */
-	set_trbe_enabled(buf->cpudata, trblimitr);
+	set_trbe_enabled(cpudata, trblimitr);
 }
 
-static int trbe_handle_overflow(struct perf_output_handle *handle)
+static int trbe_handle_overflow(struct trbe_cpudata *cpudata)
 {
+	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
 	struct trbe_buf *buf = etm_perf_sink_config(handle);
 	unsigned long size;
@@ -1203,9 +1204,8 @@ static u64 cpu_prohibit_trace(void)
 
 static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 {
-	struct perf_output_handle **handle_ptr = dev;
-	struct perf_output_handle *handle = *handle_ptr;
-	struct trbe_buf *buf;
+	struct trbe_cpudata *cpudata = dev;
+	struct perf_output_handle *handle = cpudata->handle;
 	enum trbe_fault_action act;
 	u64 status;
 	bool truncated = false;
@@ -1232,18 +1232,17 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
 	 * Ensure the trace is visible to the CPUs and
 	 * any external aborts have been resolved.
 	 */
-	buf = etm_perf_sink_config(handle);
-	trbe_drain_and_disable_local(buf->cpudata);
+	trbe_drain_and_disable_local(cpudata);
 	clr_trbe_irq();
 	isb();
 
 	act = trbe_get_fault_act(handle, status);
 	switch (act) {
 	case TRBE_FAULT_ACT_WRAP:
-		truncated = !!trbe_handle_overflow(handle);
+		truncated = !!trbe_handle_overflow(cpudata);
 		break;
 	case TRBE_FAULT_ACT_SPURIOUS:
-		trbe_handle_spurious(handle);
+		trbe_handle_spurious(cpudata);
 		break;
 	case TRBE_FAULT_ACT_FATAL:
 		trbe_truncate_event(handle);
@@ -1507,10 +1506,6 @@ static int arm_trbe_probe_coresight(struct trbe_drvdata *drvdata)
 {
 	int cpu;
 
-	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
-	if (!drvdata->cpudata)
-		return -ENOMEM;
-
 	for_each_cpu(cpu, &drvdata->supported_cpus) {
 		/* If we fail to probe the CPU, let us defer it to hotplug callbacks */
 		if (smp_call_function_single(cpu, arm_trbe_probe_cpu, drvdata, 1))
@@ -1531,7 +1526,6 @@ static int arm_trbe_remove_coresight(struct trbe_drvdata *drvdata)
 		smp_call_function_single(cpu, arm_trbe_disable_cpu, drvdata, 1);
 		arm_trbe_remove_coresight_cpu(drvdata, cpu);
 	}
-	free_percpu(drvdata->cpudata);
 	return 0;
 }
 
@@ -1618,14 +1612,14 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 
 	cpumask_copy(&drvdata->supported_cpus, affinity);
 
-	drvdata->handle = alloc_percpu(struct perf_output_handle *);
-	if (!drvdata->handle)
+	drvdata->cpudata = alloc_percpu(typeof(*drvdata->cpudata));
+	if (!drvdata->cpudata)
 		return -ENOMEM;
 
 	ret = request_percpu_irq_affinity(drvdata->irq, arm_trbe_irq_handler, DRVNAME,
-					  affinity, drvdata->handle);
+					  affinity, drvdata->cpudata);
 	if (ret) {
-		free_percpu(drvdata->handle);
+		free_percpu(drvdata->cpudata);
 		return ret;
 	}
 	return 0;
@@ -1633,8 +1627,8 @@ static int arm_trbe_probe_irq(struct platform_device *pdev,
 
 static void arm_trbe_remove_irq(struct trbe_drvdata *drvdata)
 {
-	free_percpu_irq(drvdata->irq, drvdata->handle);
-	free_percpu(drvdata->handle);
+	free_percpu_irq(drvdata->irq, drvdata->cpudata);
+	free_percpu(drvdata->cpudata);
 }
 
 static int arm_trbe_device_probe(struct platform_device *pdev)

-- 
2.34.1


