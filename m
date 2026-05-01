Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4907BCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDQQT3IesCo6qmb1yTemvIeFaqK+aS5m+JnKVqRfoaU=; b=clpYuxRSFqyzzDdgyZ7A2lCFhp
	wM4csQOUx/lu1j7+4d0yZGVf5DXLWKF0iZFvB0GAP2rRuutftRu0kSZPOcwh8mV78PA9si6qZadoe
	HzLIHwcERIJJc7humcmAsgvQkZdVUTvHvTMfTuTFbetWxDvOtx0jg2EV296jl7+mq69uRyCJHOw6E
	9kYu0McgP+7jdgRGIaXbF34AwJ2g7HDXtSehBgCuxdydrpWhoT61DwxEuweD6pBZlfsPH5Sn5fh2t
	K6g1ij5DmCbTwlp94pGrGvgpQpbQdH792RbQOK0uB3r1TBMpZ5WE2N5jHeV9cxWpm2iFOg9d3UdP5
	yw/38NtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3N-00000007SI8-1RMI;
	Fri, 01 May 2026 16:49:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3L-00000007SEN-1gjU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 May 2026 16:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JDQQT3IesCo6qmb1yTemvIeFaqK+aS5m+JnKVqRfoaU=; b=BG3zfSqDMJ0WhupYkALfogg3Kd
	E8xekLu8SbqxrVpU6JrdCLhpudEGmZFAKNzUw13izBOPy6RK6r++mc5kloO56mZaXaFXolzzZHUvb
	zo3+yKAoh0AitBYwB9Cwy9Pjg5GJxEUeQsE/r/OCRvX6GAVbSusSZxHgDVCbDuPekObeidnyc+bq6
	uWym5CmpkuYwyS04kQlDPbMqSCbwynNue8IpQPzxw1qzbV/B18OarHBgdo2i/ZN1jN6W+SQRhrgEl
	At9UA2fPys9wAiSiZOCY4GAzrP2LrZ48JpUHw5TgUBhCvT0fAJXnKY/wNtaWWi9v3FBCD2A9zdJ1c
	lA8OPsZQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr3I-00000009BGF-1OMw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 161D71692;
	Fri,  1 May 2026 09:49:14 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 036E43FB3E;
	Fri,  1 May 2026 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654159; bh=0bNulVnk7lpo2IZi4DrHi1M9Cuyyqc/Q+SQ+OjthcBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qJl6ErbGXzH3zD1fY9Cgp6lPDyIvfB6lTMX88B90D15J5qf2AqEI6J0YYvOvMoB/P
	 Oppu0MnT94o3+A2Bbfom0MUv0FYZrojUJWeB3774cfse4LlimraAe92hsBCulhMFux
	 mJ3tADAixOX+ElkLwcekaeMTAurKwpLp9vG8WhMQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 01 May 2026 17:48:06 +0100
Subject: [PATCH v11 25/27] coresight: sysfs: Increment refcount only for
 system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-arm_coresight_path_power_management_improvement-v11-25-fc7fb9d5af1c@arm.com>
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777654086; l=3704;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=0bNulVnk7lpo2IZi4DrHi1M9Cuyyqc/Q+SQ+OjthcBA=;
 b=CZhAUcgykIGULO0KE4zmFaoX6ByO/rPM7Q/lebcMYwYo29esw9EcoFgJiqpAgQgBQK8Sjp2lM
 zkExkSeAmGtD6eX1Bo1izDexQdq+QtHn+T4zm5L2xFsE4O43yJ5MOih
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_174920_733378_B6A9AEE2 
X-CRM114-Status: GOOD (  16.59  )
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
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-sysfs.c | 41 ++++++++++++++++++---------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 0aebafcb8d0e8e699652244af5202e7c4dc4e9b1..42cf07b8d15a420e963650000dc32bbb38f0aa62 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -39,6 +39,28 @@ ssize_t coresight_simple_show32(struct device *_dev,
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
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt++;
+}
+
+static void coresight_source_put_refcnt(struct coresight_device *csdev)
+{
+	if (csdev->subtype.source_subtype ==
+			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
+		csdev->refcnt--;
+}
+
 static int coresight_enable_source_sysfs(struct coresight_device *csdev,
 					 enum cs_mode mode,
 					 struct coresight_path *path)
@@ -57,14 +79,14 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
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
@@ -79,7 +101,7 @@ static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
 	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
 		return false;
 
-	csdev->refcnt--;
+	coresight_source_put_refcnt(csdev);
 	if (csdev->refcnt == 0) {
 		coresight_disable_source(csdev, data);
 		return true;
@@ -156,9 +178,6 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
 	int ret = 0;
 	struct coresight_device *sink;
 	struct coresight_path *path;
-	enum coresight_dev_subtype_source subtype;
-
-	subtype = csdev->subtype.source_subtype;
 
 	mutex_lock(&coresight_mutex);
 
@@ -173,13 +192,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
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
 

-- 
2.34.1


