Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0604CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91/ghJcpz1BH5naJRyi3RIwH+zGVsFzNrh7ehA1rofI=; b=rShLn8RBfc75p+rkF9Yzb+DLrj
	7HMvX13/AEINHTsILmTK14QiK0UVzQOZ4NYTYICO7He3HCLJzRK7Dvsf34Pw/NCZyilL3rA/8QBPT
	nDzX4J2Vf9NDnvY+YCPiywTCi9lZmkRjsluALcoYEJGy5FIh6mIiqbJlqT8aWN53+5YDC+XoP/5bx
	DmUyHnmO1RxOjfouyb4mgt3eSc6c5gqB59J/BXih00BQuu4Asrsvo3eh38aC6oJxZG5hPCDnIyYNf
	BKNnlDsXk4kSdQNlSWX7gN74ng3ZkK9E1X81Idqn+lj4+hKDf9qVcR8m4GgmJ5X2tW/OFBT9UP8Ur
	rsjD5EWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncZ8-00000005eod-32yX;
	Sun, 17 Aug 2025 12:32:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncMP-00000005e4u-38Q0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 12:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D97D43BE6;
	Sun, 17 Aug 2025 12:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04A0C4CEEB;
	Sun, 17 Aug 2025 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755433181;
	bh=Y9CCo9W5rdE6f2VvoNiTAFbF1TSLVQrEcycA8yuVJcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N5SKZS56cR4xKC3w3/gCWopAqQMphcF3bxhu1IWDpdV29hSfe+PlJDaayKTTPQ+Ja
	 yBAeh9VsaXi0EhLR2tDZs17CsXuiyL9Fo4BPYkav/eLUyz67FjulnSWagwVeSqBviS
	 3rnZ1f/bGHLBOvoqkOvCIR8b/QExd1qAani+m/xlr5T8gevq11ibJlQsMXfJbnvVus
	 rp41ETwfrMG8a81JtB8EuYilL2yeu3ZVlNWai7c6MwcfQnvhSiHqNHxcL2a36tRU0z
	 V7MDCHrWvxKzXFupDUJJEJYJlDQvNfAmv+59lgdmtvC53kklDiGKgdRdhCFn0sSxSR
	 QpSChVVOir3eA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uncMF-008L0z-14;
	Sun, 17 Aug 2025 13:19:31 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 3/4] KVM: arm64: Fix vcpu_{read,write}_sys_reg() accessors
Date: Sun, 17 Aug 2025 13:19:25 +0100
Message-Id: <20250817121926.217900-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817121926.217900-1-maz@kernel.org>
References: <20250817121926.217900-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_051941_827931_B918A3BC 
X-CRM114-Status: GOOD (  33.19  )
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

Volodymyr reports (again!) that under some circumstances (E2H==0,
walking S1 PTs), PAR_EL1 doesn't report the value of the latest
walk in the CPU register, but that instead the value is written to
the backing store.

Further investigation indicates that the root cause of this is
that a group of registers (PAR_EL1, TPIDR*_EL{0,1}, the *32_EL2 dregs)
should always be considered as "on CPU", as they are not remapped
between EL1 and EL2.

We fail to treat them accordingly, and end-up considering that
the register (PAR_EL1 in this example) should be written to memory
instead of in the register.

While it would be possible to quickly work around it, it is obvious
that the way we track these things at the moment is pretty horrible,
and could do with some improvement.

Revamp the whole thing by:

- defining a location for a register (memory, cpu), potentially
  depending on the state of the vcpu

- define a transformation for this register (mapped register, potential
  translation, special register needing some particular attention)

- convey this information in a structure that can be easily passed
  around

As a result, the accessors themselves become much simpler, as the
state is explicit instead of being driven by hard-to-understand
conventions.

We get rid of the "pure EL2 register" notion, which wasn't very
useful, and add sanitisation of the values by applying the RESx
masks as required, something that was missing so far.

And of course, we add the missing registers to the list, with the
indication that they are always loaded.

Reported-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Fixes: fedc612314acf ("KVM: arm64: nv: Handle virtual EL2 registers in vcpu_read/write_sys_reg()")
Link: https://lore.kernel.org/r/20250806141707.3479194-3-volodymyr_babchuk@epam.com
---
 arch/arm64/include/asm/kvm_host.h |   4 +-
 arch/arm64/kvm/sys_regs.c         | 270 ++++++++++++++++++------------
 2 files changed, 162 insertions(+), 112 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2f2394cce24ed..a9661d35bfd02 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1160,8 +1160,8 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		__v;							\
 	})
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg);
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg);
+u64 vcpu_read_sys_reg(const struct kvm_vcpu *, enum vcpu_sysreg);
+void vcpu_write_sys_reg(struct kvm_vcpu *, u64, enum vcpu_sysreg);
 
 static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 {
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf7..b27ddb15d9909 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -82,43 +82,105 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
 			"sys_reg write to read-only register");
 }
 
-#define PURE_EL2_SYSREG(el2)						\
-	case el2: {							\
-		*el1r = el2;						\
-		return true;						\
+enum sr_loc_attr {
+	SR_LOC_MEMORY	= 0,	  /* Register definitely in memory */
+	SR_LOC_LOADED	= BIT(0), /* Register on CPU, unless it cannot */
+	SR_LOC_MAPPED	= BIT(1), /* Register in a different CPU register */
+	SR_LOC_XLATED	= BIT(2), /* Register translated to fit another reg */
+	SR_LOC_SPECIAL	= BIT(3), /* Demanding register, implies loaded */
+};
+
+struct sr_loc {
+	enum sr_loc_attr loc;
+	enum vcpu_sysreg map_reg;
+	u64		 (*xlate)(u64);
+};
+
+static enum sr_loc_attr locate_direct_register(const struct kvm_vcpu *vcpu,
+					       enum vcpu_sysreg reg)
+{
+	switch (reg) {
+	case SCTLR_EL1:
+	case CPACR_EL1:
+	case TTBR0_EL1:
+	case TTBR1_EL1:
+	case TCR_EL1:
+	case TCR2_EL1:
+	case PIR_EL1:
+	case PIRE0_EL1:
+	case POR_EL1:
+	case ESR_EL1:
+	case AFSR0_EL1:
+	case AFSR1_EL1:
+	case FAR_EL1:
+	case MAIR_EL1:
+	case VBAR_EL1:
+	case CONTEXTIDR_EL1:
+	case AMAIR_EL1:
+	case CNTKCTL_EL1:
+	case ELR_EL1:
+	case SPSR_EL1:
+	case ZCR_EL1:
+	case SCTLR2_EL1:
+		/*
+		 * EL1 registers which have an ELx2 mapping are loaded if
+		 * we're not in hypervisor context.
+		 */
+		return is_hyp_ctxt(vcpu) ? SR_LOC_MEMORY : SR_LOC_LOADED;
+
+	case TPIDR_EL0:
+	case TPIDRRO_EL0:
+	case TPIDR_EL1:
+	case PAR_EL1:
+	case DACR32_EL2:
+	case IFSR32_EL2:
+	case DBGVCR32_EL2:
+		/* These registers are always loaded, no matter what */
+		return SR_LOC_LOADED;
+
+	default:
+		/* Non-mapped EL2 registers are by definition in memory. */
+		return SR_LOC_MEMORY;
 	}
+}
 
-#define MAPPED_EL2_SYSREG(el2, el1, fn)					\
-	case el2: {							\
-		*xlate = fn;						\
-		*el1r = el1;						\
-		return true;						\
+static void locate_mapped_el2_register(const struct kvm_vcpu *vcpu,
+				       enum vcpu_sysreg reg,
+				       enum vcpu_sysreg map_reg,
+				       u64 (*xlate)(u64),
+				       struct sr_loc *loc)
+{
+	if (!is_hyp_ctxt(vcpu)) {
+		loc->loc = SR_LOC_MEMORY;
+		return;
 	}
 
-static bool get_el2_to_el1_mapping(unsigned int reg,
-				   unsigned int *el1r, u64 (**xlate)(u64))
+	loc->loc = SR_LOC_LOADED | SR_LOC_MAPPED;
+	loc->map_reg = map_reg;
+
+	WARN_ON(locate_direct_register(vcpu, map_reg) != SR_LOC_MEMORY);
+
+	if (xlate != NULL && !vcpu_el2_e2h_is_set(vcpu)) {
+		loc->loc |= SR_LOC_XLATED;
+		loc->xlate = xlate;
+	}
+}
+
+#define MAPPED_EL2_SYSREG(r, m, t)					\
+	case r:	{							\
+		locate_mapped_el2_register(vcpu, r, m, t, loc);		\
+		break;							\
+	}
+
+static void locate_register(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg,
+			    struct sr_loc *loc)
 {
+	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU)) {
+		loc->loc = SR_LOC_MEMORY;
+		return;
+	}
+
 	switch (reg) {
-		PURE_EL2_SYSREG(  VPIDR_EL2	);
-		PURE_EL2_SYSREG(  VMPIDR_EL2	);
-		PURE_EL2_SYSREG(  ACTLR_EL2	);
-		PURE_EL2_SYSREG(  HCR_EL2	);
-		PURE_EL2_SYSREG(  MDCR_EL2	);
-		PURE_EL2_SYSREG(  HSTR_EL2	);
-		PURE_EL2_SYSREG(  HACR_EL2	);
-		PURE_EL2_SYSREG(  VTTBR_EL2	);
-		PURE_EL2_SYSREG(  VTCR_EL2	);
-		PURE_EL2_SYSREG(  TPIDR_EL2	);
-		PURE_EL2_SYSREG(  HPFAR_EL2	);
-		PURE_EL2_SYSREG(  HCRX_EL2	);
-		PURE_EL2_SYSREG(  HFGRTR_EL2	);
-		PURE_EL2_SYSREG(  HFGWTR_EL2	);
-		PURE_EL2_SYSREG(  HFGITR_EL2	);
-		PURE_EL2_SYSREG(  HDFGRTR_EL2	);
-		PURE_EL2_SYSREG(  HDFGWTR_EL2	);
-		PURE_EL2_SYSREG(  HAFGRTR_EL2	);
-		PURE_EL2_SYSREG(  CNTVOFF_EL2	);
-		PURE_EL2_SYSREG(  CNTHCTL_EL2	);
 		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
 				  translate_sctlr_el2_to_sctlr_el1	     );
 		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
@@ -144,125 +206,113 @@ static bool get_el2_to_el1_mapping(unsigned int reg,
 		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
 		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
 		MAPPED_EL2_SYSREG(SCTLR2_EL2,  SCTLR2_EL1,  NULL	     );
+	case CNTHCTL_EL2:
+		/* CNTHCTL_EL2 is super special, until we support NV2.1 */
+		loc->loc = ((is_hyp_ctxt(vcpu) && vcpu_el2_e2h_is_set(vcpu)) ?
+			    SR_LOC_SPECIAL : SR_LOC_MEMORY);
+		break;
 	default:
-		return false;
+		loc->loc = locate_direct_register(vcpu, reg);
 	}
 }
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
+u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, enum vcpu_sysreg reg)
 {
-	u64 val = 0x8badf00d8badf00d;
-	u64 (*xlate)(u64) = NULL;
-	unsigned int el1r;
+	struct sr_loc loc = {};
+
+	locate_register(vcpu, reg, &loc);
+
+	WARN_ON_ONCE(!has_vhe() && loc.loc != SR_LOC_MEMORY);
 
-	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
-		goto memory_read;
+	if (loc.loc & SR_LOC_SPECIAL) {
+		u64 val;
 
-	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
-		if (!is_hyp_ctxt(vcpu))
-			goto memory_read;
+		WARN_ON_ONCE(loc.loc & ~SR_LOC_SPECIAL);
 
 		/*
-		 * CNTHCTL_EL2 requires some special treatment to
-		 * account for the bits that can be set via CNTKCTL_EL1.
+		 * CNTHCTL_EL2 requires some special treatment to account
+		 * for the bits that can be set via CNTKCTL_EL1 when E2H==1.
 		 */
 		switch (reg) {
 		case CNTHCTL_EL2:
-			if (vcpu_el2_e2h_is_set(vcpu)) {
-				val = read_sysreg_el1(SYS_CNTKCTL);
-				val &= CNTKCTL_VALID_BITS;
-				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
-				return val;
-			}
-			break;
+			val = read_sysreg_el1(SYS_CNTKCTL);
+			val &= CNTKCTL_VALID_BITS;
+			val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
+			return val;
+		default:
+			WARN_ON_ONCE(1);
 		}
+	}
 
-		/*
-		 * If this register does not have an EL1 counterpart,
-		 * then read the stored EL2 version.
-		 */
-		if (reg == el1r)
-			goto memory_read;
+	if (loc.loc & SR_LOC_LOADED) {
+		enum vcpu_sysreg map_reg = reg;
+		u64 val = 0x8badf00d8badf00d;
 
-		/*
-		 * If we have a non-VHE guest and that the sysreg
-		 * requires translation to be used at EL1, use the
-		 * in-memory copy instead.
-		 */
-		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
-			goto memory_read;
+		if (loc.loc & SR_LOC_MAPPED)
+			map_reg = loc.map_reg;
 
-		/* Get the current version of the EL1 counterpart. */
-		WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
-		if (reg >= __SANITISED_REG_START__)
-			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
+		if (!(loc.loc & SR_LOC_XLATED) &&
+		    __vcpu_read_sys_reg_from_cpu(map_reg, &val)) {
+			if (reg >= __SANITISED_REG_START__)
+				val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
 
-		return val;
+			return val;
+		}
 	}
 
-	/* EL1 register can't be on the CPU if the guest is in vEL2. */
-	if (unlikely(is_hyp_ctxt(vcpu)))
-		goto memory_read;
-
-	if (__vcpu_read_sys_reg_from_cpu(reg, &val))
-		return val;
-
-memory_read:
 	return __vcpu_sys_reg(vcpu, reg);
 }
 
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
+void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, enum vcpu_sysreg reg)
 {
-	u64 (*xlate)(u64) = NULL;
-	unsigned int el1r;
+	struct sr_loc loc = {};
 
-	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
-		goto memory_write;
+	locate_register(vcpu, reg, &loc);
 
-	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
-		if (!is_hyp_ctxt(vcpu))
-			goto memory_write;
+	WARN_ON_ONCE(!has_vhe() && loc.loc != SR_LOC_MEMORY);
 
-		/*
-		 * Always store a copy of the write to memory to avoid having
-		 * to reverse-translate virtual EL2 system registers for a
-		 * non-VHE guest hypervisor.
-		 */
-		__vcpu_assign_sys_reg(vcpu, reg, val);
+	if (loc.loc & SR_LOC_SPECIAL) {
+
+		WARN_ON_ONCE(loc.loc & ~SR_LOC_SPECIAL);
 
 		switch (reg) {
 		case CNTHCTL_EL2:
 			/*
-			 * If E2H=0, CNHTCTL_EL2 is a pure shadow register.
-			 * Otherwise, some of the bits are backed by
+			 * If E2H=1, some of the bits are backed by
 			 * CNTKCTL_EL1, while the rest is kept in memory.
 			 * Yes, this is fun stuff.
 			 */
-			if (vcpu_el2_e2h_is_set(vcpu))
-				write_sysreg_el1(val, SYS_CNTKCTL);
-			return;
+			write_sysreg_el1(val, SYS_CNTKCTL);
+			break;
+		default:
+			WARN_ON_ONCE(1);
 		}
+	}
 
-		/* No EL1 counterpart? We're done here.? */
-		if (reg == el1r)
-			return;
+	if (loc.loc & SR_LOC_LOADED) {
+		enum vcpu_sysreg map_reg = reg;
+		u64 xlated_val;
 
-		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
-			val = xlate(val);
+		if (reg >= __SANITISED_REG_START__)
+			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
 
-		/* Redirect this to the EL1 version of the register. */
-		WARN_ON(!__vcpu_write_sys_reg_to_cpu(val, el1r));
-		return;
-	}
+		if (loc.loc & SR_LOC_MAPPED)
+			map_reg = loc.map_reg;
 
-	/* EL1 register can't be on the CPU if the guest is in vEL2. */
-	if (unlikely(is_hyp_ctxt(vcpu)))
-		goto memory_write;
+		if (loc.loc & SR_LOC_XLATED)
+			xlated_val = loc.xlate(val);
+		else
+			xlated_val = val;
 
-	if (__vcpu_write_sys_reg_to_cpu(val, reg))
-		return;
+		__vcpu_write_sys_reg_to_cpu(xlated_val, map_reg);
+
+		/*
+		 * Fall through to write the backing store anyway, which
+		 * allows translated registers to be directly read without a
+		 * reverse translation.
+		 */
+	}
 
-memory_write:
 	__vcpu_assign_sys_reg(vcpu, reg, val);
 }
 
-- 
2.39.2


