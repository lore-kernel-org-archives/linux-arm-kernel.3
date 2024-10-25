Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24982D149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYhcSWnuETsKJCEEluaZaBpAtwyQ/oGuJY+fGvbLS3M=; b=hoD/EPLps1m6C5qI1LhAfv5zuN
	ZJlwlskaiKukP7iv4tqwn6d3diBACCcnhiV0VMWxOHwZm5poIB4vfRngF2cKROPKKEctCaiM8uozV
	DdN219QIFAQpOYC3FNZ2Jgfm1dmirOqag4hDmZEoXKZT922pRO1Xc558pGP7U4yNGbwFVppgEJTHA
	X4qaoQrqZoOf/v0d1xX6+JHUUlt7uNer5whtF1quNAtR6P0N+Wvb0dKOQgAm6zOfrdSX21Bp+QLJQ
	eHLFzgTG5cjfNVjQWLVdU5cLPn3HxCD0yyuiyON7cn+DxuznNJv+XPfIHQ+gj7zUQ8o6Tew9hANQh
	bPUJcInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4PUD-00000004sOE-1WR0;
	Fri, 25 Oct 2024 18:56:37 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4P0s-00000004nkh-44ng
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:26:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYhcSWnuETsKJCEEluaZaBpAtwyQ/oGuJY+fGvbLS3M=;
	b=sKKAL2kuSWB2ST+WvVrSAu8UQYyNF6eTlL7xxdGWEFYBcw3OV/VgQBOvr8uupq5kztJWX4
	DY4cNvMnRVw2JGcNDqmW+4aSYGXCGvw/FzxnBF/P/TyfjCgazgfT2llXkDp3QG1Ws4T6Bc
	fQVLKswN7mMxlyPPKA4vnfbXTZiJGmw=
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
Subject: [PATCH v4 18/18] KVM: arm64: nv: Reprogram PMU events affected by nested transition
Date: Fri, 25 Oct 2024 18:25:59 +0000
Message-ID: <20241025182559.3364829-1-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112619_236422_AF67F797 
X-CRM114-Status: GOOD (  12.31  )
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

Start reprogramming PMU events at nested boundaries now that everything
is in place to handle the EL2 event filter. Only repaint events where
the filter differs between EL1 and EL2 as a slight optimization.

PMU now 'works' for nested VMs, albeit slow.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/emulate-nested.c |  4 ++++
 arch/arm64/kvm/pmu-emul.c       | 29 +++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h           |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 162bddbfbe79..13f0be0911e8 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2450,6 +2450,8 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
+
+	kvm_pmu_nested_transition(vcpu);
 }
 
 static void kvm_inject_el2_exception(struct kvm_vcpu *vcpu, u64 esr_el2,
@@ -2532,6 +2534,8 @@ static int kvm_inject_nested(struct kvm_vcpu *vcpu, u64 esr_el2,
 	kvm_arch_vcpu_load(vcpu, smp_processor_id());
 	preempt_enable();
 
+	kvm_pmu_nested_transition(vcpu);
+
 	return 1;
 }
 
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e2eb2ba903b6..8ad62284fa23 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1215,3 +1215,32 @@ u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 
 	return u64_replace_bits(pmcr, vcpu->kvm->arch.pmcr_n, ARMV8_PMU_PMCR_N);
 }
+
+void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
+{
+	bool reprogrammed = false;
+	unsigned long mask;
+	int i;
+
+	if (!kvm_vcpu_has_pmu(vcpu))
+		return;
+
+	mask = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	for_each_set_bit(i, &mask, 32) {
+		struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, i);
+
+		/*
+		 * We only need to reconfigure events where the filter is
+		 * different at EL1 vs. EL2, as we're multiplexing the true EL1
+		 * event filter bit for nested.
+		 */
+		if (kvm_pmc_counts_at_el1(pmc) == kvm_pmc_counts_at_el2(pmc))
+			continue;
+
+		kvm_pmu_create_perf_event(pmc);
+		reprogrammed = true;
+	}
+
+	if (reprogrammed)
+		kvm_vcpu_pmu_restore_guest(vcpu);
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index b738ffb39bb0..3493e9d9f58e 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -98,6 +98,7 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm);
 
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu);
 bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int idx);
+void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu);
 #else
 struct kvm_pmu {
 };
@@ -198,6 +199,8 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu)
 	return false;
 }
 
+static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
+
 #endif
 
 #endif
-- 
2.47.0.163.g1226f6d8fa-goog


