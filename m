Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aRgngnPZ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c8XimVtV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uyn+E9hPgBq3vgE8nqzAGJ7D8LXdWFW6vaCw5N5eMTY=; b=aRgngnPZ00qcDk
	2J6hsZadbjlTgh8qJkQlin+/bd6UTfC+o6Cod9KEc9d445vktqSpjuzFUIGPUI0iKXlMNbo1ta/5n
	STgNcsHAP3uEYMwS8TJK/Lo8SCsdmInk4DqTDtaRfaD86RqfYjxTZt2fk1Kx+Wv+Gz/UEeN8O1yEh
	ic3nup3KiSmlkiUxylOLC0Z+E0OfZf049TZvzMJV6JQstelNnBCBQN1chhP8B4YqZMwHQWwEgcPcT
	Tt+dGG3zrDFnHU7toi+0T3NWbos0ktp/2n6bCSkacNq6oBwwiqr7t4fXIo7iZ5kB+g/O0jguGd43P
	jE9Td7pOXqqpsOtiXOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHx-0000000406s-2rgb;
	Tue, 27 Oct 2026 08:12:09 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHr-0000000403W-1eOD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:12:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=hqZxpxJ0C4wEalO5Og1g3G+zJaFBGEKypaN+rWrhA5I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793088721; v=1; x=1793693521;
 b=c8XimVtV3h/Ud99ag7hplkIn8hKtih9p62StJv1H74yejjdVXsNpPqL+9hX/jHNyvjwI2Rip
 3bTUCMAr7CZH7pzLVnEN4tno9e3WrbZN5mc6LaTSE18fRNKc7igtjmzQu+Fz+WYiRlP1GbY749I
 CN41XGeaIABI9/PgIEeknwyw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b50314872c48fa54;
	Tue, 27 Oct 2026 08:12:00 +0000
X-Mizu-Trace-ID: b50314872c48fa54
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
Subject: [PATCH 3/3] KVM: arm64: Disable host PMU counters for protected guests
Date: Tue, 27 Oct 2026 08:11:47 +0000
Message-ID: <20261027081147.498183-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027081147.498183-1-fuad.tabba@linux.dev>
References: <20261027081147.498183-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_011203_577213_E4CBD334 
X-CRM114-Status: GOOD (  15.55  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
Gate this on a new per-CPU HAS_PMUV3 flag, since system_supports_pmuv3()
is false when the CPUs implement different PMU versions.

Side channels are outside pKVM's threat model, so this is hardening
rather than a fix.

Reported-by: Oculytic <oculytic@gmail.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/kvm/debug.c            |  4 +++-
 arch/arm64/kvm/hyp/nvhe/switch.c  | 24 ++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1c6632216e327..7ecb55e5018eb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -834,6 +834,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		4
 #define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		5
 #define KVM_HOST_DATA_FLAG_HAS_BRBE			6
+#define KVM_HOST_DATA_FLAG_HAS_PMUV3			7
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index f4d7b12045e8f..3c74b076b5278 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -79,9 +79,11 @@ void kvm_init_host_debug_data(void)
 	unsigned int pmuver = cpuid_feature_extract_unsigned_field(dfr0,
 								   ID_AA64DFR0_EL1_PMUVer_SHIFT);
 
-	if (pmuv3_implemented(pmuver))
+	if (pmuv3_implemented(pmuver)) {
 		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
 							      read_sysreg(pmcr_el0));
+		host_data_set_flag(HAS_PMUV3);
+	}
 
 	*host_data_ptr(debug_brps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, BRPs, dfr0);
 	*host_data_ptr(debug_wrps) = SYS_FIELD_GET(ID_AA64DFR0_EL1, WRPs, dfr0);
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 91e1edf40bcd2..79a6277de4fc1 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,26 @@ static void __pmu_switch_to_host(struct kvm_vcpu *vcpu)
 #define __pmu_switch_to_host(v)		do {} while (0)
 #endif
 
+static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
+{
+	u64 pmcnten;
+
+	if (!vcpu_is_protected(vcpu) || !host_data_test_flag(HAS_PMUV3))
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


