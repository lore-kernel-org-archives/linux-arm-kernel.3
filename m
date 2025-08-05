Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BECC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/+XkiqvBzvapi3yOUWtc5Bg9kT+RR/Ed2qjFdnuifo=; b=BmUOqhQiIIcIS813T42XE4qDx/
	ueelOYteU6oZZTBbmK647IbZiBSD6ZLSITMfX0+iuMgS/afeXKLyUNvEiTjS1fkjj+MaaoDUkXU8a
	/IO55SgktC9ZpLDLj67UBKG25j2oWOgaD/3cQ9lLRBmsFG+oJRVutzPQe/rggsxfl5YHd3RuqHUdy
	JfSeH89KZyqZu/AX6b3re+kXYSROuxE8zRdlvnV3E6ohgBdekw3JimkmXoCHmNUAUm329xPKxmcfI
	gcQ8m/uY040tj1uOIQBTxpqndtt6c6/aPC0T06QJJdu2pPW9KwikTd/TSX4mklWCOe0Y/ahg0LfDO
	IkLMguVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJRy-0000000D7wS-201O;
	Tue, 05 Aug 2025 15:19:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI9O-0000000CuOX-2WTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:56:24 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-459db6e35c3so15292105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Aug 2025 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754402181; x=1755006981; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/+XkiqvBzvapi3yOUWtc5Bg9kT+RR/Ed2qjFdnuifo=;
        b=K5Ufebo6kwYyUo9IBtOePv57hQWfwwD9i+g/PIzFS2fMHK+T00i6a61lxRbgq65eCL
         HT/JX49I97BQPgrZRdvL6bDtgvP2oVfj9T+EI+pg6Bj+THvFmDqmTS7EciC4yxMz7fKJ
         saom7St+zMAK4IpzUiB3KC2FqqivfE/HLDRvZYJu+xNsmwjr1keQaMS9BuMEiwALBKfG
         XUwbbHVVGAveJxDITZ9ZKjodo/+5yJ703+SIj42KtLhssxL24tqQoCqidb8SQ+S9Z0ha
         hF96Qe/SJWcpr2hlua8oBX8sjPdCxN/DU7XDSLbmbU3ZWvi7uW3hHYMK1Y2RAnKdflek
         MQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754402181; x=1755006981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/+XkiqvBzvapi3yOUWtc5Bg9kT+RR/Ed2qjFdnuifo=;
        b=RNrv02qvmogtTlFdjs6rN58hffZK0Jw9J9IsOIEVZQEf70kKSS14QHpDs0em5KaGdT
         BAo6YYqDSTIvqZpQQLc/RTbelvzMAlSW9P98fL8kYq4eCHxBq97aclPgNxrKOUhFZKKt
         cJdAFFpbmY+cbhGVR86aSKpzshGQajyCjpnk7hW2dcgqUbGlzuCZRTT0nWVm1Qm8gVC8
         aWEz0QYspj+gleYSk2rZ1f71nTPCJJIeRDCPIfNz+wGPq5RhUKANbtzv/tL89OcbkEBU
         JWFCBnOL2AM3zDZZ/WjW4xSczQrOjVZ8M+Zln9WluK3RNcJ7UDr5iY5Ve5r7oZrGAdAN
         WJNg==
X-Forwarded-Encrypted: i=1; AJvYcCUcKdWvFJyokTm5TDVbuzAnr2AWCB6SBYeO6rill8BLaDNsk1fAAcISp1Rl+lLioTLnozJBF0CVG3ZYuKG6Ccec@lists.infradead.org
X-Gm-Message-State: AOJu0YzWJNYbQLqy+0k9srUuprrUmuIcl4ngRn71zYwFEbp7aBgU6lz6
	ADvC/yOyqx7ExPk1WIwADpvD/s7+aqxztP8dgeXiuz5xT0rnSq3vA+VMYqgftW/PYmySEhl/5Nu
	FYA==
X-Google-Smtp-Source: AGHT+IEnkUwWUQIj5Is4bmO6r5zlPbUQ+asl34vYCe291J25ZxKnc2d/Peq3TKonzCNUheRsGZwnaRN4ow==
X-Received: from wmbel18.prod.google.com ([2002:a05:600c:3e12:b0:459:df20:248e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6304:b0:456:214f:f78d
 with SMTP id 5b1f17b1804b1-458b6b30434mr89045525e9.22.1754402180671; Tue, 05
 Aug 2025 06:56:20 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:56:15 +0100
In-Reply-To: <20250805135617.831971-1-tabba@google.com>
Mime-Version: 1.0
References: <20250805135617.831971-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805135617.831971-3-tabba@google.com>
Subject: [PATCH v1 2/4] KVM: arm64: Make vcpu_{read,write}_sys_reg available
 to HYP code
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065622_647969_94D83106 
X-CRM114-Status: GOOD (  24.83  )
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

Allow vcpu_{read,write}_sys_reg() to be called from EL2. This makes it
possible for hyp to use existing helper functions to access the vCPU
context.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 184 +++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h    |   3 -
 arch/arm64/kvm/sys_regs.c            | 184 ---------------------------
 3 files changed, 184 insertions(+), 187 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 0720898f563e..1f449ef4564c 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -224,6 +224,190 @@ static inline bool vcpu_is_host_el0(const struct kvm_vcpu *vcpu)
 	return is_hyp_ctxt(vcpu) && !vcpu_is_el2(vcpu);
 }
 
+#define PURE_EL2_SYSREG(el2)						\
+	case el2: {							\
+		*el1r = el2;						\
+		return true;						\
+	}
+
+#define MAPPED_EL2_SYSREG(el2, el1, fn)					\
+	case el2: {							\
+		*xlate = fn;						\
+		*el1r = el1;						\
+		return true;						\
+	}
+
+static bool get_el2_to_el1_mapping(unsigned int reg,
+				   unsigned int *el1r, u64 (**xlate)(u64))
+{
+	switch (reg) {
+		PURE_EL2_SYSREG(  VPIDR_EL2	);
+		PURE_EL2_SYSREG(  VMPIDR_EL2	);
+		PURE_EL2_SYSREG(  ACTLR_EL2	);
+		PURE_EL2_SYSREG(  HCR_EL2	);
+		PURE_EL2_SYSREG(  MDCR_EL2	);
+		PURE_EL2_SYSREG(  HSTR_EL2	);
+		PURE_EL2_SYSREG(  HACR_EL2	);
+		PURE_EL2_SYSREG(  VTTBR_EL2	);
+		PURE_EL2_SYSREG(  VTCR_EL2	);
+		PURE_EL2_SYSREG(  RVBAR_EL2	);
+		PURE_EL2_SYSREG(  TPIDR_EL2	);
+		PURE_EL2_SYSREG(  HPFAR_EL2	);
+		PURE_EL2_SYSREG(  HCRX_EL2	);
+		PURE_EL2_SYSREG(  HFGRTR_EL2	);
+		PURE_EL2_SYSREG(  HFGWTR_EL2	);
+		PURE_EL2_SYSREG(  HFGITR_EL2	);
+		PURE_EL2_SYSREG(  HDFGRTR_EL2	);
+		PURE_EL2_SYSREG(  HDFGWTR_EL2	);
+		PURE_EL2_SYSREG(  HAFGRTR_EL2	);
+		PURE_EL2_SYSREG(  CNTVOFF_EL2	);
+		PURE_EL2_SYSREG(  CNTHCTL_EL2	);
+		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
+				  translate_sctlr_el2_to_sctlr_el1	     );
+		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
+				  translate_cptr_el2_to_cpacr_el1	     );
+		MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
+				  translate_ttbr0_el2_to_ttbr0_el1	     );
+		MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(TCR_EL2,     TCR_EL1,
+				  translate_tcr_el2_to_tcr_el1		     );
+		MAPPED_EL2_SYSREG(VBAR_EL2,    VBAR_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(AFSR0_EL2,   AFSR0_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(AFSR1_EL2,   AFSR1_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(ESR_EL2,     ESR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
+		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
+		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
+		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
+		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
+	default:
+		return false;
+	}
+}
+
+static inline u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
+{
+	u64 val = 0x8badf00d8badf00d;
+	u64 (*xlate)(u64) = NULL;
+	unsigned int el1r;
+
+	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
+		goto memory_read;
+
+	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
+		if (!is_hyp_ctxt(vcpu))
+			goto memory_read;
+
+		/*
+		 * CNTHCTL_EL2 requires some special treatment to
+		 * account for the bits that can be set via CNTKCTL_EL1.
+		 */
+		switch (reg) {
+		case CNTHCTL_EL2:
+			if (vcpu_el2_e2h_is_set(vcpu)) {
+				val = read_sysreg_el1(SYS_CNTKCTL);
+				val &= CNTKCTL_VALID_BITS;
+				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
+				return val;
+			}
+			break;
+		}
+
+		/*
+		 * If this register does not have an EL1 counterpart,
+		 * then read the stored EL2 version.
+		 */
+		if (reg == el1r)
+			goto memory_read;
+
+		/*
+		 * If we have a non-VHE guest and that the sysreg
+		 * requires translation to be used at EL1, use the
+		 * in-memory copy instead.
+		 */
+		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
+			goto memory_read;
+
+		/* Get the current version of the EL1 counterpart. */
+		WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
+		if (reg >= __SANITISED_REG_START__)
+			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
+
+		return val;
+	}
+
+	/* EL1 register can't be on the CPU if the guest is in vEL2. */
+	if (unlikely(is_hyp_ctxt(vcpu)))
+		goto memory_read;
+
+	if (__vcpu_read_sys_reg_from_cpu(reg, &val))
+		return val;
+
+memory_read:
+	return __vcpu_sys_reg(vcpu, reg);
+}
+
+static inline void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
+{
+	u64 (*xlate)(u64) = NULL;
+	unsigned int el1r;
+
+	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
+		goto memory_write;
+
+	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
+		if (!is_hyp_ctxt(vcpu))
+			goto memory_write;
+
+		/*
+		 * Always store a copy of the write to memory to avoid having
+		 * to reverse-translate virtual EL2 system registers for a
+		 * non-VHE guest hypervisor.
+		 */
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+
+		switch (reg) {
+		case CNTHCTL_EL2:
+			/*
+			 * If E2H=0, CNHTCTL_EL2 is a pure shadow register.
+			 * Otherwise, some of the bits are backed by
+			 * CNTKCTL_EL1, while the rest is kept in memory.
+			 * Yes, this is fun stuff.
+			 */
+			if (vcpu_el2_e2h_is_set(vcpu))
+				write_sysreg_el1(val, SYS_CNTKCTL);
+			return;
+		}
+
+		/* No EL1 counterpart? We're done here.? */
+		if (reg == el1r)
+			return;
+
+		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
+			val = xlate(val);
+
+		/* Redirect this to the EL1 version of the register. */
+		WARN_ON(!__vcpu_write_sys_reg_to_cpu(val, el1r));
+		return;
+	}
+
+	/* EL1 register can't be on the CPU if the guest is in vEL2. */
+	if (unlikely(is_hyp_ctxt(vcpu)))
+		goto memory_write;
+
+	if (__vcpu_write_sys_reg_to_cpu(val, reg))
+		return;
+
+memory_write:
+	__vcpu_assign_sys_reg(vcpu, reg, val);
+}
+
 /*
  * The layout of SPSR for an AArch32 state is different when observed from an
  * AArch64 SPSR_ELx or an AArch32 SPSR_*. This function generates the AArch32
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3e41a880b062..1b0f9c63dc93 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1138,9 +1138,6 @@ u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *, enum vcpu_sysreg, u64);
 		__v;							\
 	})
 
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg);
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg);
-
 static inline bool __vcpu_read_sys_reg_from_cpu(int reg, u64 *val)
 {
 	/*
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c20bd6f21e60..94c46cc040ea 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -82,190 +82,6 @@ static bool write_to_read_only(struct kvm_vcpu *vcpu,
 			"sys_reg write to read-only register");
 }
 
-#define PURE_EL2_SYSREG(el2)						\
-	case el2: {							\
-		*el1r = el2;						\
-		return true;						\
-	}
-
-#define MAPPED_EL2_SYSREG(el2, el1, fn)					\
-	case el2: {							\
-		*xlate = fn;						\
-		*el1r = el1;						\
-		return true;						\
-	}
-
-static bool get_el2_to_el1_mapping(unsigned int reg,
-				   unsigned int *el1r, u64 (**xlate)(u64))
-{
-	switch (reg) {
-		PURE_EL2_SYSREG(  VPIDR_EL2	);
-		PURE_EL2_SYSREG(  VMPIDR_EL2	);
-		PURE_EL2_SYSREG(  ACTLR_EL2	);
-		PURE_EL2_SYSREG(  HCR_EL2	);
-		PURE_EL2_SYSREG(  MDCR_EL2	);
-		PURE_EL2_SYSREG(  HSTR_EL2	);
-		PURE_EL2_SYSREG(  HACR_EL2	);
-		PURE_EL2_SYSREG(  VTTBR_EL2	);
-		PURE_EL2_SYSREG(  VTCR_EL2	);
-		PURE_EL2_SYSREG(  RVBAR_EL2	);
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
-		MAPPED_EL2_SYSREG(SCTLR_EL2,   SCTLR_EL1,
-				  translate_sctlr_el2_to_sctlr_el1	     );
-		MAPPED_EL2_SYSREG(CPTR_EL2,    CPACR_EL1,
-				  translate_cptr_el2_to_cpacr_el1	     );
-		MAPPED_EL2_SYSREG(TTBR0_EL2,   TTBR0_EL1,
-				  translate_ttbr0_el2_to_ttbr0_el1	     );
-		MAPPED_EL2_SYSREG(TTBR1_EL2,   TTBR1_EL1,   NULL	     );
-		MAPPED_EL2_SYSREG(TCR_EL2,     TCR_EL1,
-				  translate_tcr_el2_to_tcr_el1		     );
-		MAPPED_EL2_SYSREG(VBAR_EL2,    VBAR_EL1,    NULL	     );
-		MAPPED_EL2_SYSREG(AFSR0_EL2,   AFSR0_EL1,   NULL	     );
-		MAPPED_EL2_SYSREG(AFSR1_EL2,   AFSR1_EL1,   NULL	     );
-		MAPPED_EL2_SYSREG(ESR_EL2,     ESR_EL1,     NULL	     );
-		MAPPED_EL2_SYSREG(FAR_EL2,     FAR_EL1,     NULL	     );
-		MAPPED_EL2_SYSREG(MAIR_EL2,    MAIR_EL1,    NULL	     );
-		MAPPED_EL2_SYSREG(TCR2_EL2,    TCR2_EL1,    NULL	     );
-		MAPPED_EL2_SYSREG(PIR_EL2,     PIR_EL1,     NULL	     );
-		MAPPED_EL2_SYSREG(PIRE0_EL2,   PIRE0_EL1,   NULL	     );
-		MAPPED_EL2_SYSREG(POR_EL2,     POR_EL1,     NULL	     );
-		MAPPED_EL2_SYSREG(AMAIR_EL2,   AMAIR_EL1,   NULL	     );
-		MAPPED_EL2_SYSREG(ELR_EL2,     ELR_EL1,	    NULL	     );
-		MAPPED_EL2_SYSREG(SPSR_EL2,    SPSR_EL1,    NULL	     );
-		MAPPED_EL2_SYSREG(ZCR_EL2,     ZCR_EL1,     NULL	     );
-		MAPPED_EL2_SYSREG(CONTEXTIDR_EL2, CONTEXTIDR_EL1, NULL	     );
-	default:
-		return false;
-	}
-}
-
-u64 vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
-{
-	u64 val = 0x8badf00d8badf00d;
-	u64 (*xlate)(u64) = NULL;
-	unsigned int el1r;
-
-	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
-		goto memory_read;
-
-	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
-		if (!is_hyp_ctxt(vcpu))
-			goto memory_read;
-
-		/*
-		 * CNTHCTL_EL2 requires some special treatment to
-		 * account for the bits that can be set via CNTKCTL_EL1.
-		 */
-		switch (reg) {
-		case CNTHCTL_EL2:
-			if (vcpu_el2_e2h_is_set(vcpu)) {
-				val = read_sysreg_el1(SYS_CNTKCTL);
-				val &= CNTKCTL_VALID_BITS;
-				val |= __vcpu_sys_reg(vcpu, reg) & ~CNTKCTL_VALID_BITS;
-				return val;
-			}
-			break;
-		}
-
-		/*
-		 * If this register does not have an EL1 counterpart,
-		 * then read the stored EL2 version.
-		 */
-		if (reg == el1r)
-			goto memory_read;
-
-		/*
-		 * If we have a non-VHE guest and that the sysreg
-		 * requires translation to be used at EL1, use the
-		 * in-memory copy instead.
-		 */
-		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
-			goto memory_read;
-
-		/* Get the current version of the EL1 counterpart. */
-		WARN_ON(!__vcpu_read_sys_reg_from_cpu(el1r, &val));
-		if (reg >= __SANITISED_REG_START__)
-			val = kvm_vcpu_apply_reg_masks(vcpu, reg, val);
-
-		return val;
-	}
-
-	/* EL1 register can't be on the CPU if the guest is in vEL2. */
-	if (unlikely(is_hyp_ctxt(vcpu)))
-		goto memory_read;
-
-	if (__vcpu_read_sys_reg_from_cpu(reg, &val))
-		return val;
-
-memory_read:
-	return __vcpu_sys_reg(vcpu, reg);
-}
-
-void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
-{
-	u64 (*xlate)(u64) = NULL;
-	unsigned int el1r;
-
-	if (!vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
-		goto memory_write;
-
-	if (unlikely(get_el2_to_el1_mapping(reg, &el1r, &xlate))) {
-		if (!is_hyp_ctxt(vcpu))
-			goto memory_write;
-
-		/*
-		 * Always store a copy of the write to memory to avoid having
-		 * to reverse-translate virtual EL2 system registers for a
-		 * non-VHE guest hypervisor.
-		 */
-		__vcpu_assign_sys_reg(vcpu, reg, val);
-
-		switch (reg) {
-		case CNTHCTL_EL2:
-			/*
-			 * If E2H=0, CNHTCTL_EL2 is a pure shadow register.
-			 * Otherwise, some of the bits are backed by
-			 * CNTKCTL_EL1, while the rest is kept in memory.
-			 * Yes, this is fun stuff.
-			 */
-			if (vcpu_el2_e2h_is_set(vcpu))
-				write_sysreg_el1(val, SYS_CNTKCTL);
-			return;
-		}
-
-		/* No EL1 counterpart? We're done here.? */
-		if (reg == el1r)
-			return;
-
-		if (!vcpu_el2_e2h_is_set(vcpu) && xlate)
-			val = xlate(val);
-
-		/* Redirect this to the EL1 version of the register. */
-		WARN_ON(!__vcpu_write_sys_reg_to_cpu(val, el1r));
-		return;
-	}
-
-	/* EL1 register can't be on the CPU if the guest is in vEL2. */
-	if (unlikely(is_hyp_ctxt(vcpu)))
-		goto memory_write;
-
-	if (__vcpu_write_sys_reg_to_cpu(val, reg))
-		return;
-
-memory_write:
-	__vcpu_assign_sys_reg(vcpu, reg, val);
-}
-
 /* CSSELR values; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
 #define CSSELR_MAX 14
 
-- 
2.50.1.565.gc32cd1483b-goog


