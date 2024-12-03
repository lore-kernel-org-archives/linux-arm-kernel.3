Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B142E74AC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2WPpz2Qk6slKm6K4L/hEF3t3hcDY4cKIF/iBTjqOWQ=; b=qUn81l3F/tW+JXjl2VJ6kL1obu
	ok8GgdetuTf3kI/ufo58zr6993f3++5tLuhWJ04+RvoLxpFA2SHoHayuMIiHxUw/79HvBLjL+eLCt
	z36619hA0ZBagn7g6tyW0yO0zZcM7uGAi4YyU4DcNkfWqCxHkRGQ7ohARI7PCB7qduIzbQYLELevf
	X5SkmC/WYXSxuYzmkx6mVIHNNTJ2RG5yFGUD9WbUmKNSKubFxvldX64awO+9G0onEUNh3xRJo/mqp
	J8y1sC9bN2jXv3RqYmDf10L8zqffYHhQ8/ITx3svluqqO5D8wbM/tqsIoCjklIWlWrmTP3Zx6Ij3Y
	qyoWueQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYkc-0000000AVNs-3KjK;
	Tue, 03 Dec 2024 19:40:02 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIYdz-0000000AU1E-3LdW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 19:33:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733254389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2WPpz2Qk6slKm6K4L/hEF3t3hcDY4cKIF/iBTjqOWQ=;
	b=TQW/xvxDkAst3EoN0BB+tNWtuzOBv8CuD8/HpYmenhK7aBN9e/64QzSF4nLIc59Y99E79S
	kHZAAxb1BftagUhFLL8qJL+w1dhuyyYG9sk3fzZqEkoQvF0LhF09K5Rcfuw4rUAaG5ZJY1
	ttCVmu+rjebQpeeqDtJFoRU3kDMWQds=
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
Subject: [RFC PATCH 06/14] KVM: arm64: Use PERF_COUNT_HW_CPU_CYCLES for fixed cycle counter
Date: Tue,  3 Dec 2024 11:32:12 -0800
Message-Id: <20241203193220.1070811-7-oliver.upton@linux.dev>
In-Reply-To: <20241203193220.1070811-1-oliver.upton@linux.dev>
References: <20241203193220.1070811-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_113311_978088_14D30922 
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

KVM will soon be able to emulate PMUv3 on non-PMUv3 hardware. Use the
generic event for CPU cycles to allow a non-PMUv3 driver to map the
event correctly on underlying hardware.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 3e7091e1a2e4..0b2ad60717e8 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -700,16 +700,27 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
 	struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
+	struct perf_event_attr attr = {};
 	struct perf_event *event;
-	struct perf_event_attr attr;
 	u64 eventsel, evtreg;
 
 	evtreg = kvm_pmc_read_evtreg(pmc);
 
 	kvm_pmu_stop_counter(pmc);
 	if (pmc->idx == ARMV8_PMU_CYCLE_IDX) {
-		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+		/*
+		 * Use the common event space for the cycle counter, allowing
+		 * the underlying PMU driver to map it onto hardware in the
+		 * unlikely case the host doesn't actually have PMUv3.
+		 */
+		attr.type = PERF_TYPE_HARDWARE;
+		eventsel = PERF_COUNT_HW_CPU_CYCLES;
 	} else {
+		/*
+		 * Otherwise, treat the event as a raw event for the selected
+		 * PMU.
+		 */
+		attr.type = arm_pmu->pmu.type;
 		eventsel = evtreg & kvm_pmu_event_mask(vcpu->kvm);
 
 		/*
@@ -729,8 +740,6 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 			return;
 	}
 
-	memset(&attr, 0, sizeof(struct perf_event_attr));
-	attr.type = arm_pmu->pmu.type;
 	attr.size = sizeof(attr);
 	attr.pinned = 1;
 	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
-- 
2.39.5


