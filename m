Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12010C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCkgk3YpjCWag7+0j6nlwvQVtlkQVbZpvqPhohbvccE=; b=Dh62AI9KMdCLJwgw8Mg+YXO9oY
	MfN0y5BJ5sXbPQdhXsvNKozyy0wdKy+O+Y5mzcspt1tqM2LLTGX3EXIJwo801kgGhlsEVeDoKpNys
	Jz7VOVhxBp/XwkyCLKzrCMX9g03UFYjhDhinj7iMfV/cUD5yumBcSZVo52L1lt6pDOR1vuCmnJAsC
	DfRpew7fOdlkM3O4daL5P5jun9mPJOBPJ7jeA2PjevVcaCNwGch9CeviFaxsBClHc13+NWPEu8a/y
	dNOGpDufutOpFikoW/u1+PGQL5nP0tzOzFWqb6sBsObsKEvwiZv+53yr2NJY4B6iDUzsSI8evsaC7
	z7FvTdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98u-0000000EfDR-31vN;
	Sat, 01 Aug 2026 12:48:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq98t-0000000EfAe-0OzD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8927860A97;
	Sat,  1 Aug 2026 12:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD1D1F00ADF;
	Sat,  1 Aug 2026 12:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588522;
	bh=wCkgk3YpjCWag7+0j6nlwvQVtlkQVbZpvqPhohbvccE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J0UvMm9rGACpiGKn3jULGHX3h8RsNva0w0Ew/HkLe19r9cpcS9T42LZtIBIYG08+r
	 uUhiv22GeLG625WPj9vmt/iconXdaqGwPCvbD4XXJaa1CW3FNTVLmsyz5bG7pNJOF0
	 /oxeQfGCaWduZLq8mqK1LY/un6npNqlhyGiDeZHZC2xXnqM1HVBbBLuibhISBvaFQ6
	 rSi9PL+DFZ6nauY7k3Y2dlvkajWLhkb/QZcwagNLFRPShwEB/9EMppJ1xR0ORKsMNT
	 M/Yh23C7GmmHlSm3XFrriDU5e324Oh6sr2bvxSeIWX425zsaRZy7P54K1cqgc0l/3e
	 CFUKiyyHz743Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wq98q-0000000BGK2-2FhG;
	Sat, 01 Aug 2026 12:48:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH 6/6] KVM: arm64: Add VNCR TLB tracking again
Date: Sat,  1 Aug 2026 13:48:18 +0100
Message-ID: <20260801124818.366274-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260801124818.366274-1-maz@kernel.org>
References: <20260801124818.366274-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, imv4bel@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Having established that our VNCR TLB tracking was flawed and dropped
it from KVM, it is time to replace it with something that works.

The goal of that tracking is to hit the TLBI slow path if there
are any VNCR TLBs in the guest, irrespective of their mapping state.

For this purpose, we introduce an VM wide counter (vncr_tlb_count)
that tracks how many valid VNCR TLB are present. This means that
creating such TLB must increment the counter, and invalidation
decrement it, and both these operations must be done with the MMU
lock held for write.

On TLBI handling affecting EL2 S1, a non-zero counter forces the
handling to take the slow path to consider the VNCR TLBs.

Not exactly rocket science. Hopefully I got it right this time.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  3 +++
 arch/arm64/kvm/hyp/vhe/switch.c   |  5 +++--
 arch/arm64/kvm/nested.c           | 25 +++++++++++++++++++------
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac16f96c878d6..108966a9db12b 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -411,6 +411,9 @@ struct kvm_arch {
 	/* Masks for VNCR-backed and general EL2 sysregs */
 	struct kvm_sysreg_masks	*sysreg_masks;
 
+	/* Count the number of VNCR_EL2 TLBs */
+	atomic_t vncr_tlb_count;
+
 	/*
 	 * For an untrusted host VM, 'pkvm.handle' is used to lookup
 	 * the associated pKVM instance in the hypervisor.
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index c09b1d411c584..eb59549ec2172 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -424,10 +424,11 @@ static bool kvm_hyp_handle_tlbi_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
 		return false;
 
 	/*
-	 * If we have to check for any VNCR mapping being invalidated,
+	 * If we have to check for any VNCR TLB being invalidated,
 	 * go back to the slow path for further processing.
 	 */
-	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu))
+	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu) &&
+	    atomic_read(&vcpu->kvm->arch.vncr_tlb_count))
 		return false;
 
 	__kvm_skip_instr(vcpu);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 84915e2cff604..1e3fd98f6589b 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -48,6 +48,7 @@ void kvm_init_nested(struct kvm *kvm)
 {
 	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
+	atomic_set(&kvm->arch.vncr_tlb_count, 0);
 }
 
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
@@ -997,9 +998,11 @@ u16 get_asid_by_regime(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	return asid;
 }
 
-static void invalidate_vncr(struct vncr_tlb *vt)
+static void invalidate_vncr(struct kvm *kvm, struct vncr_tlb *vt)
 {
+	BUG_ON(!vt->valid);
 	vt->valid = false;
+	atomic_dec(&kvm->arch.vncr_tlb_count);
 	if (vt->cpu != -1)
 		unmap_l1_vncr(vt);
 }
@@ -1042,7 +1045,7 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
 
 	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm)
 		if (vncr_tlb_intersects(vt, vt->wr.pa, start, end - start))
-			invalidate_vncr(vt);
+			invalidate_vncr(kvm, vt);
 }
 
 struct s1e2_tlbi_scope {
@@ -1090,7 +1093,7 @@ static void invalidate_vncr_va(struct kvm *kvm,
 			break;
 		}
 
-		invalidate_vncr(vt);
+		invalidate_vncr(kvm, vt);
 	}
 }
 
@@ -1326,13 +1329,20 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
  *   intersects with the TLBI request, invalidate it, and unmap the page
  *   from the fixmap. Because we need to look at all the vcpu-private TLBs,
  *   this requires some wide-ranging locking to ensure that nothing races
- *   against it. This may require some refcounting to avoid the search when
- *   no such TLB is present.
+ *   against it. This requires some refcounting to avoid the search when
+ *   no such TLB is present (see below).
  *
  * - On MMU notifiers, we must invalidate our TLB in a similar way, but
  *   looking at the IPA instead. The funny part is that there may not be a
  *   stage-2 mapping for this page if L1 hasn't accessed it using LD/ST
  *   instructions.
+ *
+ * - vncr_tlb_count tracks the number of valid VNCR TLBs VM-wide. This isn't
+ *   the number of *mapped* L1 VNCR pages, which is likely be a subset (and
+ *   by definition, a TLBI handled from L1 runs with the canonical VNCR
+ *   page, not the L1's). The innermost trap handling code checks this to
+ *   find out whether to return to the guest ASAP (no L1 TLBs) or to visit
+ *   this part of the world for some extra invalidation work.
  */
 
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu)
@@ -1387,7 +1397,8 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 	 */
 	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
 		this_cpu_reset_vncr_fixmap(vcpu);
-		vt->valid = false;
+		if (vt->valid)
+			invalidate_vncr(vcpu->kvm, vt);
 
 		vt->wi = (struct s1_walk_info) {
 			.regime	= TR_EL20,
@@ -1459,6 +1470,8 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		vt->valid = true;
 		vt->cpu = -1;
 
+		atomic_inc(&vcpu->kvm->arch.vncr_tlb_count);
+
 		kvm_make_request(KVM_REQ_MAP_L1_VNCR_EL2, vcpu);
 		kvm_release_faultin_page(vcpu->kvm, page, false, vt->wr.pw && vt->hpa_writable);
 	}
-- 
2.47.3


