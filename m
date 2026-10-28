Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nHwohfVh;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nzrgAFB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I57WmYqdoF9/N0mkvjFnMDYVaQwsVE67uocH/WyHf5o=; b=nHwohfVhG3bYjz
	YFyv0tZeZd9kUqwKrH+d+72q5iOuI6EGxOHxX0j9s0L/94eijgUaZOAN+MHhwojTyJluDrJ+67oJU
	lJB49x6DgQXc/VwgkcsITtMcwI7xYYKllyNGo/CNlxLJgzL1dpz8B4swN97QwB/MKyxkJlSgwdKTh
	Xz1tO0j+ksOU4Q81eu/OLe6M1KKGhLpHgZgetywuVPAgIgavi0WGWdIhtX6eV6+GqnCUn3ixs4lhZ
	nDYjUIG+s3bF4n4CuSPJzlTlZ4sUKc77MDM5lkqfb/ES7THnzCIi4Izk3jM46koeI2AJw046PEIKI
	V/mlYAGyu/Th0IAGAMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Vo-00000006pUN-0Rg2;
	Wed, 28 Oct 2026 11:08:08 +0000
Received: from out-16.mta1.migadu.com ([95.215.58.16] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Vg-00000006pPV-03fu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 11:08:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WkQDgAer1PteLDsIHCBdKyWZtLPPEdiBNxjMb3MjjdE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793185678; v=1; x=1793790478;
 b=nzrgAFB1EzDbWVSgkRYBmdoluq84+swjbuvmY7eTxvFF39WGdlhu4ZjhfNPXtUiM1EfCwzue
 CiEl4vuFLL8feB+SSAu4JW4A1Am2HseHKZTryAbYCHYYE+8A/7hGKDgl+FZc70XgMEBTBG8+5Iq
 2rDVjiFRwi0+rvnR6tIVO9OM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 57efae3c060c30d1;
	Wed, 28 Oct 2026 11:07:58 +0000
X-Mizu-Trace-ID: 57efae3c060c30d1
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Disable host PMU counters for protected guests
Date: Wed, 28 Oct 2026 11:07:39 +0000
Message-ID: <20261028110739.2366566-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028110739.2366566-1-fuad.tabba@linux.dev>
References: <20261028110739.2366566-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_040800_392041_C8092CF2 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A protected guest has no PMU, and EL2 clears MDCR_EL2.HPME for it.
However, HPME has no effect, since __pkvm_vcpu_load() sets HPMN to cover
every event counter, and HPME never covers the cycle or instruction
counter. The counters the host has enabled therefore keep counting the
guest.

Stop them in the world switch while a protected guest runs, reading
PMCNTENSET_EL0 rather than trusting the host-controlled events mask.
Gate this on system_supports_pmuv3(), as __activate_traps_common() does
for PMUSERENR_EL0.

Side channels are outside pKVM's threat model, so this is hardening
rather than a fix.

Reported-by: Oculytic <oculytic@gmail.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 91e1edf40bcd2..f602154ab49b5 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,26 @@ static void __pmu_switch_to_host(struct kvm_vcpu *vcpu)
 #define __pmu_switch_to_host(v)		do {} while (0)
 #endif
 
+static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
+{
+	u64 pmcnten;
+
+	if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
+		return 0;
+
+	pmcnten = read_sysreg(pmcntenset_el0);
+	if (pmcnten)
+		write_sysreg(pmcnten, pmcntenclr_el0);
+
+	return pmcnten;
+}
+
+static void __pmu_restore_host_counters(u64 pmcnten)
+{
+	if (pmcnten)
+		write_sysreg(pmcnten, pmcntenset_el0);
+}
+
 /*
  * Handler for protected VM MSR, MRS or System instruction execution in AArch64.
  *
@@ -282,6 +302,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *guest_ctxt;
 	struct kvm_s2_mmu *mmu;
 	bool pmu_switch_needed;
+	u64 host_pmcnten;
 	u64 exit_code;
 
 	/*
@@ -300,6 +321,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	guest_ctxt = &vcpu->arch.ctxt;
 
 	pmu_switch_needed = __pmu_switch_to_guest(vcpu);
+	host_pmcnten = __pmu_stop_host_counters(vcpu);
 
 	__sysreg_save_state_nvhe(host_ctxt);
 	/*
@@ -384,6 +406,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	if (pmu_switch_needed)
 		__pmu_switch_to_host(vcpu);
 
+	__pmu_restore_host_counters(host_pmcnten);
+
 	/* Returning to host will clear PSR.I, remask PMR if needed */
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(GIC_PRIO_IRQOFF);
-- 
2.47.3


