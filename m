Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AF1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV5gap+CzXG51tXDcxBhEo+5k8g/SFFulCMXWXH9VaE=; b=bxA/lL6t7CHxUSCJGP8kxRu+l5
	oaZEepKZGHQo2bqrw/3pdkiZ8/jpY2vf6Tv2aes8yv/EP3X96tjHfZTaKHt9CRj0RoYAV55oq2u6+
	Eh9mI43A2MEasIpM97j0Zn0utV8WqDEogD23KuA78XUcUvaizQLcBPG4W5q5WLSmMG8P2Dyhf+s+B
	eoRLYtnMp8oQ6MRog0WQxulXW5IcXH9oF8p/AZfX6MTwzm3aiDP2sTmzobC8MthWnIEbbsmqchxyp
	M4nbS+fiEMMstSVKn2hcJd5fbGhyHEy5B5yvsK9LNN9b7wnY+SRbYd3gKUfFJEHpvz1U6pEh/yZmW
	16lglREw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaC1-0000000BXKb-1A20;
	Tue, 14 Jul 2026 10:16:49 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjaBv-0000000BXHs-488d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:16:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784024201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LV5gap+CzXG51tXDcxBhEo+5k8g/SFFulCMXWXH9VaE=;
	b=siO+AR7at9a9PQDirwsaaSNwAwkQ2njbiS2cPxBYp5uutGPJLNLjp/3rw/wHaWKgG3if2M
	daAd6WsZJnCvjuUynbc4rFWrN4hxa4EvoAC9+qJaF9gdSwdkCP99uTm8f2pMxinbJa625V
	Y8Hv4aPnkiSWOO+MiGLAP3SIlmc0sZY=
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
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v5 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg available to HYP code
Date: Tue, 14 Jul 2026 11:15:55 +0100
Message-Id: <20260714101601.4142645-3-fuad.tabba@linux.dev>
In-Reply-To: <20260714101601.4142645-1-fuad.tabba@linux.dev>
References: <20260714101601.4142645-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_031644_169014_F3585AD1 
X-CRM114-Status: GOOD (  13.86  )
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

The vcpu_{read,write}_sys_reg() accessors are only valid on a VHE host,
so helpers built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be()
cannot be shared with hyp code. exception.c already wraps them in local
helpers that pick the host- or hyp-side accessor via has_vhe().

Rename the host-only implementations to __vcpu_{read,write}_sysreg_vhe()
and turn vcpu_{read,write}_sys_reg() into the context-dispatching
wrappers, so every caller gets the version valid in any context and a
follow-up series can share that emulation code at EL2.

No functional change intended.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
v5:
  - Named the wrappers vcpu_{read,write}_sys_reg() and renamed the
    host-only implementations to __vcpu_{read,write}_sysreg_vhe(), rather
    than introducing a kvm_vcpu_ prefix. (Oliver)
  - Dropped Vincent's Reviewed-by since the patch changed materially.

 arch/arm64/include/asm/kvm_emulate.h | 20 ++++++++++++++++
 arch/arm64/include/asm/kvm_host.h    |  4 ++--
 arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
 arch/arm64/kvm/sys_regs.c            |  4 ++--
 4 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c7..429bda6f48d94 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -506,6 +506,26 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
 	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
 }
 
+/*
+ * __vcpu_*_sysreg_vhe() are only valid on a VHE host; wrap them so the same
+ * call site also works at EL2 under nVHE.
+ */
+static inline u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
+{
+	if (has_vhe())
+		return __vcpu_read_sysreg_vhe(vcpu, reg);
+
+	return __vcpu_sys_reg(vcpu, reg);
+}
+
+static inline void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
+{
+	if (has_vhe())
+		__vcpu_write_sysreg_vhe(vcpu, val, reg);
+	else
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+}
+
 static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_mode_is_32bit(vcpu)) {
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5c..f3c3c86b3d7fb 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1215,8 +1215,8 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		__v;							\
 	})
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
-void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
+u64 __vcpu_read_sysreg_vhe(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg);
+void __vcpu_write_sysreg_vhe(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg);
 
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index bef40ddb16dbc..754e2dc1df54a 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -20,22 +20,6 @@
 #error Hypervisor code only!
 #endif
 
-static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
-{
-	if (has_vhe())
-		return vcpu_read_sys_reg(vcpu, reg);
-
-	return __vcpu_sys_reg(vcpu, reg);
-}
-
-static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
-{
-	if (has_vhe())
-		vcpu_write_sys_reg(vcpu, val, reg);
-	else
-		__vcpu_assign_sys_reg(vcpu, reg, val);
-}
-
 static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
 			      u64 val)
 {
@@ -101,14 +85,14 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 
 	switch (target_mode) {
 	case PSR_MODE_EL1h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
+		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
 		break;
 	case PSR_MODE_EL2h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
+		vbar = vcpu_read_sys_reg(vcpu, VBAR_EL2);
+		sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL2);
+		vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
 		break;
 	default:
 		/* Don't do that */
@@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
  */
 static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
 {
-	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
 	unsigned long old, new;
 
 	old = *vcpu_cpsr(vcpu);
@@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
 {
 	unsigned long spsr = *vcpu_cpsr(vcpu);
 	bool is_thumb = (spsr & PSR_AA32_T_BIT);
-	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+	u32 sctlr = vcpu_read_sys_reg(vcpu, SCTLR_EL1);
 	u32 return_address;
 
 	*vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
@@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
 	if (sctlr & (1 << 13))
 		vect_offset += 0xffff0000;
 	else /* always have security exceptions */
-		vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		vect_offset += vcpu_read_sys_reg(vcpu, VBAR_EL1);
 
 	*vcpu_pc(vcpu) = vect_offset;
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 08ba882799d48..c6a416974a61f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -291,7 +291,7 @@ static void write_sr_to_cpu(enum vcpu_sysreg reg, u64 val)
 	}
 }
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
+u64 __vcpu_read_sysreg_vhe(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 {
 	struct sr_loc loc = {};
 
@@ -338,7 +338,7 @@ u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 	return __vcpu_sys_reg(vcpu, reg);
 }
 
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
+void __vcpu_write_sysreg_vhe(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
 {
 	struct sr_loc loc = {};
 
-- 
2.39.5


