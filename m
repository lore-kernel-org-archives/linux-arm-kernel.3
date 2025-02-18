Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6800AC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/gWQLpENkYIweUZZhR5QKu/S++hBVjHi7qJlKJzuHE=; b=PEQRNz+BQ8U8Q0H9XLsDtQ/oqQ
	A8dVqfM7sszZFWs7mrG634+Fx8F2vDjGTdBoQVpWkynx9JEQFj8nDCYX+tclDW70zp2hSrtLc9ZZg
	TK6Pin31B3NuhiqqPPROgRDDrMNQCan6uWAr+rG4kQ02xoMZm8Y9NG3Pzo56pmqwXp3b4o/cYJAFR
	UHAI7BBqXpMeDJKLkZuvjyZKXNGodXjWF1lV5eVmDSmGEiDzZ5T61IueMwAfqMxjTq2fPPHIRIPL4
	ofuSDcIf92qLU/w/qqywWUTm/6pXcu9vl+6XVmCnnDOz1tAlILKQkSjKPzJFzj/EAtqKXF+U3CJDu
	TZyx067Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVDO-0000000A0jr-2hid;
	Tue, 18 Feb 2025 21:33:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOb-00000009ohQ-03nO
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 20:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D/gWQLpENkYIweUZZhR5QKu/S++hBVjHi7qJlKJzuHE=; b=CHgQOd6SvuI0ysEOv5LU15EieC
	4IfmmhzXolEH5QR6DEM2e9r0UI8Lb/LjyImuHdXBh17cXTQnraLGCSbTXkeV2pc9y50YcJUfbzlfq
	Nt24KOaFwNsBceISK06lHUeaWV+zCXw1JbzaVbpNuVvbKuABKChCTSaGNt56M11Iplake4loOgHPI
	pMJpQcyJ5fW7XICpw3AbVJwNPnu+K9so5zGwS1w1sxZ3bpPp6DlOh386YaUSq8CnQJCiI2quJQBqN
	FzMnFnlGnbqxN5hXVIZbGw1q6jSRfJAPV7TS8ejJHmmbOQ5Rn1gEMlpHaoUx+es+r5BJ/T+DjuKGH
	Y/67xF8g==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOY-0000000233t-097D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20AE7A41D86;
	Tue, 18 Feb 2025 20:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3E0C4AF19;
	Tue, 18 Feb 2025 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911240;
	bh=WOev3GWVs5k3PS+7RVxODhtU0P5MrvrxotTjByzSK9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i9KbD9AHF0nvLUvui2jkZzjoEqOmRbOxTg2F9TkX6fAo2Peu0PfCocd510+weACvL
	 PcfKNCcoq7Jz/tLJcjHqHxNcbbGgIN6mE3/pbLiRhQZh7n1kQ9wTSDDF3gpK2MYEaO
	 tKgim/eIZRCHAaEdgWxvx0Wqmd4HYOatNkeHQ8929DUmJ87zpyzq/lnJY2VBV6+7LZ
	 e6SQEIbyLWoDsSE2sRPB9kDuNloGh8Xc/aWQFAxHBuiwfdI5+VKubO2QU5lRbnQCXN
	 EENE+PCxSjvUA4+idGJG80bB0OqaTqjQ9qqN/0yj9fcnUFKQjrGh6RW4BxS6TtUsNR
	 N/uypyrmHzNYA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:39:59 -0600
Subject: [PATCH v20 04/11] perf: arm_v7_pmu: Drop obvious comments for
 enabling/disabling counters and interrupts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-4-4e9922fc2e8e@kernel.org>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_204042_453719_DB489CE8 
X-CRM114-Status: GOOD (  10.68  )
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

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/perf/arm_v7_pmu.c | 44 --------------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 420cadd108e7..7fa88e3b64e0 100644
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
2.47.2


