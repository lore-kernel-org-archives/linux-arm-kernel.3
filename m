Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FA910FCAC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FONn01fytvh0/kxlayU/vTCLCm6TQurK1fhmGFvH9s=; b=K1xq8jCS3zXkd42o2UEIjb9DLK
	D0fgQxgMP7PB2PYJ4E5xYRKTHjdMGAu2ZEJFBNCuhuBu5rf5vkYxYqiKVa2ATzSTJFqBQUyCL9H2A
	7mwgiwtdSXVc1pBb/FLV9dCoyK3tgrlSGmKDeI30ZkD1f+gI4qGK4TZvRuI4ofiS+9erYH40ww65s
	XVZw4go+CzZNt+7NyqSQsK938NGl/s0IM9KLGVFokuZEH0GCOETvFpMyponMq4n8fLyI1ZWwQM8Pm
	JfUioUD5DQozQBfDXuQzPAR2utwPscR9jocsv8ap0S2TpwUSuH+sR75+ieyw4kGXqncwBzag7vKz0
	Xd/KyqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxN-0000000Futr-134I;
	Wed, 01 Apr 2026 18:06:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zxK-0000000FuoN-26DL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 18:06:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773ED1A25;
	Wed,  1 Apr 2026 11:06:11 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CF7E3F7D8;
	Wed,  1 Apr 2026 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775066777; bh=3VO6ZXhMWdiIKTr2FYdVw231aqo8PjNHurm3JiDQ0l0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AmgrfSGDsI3zYtAOXqfCy+yMrG5X7rdkyw7uMHQ3DphikV8Ej6jwRPwpZoDHdfADf
	 YtBE/MR6IbCd0ywf4RmJJVBYpwp8xQUHuajtea5BhXH6erL+9KSwl6O4vii1Pq5BzO
	 U+E11W4GK2vxflSUnAnUr7V6FEGBSuG9G0cj4MvY=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 01 Apr 2026 19:05:43 +0100
Subject: [PATCH v9 14/20] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-arm_coresight_path_power_management_improvement-v9-14-091d73e44072@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775066742; l=4166;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=3VO6ZXhMWdiIKTr2FYdVw231aqo8PjNHurm3JiDQ0l0=;
 b=NeSKNa3avCXZJHc8Omm7+thNs1WJqVLszMSs6JE1jShpxM9C7xdPDp1QeyhPRXwHV1zWxiMZH
 hGzy1tPZLRHBSyKT0wkcCOc5IjmkwMJIcZFEGCbL4QJ3U5P6m633KQO
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_110618_963671_EB1AFD4F 
X-CRM114-Status: GOOD (  15.59  )
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

Introduce the coresight_enable_source() helper for enabling source
device.

Add validation to ensure the device is a source before proceeding with
further operations.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 18 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index ae0ab074293a8ec473de2e6e3282f62268de38aa..c0f76ea7857e2bf368f9e5abbb023d7a34b4caf5 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -411,11 +411,25 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
 }
 
 /*
- * coresight_disable_source() only disables the source, but do nothing for
- * the associated helpers, which are controlled as part of the path.
+ * coresight_enable_source() and coresight_disable_source() only enable and
+ * disable the source, but do nothing for the associated helpers, which are
+ * controlled as part of the path.
  */
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path)
+{
+	if (!coresight_is_device_source(csdev))
+		return -EINVAL;
+
+	return source_ops(csdev)->enable(csdev, event, mode, path);
+}
+
 void coresight_disable_source(struct coresight_device *csdev, void *data)
 {
+	if (!coresight_is_device_source(csdev))
+		return;
+
 	source_ops(csdev)->disable(csdev, data);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index cae6738e9906c35d291e4b0f3feae37306b95c06..b23c8c4b87972ed530743ef93bea69544c2c5ebf 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -533,7 +533,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(csdev)->enable(csdev, event, CS_MODE_PERF, path))
+	if (coresight_enable_source(csdev, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index ff8a720339deb854ac3b4eb916f49e844f442d34..43ce810ad5deab339f0a336266b6018ddaf8c4fd 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -248,6 +248,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index f398dbfbcb8de0c5a873837c19b3fdcf97b64abe..9449de66ba3941614928924086100866f3c88a54 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -66,7 +66,7 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 	 */
 	lockdep_assert_held(&coresight_mutex);
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS) {
-		ret = source_ops(csdev)->enable(csdev, NULL, mode, path);
+		ret = coresight_enable_source(csdev, NULL, mode, path);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


