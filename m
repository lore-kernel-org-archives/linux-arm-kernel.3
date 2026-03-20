Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CC41099B31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FW1Bd7C4bFpbERclxp+HH0FQU3V6tWqKCxD/xM+xNA=; b=eXRdtJC+p8lVwdCNoJyUecKjeZ
	p9dVkspGOrI8ExAPocAE87QGg6V1Q2Acd2xrgCTA0SyHeL3oWwb8GlXO9xScle/JMx9f52jehNHwY
	4Hb838xYxI8v4tSoWz1a7Y4rdtVncz9MdImnne4kd40zicvEC3kY4qKfHL1pBEEe1yCprpS1IYazj
	o3Tofe7kq7AzhexnqVWNzmjtYNSzpT2V1cpO7eFEKOv4qErooTwsxfF0TQA7B7avzFXUZAdBfmY6Q
	DOnqdP0R5m6G9HzUEp+ADu85f8KmiD/c4HuTHwG3ZobrRlYswUuhRMGKLp8AYXr81Dvxkw2g8P7JO
	5TQZXEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dt8-0000000DIQP-1UWK;
	Fri, 20 Mar 2026 17:43:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dso-0000000DI87-0wWP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB28E1596;
	Fri, 20 Mar 2026 10:43:31 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D45543FA1F;
	Fri, 20 Mar 2026 10:43:35 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:57 +0000
Subject: [PATCH v7 15/20] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-15-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=4540;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LXuAgGmgcI84miUR/U1KdWgSRuNBVd0oGk9s/9/sNbw=;
 b=AxC5wdAanNaCdZpNYDNizxLAcHt7fN2VH7/gTAurkddhJjaS3I/gyd88Q+ros7b05A/EMjlCa
 abdujQBP3rxDyNw+KU9P+qjoP4JveJzUEmKUAFE8U2r6JrjEAIeUQhb
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104338_398168_BDEEF45F 
X-CRM114-Status: GOOD (  16.83  )
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

Control links and helpers on an active path during CPU idle.

The helper coresight_get_local_cpu_path() uses coresight_dev_lock to
exclusive access to the per-CPU source pointer, then retrieves the path
pointer (csdev->path).  The path pointer is only set via an SMP
call on the local CPU, which is serialized with CPU PM notifiers.

If the CPU PM notifier retrieves a non-NULL path pointer, it is safe to
iterate over the path and control it up to the node before the sink to
avoid latency.

Since coresight_disable_path() does not handle a source device's
helpers, explicitly disable them alongside the source device.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 72 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 874bd87da2270fdbe6b32c2fa29292d7a26b8dc7..b888a31ca6abffe62e2264574a6d61b43184f600 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -113,6 +113,29 @@ struct coresight_device *coresight_get_percpu_source(int cpu)
 	return per_cpu(csdev_source, cpu);
 }
 
+/*
+ * The source device's csdev->path is always set on the local CPU.
+ * CPU PM notifiers also run on the same CPU, so accesses to
+ * csdev->path are serialized.
+ *
+ * When the path is constructed, each component on the path takes module
+ * reference counts, and the source's csdev->path is set last. Therefore,
+ * when the CPU PM notifier retrieves the path on the local CPU, a non-NULL
+ * csdev->path guarantees that the path is safe to iterate over.
+ */
+static struct coresight_path *coresight_get_local_cpu_path(void)
+{
+	struct coresight_device *csdev;
+
+	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
+
+	csdev = this_cpu_read(csdev_source);
+	if (!csdev)
+		return NULL;
+
+	return csdev->path;
+}
+
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
@@ -1765,8 +1788,14 @@ static void coresight_release_device_list(void)
 	}
 }
 
-static bool coresight_pm_is_needed(struct coresight_device *csdev)
+static bool coresight_pm_is_needed(struct coresight_path *path)
 {
+	struct coresight_device *csdev;
+
+	if (!path)
+		return false;
+
+	csdev = coresight_get_source(path);
 	if (!csdev)
 		return false;
 
@@ -1792,33 +1821,58 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
-static int coresight_pm_save(struct coresight_device *source)
+static int coresight_pm_save(struct coresight_path *path)
 {
-	return coresight_pm_device_save(source);
+	struct coresight_device *source;
+	struct coresight_node *from, *to;
+	int ret;
+
+	source = coresight_get_source(path);
+	ret = coresight_pm_device_save(source);
+	if (ret)
+		return ret;
+
+	coresight_disable_helpers(source, path);
+
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	coresight_disable_path_from_to(path, from, to);
+
+	return 0;
 }
 
-static void coresight_pm_restore(struct coresight_device *source)
+static void coresight_pm_restore(struct coresight_path *path)
 {
+	struct coresight_device *source;
+	struct coresight_node *from, *to;
+
+	source = coresight_get_source(path);
+	from = coresight_path_first_node(path);
+	/* Up to the node before sink to avoid latency */
+	to = list_prev_entry(coresight_path_last_node(path), link);
+	coresight_enable_path_from_to(path, coresight_get_mode(source),
+				      from, to);
+
 	coresight_pm_device_restore(source);
 }
 
 static int coresight_cpu_pm_notify(struct notifier_block *nb, unsigned long cmd,
 				   void *v)
 {
-	struct coresight_device *source =
-		coresight_get_percpu_source(smp_processor_id());
+	struct coresight_path *path = coresight_get_local_cpu_path();
 
-	if (!coresight_pm_is_needed(source))
+	if (!coresight_pm_is_needed(path))
 		return NOTIFY_OK;
 
 	switch (cmd) {
 	case CPU_PM_ENTER:
-		if (coresight_pm_save(source))
+		if (coresight_pm_save(path))
 			return NOTIFY_BAD;
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
-		coresight_pm_restore(source);
+		coresight_pm_restore(path);
 		break;
 	default:
 		return NOTIFY_DONE;

-- 
2.34.1


