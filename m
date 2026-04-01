Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036F8107639C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7H75Y0P/i5Xc5lTXjgHoc6tTBP1Z3f+hkBzFqx9+uQ=; b=dmJYJNDf/uAylbCtl4xKlLwHG1
	CRYHzug66GmThJAjWqUvXBsjGG3RBUJMehDkFS60/vBHlEyv8mfHhaU5W8B6xPVQPojOMhpbi+gcX
	wpSD81XSnTdMlnp02cIKaPy42vgQR917/SsGLYVdZ78HlCkGyo1u+vTCBOnZHnpMnihtseVH5BmtX
	WTtmDxs/ZrnxLibxNaVpcnJm0rc6L2F/mfk7lFgyYL1X9Co5OkHxjSZxZDgbqhzz8b05tE4oFAQ0C
	A6UopchbmmjhzsFYz0TKKoUTkUD1vOkXZ25W24VmHg+xdmt/mFoFDldT46yQMdplVpM0/vL7yd0XG
	ppOZoIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx9-0000000FudS-2S3k;
	Wed, 01 Apr 2026 18:06:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx6-0000000FuZr-3i5g
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 18:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q7H75Y0P/i5Xc5lTXjgHoc6tTBP1Z3f+hkBzFqx9+uQ=; b=NlYPzwwvqRpcyY5x5wrqL3GATL
	wwc2ZHBXrY04UsQAGyjdAwNVMxvHDJrKaFCQ7mX+YQealGsgChYRuxgJQz5nj1MdrirZ4dNwJbK3M
	8BKiqJa9T61l/p0m6CnMi7EdYkrf4fYNgUWOT44qdzixnzEh3xTjiaxZuL/Hbwv50gWKyltaV6syE
	ze6/6eWH6+cQajROxSYDmLGI8hd1qloIKMHDfuJLYqkjc8M1IQ/T24y/aEvzwVqvsmvp7eRS8kR2T
	yRE0GrBQ8QQvSgB1LxgX+VwWZC+CxXcf6wmSnWFS+XWn60VI7r3MPBJz8tt96Uu606Pz7fI6goGcK
	G/0i/jiA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zx3-000000014Vp-2s0S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F5016F2;
	Wed,  1 Apr 2026 11:05:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 194D93F7D8;
	Wed,  1 Apr 2026 11:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066761; bh=VD65cyCgV7C/RYdX1K2X/e2epdSjWYfH2IdTsFGUqZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pt4ksP/suBNeEfO0e4ogbbBA8OlLHDyoNuRotaCsOqYdYEu4fvPxMJB7F6nqa1Iie
	 gV2rlDEbP67lBuMiWAhMH/j7/cev0gJMcJ9xPQrngxIu64e4CEWmolrD2R+cZIueZQ
	 juJk8DkHJB/XB+bACO1sHcBCcSXMuJyzCJmCEWj8=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:36 +0100
Subject: [PATCH v9 07/20] coresight: Register CPU PM notifier in core layer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-7-091d73e44072@arm.com>
References: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
In-Reply-To: <20260401-arm_coresight_path_power_management_improvement-v9-0-091d73e44072@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=5597;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VD65cyCgV7C/RYdX1K2X/e2epdSjWYfH2IdTsFGUqZs=;
 b=HI4+QBkvhJRLFUwnxvg4Iz0mhmTFuYHxVrd7AqNkeg8RUIKnkQnZwiLIVsDw7u0iwFvXy/ocB
 O81tksA1UhOC6nnjzxgSPhGIeMa/PVeB8iIy726qm8X5Ufc2cNhD6rq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_190602_120329_FD09870D 
X-CRM114-Status: GOOD (  21.40  )
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
 drivers/hwtracing/coresight/coresight-core.c | 98 ++++++++++++++++++++++++++++
 include/linux/coresight.h                    |  2 +
 2 files changed, 100 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 74c9f0dd43784dd735885249c1e50fc86f610582..8384d1466b4cc74f7e463388862c58c86b74be79 100644
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
@@ -1647,6 +1653,91 @@ static void coresight_release_device_list(void)
 	}
 }
 
+static bool coresight_pm_is_needed(struct coresight_path *path)
+{
+	struct coresight_device *csdev;
+
+	if (!path)
+		return false;
+
+	csdev = coresight_get_source(path);
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
+	if (!coresight_pm_is_needed(path))
+		return NOTIFY_OK;
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
@@ -1701,9 +1792,15 @@ static int __init coresight_init(void)
 
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
@@ -1715,6 +1812,7 @@ static int __init coresight_init(void)
 
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


