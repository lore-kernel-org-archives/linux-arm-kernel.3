Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6751CC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+KCpeNanMC1PnEypCzpol/p51CRRG0KlP9SQTz+3Ao=; b=jQox6Tb5/L9llBt6pQTYa9kPNY
	QEkyVjchAHWjipMCCinIIN/SkZnqHhnGZNZ8AvWSb7+pTfm8ocm22ax6jzuHXsIBZneNbUo2zzoai
	vT+sThr2vnoyoESR3xFV9JSnv/y2FshVUOiZWv3ko/iJ1sy2a+y03mZPc0XF5WuarMH9vjE3Wj3Ix
	zCbbzxilwGFHbN7SEul5xJ6fLmhIjGVqNrIkG+ulcQF9fwwIMYhtxpBfoT7baPJhFehv97jhyprF6
	yaNy7aQf2QAgQctVrMzTZC4H6m72S1ytxeJhz59yKihYp4PU39Q43/muKoHlv1hMDbA5Jfldj9bqD
	dfZhW2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKtn-00000000p7x-205M;
	Tue, 04 Feb 2025 15:31:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKk1-00000000nxb-3ZEp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 15:21:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F58F1515;
	Tue,  4 Feb 2025 07:21:57 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28E113F63F;
	Tue,  4 Feb 2025 07:21:31 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	eauger@redhat.com,
	fweimer@redhat.com,
	jeremy.linton@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	pbonzini@redhat.com,
	stable@vger.kernel.org,
	tabba@google.com,
	wilco.dijkstra@arm.com,
	will@kernel.org
Subject: [PATCH 5/8] KVM: arm64: Refactor CPTR trap deactivation
Date: Tue,  4 Feb 2025 15:20:57 +0000
Message-Id: <20250204152100.705610-6-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250204152100.705610-1-mark.rutland@arm.com>
References: <20250204152100.705610-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_072133_976060_30B35143 
X-CRM114-Status: GOOD (  14.90  )
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

For historical reasons, the VHE and nVHE/hVHE implementations of
__activate_cptr_traps() pair with a common implementation of
__kvm_reset_cptr_el2(), which ideally would be named
__deactivate_cptr_traps().

Rename __kvm_reset_cptr_el2() to __deactivate_cptr_traps(), and split it
into separate VHE and nVHE/hVHE variants so that each can be paired with
its corresponding implementation of __activate_cptr_traps().

At the same time, fold kvm_write_cptr_el2() into its callers. This
makes it clear in-context whether a write is made to the CPACR_EL1
encoding or the CPTR_EL2 encoding, and removes the possibility of
confusion as to whether kvm_write_cptr_el2() reformats the sysreg fields
as cpacr_clear_set() does.

In the nVHE/hVHE implementation of __activate_cptr_traps(), placing the
sysreg writes within the if-else blocks requires that the call to
__activate_traps_fpsimd32() is moved earlier, but as this was always
called before writing to CPTR_EL2/CPACR_EL1, this should not result in a
functional change.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_emulate.h | 42 ----------------------------
 arch/arm64/kvm/hyp/nvhe/switch.c     | 35 ++++++++++++++++++++---
 arch/arm64/kvm/hyp/vhe/switch.c      | 12 +++++++-
 3 files changed, 42 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 47f2cf408eeda..78ec1ef2cfe82 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -605,48 +605,6 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
 					 __cpacr_to_cptr_set(clr, set));\
 	} while (0)
 
-static __always_inline void kvm_write_cptr_el2(u64 val)
-{
-	if (has_vhe() || has_hvhe())
-		write_sysreg(val, cpacr_el1);
-	else
-		write_sysreg(val, cptr_el2);
-}
-
-/* Resets the value of cptr_el2 when returning to the host. */
-static __always_inline void __kvm_reset_cptr_el2(struct kvm *kvm)
-{
-	u64 val;
-
-	if (has_vhe()) {
-		val = (CPACR_EL1_FPEN | CPACR_EL1_ZEN_EL1EN);
-		if (cpus_have_final_cap(ARM64_SME))
-			val |= CPACR_EL1_SMEN_EL1EN;
-	} else if (has_hvhe()) {
-		val = CPACR_EL1_FPEN;
-
-		if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
-			val |= CPACR_EL1_ZEN;
-		if (cpus_have_final_cap(ARM64_SME))
-			val |= CPACR_EL1_SMEN;
-	} else {
-		val = CPTR_NVHE_EL2_RES1;
-
-		if (kvm_has_sve(kvm) && guest_owns_fp_regs())
-			val |= CPTR_EL2_TZ;
-		if (!cpus_have_final_cap(ARM64_SME))
-			val |= CPTR_EL2_TSM;
-	}
-
-	kvm_write_cptr_el2(val);
-}
-
-#ifdef __KVM_NVHE_HYPERVISOR__
-#define kvm_reset_cptr_el2(v)	__kvm_reset_cptr_el2(kern_hyp_va((v)->kvm))
-#else
-#define kvm_reset_cptr_el2(v)	__kvm_reset_cptr_el2((v)->kvm)
-#endif
-
 /*
  * Returns a 'sanitised' view of CPTR_EL2, translating from nVHE to the VHE
  * format if E2H isn't set.
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7a2d189176249..5d79f63a4f861 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -39,6 +39,9 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 {
 	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 
+	if (!guest_owns_fp_regs())
+		__activate_traps_fpsimd32(vcpu);
+
 	if (has_hvhe()) {
 		val |= CPACR_EL1_TTA;
 
@@ -47,6 +50,8 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 			if (vcpu_has_sve(vcpu))
 				val |= CPACR_EL1_ZEN;
 		}
+
+		write_sysreg(val, cpacr_el1);
 	} else {
 		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
 
@@ -61,12 +66,34 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 
 		if (!guest_owns_fp_regs())
 			val |= CPTR_EL2_TFP;
+
+		write_sysreg(val, cptr_el2);
 	}
+}
 
-	if (!guest_owns_fp_regs())
-		__activate_traps_fpsimd32(vcpu);
+static void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
 
-	kvm_write_cptr_el2(val);
+	if (has_hvhe()) {
+		u64 val = CPACR_EL1_FPEN;
+
+		if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
+			val |= CPACR_EL1_ZEN;
+		if (cpus_have_final_cap(ARM64_SME))
+			val |= CPACR_EL1_SMEN;
+
+		write_sysreg(val, cpacr_el1);
+	} else {
+		u64 val = CPTR_NVHE_EL2_RES1;
+
+		if (kvm_has_sve(kvm) && guest_owns_fp_regs())
+			val |= CPTR_EL2_TZ;
+		if (!cpus_have_final_cap(ARM64_SME))
+			val |= CPTR_EL2_TSM;
+
+		write_sysreg(val, cptr_el2);
+	}
 }
 
 static void __activate_traps(struct kvm_vcpu *vcpu)
@@ -119,7 +146,7 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 
 	write_sysreg(this_cpu_ptr(&kvm_init_params)->hcr_el2, hcr_el2);
 
-	kvm_reset_cptr_el2(vcpu);
+	__deactivate_cptr_traps(vcpu);
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
 }
 
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index e8a07d4bb546b..4748b1947ffa0 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -136,6 +136,16 @@ static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 	write_sysreg(val, cpacr_el1);
 }
 
+static void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
+{
+	u64 val = CPACR_EL1_FPEN | CPACR_EL1_ZEN_EL1EN;
+
+	if (cpus_have_final_cap(ARM64_SME))
+		val |= CPACR_EL1_SMEN_EL1EN;
+
+	write_sysreg(val, cpacr_el1);
+}
+
 static void __activate_traps(struct kvm_vcpu *vcpu)
 {
 	u64 val;
@@ -207,7 +217,7 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	 */
 	asm(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_SPECULATIVE_AT));
 
-	kvm_reset_cptr_el2(vcpu);
+	__deactivate_cptr_traps(vcpu);
 
 	if (!arm64_kernel_unmapped_at_el0())
 		host_vectors = __this_cpu_read(this_cpu_vector);
-- 
2.30.2


