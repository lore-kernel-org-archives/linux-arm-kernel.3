Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FEC606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dKhmn2ED;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hgjsdeKR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jf9o5ALa0aH8v3eseKK4dcnBI+6AQV7EtQWnwTYCkd8=; b=dKhmn2EDFswEvc
	ESoVPJsgAElUdtmxnPEisunb0AeKYde35CJ2Naj2v8ntysMkL6FTTJ/ZfSzg08b+hagY5roxdfQQA
	y5ZolYK/cKotQInQWQtuo3/Si0Z/89mO9H8yLRGd9iepAXhOM5w6C/bPhrYMC7X+nS7Vx0D2y0TII
	gAZs7OvdkQvL1gkzVlvYJJ7EqDd+RKhME3ixuE+tGoqT3qQbOB6OYw0WKwOV5cny0C4ikATUXO8La
	zrVnfkK1xj1st2tgQXhEn7f/LUUBHSkOzOrAIDbJOm3ybpoTwF4vDno2+BRTi/Z/qCelOAso/U6Ch
	GPhswGSj72szihhS7mbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5da-00000007OpM-04XZ;
	Wed, 28 Oct 2026 15:32:26 +0000
Received: from out-201.mta1.migadu.com ([95.215.58.201] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5dO-00000007Ohj-1APn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:32:15 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=l0zERwZtSXMxkg1YrAMkeKkP4CDuD4jEFbJgtN9PQgU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793201532; v=1; x=1793806332;
 b=hgjsdeKRJasxK1Yb/h4RnU78qSDeyngAsRT7t3PDTpZE8ok2J/+bQOguHY0MQ5B0tKjuu+Jt
 Jahis9l1HoDqBtaokq9wb8c5jE3FiOju4Weby/J+dlRazsm4T+m0pSCWkF0qr4Sd3meaw2O+IsT
 gbhngaNIsph/YqsL+wuT/zjw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c1b98ceec568d8e8;
	Wed, 28 Oct 2026 15:32:11 +0000
X-Mizu-Trace-ID: c1b98ceec568d8e8
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
Subject: [PATCH v3 3/3] KVM: arm64: Disable host PMU counters for protected guests
Date: Wed, 28 Oct 2026 15:31:52 +0000
Message-ID: <20261028153152.1740044-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028153152.1740044-1-fuad.tabba@linux.dev>
References: <20261028153152.1740044-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_083214_835647_34142681 
X-CRM114-Status: GOOD (  11.80  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A protected guest has no PMU, and EL2 clears MDCR_EL2.HPME for it.
However, __pkvm_vcpu_load() sets HPMN to cover every event counter, so
HPME has no effect and the counters the host has enabled keep counting
the guest.

Clear PMCR_EL0.E in the world switch while a protected guest runs, which
stops them all. Gate this on system_supports_pmuv3(), as
__activate_traps_common() does for PMUSERENR_EL0.

Side channels are outside pKVM's threat model, so this is hardening
rather than a fix.

Reported-by: Oculytic <oculytic@gmail.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 91e1edf40bcd2..003469e85ed46 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -175,6 +175,26 @@ static void __pmu_switch_to_host(struct kvm_vcpu *vcpu)
 #define __pmu_switch_to_host(v)		do {} while (0)
 #endif
 
+static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
+{
+	u64 pmcr;
+
+	if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
+		return 0;
+
+	pmcr = read_sysreg(pmcr_el0);
+	if (pmcr & ARMV8_PMU_PMCR_E)
+		write_sysreg(pmcr & ~ARMV8_PMU_PMCR_E, pmcr_el0);
+
+	return pmcr;
+}
+
+static void __pmu_restore_host_counters(u64 pmcr)
+{
+	if (pmcr & ARMV8_PMU_PMCR_E)
+		write_sysreg(pmcr, pmcr_el0);
+}
+
 /*
  * Handler for protected VM MSR, MRS or System instruction execution in AArch64.
  *
@@ -283,6 +303,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	struct kvm_s2_mmu *mmu;
 	bool pmu_switch_needed;
 	u64 exit_code;
+	u64 host_pmcr;
 
 	/*
 	 * Having IRQs masked via PMR when entering the guest means the GIC
@@ -300,6 +321,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	guest_ctxt = &vcpu->arch.ctxt;
 
 	pmu_switch_needed = __pmu_switch_to_guest(vcpu);
+	host_pmcr = __pmu_stop_host_counters(vcpu);
 
 	__sysreg_save_state_nvhe(host_ctxt);
 	/*
@@ -384,6 +406,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	if (pmu_switch_needed)
 		__pmu_switch_to_host(vcpu);
 
+	__pmu_restore_host_counters(host_pmcr);
+
 	/* Returning to host will clear PSR.I, remask PMR if needed */
 	if (system_uses_irq_prio_masking())
 		gic_write_pmr(GIC_PRIO_IRQOFF);
-- 
2.47.3


