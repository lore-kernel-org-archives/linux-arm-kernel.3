Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D74CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js9+MPidJV4vGkj/+N+IO51uVaXEMY4Q1wnYipGhjMc=; b=jrJLhbF1qsRbDOOQmk8PuupxZk
	IV7rJJOvuQEHmY5bZHvwICmwb2zEVV8V7QUCDe+Q8vQtcu0tN7dV1Ep4Zk7U86dUnPqZcq/BQ15Ft
	Qj9GRBSBqpmPHYRgPicUnFz3MrKzT15s6daXjRDRttwyDwtlwtyYvSQApyowdo/lYLaYW052EbdmK
	F2bCLliK+CUk2ZY/9DO9c42iAtpFzxdmYyC2/AQ6Q4Ec2uR/mc7li/Zq/fWLW99bGESq6j/yrfEeN
	uMgCs7a/qNMIFhy6uhgy28GVStKzSpd2nSwWJWzZKRqGeqIuIDHShMtzO7YiO9LHwHMKl+mQwzt2r
	JBwtkldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs6-0000000C4NM-3ZDF;
	Tue, 04 Nov 2025 15:22:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGIs3-0000000C4He-3g6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:22:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955742C41;
	Tue,  4 Nov 2025 07:22:47 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA7613F66E;
	Tue,  4 Nov 2025 07:22:53 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 04 Nov 2025 15:21:56 +0000
Subject: [PATCH v4 12/15] coresight: Add PM callbacks for percpu sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-arm_coresight_path_power_management_improvement-v4-12-3d4bba674709@arm.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762269750; l=3917;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=1Sg6ZRmhRc/p0TOY05AvyYAPlHu78Kx5xA7dUcYWBOc=;
 b=TSF0/zYAg9hofjiS4h6lHGEEqVfoXe2Y5SdnwmxaaZ3resc6sjU9X4ZgwhdhnKCIbUYGGPEFE
 xR/W3T4kkK9DRr2bgmmybZaA7fdMBt+7Wc96lZmX4ehY8rT4SD/vOPT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_072256_016924_3D4F30CA 
X-CRM114-Status: GOOD (  16.44  )
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

Unlike a system level's sink, the per-CPU sink may lose power during CPU
idle states. Currently, this refers specifically to TRBE as the sink.
This commit registers save and restore callbacks for the per-CPU sink
via the PM notifier.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 53 +++++++++++++++++++++++-----
 include/linux/coresight.h                    |  4 +++
 2 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 73be22c8f315525111f2dafd692e61bc6db85c25..7095f9befa98c7d638f857466351ef7cd960fde7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1659,8 +1659,25 @@ static bool coresight_pm_is_needed(struct coresight_device *csdev)
 	return coresight_ops(csdev)->pm_is_needed(csdev);
 }
 
+static int coresight_pm_percpu_sink_save(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_save_disable)
+		return 0;
+
+	return coresight_ops(sink)->pm_save_disable(sink);
+}
+
+static void coresight_pm_percpu_sink_restore(struct coresight_device *sink)
+{
+	if (!sink || !coresight_ops(sink)->pm_restore_enable)
+		return;
+
+	coresight_ops(sink)->pm_restore_enable(sink);
+}
+
 static int coresight_pm_save(struct coresight_device *csdev)
 {
+	struct coresight_device *sink;
 	int ret;
 
 	if (WARN_ON(!csdev->path))
@@ -1670,22 +1687,42 @@ static int coresight_pm_save(struct coresight_device *csdev)
 	if (ret)
 		return ret;
 
-	coresight_disable_helpers(csdev, NULL);
-	coresight_disable_path_from(csdev->path, NULL, true);
+	sink = coresight_get_sink(csdev->path);
+
+	if (coresight_is_percpu_sink(sink)) {
+		ret = coresight_pm_percpu_sink_save(sink);
+		if (ret) {
+			coresight_ops(csdev)->pm_restore_enable(csdev);
+			return ret;
+		}
+	} else {
+		coresight_disable_helpers(csdev, NULL);
+		coresight_disable_path_from(csdev->path, NULL, true);
+	}
+
 	return 0;
 }
 
 static void coresight_pm_restore(struct coresight_device *csdev)
 {
+	struct coresight_device *sink;
+
 	if (WARN_ON(!csdev->path))
 		return;
 
-	/*
-	 * During CPU idle, the sink device is not accessed, so it is okay to
-	 * pass a NULL pointer for the 'sink_data' parameter.
-	 */
-	coresight_enable_path_internal(csdev->path, coresight_get_mode(csdev),
-				       NULL, true);
+	sink = coresight_get_sink(csdev->path);
+
+	if (coresight_is_percpu_sink(sink))
+		coresight_pm_percpu_sink_restore(sink);
+	else
+		/*
+		 * During CPU idle, the sink device is not accessed, so it is
+		 * okay to pass a NULL pointer for the 'sink_data' parameter.
+		 */
+		coresight_enable_path_internal(csdev->path,
+					       coresight_get_mode(csdev),
+					       NULL, true);
+
 	coresight_ops(csdev)->pm_restore_enable(csdev);
 }
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 58484c225e58a68dd74739a48c08a409ce9ddd73..d2f02f6322e69bfbda82f5df5d90cb8afeb7d21d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -364,6 +364,8 @@ enum cs_mode {
  * @alloc_buffer:	initialises perf's ring buffer for trace collection.
  * @free_buffer:	release memory allocated in @get_config.
  * @update_buffer:	update buffer pointers after a trace session.
+ * @save:		save context for a sink.
+ * @restore:		restore context for a sink.
  */
 struct coresight_ops_sink {
 	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
@@ -376,6 +378,8 @@ struct coresight_ops_sink {
 	unsigned long (*update_buffer)(struct coresight_device *csdev,
 			      struct perf_output_handle *handle,
 			      void *sink_config);
+	int (*save)(struct coresight_device *csdev);
+	int (*restore)(struct coresight_device *csdev);
 };
 
 /**

-- 
2.34.1


