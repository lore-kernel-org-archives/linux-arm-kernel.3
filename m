Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7A7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7HAqjeWwLVnuthJm9T0TyotQsYdYi4nXf0ltHZaJaY=; b=LnsSPJn9OXn9CGWH/VNxYf1zT1
	MRm6PGEKzQxPw6bwav12NZKckyM0n24VVJTFxFImKszCbWOayBzyMJiAPwAArpOu9w3P4hQhzXEbG
	XV/pboYldEU1noAaMkz7YfWpQUK2LbA+aa04nrI+GTVdi54kuNblPhkmnDDSwZfNqjTCygtCvQx7c
	GfMVOX94BqmpwBeHtaIEvUnroBsMCUgUWKNcZDtLLLKq12gtd/kYN5said5pqx82IxsXSweOLaNhI
	IvVUSMTgpJHh3SAMOolmRRIhrS9RJujXNPr9rvQIhyj25TcsiyLk/fV7xMsoHKkN8CkH81WbSyOLy
	8SeSuATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGRM-00000000czD-3fgh;
	Mon, 31 Mar 2025 14:48:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGEK-00000000Zjc-0iJT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AF2B6116B;
	Mon, 31 Mar 2025 14:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED90C4CEE3;
	Mon, 31 Mar 2025 14:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743431711;
	bh=RxXN5ImDkHlxqQmfInHiKTyFOrz987IzeR6333NbSJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VN3X0c5JEX1KzMRilhCNXpB8HDzItTArlYw2Zeb7nlHlMU8j1P/osSrhXmLZb+azj
	 MlfjKG+bjmpHAwhvF4RGAWrZbBNuu1Li4xRQj6GIECVWBYW/1SP7o/JokLBXHpwWU4
	 4+sjRwlo0IsqmcuGCvN5VdSmIzIs/cDhWVDGn+B0ioHsXKFui3rBwm6eO8bipB9jKW
	 2tdDLFPhqLaFvimb1xsc+V0hgSSwX+66AeM4bdLJxTqKxmILhp1/dyWW4oiYvvIYSN
	 IW4ecB4zoIM8sWWfoMvF8q207Z4wcyHpbF5LTnPr9IzS7ngae2zPQ3JyBRjI+iMPzz
	 5ervVB8Rr72Og==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 08/16] perf: arm_pmu: Don't disable counter in armpmu_add()
Date: Mon, 31 Mar 2025 10:34:42 -0400
Message-Id: <20250331143450.1685242-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331143450.1685242-1-sashal@kernel.org>
References: <20250331143450.1685242-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit dcca27bc1eccb9abc2552aab950b18a9742fb8e7 ]

Currently armpmu_add() tries to handle a newly-allocated counter having
a stale associated event, but this should not be possible, and if this
were to happen the current mitigation is insufficient and potentially
expensive. It would be better to warn if we encounter the impossible
case.

Calls to pmu::add() and pmu::del() are serialized by the core perf code,
and armpmu_del() clears the relevant slot in pmu_hw_events::events[]
before clearing the bit in pmu_hw_events::used_mask such that the
counter can be reallocated. Thus when armpmu_add() allocates a counter
index from pmu_hw_events::used_mask, it should not be possible to observe
a stale even in pmu_hw_events::events[] unless either
pmu_hw_events::used_mask or pmu_hw_events::events[] have been corrupted.

If this were to happen, we'd end up with two events with the same
event->hw.idx, which would clash with each other during reprogramming,
deletion, etc, and produce bogus results. Add a WARN_ON_ONCE() for this
case so that we can detect if this ever occurs in practice.

That possiblity aside, there's no need to call arm_pmu::disable(event)
for the new event. The PMU reset code initialises the counter in a
disabled state, and armpmu_del() will disable the counter before it can
be reused. Remove the redundant disable.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Tested-by: James Clark <james.clark@linaro.org>
Link: https://lore.kernel.org/r/20250218-arm-brbe-v19-v20-2-4e9922fc2e8e@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/perf/arm_pmu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 398cce3d76fc4..2f33e69a8caf2 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -342,12 +342,10 @@ armpmu_add(struct perf_event *event, int flags)
 	if (idx < 0)
 		return idx;
 
-	/*
-	 * If there is an event in the counter we are going to use then make
-	 * sure it is disabled.
-	 */
+	/* The newly-allocated counter should be empty */
+	WARN_ON_ONCE(hw_events->events[idx]);
+
 	event->hw.idx = idx;
-	armpmu->disable(event);
 	hw_events->events[idx] = event;
 
 	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
-- 
2.39.5


