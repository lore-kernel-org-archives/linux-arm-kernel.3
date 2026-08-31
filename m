Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFF6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRTt5IivXiTcy927Hhc7fvf9t39gqOlHUZrga4i+pjk=; b=ExRff+eM1xqilLbUf0k8mMG4Wo
	pQaeN+PDlTH98+DrHhfhzxyRCEEszRRP+WWK/PFoGVs8KbN8JnBqVhQ026uVwyIX2wmPJOCiZglHz
	9WE43WPcM1T2BlRngzSISOR9w7wNCjRlV4CF1A76434pbonuiXf9hMTQKQiVZuhlLyM001YjS4jsD
	3TLXDGECV1osj3w8afq1axNk9aHT9WyJmAA4bgqrjZIqimRWTUwQQ8z8f5ve2SlTF7VPlRTy9LD8/
	OPYEwLeipeSOj3FuYotT7lpRKxs/kb6yAi/zOsIw4yVeesVCjwZpZ4Iqoal/fEMhJ8u1PcLkwpoLU
	WKqS7QVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y5-0000000A3g0-3HUC;
	Mon, 31 Aug 2026 16:34:45 +0000
Received: from out-190.mta1.migadu.com ([2001:41d0:203:375::be] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14y2-0000000A3cC-0T9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:34:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TP9YFxHVxzGhaAK0s14OTjuoNcODgFEjsneHKuYE33M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194080; v=1; x=1788798880;
 b=V5kx+hW0Dw+k0vYD5Nx0GTmRBXm9eLLVUnXfWG4NezrRnza2kLBV7AFM41pJog/fDM8D9mSm
 83GUZqSVscvrNnTOnVytWC7Nuk81we4Zf3Vaz79ej1O9ZM6Fu31+u2Y0EpEQ86yzpzxwHCxf/vT
 n/wNA7mL2KeQadW/ApUZS9ho=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 88521c3de77b7f74;
	Mon, 31 Aug 2026 16:34:40 +0000
X-Mizu-Trace-ID: 88521c3de77b7f74
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 05/17] KVM: arm64: Skip fixed-feature state flush for protected vCPUs
Date: Mon, 31 Aug 2026 17:34:09 +0100
Message-Id: <20260831163421.272420-6-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_093442_301655_E68CF904 
X-CRM114-Status: GOOD (  15.33  )
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

flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
into the hyp vCPU on every entry, so for a protected vCPU the host's
trap configuration overrides the one pkvm_vcpu_init_traps() computed
at EL2. Move those copies into the non-protected branch, and sync the
debug state back for non-protected vCPUs only: a protected guest's
debug registers are hypervisor-owned, and it takes the host's TWI/TWE
at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
does not stop the world switch from loading host-supplied breakpoints
and MDSCR_EL1.

EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
the value the host's copy carried; a protected guest's PMU accesses
trap regardless.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ca7122b0bccdd..14e847b122abf 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	u8 esr_ec;
 
 	fpsimd_sve_flush();
-	flush_debug_state(hyp_vcpu);
 
 	/*
 	 * If we deal with a non-protected guest and the state is potentially
@@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
 			flush_hyp_vcpu_state(hyp_vcpu);
+
+		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
+		hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
+							 (HCR_TWI | HCR_TWE);
+
+		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
 		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
+		flush_debug_state(hyp_vcpu);
 	} else {
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
 	}
@@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	/* __hyp_running_vcpu must be NULL in a guest context. */
 	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
 
-	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	/*
-	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
-	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
-	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
+	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
+	 * applies to protected guests too.
 	 */
-	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
-	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
-						 (HCR_TWI | HCR_TWE | HCR_VSE);
-
-	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
+	hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
+	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
+	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
 
 	flush_hyp_vgic_state(hyp_vcpu);
 
@@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
-	sync_debug_state(hyp_vcpu);
+	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		sync_debug_state(hyp_vcpu);
 
 	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
@@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
 		/* Propagate WFx trapping flags */
 		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
 		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
+
+		/* HPMN == 0 is reserved without FEAT_HPMN0. */
+		if (system_supports_pmuv3())
+			u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
+					  FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
+					  MDCR_EL2_HPMN);
 	} else {
 		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
 		       sizeof(hyp_vcpu->vcpu.arch.fgt));
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..e85f13233da08 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
 		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
-		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
+		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
 	}
 
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
-- 
2.39.5


