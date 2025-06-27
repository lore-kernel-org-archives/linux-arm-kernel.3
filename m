Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E60DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdkAZ3p6D6lBfUwva3t5elmKHumyy6ulOxZGeXH8/oU=; b=rMPl8lXMAlqSnA2rEGbgnlXBqT
	xNPp9wtcC1Icg28P3TZWJsIYHhLNO8Od9zHXAFKGd+W+gB9Eqq2+LrR6xGcc4cxXVIZ6jbHYy1vgV
	ME+SY5VggwQE927/PAzn9n+Txj63YyM0QsECFeW6LEuq/k/mvOjEOIhVVPu6/Bwh8MzgXwVWMNRa/
	bMh/iHAWuSnuBGBZy9uyF9LRwVL0nJS0FSyfWZRm2Oq7zebvWzFkeBSwg4cKcdnLFKv5jO0k1ya1i
	rRXsOnHhBmb/OMTPbanfBvRLHXRy+/+JWS5+eOBXEqtxR6bfmQc5dbUIwiBmng9Y9t7N4jendqOM7
	Sv+RqQcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVD1S-0000000FQOX-2ViK;
	Fri, 27 Jun 2025 17:37:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVByQ-0000000FHFN-1qwy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:30:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B0A91A00;
	Fri, 27 Jun 2025 09:30:28 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 207E03F58B;
	Fri, 27 Jun 2025 09:30:43 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v3] perf: arm_spe: Relax period restriction
Date: Fri, 27 Jun 2025 17:30:28 +0100
Message-Id: <20250627163028.3503122-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_093046_518507_D03C968C 
X-CRM114-Status: GOOD (  13.38  )
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
before the production. It is not actual hardware limitation but tools
currently have no way to test shorter periods.

This change relaxes the limitation by allowing any non-zero periods,
with simplifying code with clamp_t().

The downside is that small periods may increase the risk of AUX ring
buffer overruns. When an overrun occurs, the perf core layer will
trigger an irq work to disable the event and wake up the tool in user
space to read the trace data. After the tool finishes reading, it will
re-enable the AUX event.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

Changes from v2:
- Updated comment for the difference between minimum interval
  recommendation and hardware limitation (Anshuman).
- Refactored with clamp_t().
- Removed review tag as the refactoring.

 drivers/perf/arm_spe_pmu.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..369e77ad5f13 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -308,17 +308,21 @@ static u64 arm_spe_event_to_pmscr(struct perf_event *event)
 
 static void arm_spe_event_sanitise_period(struct perf_event *event)
 {
-	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
 	u64 period = event->hw.sample_period;
 	u64 max_period = PMSIRR_EL1_INTERVAL_MASK;
 
-	if (period < spe_pmu->min_period)
-		period = spe_pmu->min_period;
-	else if (period > max_period)
-		period = max_period;
-	else
-		period &= max_period;
+	/*
+	 * The PMSIDR_EL1.Interval field (stored in spe_pmu->min_period) is a
+	 * recommendation for the minimum interval, not a hardware limitation.
+	 *
+	 * According to the Arm ARM (DDI 0487 L.a), section D24.7.12 PMSIRR_EL1,
+	 * Sampling Interval Reload Register, the INTERVAL field (bits [31:8])
+	 * states: "Software must set this to a nonzero value". Use 1 as the
+	 * minimum value.
+	 */
+	u64 min_period = FIELD_PREP(PMSIRR_EL1_INTERVAL_MASK, 1);
 
+	period = clamp_t(u64, period, min_period, max_period) & max_period;
 	event->hw.sample_period = period;
 }
 
-- 
2.34.1


