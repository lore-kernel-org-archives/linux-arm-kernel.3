Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C411099B31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eGijfrPrRwIrxCBI4gIxGNguEANMlXTgvtC4Y+ub34=; b=ITN6dzSNQmK4PTS7D4Ke3DW1p0
	B3b96XzloehD2OMJh0MUWoYe7rbQ2c9qFnt+zu+9bVnGlPJuKjRcDPpuOx/rzMM/bT/myu3kRpl5x
	QepTinkTNEyh4RQIVuqzfeAbODQ7WJm6aK8D16/gUR5jVZUUSwkk0n5ramzyioNKCkK6RZtZ7idst
	4ex32Wt34REHG2X+BMqfLkmJvpOH1GYnn9h+kI8itQkO6PNUPyJIpHrZx9kS7y5D6ljNVrPWh1fLT
	71NKwSbu5Yz7Ew5PVKPz+ed2UzomSvO6rFwjqjin1uGwL5+O2r2xvXy/oFCMUu9gfL9ClbRcm3lFl
	EynKd8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsf-0000000DHxR-0kjk;
	Fri, 20 Mar 2026 17:43:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsS-0000000DHna-3u6p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECCD1596;
	Fri, 20 Mar 2026 10:43:10 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 691113FA1F;
	Fri, 20 Mar 2026 10:43:14 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:47 +0000
Subject: [PATCH v7 05/20] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-5-327ddd36b58b@arm.com>
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=5257;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=5ATGWbzqhs29nI4ELU7SNRSGYfD7S+jgwysgoWf6vjs=;
 b=vWOBcVoo/DvVHZ+Yzd6apYMGP9bAouoYW6f/BIF36nsGvKtZ7sPkm36tICXmlxxZ4jgZipFsB
 QMUWuvDW8xdDzLtFKe3X8e0OXBjTpev6D+J9BppyBcc8eZMelcSfHvT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104317_077884_755271AD 
X-CRM114-Status: GOOD (  20.77  )
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
index df1ea642df7204aeb41c56c2751d0f3a00bbf7a4..7186e7d948829479dfe5ea95c8cd5a03df5fc26c 100644
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
@@ -1652,6 +1653,82 @@ static void coresight_release_device_list(void)
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
@@ -1706,9 +1783,15 @@ static int __init coresight_init(void)
 
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
@@ -1720,6 +1803,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 0f53c692109964de01da06e7210b7788e7f59f36..f771615852b84200e37b844648a13bd18c91593d 100644
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


