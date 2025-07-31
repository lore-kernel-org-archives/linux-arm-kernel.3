Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7807CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOUpQzKtFZYeNywfqlT/YzIj7U1gzFp8S5SCwF5sOXg=; b=folfIpWM/ROJV8iVacZFtuk7sB
	bMBlyxhBEK/VjOGYT7V2TNcSrPGinI63zR4P5H3w/a5A5T0qTLaCQqyPfQrTDGPMnbQJ9/O874/Wo
	VGYBkpbprcA/s2BkDU9MmLEugH5mTOGAMMyFCLPNjI4TzYtqF/dpVQZ+ilMsBnAZqsP5TsKNYCaHv
	sxYQyPxDCgyk/55fAtMYgcQ8pLJuwcimdQqed5UbxgJF8lLS595kFDvanqVHQ0yAqTzhi/LV6sVZ+
	b824sG/ogw5wyFV37KlIbw9r562YLx2gRLOuvG+sL+mrt4gmiDTndaHnhxM51oBAkClJM9vFpiC6U
	6MMhv4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaRj-00000004Q8N-3bOO;
	Thu, 31 Jul 2025 21:04:15 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhaMa-00000004PNj-3TRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 20:58:58 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b31ff607527so154225a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 13:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753995535; x=1754600335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOUpQzKtFZYeNywfqlT/YzIj7U1gzFp8S5SCwF5sOXg=;
        b=ZUlowxb1GRpbPOLhbAQvaabuRPPVLXORVkKOXjIZMQAxGTQKBuCq5D8oKaNKY1fBat
         QFh346YSe/ScuI0knY1rZwvjpra0+4IRt652CwCKB27qVzp91y0xCIQOktTYtjK97zvp
         7azH8zYuPy9Jz9zvdnb5zRLAFpu69bDMjpIoO81noq9jaDCJrMLFWXsQj4x0eHuQkvdq
         dbXLpC94wqeqZxTtTLIz7ttiI7QUcy0BKM+eSEW349G/HbCCEDw4gK5/ysnU1Am/njnn
         BAa4OSVfG/Zctd9pYacXeO0SG+eCTX5yrqmIeGagELkodpoNNotUbQ5MEHt8oIXowQ1n
         wwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995535; x=1754600335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOUpQzKtFZYeNywfqlT/YzIj7U1gzFp8S5SCwF5sOXg=;
        b=YjlQ0UZTGFpV/f/XgPRpAxNScwwd1IrUHHpicS/dPbS2YPj5wGlebLuq+AEQQkw+0Z
         IHd8+I8mhlYNWnDKlDOqPMr/VDJm0PEbspN+N8FXlBx9WaSHbqO3qJGbWnx4RgztBrd9
         Eb6ODVJ+XI2zoCCl6y/CgsZ4wkYBDJruNhRAynBwvwgV2i/bIDCIYecYkl1U7yd2W3TJ
         EtmCMiCAWlNCweSLlVEPLeCK48/cwsIdPBpI/2m152ET1cAijoBG5+d609SOda2eL8cq
         RSjDYBMy48YCQpjioPkJRMhv9I/bhyoUDv5E+T+aWx+a8ryVgHrWfPEO8PsEFsL0SL77
         QPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAsy6l5xk5N8xy7OKy79FIFlQkvL1VdTiRW9qqpLD6eQEaEn7msRrCVqyc38NIIy/4+hxL9+OEC0p8DCM7wGV3@lists.infradead.org
X-Gm-Message-State: AOJu0YzGhI4A25skogNHddl3kD/rUapvzgPHE09Z5TArhN8Fwews40ac
	877b2BL7txYgkLUvcxYc+7rCxaJHvjuzi5pBanPXGhvS1yJ6JMRDEvilxorUYKCkJ5057h0GHYO
	bbg/fIfqhF0J3sQ==
X-Google-Smtp-Source: AGHT+IFYBd0n/6m6Ox1Nv0VY06rvT/P3u/kIBdHylp6A2OvXCXAjXPjyyd0PyslE+N1LWREbAdmRywkwsgANvQ==
X-Received: from plbu12.prod.google.com ([2002:a17:902:e20c:b0:240:801d:1089])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5cd:b0:240:678c:d2b7 with SMTP id d9443c01a7336-24096ab6fc1mr124071855ad.15.1753995535319;
 Thu, 31 Jul 2025 13:58:55 -0700 (PDT)
Date: Thu, 31 Jul 2025 20:58:42 +0000
In-Reply-To: <20250731205844.1346839-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250731205844.1346839-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250731205844.1346839-2-jiaqiyan@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: VM exit to userspace to handle SEA
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_135856_878602_BD5315E0 
X-CRM114-Status: GOOD (  24.66  )
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

When APEI fails to handle a stage-2 synchronous external abort (SEA),
today KVM directly injects an async SError to the VCPU then resumes it,
which usually results in unpleasant guest kernel panic.

One major situation of guest SEA is when vCPU consumes recoverable
uncorrected memory error (UER). Although SError and guest kernel panic
effectively stops the propagation of corrupted memory, guest may
re-use the corrupted memory if auto-rebooted; in worse case, guest
boot may run into poisoned memory. So there is room to recover from
an UER in a more graceful manner.

Alternatively KVM can redirect the synchronous SEA event to VMM to
- Reduce blast radius if possible. VMM can inject a SEA to VCPU via
  KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
  consumption or fault is not from guest kernel, blast radius can be
  limited to the triggering thread in guest userspace, so VM can
  keep running.
- Allow VMM to protect from future memory poison consumption by
  unmapping the page from stage-2, or to interrupt guest of the
  poisoned page so guest kernel can unmap it from stage-1 page table.
- Allow VMM to track SEA events that VM customers care about, to restart
  VM when certain number of distinct poison events have happened,
  to provide observability to customers in log management UI.

Introduce an userspace-visible feature to enable VMM handle SEA:
- KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
  when host APEI fails to claim a SEA, userspace can opt in this new
  capability to let KVM exit to userspace during SEA if it is not
  owned by host.
- KVM_EXIT_ARM_SEA. A new exit reason is introduced for this.
  KVM fills kvm_run.arm_sea with as much as possible information about
  the SEA, enabling VMM to emulate SEA to guest by itself.
  - Sanitized ESR_EL2. The general rule is to keep only the bits
    useful for userspace and relevant to guest memory.
  - Flags indicating if faulting guest physical address is valid.
  - Faulting guest physical and virtual addresses if valid.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
Co-developed-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h |  2 +
 arch/arm64/kvm/arm.c              |  5 +++
 arch/arm64/kvm/mmu.c              | 68 ++++++++++++++++++++++++++++++-
 include/uapi/linux/kvm.h          | 10 +++++
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index d373d555a69ba..8b4133a5aacf3 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -349,6 +349,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_GUEST_HAS_SVE			9
 	/* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace */
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
+	/* Unhandled SEAs are taken to userspace */
+#define KVM_ARCH_FLAG_EXIT_SEA				11
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7a1a8210ff918..aec6034db1e75 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -133,6 +133,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		}
 		mutex_unlock(&kvm->lock);
 		break;
+	case KVM_CAP_ARM_SEA_TO_USER:
+		r = 0;
+		set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
+		break;
 	default:
 		break;
 	}
@@ -322,6 +326,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_COUNTER_OFFSET:
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
+	case KVM_CAP_ARM_SEA_TO_USER:
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9a45daf817bfd..f6a545700c15b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1812,8 +1812,48 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
+/*
+ * Returns true if the SEA should be handled locally within KVM if the abort
+ * is caused by a kernel memory allocation (e.g. stage-2 table memory).
+ */
+static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
+{
+	/*
+	 * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any external abort
+	 * taken from a guest EL to EL2 is due to a host-imposed access (e.g.
+	 * stage-2 PTW).
+	 */
+	if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
+		return true;
+
+	/* KVM owns the VNCR when the vCPU isn't in a nested context. */
+	if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
+		return true;
+
+	/*
+	 * Determine if an external abort during a table walk happened at
+	 * stage-2 is only possible when S1PTW is set. Otherwise, since KVM
+	 * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. accessing the
+	 * PA of the stage-1 descriptor) can reach here and are reported
+	 * with a TTW ESR value.
+	 */
+	return (esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW));
+}
+
 int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
 {
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_run *run = vcpu->run;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+	u64 esr_mask = ESR_ELx_EC_MASK	|
+		       ESR_ELx_IL	|
+		       ESR_ELx_FnV	|
+		       ESR_ELx_EA	|
+		       ESR_ELx_CM	|
+		       ESR_ELx_WNR	|
+		       ESR_ELx_FSC;
+	u64 ipa;
+
 	/*
 	 * Give APEI the opportunity to claim the abort before handling it
 	 * within KVM. apei_claim_sea() expects to be called with IRQs enabled.
@@ -1822,7 +1862,33 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
 	if (apei_claim_sea(NULL) == 0)
 		return 1;
 
-	return kvm_inject_serror(vcpu);
+	if (host_owns_sea(vcpu, esr) ||
+	    !test_bit(KVM_ARCH_FLAG_EXIT_SEA, &vcpu->kvm->arch.flags))
+		return kvm_inject_serror(vcpu);
+
+	/* ESR_ELx.SET is RES0 when FEAT_RAS isn't implemented. */
+	if (kvm_has_ras(kvm))
+		esr_mask |= ESR_ELx_SET_MASK;
+
+	/*
+	 * Exit to userspace, and provide faulting guest virtual and physical
+	 * addresses in case userspace wants to emulate SEA to guest by
+	 * writing to FAR_ELx and HPFAR_ELx registers.
+	 */
+	memset(&run->arm_sea, 0, sizeof(run->arm_sea));
+	run->exit_reason = KVM_EXIT_ARM_SEA;
+	run->arm_sea.esr = esr & esr_mask;
+
+	if (!(esr & ESR_ELx_FnV))
+		run->arm_sea.gva = kvm_vcpu_get_hfar(vcpu);
+
+	ipa = kvm_vcpu_get_fault_ipa(vcpu);
+	if (ipa != INVALID_GPA) {
+		run->arm_sea.flags |= KVM_EXIT_ARM_SEA_FLAG_GPA_VALID;
+		run->arm_sea.gpa = ipa;
+	}
+
+	return 0;
 }
 
 /**
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e4e566ff348b0..b2cc3d74d769c 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -179,6 +179,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
 #define KVM_EXIT_TDX              40
+#define KVM_EXIT_ARM_SEA          41
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -469,6 +470,14 @@ struct kvm_run {
 				} get_tdvmcall_info;
 			};
 		} tdx;
+		/* KVM_EXIT_ARM_SEA */
+		struct {
+#define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID	(1ULL << 0)
+			__u64 flags;
+			__u64 esr;
+			__u64 gva;
+			__u64 gpa;
+		} arm_sea;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
@@ -957,6 +966,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
+#define KVM_CAP_ARM_SEA_TO_USER 244
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.50.1.565.gc32cd1483b-goog


