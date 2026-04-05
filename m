Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561ADE9D805
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9ij/NRwtRecpBmGCV78Qk+q0QHwAu5au3sfQgrd2as=; b=s6xrx5rLcMriDt3UcGWCvdk2XI
	Udr0HC1iLJEuF4P4ui28WoY28LVOk9z+QGMsnO6ZutCqdbXI+cAskIO34EVmk1X7XHA2WcSozW60J
	u0zLS6sOkgtc3QsG2X5vfOCutSrYSh0TZrdS2UFM+nWdvhXjPAOFw/r6m0+f4btPftoUAfnIFZa+n
	iyczguKgxd9wdbjDKyvV434Y9LlQgXSO+iX3Y9mDUSuiDFVGu1g/ZLSdsXSf6b5ZcqqTkmUbqX7uV
	HxhG5O3AQE86PTO8E9D6LMmBMiLqEEbzKDYkHaflH4WELPVahm44gJnhgEwRVWeGNuVX9bcjAApPY
	KceY4C3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0v-00000004HnO-3lyK;
	Sun, 05 Apr 2026 15:03:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0r-00000004HhI-1jfV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16E551758;
	Sun,  5 Apr 2026 08:03:39 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211993F62B;
	Sun,  5 Apr 2026 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401424; bh=FGrWhbYLaN/XG8nIlmSIFSllWDxLfaRL5+Z2jt18ttY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JML7SGjRlVB3DOwMnJ+xN8Pzbr6vIsK4xSAtBckBCmu+96rmejkJ0v4R9N3735h89
	 Ai+MWhY4/g6YUpT4l1F3r5QeSQM1pwzANsFbIzzuo929+z44rR9dNAV9cVXlwj8eik
	 nDLPjJ3IOlXQPa+lDNtyYVMLA9L4HAM09Cu7Go3M=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:50 +0100
Subject: [PATCH v10 14/20] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-14-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=4166;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=FGrWhbYLaN/XG8nIlmSIFSllWDxLfaRL5+Z2jt18ttY=;
 b=h5DN992uln1Ejre00r6B7vI8VOD0muhhM15/Uk0pQJ7zTprv6OszysHTHeyUruE5iKhCAuRhg
 EW46xx45sqsBT7Ojna7ldsNLsmqjy3ZSb/gPHwpY2oJYgDACQvzKI0x
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080345_567999_41E34ED9 
X-CRM114-Status: GOOD (  15.40  )
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
index 3d2876d37c5bc371dd5a88640e080f6e52af5294..02d26dd0171ebf4e884bb3e0028b9a21588f061a 100644
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


