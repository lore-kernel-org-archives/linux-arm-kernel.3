Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6FCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbp1RX/8OxXnvi3/Vh1xknV+NXrwdr7W8i8tnXbcE9w=; b=2/UXVqOdM3T+/z0A4yUobDwa+I
	kg/qazROmI3Bh4quPrAjaJr+whHrQyjyFA048FCo+KRaAP/+YRF1jg8HvEvw1qgVpcxgOQS6Qxsmp
	CSU7V5e8VIc0rQEBZ+8K2mgKRwUmOs21HE9Uosx/BEDhi0I65cPn2nPSayfgg5WnnRA9RGMbEstvK
	TKMx+xAJq+7gFn7+eyDHy92UNRBlm10Gd4dweuorJvdY52kv9Y3UrZfspJ3no/q2lZ+zE5C6LQSrP
	KCR3RJbbWiL1z2+mxLgFE0u5+mzQrT3z80gpdzHHU0Jzb8B7V7TLqSgMh8bbEVnwW3ZpJZ0Zxanbu
	lGqdxkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxec-000000098sz-1T0f;
	Fri, 15 May 2026 18:52:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNxeM-000000098ZQ-3L2s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 18:52:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C299D1516;
	Fri, 15 May 2026 11:52:35 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BF263F836;
	Fri, 15 May 2026 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778871161; bh=jUZ8Tr1F0203ducrkWCT6lapHJyBV8sURYBrHuw5MOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nW1U0eeUqjoOWrmcXQNT3lh9rmjtRSpItJ759h0/u96CpMJxFZ2JKWU3eLpikfAiI
	 f2PQtkAmsScKIDgWn6noN6F9eThmXFB/LnQ59CsW3LU7E5FAPMRN82SggqINZI8rtP
	 Fnb7muth1MXDJHFeEgGiEqGGeZiMY1x99xuI+hDM=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 15 May 2026 19:51:42 +0100
Subject: [PATCH v13 19/28] coresight: Save active path for system tracers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-arm_coresight_path_power_management_improvement-v13-19-9dfc558ed65e@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778871097; l=3320;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=jUZ8Tr1F0203ducrkWCT6lapHJyBV8sURYBrHuw5MOE=;
 b=a4X4nto7JmQ35198+zFmj0UQN8MVwTI/lEAezritbatr86+4lrOE3ROvVEFd6rKwAUHijnzxZ
 YVBmUBHcQAID8YWDp5/LIL30LDo7aSDu2/Lo7jtuiNIHMBLsYLnWlOA
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_115242_982706_6EDAD939 
X-CRM114-Status: GOOD (  18.02  )
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

This commit only set the path pointer for system tracers (e.g. STM) in
coresight_{enable|disable}_source().

Later changes will set the path pointer locally for per-CPU sources.
This is because the mode and path pointer must be set together, so that
they are observed atomically by the CPU PM notifier.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 23 ++++++++++++++++++++++-
 include/linux/coresight.h                    |  2 ++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index f833b73ebc168b2b039e5f0900594d0bde5ff916..7f6febd20faa64bc99336b368d0193221706fc2d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -487,10 +487,28 @@ int coresight_enable_source(struct coresight_device *csdev,
 			    struct perf_event *event, enum cs_mode mode,
 			    struct coresight_path *path)
 {
+	int ret;
+
 	if (!coresight_is_device_source(csdev))
 		return -EINVAL;
 
-	return source_ops(csdev)->enable(csdev, event, mode, path);
+	ret = source_ops(csdev)->enable(csdev, event, mode, path);
+	if (ret)
+		return ret;
+
+	/*
+	 * Update the path pointer until after the source is enabled to avoid
+	 * races where multiple paths attempt to enable the same source.
+	 *
+	 * Do not set the path pointer here for per-CPU sources; set it locally
+	 * on the CPU instead. Otherwise, there is a window where the path is
+	 * enabled but the pointer is not yet set, causing CPU PM notifiers to
+	 * miss PM operations due to reading a NULL pointer.
+	 */
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = path;
+
+	return 0;
 }
 
 void coresight_disable_source(struct coresight_device *csdev, void *data)
@@ -498,6 +516,9 @@ void coresight_disable_source(struct coresight_device *csdev, void *data)
 	if (!coresight_is_device_source(csdev))
 		return;
 
+	if (!coresight_is_percpu_source(csdev))
+		csdev->path = NULL;
+
 	source_ops(csdev)->disable(csdev, data);
 }
 EXPORT_SYMBOL_GPL(coresight_disable_source);
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 5f9d7ea9f5941ab01eb6a084ca558a9417c7727f..58d474b269806d32cad6ed87da96550b06f1f30f 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -257,6 +257,7 @@ struct coresight_trace_id_map {
  *		by @coresight_ops.
  * @access:	Device i/o access abstraction for this device.
  * @dev:	The device entity associated to this component.
+ * @path:	Activated path pointer (only used for source device).
  * @mode:	The device mode, i.e sysFS, Perf or disabled. This is actually
  *		an 'enum cs_mode' but stored in an atomic type. Access is always
  *		through atomic APIs, ensuring SMP-safe synchronisation between
@@ -291,6 +292,7 @@ struct coresight_device {
 	const struct coresight_ops *ops;
 	struct csdev_access access;
 	struct device dev;
+	struct coresight_path *path;
 	atomic_t mode;
 	int refcnt;
 	int cpu;

-- 
2.34.1


