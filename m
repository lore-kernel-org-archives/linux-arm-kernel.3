Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64718D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7f8WlbTuKg/9ktNP6L6Uj0B1bwQ9caDZTgl7idjk1c=; b=Huabh/Q3qYvf3zOZqv9fkYQbRC
	XWmoUI8kc4Xyl3L+ehicSE4MvW+hgt7ikMsRyOghkPEwd9KksORnktcFbZpaqAbum8bczG2ZHvYZ4
	oOlfV8fBKTEGqr0y4iDZxpRvrkE/QrJUphbfRSYA1a9O4BoQbHlvRH5SrRa+qAgLKPSbzHeeR5oc8
	FkIpm/qhsQEO079DVJbD3qsxcdbPYdFhGULjWMnRIzQq7IhfEIcGccNNC8c4aU/xS9XrQfuYMQGXj
	bO/prRLMnWS0JBDovtPta+6II911mw7ZEQMPs2/MB85yFLUrT3+OZIFQXcjWSmKSWA/zWbmAO4yIR
	NhTHX9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PR9-00000004s7I-1EnT;
	Fri, 25 Oct 2024 18:53:27 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OzP-00000004myp-4BVD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7f8WlbTuKg/9ktNP6L6Uj0B1bwQ9caDZTgl7idjk1c=;
	b=tzsa6SIpMG2GGdxlZz43xIRwLBzOu3M1d3lUZt7g+JKNgpiibDr3Zh11gbQ2IVr/R+jZcw
	BmNMehCrxb69CuK+1R3Mko9Lg0pBjDBUk/9/BfquiDSI1oA/Tt8wlh2fuQVa5Wcu+WEWUS
	LwSl11kGz29JVI1HwUt5VXIwfSUcJgc=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 17/18] KVM: arm64: nv: Apply EL2 event filtering when in hyp context
Date: Fri, 25 Oct 2024 18:23:52 +0000
Message-ID: <20241025182354.3364124-18-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112448_213319_BB8BE10C 
X-CRM114-Status: GOOD (  13.52  )
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

It hopefully comes as no surprise when I say that vEL2 actually runs at
EL1. So, the guest hypervisor's EL2 event filter (NSH) needs to actually
be applied to EL1 in the perf event. In addition to this, the disable
bit for the guest counter range (HPMD) needs to have the effect of
stopping the affected counters.

Do exactly that by stuffing ::exclude_kernel with the combined effect of
these controls. This isn't quite enough yet, as the backing perf events
need to be reprogrammed upon nested ERET/exception entry to remap the
effective filter onto ::exclude_kernel.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1e9cdbc235a8..e2eb2ba903b6 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -653,6 +653,17 @@ static bool kvm_pmc_counts_at_el1(struct kvm_pmc *pmc)
 	return p == nsk;
 }
 
+static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+	u64 mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
+
+	if (!kvm_pmu_counter_is_hyp(vcpu, pmc->idx) && (mdcr & MDCR_EL2_HPMD))
+		return false;
+
+	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
+}
+
 /**
  * kvm_pmu_create_perf_event - create a perf event for a counter
  * @pmc: Counter context
@@ -695,11 +706,19 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	attr.pinned = 1;
 	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
 	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
-	attr.exclude_kernel = !kvm_pmc_counts_at_el1(pmc);
 	attr.exclude_hv = 1; /* Don't count EL2 events */
 	attr.exclude_host = 1; /* Don't count host events */
 	attr.config = eventsel;
 
+	/*
+	 * Filter events at EL1 (i.e. vEL2) when in a hyp context based on the
+	 * guest's EL2 filter.
+	 */
+	if (unlikely(is_hyp_ctxt(vcpu)))
+		attr.exclude_kernel = !kvm_pmc_counts_at_el2(pmc);
+	else
+		attr.exclude_kernel = !kvm_pmc_counts_at_el1(pmc);
+
 	/*
 	 * If counting with a 64bit counter, advertise it to the perf
 	 * code, carefully dealing with the initial sample period
-- 
2.47.0.163.g1226f6d8fa-goog


