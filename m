Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5AAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m46YHDBhxOpdlvEzjAVEc/g8f9rrTu3JPUGdp1oJyfA=; b=sVmj8X+FdRhGkFSbUxAuliU04w
	mVIRCa6XdYlJ5FESLZluYNQ+Dl/MdOkpgdPbSq3VdEDvWCnmPrhG/bI0H13xr90bAKLY7RKGP3E0g
	DqAvXkrYj5cUQb497v1i3itwB8jk6IS3c+guzM3s4sRc46mCxT+Dzdx9IjC+n3cDHu0E1SHnpBZq0
	KXOimyvqcEtxzBTAtg3/53nzc70Qk90XtwBa3FC66zu4qxVnWFXh4YFguL9CeOPlaQXbBODK8BaPU
	llqbuLlp6DPIMrFEBFnH2WQ7VzEgSNOuHPFFoKeFmFxnQ/WC2Vau/gtRoRxiRo0pUTCXxObOk0P/C
	mWba5X4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV92-00000009ze0-2UEp;
	Tue, 18 Feb 2025 21:28:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOU-00000009oeH-42Gi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C2EEA41B88;
	Tue, 18 Feb 2025 20:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E1C4CEE2;
	Tue, 18 Feb 2025 20:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911238;
	bh=+a0FkCRCTrAtsp19fWZ4DkttiYkptYjz7H4fWJd1ilY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J7F47NyVQ1Ny+x2wAP3a80SBDXDEBKp1DoOYgSxWMVEzjAetwvQhjMDnI02t5y9gZ
	 jDpFRCvH/pxop29anUUEuW+VQIWANYPPU7jDnS/pWZkmRiz6v6fDCJQNE5/ICuxebm
	 bFryGQ41YfhjINF396sSNh0yq36boGYHa29TgHVQK+6qktaqrNCm2vSD1ugeGEfaP5
	 bLspV5fIrKWjHPmpIiMAYD7v4utEi3NtPHKSVmwCN5epToCEecqb/qjKqT13Ow0NT9
	 xmf2gCZGArd6Ewt44zn6+ZpP2/mV4HVMNla01U4U57aoej+VkIs1S3FgF7bh38w4lG
	 BrQbBdBDYgQ+Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:39:57 -0600
Subject: [PATCH v20 02/11] perf: arm_pmu: Don't disable counter in
 armpmu_add()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-2-4e9922fc2e8e@kernel.org>
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
X-CRM114-CacheID: sfid-20250218_124039_134838_B6C19DEE 
X-CRM114-Status: GOOD (  18.09  )
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
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/perf/arm_pmu.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 398cce3d76fc..2f33e69a8caf 100644
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
2.47.2


