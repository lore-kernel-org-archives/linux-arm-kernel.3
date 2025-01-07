Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F70E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q4BvjsThbcuk2yWaiu4PjWEhQ6b9AxZqya0BriW4qw=; b=UvFPwGVNMjDhrDitQiPAjYCRde
	jXQOvldSUj3h/ROWTyPomvJ+2lLvGH233jGF/kMH2r3lc6NsWzwODftZWJ4lc5VevlEilbmCJwL1l
	XCJim+5c6swjOPbzR1wZaBlwXV8AFRSMEqgYK2aPT/U9asYLvJ18VyL4y6qE2l6pzeyy8dQ4XGSdY
	nhFZi/LghKdcx9+no63VvVFmTBkHBkQAm6s0HleH8IEXpUlE2zpIJMnle1ssabf9N7ZRXlzUDGFb9
	F1BdLWrybD/mdTMotnf/AKVnpp58ZB2HbDRFG97zYRsi0Gfx7gtgnXoJlrwi0J7XOWRUgAyf0FHqr
	3+Mk+fpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDxR-00000005xJH-0pZz;
	Tue, 07 Jan 2025 18:05:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDq8-00000005vsK-0CjG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A0035C5AB0;
	Tue,  7 Jan 2025 17:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE23C4CED6;
	Tue,  7 Jan 2025 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736272683;
	bh=XFA/YG0tyw7HQ7kQjjoUNZxsPed+1g9YsBcAFNNi/7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k5WmGUi8BAtGwlotCQj+i7lLyYJ0pteKdHcxWbY71z6am74TMZY0Qckm1bRkB0iR1
	 2v0qNfMAxNrV0n48WwqDdW61+giEwDzWV59XYco09AiUeXdUCrSmg5PM7Lh/FdgtBt
	 XsqAuqBNJCTyY6DYTEeJpVUiTHM56yqy96HeEjqOP93eGV+UOFdPZqb9uw/aG4LzGI
	 uD/zBREmDB8OSnyoaUWb7i7j3xoVJyiIzHm+QH4jgUB8+aPjNUCr4ocWXISyCmXm+I
	 jV8UfdYEJ69AwxJRUaNbjg+rk64KQ9YywXi5pGXreOPN4jTpkz6rUlDDJcRfIfWrLW
	 Db6tV/vn3dY/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 07 Jan 2025 11:57:23 -0600
Subject: [PATCH 5/7] perf: arm_v7_pmu: Don't disable counter in
 (armv7|krait_|scorpion_)pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250107-arm-pmu-cleanups-v1-v1-5-313951346a25@kernel.org>
References: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
In-Reply-To: <20250107-arm-pmu-cleanups-v1-v1-0-313951346a25@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_095804_132460_B6E4C85F 
X-CRM114-Status: GOOD (  10.35  )
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

Currently (armv7|krait_|scorpion_)pmu_enable_event() start by disabling
the event counter it has been asked to enable. This should not be
necessary as the counter (and the PMU as a whole) should not be active
when *_enable_event() is called.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_v7_pmu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 7fa88e3b64e07bacbf2f9731e3318a7dc1085fb1..17831e1920bd8d306aa1ea9cebe8b3f4659dfcee 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -857,8 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
 		return;
 	}
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We only need to set the event for the cycle counter if we
@@ -1450,8 +1448,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We set the event for the cycle counter because we
@@ -1762,8 +1758,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We don't set the event for the cycle counter because we

-- 
2.45.2


