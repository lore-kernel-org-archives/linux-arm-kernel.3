Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B811099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2D9W5HDzQzjDwOwjRP2o1ax+CangVR5x2wF0GYgSz8=; b=QAhSNcjn/fB6teDkxKIMDebjT1
	Q1hn5ny0PHY35oI4E+Elcr1KjWcX1dbF0vvSUAyzoGt2NzRXnVi9XbgIAZFFXDn2DNtsZeUcYIWM6
	5bIWQl1HWikebTG83mIkB0QL98mnlWuZMFh32HTU8KDDPAekZAwsp0k0uQqUAp+r0BI+zN04w7raJ
	lDhCEx4aMKIRhnVwBnAZl1BQe5+KrX59DnQeJ3WJXB/3W7yl9y5K5cvTfQuMVezL0JG5GNmvm5EQN
	+7Dhl4ukzkCK3BadHpWKEjjRXIohyx48VaIWg4yIcfXZxP/A/KlYD4PX6SCTLgimc2MlVjYP9j4pt
	0mZLLqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dt4-0000000DIMO-3nZB;
	Fri, 20 Mar 2026 17:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dse-0000000DHvx-10TB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC72B165C;
	Fri, 20 Mar 2026 10:43:20 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24F803FA1F;
	Fri, 20 Mar 2026 10:43:25 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:52 +0000
Subject: [PATCH v7 10/20] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-10-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=3099;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WJJDyTcWQxlltHVSMsTAEthkX/ht0aaUQCfNkeJUcs4=;
 b=ZowYpAmTOwn8ZA+sXfx04r5X/hLlR9XH5djJGkv/1SYCVaO/BZv3KWpvs6lgCFAdd3lmqJA+0
 qNQVQQXY5E3CmYaGKigTNg6AvcAy7pTU7/NzbHoi2C48w9yP8oLVsug
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104328_421376_DA687041 
X-CRM114-Status: GOOD (  15.41  )
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

Store the active path in the source device structure for system
tracers (e.g. STM).  Ensure the path pointer is cleared when the
source is disabled.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 28 ++++++++++++++++++++++++++--
 include/linux/coresight.h                    |  2 ++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 4b55c54c5fbade99404ad662aa4111d4c3c2b85b..81bf4637f788f99844e839fd9dad8802ee78eb60 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -430,19 +430,43 @@ int coresight_enable_source(struct coresight_device *csdev,
 			    struct perf_event *event, enum cs_mode mode,
 			    struct coresight_path *path)
 {
+	int ret;
+
 	if (!coresight_is_device_source(csdev))
 		return -EINVAL;
 
-	return source_ops(csdev)->enable(csdev, event, mode, path);
+	ret = source_ops(csdev)->enable(csdev, event, mode, path);
+	if (ret)
+		return ret;
+
+	/*
+	 * The per-CPU source has updated its path pointer in the enable()
+	 * callback, ensuring synchronization on the target CPU. Set the
+	 * path pointer here for non per-CPU sources.
+	 */
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = path;
+
+	return 0;
 }
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
+	struct coresight_path *path;
+
 	if (!coresight_is_device_source(csdev))
 		return;
 
+	/*
+	 * The per-CPU source's disable callback may clear csdev->path, so
+	 * save the path pointer used by disabling helper.
+	 */
+	path = csdev->path;
 	source_ops(csdev)->disable(csdev, data);
-	coresight_disable_helpers(csdev, NULL);
+	coresight_disable_helpers(csdev, path);
+
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = NULL;
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index f771615852b84200e37b844648a13bd18c91593d..11d61cdfac8d4d51e831a84635d8438383665d3e 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -268,6 +268,7 @@ struct coresight_trace_id_map {
  *		spinlock.
  * @orphan:	true if the component has connections that haven't been linked.
  * @cpu:	The CPU this component is affined to (-1 for not CPU bound).
+ * @path:	Activated path pointer (only used for source device).
  * @sysfs_sink_activated: 'true' when a sink has been selected for use via sysfs
  *		by writing a 1 to the 'enable_sink' file.  A sink can be
  *		activated but not yet enabled.  Enabling for a _sink_ happens
@@ -295,6 +296,7 @@ struct coresight_device {
 	int refcnt;
 	bool orphan;
 	int cpu;
+	struct coresight_path *path;
 	/* sink specific fields */
 	bool sysfs_sink_activated;
 	struct dev_ext_attribute *ea;

-- 
2.34.1


