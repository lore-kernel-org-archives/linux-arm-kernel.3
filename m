Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F501099B32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGmg/0ZOKWO3Ue3qrQO/PyI2DRXnYPGEnUKHkxnmK7E=; b=wQxy9pLdggpCQDEMj7olDIjP3C
	Mxxeuyp6mrRR8j01/s3FjLTzljZnq6MZ5S72Bvxsw4nJArDHFoeWozgIHmnAE9uOcWfQSHvqF+vnI
	zrbWf+jq2xqFLP7ZOu+iAzstKtrHKK43hAyN60zJWcz4O6iQ1q9jCdPCELGzBNoN5MyRlG1z+3crI
	Xfkyx+OdIUHPf71aTU+rdONlQdUhZbdnF+Cq5hjQ/xAEO7cL7EtzZdffwsJe+eqMqvnlUHZLXWOlk
	moRrMLHgutYovU+CJZDLc0rmkhh2btgMIS/tefm7YWlMN1yDorZdISl1N0R9O0pSLn9rbaxjbayqh
	VQe1cjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dtF-0000000DIWr-0vdN;
	Fri, 20 Mar 2026 17:44:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3dsu-0000000DIB1-2JfF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:43:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F077165C;
	Fri, 20 Mar 2026 10:43:38 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4928C3FA1F;
	Fri, 20 Mar 2026 10:43:42 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 20 Mar 2026 17:43:00 +0000
Subject: [PATCH v7 18/20] coresight: sysfs: Increment refcount only for
 system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-arm_coresight_path_power_management_improvement-v7-18-327ddd36b58b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774028583; l=3186;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=WLbeXo/jD2PhRE6Wz64OmGRyJeHoAv3HsE7bXNRpHas=;
 b=2sbr9dPjfkY3mIwCLqSizbn+vIM4VH3ZxEWXoi0vwIMYEEsTOEP9KOqxXs0aG6HGGs92MMKtk
 1xKHmS0+1Y3D2p9hh0kPo09OjTo0CgY9chKhRLaJdkemiPuezzkporC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_104344_764366_1593B5DA 
X-CRM114-Status: GOOD (  14.80  )
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

Except for system tracers (e.g. STM), other sources treat multiple
enables as equivalent to a single enable. The device mode already
tracks the binary state, so it is redundant to operate refcount.

Refactor to maintain the refcount only for system sources. This
simplifies future CPU PM handling without refcount logic.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 35 +++++++++++++++------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 9e94505bccf4ac91207f2f5393ae57ae077d61d6..04c1425eb37d69c6feb8e49446fc58ee57a5e82e 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -58,7 +58,17 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 			return ret;
 	}
 
-	csdev->refcnt++;
+	/*
+	 * There could be multiple applications driving the software
+	 * source. So keep the refcount for each such user when the
+	 * source is already enabled.
+	 *
+	 * No need to increment the reference counter for other source
+	 * types, as multiple enables are the same as a single enable.
+	 */
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt++;
 
 	return 0;
 }
@@ -80,7 +90,10 @@ static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
 		return false;
 
-	csdev->refcnt--;
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt--;
+
 	if (csdev->refcnt == 0) {
 		coresight_disable_source(csdev, data);
 		return true;
@@ -159,10 +172,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
 	struct coresight_device *sink;
-	struct coresight_path *path;
-	enum coresight_dev_subtype_source subtype;
-
-	subtype = csdev->subtype.source_subtype;
+	struct coresight_path *path = NULL;
 
 	mutex_lock(&coresight_mutex);
 
@@ -176,16 +186,8 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	 * coresight_enable_source() so can still race with Perf mode which
 	 * doesn't hold coresight_mutex.
 	 */
-	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		/*
-		 * There could be multiple applications driving the software
-		 * source. So keep the refcount for each such user when the
-		 * source is already enabled.
-		 */
-		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
-			csdev->refcnt++;
-		goto out;
-	}
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto enable_source;
 
 	sink = coresight_find_activated_sysfs_sink(csdev);
 	if (!sink) {
@@ -208,6 +210,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	if (ret)
 		goto err_path;
 
+enable_source:
 	ret = coresight_enable_source_sysfs(csdev, CS_MODE_SYSFS, path);
 	if (ret)
 		goto err_source;

-- 
2.34.1


