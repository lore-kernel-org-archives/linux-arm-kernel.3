Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFCFC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/jQ/r6dnutlEmVFqH2bRmtXSNKYe9zB5KKF+nVzjYs=; b=RoNfzIZz50JcylNhH7G2k3qvgf
	Qc2x0st2Tx3LhHy/eIFpUJqgIq8W2jKcjd3jErV2adk5q6l+HB7BMpCHsbDpYbDMbwK1RES5ygUMQ
	L86KL77OIqUFZBENSxmXnAOFll65wy1pHl62wLQljrYnvA3kjzQXxFD8OepO+Ow1iZfeCDWzp7Tf4
	8d1eaBOdFNBw88vfDI95tJW4VNwPuE0QG6Z8A1ibVaLNzgTEejOAVBkMil/UY4RI3LzJHTZ+GVK+w
	+w2pAjacAUteURus6ZeO2+uGWEzJubLlNgjQB7sW8HwM6uwxLSy5zCcwOhVM0jhTds47pv0V39pTD
	C1Imerqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzgCx-0000000462C-2Fbl;
	Tue, 01 Apr 2025 18:19:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzg1G-000000044cg-2T5N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 18:07:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886BA12FC;
	Tue,  1 Apr 2025 11:07:29 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B92E93F59E;
	Tue,  1 Apr 2025 11:07:24 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
Date: Tue,  1 Apr 2025 19:07:06 +0100
Message-Id: <20250401180708.385396-6-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_110726_754747_A8EE0C8B 
X-CRM114-Status: GOOD (  14.71  )
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

The buffer update callbacks disable the sink before syncing data but
misses to re-enable it afterward.  This is fine in the general flow,
because the sink will be re-enabled the next time the PMU event is
activated.

However, during AUX pause and resume, if the sink is disabled in the
buffer update callback, there is no chance to re-enable it when AUX
resumes.

To address this, the callbacks now check the event state
'event->hw.state'.  If the event is an active state (0), the sink is
re-enabled.

For the TMC ETR driver, buffer updates are not fully protected by
the driver's spinlock.  In this case, the sink is not re-enabled if its
reference counter is 0, in order to avoid race conditions where the sink
may have been completely disabled.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c |  9 +++++++++
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..7584cc03d8e6 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	unsigned long offset, to_read = 0, flags;
 	struct cs_buffers *buf = sink_config;
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	struct perf_event *event = handle->event;
 
 	if (!buf)
 		return 0;
@@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
 	 * is expected by the perf ring buffer.
 	 */
 	CS_LOCK(drvdata->base);
+
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	if (!event->hw.state)
+		__tmc_etb_enable_hw(drvdata);
+
 out:
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..8923fbc6e1a0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1636,6 +1636,7 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct etr_perf_buffer *etr_perf = config;
 	struct etr_buf *etr_buf = etr_perf->etr_buf;
+	struct perf_event *event = handle->event;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 
@@ -1705,6 +1706,15 @@ tmc_update_etr_buffer(struct coresight_device *csdev,
 	 */
 	smp_wmb();
 
+	/*
+	 * If the event is active, it is triggered during an AUX pause.
+	 * Re-enable the sink so that it is ready when AUX resume is invoked.
+	 */
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (csdev->refcnt && !event->hw.state)
+		__tmc_etr_enable_hw(drvdata);
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
 out:
 	/*
 	 * Don't set the TRUNCATED flag in snapshot mode because 1) the
-- 
2.34.1


