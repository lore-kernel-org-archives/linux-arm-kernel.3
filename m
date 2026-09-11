Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EEBC88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrvthM192H7TgvATVDgXq7IKWv0MGgITyRXj6Nx8F38=; b=lLw3SmKfVGALfj1F4f94cfiEvC
	/FaNOKVSLtXSiNAJG6X74AR0IFm1buDJ0McMEeBwz4Zm8IQKJ3OkWt8vB6FQDc6TiaX5pTj25zXpP
	KLhQLO0xeaRPHWORabrl3+QwR4+E837VfiEFGrrzauZX++stnbqXz/pdsu2/RYcbJhR+cA7UWrdE4
	yhAh3QavDzf6G1umSHY1o/NoY1dWhuZr/DZw3TPpTM3rR5VoV/nxwIvUQhlXNIk1jcaA/WnZ68t7L
	+W48QgVrrUgyA0xXT6b25+x/jilSAq/W2zt6n0FcWO99GnlAt7mhEbCSUUWyV0MQO3WV6UJMJWzZp
	q5ZmmxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x541C-0000000HCUf-0S4h;
	Fri, 11 Sep 2026 16:22:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x541B-0000000HCTs-1Bxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 16:22:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82C5860202;
	Fri, 11 Sep 2026 16:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 185931F00893;
	Fri, 11 Sep 2026 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789143744;
	bh=IrvthM192H7TgvATVDgXq7IKWv0MGgITyRXj6Nx8F38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bm/eehmLssjt6kaKcdOtbsmAEA/xj5CkCkxi/0Pjxr5SjpFbmTAUhm++WBDYOkEbI
	 Kv/HyEUtefToXKttAhcvqlojBToFDGQoyZRCG1+cRtPB8PKLzEk9zhIc3pJyaWEaci
	 0mrljmYEAS2XTw9D0mBGd54cKgrSWba29L5/2wdwPn4LpHSPEaeYH0/ygyOB5TLOzO
	 fkZWJpVNc2a6/oTwyNyg5x4aWtUbwI/ueZGPCp6U8xBq5rTA2RxgciPxtMxXiTDTgC
	 OPmWgpeRQUDHVnQaaEVRjBWdAuYon7uDzhX+A4y8ZA8NURQrdXJIgCIh017R9pm61d
	 NkgDVJMXF4dyg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x5418-00000007qRK-16TA;
	Fri, 11 Sep 2026 16:22:22 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	ljs@kernel.org,
	Shen Yongchao <grayhat@foxmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] KVM: arm64: nv: Fix life cycle of the nested_mmus array
Date: Fri, 11 Sep 2026 17:22:02 +0100
Message-ID: <20260911162203.1919330-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911162203.1919330-1-maz@kernel.org>
References: <20260911162203.1919330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, ljs@kernel.org, grayhat@foxmail.com, kmehltretter@gmail.com, weilin.chang@arm.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The nested_mmus array holds the shadow page tables that are used when
a guest is running a nested context. These structures are allocated on
VCPU_INIT for whole guest, which implies that they may have to be
relocated as the array grows.

Should a VCPU_INIT occur whilst a vcpu is actively running an L2 and
that the allocation requires relocation, that vcpu will still be
running with a pointer to the previous structure, which will have been
freed.

Fix this by turning the array of structures to an array of pointers,
which is now allocated at VM creation, sized to the absolute maximum
that KVM can handle.

In turn, each VCPU_INIT contributes S2_MMU_PER_VCPU to the pool. No
reallocation is ever performed, and the life cycle of each object is
much clearer:

- the nested_mmus array is allocated in kvm_init_nested(), and freed
  in kvm_arch_destroy_vm()

- s2_mmu structures are allocated in kvm_vcpu_init_nested(), and freed
  on kvm_arch_flush_shadow_all()

Finally, the freeing of vcpu->arch.vncr_array is made consistent
rather than being done on some failure paths, but not others.

Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Reported-by: Shen Yongchao <grayhat@foxmail.com>
Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Suggested-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Link: https://lore.kernel.org/r/20260803224405.41468-1-kmehltretter@gmail.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/include/asm/kvm_host.h   |  2 +-
 arch/arm64/include/asm/kvm_nested.h |  2 +-
 arch/arm64/kvm/arm.c                |  8 ++-
 arch/arm64/kvm/nested.c             | 93 +++++++++++++----------------
 4 files changed, 51 insertions(+), 54 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 27fe0cd5b2d7a..cd9b9d2462f96 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -322,7 +322,7 @@ struct kvm_arch {
 	 * Stage 2 paging state for VMs with nested S2 using a virtual
 	 * VMID.
 	 */
-	struct kvm_s2_mmu *nested_mmus;
+	struct kvm_s2_mmu **nested_mmus;
 	size_t nested_mmus_size;
 	int nested_mmus_next;
 
diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 1ed7083358096..5b8edb2e8a87d 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -66,7 +66,7 @@ static inline u64 translate_ttbr0_el2_to_ttbr0_el1(u64 ttbr0)
 
 extern bool forward_smc_trap(struct kvm_vcpu *vcpu);
 extern bool forward_debug_exception(struct kvm_vcpu *vcpu);
-extern void kvm_init_nested(struct kvm *kvm);
+extern int kvm_init_nested(struct kvm *kvm);
 extern int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu);
 extern void kvm_init_nested_s2_mmu(struct kvm_s2_mmu *mmu);
 extern struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90b..b53219e048bdf 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -236,8 +236,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	mutex_unlock(&kvm->lock);
 #endif
 
-	kvm_init_nested(kvm);
-
 	ret = kvm_share_hyp(kvm, kvm + 1);
 	if (ret)
 		return ret;
@@ -252,6 +250,10 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto err_free_cpumask;
 
+	ret = kvm_init_nested(kvm);
+	if (ret)
+		goto err_uninit_mmu;
+
 	if (is_protected_kvm_enabled()) {
 		/*
 		 * If any failures occur after this is successful, make sure to
@@ -280,6 +282,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 err_uninit_mmu:
 	kvm_uninit_stage2_mmu(kvm);
+	kvfree(kvm->arch.nested_mmus);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
@@ -337,6 +340,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 
 	kvm_unshare_hyp(kvm, kvm + 1);
 
+	kvfree(kvm->arch.nested_mmus);
 	kvm_arm_teardown_hypercalls(kvm);
 }
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 3c4fc566eafc6..0a32d6bd3f6c6 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -45,11 +45,15 @@ struct vncr_tlb {
  */
 #define S2_MMU_PER_VCPU		2
 
-void kvm_init_nested(struct kvm *kvm)
+int kvm_init_nested(struct kvm *kvm)
 {
-	kvm->arch.nested_mmus = NULL;
+	kvm->arch.nested_mmus = kvmalloc_objs(struct kvm_s2_mmu *,
+					      KVM_MAX_VCPUS * S2_MMU_PER_VCPU,
+					      GFP_KERNEL_ACCOUNT);
 	kvm->arch.nested_mmus_size = 0;
 	atomic_set(&kvm->arch.vncr_tlb_count, 0);
+
+	return kvm->arch.nested_mmus ? 0 : -ENOMEM;
 }
 
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
@@ -70,8 +74,9 @@ static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
 int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
-	struct kvm_s2_mmu *tmp;
-	int num_mmus, ret = 0;
+	int num_mmus;
+
+	lockdep_assert_held(&kvm->arch.config_lock);
 
 	if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features) &&
 	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
@@ -84,51 +89,40 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	if (!vcpu->arch.ctxt.vncr_array)
 		return -ENOMEM;
 
-	/*
-	 * Let's treat memory allocation failures as benign: If we fail to
-	 * allocate anything, return an error and keep the allocated array
-	 * alive. Userspace may try to recover by initializing the vcpu
-	 * again, and there is no reason to affect the whole VM for this.
-	 */
 	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
 
 	if (num_mmus > kvm->arch.nested_mmus_size) {
-		tmp = kvzalloc_objs(*tmp, num_mmus, GFP_KERNEL_ACCOUNT);
+		struct kvm_s2_mmu *tmp;
+		int i, ret = 0;
+
+		tmp = kvzalloc_objs(*tmp, S2_MMU_PER_VCPU, GFP_KERNEL_ACCOUNT);
 		if (!tmp)
-			return -ENOMEM;
+			ret = -ENOMEM;
 
-		write_lock(&kvm->mmu_lock);
-
-		if (kvm->arch.nested_mmus_size) {
-			memcpy(tmp, kvm->arch.nested_mmus,
-			       size_mul(sizeof(*tmp), kvm->arch.nested_mmus_size));
-
-			for (int i = 0; i < kvm->arch.nested_mmus_size; i++)
-				tmp[i].pgt->mmu = &tmp[i];
+		for (i = 0; !ret && i < S2_MMU_PER_VCPU; i++) {
+			ret = init_nested_s2_mmu(kvm, &tmp[i]);
+			if (ret)
+				break;
 		}
 
-		swap(kvm->arch.nested_mmus, tmp);
+		if (ret) {
+			while (--i >= 0)
+				kvm_free_stage2_pgd(&tmp[i]);
 
-		write_unlock(&kvm->mmu_lock);
+			kvfree(tmp);
+			free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
+			vcpu->arch.ctxt.vncr_array = NULL;
+			return ret;
+		}
 
-		kvfree(tmp);
+		guard(write_lock)(&kvm->mmu_lock);
+
+		for (i = 0; i < S2_MMU_PER_VCPU; i++)
+			kvm->arch.nested_mmus[i + kvm->arch.nested_mmus_size] = &tmp[i];
+
+		kvm->arch.nested_mmus_size += S2_MMU_PER_VCPU;
 	}
 
-	for (int i = kvm->arch.nested_mmus_size; !ret && i < num_mmus; i++)
-		ret = init_nested_s2_mmu(kvm, &kvm->arch.nested_mmus[i]);
-
-	if (ret) {
-		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
-			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
-
-		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
-		vcpu->arch.ctxt.vncr_array = NULL;
-
-		return ret;
-	}
-
-	kvm->arch.nested_mmus_size = num_mmus;
-
 	return 0;
 }
 
@@ -742,7 +736,7 @@ void kvm_s2_mmu_iterate_by_vmid(struct kvm *kvm, u16 vmid,
 	write_lock(&kvm->mmu_lock);
 
 	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!kvm_s2_mmu_valid(mmu))
 			continue;
@@ -784,7 +778,7 @@ struct kvm_s2_mmu *lookup_s2_mmu(struct kvm_vcpu *vcpu)
 	 *   if S2 translation is disabled.
 	 */
 	for (int i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!kvm_s2_mmu_valid(mmu))
 			continue;
@@ -823,7 +817,7 @@ static struct kvm_s2_mmu *get_s2_mmu_nested(struct kvm_vcpu *vcpu)
 	for (i = kvm->arch.nested_mmus_next;
 	     i < (kvm->arch.nested_mmus_size + kvm->arch.nested_mmus_next);
 	     i++) {
-		s2_mmu = &kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
+		s2_mmu = kvm->arch.nested_mmus[i % kvm->arch.nested_mmus_size];
 
 		if (atomic_read(&s2_mmu->refcnt) == 0)
 			break;
@@ -1270,7 +1264,7 @@ void kvm_nested_s2_wp(struct kvm *kvm)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_wp_range(mmu, 0, kvm_phys_size(mmu));
@@ -1289,7 +1283,7 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
@@ -1308,7 +1302,7 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 		return;
 
 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (kvm_s2_mmu_valid(mmu))
 			kvm_stage2_flush_range(mmu, 0, kvm_phys_size(mmu));
@@ -1317,16 +1311,15 @@ void kvm_nested_s2_flush(struct kvm *kvm)
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
-	int i;
-
-	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
-		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
+	for (int i = kvm->arch.nested_mmus_size - 1; i >= 0; i--) {
+		struct kvm_s2_mmu *mmu = kvm->arch.nested_mmus[i];
 
 		if (!WARN_ON(atomic_read(&mmu->refcnt)))
 			kvm_free_stage2_pgd(mmu);
+
+		if ((i % S2_MMU_PER_VCPU) == 0)
+			kvfree(mmu);
 	}
-	kvfree(kvm->arch.nested_mmus);
-	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
 	kvm_uninit_stage2_mmu(kvm);
 }
-- 
2.47.3


