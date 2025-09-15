Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E686ECAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bli4edlh5wOZWdKzF0nVDDMQjW+bgshm53Sg/x+eESI=; b=sMmLTw+jRsrEHHKwt/DIB3gIAJ
	vuPGT6CmpXjL0tU1KWIxbUkxVJhtEQE7HQVbTEpufqDUrR6e8uNW58kdi6YTdaxddgh7BdYBTd8mj
	laEE1UqNRPGnsw7OlKyyNlGczvf3sXdffEoF3Onkv8NmoblAR1drsW0UBalxR1Dh7/RiuvoE02JZK
	xDrpk9YA+pa3663B6BoERf3wx+ut1F8OVHkaeJUhrj7/JLeTeeblfx7dwNBzzAv1A34KxWZKNIMLc
	gAfVfA3DfzK8PApZPsvTluyS2pVccM5oe99V3VjFltzTp1rC48dpB7xYpboh/Nn5Y9A/BTRLp0lAA
	w5sJlz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6X2-00000003fW5-3W8z;
	Mon, 15 Sep 2025 10:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wy-00000003fRx-3Ma5
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Bli4edlh5wOZWdKzF0nVDDMQjW+bgshm53Sg/x+eESI=; b=buUN7L6dImzWF8sFJPfCLMQI1J
	Dun4vzmNEXRU33a13ff6Ec152UM5/uy8btXKXOhOZeYBO4fWZhb3N1Gj4wLuezsxHpUlWTIg6i+Xn
	9zKfWSVZK443Wci6qcp6+mtf/J4Gzdm4YOOs+0Twdw+/r/k3LYbzBDzIa0Q7C5XDskqj5WRTdbsW6
	DHuTFs/8lRa9uhr0dTBuTnfXWKhVzOCObB3VQQYb49kWb94J7rkF3Yciol4BXoOJPSVSr+dYVkfif
	2xEiLEizUCF9lBkK32F5ro38/11sO3x9H195tVeMejyhs71tnMbNwBmT01JnnZ0TWdkSNR/TZJiZZ
	r7Gmq5FQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Wv-00000006vWe-2cdF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:33:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DF451424;
	Mon, 15 Sep 2025 03:33:43 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F38083F66E;
	Mon, 15 Sep 2025 03:33:49 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:28 +0100
Subject: [PATCH v3 05/31] coresight: etm4x: Ensure context synchronization
 is not ignored
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-5-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=3873;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=fn963pYoU+lVrkCgnRYI6TuzRxmaQwTz3lSVBtCEYIY=;
 b=+vmCcQH3xJjYWUDJd01FPa4gJGpNAxfxq0kKXFft1q0nvLzne6oSArAYC1Cz4mUOs/3OTwmzM
 /2/Lc/lyRbiCShCz3xjSBhnABhbhFWxETJT0Upa04N8hhXF/CNT7oza
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113354_192514_23E07BC1 
X-CRM114-Status: GOOD (  13.48  )
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
index 382ec1a1cdd035e76d451d0112afd3f029ecbdb6..31d4838b47ae4a3a96c6a06774707214943268fc 100644
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
 
@@ -956,11 +956,6 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
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
@@ -983,6 +978,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 
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
@@ -1120,6 +1122,12 @@ static int etm4_resume_perf(struct coresight_device *csdev)
 
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
@@ -1136,6 +1144,12 @@ static void etm4_pause_perf(struct coresight_device *csdev)
 
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


