Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625351099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqFM8DP9hiHB63Qa+E+Ain690VTaXmPFT7sYiXwM2CQ=; b=HbW9PXKxuKFQ6KmSwrlDvACI1E
	h7dXIsGMszltDiAcGTwSTIEzxxlNGRYZGOnNIEn5hPDHVTBLaO0nV+Q6za7qKh3IOIQutYB1yLojI
	VYFxLs2/qkAoNDtOAE/pUAsoAbSfy1unc1LLA7W0HMU1jnpA3IinHcplDsF/tZJyCsctyMpzUyCKM
	YeXz6NQH5qLs8S3uwlP1r0hCFPUKIgwFx5kyRZHY75nngT7iaOjX2NW7rdpTCwByEOKS/z0Nkax07
	coYY+KSWemfy1STL/vxgUxF0JUz80Q3J1ittMGuvylkT5csWbqhYnr7No2qhQI6nNvkFHjbdgLN+E
	5oltKKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dt4-0000000DILn-1ZSK;
	Fri, 20 Mar 2026 17:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsc-0000000DHus-1kMj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB6F81596;
	Fri, 20 Mar 2026 10:43:18 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01EE33FA1F;
	Fri, 20 Mar 2026 10:43:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:42:51 +0000
Subject: [PATCH v7 09/20] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-9-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=4706;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kxUCtP3Td4nu/EjK8349C16uO1e2msOnR6kCpx45Ke8=;
 b=IB0liQ9sAv3PMTt+S3EicXUqcsaE6xmbT1bw473t39bHcJTQ+MLmUZ4xnlHJ36LyQhvMl/y3F
 qExpDsjFViECD3yLzPU0l4wRkpVF7Uy6IJ4DaKJk7dl5PErI4M/FOnk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104326_554346_645B73D4 
X-CRM114-Status: GOOD (  16.91  )
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
device, refine the comment for the imbalance between enable and disable
pair functions.

Add validation to ensure the device is a source before proceeding with
further operations.

Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 20 +++++++++++++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7186e7d948829479dfe5ea95c8cd5a03df5fc26c..4b55c54c5fbade99404ad662aa4111d4c3c2b85b 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -416,17 +416,31 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
 }
 
 /*
- * Helper function to call source_ops(csdev)->disable and also disable the
- * helpers.
+ * coresight_enable_source() only enables the source but does nothing for the
+ * associated helpers. In contrast, coresight_disable_source() calls
+ * source_ops(csdev)->disable() and also disables the helpers.
  *
  * There is an imbalance between coresight_enable_path() and
  * coresight_disable_path(). Enabling also enables the source's helpers as part
  * of the path, but disabling always skips the first item in the path (which is
  * the source), so sources and their helpers don't get disabled as part of that
- * function and we need the extra step here.
+ * function and we need the extra step in coresight_disable_source().
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
 	coresight_disable_helpers(csdev, NULL);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index a2c1c876099d1f5dacf039d733b78827296d9c2e..6783396635b7a62328483ad5d8837c9a59990e50 100644
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
index c96d63657f9334be890cca2320abbb8cbd807802..51ff1718502d6a5bf86b16e0723d7cdfdecc1848 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -249,6 +249,9 @@ void coresight_add_helper(struct coresight_device *csdev,
 void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
 struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_percpu_source(int cpu);
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 2546f3ef82f810fd04a119cecd2093b8150112b6..de1cc05433f565eb7cb91e386f79939857dadcd5 100644
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


