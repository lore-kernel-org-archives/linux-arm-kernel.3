Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5394CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iedDnv4eHpN5/hrbduQ0X2blW8hwOzgk7c9TCGkTbE=; b=OaA1idzuTUV2/nx3g64qOKPWJG
	fkEIogotkvfNf+GZGnfxVtjTWv+lHU+p7K2MAI9cFeVRrfMkaGCEqBgVM5POwk0qcH3yE9m/ADlbC
	MhlsXZ5TrkzwYoqtFE/vOy0wuMcvd0tbtd63MO5zWg6EpX335mfLbmIRiQS1rIitFS7Ne+Etbalyg
	tLtrE4kiY7H6N12YC0zUEccPIqCF1/8gcw2sOGjFc/YF4z88s2ItS8b+NmwgbqX+SqqkgttbsVqxJ
	oSumHilvZhpw74qH6BLRJa+6B+PQSR82AlJJN1Erf8aTmC4UB91LvyfnH75CHvoM+BiHStpZMZ3yU
	gCGhokpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxem-0000000993p-0lw5;
	Fri, 15 May 2026 18:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeV-000000098lw-1ktZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B08535D3;
	Fri, 15 May 2026 11:52:45 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A15513F836;
	Fri, 15 May 2026 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871170; bh=CR7GH2XEl5utv/twhtmgwW1OsfTJ3cXQe1qD9/lpMvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KnK50IWO0qNhZevdSWf3iV494woALTELCiWHvqTtL0j4aNQeV/R0wKtjqehWgYAs2
	 NBZ0H+lNK84YbVPf8721vQ021D1Pl4NzcEOa8zx4n+PO2knAnXwWGmYtOoA0/ol6sQ
	 EWiXkb4MuhM5zARuSrKJdges55rKxJ1Uf98yRzxM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:45 +0100
Subject: [PATCH v13 22/28] coresight: sysfs: Use source's path pointer for
 path control
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-22-9dfc558ed65e@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v13-0-9dfc558ed65e@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, Jie Gan <jie.gan@oss.qualcomm.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=4640;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CR7GH2XEl5utv/twhtmgwW1OsfTJ3cXQe1qD9/lpMvI=;
 b=/0KlmEHJte/M76BUU1odia39A96GkH0d4ecXKcHUpX9bTR5Icng+XgJ/6t8HjNbuaVv8IYSqz
 TzL686Y7fIIDzyWN7YRFR6Kn39loxZ7zeMZdkZm7OXRA8HfotWmLnum
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115251_585881_2B737809 
X-CRM114-Status: GOOD (  20.90  )
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

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 82 +++------------------------
 1 file changed, 9 insertions(+), 73 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 9ec112b457bbdc85f807eccc6944bf39e5e363e1..21196ee1d2bdf6ccba4afbde2c188432bc4932b1 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -5,26 +5,12 @@
  */
 
 #include <linux/device.h>
-#include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/property.h>
 
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
@@ -167,11 +153,10 @@ static int coresight_validate_source_sysfs(struct coresight_device *csdev,
 
 int coresight_enable_sysfs(struct coresight_device *csdev)
 {
-	int cpu, ret = 0;
+	int ret = 0;
 	struct coresight_device *sink;
 	struct coresight_path *path;
 	enum coresight_dev_subtype_source subtype;
-	u32 hash;
 
 	subtype = csdev->subtype.source_subtype;
 
@@ -223,37 +208,6 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
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
-		cpu = csdev->cpu;
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
-		if (ret) {
-			coresight_disable_source_sysfs(csdev, NULL);
-			goto err_source;
-		}
-		break;
-	default:
-		/* We can't be here */
-		break;
-	}
-
 out:
 	mutex_unlock(&coresight_mutex);
 	return ret;
@@ -269,9 +223,8 @@ EXPORT_SYMBOL_GPL(coresight_enable_sysfs);
 
 void coresight_disable_sysfs(struct coresight_device *csdev)
 {
-	int cpu, ret;
-	struct coresight_path *path = NULL;
-	u32 hash;
+	struct coresight_path *path;
+	int ret;
 
 	mutex_lock(&coresight_mutex);
 
@@ -279,32 +232,15 @@ void coresight_disable_sysfs(struct coresight_device *csdev)
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
-		cpu = csdev->cpu;
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


