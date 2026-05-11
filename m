Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F88CD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74hk2E4TcSXfK9oGl1RyZ5mJNDzEhXI+CU+GPu3MYD8=; b=m4YfKU0inc2r8+Ku8bMakyPqX5
	15k/M9r3LVKcb3LpuBbxdkszLod6Vz2ijDHyTyQD3uRW0jMfJ+PDMIkGxdRUtdHZBbhMn+RzStrAE
	xBy2VoAxySvZIeIS4rAHaAZz79+G20kzRhlRDkojrCtI1UQfVjxVFERpMdDM2LDJ0SU5Lsgh6oB18
	k1m7+JXEDNgXYYjEHKHH+q7h5L6oIE6v9n9w0O7ZaYXR/Wg27Ibk1k5BpvHW0a1VXrPxjXM36lOc4
	ddrdX99rCULqRQF/yaPZmkpZpXTJVjGF83mf9rhOY2JHfEyDU8OmZsn1v8LM8fvrUabc9lwOkujp+
	+kZ/as5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY8-0000000DFRH-1Je3;
	Mon, 11 May 2026 11:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOY1-0000000DFHU-2qTV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=74hk2E4TcSXfK9oGl1RyZ5mJNDzEhXI+CU+GPu3MYD8=; b=QcGYuIBgO/hQrvS+I1DGdP3m+f
	IMLbHqGHd8uwMz9wBVvYtkhQAnjw9o2r1FIaI0wxY0s/HFmOZn5biDzUqeIAIeOuTMhkUFST3bdSZ
	ug1HMmgUlZFDvK8sr17kxAHX6IPoE/E6pBXLUTLAtfce+wG+lkuPyYscVW35g7u+iSAVA2O91LlxM
	YqUkCuzC2gUOZ7zxRaZYjvYLoo4urXjBt6d8J4LLzKuonMn2m2aRkmMBBKzI9vgYAhRIe/57txKoQ
	quHo0Hn+NIQJDVRz3V55zfwwOILY+B2AOvg42NpCx0m8Hyr137TwoBFrJUYAg7l91yalrLvIdK7l+
	va0LMcBA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXy-0000000BQk8-02N9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4393F1756;
	Mon, 11 May 2026 04:11:31 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 316A03F85F;
	Mon, 11 May 2026 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497896; bh=VxYcpCpYE/2++YyffR4TKl7EroRMMTlqhWV+/mi/0cU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ELqeHymZtIXYzn0URS4OdSJjav9B9kfpqD0X+udN8rDg5y1g5zj9yOhOSh2yzSGXU
	 0afGJjzrGdn/sfwbK+bbGaDAZghxdC+fECgq3tFUmvtlkuvFtXyCO7i4DcLKBAmq9T
	 pZSL+MOte7iY6IaFdqyiWdk7cDrcCEuL0V/A+iYo=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:10:55 +0100
Subject: [PATCH v12 11/28] coresight: Register CPU PM notifier in core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-11-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=5369;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VxYcpCpYE/2++YyffR4TKl7EroRMMTlqhWV+/mi/0cU=;
 b=Tnvt8oO/ujgUmwYIl0bAm9kMPh4KjaD2Gbw1Kf7GYP+icr86fiD0lywGY3a79dyHcfeXPbQKK
 NbzlIZsSV26BGn+TMEA8S638MHvc9+sgmnjf+Vt9H/DiD1uwz9thUL+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121138_728986_03C383D7 
X-CRM114-Status: GOOD (  22.93  )
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
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 93 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  2 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index b8d9a457458018a776c716341966824eb5080143..c525ecaad7efc40150d2d8ef3a6decddb68aff69 100644
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
@@ -1738,6 +1739,91 @@ static void coresight_release_device_list(void)
 	}
 }
 
+static struct coresight_device *coresight_cpu_get_active_source(void)
+{
+	struct coresight_device *source;
+	bool is_active = false;
+
+	source = coresight_get_percpu_source_ref(smp_processor_id());
+	if (!source)
+		return NULL;
+
+	if (coresight_get_mode(source) != CS_MODE_DISABLED)
+		is_active = true;
+
+	coresight_put_percpu_source_ref(source);
+
+	/*
+	 * It is expected to run in atomic context, so it cannot be preempted
+	 * to disable the source. Here returns the active source pointer
+	 * without concern that its state may change. Since the build path has
+	 * taken a reference on the component, the source can be safely used
+	 * by the caller.
+	 */
+	return is_active ? source : NULL;
+}
+
+static int coresight_pm_is_needed(struct coresight_device *csdev)
+{
+	if (!csdev)
+		return 0;
+
+	/* pm_save_disable() and pm_restore_enable() must be paired */
+	if (coresight_ops(csdev)->pm_save_disable &&
+	    coresight_ops(csdev)->pm_restore_enable)
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
+static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
+				   void *v)
+{
+	struct coresight_device *csdev = coresight_cpu_get_active_source();
+
+	if (!coresight_pm_is_needed(csdev))
+		return NOTIFY_DONE;
+
+	switch (cmd) {
+	case CPU_PM_ENTER:
+		if (coresight_pm_device_save(csdev))
+			return NOTIFY_BAD;
+		break;
+	case CPU_PM_EXIT:
+	case CPU_PM_ENTER_FAILED:
+		coresight_pm_device_restore(csdev);
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
@@ -1792,9 +1878,15 @@ static int __init coresight_init(void)
 
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
@@ -1806,6 +1898,7 @@ static int __init coresight_init(void)
 
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


