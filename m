Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJbfOrk2W0Pw5PcCsvNcOg4YQV8fP46RFLCod9Kt4zc=; b=ZlISs43zJwv0HPVc5Mvqcfkq0c
	205Iol66mF9v3KnfJQM0zBeGrEPJxCx65N+3PzKyUiBPA5s3WVM7M1u9GjknSuHaQWHvoWOqMnDG0
	kmFffbHUhCo730Ev+GDLnvOjDZqGcFUA/hJ6gFuDkpa9+f8VR8G49NqX7h77q3vZELPjpyHghAZ0y
	y1cEFMcdwDkB38Zgfht1RqaQyhQ5f94wEb6h+VmybI6Gar3lhPZpOKb47/q8gH7c661wzA/jN19CX
	YH+U1Rq4Wy/Zo/cXaueJKkQjYpw1GI/A09NXWq2wRwMRQbJs9rIXINx0KcQnM8dao02qr7gAsZ6yD
	AY5I7pFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWe0L-000000064AB-1F7T;
	Tue, 01 Jul 2025 16:38:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcMz-00000005mh7-3naa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:54:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D141236D;
	Tue,  1 Jul 2025 07:53:46 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 821523F66E;
	Tue,  1 Jul 2025 07:53:59 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Jul 2025 15:53:30 +0100
Subject: [PATCH v2 05/28] coresight: etm4x: Ensure context synchronization
 is not ignored
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-arm_cs_pm_fix_v3-v2-5-23ebb864fcc1@arm.com>
References: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-0-23ebb864fcc1@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Levi Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751381627; l=3873;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=cZSgSqHyGz4g339eEwnz63jNxp9jl1FHzIgfY83DJVk=;
 b=dPwCRABFBE79Xl5//j6oYONooKvweBNCvADww5mRISOWoNXscg3g/apLgtTmEsftnm+/CHvIm
 h0Rxm0ASydeAnF7wDcLYsz81asATC6mZCZSr7iuwDgvp4JqWw+yFbD3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_075402_025583_12094A7B 
X-CRM114-Status: GOOD (  13.77  )
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

As recommended in section 4.3.7 "Synchronization of register updates" of
ARM IHI0064H.b, a self-hosted trace analyzer should always executes an
ISB instruction after programming the trace unit registers.

An ISB works as a context synchronization event; a DSB is not required.
Removes the redundant barrier in the enabling flow.

The ISB was placed at the end of the enable and disable functions.
However, this does not guarantee a context synchronization event in the
calling code, which may speculatively execute across function
boundaries.

ISB instructions are moved into callers to ensure that a context
synchronization is imposed immediately after enabling or disabling trace
unit.

Fixes: 40f682ae5086 ("coresight: etm4x: Extract the trace unit controlling")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 38 +++++++++++++++-------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 0f2a8b8459c93ca29d270b6fa05928244e0761c5..af9d3b2319c5f49ccd40dfa0ccf0f694ce9e2f4f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -459,13 +459,6 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
 		return -ETIME;
 	}
 
-	/*
-	 * As recommended by section 4.3.7 ("Synchronization when using the
-	 * memory-mapped interface") of ARM IHI 0064D
-	 */
-	dsb(sy);
-	isb();
-
 	return 0;
 }
 
@@ -579,6 +572,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 
 	if (!drvdata->paused)
 		rc = etm4_enable_trace_unit(drvdata);
+
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 done:
 	etm4_cs_lock(drvdata, csa);
 
@@ -954,11 +954,6 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
 	if (etm4x_wait_status(csa, TRCSTATR_PMSTABLE_BIT, 1))
 		dev_err(etm_dev,
 			"timeout while waiting for PM stable Trace Status\n");
-	/*
-	 * As recommended by section 4.3.7 (Synchronization of register updates)
-	 * of ARM IHI 0064H.b.
-	 */
-	isb();
 }
 
 static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
@@ -981,6 +976,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 
 	etm4_disable_trace_unit(drvdata);
 
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
+
 	/* read the status of the single shot comparators */
 	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
 		config->ss_status[i] =
@@ -1118,6 +1120,12 @@ static int etm4_resume_perf(struct coresight_device *csdev)
 
 	etm4_cs_unlock(drvdata, csa);
 	etm4_enable_trace_unit(drvdata);
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 	etm4_cs_lock(drvdata, csa);
 
 	drvdata->paused = false;
@@ -1134,6 +1142,12 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 
 	etm4_cs_unlock(drvdata, csa);
 	etm4_disable_trace_unit(drvdata);
+	/*
+	 * As recommended by section 4.3.7 (Synchronization of register updates)
+	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
+	 * ISB instruction after programming the trace unit registers.
+	 */
+	isb();
 	etm4_cs_lock(drvdata, csa);
 
 	drvdata->paused = true;

-- 
2.34.1


