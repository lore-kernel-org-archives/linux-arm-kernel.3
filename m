Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC27CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXePDo6dcTul+XxIvon7T6/68zrqZfy2jicNM6wM+b0=; b=pI0/vpGfmikSe8on3TeCRkqEgA
	L08n6FGDf1Dxo28nZIZ8XhajbF7IgRjFS3MWl5ypxmMmWVnRxFE+1m5I5zAhl3P+Q9WVqfDcKj4IG
	9TxqSNstZCVO93sZznDdpDCSoCp5P2kGqXhFIRmwzwOEEz3G/ql9j1gDTage7n1Hs+UmNomX2s+J5
	L0QCc4Ay9t2MofIFhZnQc8CTHD17AGAJ9+2PYitU4CDbrSVWtXV77l6ctjAId5OjO9hIyBwebPxTt
	9QsLERMiKEhanpa0AQIxnpw/IkvrxNoftac+WVIgVneqSIRYSL4jcjAVtPzj/hs7bHEyizBpFjo5h
	x0tBOrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxf0-000000099KG-0bpK;
	Fri, 15 May 2026 18:53:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeh-000000098yv-3oKB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E014035D3;
	Fri, 15 May 2026 11:52:57 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521723F836;
	Fri, 15 May 2026 11:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871183; bh=kN9VKnrs6Nurux/aacBhIieCIcINM1gS1nYW4QPS8OM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/nEtGiodY9u9CQqnV73qursjHdJo/huIIQxAVRXTEMLLHqmQeuz1rArovvBWmGss
	 1+xJCm7fnmKG3FB5zpn8Xqi+94wsDD8E9F94J9iypdRoiOnHesr8rWbeiiUgqX+pE8
	 1M42R22iv8/NkyhX6xRgHbSRRF2CCZPXpq1WwL+0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:49 +0100
Subject: [PATCH v13 26/28] coresight: sysfs: Increment refcount only for
 software source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-26-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=4561;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kN9VKnrs6Nurux/aacBhIieCIcINM1gS1nYW4QPS8OM=;
 b=+0YaUN04NUs1aRlnlmsCbmFGGog65aZLo4RW+IHIm+fbjWzUNIAZ5iW38dFURz+u3vK4RwhOX
 J0kpmUwjbYrBjH5aBVRG2hoU7LDcpi5lPmWvlebOUnHFt1CfR9Ioebk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115305_326898_FA3DA790 
X-CRM114-Status: GOOD (  16.93  )
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

Except for software sources (e.g. STM), other sources treat multiple
enables as equivalent to a single enable. The device mode already
tracks the binary state, so it is redundant to operate refcount.

Introduce a helper coresight_is_software_source() for check software
source. Refactor to maintain the refcount only for software sources.
This simplifies future CPU PM handling without refcount logic.

Tested-by: James Clark <james.clark@linaro.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 39 +++++++++++++++++----------
 include/linux/coresight.h                     |  6 +++++
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 21196ee1d2bdf6ccba4afbde2c188432bc4932b1..80b6b634a70d3cec98dfa3e5fd146cd254b96d6f 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -39,6 +39,26 @@ ssize_t coresight_simple_show32(struct device *_dev,
 }
 EXPORT_SYMBOL_GPL(coresight_simple_show32);
 
+static void coresight_source_get_refcnt(struct coresight_device *csdev)
+{
+	/*
+	 * There could be multiple applications driving the software
+	 * source. So keep the refcount for each such user when the
+	 * source is already enabled.
+	 *
+	 * No need to increment the reference counter for other source
+	 * types, as multiple enables are the same as a single enable.
+	 */
+	if (coresight_is_software_source(csdev))
+		csdev->refcnt++;
+}
+
+static void coresight_source_put_refcnt(struct coresight_device *csdev)
+{
+	if (coresight_is_software_source(csdev))
+		csdev->refcnt--;
+}
+
 static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 					 enum cs_mode mode,
 					 struct coresight_path *path)
@@ -57,14 +77,14 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 			return ret;
 	}
 
-	csdev->refcnt++;
+	coresight_source_get_refcnt(csdev);
 
 	return 0;
 }
 
 /**
- *  coresight_disable_source_sysfs - Drop the reference count by 1 and disable
- *  the device if there are no users left.
+ *  coresight_disable_source_sysfs - Drop the reference count by 1 for software
+ *  sources. Disable the device if there are no users left.
  *
  *  @csdev: The coresight device to disable
  *  @data: Opaque data to pass on to the disable function of the source device.
@@ -79,7 +99,7 @@ static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
 		return false;
 
-	csdev->refcnt--;
+	coresight_source_put_refcnt(csdev);
 	if (csdev->refcnt == 0) {
 		coresight_disable_source(csdev, data);
 		return true;
@@ -156,9 +176,6 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	int ret = 0;
 	struct coresight_device *sink;
 	struct coresight_path *path;
-	enum coresight_dev_subtype_source subtype;
-
-	subtype = csdev->subtype.source_subtype;
 
 	mutex_lock(&coresight_mutex);
 
@@ -173,13 +190,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	 * doesn't hold coresight_mutex.
 	 */
 	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
-		/*
-		 * There could be multiple applications driving the software
-		 * source. So keep the refcount for each such user when the
-		 * source is already enabled.
-		 */
-		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
-			csdev->refcnt++;
+		coresight_source_get_refcnt(csdev);
 		goto out;
 	}
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 58d474b269806d32cad6ed87da96550b06f1f30f..76ef4c0965125cd11830df0151a6707d3e3b638d 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -611,6 +611,12 @@ static inline bool coresight_is_percpu_source(struct coresight_device *csdev)
 	       (csdev->subtype.source_subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_PROC);
 }
 
+static inline bool coresight_is_software_source(struct coresight_device *csdev)
+{
+	return csdev && coresight_is_device_source(csdev) &&
+	       (csdev->subtype.source_subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE);
+}
+
 static inline bool coresight_is_percpu_sink(struct coresight_device *csdev)
 {
 	return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SINK) &&

-- 
2.34.1


