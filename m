Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565C4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J/COUKfF9ORn1etlJzw/FAtKEjXrmH6dmE+kyhup8k=; b=OalRJ3/ORCjSfLUIuP/zbMDEIp
	cM4mN1kziLEqO+R7Wl585JOuO38Tabu31LQhyPWLMCJK837yM5mZGmbbLSQgh96XJIqwmaTFTTlww
	AR5MkpjJpGL+jsgT/U7SEvPX6mP1G7oIF1WqvIFXmdjWX9R7GiS/MH7OesBoGE4D7nKgEWHwV92DB
	e/7MVsP70VI9UYJK3XlNUHnBlBDAQFTIIvYRt1zHu8J9F8xrO68+kbMrc4CsQ6OosvKoGp7qyCBDq
	umtvWsLBKFTmGMGkHVaTlIYREzROajHBB7bc2NSdV1OBxicyrbEWSdQTWMG2WVgfiXl84uyFMp4VW
	v9rRi1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxem-0000000994V-25Yl;
	Fri, 15 May 2026 18:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeY-000000098cN-0Jo7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:53:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738221516;
	Fri, 15 May 2026 11:52:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C87693F836;
	Fri, 15 May 2026 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871173; bh=cyHVTWtWvm5BQUz02+5zqNUl5mmRgRbeuJ99qzspix0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dOWeicv56ycaE6GaVABN1EGCiW8LaxbDk0OR4Qsmo/XeROru28vV5/DYsJQsICGvu
	 /OprFlOBaMmMl3frWGAloobkAX0oKLJuiN2hRRORK2EQTjodgmHFPkmDupK3vWufe9
	 XJ+h4/7lV/MUzViWCsFbsvIhtaUesbP4RmXVDdjg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:46 +0100
Subject: [PATCH v13 23/28] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-23-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=6053;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cyHVTWtWvm5BQUz02+5zqNUl5mmRgRbeuJ99qzspix0=;
 b=5oI7kUBEX2plSpuhJAIvYa5NxLoYMeQgkDMBilOUeJ+XdDg+Rmxx0+IZNnOVvrZeUGziZUEnC
 VPVQ26UXUAyCRlP2Z+umupACDrhIjOiJGKMRC3MNnBzgQJggFGN+5mH
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115254_208770_9AEFE61F 
X-CRM114-Status: GOOD (  22.25  )
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
Clear this flag when the source device is unregistered.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 93 +++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 15 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7f6febd20faa64bc99336b368d0193221706fc2d..23c2719c95d5b04077a4c63246f21f59b67998f4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -38,6 +38,7 @@ static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
 
 static DEFINE_RAW_SPINLOCK(coresight_dev_lock);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
+static DEFINE_PER_CPU(bool, percpu_pm_failed);
 
 /**
  * struct coresight_node - elements of a path, from source to sink
@@ -121,6 +122,9 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
 	if (!csdev || !coresight_is_percpu_source(csdev))
 		return;
 
+	/* Clear percpu_pm_failed */
+	this_cpu_write(percpu_pm_failed, false);
+
 	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
 
 	/* The per-CPU pointer should contain the same csdev */
@@ -1843,7 +1847,7 @@ static void coresight_release_device_list(void)
 	}
 }
 
-static struct coresight_device *coresight_cpu_get_active_source(void)
+static struct coresight_path *coresight_cpu_get_active_path(void)
 {
 	struct coresight_device *source;
 	bool is_active = false;
@@ -1859,22 +1863,32 @@ static struct coresight_device *coresight_cpu_get_active_source(void)
 
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
@@ -1890,22 +1904,71 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
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


