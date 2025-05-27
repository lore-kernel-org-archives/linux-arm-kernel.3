Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 12:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QtqPEEIZY92g8MYEtZZOdEPGIrCi8ZZp4TWnYMa+kd4=; b=gdvyFChPI7F+6pP+6NgpbTI6xb
	ycZfayHn09qt2hXAM6/Z1N+nvfATzgyGEJDYkJyVCjwmkGBNaDcCudDzPknzaZN05XCND3/o9SW3C
	3ptWkETbSPXvhK8beOKN2se+l5VHzmna4Hxq8/CgqTespTky2+0bV6CcFhZBsE1GhXsVgVZIcAA8/
	D0bi6FpjwGgahkZGlnA3OILzGvODODFjRMRR3PFzMjp1YncIusz9kNsVkKxA79SO31G07fHqsZw35
	yr9vH1gjJK+f7u7OhhB8aeFPKB1PdCGZDQU9L/5ZfXHfaKZ0WSilIhCPXrd7AP5iF2wsOd6diEFvB
	pcyO7ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtIh-0000000AhFR-28Kt;
	Tue, 27 May 2025 12:20:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJtGY-0000000Ah3i-0WOt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 12:18:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFFD614BF;
	Tue, 27 May 2025 05:18:28 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D85593F5A1;
	Tue, 27 May 2025 05:18:43 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] perf: arm_spe: Relax period restriction
Date: Tue, 27 May 2025 13:18:27 +0100
Message-Id: <20250527121827.3919495-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_051846_209082_DF062494 
X-CRM114-Status: GOOD (  13.95  )
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

The minimum interval specified the PMSIDR_EL1.Interval field is a
hardware recommendation. However, this value is set by hardware designer
before the production. It may not accurately reflects actual hardware
limitations, and tools currently have no way to test shorter periods.

This change relaxes the limitation by allowing any non-zero periods.
This gives chance for experimenting smaller periods. Add a warning
for reminding the period is less than recommended threshold.

The downside is that small periods may increase the risk of AUX ring
buffer overruns. When an overrun occurs, the perf core layer will
trigger an irq work to disable the event and wake up the tool in user
space to read the trace data. After the tool finishes reading, it will
re-enable the AUX event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..a00229ddfa08 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -309,15 +309,22 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 static void arm_spe_event_sanitise_period(struct perf_event *event)
 {
 	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
+	struct device *dev = &spe_pmu->pdev->dev;
 	u64 period = event->hw.sample_period;
 	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
 
-	if (period < spe_pmu->min_period)
-		period = spe_pmu->min_period;
-	else if (period > max_period)
+	if (period < spe_pmu->min_period) {
+		/* Period must set to a non-zero value */
+		if (!period)
+			period = 1;
+
+		dev_warn_ratelimited(dev, "Period %llu < %u (recommended minimum interval).\n",
+				     period, spe_pmu->min_period);
+	} else if (period > max_period) {
 		period = max_period;
-	else
+	} else {
 		period &= max_period;
+	}
 
 	event->hw.sample_period = period;
 }
-- 
2.34.1


