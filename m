Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE0AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUQoHFbKLcarcsfKFnnawFmb8DPj1IcV5jaY/Zb4QC8=; b=udtUtJv+5u+GbS1geXPDdprDRP
	M4QU4KVswthvXaYUH/EkCGEGHwh5b4EIB0BBE6fz+qZqj/FAnB9/eQ/KEJjZhvIroeB6lqzuZxRMT
	GJ/xKeDzGUNK7njbmCR38nzXBhx7KIO3cwtJyFRrjdt6Ew9l2hc9nyL9SoiBgPYgErSwA/1IZn1un
	Q6v1qNM7x/Hiy4s2VZmjd2NliA4AngQb90KjhtC0SMsNhllQw2bSYjJ3dmBEzFndtQweBT1mRdW2K
	F00/+oLEUxvnT6/RZ13wAO0VSKFlz6Ky+jUfv6Nl2xrHfarnBG4W/vBISb5sGwJk6gqDwEZkC8xa6
	I6A/dcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg9R-000000045lD-0FpQ;
	Tue, 01 Apr 2025 18:15:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg1D-000000044bL-0W67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:07:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE32312FC;
	Tue,  1 Apr 2025 11:07:25 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2FE1E3F59E;
	Tue,  1 Apr 2025 11:07:21 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 3/7] coresight: etm4x: Hook pause and resume callbacks
Date: Tue,  1 Apr 2025 19:07:04 +0100
Message-Id: <20250401180708.385396-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110723_290687_73A06751 
X-CRM114-Status: GOOD (  15.81  )
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

Add callbacks for pausing and resuming the tracer.

A "paused" flag in the driver data indicates whether the tracer is
paused.  If the flag is set, the driver will skip starting the hardware
trace.  The flag is always set to false for the sysfs mode, meaning the
tracer will never be paused in the case.

Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 ++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 53cb0569dbbf..5b69446db947 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -577,7 +577,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
 	}
 
-	rc = etm4_enable_trace_unit(drvdata);
+	if (!drvdata->paused)
+		rc = etm4_enable_trace_unit(drvdata);
 done:
 	etm4_cs_lock(drvdata, csa);
 
@@ -820,6 +821,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 
 	drvdata->trcid = path->trace_id;
 
+	/* Populate pause state */
+	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
+
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
 
@@ -846,6 +850,9 @@ static int etm4_enable_sysfs(struct coresight_device *csdev, struct coresight_pa
 
 	drvdata->trcid = path->trace_id;
 
+	/* Tracer will never be paused in sysfs mode */
+	drvdata->paused = false;
+
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
 	 * ensures that register writes occur when cpu is powered.
@@ -1080,10 +1087,43 @@ static void etm4_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm4_resume_perf(struct coresight_device *csdev)
+{
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct csdev_access *csa = &csdev->access;
+
+	if (coresight_get_mode(csdev) != CS_MODE_PERF)
+		return -EINVAL;
+
+	etm4_cs_unlock(drvdata, csa);
+	etm4_enable_trace_unit(drvdata);
+	etm4_cs_lock(drvdata, csa);
+
+	drvdata->paused = false;
+	return 0;
+}
+
+static void etm4_pause_perf(struct coresight_device *csdev)
+{
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct csdev_access *csa = &csdev->access;
+
+	if (coresight_get_mode(csdev) != CS_MODE_PERF)
+		return;
+
+	etm4_cs_unlock(drvdata, csa);
+	etm4_disable_trace_unit(drvdata);
+	etm4_cs_lock(drvdata, csa);
+
+	drvdata->paused = true;
+}
+
 static const struct coresight_ops_source etm4_source_ops = {
 	.cpu_id		= etm4_cpu_id,
 	.enable		= etm4_enable,
 	.disable	= etm4_disable,
+	.resume_perf	= etm4_resume_perf,
+	.pause_perf	= etm4_pause_perf,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index bd7db36ba197..ac649515054d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -983,6 +983,7 @@ struct etmv4_save_state {
  * @state_needs_restore: True when there is context to restore after PM exit
  * @skip_power_up: Indicates if an implementation can skip powering up
  *		   the trace unit.
+ * @paused:	Indicates if the trace unit is paused.
  * @arch_features: Bitmap of arch features of etmv4 devices.
  */
 struct etmv4_drvdata {
@@ -1036,6 +1037,7 @@ struct etmv4_drvdata {
 	struct etmv4_save_state		*save_state;
 	bool				state_needs_restore;
 	bool				skip_power_up;
+	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 
-- 
2.34.1


