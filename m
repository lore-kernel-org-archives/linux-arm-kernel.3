Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26576CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/Rf8nGtL5WzOFxmw3nFlO2jdji0Mr0c82mrZ4ElKvM=; b=nUL6diKWbvewHdry5wD/rb39QJ
	f88/HQY5iofmYHEE18KjCCb6t2vdRlFwG0KxBdzd38cjUkSKSsNmBYKnVwpx0z+RF2Ey/0lOketBT
	6Kdp5Bs+tLy5kXNrCbrh04tcGgTMrh02/Swk7m5LPmlQMK/YQb6D1vrpjg3czdTyMwWIq6LYiznLH
	RkW9ODnVV5ynKLg6g4t9uUPw9t8O4z6jLlHG71J47ikg/1brBm86TK/Nrr9bhyT2Y7xjf3Cq9KsRi
	fdY5ifKBqL+9dnR2nXLJw8mup2hWW1V8wdEXWU6OgTbVJ4fC2Gf9cKuF3TwZhnEy3nINYyhTiTRJW
	W+qR6SqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XM-00000003fvY-36u7;
	Mon, 15 Sep 2025 10:34:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XE-00000003fjv-2meg
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g/Rf8nGtL5WzOFxmw3nFlO2jdji0Mr0c82mrZ4ElKvM=; b=RqRoZt7UrQkQZy3Bh10TGqnJe5
	emHXm0G58SLSnDsvw2fA5mh0Fr88wK81Ges6j+l56VZrzKhIRB3SRpqd/lLX43VLp9sOSGFOGf+y6
	eiOqh7AdyEsE4oD0pAiYglK0V//llfX61n08vGElD9mH2PEJcM4726nt+nrnVtqmYZraRVtZ1/xJN
	0XBYq4ZbdpixH58FIL6nzGgwYedU9TzOsPNlkz0v9fDJ16Hcyzblj4eOGS4TXJpFSVMzOsT5qPS1z
	1kX24nkjQGOuW+AqJcTOxtmmGOZT7QntawqCVub7CuuR5Lu54OZKBnS2A7nNhfxViF5fcDKtUcPL+
	rBk3ikdw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XB-00000006vXU-2CoB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856B41424;
	Mon, 15 Sep 2025 03:34:00 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 279343F66E;
	Mon, 15 Sep 2025 03:34:07 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:37 +0100
Subject: [PATCH v3 14/31] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-14-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=4940;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=KWPJZPn12H3uwjpczb1TPh8aNWv7ZLTuwFyAhKZ689k=;
 b=RaQUyDOLtAqVVhPGcDLdH+D7+ra/QfWJDXhPkUX/riQpDNDO8GPq0q5dZJC++fAWu8xAMoMYz
 GREoZb7D76KAGk2cZ9YriF2hQr4GCU3rGPD795iZ6UrvBkYR8zG+Nmj
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113409_943003_3D508531 
X-CRM114-Status: GOOD (  21.36  )
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
 drivers/hwtracing/coresight/coresight-core.c | 62 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  4 ++
 2 files changed, 66 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 25a530cde8938b366bbb144fdcc107271ebae276..f944a610c85e9e3fce43497543ccc48ab7c2c0d9 100644
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
@@ -422,6 +423,21 @@ int coresight_resume_source(struct coresight_device *csdev)
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
@@ -1575,6 +1591,45 @@ char *coresight_alloc_device_name(struct coresight_dev_list *dict,
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
@@ -1629,9 +1684,15 @@ static int __init coresight_init(void)
 
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
@@ -1643,6 +1704,7 @@ static int __init coresight_init(void)
 
 static void __exit coresight_exit(void)
 {
+	coresight_pm_cleanup();
 	cscfg_exit();
 	atomic_notifier_chain_unregister(&panic_notifier_list,
 					     &coresight_notifier);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 222597ec7a089e10ad763df206917e90f34bb5c2..d0764a9c7692181d2619c277acb83701c6b0115e 100644
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


