Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FC3CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW5YGK0DsbPBgAy8Xp2o2BpFpnkIFbP+8ip0fjrK3Mw=; b=iQLjXUbzpomPRKs4jLe441UeLS
	JRX7yHAA9bSZrqBV8NC7nqXOjjQua3cGHZJH/mKNMbKQqF3u63Vs0SZ1AuhTV7i4LUZbEyBXKWKR0
	tbByLamsb0Bs4R+RhdrO3JHiGK2vTyJpdHNm5l138l4X8aVkbpgew/EX1IbTsdW7g8Pn3fi5INof+
	pjHEhZfS040MTNAM1aeGah0+3g500j4MKvvoCdOlQb2qvSRVyehJCM4zT9P/K18N/AgyBgBne0xPI
	t4d+xSwuBEo06hrm1qhn72L6mzN9yC3t0e8ZWTIWkbiwmgCh7vUc5gtJLmmRMIvrI6q/RIhaH8pu3
	oIZEEZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR8-00000003YpW-2BIk;
	Wed, 19 Nov 2025 15:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkR2-00000003Yjy-1cNi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C99112FC;
	Wed, 19 Nov 2025 07:49:23 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78E5B3F66E;
	Wed, 19 Nov 2025 07:49:29 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:01 +0000
Subject: [PATCH v5 03/19] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-3-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=4679;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qQylAu5/vfiyZ6ff5UD2O7nJEItBPUbbhjzzDRPGN/A=;
 b=n/Fx0gMmJvl4iec2lOPvVRRSE3YTsen7xDKd5kV8TwEdnkONXIpCzHWKuGZHJPdZwrHXOw+Rz
 2hIIrT92PlaBlkOv5dWmlOcdDc8ZV99C8hbacR64XmwcZHlfY1Pujaj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074932_529425_D9A40F77 
X-CRM114-Status: GOOD (  19.22  )
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

Further changes will extend for controlling path.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 70 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  2 +
 2 files changed, 72 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f22fd89f29b97ffe7004a2c988b09d5fd412af8d..2aa1bbc53731637cccbf82ff83702ddc5ff80069 100644
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
@@ -1590,6 +1591,68 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
 }
 EXPORT_SYMBOL_GPL(coresight_alloc_device_name);
 
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
+	return true;
+}
+
+static int coresight_pm_save(struct coresight_device *csdev)
+{
+	return coresight_ops(csdev)->pm_save_disable(csdev);
+}
+
+static void coresight_pm_restore(struct coresight_device *csdev)
+{
+	coresight_ops(csdev)->pm_restore_enable(csdev);
+}
+
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	unsigned int cpu = smp_processor_id();
+	struct coresight_device *source = per_cpu(csdev_source, cpu);
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
@@ -1644,9 +1707,15 @@ static int __init coresight_init(void)
 
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
@@ -1658,6 +1727,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index fcea4f3253671e371570c29a65ef8ec96034f249..25a31a4dd1486cefe6b442ad127954f8411ce949 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -442,6 +442,8 @@ struct coresight_ops_panic {
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


