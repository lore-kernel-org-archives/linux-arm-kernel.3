Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CE3C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0NDmXpiHkWB/kge5LVCO9EhwJBa3Fjd+vOyZLReSRA=; b=kTKAMP3hondHfD46U75RoQjJAC
	Gk33EXEXuigtNPXIRgaW1RYslEs55RN6fxIH12KDathavllYr/7RceYSmNuSd1onnu1GCFaOI7u4m
	DupXW/sSCgCEsfAhQBY2m3SwKsPAh1o0aVbgXYQJ8B0PO+MHDo69ZFxVLMavoI3NXLeF5mHIzHLAR
	/ENBuzksTBisk1Rp4+Y55pjMIPlPI1LnHyVO9AyiqeUErIt/eF69ihcHgH17VXol5Uxu+uaelarHg
	+5t4aFOIvDqYIylIkucVtL0B4xqaCBoBsYN68YNgaxHYilHWBtbgQs9sqPIgqyOA6ST/iucWk04hL
	Or39uHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6y-0000000BKng-0idO;
	Wed, 23 Apr 2025 17:42:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bok-0000000Avpm-15cY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:15:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86A8FA4BA30;
	Wed, 23 Apr 2025 15:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DC0C4CEE8;
	Wed, 23 Apr 2025 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421317;
	bh=VfeX1dAcpI36M47Ggd6Q5nFJUQWZ4sAyBeCDM32vqgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2cvUbvVWCv1wNrNI7G1RoMXj8QqGihSgGuNXl7KPeCNipa0hZOI5xfXLdf320sgL
	 5HIToSq5DiiCTnIcyN1+Sfr9D/NQMOp60O9ddaWSRHK+O9CaM/oY0y4qQnrH0rVosC
	 czwZ8b4L36YGhh4yq/2h8BhpNwTewukzQPZb4INZS/cwMIHNmsEhGQXvTLlvAGKybU
	 apBX3gIWN6DVIrBjPf/sRD0mCEG2/k7BrAVf332lmLW1yCyJv6Ddq5hUrnbpBCn+Py
	 uInURVxOet1K40k6stUwreu64jfctIEz0WYYYwrTa3e3rNvC+VkV3tarJDYtfzLiQA
	 5jTkMOaUA72TA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7boh-0082xr-Cc;
	Wed, 23 Apr 2025 16:15:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v3 09/17] KVM: arm64: nv: Handle VNCR_EL2-triggered faults
Date: Wed, 23 Apr 2025 16:15:00 +0100
Message-Id: <20250423151508.2961768-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250423151508.2961768-1-maz@kernel.org>
References: <20250423151508.2961768-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_081518_478438_B472DCB0 
X-CRM114-Status: GOOD (  21.25  )
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

As VNCR_EL2.BADDR contains a VA, it is bound to trigger faults.

These faults can have multiple source:

- We haven't mapped anything on the host: we need to compute the
  resulting translation, populate a TLB, and eventually map
  the corresponding page

- The permissions are out of whack: we need to tell the guest about
  this state of affairs

Note that the kernel doesn't support S1POE for itself yet, so
the particular case of a VNCR page mapped with no permissions
or with write-only permissions is not correctly handled yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/esr.h        |   2 +
 arch/arm64/include/asm/kvm_host.h   |   1 +
 arch/arm64/include/asm/kvm_nested.h |   1 +
 arch/arm64/kvm/handle_exit.c        |   1 +
 arch/arm64/kvm/nested.c             | 159 ++++++++++++++++++++++++++++
 5 files changed, 164 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index e4f77757937e6..fb4e119e1aafa 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -99,6 +99,8 @@
 #define ESR_ELx_AET_CE		(UL(6) << ESR_ELx_AET_SHIFT)
 
 /* Shared ISS field definitions for Data/Instruction aborts */
+#define ESR_ELx_VNCR_SHIFT	(13)
+#define ESR_ELx_VNCR		(UL(1) << ESR_ELx_VNCR_SHIFT)
 #define ESR_ELx_SET_SHIFT	(11)
 #define ESR_ELx_SET_MASK	(UL(3) << ESR_ELx_SET_SHIFT)
 #define ESR_ELx_FnV_SHIFT	(10)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f5ac454dcf66a..8fb1c8d5fd142 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -53,6 +53,7 @@
 #define KVM_REQ_RESYNC_PMU_EL0		KVM_ARCH_REQ(7)
 #define KVM_REQ_NESTED_S2_UNMAP		KVM_ARCH_REQ(8)
 #define KVM_REQ_GUEST_HYP_IRQ_PENDING	KVM_ARCH_REQ(9)
+#define KVM_REQ_MAP_L1_VNCR_EL2		KVM_ARCH_REQ(10)
 
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 98b3d6b589668..be4be8ec49d9e 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -335,5 +335,6 @@ int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 /* VNCR management */
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
+int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu);
 
 #endif /* __ARM64_KVM_NESTED_H */
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index b73dc26bc44b4..9700627dd85f3 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -317,6 +317,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_ERET]	= kvm_handle_eret,
 	[ESR_ELx_EC_IABT_LOW]	= kvm_handle_guest_abort,
 	[ESR_ELx_EC_DABT_LOW]	= kvm_handle_guest_abort,
+	[ESR_ELx_EC_DABT_CUR]	= kvm_handle_vncr_abort,
 	[ESR_ELx_EC_SOFTSTP_LOW]= kvm_handle_guest_debug,
 	[ESR_ELx_EC_WATCHPT_LOW]= kvm_handle_guest_debug,
 	[ESR_ELx_EC_BREAKPT_LOW]= kvm_handle_guest_debug,
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 810aa668e1f3a..c97e4119d81ad 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -882,6 +882,165 @@ int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
+{
+	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
+}
+
+static int kvm_translate_vncr(struct kvm_vcpu *vcpu)
+{
+	bool write_fault, writable;
+	unsigned long mmu_seq;
+	struct vncr_tlb *vt;
+	struct page *page;
+	u64 va, pfn, gfn;
+	int ret;
+
+	vt = vcpu->arch.vncr_tlb;
+
+	vt->wi = (struct s1_walk_info) {
+		.regime	= TR_EL20,
+		.as_el0	= false,
+		.pan	= false,
+	};
+	vt->wr = (struct s1_walk_result){};
+	vt->valid = false;
+	
+	guard(srcu)(&vcpu->kvm->srcu);
+
+	va =  read_vncr_el2(vcpu);
+
+	ret = __kvm_translate_va(vcpu, &vt->wi, &vt->wr, va);
+	if (ret)
+		return ret;
+
+	write_fault = kvm_is_write_fault(vcpu);
+
+	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+	smp_rmb();
+
+	gfn = vt->wr.pa >> PAGE_SHIFT;
+	pfn = kvm_faultin_pfn(vcpu, gfn, write_fault, &writable, &page);
+	if (is_error_noslot_pfn(pfn) || (write_fault && !writable))
+		return -EFAULT;
+
+	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
+		if (mmu_invalidate_retry(vcpu->kvm, mmu_seq))
+			return -EAGAIN;
+
+		vt->gva = va;
+		vt->hpa = pfn << PAGE_SHIFT;
+		vt->valid = true;
+		vt->cpu = -1;
+
+		kvm_make_request(KVM_REQ_MAP_L1_VNCR_EL2, vcpu);
+	}
+
+	kvm_release_faultin_page(vcpu->kvm, page, false, vt->wr.pw);
+	if (vt->wr.pw)
+		mark_page_dirty(vcpu->kvm, gfn);
+
+	return 0;
+}
+
+static void inject_vncr_perm(struct kvm_vcpu *vcpu)
+{
+	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+
+	/* Adjust the fault level to reflect that of the guest's */
+	esr &= ~ESR_ELx_FSC;
+	esr |= FIELD_PREP(ESR_ELx_FSC,
+			  ESR_ELx_FSC_PERM_L(vt->wr.level));
+
+	kvm_inject_nested_sync(vcpu, esr);
+}
+
+static bool kvm_vncr_tlb_lookup(struct kvm_vcpu *vcpu)
+{
+	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+
+	lockdep_assert_held_read(&vcpu->kvm->mmu_lock);
+
+	if (!vt->valid)
+		return false;
+
+	if (read_vncr_el2(vcpu) != vt->gva)
+		return false;
+
+	if (vt->wr.nG) {
+		u64 tcr = vcpu_read_sys_reg(vcpu, TCR_EL2);
+		u64 ttbr = ((tcr & TCR_A1) ?
+			    vcpu_read_sys_reg(vcpu, TTBR1_EL2) :
+			    vcpu_read_sys_reg(vcpu, TTBR0_EL2));
+		u16 asid;
+
+		asid = FIELD_GET(TTBR_ASID_MASK, ttbr);
+		if (!kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, ASIDBITS, 16) ||
+		    !(tcr & TCR_ASID16))
+			asid &= GENMASK(7, 0);
+
+		return asid != vt->wr.asid;
+	}
+
+	return true;
+}
+
+int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
+{
+	struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+
+	BUG_ON(!(esr & ESR_ELx_VNCR_SHIFT));
+
+	if (esr_fsc_is_permission_fault(esr)) {
+		inject_vncr_perm(vcpu);
+	} else if (esr_fsc_is_translation_fault(esr)) {
+		bool valid;
+		int ret;
+
+		scoped_guard(read_lock, &vcpu->kvm->mmu_lock)
+			valid = kvm_vncr_tlb_lookup(vcpu);
+
+		if (!valid)
+			ret = kvm_translate_vncr(vcpu);
+		else
+			ret = -EPERM;
+
+		switch (ret) {
+		case -EAGAIN:
+		case -ENOMEM:
+			/* Let's try again... */
+			break;
+		case -EFAULT:
+		case -EINVAL:
+		case -ENOENT:
+		case -EACCES:
+			/*
+			 * Translation failed, inject the corresponding
+			 * exception back to EL2.
+			 */
+			BUG_ON(!vt->wr.failed);
+
+			esr &= ~ESR_ELx_FSC;
+			esr |= FIELD_PREP(ESR_ELx_FSC, vt->wr.fst);
+
+			kvm_inject_nested_sync(vcpu, esr);
+			break;
+		case -EPERM:
+			/* Hack to deal with POE until we get kernel support */
+			inject_vncr_perm(vcpu);
+			break;
+		case 0:
+			break;
+		}
+	} else {
+		WARN_ONCE(1, "Unhandled VNCR abort, ESR=%llx\n", esr);
+	}
+
+	return 1;
+}
+
 /*
  * Our emulated CPU doesn't support all the possible features. For the
  * sake of simplicity (and probably mental sanity), wipe out a number
-- 
2.39.2


