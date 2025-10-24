Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70210CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbKEMZmSlgzaEPy2kkVlpcjZRHTH/JkFptggQxJC3KE=; b=MvLP9hcbZ0hIwEYP4p8VW0o6xU
	BN83H1APzjgLOrJlKp5brqKTY6iWdI8QEhDRddW+erJOTXsPAxzFo5743UlMVs7FGhY2E9Vx36A39
	ZBS09hdKxD8fN2ihj+yPf3wU3KuVvrwkzv7QzIK76QKB3YX2I7vloiJkB4hz3m20sf5EeMVKTNLbp
	TgI2W8TnxSUVEhVq/N6EHAmiivKYKKINcOVITERHkVQgJuNcyEdJUp/DohqMxGu1CQqGbmrTppbJK
	hX8E7N8U0nDUh21FMrsg0luLHqssz6AV8gpiTRoB9BoTIGoahaIv1Xgq/wStl6ARxoiZJ0082kCK5
	ivpzZ2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKw9-0000000A10K-1IBg;
	Fri, 24 Oct 2025 16:46:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvx-0000000A0ri-3hvt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC01175A;
	Fri, 24 Oct 2025 09:46:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 764453F66E;
	Fri, 24 Oct 2025 09:46:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:53 +0100
Subject: [PATCH v4 05/11] coresight: etm4x: Ensure context synchronization
 is not ignored
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-5-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=3971;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/zJleg1t2zNAhjLjeySm0s5YKHvdWyLcYjFy8d+xljQ=;
 b=EJ2Lq/tFJewS2oWzwoaLQ0KnJLWwgGdHjdp4/qrlW8giYnlF3Ewz04rYfU3E7p4nMBZbDfLbx
 Buot4ZwcjhJC3Shqd+rp9BBJFeSjVvVwJv/VHMOxEcMgnwFqwPrJDty
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094634_026872_F955BD06 
X-CRM114-Status: GOOD (  12.86  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 38 +++++++++++++++-------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index c562f82985192ad71e181be1b570c9a2f334f29f..45bf76901650641d45a0d85965651667a8762b8c 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -460,13 +460,6 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
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
 
@@ -581,6 +574,13 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
 
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


