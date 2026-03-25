Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B93109C024
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo5cfVGssnY8U27hiT6/W5y+D4l6fQe5QX8zxeFsdWM=; b=OM+/tKbBSKIE0YQLzMpklmWrJG
	UFZvIJt/N/SXgMYfuA2+9UdIo+3/z2MsoQBSfUDL00YKdUYN6WuSqbnWvXGh6YQa0DihiLjBp2CWd
	Dbk2Fdc1oE0ZUQV+n8tV2SdouEGde87N/EmmqjUJpscmnj4wJoql3ZCSIsuUR+t3f5aHGdpULcVT8
	hRX/UmwHIQ2zVZcI1cRshknAKinWy/9qwAQQiy8ugy7w9ngMsHjnjJDTZdoulN76PJm0ocgRJJY1I
	79qlJHiwsm3jduVuEVqVOfesJMxzUGp4qb9OqgrWNXMU13l0zq5vT7XyTjiAToWvv6wCW25Wa4ezE
	at4zuwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCo-00000003Zu6-1kzp;
	Wed, 25 Mar 2026 14:27:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCS-00000003Zcy-45S5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C9B91F02;
	Wed, 25 Mar 2026 07:27:06 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6A83FE14;
	Wed, 25 Mar 2026 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448832; bh=8m2jYQblCVKQdhIjY3RKAMPDiJjs+5Wrpr63vYXvv7I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OGmFQ18dH+mceChry7b4153g+WAQ835a06dgcwsTuU9vnmtZVUrtUXSOK+btOjLYr
	 uyN3AGX2w0xIHX4PO8FvyYq8Ag/mlM5e+CKIcvHeZcTHQWh+RKo3OnlggzN8PALGLz
	 9+RwFheJLy5EUh+dsnWLgnq2G/1ETa/0NVF74U4s=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:43 +0000
Subject: [PATCH v8 06/23] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-6-7b1902e18041@arm.com>
References: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
In-Reply-To: <20260325-arm_coresight_path_power_management_improvement-v8-0-7b1902e18041@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448816; l=5257;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=8m2jYQblCVKQdhIjY3RKAMPDiJjs+5Wrpr63vYXvv7I=;
 b=DmnkAFRvDyIrKbTDekEtOeadVEjDH3by000g/MmYfP8QZXalqvO6XlSH+++uw0BOfdYXlRIxj
 EUKsL0Q9evUAqGZHFFoNwxqAjXZ+pOiEBnY4SYiWP5WokGhzkBD12Ri
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072713_144059_F8191EB3 
X-CRM114-Status: GOOD (  22.00  )
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
If a source device provides callbacks for saving and restoring context,
these callbacks will be invoked in CPU suspend and resume.

With this change, there is an edge case can occur: the CPU PM notifier
may access the per-CPU source pointer while the ETM module is being
unloaded, which clears the per-CPU pointer and releases the pointed
csdev.  This race will be fixed in a later change that extends control
the entire path.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 84 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  2 +
 2 files changed, 86 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 93acbd36c9c0efcc311c5374463b2ae9a4e6e49b..c14a1d1b4d8c3d742dcbfb07e0cd8d7a905cca22 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/build_bug.h>
+#include <linux/cpu_pm.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/types.h>
@@ -1671,6 +1672,82 @@ static void coresight_release_device_list(void)
 	}
 }
 
+static bool coresight_pm_is_needed(struct coresight_device *csdev)
+{
+	if (!csdev)
+		return false;
+
+	/* pm_save_disable() and pm_restore_enable() must be paired */
+	if (!coresight_ops(csdev)->pm_save_disable ||
+	    !coresight_ops(csdev)->pm_restore_enable)
+		return false;
+
+	/* Save and restore only if the source is active */
+	if (coresight_get_mode(csdev))
+		return true;
+
+	return false;
+}
+
+static int coresight_pm_device_save(struct coresight_device *csdev)
+{
+	return coresight_ops(csdev)->pm_save_disable(csdev);
+}
+
+static void coresight_pm_device_restore(struct coresight_device *csdev)
+{
+	coresight_ops(csdev)->pm_restore_enable(csdev);
+}
+
+static int coresight_pm_save(struct coresight_device *source)
+{
+	return coresight_pm_device_save(source);
+}
+
+static void coresight_pm_restore(struct coresight_device *source)
+{
+	coresight_pm_device_restore(source);
+}
+
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	struct coresight_device *source =
+		coresight_get_percpu_source(smp_processor_id());
+
+	if (!coresight_pm_is_needed(source))
+		return NOTIFY_OK;
+
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		if (coresight_pm_save(source))
+			return NOTIFY_BAD;
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		coresight_pm_restore(source);
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
@@ -1725,9 +1802,15 @@ static int __init coresight_init(void)
 
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
@@ -1739,6 +1822,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index e9c20ceb9016fa3db256b8c1147c1fd2027b7b0d..5f9d7ea9f5941ab01eb6a084ca558a9417c7727f 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -438,6 +438,8 @@ struct coresight_ops_panic {
 struct coresight_ops {
 	int (*trace_id)(struct coresight_device *csdev, enum cs_mode mode,
 			struct coresight_device *sink);
+	int (*pm_save_disable)(struct coresight_device *csdev);
+	void (*pm_restore_enable)(struct coresight_device *csdev);
 	const struct coresight_ops_sink *sink_ops;
 	const struct coresight_ops_link *link_ops;
 	const struct coresight_ops_source *source_ops;

-- 
2.34.1


