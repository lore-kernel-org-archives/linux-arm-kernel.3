Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EFDCD4842
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hrb5mTljujDZd9X5M2ml/xFdI4McB+Vbrhv6pIqJcPc=; b=boA1uSl6EMfc1LkOrLhAcgDcpo
	S22YsojjGB72YvwA2l+Zpyn+PgsvY0lw1UXvXSdFxP1dK9NEPLGcI3LWDeCKfkMWikq7sl3UJiYpH
	NPOS3b7NFelMJ89mWQWVeWFPtJzcACk+m1cl89kL7r54a4g3We+ZBkDkBI4J2v+zve5Yp9cclwV/T
	FXLsWXmSttKZAP9VACisAD7TWh4NCj3kTv0nXQYTOPu9QD7E1FAqFdjS4ub8BDkKc/NT1nIoPMHlk
	MzR7ijnn4Faj+jh7r17fTr4qOr7C3cyULyktwbzCKzbxdE9YFUhV/2y3nVMVwKjvmXRpmQlNNxgTj
	1KC89PWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYr-0000000DGUN-2OAQ;
	Mon, 11 May 2026 11:12:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYe-0000000DGDG-2aC1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Hrb5mTljujDZd9X5M2ml/xFdI4McB+Vbrhv6pIqJcPc=; b=hk3FLTlEBg+jRMX3+/I/PJ6gyM
	Dmi4dk6dBBqTnlhaPRJjQ60E3kBCCQTlxr41SCEz72pC5PXDtdC2GAuQ5kJQKGi1OQLk3FLPLD2Wo
	MrtHrDaqKqHLdvZYAT1cZa3BNv+XNuxz8UVdYx7weyh9pa8mwKHmQloFnoTs2mCafZ/RfD9SAhYmr
	rvkt4lMWIZ2dNcwIMAj3cyA3dY3KC2FD1QJRqlpM0DMwseM4/AY5aFtPLOFCQlfmsmziBE5QPELdl
	bba/VXpT1UpibFT4FlrWKPaAm7HUKF07eLhJKZWuJTeqjVn1r5TmsAZGc48wNCjS8yi/FVHnwbgW9
	fhGYq+MA==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYa-000000082r8-0w19
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:12:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B286422C8;
	Mon, 11 May 2026 04:12:09 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D85C53F85F;
	Mon, 11 May 2026 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497934; bh=BXij1k3TP57xl0BX6JWijBR4GKEmA52SprYTQoBkRuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VUqSUI0jxrdoNwlYe+FmZIEUdVCP+IkQrDTRp65Vawon+NHWFVkV8zG4JVx6D6bVr
	 xKXObggrMBMfjWww2Oj5nLdsX6im0XDZr4nmdk2jxufExS8b/mTlPQyJH39s0g/FWJ
	 KaccEFsWYww43ttN+Ezllqla0wEP6NHduYZ18ZOE=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:10 +0100
Subject: [PATCH v12 26/28] coresight: sysfs: Increment refcount only for
 software source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-26-1c9dcb1de8c9@arm.com>
References: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
In-Reply-To: <20260511-arm_coresight_path_power_management_improvement-v12-0-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4561;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=BXij1k3TP57xl0BX6JWijBR4GKEmA52SprYTQoBkRuM=;
 b=H/rDLn4TvOhAe6Qo7HRWRbhe5GYBM0AxOSeTnSi2DXBXM3wzFdF2aHzkIJTCsmBp+2vB0M1nm
 56WKgG0exS7ALNoaEKA2qZI6YZBgm0R0GyZeMOiSiXIreJ2O1yP6mGc
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121216_622956_87ACCAFB 
X-CRM114-Status: GOOD (  16.97  )
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
index 0aebafcb8d0e8e699652244af5202e7c4dc4e9b1..6f11738b67303eb826c0577eedc418694a0bb1ca 100644
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


