Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE228E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLBiwj8IfogrcJ7y12ztRmoNwpQiHsX8ttvL+3tsLnk=; b=uIrXnrqc8usK7e/Xx2AgnpAFd2
	Sc9SHTqivxDAvR57O7wK8OkyTluFhtxmcYI/dTiPCs7Kz1K+Rm5Q8yoch769w9yRNsiXnsJk6P8En
	ScwB/aCjCa5Ot3KeidLp2OQxfKjspTiF3A7ezUm+0uRiLh0QbYCfWUSNDQjBMAD6ctZ4t5R39QNLU
	Dtod2ydgk4Hsgpn9mhVmF1QS6Qv9zp59Xh4rOF4x4sbJKifzYw61cZ6ZOebGeZq1tANHR9HBFT8L8
	bORqbGjjDDDizryxw3gN5F/WjxKcaUUEcTgztfZXBbud4desjoroFkgeKcn1NaMT3gX6FFJZhBU+R
	rGzel0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDwF-00000005xBG-2EXf;
	Tue, 07 Jan 2025 18:04:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq5-00000005vrs-3aV5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:58:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48E405C5ACB;
	Tue,  7 Jan 2025 17:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF930C4CED6;
	Tue,  7 Jan 2025 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272681;
	bh=bGHhhbymQuCF6yfAGiV6Cpz7xaEk/cyDDkdwRpKdx1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fHPEA7iIoNVoepGleuV3evVE6t6TzF9Qzz9mmg9oqdFESZnneHb86MWmBOxFBgkHS
	 HgxaV4n5RalQmsvR8DZ55EWQDDC1geGDml8TpbiKjz/tG2yE9qDZFLjTN7teqOjvVb
	 /qT/F6X5MPrUUyq96vTGZwSwbNDcAvo0y4KFGKtewFZDFhQQzJS9x4vwViyuckYXf3
	 pg5Ka/U0f2R8jlXfxuGW2uIGhTz5bRDrUyJCccKtya4lgqd25SgGPhB2R1V+lE1KNH
	 HAjoSsSGTdGUVtPk9A41A6yf9k2lcG/85OmxWLzJEsuxlWoNCVxBYkUXvkLV6zAyK6
	 5hcQiJMngbcQg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:22 -0600
Subject: [PATCH 4/7] perf: arm_v7_pmu: Drop obvious comments for
 enabling/disabling counters and interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-4-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095801_985373_840D3FF8 
X-CRM114-Status: GOOD (  10.34  )
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

The function calls for enabling/disabling counters and interrupts are
pretty obvious as to what they are doing, and the comments don't add
any additional value.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_v7_pmu.c | 44 --------------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 420cadd108e79821f43537fab23fe081ca6fd9bc..7fa88e3b64e07bacbf2f9731e3318a7dc1085fb1 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -857,14 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
 		return;
 	}
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/*
-	 * Disable counter
-	 */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -875,14 +867,7 @@ static void armv7pmu_enable_event(struct perf_event *event)
 	if (cpu_pmu->set_event_filter || idx != ARMV7_IDX_CYCLE_COUNTER)
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/*
-	 * Enable interrupt for this counter
-	 */
 	armv7_pmnc_enable_intens(idx);
-
-	/*
-	 * Enable counter
-	 */
 	armv7_pmnc_enable_counter(idx);
 }
 
@@ -898,18 +883,7 @@ static void armv7pmu_disable_event(struct perf_event *event)
 		return;
 	}
 
-	/*
-	 * Disable counter and interrupt
-	 */
-
-	/*
-	 * Disable counter
-	 */
 	armv7_pmnc_disable_counter(idx);
-
-	/*
-	 * Disable interrupt for this counter
-	 */
 	armv7_pmnc_disable_intens(idx);
 }
 
@@ -1476,12 +1450,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/* Disable counter */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -1494,10 +1462,7 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	else
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/* Enable interrupt for this counter */
 	armv7_pmnc_enable_intens(idx);
-
-	/* Enable counter */
 	armv7_pmnc_enable_counter(idx);
 }
 
@@ -1797,12 +1762,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-
-	/* Disable counter */
 	armv7_pmnc_disable_counter(idx);
 
 	/*
@@ -1815,10 +1774,7 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	else if (idx != ARMV7_IDX_CYCLE_COUNTER)
 		armv7_pmnc_write_evtsel(idx, hwc->config_base);
 
-	/* Enable interrupt for this counter */
 	armv7_pmnc_enable_intens(idx);
-
-	/* Enable counter */
 	armv7_pmnc_enable_counter(idx);
 }
 

-- 
2.45.2


