Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1308BCD4845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dVL3MjpwLzmasFjUKSnkM0SbKdifLyQos7/lwYhZJo=; b=iCt5g0wqD4GAwEcsVa7E+0TBqz
	+c9KjBx3zTbaT0Whsv1vtmfae6x83G8OkP85leM5a95C1zpSjIX++wqcSaZQZ7WnlQSuPoYqfdb+Q
	/skEuTXH/HJgZYYjuJqfBna0Md97XJgccstD5VZn4qDaTKEdcnZK+gR5D4UkIfVvjcaBSbxdh6vSR
	G0DzZVLgSRaWTXsctB5aspRTTlkqCb8i4s0IHaThTjrzGWgLcGhCFYoRzoJWGG/4RT/snOPsMBXJm
	9so94X3haCUEwI8jt82t/p5zjWafOdeDdOIAfwxu8fJi9+KNoxbO8z0yWrjFbquE7/gBY0+CLqt9R
	OswmxalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYR-0000000DFsE-2dBE;
	Mon, 11 May 2026 11:12:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYJ-0000000DFdn-3dbS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2dVL3MjpwLzmasFjUKSnkM0SbKdifLyQos7/lwYhZJo=; b=Ip5KKpVAr/whsAK4oQxD0mClR+
	WhCMXFbSyvtb2UM5imrrHj/pfHby79/oHWF0lpQBW5lxO7EzNTBScJLbyHLSzhiPqeTEtTyPv+ECX
	MsAh9v9SRmOozRazKt8y7BLlXRGrWj93aA1ilipPf+NWtl1D8oQT/uECh3/tDdfpXAk3hibH2Ecq2
	aU/IcYiLthAz80x3fg0it6x7CHnYvqjDbrFscdgc6nu6vuvyVnbQ3LmJfiacDGTg4BCWzhN0fl3PF
	jWHfm1WJ7/7+JO1GTktOP8wKajqhiAt6Ls3SU8gy02dztXwa55dK/wm/mYul0LCspvpp8Lx9XVK0B
	wSkB4kJA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOYG-0000000BQsA-1aSc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:11:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 107DE1756;
	Mon, 11 May 2026 04:11:50 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B73C3F85F;
	Mon, 11 May 2026 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778497915; bh=HyRjjUHiEY1sGzh2ZYGIqjbzwP4shk7X3s6OcJDLu0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PTFGbcZKhv1QWoJzBer44nACq+Q6FKGSWWouQ5KqkrkJt+kI2dyx819Qcb3Sl/nz3
	 wMQwTxGapmHx5xSrp1NeiggiTREumlSoamsSWw6X0EnKCIzCmlkP+yJDmPjEPRCPeE
	 I+xQCu6uT4w6pIQ/Rm12BLA7iWAZ5Otry6W6ovaE=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 11 May 2026 12:11:02 +0100
Subject: [PATCH v12 18/28] coresight: Introduce coresight_enable_source()
 helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm_coresight_path_power_management_improvement-v12-18-1c9dcb1de8c9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778497860; l=4297;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=HyRjjUHiEY1sGzh2ZYGIqjbzwP4shk7X3s6OcJDLu0Q=;
 b=DxBEWRKnU8G1hjTBcQ1pEDqVgtjbGjK4/tnDzeIyToAJ/fdniJfxSAw6pT1TOB6ctwRyUbVRf
 MolbN5QQPkMAXeixB/VDidRA2YZ09PQkIkr/aFXtDJSdQOxV0BUQV1r
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_121156_986251_CDFE151F 
X-CRM114-Status: GOOD (  15.38  )
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
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c     | 18 ++++++++++++++++--
 drivers/hwtracing/coresight/coresight-etm-perf.c |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h     |  3 +++
 drivers/hwtracing/coresight/coresight-sysfs.c    |  2 +-
 4 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 2effbde0133b79c81ba72dd9b1ed6510523370d1..ff882769cab2bb20bc2cb768e86f111f8a09cc8d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -479,11 +479,25 @@ static void coresight_disable_helpers(struct coresight_device *csdev,
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
index e416d2717a99aa3b573f8e53adec19518851d635..7919b0c225f7704194fb736901f51dd5fa21521d 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -593,7 +593,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto fail_end_stop;
 
 	/* Finally enable the tracer */
-	if (source_ops(source)->enable(source, event, CS_MODE_PERF, path))
+	if (coresight_enable_source(source, event, CS_MODE_PERF, path))
 		goto fail_disable_path;
 
 	/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index a1aab67e23db7fdea5139100312b3eb7cd31df51..456c53ba5d4c87bf33490383eb59b6a1710bbdf7 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -251,6 +251,9 @@ struct coresight_device *coresight_get_percpu_sink(int cpu);
 struct coresight_device *coresight_get_source(struct coresight_path *path);
 struct coresight_device *coresight_get_percpu_source_ref(int cpu);
 void coresight_put_percpu_source_ref(struct coresight_device *csdev);
+int coresight_enable_source(struct coresight_device *csdev,
+			    struct perf_event *event, enum cs_mode mode,
+			    struct coresight_path *path);
 void coresight_disable_source(struct coresight_device *csdev, void *data);
 void coresight_pause_source(struct coresight_device *csdev);
 int coresight_resume_source(struct coresight_device *csdev);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index b24b0d08a462cbe992cf26e03b47693b2cf5f8e9..7ef3f13ebac55b920458b6cd202bdb533796ba2d 100644
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


