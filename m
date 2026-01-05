Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F50CC79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17lMAeyopEQmSZqfzxGrSstwKGWqksFbM0BNReJoJtg=; b=GXpa5CatmlUvFjWsrBlHrQBdBc
	3lLfwc8eCGKcYlfOd0Y3+cxzcsnbpr1aS24ERB7GPE188WOKkw5DXk7j4ryCObw1huYYeUWAx2y/e
	a6GlNyLeH7CQwRhGrbbdYaLtHp7GP8ULxHgo2Xn2Z8tj5XMZiFMYiheqS4QSYfro+UpUP96mSZMh+
	/F4B96RfkZiKi8YcwRFadADBAhqxB3e8co/P//NXSYz5FK68zCXDM7UhbLPiQs7FSrE05m+wAS9P3
	0PTOOPxIr3APAp8QVkhpzmca6g1z7pwN5FJhoqvafIX2Sl6wht2lq9k83Bu4HywcqGo5BdvYfiOUT
	iC5uXjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrU-0000000Benu-2ruy;
	Mon, 05 Jan 2026 15:51:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrP-0000000Begx-2Kyb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:51:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 005D44197C;
	Mon,  5 Jan 2026 15:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F75DC116D0;
	Mon,  5 Jan 2026 15:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628270;
	bh=PIpPot3/pD5boU8yFENrmwU3G9yh83bvfpd7l2yKSuA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rSGSPNUbL2hvK9MU8TEnvyTJ6aWhN/RYDnGXpOtHAfYOGSTcMQASlCDRPAcibyOCu
	 jV9OZ/KbkhkFIVJzP5DwRLAX37KD+071ryOjOhWRFIMZO/WFoQPpyxRWXT67mH6mvw
	 70Ld7RpkfPABHlTUIP1zgKuokZAKxa52e4/2MCOYGESXVtJbvQba+OtmBCh5bZJCcb
	 HdV9Cez9epDIvhI2QGiD4JsTlInVQEHn5rRBvxnUERPeEOg5bP+Es8UPQGQbJcXX2p
	 k4577eZ5YdQgezr3x7xwS7YrofrntquU23jBJ5fZEV4jcLqJUZrFgB08oCuuZuCMjl
	 HWFVMTTBztUjQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 26/30] KVM: arm64: Allow userspace to create protected VMs when pKVM is enabled
Date: Mon,  5 Jan 2026 15:49:34 +0000
Message-ID: <20260105154939.11041-27-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075111_684399_9BAF6B9A 
X-CRM114-Status: GOOD (  19.13  )
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

Introduce a new VM type for KVM/arm64 to allow userspace to request the
creation of a "protected VM" when the host has booted with pKVM enabled.

For now, this depends on CONFIG_EXPERT and results in a taint on first
use as many aspects of a protected VM are not yet protected!

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pkvm.h |  2 +-
 arch/arm64/kvm/Kconfig            | 10 ++++++++++
 arch/arm64/kvm/arm.c              |  8 +++++++-
 arch/arm64/kvm/mmu.c              |  3 ---
 arch/arm64/kvm/pkvm.c             | 11 ++++++++++-
 include/uapi/linux/kvm.h          |  5 +++++
 6 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 5a71d25febca..507d9c53e2eb 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -16,7 +16,7 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
-int pkvm_init_host_vm(struct kvm *kvm);
+int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 4f803fd1c99a..47fa06c9da94 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -83,4 +83,14 @@ config PTDUMP_STAGE2_DEBUGFS
 
 	  If in doubt, say N.
 
+config PROTECTED_VM_UAPI
+	bool "Expose protected VMs to userspace (experimental)"
+	depends on KVM && EXPERT
+	help
+	  Say Y here to enable experimental (i.e. in development)
+	  support for creating protected virtual machines using KVM's
+	  KVM_CREATE_VM ioctl() when booted with pKVM enabled.
+
+	  Unless you are a KVM developer, say N.
+
 endif # VIRTUALIZATION
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4f80da0c0d1d..66f472774da7 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -157,6 +157,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 
+	if (type & ~KVM_VM_TYPE_ARM_MASK)
+		return -EINVAL;
+
 	mutex_init(&kvm->arch.config_lock);
 
 #ifdef CONFIG_LOCKDEP
@@ -188,9 +191,12 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 * If any failures occur after this is successful, make sure to
 		 * call __pkvm_unreserve_vm to unreserve the VM in hyp.
 		 */
-		ret = pkvm_init_host_vm(kvm);
+		ret = pkvm_init_host_vm(kvm, type);
 		if (ret)
 			goto err_free_cpumask;
+	} else if (type & KVM_VM_TYPE_ARM_PROTECTED) {
+		ret = -EINVAL;
+		goto err_free_cpumask;
 	}
 
 	kvm_vgic_early_init(kvm);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index fafedcbd516d..3c7aca86961d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -881,9 +881,6 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
 
-	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
-		return -EINVAL;
-
 	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
 		phys_shift = kvm_ipa_limit;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 14865907610c..6d6b1ef1cc62 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -219,9 +219,13 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
 	mutex_unlock(&kvm->arch.config_lock);
 }
 
-int pkvm_init_host_vm(struct kvm *kvm)
+int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
+	bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
+
+	if (protected && !IS_ENABLED(CONFIG_PROTECTED_VM_UAPI))
+		return -EINVAL;
 
 	if (pkvm_hyp_vm_is_created(kvm))
 		return -EINVAL;
@@ -236,6 +240,11 @@ int pkvm_init_host_vm(struct kvm *kvm)
 		return ret;
 
 	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.is_protected = protected;
+	if (protected) {
+		pr_warn_once("kvm: protected VMs are for development only, tainting kernel\n");
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+	}
 
 	return 0;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index dddb781b0507..9316a827a826 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -689,6 +689,11 @@ struct kvm_enable_cap {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+#define KVM_VM_TYPE_ARM_PROTECTED	(1UL << 31)
+#define KVM_VM_TYPE_ARM_MASK		(KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
+					 KVM_VM_TYPE_ARM_PROTECTED)
+
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.52.0.351.gbe84eed79e-goog


