Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730ACC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ+P2eh126WCPqq5KRjRVV0sZQ1LzK7x3oGWlhU+IAM=; b=YcoOMHliL6Uxl+ckMMKmS7/iUh
	2WL0MfJ0L1Z/F4ElkiRgaslePYygMxjf1RsKBGpJndJ/otTLeiqJALtx+XLaopqpl82GuYULzTIFJ
	Bacav8duo5oj4kpSn67/GYVTNayXZnkQ58WS8eRpX5DR9MKw6jhguvvPMAu5Jduisj04LA3ttT40g
	4+rH/mngqxihojvGmcxk2fFLU3ihP88sKTcq8jHYZ2jWDuts7MH8StZLiuU693FAPk4I9DDKvVL2R
	tM+S+XKK+lVgqPThEua8qeZFeNVq2ITIGbXR9cx6rirg6J0nd70uvcVo5opFNHqzKK2AnGIS4Fzhu
	GCC6L0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbAG-00000002P87-263I;
	Mon, 10 Mar 2025 11:19:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trahS-00000002JKO-46tw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:49:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A36153B;
	Mon, 10 Mar 2025 03:49:46 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C881B3F673;
	Mon, 10 Mar 2025 03:49:32 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 3/8] coresight: etm4x: Hook pause and resume callbacks
Date: Mon, 10 Mar 2025 10:49:14 +0000
Message-Id: <20250310104919.58816-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310104919.58816-1-leo.yan@arm.com>
References: <20250310104919.58816-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034935_150744_F71FDF64 
X-CRM114-Status: GOOD (  17.11  )
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
---
 .../coresight/coresight-etm4x-core.c          | 42 ++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-etm4x.h |  2 +
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 71be566bd117..3a97d81b79db 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -608,7 +608,8 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 		etm4x_relaxed_write32(csa, trcpdcr | TRCPDCR_PU, TRCPDCR);
 	}
 
-	rc = etm4_enable_trace_unit(drvdata);
+	if (!drvdata->paused)
+		rc = etm4_enable_trace_unit(drvdata);
 done:
 	etm4_cs_lock(drvdata, csa);
 
@@ -866,6 +867,9 @@ static int etm4_enable_perf(struct coresight_device *csdev,
 	}
 	drvdata->trcid = (u8)trace_id;
 
+	/* Populate pause state */
+	drvdata->paused = !!READ_ONCE(event->hw.aux_paused);
+
 	/* And enable it */
 	ret = etm4_enable_hw(drvdata);
 
@@ -895,6 +899,9 @@ static int etm4_enable_sysfs(struct coresight_device *csdev)
 	if (ret < 0)
 		goto unlock_sysfs_enable;
 
+	/* Tracer will never be paused in sysfs mode */
+	drvdata->paused = false;
+
 	/*
 	 * Executing etm4_enable_hw on the cpu whose ETM is being enabled
 	 * ensures that register writes occur when cpu is powered.
@@ -1082,10 +1089,43 @@ static void etm4_disable(struct coresight_device *csdev,
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
 }
 
+static int etm4_resume(struct coresight_device *csdev)
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
+static void etm4_pause(struct coresight_device *csdev)
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
+	.resume		= etm4_resume,
+	.pause		= etm4_pause,
 };
 
 static const struct coresight_ops etm4_cs_ops = {
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 1119762b5cec..c3389fdb5d67 100644
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


