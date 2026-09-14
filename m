Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC4DC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ephBT7Ms4ZBAJjep/I2F/htnPClPVQpebuoaPNEXZb4=; b=GvDWLUdNCzMm/aEeH0dHuIuRfX
	EHYzDxSWF7uVoiyHcb7JY86jHzRC/3uCW5cdhEKxCQM5untU00kGhYYY1ExJFWy8qLkPdfqMDDaXF
	aGmUL96r7SjVKm6+VktuFGXT6e7zhERBOFTRW/Nd6v1cv8taqYCsDlliTUEgnz0Q/lrv7DsDb8RhI
	BWW/vQ0R6lVTGsVBK1f9vE6iP5IrrDY8AIpwXcTN0gljjo69oVOxi7Fa/dgnIt0GPGPaD7vi6fZyt
	KPxkiZ8ZhACiVmj+E8F9izvZabCKd6G1sxZ0ggxyyAiiZ7uK/6SGxKw+bdNKhJp/yRel9YwMvlBTP
	7WgOy7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mP-00000003XqN-3fgc;
	Mon, 14 Sep 2026 12:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mN-00000003Xog-37XN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:27:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E9F741343;
	Mon, 14 Sep 2026 12:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CED1F000FF;
	Mon, 14 Sep 2026 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388843;
	bh=ephBT7Ms4ZBAJjep/I2F/htnPClPVQpebuoaPNEXZb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VT91QDfE2BE1TM7B+x0FJjzqg6aZFfbRzXR+MFJitGKNOFlD5wtaONuroPHf5lfyH
	 nKtK3YzJ/wLUUh2SAL/Fh1zWB6PdbzQKxMSp37MzhNh4trxPcxvjSWzMa25jR7/8Wp
	 ehfHY2lbbYt7SH+CRBpd3pp9xaRPDHJJeApbFQlh4j8gvbgTfxgCVMxVpqyxOorU9Y
	 m3aAz3XvCt7WN8XMlJAsgQh1GAzwY6R8FqtleCqr1Mq6EcX2Xke6tPj5r8s3G3HH6O
	 G7SBV/82HngjxUiRtGNJrfY927GwrG7aIwVpCwMFBekPSScMpGa7Rl3njZPSEkPTM4
	 8QgusD7c3TFmg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:19 +0100
Subject: [PATCH v2 08/13] KVM: arm64: Pass walk flags to
 kvm_pgtable_get_leaf()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-8-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5556; i=ljs@kernel.org;
 h=from:subject:message-id; bh=gnm60rg2wPySPU/+erDKmBvXy87LcivmTZpZyB37QFA=;
 b=kA0DAAoWz53NioHifxQByyZiAGqn5/Wg7ynwQorQwEyvD9T3MBQbe8zX88kxmp7R9m9IVvqmG
 Yh1BAAWCgAdFiEE5/QXv1IUVp6J0E9Gz53NioHifxQFAmqn5/UACgkQz53NioHifxSgbwD+ITy+
 jbun0GGJMR7jRBBSZrGP2hqcngvchJQ22FiEsGkA/R4yVLn0+fLOJ9IabHGooa3zm8+sWj5MNLl
 TsW2KbUIC
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

From: Jack Thomson <jackabt@amazon.com>

Allow callers of kvm_pgtable_get_leaf() to specify the page-table walk
flags, in preparation for performing walks under the MMU read lock.

Reading a stage-2 leaf while only holding the read lock requires
KVM_PGTABLE_WALK_SHARED: parallel faults (which also only hold the read
lock) can unlink table pages and free them via RCU, so the walker must
be inside an RCU read-side critical section, which the shared walk flag
provides via kvm_pgtable_walk_begin().

All existing callers either hold the write lock, walk with interrupts
disabled, or run at hyp where shared walks are rejected; they keep the
current behaviour by passing no flags.

No functional change intended.

Signed-off-by: Jack Thomson <jackabt@amazon.com>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h  |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 10 +++++-----
 arch/arm64/kvm/hyp/pgtable.c          |  5 +++--
 arch/arm64/kvm/mmu.c                  |  2 +-
 arch/arm64/kvm/nested.c               |  2 +-
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..d0167f7dfbee 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -859,6 +859,8 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * @addr:	Input address for the start of the walk.
  * @ptep:	Pointer to storage for the retrieved PTE.
  * @level:	Pointer to storage for the level of the retrieved PTE.
+ * @flags:	Flags to control the page-table walk
+ *		(see struct kvm_pgtable_visit_ctx).
  *
  * The offset of @addr within a page is ignored.
  *
@@ -869,7 +871,8 @@ int kvm_pgtable_walk(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
-			 kvm_pte_t *ptep, s8 *level);
+			 kvm_pte_t *ptep, s8 *level,
+			 enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_pte_prot() - Retrieve the protection attributes of a
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c..23a57312b981 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -532,7 +532,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 	int ret;
 
 	hyp_assert_lock_held(&host_mmu.lock);
-	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level, 0);
 	if (ret)
 		return ret;
 
@@ -910,7 +910,7 @@ static int get_valid_guest_pte(struct pkvm_hyp_vm *vm, u64 ipa, kvm_pte_t *ptep,
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		return ret;
 	if (guest_pte_is_poisoned(pte))
@@ -959,7 +959,7 @@ int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu)
 	ipa |= FAR_TO_FIPA_OFFSET(kvm_vcpu_get_hfar(&hyp_vcpu->vcpu));
 
 	guest_lock_component(vm);
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		goto unlock;
 
@@ -1315,7 +1315,7 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
 		return -EPERM;
 	}
 
-	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, &level, 0);
 	if (ret)
 		return ret;
 
@@ -1544,7 +1544,7 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	s8 level;
 	int ret;
 
-	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level, 0);
 	if (ret)
 		return ret;
 	if (!kvm_pte_valid(pte))
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..347eec3957d6 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -298,12 +298,13 @@ static int leaf_walker(const struct kvm_pgtable_visit_ctx *ctx,
 }
 
 int kvm_pgtable_get_leaf(struct kvm_pgtable *pgt, u64 addr,
-			 kvm_pte_t *ptep, s8 *level)
+			 kvm_pte_t *ptep, s8 *level,
+			 enum kvm_pgtable_walk_flags flags)
 {
 	struct leaf_walk_data data;
 	struct kvm_pgtable_walker walker = {
 		.cb	= leaf_walker,
-		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.flags	= flags | KVM_PGTABLE_WALK_LEAF,
 		.arg	= &data,
 	};
 	int ret;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index eae085a622ff..9c922b498adb 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -866,7 +866,7 @@ static int get_user_mapping_size(struct kvm *kvm, u64 addr)
 	 * IPI-ing threads).
 	 */
 	local_irq_save(flags);
-	ret = kvm_pgtable_get_leaf(&pgt, addr, &pte, &level);
+	ret = kvm_pgtable_get_leaf(&pgt, addr, &pte, &level, 0);
 	local_irq_restore(flags);
 
 	if (ret)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 17123f0b6dab..3488d5ad225b 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -654,7 +654,7 @@ static u8 get_guest_mapping_ttl(struct kvm_s2_mmu *mmu, u64 addr)
 		return 0;
 
 	tmp &= ~(sz - 1);
-	if (kvm_pgtable_get_leaf(mmu->pgt, tmp, &pte, NULL))
+	if (kvm_pgtable_get_leaf(mmu->pgt, tmp, &pte, NULL, 0))
 		goto again;
 	if (!(pte & PTE_VALID))
 		goto again;

-- 
2.55.0


