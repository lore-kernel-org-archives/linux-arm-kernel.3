Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF29D374A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxxwI/svTm3bf+IRdgAN+AxzDh91S0yknWwgSxrIk4U=; b=JBA16EShixd5EBCxHa62iyvF+c
	64czkRUIV5jGtuLMF9XtQyt54gmAPFOcWPDzLPParGSRo+prjPpUV5tYxgjHNkZHEzZO1tT/PlDM1
	tD7aRppd5c2lnsxZPuvFltKsJtC43XcIbY7EIqYqXsQMM5cGT33wB41r4Y3SHV+z8t7fK0RRQOAYB
	D2FgynpnwbZ6m+FesTlX10Lw53Sh8n+pxey8dFKKVWWsJNs5ot+s1JN+1aQCSFC7W5QpDX79nfAi0
	yKkc//EWu2zi3wLJQCHUt79ZrKHen1YPVWP4xC/eLlWwuWlayThRQqSV99GM5YiKsfjN7FgPGo6sw
	oiEH9ofw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqF-0000000A55f-2vAe;
	Fri, 05 Dec 2025 21:59:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqD-0000000A53p-2aPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:59:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3F31A9A;
	Fri,  5 Dec 2025 13:59:45 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C07FA3F740;
	Fri,  5 Dec 2025 13:59:48 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 06/38] KVM: arm64: Force guest EL1 to use user-space's partid configuration
Date: Fri,  5 Dec 2025 21:58:29 +0000
Message-Id: <20251205215901.17772-7-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_135953_939386_99D03179 
X-CRM114-Status: GOOD (  19.65  )
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

While we trap the guest's attempts to read/write the MPAM control
registers, the hardware continues to use them. Guest-EL0 uses KVM's
user-space's configuration, as the value is left in the register, and
guest-EL1 uses either the host kernel's configuration, or in the case of
VHE, the UNKNOWN reset value of MPAM1_EL1.

On nVHE systems, EL2 continues to use partid-0 for world-switch, even
when the host may have configured its kernel threads to use a different
partid. 0 may have been assigned to another task.

We want to force the guest-EL1 to use KVM's user-space's MPAM
configuration, and EL2s to match the host's EL1 config.

On a nVHE system, copy the EL1 MPAM register to EL2. This ensures
world-switch uses the same partid as the kernel thread does on the host.

When loading the guest's EL1 registers, copy the VMM's EL0 partid to
the EL1 register.

For VHE systems, we can skip restoring the EL1 register for the host,
as it is out-of-context once HCR_EL2.TGE is set.

This is done outside the usual sysreg save/restore as the values can
change behind KVMs back, so should not be stored in the guest context.

Signed-off-by: James Morse <james.morse@arm.com>
---
 arch/arm64/include/asm/kvm_host.h          |  1 +
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 16 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c           | 12 ++++++++++++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c         |  1 +
 4 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index b763293281c8..baba23b7ce97 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -447,6 +447,7 @@ enum vcpu_sysreg {
 	MDCCINT_EL1,	/* Monitor Debug Comms Channel Interrupt Enable Reg */
 	OSLSR_EL1,	/* OS Lock Status Register */
 	DISR_EL1,	/* Deferred Interrupt Status Register */
+	MPAM1_EL1,	/* Memory Partitioning And Monitoring register */
 
 	/* Performance Monitors Registers */
 	PMCR_EL0,	/* Control Register */
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index a17cbe7582de..d8ab0ced0403 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -166,6 +166,9 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
 		ctxt_sys_reg(ctxt, TFSRE0_EL1) = read_sysreg_s(SYS_TFSRE0_EL1);
 	}
 
+	if (system_supports_mpam())
+		ctxt_sys_reg(ctxt, MPAM1_EL1) = read_sysreg_el1(SYS_MPAM1);
+
 	ctxt_sys_reg(ctxt, SP_EL1)	= read_sysreg(sp_el1);
 	ctxt_sys_reg(ctxt, ELR_EL1)	= read_sysreg_el1(SYS_ELR);
 	ctxt_sys_reg(ctxt, SPSR_EL1)	= read_sysreg_el1(SYS_SPSR);
@@ -261,6 +264,9 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
 		write_sysreg_s(ctxt_sys_reg(ctxt, TFSRE0_EL1), SYS_TFSRE0_EL1);
 	}
 
+	if (system_supports_mpam())
+		write_sysreg_el1(ctxt_sys_reg(ctxt, MPAM1_EL1), SYS_MPAM1);
+
 	if (!has_vhe() &&
 	    cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT) &&
 	    ctxt->__hyp_running_vcpu) {
@@ -374,4 +380,14 @@ static inline void __sysreg32_restore_state(struct kvm_vcpu *vcpu)
 		write_sysreg(__vcpu_sys_reg(vcpu, DBGVCR32_EL2), dbgvcr32_el2);
 }
 
+/*
+ * The _EL0 value was written by the host's context switch and belongs to the
+ * VMM. Copy this into the guest's _EL1 register.
+ */
+static inline void __mpam_guest_load(void)
+{
+	if (system_supports_mpam())
+		write_sysreg_el1(read_sysreg_s(SYS_MPAM0_EL1), SYS_MPAM1);
+}
+
 #endif /* __ARM64_KVM_HYP_SYSREG_SR_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index d3b9ec8a7c28..b785977aa61e 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -238,6 +238,15 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return __fixup_guest_exit(vcpu, exit_code, handlers);
 }
 
+/* Use the host thread's partid and pmg for world switch */
+static void __mpam_copy_el1_to_el2(void)
+{
+	if (system_supports_mpam()) {
+		write_sysreg_s(read_sysreg_s(SYS_MPAM1_EL1), SYS_MPAM2_EL2);
+		isb();
+	}
+}
+
 /* Switch to the guest for legacy non-VHE systems */
 int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 {
@@ -247,6 +256,8 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	bool pmu_switch_needed;
 	u64 exit_code;
 
+	__mpam_copy_el1_to_el2();
+
 	/*
 	 * Having IRQs masked via PMR when entering the guest means the GIC
 	 * will not signal the CPU of interrupts of lower priority, and the
@@ -306,6 +317,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__timer_enable_traps(vcpu);
 
 	__debug_switch_to_guest(vcpu);
+	__mpam_guest_load();
 
 	do {
 		/* Jump in the fire! */
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index f28c6cf4fe1b..2a84edc90465 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -222,6 +222,7 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	 */
 	__sysreg32_restore_state(vcpu);
 	__sysreg_restore_user_state(guest_ctxt);
+	__mpam_guest_load();
 
 	if (unlikely(is_hyp_ctxt(vcpu))) {
 		__sysreg_restore_vel2_state(vcpu);
-- 
2.39.5


