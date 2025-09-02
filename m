Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C646CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9TuL04vFhiPzgdrP+BZoEcVrXaxSu+12DLf6V0dxlQ=; b=LbKMXxYe5a/65HHn+AMjfLBdsY
	kiFjcLAwY8aw7HSTzf06KuXlXb8THrg4vuIPJd4PAUQKfpIK3DvGIqGUSEGcnR5Us1t2f93Zq9INr
	+bfcYNb8UihgPILCn2STH2syd8DBnvJ+av0kggzqCW+2EKkgeTixrGkeN9bO5kL8MO3f2KegVRvM4
	B7skaLWNhg3g0XVdqAkmVL5ZSqjELxBZY+5su+adi+ukx67JBdKBZTrxGxCkIyBdA58iz7JPU5p7x
	xF/NedLvrXK9T1nMRTm2BPdsQWGqyuo7OlaVB4WEobepsAeHSipR6+Ecr9fqTPwF/l6XHJ41dAHuV
	MPKjml0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNq-00000001Zas-3mTC;
	Tue, 02 Sep 2025 19:09:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQpk-0000000HYlQ-453p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:14:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6D1F27B5;
	Tue,  2 Sep 2025 06:13:51 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA5713F694;
	Tue,  2 Sep 2025 06:13:58 -0700 (PDT)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org
Subject: [PATCH v2 2/2] KVM: arm64: VHE: Save and restore host MDCR_EL2 value correctly
Date: Tue,  2 Sep 2025 14:08:33 +0100
Message-ID: <20250902130833.338216-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902130833.338216-1-alexandru.elisei@arm.com>
References: <20250902130833.338216-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061401_087009_B1403B80 
X-CRM114-Status: GOOD (  12.29  )
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

Prior to commit 75a5fbaf6623 ("KVM: arm64: Compute MDCR_EL2 at
vcpu_load()"), host MDCR_EL2 was saved correctly:

kvm_arch_vcpu_load()
  kvm_vcpu_load_debug() /* Doesn't touch hardware MDCR_EL2. */
  kvm_vcpu_load_vhe()
    __activate_traps_common()
       /* Saves host MDCR_EL2. */
       *host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2)
       /* Writes VCPU MDCR_EL2. */
       write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2)

The MDCR_EL2 value saved previously was restored in
kvm_arch_vcpu_put() -> kvm_vcpu_put_vhe().

After the aforementioned commit, host MDCR_EL2 is never saved:

kvm_arch_vcpu_load()
  kvm_vcpu_load_debug() /* Writes VCPU MDCR_EL2 */
  kvm_vcpu_load_vhe()
    __activate_traps_common()
       /* Saves **VCPU** MDCR_EL2. */
       *host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2)
       /* Writes VCPU MDCR_EL2 a second time. */
       write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2)

kvm_arch_vcpu_put() -> kvm_vcpu_put_vhe() then restores the VCPU MDCR_EL2
value. Also VCPU's MDCR_EL2 value gets written to hardware twice now.

Fix this by saving the host MDCR_EL2 in kvm_arch_vcpu_load() before it gets
overwritten by the VCPU's MDCR_EL2 value, and restore it on VCPU put.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Tested on a cubie a5e by adding a few print statements. Without the patch:

[ 1009.416572] kvm_arch_init_vm: MDCR_EL2=0x6
[ 1028.397204] kvm_arch_destroy_vm: MDCR_EL2=0xe66
[ 1049.271878] kvm_arch_init_vm: MDCR_EL2=0xe66
[ 1066.030000] kvm_arch_destroy_vm: MDCR_EL2=0xe66

With the patch:

[  977.814892] kvm_arch_init_vm: MDCR_EL2=0x6
[ 1040.084919] kvm_arch_destroy_vm: MDCR_EL2=0x6
[ 1045.987826] kvm_arch_init_vm: MDCR_EL2=0x6
[ 1128.720366] kvm_arch_destroy_vm: MDCR_EL2=0x6

 arch/arm64/kvm/debug.c                  | 6 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 5 -----
 arch/arm64/kvm/hyp/nvhe/switch.c        | 6 ++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index e7ce0d5a622d..c81b11c42e4d 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -144,6 +144,9 @@ void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu)
 	/* Must be called before kvm_vcpu_load_vhe() */
 	KVM_BUG_ON(vcpu_get_flag(vcpu, SYSREGS_ON_CPU), vcpu->kvm);
 
+	if (has_vhe())
+		*host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2);
+
 	/*
 	 * Determine which of the possible debug states we're in:
 	 *
@@ -190,6 +193,9 @@ void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu)
 
 void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu)
 {
+	if (has_vhe())
+		write_sysreg(*host_data_ptr(host_debug_state.mdcr_el2), mdcr_el2);
+
 	if (likely(!(vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)))
 		return;
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 84ec4e100fbb..b6682202edf3 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -431,9 +431,6 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 		vcpu_set_flag(vcpu, PMUSERENR_ON_CPU);
 	}
 
-	*host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2);
-	write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
-
 	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
 		u64 hcrx = vcpu->arch.hcrx_el2;
 		if (is_nested_ctxt(vcpu)) {
@@ -454,8 +451,6 @@ static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
 
-	write_sysreg(*host_data_ptr(host_debug_state.mdcr_el2), mdcr_el2);
-
 	write_sysreg(0, hstr_el2);
 	if (system_supports_pmuv3()) {
 		write_sysreg(ctxt_sys_reg(hctxt, PMUSERENR_EL0), pmuserenr_el0);
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index ccd575d5f6de..d3b9ec8a7c28 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -50,6 +50,10 @@ extern void kvm_nvhe_prepare_backtrace(unsigned long fp, unsigned long pc);
 static void __activate_traps(struct kvm_vcpu *vcpu)
 {
 	___activate_traps(vcpu, vcpu->arch.hcr_el2);
+
+	*host_data_ptr(host_debug_state.mdcr_el2) = read_sysreg(mdcr_el2);
+	write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
+
 	__activate_traps_common(vcpu);
 	__activate_cptr_traps(vcpu);
 
@@ -93,6 +97,8 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 		isb();
 	}
 
+	write_sysreg(*host_data_ptr(host_debug_state.mdcr_el2), mdcr_el2);
+
 	__deactivate_traps_common(vcpu);
 
 	write_sysreg_hcr(this_cpu_ptr(&kvm_init_params)->hcr_el2);
-- 
2.51.0


