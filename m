Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E72610F9968
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 20:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Lvrg7160Z/M4I9yntFStuMcz07DFNixV35Czjmg9PY=; b=SNIyIgJhLyGZVGK2EGah1fcUQO
	4HYHoy3IOSh5J5In4ie/IX2cIB0ImXF/dIuBSjBacbxX4EKNN2FlRQjUKmC2sJIPZNX0hDRj6IzQ9
	vK1vOxpzL6Ms/I2b0csOKxRJ0Wwv0RrN/JENfiI9CNVewvkY5lrpIACzHtjHlpfQsKJuQ/2bVSimT
	na/JbHSn84OTmpEvg+KvNSVDTqbr4FcYdV8IDwR0faa1CjT0O0HJioYiY7u0Dq391iCY7IsJoVBun
	e5SIwAMPQWMA9m8BS2+9Hi6QbQOapWviPMPwdEei+52irJZR1oN1CY2yfgOjdQUPRlHc/gu1XAYw0
	Od+1Mazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTV-00000009Num-1Mnp;
	Wed, 08 Apr 2026 20:26:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTU-00000009Ntz-1J4h
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 20:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=3Lvrg7160Z/M4I9yntFStuMcz07DFNixV35Czjmg9PY=; b=Ss9zO2y8itQqB5aAS2t5XVa9gf
	NFByKDydRED4g2SIhty7U6tV4noYsN32/Xxc4T0Y1Z6H8PudH0+stXT9hiWu2mdlBp9fGZU85exWs
	uQvNhmVg/BSDU+x9/gNpCtww5qYMIGLRZC/70oHlwyA4dQWG+JYQl5rSlBYpxYVsqvd8DEyxmeHrl
	uDxHlYGeoX3gnSXWXbIa8kX/oRrckIg5W0kBRny6u4mK9HxGxT1Z3NGGcgnHReePl+9tllZaLA9bZ
	vrViupqrA6/TorPZj4cckih1sU3daetVlt+gTi/hNBXFyg8MFVzy5AsxKhIarlasV9FNeGSsqktw7
	9cgiGidg==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTM-0000000AmLv-2Gk8;
	Wed, 08 Apr 2026 20:26:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAZTL-00000008oxO-0Ta1;
	Wed, 08 Apr 2026 21:25:59 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 1/2] KVM: arm64: Add KVM_CAP_ARM_DISABLE_EXITS for WFI/WFE passthrough
Date: Wed,  8 Apr 2026 21:23:47 +0100
Message-ID: <20260408202557.2102476-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260408202557.2102476-1-dwmw2@infradead.org>
References: <20260408202557.2102476-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

Add a per-VM capability to allow userspace to disable WFI and/or WFE
trapping, modelled after x86's KVM_CAP_X86_DISABLE_EXITS. When the
corresponding flag is set, the trap is unconditionally cleared
regardless of the global kvm-arm.wf{i,e}_trap_policy setting.

The existing kernel command line parameters provide a system-wide
override, but a per-VM capability allows the VMM to make the decision
per guest.

This is useful for hypervisors running a combination of dedicated
pinned vCPUs which want to avoid the cost of trapping WFI/WFE, as
well as overcommitted floating instances where it is necessary.

As with the x86 equivalent, KVM_CHECK_EXTENSION returns the bitmask of
supported exit disables.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst    | 28 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h |  4 ++++
 arch/arm64/kvm/arm.c              | 20 ++++++++++++++++++++
 include/uapi/linux/kvm.h          |  6 ++++++
 4 files changed, 58 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 032516783e96..e3b3bd9edeec 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8902,6 +8902,34 @@ helpful if user space wants to emulate instructions which are not
 This capability can be enabled dynamically even if VCPUs were already
 created and are running.
 
+7.47 KVM_CAP_ARM_DISABLE_EXITS
+------------------------------
+
+:Architecture: arm64
+:Target: VM
+:Parameters: args[0] is a bitmask of exits to disable
+:Returns: 0 on success, -EINVAL if unsupported bits are set.
+
+Valid bits in args[0]:
+
+ - ``KVM_ARM_DISABLE_EXITS_WFI``: Disable trapping of WFI (Wait For
+   Interrupt) instructions. The guest WFI will execute natively instead
+   of causing a VM exit.
+
+ - ``KVM_ARM_DISABLE_EXITS_WFE``: Disable trapping of WFE (Wait For
+   Event) instructions. The guest WFE will execute natively instead of
+   causing a VM exit.
+
+When a bit is set, the corresponding trap is unconditionally cleared for
+all vCPUs in the VM, overriding the system-wide ``kvm-arm.wfi_trap_policy``
+and ``kvm-arm.wfe_trap_policy`` kernel parameters.
+
+Disabling exits is a one-way operation: once an exit type is disabled for
+a VM, it cannot be re-enabled. Calling this ioctl with args[0] = 0 is a
+no-op.
+
+``KVM_CHECK_EXTENSION`` returns the bitmask of exits that can be disabled.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 70cb9cfd760a..a1bb025c641f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -312,6 +312,10 @@ struct kvm_arch {
 	size_t nested_mmus_size;
 	int nested_mmus_next;
 
+	/* Per-VM WFI trap override; set via KVM_CAP_ARM_DISABLE_EXITS */
+	bool wfi_in_guest;
+	bool wfe_in_guest;
+
 	/* Interrupt controller */
 	struct vgic_dist	vgic;
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 410ffd41fd73..326a99fea753 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -178,6 +178,17 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		}
 		mutex_unlock(&kvm->lock);
 		break;
+	case KVM_CAP_ARM_DISABLE_EXITS:
+		if (cap->args[0] & ~KVM_ARM_DISABLE_VALID_EXITS) {
+			r = -EINVAL;
+			break;
+		}
+		if (cap->args[0] & KVM_ARM_DISABLE_EXITS_WFI)
+			kvm->arch.wfi_in_guest = true;
+		if (cap->args[0] & KVM_ARM_DISABLE_EXITS_WFE)
+			kvm->arch.wfe_in_guest = true;
+		r = 0;
+		break;
 	case KVM_CAP_ARM_SEA_TO_USER:
 		r = 0;
 		set_bit(KVM_ARCH_FLAG_EXIT_SEA, &kvm->arch.flags);
@@ -379,6 +390,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_SEA_TO_USER:
 		r = 1;
 		break;
+	case KVM_CAP_ARM_DISABLE_EXITS:
+		r = KVM_ARM_DISABLE_VALID_EXITS;
+		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
 		return KVM_GUESTDBG_VALID_MASK;
 	case KVM_CAP_ARM_SET_DEVICE_ADDR:
@@ -610,6 +624,9 @@ static void vcpu_set_pauth_traps(struct kvm_vcpu *vcpu)
 
 static bool kvm_vcpu_should_clear_twi(struct kvm_vcpu *vcpu)
 {
+	if (vcpu->kvm->arch.wfi_in_guest)
+		return true;
+
 	if (unlikely(kvm_wfi_trap_policy != KVM_WFX_NOTRAP_SINGLE_TASK))
 		return kvm_wfi_trap_policy == KVM_WFX_NOTRAP;
 
@@ -621,6 +638,9 @@ static bool kvm_vcpu_should_clear_twi(struct kvm_vcpu *vcpu)
 
 static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
 {
+	if (vcpu->kvm->arch.wfe_in_guest)
+		return true;
+
 	if (unlikely(kvm_wfe_trap_policy != KVM_WFX_NOTRAP_SINGLE_TASK))
 		return kvm_wfe_trap_policy == KVM_WFX_NOTRAP;
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 80364d4dbebb..694cf699ed0a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -669,6 +669,11 @@ struct kvm_ioeventfd {
 #define KVM_X86_DISABLE_EXITS_CSTATE         (1 << 3)
 #define KVM_X86_DISABLE_EXITS_APERFMPERF     (1 << 4)
 
+#define KVM_ARM_DISABLE_EXITS_WFI            (1 << 0)
+#define KVM_ARM_DISABLE_EXITS_WFE            (1 << 1)
+#define KVM_ARM_DISABLE_VALID_EXITS          (KVM_ARM_DISABLE_EXITS_WFI | \
+					      KVM_ARM_DISABLE_EXITS_WFE)
+
 /* for KVM_ENABLE_CAP */
 struct kvm_enable_cap {
 	/* in */
@@ -989,6 +994,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_SEA_TO_USER 245
 #define KVM_CAP_S390_USER_OPEREXEC 246
 #define KVM_CAP_S390_KEYOP 247
+#define KVM_CAP_ARM_DISABLE_EXITS 248
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.51.0


