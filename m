Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660DE109C023
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j92+Y6bP+VGGXGp54D+a59eRqTQdNgwZiP/EJd0zUMc=; b=V5g6dZqW976m/9bfra4MBas8rS
	QAILIKOh3rSnquv5dzctmLHp85uSVQ0iQlhnua0aSxhKT5oRyS4kGMs3X4uZJNIkmAL4ZXUS9GUyY
	V0pKr4N1WCXCeKe9kl5WTBwU31U36LJ5tl+h6vXFDA3Gs60EbnrtRH/hwazQOLLn8f4j/OjAj9Kwt
	1QvZynnN1CIK2e+Spd32zIgVqOV5ieDzRlV0nhIJCVpkc685iAbwHvkVL63TRgfWFfwtwA91EVPAZ
	2dW93N349RkcxhRT07nsyn4STJRuObJhZ54LSyq9T6en69ZGNFXYjUJY9oYVSlD1g5qL7Nyyvx2Eo
	v1LMloNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PDp-00000003an5-1s4B;
	Wed, 25 Mar 2026 14:28:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PCt-00000003a1M-1ikW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:27:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6C741F02;
	Wed, 25 Mar 2026 07:27:32 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2ACE3F836;
	Wed, 25 Mar 2026 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774448858; bh=7/s7Juo0K7iDndCSaMzgzfQ/1njuGwOF8wacwDyHJY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cCwyQzoJqIRuNtSP4UFOB3TxKe4UbaQ+rVt0M9B/SnZQp3ak8Q/VsvwEy1OLrvHAf
	 bXirlzKFeNFPYUOpDV1IjTLwF9/ipF1sWVDbyEhUAve4+AuNmaLI9tMzUTA5D5KOay
	 KI4dqW/1Y7FRtjvrx7H3tMPUwYNrqWkl9eRyRQjg=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 25 Mar 2026 14:26:55 +0000
Subject: [PATCH v8 18/23] coresight: Control path during CPU idle
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-arm_coresight_path_power_management_improvement-v8-18-7b1902e18041@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774448817; l=4362;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=7/s7Juo0K7iDndCSaMzgzfQ/1njuGwOF8wacwDyHJY4=;
 b=INalJZw8t3kvY3SvJVucSlaqm/7TTJpiJxgMllZhevpokkB2Bz54kXTsRpGG8+hDn1ITjbhGR
 MnNPEkuR+JKDmF90L4C0+1qhGA5cAlsf0Noys7Xn2AccSt3J7v3WcId
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072739_645750_992165B7 
X-CRM114-Status: GOOD (  17.73  )
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

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 70 ++++++++++++++++++++++++----
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index a74a595dd61f1a004ee0ebc9600127c928ee9f16..5060ccbc8f4c82eb14ec081ec05709391a585a11 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -131,6 +131,29 @@ struct coresight_device *coresight_get_percpu_source(int cpu)
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
@@ -1768,8 +1791,14 @@ static void coresight_release_device_list(void)
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
 
@@ -1795,33 +1824,56 @@ static void coresight_pm_device_restore(struct coresight_device *csdev)
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


