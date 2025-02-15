Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC58C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V+chbaC0OjzxhWFJ1X+3hrvaGAViu4pOSsImCiWf8Q=; b=jil7uPIg3Kh2eyxQV5lO85D9Ra
	Bx4wcW7QQGft+Bw6/fLRzbUUhusOZT2BX75QVp2lNLjuGcavopVMEyEisERaRMPjWIzKziyY6hWPf
	VU/I3Kzhpo609TkRuyXAlP0CJzeT8BzjL6nZYBR3XNm1+c4Nnh6HzdIsdZ6rIt1ptA01TJ2ndqme9
	JS3Qq5ArfNXoGO/YWTnCzysWdfxqYxHBDT2+xlVxHkQw1WQLlSwuyxp0FFCDbp4IuLa/3EgasVkob
	6lwZksUmjQP2VNHVDe07VXKf4v2jY+tXYL0NMEAecugIamqPXc/eUmcjdsu8VddizRsrYhZe8/5dC
	bH8AGsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMOa-00000000XK0-2LzJ;
	Sat, 15 Feb 2025 17:56:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7W-00000000Urp-0QRU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6159A406B5;
	Sat, 15 Feb 2025 17:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF51C4CEE6;
	Sat, 15 Feb 2025 17:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641103;
	bh=OTC3kI/gv5GNa/GA2wVNNH8uH80umABVkvMIqwE3ERk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ErJpkAUkPXyA328KYs8dMbwIzhTMQk/eSK09W9t6Yboo4jSpIQ2sGjqPhV488KsIV
	 eZivam84rAnXKiv9n4LWl/6faW72sp7HA7tLEix/21DRpM0ygJamFe94rasS0vbOTX
	 zlWXpXVKev93Vz8G/Km590w1SkRIVF8JAG/SOEKrT5Y65HOykyYi9oek+BQB1+BTID
	 iNMtOh2XDTfSxbMymRTVzCYo2/NLwWpcq10n2Lqo/rUinz3reY3anOl/eYF1Diaf9Q
	 L7dx8XPL8Mj/iN8TSPhZTcDbPGJpgejBBBnHfULEQQ8wJ3RFeejAP5FQkkHOsT+EW1
	 KdUoTsM7smQBg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7S-004Pqp-1L;
	Sat, 15 Feb 2025 17:38:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 09/14] KVM: arm64: Move NV-specific capping to idreg sanitisation
Date: Sat, 15 Feb 2025 17:38:11 +0000
Message-Id: <20250215173816.3767330-10-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093826_272660_1B83592C 
X-CRM114-Status: GOOD (  14.25  )
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

Instead of applying the NV idreg limits at run time, switch to
doing it at the same time as the reset of the VM initialisation.

This will make things much simpler once we introduce vcpu-driven
variants of NV.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  1 +
 arch/arm64/kvm/nested.c             | 45 +----------------------------
 arch/arm64/kvm/sys_regs.c           |  3 ++
 3 files changed, 5 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 56c4bcd35e2e5..692f403c1896e 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -188,6 +188,7 @@ static inline bool kvm_supported_tlbi_s1e2_op(struct kvm_vcpu *vpcu, u32 instr)
 }
 
 int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu);
+u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val);
 
 #ifdef CONFIG_ARM64_PTR_AUTH
 bool kvm_auth_eretax(struct kvm_vcpu *vcpu, u64 *elr);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 2cc82e69ab523..96d1d300e79f9 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -804,7 +804,7 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
  * This list should get updated as new features get added to the NV
  * support, and new extension to the architecture.
  */
-static u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
+u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 {
 	switch (reg) {
 	case SYS_ID_AA64ISAR0_EL1:
@@ -929,47 +929,6 @@ static u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 	return val;
 }
 
-static void limit_nv_id_regs(struct kvm *kvm)
-{
-	u64 val;
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64ISAR0_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64ISAR0_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64ISAR0_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64ISAR1_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64ISAR1_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64ISAR1_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64PFR0_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR1_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64PFR1_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64PFR1_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR0_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64MMFR0_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR0_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR1_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64MMFR1_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR1_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR2_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64MMFR2_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR2_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64MMFR4_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64MMFR4_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64MMFR4_EL1, val);
-
-	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64DFR0_EL1);
-	val = limit_nv_id_reg(kvm, SYS_ID_AA64DFR0_EL1, val);
-	kvm_set_vm_id_reg(kvm, SYS_ID_AA64DFR0_EL1, val);
-}
-
 u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
 			     enum vcpu_sysreg sr, u64 v)
 {
@@ -1014,8 +973,6 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	if (!kvm->arch.sysreg_masks)
 		return -ENOMEM;
 
-	limit_nv_id_regs(kvm);
-
 	/* VTTBR_EL2 */
 	res0 = res1 = 0;
 	if (!kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16))
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 885cdef77d01e..c1e050a58fb2e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1638,6 +1638,9 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
 		break;
 	}
 
+	if (vcpu_has_nv(vcpu))
+		val = limit_nv_id_reg(vcpu->kvm, id, val);
+
 	return val;
 }
 
-- 
2.39.2


