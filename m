Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467FEC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EecAzkOhCoqqI3KjOokMtIlls95vzl/Hz9UlTDFSOes=; b=TvdZ5UE83qKtqrPypqYIfeFcH1
	ubpz/+RgXbyoiRJ591OK0NTcCpuHkPQZGwM3PRFPjp/jGcAKUND1DxTY2YLKYnPjRllqCU0EShORT
	pmRIGioX1WVcuf6p6Z3X2qIpB54wgW/lz4VG3kW8nrZfA6Kgg5j9MIH1b9IUtMWfh/aoM+S9Q/mvU
	ol+SH+Q8v49uGuIPjWR8lPzpgW0lNFptAMwHPOpjRE4nwqOyiq6mDBxtmcD8zrhVNy2YkPL6dmDiO
	SK7D8Pt6ffyLqBsKNDV57EIDp7ggkunmvjVkgLCx0JWG7gH5ZTsUc8nvQtFGbc91ukJfKJz1xcjEh
	EpHbEIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxu-0000000BX8f-3sAO;
	Thu, 24 Sep 2026 16:06:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxe-0000000BWxA-0HbT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:06:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C08771E8D;
	Thu, 24 Sep 2026 09:06:09 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49B003F86C;
	Thu, 24 Sep 2026 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265973; bh=n7yz3W9kIeBZupUqbrSWGGV1frVjZNOBUu35dpOGsW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ag2masPkvZvyDP1TmM+xdPRFyN5L/1Y1gFz+h/8n8gGQMFGChtjAUw+S78JoQRC9e
	 /8DRQe21byPh9MdIVJjRWyKeG3jXw8ILnsMs4tBLMuTpxXX4GRkEWrpjSNbTuJ8sKS
	 B227iVBMt41jm6DYSIZG5gwjRItM3B6PaA18cWfI=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v20 12/22] KVM: arm64: Abstract out memory abort handling
Date: Thu, 24 Sep 2026 17:04:54 +0100
Message-ID: <20260924160504.853911-13-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090614_223064_786D9796 
X-CRM114-Status: GOOD (  14.28  )
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

Move the memory abort handling under VM specific s2 operation.

Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v19:
 - Drop local variable ret and directly return from if..else for kvm_vm_mem_abort
Changes since v18:
 - Ensure vm_mem_abort handler is always !NULL
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 35 ++++++++++++++++++-------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f01df02dabfe1..871f503e9f164 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -156,6 +156,7 @@ struct kvm_vcpu_ops {
 };
 
 struct kvm_gfn_range;
+struct kvm_s2_fault_desc;
 
 struct kvm_vm_s2_ops {
 	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
@@ -166,6 +167,7 @@ struct kvm_vm_s2_ops {
 	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start, u64 size,
 				      bool may_block);
+	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
 };
 
 struct kvm_s2_mmu {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8fe7178c40bec..8e092efdf0825 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1743,7 +1743,7 @@ struct kvm_s2_fault_vma_info {
 	bool		map_non_cacheable;
 };
 
-static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int protected_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
@@ -2181,6 +2181,20 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
 }
 
+static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+
+	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
+			!kvm_is_write_fault(vcpu) &&
+			!kvm_vcpu_trap_is_exec_fault(vcpu));
+
+	if (kvm_slot_has_gmem(s2fd->memslot))
+		return gmem_abort(s2fd);
+	else
+		return user_mem_abort(s2fd);
+}
+
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
@@ -2450,19 +2464,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.hva		= hva,
 	};
 
-	if (kvm_vm_is_protected(kvm)) {
-		ret = pkvm_mem_abort(&s2fd);
-	} else {
-		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
-				!write_fault &&
-				!kvm_vcpu_trap_is_exec_fault(vcpu));
-
-		if (kvm_slot_has_gmem(memslot))
-			ret = gmem_abort(&s2fd);
-		else
-			ret = user_mem_abort(&s2fd);
-	}
-
+	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
 	if (ret == 0)
 		ret = 1;
 out:
@@ -2857,6 +2859,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
 	 * .vm_test_age_gfn
 	 * .vm_stage2_unmap_range
 	 */
+	.vm_mem_abort			= protected_vm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
@@ -2865,6 +2868,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
@@ -2873,6 +2877,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 #define KVM_VM_S2_OPS(flavor, ops)		\
@@ -2889,7 +2894,7 @@ static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
 	BUILD_BUG_ON(ARRAY_SIZE(arm64_vm_s2_ops) != VM_FLAVOR_MAX);
 
 	kvm->arch.vm_s2_ops = arm64_vm_s2_ops[kvm->arch.vm_flavor];
-	if (WARN_ON(!kvm->arch.vm_s2_ops))
+	if (WARN_ON(!kvm->arch.vm_s2_ops || !kvm->arch.vm_s2_ops->vm_mem_abort))
 		return -EINVAL;
 	return 0;
 }
-- 
2.43.0


