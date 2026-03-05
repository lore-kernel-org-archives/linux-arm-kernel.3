Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D9EF3092D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+wIFHS+0xYCQwNnsBAL+lVbyzXnHjn52PW8oJd0Q1M=; b=nfeY+g2E6DC8/21uKsMHOdNdGT
	Y17e5jOJckAVN1l6gvutipRDC5sx1micm7NnPBpT8DgCMMjGUPOo/1dU376PgO52YJADhSEORe+GS
	dXmAe1gtpTwNk9xiLMcbwcUk3zD1ctc35TfQPlfvWg42ypvphfBCPc2mGd5hdY65tGlHUeGurUfHj
	jxhYmbiQtcD2sABDyho73THNLmHpCqwScooLAQhNbxv4s8RKITYxuvmaqn+0xRb7+JZ+7WXkugz/S
	vk/sCUvZHDVIAGVl1FB3Gzxo14tinWNOYKSywkGG/P73/Xd14GiGQyAXW3V1SASLlcmb7wD8AuZwU
	/d91ZR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mH-00000001Xks-3Upf;
	Thu, 05 Mar 2026 10:17:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5mD-00000001Xhy-3xX1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:17:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3827339;
	Thu,  5 Mar 2026 02:17:46 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C8663F694;
	Thu,  5 Mar 2026 02:17:50 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 05 Mar 2026 10:17:34 +0000
Subject: [PATCH v6 03/19] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm_coresight_path_power_management_improvement-v6-3-eff765d211a9@arm.com>
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772705864; l=4615;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dsh1xZUlfNULmwyci2cBAhysWetg9VUqM7X8V9RsT1w=;
 b=trwGPK1os6ywBmfVyZjz5M9R6FT9qFh98jJxayOjbZrM1Orv4w8mhFIyEFH4lkMw8giOtAFLb
 JifNEVJZ0CLC+mhcaoxi4CEPcbwI7scsqF8ymlpTHFYd/Yi9N61damK
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_021754_074309_AA76BC29 
X-CRM114-Status: GOOD (  19.25  )
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
index cda1e9b065a056e57030e52e07502554c71014ca..5f7930ef537e2877649c404858d9fe6f593af037 100644
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
@@ -1670,6 +1671,68 @@ static void coresight_release_device_list(void)
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
@@ -1724,9 +1787,15 @@ static int __init coresight_init(void)
 
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
@@ -1738,6 +1807,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6810acc8533e0eb0c5d41a7fbe0bbd03eb94057d..63d77a064d9431d512b6407946c403f5c331d086 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -437,6 +437,8 @@ struct coresight_ops_panic {
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


