Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031FFCF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mYTi9iz9zq6Ps8r8brt5REdW2TMWs9sHEBJlY45S2I=; b=DcQI6RlHfbFCUgbzjg5SBFTxAB
	TBvWaV7VjLLEb/2+lQj3fcGeUxZl2xk3q+eC1m7DTl7lWtCQZXx30eGC4R2q30Aj1jIC26fYjFfPe
	ta7dWDgJQ2RHrMc4Z1GZBcKJQC2nGGpljvSbIAg0hhkWnNXxCuzD41V/PZSUM5w025dw93L9UDtfD
	H6yG3nTTfFjL17eXl/CjvEUDxefb5G7yzFCUccaB8/ZXYdC2aatZE8MhUSCYSEG/Kiw5E0Lv6JIb7
	Yyp4uEDXDhUv1UgT2lfPFThmxPuT0OZg44aDsliZsYQVUhDztzhMmhs2JXWIm/GjlN4UcHklikV8n
	UAuTf8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRX-00000003ZHS-0mqV;
	Wed, 19 Nov 2025 15:50:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkRJ-00000003Z02-0mpg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:49:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3513FEC;
	Wed, 19 Nov 2025 07:49:40 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C6B03F66E;
	Wed, 19 Nov 2025 07:49:46 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 19 Nov 2025 15:49:10 +0000
Subject: [PATCH v5 12/19] coresight: sysfs: Use source's path pointer for
 path control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-arm_coresight_path_power_management_improvement-v5-12-f615a301ad0b@arm.com>
References: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
In-Reply-To: <20251119-arm_coresight_path_power_management_improvement-v5-0-f615a301ad0b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763567363; l=4309;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jd6jEOcvAj87pKfBGcGJM0pC41ua7G93+DWuUkdsiEA=;
 b=ZmrGoZG7Z1OWWBR4kqjnuuopzPKuPJ/B6ozOe5Tm+YwoqdRNy9DynVTSPL8Kb0ddIidzMD+YR
 vm4zmHdvWUaBJ661K4H1LZHgDKfI0yy6IVRMh7sL7LGllRJSxY3zFCX
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074949_335908_235A8F28 
X-CRM114-Status: GOOD (  20.32  )
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

Since the path pointer is stored in the source's structure, retrieve it
directly when disabling the path.

As a result, the global variables used for caching path pointers are no
longer needed. Remove them to simplify the code.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 79 +++------------------------
 1 file changed, 9 insertions(+), 70 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index cb1d4f90a9c245b2c2f6e818c0f4d905b86477db..9e94505bccf4ac91207f2f5393ae57ae077d61d6 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -12,19 +12,6 @@
 #include "coresight-priv.h"
 #include "coresight-trace-id.h"
 
-/*
- * Use IDR to map the hash of the source's device name
- * to the pointer of path for the source. The idr is for
- * the sources which aren't associated with CPU.
- */
-static DEFINE_IDR(path_idr);
-
-/*
- * When operating Coresight drivers from the sysFS interface, only a single
- * path can exist from a tracer (associated to a CPU) to a sink.
- */
-static DEFINE_PER_CPU(struct coresight_path *, tracer_path);
-
 ssize_t coresight_simple_show_pair(struct device *_dev,
 			      struct device_attribute *attr, char *buf)
 {
@@ -170,11 +157,10 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 
 int coresight_enable_sysfs(struct coresight_device *csdev)
 {
-	int cpu, ret = 0;
+	int ret = 0;
 	struct coresight_device *sink;
 	struct coresight_path *path;
 	enum coresight_dev_subtype_source subtype;
-	u32 hash;
 
 	subtype = csdev->subtype.source_subtype;
 
@@ -226,35 +212,6 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		goto err_source;
 
-	switch (subtype) {
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
-		/*
-		 * When working from sysFS it is important to keep track
-		 * of the paths that were created so that they can be
-		 * undone in 'coresight_disable()'.  Since there can only
-		 * be a single session per tracer (when working from sysFS)
-		 * a per-cpu variable will do just fine.
-		 */
-		cpu = source_ops(csdev)->cpu_id(csdev);
-		per_cpu(tracer_path, cpu) = path;
-		break;
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM:
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
-		/*
-		 * Use the hash of source's device name as ID
-		 * and map the ID to the pointer of the path.
-		 */
-		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
-		ret = idr_alloc_u32(&path_idr, path, &hash, hash, GFP_KERNEL);
-		if (ret)
-			goto err_source;
-		break;
-	default:
-		/* We can't be here */
-		break;
-	}
-
 out:
 	mutex_unlock(&coresight_mutex);
 	return ret;
@@ -270,9 +227,8 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
 
 void coresight_disable_sysfs(struct coresight_device *csdev)
 {
-	int cpu, ret;
-	struct coresight_path *path = NULL;
-	u32 hash;
+	int ret;
+	struct coresight_path *path;
 
 	mutex_lock(&coresight_mutex);
 
@@ -280,32 +236,15 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		goto out;
 
+	/*
+	 * coresight_disable_source_sysfs() clears the 'csdev->path' pointer
+	 * when disabling the source. Retrieve the path pointer here.
+	 */
+	path = csdev->path;
+
 	if (!coresight_disable_source_sysfs(csdev, NULL))
 		goto out;
 
-	switch (csdev->subtype.source_subtype) {
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_PROC:
-		cpu = source_ops(csdev)->cpu_id(csdev);
-		path = per_cpu(tracer_path, cpu);
-		per_cpu(tracer_path, cpu) = NULL;
-		break;
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE:
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM:
-	case CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS:
-		hash = hashlen_hash(hashlen_string(NULL, dev_name(&csdev->dev)));
-		/* Find the path by the hash. */
-		path = idr_find(&path_idr, hash);
-		if (path == NULL) {
-			pr_err("Path is not found for %s\n", dev_name(&csdev->dev));
-			goto out;
-		}
-		idr_remove(&path_idr, hash);
-		break;
-	default:
-		/* We can't be here */
-		break;
-	}
-
 	coresight_disable_path(path);
 	coresight_release_path(path);
 

-- 
2.34.1


