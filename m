Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B2E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijxdRyc4mcLKg9rm6BGoJB0JmRAT0XsjGWyvMWN6qBk=; b=enbtyGV/sRxTzt9L758QhUiwGO
	7VGFoadmKWnigRWbVC4mhagdMgjs5Bj3GdEZkScq/0AbBtBILtzvu30v2Bnt97Cr3MQ9EGcISZf42
	PgVsCdKRhhfUA/vka0ftfTgccN8nNcoq3LVOrff7pcxO7MQQwqg9rXHBCqlUcDugD1JsOLtd87yAb
	UNNXmSMBfXyVcDq1N21y702MDI0KP5EVYr31nhuiECmFAdHIGAqvg5TfP/kewV8MyJDAtARSnADcI
	eqzi7fZBoBGZAs16xAbS4+FlevTX2ohl2E5I97h5yZj6/sIz7TrvufHpc+n2mMq10rqG1bRqvvhfa
	uLdtLKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYjf-0000000AVF7-0r5Z;
	Tue, 03 Dec 2024 19:39:03 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYdx-0000000AU03-0EZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 19:33:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733254386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ijxdRyc4mcLKg9rm6BGoJB0JmRAT0XsjGWyvMWN6qBk=;
	b=sluqRxvyoiZ4T+cA7m4vf4UtDNvz8FiYrPEq+xwCByoIHPK3Mnb3KQkCTpdGmzLYoC8Lks
	aHDgFaQGVg4lKw27Sz9K+s46Zu32yq+VSmk2vYfpSCMirtKaNfzFShx7DAWCgPbTP1AZk/
	wNZeXdiHcR2RmQDKPqgjf8AcHT0sNL0=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [RFC PATCH 05/14] KVM: arm64: Always allow fixed cycle counter
Date: Tue,  3 Dec 2024 11:32:11 -0800
Message-Id: <20241203193220.1070811-6-oliver.upton@linux.dev>
In-Reply-To: <20241203193220.1070811-1-oliver.upton@linux.dev>
References: <20241203193220.1070811-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_113309_241869_72744C6D 
X-CRM114-Status: GOOD (  13.59  )
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

The fixed CPU cycle counter is mandatory for PMUv3, so it doesn't make a
lot of sense allowing userspace to filter it. Only apply the PMU event
filter to *programmed* event counters.

While at it, use the generic CPU_CYCLES perf event to back the cycle
counter, potentially allowing non-PMUv3 drivers to map the event onto
the underlying implementation.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 809d65b912e8..3e7091e1a2e4 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -707,26 +707,27 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	evtreg = kvm_pmc_read_evtreg(pmc);
 
 	kvm_pmu_stop_counter(pmc);
-	if (pmc->idx == ARMV8_PMU_CYCLE_IDX)
+	if (pmc->idx == ARMV8_PMU_CYCLE_IDX) {
 		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
-	else
+	} else {
 		eventsel = evtreg & kvm_pmu_event_mask(vcpu->kvm);
 
-	/*
-	 * Neither SW increment nor chained events need to be backed
-	 * by a perf event.
-	 */
-	if (eventsel == ARMV8_PMUV3_PERFCTR_SW_INCR ||
-	    eventsel == ARMV8_PMUV3_PERFCTR_CHAIN)
-		return;
+		/*
+		 * If we have a filter in place and that the event isn't
+		 * allowed, do not install a perf event either.
+		 */
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+			return;
 
-	/*
-	 * If we have a filter in place and that the event isn't allowed, do
-	 * not install a perf event either.
-	 */
-	if (vcpu->kvm->arch.pmu_filter &&
-	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
-		return;
+		/*
+		 * Neither SW increment nor chained events need to be backed
+		 * by a perf event.
+		 */
+		if (eventsel == ARMV8_PMUV3_PERFCTR_SW_INCR ||
+		    eventsel == ARMV8_PMUV3_PERFCTR_CHAIN)
+			return;
+	}
 
 	memset(&attr, 0, sizeof(struct perf_event_attr));
 	attr.type = arm_pmu->pmu.type;
@@ -877,6 +878,8 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
 
 	/* always support CHAIN */
 	val |= BIT(ARMV8_PMUV3_PERFCTR_CHAIN);
+	/* always support CPU_CYCLES */
+	val |= BIT(ARMV8_PMUV3_PERFCTR_CPU_CYCLES);
 	return val;
 }
 
-- 
2.39.5


