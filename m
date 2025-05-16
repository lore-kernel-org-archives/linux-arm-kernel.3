Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66210C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRNenfeV6P9u0J4kp43yDnVtZCs8oJfZW7t+BVyzj6Y=; b=AM96hVnld05jU3Qq6p2y5eKWae
	AvQPDBkqSSbZD3qdE/zyMcec5tVRqCnBMi7vtybDasHF+FA6cfCZavISbipirYIVVYOiYQK7+y4Ta
	ybdA0AK93ampBRSQOQbbOxtEMxmwqrSOtPCanDuoI4jb1If+nuFFLAQC5n7BqZfRoVCbRJran0ALx
	QC48iMXLNwIksobUT2Su8YDVdtnSgjOdLYFc6/QAN4aFxQvX7v78FO65fDXz0yCpC6VrQD7xqSe5A
	eU4zEwR8/iP0/okc2bLhPmedqDAey7cMbtX5ukhr5ZVOQmomy9wBx47kIQruU6DCRCirsnHNSw1YC
	ELHeezrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxyD-000000041TN-0FPO;
	Fri, 16 May 2025 16:31:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxbF-00000003yOs-2hfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:07:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 338341BF7;
	Fri, 16 May 2025 09:07:41 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16C153F63F;
	Fri, 16 May 2025 09:07:51 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Yabin Cui <yabinc@google.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 03/11] coresight: Register CPU PM notifier in core layer
Date: Fri, 16 May 2025 17:07:34 +0100
Message-Id: <20250516160742.1200904-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516160742.1200904-1-leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_090753_773364_2AC5161D 
X-CRM114-Status: GOOD (  20.54  )
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

The current implementation only saves and restores the context for ETM
sources while ignoring the context of links.  However, if funnels or
replicators on a linked path resides in a CPU or cluster power domain,
the hardware context for the link will be lost after resuming from low
power states.

To support context management for links during CPU low power modes, a
better way is to implement CPU PM callbacks in the Arm CoreSight core
layer.  As the core layer has sufficient information for linked paths,
from tracers to links, which can be used for power management.

As a first step, this patch registers CPU PM notifier in the core layer.
If a source driver provides callbacks for saving and restoring context,
these callbacks will be invoked in CPU suspend and resume.

Further changes will extend for controlling path.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  4 ++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1503037662f2..7ab7321ca8d5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/build_bug.h>
+#include <linux/cpu_pm.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -421,6 +422,21 @@ int coresight_resume_source(struct coresight_device *csdev)
 }
 EXPORT_SYMBOL_GPL(coresight_resume_source);
 
+static int coresight_save_source(struct coresight_device *csdev)
+{
+	if (csdev && source_ops(csdev)->save)
+		return source_ops(csdev)->save(csdev);
+
+	/* Return success if callback is not supported */
+	return 0;
+}
+
+static void coresight_restore_source(struct coresight_device *csdev)
+{
+	if (csdev && source_ops(csdev)->restore)
+		source_ops(csdev)->restore(csdev);
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -1566,6 +1582,45 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 }
 EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	unsigned int cpu = smp_processor_id();
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
+
+	if (!source)
+		return NOTIFY_OK;
+
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		if (coresight_save_source(source))
+			return NOTIFY_BAD;
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		coresight_restore_source(source);
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block coresight_cpu_pm_nb = {
+	.notifier_call = coresight_cpu_pm_notify,
+};
+
+static int __init coresight_pm_setup(void)
+{
+	return cpu_pm_register_notifier(&coresight_cpu_pm_nb);
+}
+
+static void coresight_pm_cleanup(void)
+{
+	cpu_pm_unregister_notifier(&coresight_cpu_pm_nb);
+}
+
 const struct bus_type coresight_bustype = {
 	.name	= "coresight",
 };
@@ -1620,9 +1675,15 @@ static int __init coresight_init(void)
 
 	/* initialise the coresight syscfg API */
 	ret = cscfg_init();
+	if (ret)
+		goto exit_notifier;
+
+	ret = coresight_pm_setup();
 	if (!ret)
 		return 0;
 
+	cscfg_exit();
+exit_notifier:
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
 exit_perf:
@@ -1634,6 +1695,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4ac65c68bbf4..64cee4040daa 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -400,6 +400,8 @@ struct coresight_ops_link {
  * @disable:	disables tracing for a source.
  * @resume_perf: resumes tracing for a source in perf session.
  * @pause_perf:	pauses tracing for a source in perf session.
+ * @save:	save context for a source.
+ * @restore:	restore context for a source.
  */
 struct coresight_ops_source {
 	int (*cpu_id)(struct coresight_device *csdev);
@@ -409,6 +411,8 @@ struct coresight_ops_source {
 			struct perf_event *event);
 	int (*resume_perf)(struct coresight_device *csdev);
 	void (*pause_perf)(struct coresight_device *csdev);
+	int (*save)(struct coresight_device *csdev);
+	void (*restore)(struct coresight_device *csdev);
 };
 
 /**
-- 
2.34.1


