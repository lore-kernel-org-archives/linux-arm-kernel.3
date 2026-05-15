Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B13CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 20:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXePDo6dcTul+XxIvon7T6/68zrqZfy2jicNM6wM+b0=; b=cyrWG7SoDt41Alks9wWgGtmWqp
	mIVFlBBMV3n7n0Uwy/v7ywFMIipadXNv/YGDdwACeVHXJ67AiuFSkUR9hTkw/h3knakGJ6PK3SGkv
	ZljKuV60zd086g7wV65fG9Zovt7H/grS1AASCILVBphW0G+usLjvo8AVDP/4r5TLSPSIIGUjrrALO
	Z3P/P7Y4FOtXSS6nBOs0f+ir2QR6Xx/gspuYSeppSyMZPgRtuEE+uhPPDCf3n3mYRYA9cM2gOlJkV
	u3Wkt7PJRTDWPjBLSuDXLPdXK0BMAbDAggZ4Vi6Nvwk5t+Tt+GJGUEM6OBgtKXmzalJmzJVnRx5J3
	bJq12w6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrK-00000009K6i-404G;
	Fri, 15 May 2026 20:10:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyrA-00000009Jwe-3PEX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 20:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XXePDo6dcTul+XxIvon7T6/68zrqZfy2jicNM6wM+b0=; b=Agf1uYLvQrzVHCnEA/3L5ZnBeI
	fxB9i9RJAul8Jtl3jI3TGXKGCvkplfGLo0wFppVcG6U1Y4EsjWGvBlMTQtsN2ueBpFAVa4FFvJt24
	6bn1ZMNHSZSncP6vlJo7Z/Q2nu6WUbVWyDU02r45Y3F5jb9XZI4PMxoekMMvxymqrZpkNoPNpPRc5
	DQ6zTFHxAOw4DP1CPvh1s3NyehnasWmRoMoVtrrhZbdnHuMD2rfwkmC5zivwVfh4S+mEzMsLY/Ho1
	y911g5nDaEdaL3XSU5MK0A9Aib14an763aXP94U7k43k1QC2QDGTs+FZiPCKS0m/usfHUuYQBXLnA
	wDJQJ8YQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNyqx-00000006A6e-2snn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 20:09:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A90F35E2;
	Fri, 15 May 2026 13:09:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED0A33F836;
	Fri, 15 May 2026 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778875786; bh=kN9VKnrs6Nurux/aacBhIieCIcINM1gS1nYW4QPS8OM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MiI9kHQybpy6t363O1yQIe5SabL2KGPWJ/QZFdJFCW2rXyRrLEXvzDOvPOx4ez+Zh
	 Tx8VYl6LVe+lKdvgxrn1GbcPw60aAmbGnuj4i/phNuxBb4G0HkprTweK8H2QMmKNs5
	 L7q0I1KxRGN9m72ky/UlgkqXettFj2x6ACsmQEqg=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 21:08:33 +0100
Subject: [PATCH v14 26/28] coresight: sysfs: Increment refcount only for
 software source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v14-26-f88c4a3ecfe9@arm.com>
References: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
In-Reply-To: <20260515-arm_coresight_path_power_management_improvement-v14-0-f88c4a3ecfe9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778875700; l=4561;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=kN9VKnrs6Nurux/aacBhIieCIcINM1gS1nYW4QPS8OM=;
 b=7AEHiT1tSoyYa3XHM0MlxYrT1sqzFPzPzekmU5ZOsdHkNmpfBfDPXkivw2qnZrjY3ZjEi/BHf
 1JX4hpm+EV3CV5BjD2X00UxL8jwEDjWY+K/Nbtp9SNwU1o0A4iBkEIr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_210957_427847_BEEAFCE8 
X-CRM114-Status: GOOD (  16.69  )
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


