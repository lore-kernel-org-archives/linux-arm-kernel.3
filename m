Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331CBC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvcbJE983O86I46bj1qg11kIeSUcXgvT9oEvjykSLNE=; b=QxFbgomkaRQnbKk411T4yPYjIn
	FAI3Z+3grk8ZUyLWPGKQvoO9J/ItUU1r4mNZW94zNIRPPS6pxNtq7CMbSEqRih8hDR4IHoN+oc7PF
	wg03JRX8Y7hrYqvV4MjSKCiAR0w/VT9CK+A50IQd/oNfSbMFoOMIWPvH9fTmX6LZn4sQkMpIEstOd
	NZ97GO0oD59WmmepeNPhGVr7jjNr+WIDjuwPj+lt/pnLyutlOuC3YfeW+98dhsFZg6OpGsflI8Xzy
	5LgTQXyByZcXh7SEFA53SNPVb94mFZAcqkwF6ybqNIR+hm/pVJwuXgCsvnJ95+FyCBQI0V65xnu8n
	hNt7LHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1B7-00000009PS2-0qRN;
	Mon, 19 May 2025 14:09:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0t5-00000009LZF-1sCy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 13:50:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BAFC1655;
	Mon, 19 May 2025 06:50:23 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91C183F6A8;
	Mon, 19 May 2025 06:50:35 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>
Subject: [PATCH] coresight: etm4x: Fix timestamp bit field handling
Date: Mon, 19 May 2025 14:50:27 +0100
Message-Id: <20250519135027.2204747-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_065039_529143_0E66247F 
X-CRM114-Status: GOOD (  13.07  )
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

Timestamps in the trace data appear as all zeros on recent kernels,
although the feature works correctly on old kernels (e.g., v6.12).

Since commit c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions
to sysreg"), the TRFCR_ELx_TS_{VIRTUAL|GUEST_PHYSICAL|PHYSICAL} macros
were updated to remove the bit shift. As a result, the driver no longer
shifts bits when operates the timestamp field.

Fix this by using the FIELD_PREP() and FIELD_GET() helpers. Simplify the
ts_source_show() function: return -1 when the value is zero, as this
indciates an invalid value; otherwise return the decoded TS value
directly.

Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
Fixes: c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions to sysreg")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../hwtracing/coresight/coresight-etm4x-core.c  |  2 +-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c | 17 ++---------------
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 6a5898355a83..acb4a58e4bb9 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1237,7 +1237,7 @@ static void cpu_detect_trace_filtering(struct etmv4_drvdata *drvdata)
 	 * tracing at the kernel EL and EL0, forcing to use the
 	 * virtual time as the timestamp.
 	 */
-	trfcr = (TRFCR_EL1_TS_VIRTUAL |
+	trfcr = (FIELD_PREP(TRFCR_EL1_TS_MASK, TRFCR_EL1_TS_VIRTUAL) |
 		 TRFCR_EL1_ExTRE |
 		 TRFCR_EL1_E0TRE);
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 49d5fb87a74b..8a2749eeb9a5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2315,23 +2315,10 @@ static ssize_t ts_source_show(struct device *dev,
 	int val;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	if (!drvdata->trfcr) {
+	val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
+	if (!val)
 		val = -1;
-		goto out;
-	}
-
-	switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
-	case TRFCR_EL1_TS_VIRTUAL:
-	case TRFCR_EL1_TS_GUEST_PHYSICAL:
-	case TRFCR_EL1_TS_PHYSICAL:
-		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
-		break;
-	default:
-		val = -1;
-		break;
-	}
 
-out:
 	return sysfs_emit(buf, "%d\n", val);
 }
 static DEVICE_ATTR_RO(ts_source);
-- 
2.34.1


