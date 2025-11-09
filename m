Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33F7CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DW44tBosCLEJndKIMEpAJyXxTJiluheDlNPjH5QoV+4=; b=V5ZPHocsyq5C1EtRRMiadGNDKi
	JfCkGqvL5siKAz4CwkBjVynNLRD8c8/ZBy9TTEjLBZIv0Z+BR05s3/eZaT5C2Np2VUCS1T1StBzWy
	bY11zN4qV5YwBtRwAx1p3Fj1ENubaI0ZmCtXZlKUBvG73iA6uESttAtbdnBOOGvHHRyaJeD2uGvcO
	Mk8VNCt3arzeGkXJY3ULIKur70PUyy2bPrr8N8XLtv8K82r72ew3KXliLDahSEWyIbgasU6+SGaMX
	gtjARr9M+hF/i1+KzkT5lrgqY3QYr/fkYcv9v2nMC+JZgmoChnv7IR4x8lPvWnHhCE1uJhbIv905I
	37ql9u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92U-00000004D3C-3ZJc;
	Sun, 09 Nov 2025 17:17:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91n-00000004CDn-22Uj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2290F443A2;
	Sun,  9 Nov 2025 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E80C4AF0D;
	Sun,  9 Nov 2025 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708594;
	bh=Un4wwbXVTP9oQDSI8drz+jmJbs91to4TLCmSLLefu+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rntBhqch5NVhbwL6hfJztPjJDldAauqFVZQBL90PFB9ZR6xlZXaee4dZsh4XbyXa1
	 Uk5A5zsADnO84KuGlp1J1V7df1PSEU4aT+/+OyB+pxET68UeG+iVBmRmyLABycMeBS
	 UfiN8TcnRatZ9Df4lnrWe2S6RbQgLWLg/6sAuadClpa0ar10H6GDmNl06bgPKQF4s0
	 hEPZNfYipj6BV8UT9pY2nLYBk6v26E/hPSTLDeTIntTsrAJQu/geLTGFT5pcNyH8RE
	 QSVPDhkc0g77CMVoZoqOi+OkDJV01qsYyQnOO3sTxlOzc14fdi2QLbGd3LVHGLPsGf
	 uoKrI2dM+Ln4Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91k-00000003exw-3MTl;
	Sun, 09 Nov 2025 17:16:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 19/45] KVM: arm64: Eagerly save VMCR on exit
Date: Sun,  9 Nov 2025 17:15:53 +0000
Message-ID: <20251109171619.1507205-20-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091635_632489_3BDEC4E8 
X-CRM114-Status: GOOD (  17.36  )
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

We currently save/restore the VMCR register in a pretty lazy way
(on load/put, consistently with what we do with the APRs).

However, we are going to need the group-enable bits that are backed
by VMCR on each entry (so that we can avoid injecting interrupts for
disabled groups).

Move the synchronisation from put to sync, which results in some minor
churn in the nVHE hypercalls to simplify things.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h     |  2 +-
 arch/arm64/include/asm/kvm_hyp.h     |  2 +-
 arch/arm64/kvm/arm.c                 |  3 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c   |  7 ++++---
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 15 +++------------
 arch/arm64/kvm/vgic/vgic-v2.c        |  2 +-
 arch/arm64/kvm/vgic/vgic-v3-nested.c |  2 +-
 arch/arm64/kvm/vgic/vgic-v3.c        |  2 +-
 8 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 9da54d4ee49ee..f8adbd535b4ae 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,7 +79,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
-	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_vmcr_aprs,
+	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
 	__KVM_HOST_SMCCC_FUNC___pkvm_reserve_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_unreserve_vm,
diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index e6be1f5d0967f..dbf16a9f67728 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -82,7 +82,7 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_activate_traps(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if);
-void __vgic_v3_save_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
+void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if);
 void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if);
 int __vgic_v3_perform_cpuif_access(struct kvm_vcpu *vcpu);
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 870953b4a8a74..733195ef183e1 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -659,8 +659,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	if (is_protected_kvm_enabled()) {
-		kvm_call_hyp(__vgic_v3_save_vmcr_aprs,
-			     &vcpu->arch.vgic_cpu.vgic_v3);
+		kvm_call_hyp(__vgic_v3_save_aprs, &vcpu->arch.vgic_cpu.vgic_v3);
 		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
 	}
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 29430c031095a..a7c689152f686 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -157,6 +157,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
 	host_cpu_if->vgic_hcr		= hyp_cpu_if->vgic_hcr;
+	host_cpu_if->vgic_vmcr		= hyp_cpu_if->vgic_vmcr;
 	for (i = 0; i < hyp_cpu_if->used_lrs; ++i)
 		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
 }
@@ -464,11 +465,11 @@ static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 	__vgic_v3_init_lrs();
 }
 
-static void handle___vgic_v3_save_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
+static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
 
-	__vgic_v3_save_vmcr_aprs(kern_hyp_va(cpu_if));
+	__vgic_v3_save_aprs(kern_hyp_va(cpu_if));
 }
 
 static void handle___vgic_v3_restore_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
@@ -616,7 +617,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
 	HANDLE_FUNC(__kvm_flush_cpu_context),
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
-	HANDLE_FUNC(__vgic_v3_save_vmcr_aprs),
+	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
 	HANDLE_FUNC(__pkvm_reserve_vm),
 	HANDLE_FUNC(__pkvm_unreserve_vm),
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index d001b26a21f16..1e5c1cf4b9144 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -235,6 +235,8 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 		}
 	}
 
+	cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
+
 	if (cpu_if->vgic_hcr & ICH_HCR_EL2_LRENPIE) {
 		u64 val = read_gicreg(ICH_HCR_EL2);
 		cpu_if->vgic_hcr &= ~ICH_HCR_EL2_EOIcount;
@@ -332,10 +334,6 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
 {
 	u64 val;
 
-	if (!cpu_if->vgic_sre) {
-		cpu_if->vgic_vmcr = read_gicreg(ICH_VMCR_EL2);
-	}
-
 	/* Only restore SRE if the host implements the GICv2 interface */
 	if (static_branch_unlikely(&vgic_v3_has_v2_compat)) {
 		val = read_gicreg(ICC_SRE_EL2);
@@ -357,7 +355,7 @@ void __vgic_v3_deactivate_traps(struct vgic_v3_cpu_if *cpu_if)
 		write_gicreg(0, ICH_HCR_EL2);
 }
 
-static void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if)
+void __vgic_v3_save_aprs(struct vgic_v3_cpu_if *cpu_if)
 {
 	u64 val;
 	u32 nr_pre_bits;
@@ -518,13 +516,6 @@ static void __vgic_v3_write_vmcr(u32 vmcr)
 	write_gicreg(vmcr, ICH_VMCR_EL2);
 }
 
-void __vgic_v3_save_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if)
-{
-	__vgic_v3_save_aprs(cpu_if);
-	if (cpu_if->vgic_sre)
-		cpu_if->vgic_vmcr = __vgic_v3_read_vmcr();
-}
-
 void __vgic_v3_restore_vmcr_aprs(struct vgic_v3_cpu_if *cpu_if)
 {
 	__vgic_v3_compat_mode_enable();
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 5a2165a8d22c0..07e93acafd04d 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -451,6 +451,7 @@ void vgic_v2_save_state(struct kvm_vcpu *vcpu)
 	if (!base)
 		return;
 
+	cpu_if->vgic_vmcr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_VMCR);
 
 	if (used_lrs)
 		save_lrs(vcpu, base);
@@ -495,6 +496,5 @@ void vgic_v2_put(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v2_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v2;
 
-	cpu_if->vgic_vmcr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_VMCR);
 	cpu_if->vgic_apr = readl_relaxed(kvm_vgic_global_state.vctrl_base + GICH_APR);
 }
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 387557e20a272..17bceef83269e 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -341,7 +341,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
 	u64 val;
 	int i;
 
-	__vgic_v3_save_vmcr_aprs(s_cpu_if);
+	__vgic_v3_save_aprs(s_cpu_if);
 	__vgic_v3_deactivate_traps(s_cpu_if);
 	__vgic_v3_save_state(s_cpu_if);
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 4981065ca1b7e..2619e120484c5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -815,7 +815,7 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
 	}
 
 	if (likely(!is_protected_kvm_enabled()))
-		kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);
+		kvm_call_hyp(__vgic_v3_save_aprs, cpu_if);
 	WARN_ON(vgic_v4_put(vcpu));
 
 	if (has_vhe())
-- 
2.47.3


