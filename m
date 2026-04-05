Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F960E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etEPCve19eAbqb7MaZr8906wG/X7CIuQun2I6teii7o=; b=wiJbV+gmZANApUOAnfbTqf6eAY
	RdOJ1X3ERRM0aUjs3wOE5vHoWisytCv7iwhBEaD90iV6uJ5DmwRMlsFQ/sGzv3f/fYHryq3WUCR2a
	4AHVMZQ0IenypVAZCsROmAd/LCWZFpb773lEqUW9nUWVb8aiYJ2KSqOYR2m764pR1enVvon1ZKirh
	3CJiueswWHRGJc//g72V5I2isWuzznM0bn+h3VTGerGcI/WJLwOO2QJ/YKaL8IiWFtkVq1eYOGXIt
	X+dSDKQUHgJgFsNcruxchwXqM3TugtCNtQ+RaACfH+eni7qRzZ2T+V4NIRu7uN0urFnz1OAljM9o/
	MfLU33jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0Y-00000004HHt-3fBG;
	Sun, 05 Apr 2026 15:03:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0W-00000004HFm-1xjE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53F2F1758;
	Sun,  5 Apr 2026 08:03:17 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61BA83F62B;
	Sun,  5 Apr 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401403; bh=wr9r75a/1gNTIq2VM7wMCi/ynidStxbJiD2LTI3Fd98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WPWOpn36ia79Frks9XrIgncSShY4Ji+MZ7NcTfTrgrDQp5qWK/mwXBrmsjycgJw2A
	 yTeYr7qJ54P1TsD9L1nXGOqV8UnFErvZoKC9UVmKLK6KKSiK+eV8SuuE9gCMe65wzF
	 U6iW1Wab2QJuV6sEGl4ZcSaf66NrI/KHbsjd+PhA=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:43 +0100
Subject: [PATCH v10 07/20] coresight: Register CPU PM notifier in core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-7-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=5701;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=wr9r75a/1gNTIq2VM7wMCi/ynidStxbJiD2LTI3Fd98=;
 b=2lK7ltCaFV13v72aGx45pewgpoHnWl+uBrppzshS9zy5KhTD/rTDFBEVnNFECjOCyT/aYtvKO
 vIGOc0dtmb6CQRwNkkHoCs9rSObeEKIJHbFGc5giPgiYtCoR7GPOsc1
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080324_618714_78F09D69 
X-CRM114-Status: GOOD (  21.81  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 101 +++++++++++++++++++++++++++
 include/linux/coresight.h                    |   2 +
 2 files changed, 103 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 74c9f0dd43784dd735885249c1e50fc86f610582..967eac5027a1f02cde29fb3a7be36304c90320b2 100644
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
@@ -431,6 +432,11 @@ void coresight_set_percpu_local_path(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_set_percpu_local_path);
 
+static struct coresight_path *coresight_get_percpu_local_path(void)
+{
+	return this_cpu_read(percpu_path);
+}
+
 /*
  * coresight_disable_path_from : Disable components in the given path beyond
  * @nd in the list. If @nd is NULL, all the components, except the SOURCE are
@@ -1647,6 +1653,94 @@ static void coresight_release_device_list(void)
 	}
 }
 
+/* Return: 1 if PM is required, 0 if skip */
+static int coresight_pm_check(struct coresight_path *path)
+{
+	struct coresight_device *source;
+	bool source_has_cb;
+
+	if (!path)
+		return 0;
+
+	source = coresight_get_source(path);
+	if (!source)
+		return 0;
+
+	/* Don't save and restore if the source is inactive */
+	if (coresight_get_mode(source) == CS_MODE_DISABLED)
+		return 0;
+
+	/* pm_save_disable() and pm_restore_enable() must be paired */
+	source_has_cb = coresight_ops(source)->pm_save_disable &&
+			coresight_ops(source)->pm_restore_enable;
+	if (source_has_cb)
+		return 1;
+
+	return 0;
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
+static int coresight_pm_save(struct coresight_path *path)
+{
+	struct coresight_device *source = coresight_get_source(path);
+
+	return coresight_pm_device_save(source);
+}
+
+static void coresight_pm_restore(struct coresight_path *path)
+{
+	struct coresight_device *source = coresight_get_source(path);
+
+	coresight_pm_device_restore(source);
+}
+
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	struct coresight_path *path = coresight_get_percpu_local_path();
+
+	if (!coresight_pm_check(path))
+		return NOTIFY_DONE;
+
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		if (coresight_pm_save(path))
+			return NOTIFY_BAD;
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		coresight_pm_restore(path);
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
@@ -1701,9 +1795,15 @@ static int __init coresight_init(void)
 
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
@@ -1715,6 +1815,7 @@ static int __init coresight_init(void)
 
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


