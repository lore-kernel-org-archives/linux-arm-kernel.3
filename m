Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56768CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWEgEjX5k9xog5AkC9XIxAGgdhl+C+Q6D41OTZLn2m0=; b=Slz4r0rBK1pX8IrMAp+UJhyt6T
	xe62omdN3Z2A3bwcLsXft3O4y+gYNmFcBoFOpZYSHE76w/Al1HoRc4+EDRCyHNLmdGtgIqWTQCcLY
	+16p4w2q6I2RdX+LSbSEMmgiuPxLLtYTPw3bisQVbOF6sAHZzAhPDanD44bMD8eoc/I2LTeVz2c12
	o/cGDiujdIVCAIqVhjIlZcq1+LIwmRVZZeSnbqGdJF6e2anb4vDdW4cxGDek4nN7+Zlxl48B/8Rlh
	1hOaahHxyKDFZeGKS2zQ5HwOsO/3ogEWS4XF5k4AK7g0CsdiGHAglRUPN+c8FVAmP9EUmakQMcRhh
	1L/MNyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3E-00000007S4R-2oz2;
	Fri, 01 May 2026 16:49:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3A-00000007RxK-0cDq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C62A4387;
	Fri,  1 May 2026 09:49:05 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7932D3F7B4;
	Fri,  1 May 2026 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654151; bh=pg4NusVt0AWfAVaB11vsoKuKRgpBj4M/elxPwG5KSEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M2E/aVmZBTDwad1VFiVLWRAMnmpq+4qkZwwtsYrHvuMVB9X41+338GS9A0FuKH+Fi
	 nCXJlHKubSRau0ehpTdTqOa9fPF6uWMt3dzepTiCfhCI9ODb+ovdRlX4QZVDodBf5C
	 LtqKCG4OL7cuDU/EG8A1x9Enogzslq2H+880HxtM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:03 +0100
Subject: [PATCH v11 22/27] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-22-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=5639;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=pg4NusVt0AWfAVaB11vsoKuKRgpBj4M/elxPwG5KSEA=;
 b=yYfjBBXo1rqLXQbZ0iCJ2EDyJRKqXCZC2venXl889rkv+1jtQJoO4WMND24/xVJcnSxHdrLEe
 ernySZF3SJLBX3IO92IiPu2PoD40OgSFemuFlFXYveptvaPtW4yWjyX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_094912_306778_A622B07A 
X-CRM114-Status: GOOD (  21.65  )
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

Extend the CPU PM flow to control the path: disable from source up to
the node before the sink, then re-enable the same range on restore.
To avoid latency, control it up to the node before the sink.

Track per-CPU PM restore failures using percpu_pm_failed.  Once a CPU
hits a restore failure, set the percpu_pm_failed and return NOTIFY_BAD
on subsequent notifications to avoid repeating half-completed
transitions.

Setting percpu_pm_failed permanently blocks CPU PM on that CPU.  Such
failures are typically seen during development; disabling PM operations
simplifies the implementation, and a warning highlights the issue.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 90 +++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b45fb38eb9d652e44802c23ea4ee3b051d635207..d65bb2ea7b0560d44abf302a3939b3744ca0c880 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -38,6 +38,7 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
 static DEFINE_RAW_SPINLOCK(coresight_dev_lock);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
+static DEFINE_PER_CPU(bool, percpu_pm_failed);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -1822,7 +1823,7 @@ static void coresight_release_device_list(void)
 	}
 }
 
-static struct coresight_device *coresight_cpu_get_active_source(void)
+static struct coresight_path *coresight_cpu_get_active_path(void)
 {
 	struct coresight_device *source;
 	bool is_active = false;
@@ -1838,22 +1839,32 @@ static struct coresight_device *coresight_cpu_get_active_source(void)
 
 	/*
 	 * It is expected to run in atomic context, so it cannot be preempted
-	 * to disable the source. Here returns the active source pointer
-	 * without concern that its state may change. Since the build path has
-	 * taken a reference on the component, the source can be safely used
-	 * by the caller.
+	 * to disable the path. Here returns the active path pointer without
+	 * concern that its state may change. Since the build path has taken
+	 * a reference on the component, the path can be safely used by the
+	 * caller.
 	 */
-	return is_active ? source : NULL;
+	return is_active ? source->path : NULL;
 }
 
-static int coresight_pm_is_needed(struct coresight_device *csdev)
+/* Return: 1 if PM is required, 0 if skip, or a negative error */
+static int coresight_pm_is_needed(struct coresight_path *path)
 {
-	if (!csdev)
+	struct coresight_device *source;
+
+	if (this_cpu_read(percpu_pm_failed))
+		return -EIO;
+
+	if (!path)
+		return 0;
+
+	source = coresight_get_source(path);
+	if (!source)
 		return 0;
 
 	/* pm_save_disable() and pm_restore_enable() must be paired */
-	if (coresight_ops(csdev)->pm_save_disable &&
-	    coresight_ops(csdev)->pm_restore_enable)
+	if (coresight_ops(source)->pm_save_disable &&
+	    coresight_ops(source)->pm_restore_enable)
 		return 1;
 
 	return 0;
@@ -1869,22 +1880,71 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
+static int coresight_pm_save(struct coresight_path *path)
+{
+	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+	int ret;
+
+	ret = coresight_pm_device_save(source);
+	if (ret)
+		return ret;
+
+	from = coresight_path_first_node(path);
+	/* Disable up to the node before sink */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	coresight_disable_path_from_to(path, from, to);
+
+	return 0;
+}
+
+static void coresight_pm_restore(struct coresight_path *path)
+{
+	struct coresight_device *source = coresight_get_source(path);
+	struct coresight_node *from, *to;
+	int ret;
+
+	from = coresight_path_first_node(path);
+	/* Enable up to the node before sink */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	ret = coresight_enable_path_from_to(path, coresight_get_mode(source),
+					    from, to);
+	if (ret)
+		goto path_failed;
+
+	coresight_pm_device_restore(source);
+	return;
+
+path_failed:
+	pr_err("Failed in coresight PM restore on CPU%d: %d\n",
+	       smp_processor_id(), ret);
+
+	/*
+	 * Once PM fails on a CPU, set percpu_pm_failed and leave it set until
+	 * reboot. This prevents repeated partial transitions during idle
+	 * entry and exit.
+	 */
+	this_cpu_write(percpu_pm_failed, true);
+}
+
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
-	struct coresight_device *csdev = coresight_cpu_get_active_source();
+	struct coresight_path *path = coresight_cpu_get_active_path();
+	int ret;
 
-	if (!coresight_pm_is_needed(csdev))
-		return NOTIFY_DONE;
+	ret = coresight_pm_is_needed(path);
+	if (ret <= 0)
+		return ret ? NOTIFY_BAD : NOTIFY_DONE;
 
 	switch (cmd) {
 	case CPU_PM_ENTER:
-		if (coresight_pm_device_save(csdev))
+		if (coresight_pm_save(path))
 			return NOTIFY_BAD;
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
-		coresight_pm_device_restore(csdev);
+		coresight_pm_restore(path);
 		break;
 	default:
 		return NOTIFY_DONE;

-- 
2.34.1


