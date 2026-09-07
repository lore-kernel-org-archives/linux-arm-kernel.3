Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC7C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0lAdsrlTKvbaBrfHm4VKauBzJah/IhSY9wIoLUTUS8=; b=vb6whXYDMmlUMqovb0dlLCPw8c
	AkI1hrmdGlwKJLQUXB4YHKFv+gerJ663S0L6tdnjFgGaW7Zn9n2c0Ytxv6fCJaKMSKbfSUhAZ6l7h
	Y6fXAHwND1xdm2dy+1szdKGapNBDegFRTN3azfjQFKIWJnnwuvypyqNGD5REPtSz11PYCVIZZkFI2
	h6hHUFoH0FWCW9hkWmwzJy0kGq7LNkdAO0ikupzBYfL6Q2sNUZN3n6pfrCL84r2qjgfnFbGK+eXgs
	cGPHrlBrVIRxxB4y1zAFZDpRBivpZG3vgqctAm+yVyDi43u4IcwourSCXbsdY37e7QzoX24VAillq
	oSS+CinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TLF-000000065n7-2ygg;
	Mon, 07 Sep 2026 07:00:33 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TL9-000000065iP-2BhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:00:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ez2hBEN3F6dEtPYfwBy5quomVuaW4gPNa2zsxJxzR9Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764425; v=1; x=1789369225;
 b=idylcUeDiqNUkNIrI8JZhNyGCvMmW8T8Pb1K0Y5f66C4NUSjrUOc3BqOKkXZhS0KAbM8GBMv
 X32f3n6H+F0ygxeJNdty2E8JXMLoedbVxJj4w7+NUsFEI9gEuZwoOhcMw0Xyi2yCHcgGzQPJhI1
 akN+sdQPTZNp/Clav2R1vrq0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id cf15d840968f9c83;
	Mon, 07 Sep 2026 07:00:25 +0000
X-Mizu-Trace-ID: cf15d840968f9c83
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
Subject: [PATCH v2 04/17] KVM: arm64: Skip fixed-feature state flush for protected vCPUs
Date: Mon,  7 Sep 2026 07:59:49 +0100
Message-Id: <20260907070002.3333525-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000029_735230_14200521 
X-CRM114-Status: GOOD (  15.27  )
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
at EL2. Move the mdcr_el2 and TWI/TWE copies into the non-protected
branch, and return early from flush_debug_state() and
sync_debug_state() for a protected vCPU: its debug registers are
hypervisor-owned, and it takes the host's TWI/TWE at vCPU load.
MDCR_EL2.TDA traps only the guest's own accesses; it doesn't stop the
world switch from loading host-supplied breakpoints and MDSCR_EL1.

EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
the value the host's copy carried; a protected guest's PMU accesses
trap regardless.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 32 +++++++++++++++++++++---------
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ca7122b0bccdd..aeff6ded40fd6 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -200,6 +200,9 @@ static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
 	hyp_vcpu->vcpu.arch.debug_owner = host_vcpu->arch.debug_owner;
 
 	if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu)) {
@@ -218,6 +221,9 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
 
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		return;
+
 	if (kvm_guest_owns_debug_regs(&hyp_vcpu->vcpu))
 		host_vcpu->arch.vcpu_debug_state = hyp_vcpu->vcpu.arch.vcpu_debug_state;
 	else if (kvm_host_owns_debug_regs(&hyp_vcpu->vcpu))
@@ -241,6 +247,12 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
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
 	} else {
 		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
@@ -249,17 +261,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
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
 
@@ -329,6 +337,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
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


