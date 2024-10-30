Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58ECDD6B6A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb63IT0PbaY3JiaZTLA93u6cF01CaeKvzW1a8UYSVkA=; b=lJOywtTUuqa85VWsq7Y1JpCD6y
	0UVBapEJSprC7LZEoq91wZBiScEGcypnaGq5WnSJAA5JRIYlPz0IHVk5gj/EDcWXREsI5q5WINoDe
	9kR/bojy2+HbZ5KMkIVCuPdaajMcDGPk9EWT29N+bdvjOzlWpQHYaq/M1eG/hpPUJm/kUM2pk9nqu
	DhGNrjDE5u/JJRI6qTwjgl6Olzy00sKW92QNZeXOoQkg6IgAtUBQflgMDH4JNyDBDdghvi0GtKRdx
	4gvqlcLMmwDGo9rZPPe9h4Wx/RYluFKOVYIuHiFo65PiTYVddY8n66qhYfnZOx0FdfW0q9BDiV/5A
	2HZz+GBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BOL-000000012yD-0eJH;
	Wed, 30 Oct 2024 16:17:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BAU-0000000104q-3vzX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:03:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C47A1A00;
	Wed, 30 Oct 2024 09:04:04 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952A73F528;
	Wed, 30 Oct 2024 09:03:32 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: anshuman.khandual@arm.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	shameerali.kolothum.thodi@huawei.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v6 4/7] KVM: arm64: Fix missing traps of guest accesses to the MPAM registers
Date: Wed, 30 Oct 2024 16:03:14 +0000
Message-Id: <20241030160317.2528209-5-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030160317.2528209-1-joey.gouly@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_090335_268044_7C2DFFC9 
X-CRM114-Status: GOOD (  18.27  )
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

From: James Morse <james.morse@arm.com>

commit 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits in
ID_AA64PFR0 register") exposed the MPAM field of AA64PFR0_EL1 to guests,
but didn't add trap handling.

If you are unlucky, this results in an MPAM aware guest being delivered
an undef during boot. The host prints:
| kvm [97]: Unsupported guest sys_reg access at: ffff800080024c64 [00000005]
| { Op0( 3), Op1( 0), CRn(10), CRm( 5), Op2( 0), func_read },

Which results in:
| Internal error: Oops - Undefined instruction: 0000000002000000 [#1] PREEMPT SMP
| Modules linked in:
| CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc7-00559-gd89c186d50b2 #14616
| Hardware name: linux,dummy-virt (DT)
| pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : test_has_mpam+0x18/0x30
| lr : test_has_mpam+0x10/0x30
| sp : ffff80008000bd90
...
| Call trace:
|  test_has_mpam+0x18/0x30
|  update_cpu_capabilities+0x7c/0x11c
|  setup_cpu_features+0x14/0xd8
|  smp_cpus_done+0x24/0xb8
|  smp_init+0x7c/0x8c
|  kernel_init_freeable+0xf8/0x280
|  kernel_init+0x24/0x1e0
|  ret_from_fork+0x10/0x20
| Code: 910003fd 97ffffde 72001c00 54000080 (d538a500)
| ---[ end trace 0000000000000000 ]---
| Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
| ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Add the support to enable the traps, and handle the three guest accessible
registers by injecting an UNDEF. This stops KVM from spamming the host
log, but doesn't yet hide the feature from the id registers.

With MPAM v1.0 we can trap the MPAMIDR_EL1 register only if
ARM64_HAS_MPAM_HCR, with v1.1 an additional MPAM2_EL2.TIDR bit traps
MPAMIDR_EL1 on platforms that don't have MPAMHCR_EL2. Enable one of
these if either is supported. If neither is supported, the guest can
discover that the CPU has MPAM support, and how many PARTID etc the
host has ... but it can't influence anything, so its harmless.

Fixes: 011e5f5bf529f ("arm64/cpufeature: Add remaining feature bits in ID_AA64PFR0 register")
CC: Anshuman Khandual <anshuman.khandual@arm.com>
Link: https://lore.kernel.org/linux-arm-kernel/20200925160102.118858-1-james.morse@arm.com/
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h     |  2 +-
 arch/arm64/include/asm/kvm_arm.h        |  1 +
 arch/arm64/kvm/hyp/include/hyp/switch.h | 31 +++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c               | 14 +++++++++++
 4 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 352aa6b93964..93fe8e6beb64 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -845,7 +845,7 @@ static inline bool system_supports_poe(void)
 		alternative_has_cap_unlikely(ARM64_HAS_S1POE);
 }
 
-static inline bool system_supports_mpam(void)
+static __always_inline bool system_supports_mpam(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MPAM);
 }
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 109a85ee6910..16afb7a79b15 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -103,6 +103,7 @@
 #define HCR_HOST_VHE_FLAGS (HCR_RW | HCR_TGE | HCR_E2H)
 
 #define HCRX_HOST_FLAGS (HCRX_EL2_MSCEn | HCRX_EL2_TCR2En | HCRX_EL2_EnFPM)
+#define MPAMHCR_HOST_FLAGS	0
 
 /* TCR_EL2 Registers bits */
 #define TCR_EL2_DS		(1UL << 32)
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 5310fe1da616..34f53707892d 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -204,6 +204,35 @@ static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
 }
 
+static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
+{
+	u64 r = MPAM2_EL2_TRAPMPAM0EL1 | MPAM2_EL2_TRAPMPAM1EL1;
+
+	if (!system_supports_mpam())
+		return;
+
+	/* trap guest access to MPAMIDR_EL1 */
+	if (system_supports_mpam_hcr()) {
+		write_sysreg_s(MPAMHCR_EL2_TRAP_MPAMIDR_EL1, SYS_MPAMHCR_EL2);
+	} else {
+		/* From v1.1 TIDR can trap MPAMIDR, set it unconditionally */
+		r |= MPAM2_EL2_TIDR;
+	}
+
+	write_sysreg_s(r, SYS_MPAM2_EL2);
+}
+
+static inline void __deactivate_traps_mpam(void)
+{
+	if (!system_supports_mpam())
+		return;
+
+	write_sysreg_s(0, SYS_MPAM2_EL2);
+
+	if (system_supports_mpam_hcr())
+		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);
+}
+
 static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 {
 	/* Trap on AArch32 cp15 c15 (impdef sysregs) accesses (EL1 or EL0) */
@@ -244,6 +273,7 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	}
 
 	__activate_traps_hfgxtr(vcpu);
+	__activate_traps_mpam(vcpu);
 }
 
 static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
@@ -263,6 +293,7 @@ static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
 		write_sysreg_s(HCRX_HOST_FLAGS, SYS_HCRX_EL2);
 
 	__deactivate_traps_hfgxtr(vcpu);
+	__deactivate_traps_mpam();
 }
 
 static inline void ___activate_traps(struct kvm_vcpu *vcpu, u64 hcr)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index ff8c4e1b847e..66d6af1dbadc 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2553,8 +2553,11 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_LOREA_EL1), trap_loregion },
 	{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
 	{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
+	{ SYS_DESC(SYS_MPAMIDR_EL1), undef_access },
 	{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
 
+	{ SYS_DESC(SYS_MPAM1_EL1), undef_access },
+	{ SYS_DESC(SYS_MPAM0_EL1), undef_access },
 	{ SYS_DESC(SYS_VBAR_EL1), access_rw, reset_val, VBAR_EL1, 0 },
 	{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
 
@@ -2854,6 +2857,17 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	EL2_REG(MAIR_EL2, access_rw, reset_val, 0),
 	EL2_REG(AMAIR_EL2, access_rw, reset_val, 0),
+	{ SYS_DESC(SYS_MPAMHCR_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPMV_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAM2_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM0_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM1_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM2_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM3_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM4_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM5_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM6_EL2), undef_access },
+	{ SYS_DESC(SYS_MPAMVPM7_EL2), undef_access },
 
 	EL2_REG(VBAR_EL2, access_rw, reset_val, 0),
 	EL2_REG(RVBAR_EL2, access_rw, reset_val, 0),
-- 
2.25.1


