Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B81061B02
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Qdt2/dxQAGJ3/chFhnR6CWrtFVFdZ1alZcDzp/9wfU=; b=XW7IL8CSYFChLREylaGWNMUbV2
	Gm1n6QFzJmW5/vG/gNIQx9ACuDv8WvFAovGaV6iFZgYKlhxzEcS7qoPPZkZjJNLqVyTDPd3yD5jb3
	9YYpwohItKyWqt8SzH8Fj6Fwgbo//8CpKQbjvirn0ylzefsB5YpZFbCSA9Hm8bIZ2TVr6yz2TO+xE
	UnnaMetKFsk2dV6w+j4qeIQTXELQQo5udUziW/qPCvHEWqCMN5xrgOAUr5V7NbLrPJxPj+rE7P0Gc
	+qfpZeeQE11VME05wvORwk+d75mH2/ctqGFM8xnD1pzh5MfDczdG7TYE1cpPPkYh8Jck/aXm6Da/D
	Y1BLDElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dxc-0000000BUju-0ZrE;
	Mon, 30 Mar 2026 14:51:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dwt-0000000BUF3-1fyK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 14:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/Qdt2/dxQAGJ3/chFhnR6CWrtFVFdZ1alZcDzp/9wfU=; b=gyp8MZx6EmiceOrOFOe0mh7Ujs
	riQfvPQHh5lPJ+rsPf8LloAyddeGun7i+tN50VUJndUoQ0njSvJmrl/8j64J3pbVStYuoMEP7YC1K
	k7YR7qOBNYjgF+SeJazOxp9m5uPXt9fucxqlM6lkD5tS8GUBVEpkrnuMSAoD3edkZmSnqXuRTBT2A
	I5rXG0744SUoR9Koa/x1H3YdweQ8Lnd4ChWQ9njG8DFS2zbNtudbAsuREBZWcFg9CH9J2HPI0P+Ig
	c5zh3nNKigKCuZD3isZWGmo7rbv8H6W1hMHFd89qYs1006hncA/6RWobG77CWMOEZ4Oktw9Q8ex0N
	In4SV8Kw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dwp-0000000E7VL-2JcF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 315E443E5D;
	Mon, 30 Mar 2026 14:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A3CC4CEF7;
	Mon, 30 Mar 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882234;
	bh=URHP4fpuQ10CVPcnmjuikgvCneIlpxOtLzy8vNKTFuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LNh/9LaN6r2gsAwsbLS+7+LxIyChoVmW9ez/whCivSJfyHEnNnD+Oncu4DK1/cG+Z
	 svgFyE/Z2Hanc737dLyaBkgCbkhwxDzeA8hqhFFVCRPNrohBDr00pHT8ggQxyjDuuw
	 J7RHhEdUfTZga7hOUCAUmV/4ID0yQYFBN4GskVW/gNc+I0tE5ozZafL6PbfF7Pvq1u
	 faBd+zol3yY6KbwUIgQ+DqhoNBLvEkZ+0sm8qZS+9mAqGRsJ5UXdLM0mTijTDmwVYk
	 zrRt/CXU9uABp//+wtpArJckKlR299DJ52mu/SRYJo8/QXL4RiNbV3GuxVutu8xXkY
	 QT1WQUTtIwoEw==
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
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 31/38] KVM: arm64: Allow userspace to create protected VMs when pKVM is enabled
Date: Mon, 30 Mar 2026 15:48:32 +0100
Message-ID: <20260330144841.26181-32-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_155036_003367_1A3317E5 
X-CRM114-Status: GOOD (  17.90  )
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

For now, this feature results in a taint on first use as many aspects of
a protected VM are not yet protected!

Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 +-
 arch/arm64/kvm/arm.c              | 8 +++++++-
 arch/arm64/kvm/mmu.c              | 3 ---
 arch/arm64/kvm/pkvm.c             | 8 +++++++-
 include/uapi/linux/kvm.h          | 5 +++++
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 7041e398fb4c..2954b311128c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,7 +17,7 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
-int pkvm_init_host_vm(struct kvm *kvm);
+int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
 void pkvm_destroy_hyp_vm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3589fc08266c..c2b666a46893 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -203,6 +203,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
 
+	if (type & ~KVM_VM_TYPE_ARM_MASK)
+		return -EINVAL;
+
 	mutex_init(&kvm->arch.config_lock);
 
 #ifdef CONFIG_LOCKDEP
@@ -234,9 +237,12 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 * If any failures occur after this is successful, make sure to
 		 * call __pkvm_unreserve_vm to unreserve the VM in hyp.
 		 */
-		ret = pkvm_init_host_vm(kvm);
+		ret = pkvm_init_host_vm(kvm, type);
 		if (ret)
 			goto err_uninit_mmu;
+	} else if (type & KVM_VM_TYPE_ARM_PROTECTED) {
+		ret = -EINVAL;
+		goto err_uninit_mmu;
 	}
 
 	kvm_vgic_early_init(kvm);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6a4151e3e4a3..45358ae8a300 100644
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
index 7f35df29e984..053e4f733e4b 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -225,9 +225,10 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
 	mutex_unlock(&kvm->arch.config_lock);
 }
 
-int pkvm_init_host_vm(struct kvm *kvm)
+int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
 {
 	int ret;
+	bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
 
 	if (pkvm_hyp_vm_is_created(kvm))
 		return -EINVAL;
@@ -242,6 +243,11 @@ int pkvm_init_host_vm(struct kvm *kvm)
 		return ret;
 
 	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.is_protected = protected;
+	if (protected) {
+		pr_warn_once("kvm: protected VMs are experimental and for development only, tainting kernel\n");
+		add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+	}
 
 	return 0;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 80364d4dbebb..073b2bcaf560 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -703,6 +703,11 @@ struct kvm_enable_cap {
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
2.53.0.1018.g2bb0e51243-goog


