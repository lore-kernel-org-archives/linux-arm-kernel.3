Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC6C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uw6+Qdsw7M7iYiJ3d8hgGC+OiD6omyyl8cRgPkvu9ts=; b=vIkhC1ICkj7xLlwO/SGe74ZnZI
	CY/+WdUIBHoNEVn4iNF3RR0ep9dY8spCv5fpDTRvz4rUHnz6Hslc/Rvf6baZkrzCRCehJpjmGjp1M
	XquykPhoYv2ow+q881yUCd+V0jjYrLw5Mcj/Lu00QEPSCvA4o3nerSMzrXByrbYFAzWcnU9tt15J7
	9TwxTxeRds/3uXhaJKjGERl3EdKA4LkLh2IIGNr95KwO1hLYSScQb32gscLHMsiBo9A75PQ0cKBTA
	UKiZk/5c4sUty32EdvtdBujA74GAD/Fe2XBVh8OhgngZxy/0gYcw2s+u0c8rl23RVMMnLyH7O/bJL
	wavSlN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGoV-0000000DEqz-40o4;
	Wed, 28 May 2025 13:27:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGmJ-0000000DEdU-1j7V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:25:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BAB51A2D;
	Wed, 28 May 2025 06:24:50 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3DA33F5A1;
	Wed, 28 May 2025 06:25:05 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2] perf: arm_spe: Relax period restriction
Date: Wed, 28 May 2025 14:25:01 +0100
Message-Id: <20250528132501.129586-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_062507_503198_99C3A234 
X-CRM114-Status: GOOD (  13.00  )
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
This gives chance for experimenting smaller periods.

The downside is that small periods may increase the risk of AUX ring
buffer overruns. When an overrun occurs, the perf core layer will
trigger an irq work to disable the event and wake up the tool in user
space to read the trace data. After the tool finishes reading, it will
re-enable the AUX event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

Changes from v1:
- Shifted bits with FIELD_PREP().
- Removed warning log which is not quite useful. (James Clark)

 drivers/perf/arm_spe_pmu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..e40e5daa838d 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -308,12 +308,16 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 
 static void arm_spe_event_sanitise_period(struct perf_event *event)
 {
-	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 	u64 period = event->hw.sample_period;
 	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
 
-	if (period < spe_pmu->min_period)
-		period = spe_pmu->min_period;
+	/*
+	 * As per the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
+	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
+	 * states: "Software must set this to a nonzero value."
+	 */
+	if (period < FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1))
+		period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
 	else if (period > max_period)
 		period = max_period;
 	else
-- 
2.34.1


