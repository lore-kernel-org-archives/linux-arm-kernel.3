Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A91BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPV5+9dDiN58fv4inRj806VUG2UnicbdbhUFPVgXYbg=; b=A64U4p23pqoU3wVUhLXcXvI37f
	4pwP2WCwwOVFYfHh82sHvqlKcLWpAD8SRn2jMptRd7j1tg3Kd10gr/yOV0NJXm+oblgcDZvQPwSDN
	NflJodwJXmS6Q3uQPdFR5GV8coq46sjGr5d8685Dl2Ch/xuWCytSC0GCP6ictplelTg2A8dyjnkwV
	iO7FQh6xxG7src/A0bgYH3rXbXQhOjsLgMtQbiClv4EIVjNKd0avGgo3UQNY6/YgzfrYCRwtXheCe
	82IpTTRjXT1JW/5YhCOE+jM5PI1rhiOZSZit/3NuG09aRi7rUr66M0B5VMTIB8zRAUPwaXCP9AAOo
	iiMvzZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjMx-0000000Fv4z-25Zn;
	Wed, 21 May 2025 13:20:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHixg-0000000FqGu-1EFo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:54:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A1861C14;
	Wed, 21 May 2025 05:54:05 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7A8373F77D;
	Wed, 21 May 2025 05:54:17 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3 1/2] coresight: etm4x: Introduce has_feat_trf() helper
Date: Wed, 21 May 2025 13:54:05 +0100
Message-Id: <20250521125406.2594620-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521125406.2594620-1-leo.yan@arm.com>
References: <20250521125406.2594620-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055420_478214_7C9371E9 
X-CRM114-Status: GOOD (  15.67  )
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

Introduce a new helper, has_feat_trf(), to detect whether FEAT_TRF is
implemented.

To avoid a SMP call for checking the system register, the function
directly reads the configured value. If the value is non-zero, it
indicates that the feature is present.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 8 ++++----
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x.h       | 9 +++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403ad..08deb67fe0ef 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -252,7 +252,7 @@ static void etm4x_prohibit_trace(struct etmv4_drvdata *drvdata)
 	u64 trfcr;
 
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
-	if (!drvdata->trfcr)
+	if (!has_feat_trf(drvdata))
 		return;
 
 	trfcr = drvdata->trfcr & ~(TRFCR_EL1_ExTRE | TRFCR_EL1_E0TRE);
@@ -288,7 +288,7 @@ static void etm4x_allow_trace(struct etmv4_drvdata *drvdata)
 	u64 trfcr, guest_trfcr;
 
 	/* If the CPU doesn't support FEAT_TRF, nothing to do */
-	if (!drvdata->trfcr)
+	if (!has_feat_trf(drvdata))
 		return;
 
 	if (drvdata->config.mode & ETM_MODE_EXCL_HOST)
@@ -1931,7 +1931,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
 	int ret = 0;
 
 	/* Save the TRFCR irrespective of whether the ETM is ON */
-	if (drvdata->trfcr)
+	if (has_feat_trf(drvdata))
 		drvdata->save_trfcr = read_trfcr();
 	/*
 	 * Save and restore the ETM Trace registers only if
@@ -2043,7 +2043,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 {
-	if (drvdata->trfcr)
+	if (has_feat_trf(drvdata))
 		write_trfcr(drvdata->save_trfcr);
 	if (drvdata->state_needs_restore)
 		__etm4_cpu_restore(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ab251865b893..8afcc553bb97 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2315,7 +2315,7 @@ static ssize_t ts_source_show(struct device *dev,
 	int val;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (!drvdata->trfcr) {
+	if (!has_feat_trf(drvdata)) {
 		val = -1;
 		goto out;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d..1840e658eda2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1068,5 +1068,14 @@ static inline bool etm4x_is_ete(struct etmv4_drvdata *drvdata)
 	return drvdata->arch >= ETM_ARCH_ETE;
 }
 
+static inline bool has_feat_trf(struct etmv4_drvdata *drvdata)
+{
+	/*
+	 * drvdata->trfcr is initialized to a non-zero value if trace
+	 * filtering is supported.
+	 */
+	return !!drvdata->trfcr;
+}
+
 void etm4_release_trace_id(struct etmv4_drvdata *drvdata);
 #endif
-- 
2.34.1


