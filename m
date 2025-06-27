Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F307C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2W3Ptz5zciVB0KMW5W2hFRCpKBo983QwSpLgOooK10=; b=jgN1xTq4YkVBxwONjPkwfr2JEm
	OZBw5+UTSjE0ZBER8gBGl9+CEoojnHDrtGRMmFkoUDUrV+NTD4i3JwwrXkOr5zhcNCiuQ0K01klNJ
	QUsqkLJFi6xILDJZjfO9LDc8r2nsJlh3Xxs9vpiNJ7nOvY+NDxar26MskKRO6v791snAKFYU/f944
	WUmJmzXpu491cWiliukMxU5nmiZflmUgoBYv0OZATg9erGA4yQ6+wbgGHPKXVRbY8f/CTtT03rVlt
	+XXRG2lZXpKLH1bnMfAvtWzbkHUV18TOJkVM2UFfmL/XRV0a3uczil6pEkMs692h1T+ziFnoYucP2
	dZrSlyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5Fu-0000000E5wX-150a;
	Fri, 27 Jun 2025 09:20:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5D5-0000000E5Jv-1HHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 09:17:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 418641A00;
	Fri, 27 Jun 2025 02:17:07 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 717913F762;
	Fri, 27 Jun 2025 02:17:23 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>,
	James Clark <james.clark@linaro.org>
Subject: [PATCH v2 RESEND] perf: arm_spe: Relax period restriction
Date: Fri, 27 Jun 2025 10:16:59 +0100
Message-Id: <20250627091659.3316899-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_021727_378913_95B43829 
X-CRM114-Status: GOOD (  12.12  )
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

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
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


