Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B05E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+l3onU/mO2ODPldIxoGJvtMOSlzVSdB4hyEB93QT96c=; b=VHPBBuATpgGPLvz/O4lYzNtu8q
	8cODJOBDUryM2puYXLNkECGQ54LFLrDhtfhocQh2NYpHpW3mWsT2xYife3cKzBjGAC4lLhVhuXZwc
	2BB+3ca/Trb0CcLtPq2njyqbgQS86cmYJ2oReOdrVsvBjFpIERDcEaA3w6oKU/19aMg2nXU57NTxc
	mccbqKuC86bMgcd9P5RdPwRQbdnsfXUvQQyOzGdlWOrXRmT+6YdVJSt+QNk+It8/mYDo7LR5IdOoL
	KaN5qERmvwtx3J6hMR9+2qhnHzMLkwlj6H9G5FEnRdAPr4iG4t1gYhCCcGiOxnyi7cVBNxdlX4rTX
	s6eACOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIr0-0000000GRDJ-1Fw3;
	Fri, 10 Jan 2025 17:31:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWImB-0000000GQ2E-3eZg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:26:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2E031477;
	Fri, 10 Jan 2025 09:26:52 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 436643F66E;
	Fri, 10 Jan 2025 09:26:22 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	james.morse@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v1] arm64: Add TLB Conflict Abort Exception handler to KVM
Date: Fri, 10 Jan 2025 17:24:07 +0000
Message-ID: <20250110172411.39845-3-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_092627_998956_A3355E7A 
X-CRM114-Status: GOOD (  18.75  )
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

Currently, KVM does not handle the case of a stage 2 TLB conflict abort
exception. This can legitimately occurs when the guest is eliding full
BBM semantics as permitted by BBM level 2. In this case it is possible
for a confclit abort to be delivered to EL2. We handle that by
invalidating the full TLB.

The Arm ARM specifies that the worst-case invalidation is either a
`tlbi vmalls12e1` or a `tlbi alle1` (as per DDI0487K section D8.16.3).
We implement `tlbi alle1` by extending the existing
__kvm_flush_vm_context() helper to allow for differentiating between
inner-shareable and cpu-local invalidations.

This commit applies on top of v6.13-rc2 (fac04efc5c79).

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 arch/arm64/include/asm/esr.h       |  8 ++++++++
 arch/arm64/include/asm/kvm_asm.h   |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c      |  9 +++++++--
 arch/arm64/kvm/hyp/vhe/tlb.c       |  9 +++++++--
 arch/arm64/kvm/mmu.c               | 13 +++++++++++++
 arch/arm64/kvm/vmid.c              |  2 +-
 7 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index d1b1a33f9a8b..8a66f81ca291 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -121,6 +121,7 @@
 #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
 #define ESR_ELx_FSC_SECC	(0x18)
 #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
+#define ESR_ELx_FSC_TLBABT	(0x30)
 
 /* Status codes for individual page table levels */
 #define ESR_ELx_FSC_ACCESS_L(n)	(ESR_ELx_FSC_ACCESS + (n))
@@ -464,6 +465,13 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
 	       (esr == ESR_ELx_FSC_ACCESS_L(0));
 }
 
+static inline bool esr_fsc_is_tlb_conflict_abort(unsigned long esr)
+{
+	esr = esr & ESR_ELx_FSC;
+
+	return esr == ESR_ELx_FSC_TLBABT;
+}
+
 /* Indicate whether ESR.EC==0x1A is for an ERETAx instruction */
 static inline bool esr_iss_is_eretax(unsigned long esr)
 {
diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ca2590344313..095872af764a 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -222,7 +222,7 @@ DECLARE_KVM_NVHE_SYM(__per_cpu_end);
 DECLARE_KVM_HYP_SYM(__bp_harden_hyp_vecs);
 #define __bp_harden_hyp_vecs	CHOOSE_HYP_SYM(__bp_harden_hyp_vecs)
 
-extern void __kvm_flush_vm_context(void);
+extern void __kvm_flush_vm_context(bool cpu_local);
 extern void __kvm_flush_cpu_context(struct kvm_s2_mmu *mmu);
 extern void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu, phys_addr_t ipa,
 				     int level);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 6aa0b13d86e5..f44a7550f4a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -195,7 +195,7 @@ static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 
 static void handle___kvm_flush_vm_context(struct kvm_cpu_context *host_ctxt)
 {
-	__kvm_flush_vm_context();
+	__kvm_flush_vm_context(false);
 }
 
 static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
index 48da9ca9763f..97f749ad63cc 100644
--- a/arch/arm64/kvm/hyp/nvhe/tlb.c
+++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
@@ -261,10 +261,15 @@ void __kvm_flush_cpu_context(struct kvm_s2_mmu *mmu)
 	exit_vmid_context(&cxt);
 }
 
-void __kvm_flush_vm_context(void)
+void __kvm_flush_vm_context(bool cpu_local)
 {
 	/* Same remark as in enter_vmid_context() */
 	dsb(ish);
-	__tlbi(alle1is);
+
+	if (cpu_local)
+		__tlbi(alle1);
+	else
+		__tlbi(alle1is);
+
 	dsb(ish);
 }
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index 3d50a1bd2bdb..564602fa4d62 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -213,10 +213,15 @@ void __kvm_flush_cpu_context(struct kvm_s2_mmu *mmu)
 	exit_vmid_context(&cxt);
 }
 
-void __kvm_flush_vm_context(void)
+void __kvm_flush_vm_context(bool cpu_local)
 {
 	dsb(ishst);
-	__tlbi(alle1is);
+
+	if (cpu_local)
+		__tlbi(alle1);
+	else
+		__tlbi(alle1is);
+
 	dsb(ish);
 }
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..7c0d97449d23 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1756,6 +1756,19 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	ipa = fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
 
+	if (esr_fsc_is_tlb_conflict_abort(esr)) {
+
+		/* Architecturely, at this stage 2 tlb conflict abort, we must
+		 * either perform a `tlbi vmalls12e1`, or a `tlbi alle1`. Due
+		 * to nesting of VMs, we would have to iterate all flattened
+		 * VMIDs to clean out a single guest, so we perform a `tlbi alle1`
+		 * instead to save time.
+		 */
+		__kvm_flush_vm_context(true);
+
+		return 1;
+	}
+
 	if (esr_fsc_is_translation_fault(esr)) {
 		/* Beyond sanitised PARange (which is the IPA limit) */
 		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
diff --git a/arch/arm64/kvm/vmid.c b/arch/arm64/kvm/vmid.c
index 806223b7022a..d558428fcfed 100644
--- a/arch/arm64/kvm/vmid.c
+++ b/arch/arm64/kvm/vmid.c
@@ -66,7 +66,7 @@ static void flush_context(void)
 	 * the next context-switch, we broadcast TLB flush + I-cache
 	 * invalidation over the inner shareable domain on rollover.
 	 */
-	kvm_call_hyp(__kvm_flush_vm_context);
+	kvm_call_hyp(__kvm_flush_vm_context, false);
 }
 
 static bool check_update_reserved_vmid(u64 vmid, u64 newvmid)
-- 
2.45.2


