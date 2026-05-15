Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE60CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJRfPw8Gd1jyR/AlH9gntgehGI1iIdSOHjPbL8FrKIs=; b=IFqkUpWWC+c1Uz0oNgoGJDpVre
	PXVM8pDKXRqxDMASHiSN99XERXwG2GUjz9UqqBCIrS4id9p0igBBHJVLRz4cCDpvOmIMmaSPlSwv2
	yNhUWg7U/JqcI+sz/1hykpP6M7Beaoi2vcUiluA7QG+AvUeJuNc8JLg8ncHT7qEZs55G0pseWWnfz
	W9e6hP8bxHE7hfx3GuAgf/h5PIQSwTXN6hlhnOft2f8BEd6Tm/CSgQ9MPj5U3i2Zce1ZvGzubOacB
	iTkiFAyAHqujKI4jyhXdjxWQSGETGpx+0b2P3ruu8881yVFbutcd8MhFBb0ySlWjd2ZHBn4LHSLB1
	axSNTATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqO-00000009J3v-3tWb;
	Fri, 15 May 2026 20:09:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqF-00000009Iw3-3ONX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=UJRfPw8Gd1jyR/AlH9gntgehGI1iIdSOHjPbL8FrKIs=; b=Ib+Az6XG1W1KoYGLrC+gAHhxEo
	4q3qfZHGn5zKKGgGrKuPOCaPnknPwlEIZdS4RJY9ZtNQMRMafj2qnrDOWMCySIKmF3grjO9tH3Ufz
	kfwFBS8Mv/1St/L6fz6BLXJz9P6s+bBOAKQkIJmKUtcfgzkX+xSurG2jhw91zfdKwwyrjvKsaAw0s
	Xb/ozm3WWVL+EnylmvCCZGQHIDmiU70a2EpPQyxu3mJjhN61jYF1PWQjYcVmzzm7/K3H/Na4GTExI
	EPBql04rFf3A8RX/v4egsTYos6FManiLYF7QqgyZiQ/Dsmrg3TBjeOCBy572i5n1KcFIlUE6a+s1V
	8Z2dRX3w==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqC-0000000203m-0E5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E3EA35EA;
	Fri, 15 May 2026 13:08:53 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05E423F836;
	Fri, 15 May 2026 13:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875738; bh=3VUA2r2+ddyU78CRvBscoHqVmDjR7L1PvS+mXldYmRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aFBbJAoyiAfoqUDggmklm4iWvocg6IeA9RyCDQTbXvCGfCqlQ5L7/x+Ugz4evVyZd
	 b4ux+uKIU0nzr/nbQD9C8c0d5QokwSKj1zpiYCL1bGH7bd8BtR4DjcermKPnrNQR6b
	 ioHZLTofAYp5KX46apECvfM0Il9/A/bQUbbdZ1kA=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:18 +0100
Subject: [PATCH v14 11/28] coresight: Register CPU PM notifier in core
 layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-11-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=5369;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3VUA2r2+ddyU78CRvBscoHqVmDjR7L1PvS+mXldYmRk=;
 b=dyZFzprHGlbIgzOwa9rH2dl9PlRNlIcZ5YsrJOT7yzOZ6I3DBEnDUApOoZDA8z1NFwmGwdcoL
 g0UiU8lEm+cDs/rw9y205J9f6u3Yv/IcX+TWFiA8tQwdOz0/SV1uL2X
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_210900_472873_A98DF712 
X-CRM114-Status: GOOD (  23.80  )
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
index fc4855c3dfaafe04b3bdc2dd607128353f38e984..309f3a844e8fc653771fb0bf19aeb43efc998dd7 100644
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
@@ -1741,6 +1742,91 @@ static void coresight_release_device_list(void)
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
@@ -1795,9 +1881,15 @@ static int __init coresight_init(void)
 
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
@@ -1809,6 +1901,7 @@ static int __init coresight_init(void)
 
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


