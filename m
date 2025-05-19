Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E58AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT2sps/9jSF4PvYZmYKMpxZi9FzsycScRYTOIiYOGhY=; b=CT+IYgR6H5hgZrcuDJB8vFiR8v
	fIEP9uRzDzmkU3MtiNv7TPZQODN9CxvaXwvsDCSkE8aCeDYfZyEq8Fvg82UZy2sl1Z/ssDUAkdeyb
	UoLYO/uAyEEXkR4OpYHcebAlBHS1NfGE79821tYPqkUG84TfuRuPpFYVvqDqhqajkUnFX4+562x90
	0KzTX58ZGCWNsEWgjIrLbfMTFnJPfYQD4MS+4QgD4OpSMR8VzVOl+ZibAVHm7kr3gskzhz2QiI4O3
	fnF3D5mNhD8SLa/3+kvdjF7De/pDErhQCBlmtF8vp8leWHEDzPDpBRgRlE+y4AzO4X0sfcPokEhnO
	b0B7d9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5Cd-0000000A8wZ-2yGT;
	Mon, 19 May 2025 18:27:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4cm-0000000A1Lr-3O9o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DD031655;
	Mon, 19 May 2025 10:49:50 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23F333F673;
	Mon, 19 May 2025 10:50:02 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 1/2] coresight: etm4x: Fix timestamp bit field handling
Date: Mon, 19 May 2025 18:49:44 +0100
Message-Id: <20250519174945.2245271-2-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519174945.2245271-1-leo.yan@arm.com>
References: <20250519174945.2245271-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_105004_891850_64F6C2F0 
X-CRM114-Status: GOOD (  13.68  )
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

Fix this by using the FIELD_PREP() and FIELD_GET() helpers.

Reported-by: Tamas Zsoldos <tamas.zsoldos@arm.com>
Fixes: c382ee674c8b ("arm64/sysreg/tools: Move TRFCR definitions to sysreg")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index 49d5fb87a74b..ab251865b893 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2320,11 +2320,11 @@ static ssize_t ts_source_show(struct device *dev,
 		goto out;
 	}
 
-	switch (drvdata->trfcr & TRFCR_EL1_TS_MASK) {
+	val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
+	switch (val) {
 	case TRFCR_EL1_TS_VIRTUAL:
 	case TRFCR_EL1_TS_GUEST_PHYSICAL:
 	case TRFCR_EL1_TS_PHYSICAL:
-		val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
 		break;
 	default:
 		val = -1;
-- 
2.34.1


