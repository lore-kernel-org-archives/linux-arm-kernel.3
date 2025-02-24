Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A41C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDUZCmDLDiSgZx0n73bwFu472maUMAPhVK8Q/bWsAaA=; b=VYZMaYGKawVa/bbpWMR9/4hzWO
	NpRpJy0wACZZuVokq8pA/ys9Lm9uMdjSaMY34ySniOzTe7mzp88RPGMhtizHm819smcSgyM0s6Ue0
	LZAOqhG26BKNUlz1V1cGdWSvE+T24mHQaemLZ83pVmurD4Tzk5S5F4LBslG7gF5irx4DzOZpAe6Gl
	5QRfYdFN63t0srdJTnseeCwpduYvCOX+FElSpZv5E9v8jCakeUwxcuKiC7iC1M6xfZVJGqrBCdKMT
	9wPB5MsEnUDyA8Nqli1u1NcywtOqVMViqO9IlaQ/ftJ6jpo/HLJeu2ofjUzBDq2FamDvpOO3rfuyM
	uxVkZmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmV77-0000000Cz8d-3OH2;
	Mon, 24 Feb 2025 09:51:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUwI-0000000CxHB-02eE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02B695C4CEB;
	Mon, 24 Feb 2025 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D10FC4CED6;
	Mon, 24 Feb 2025 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740389988;
	bh=R+HmxPG16H8vvvu0uSUgZflbClb30RDYT9Rf/tlkZUQ=;
	h=From:To:Cc:Subject:Date:From;
	b=frWUrc+pFtazhaExLu8Sa4PymlW7J14mDrwpxHtqsB9nPfZ3ytNZFQhSPPjiyOwKS
	 znweSFBFw0i8wBai/gTKv447hgW+cXbDQ5JEmNkkCoukRvQ5VLET0yS3UsR0lLviyI
	 MEkVN76MMS5HfLFSEIw5glKfevVz++uiM+zBP1YOSMYCtYg7GQ+EQRGRJLJFYIIS9a
	 4fCe86/3O3flmYHXQHSiP7zmNnwTJ99VQJe5R0iVQVQ2FaVY94YyHRFyql2hEuxvwE
	 /g/EF9VAhvk6hiK52qHNaO3cCnqCKhXvoTZTcLuMl7lNVt1mLXQ6it4BeOqs/c0Vs2
	 fyo6Ae4NHqF6A==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [PATCH] KVM: arm64: Drop mte_allowed check during memslot creation
Date: Mon, 24 Feb 2025 15:09:38 +0530
Message-ID: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_013950_159374_8D88086B 
X-CRM114-Status: GOOD (  12.06  )
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

Before commit d89585fbb308 ("KVM: arm64: unify the tests for VMAs in
memslots when MTE is enabled"), kvm_arch_prepare_memory_region() only
rejected a memory slot if VM_SHARED was set. This commit unified the
checking with user_mem_abort(), with slots being rejected if either
VM_MTE_ALLOWED is not set or VM_SHARED set. A subsequent commit
c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings with MTE
enabled") dropped the VM_SHARED check, so we ended up with memory slots
being rejected if VM_MTE_ALLOWED is not set. This wasn't the case before
the commit d89585fbb308. The rejection of the memory slot with VM_SHARED
set was done to avoid a race condition with the test/set of the
PG_mte_tagged flag. Before Commit d77e59a8fccd ("arm64: mte: Lock a page
for MTE tag initialization") the kernel avoided allowing MTE with shared
pages, thereby preventing two tasks sharing a page from setting up the
PG_mte_tagged flag racily.

Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag
initialization") further updated the locking so that the kernel
allows VM_SHARED mapping with MTE. With this commit, we can enable
memslot creation with VM_SHARED VMA mapping.

This patch results in a minor tweak to the ABI. We now allow creating
memslots that don't have the VM_MTE_ALLOWED flag set. If the guest uses
such a memslot with Allocation Tags, the kernel will generate -EFAULT.
ie, instead of failing early, we now fail later during KVM_RUN.

This change is needed because, without it, users are not able to use MTE
with VFIO passthrough (currently the mapping is either Device or
NonCacheable for which tag access check is not applied.), as shown
below (kvmtool VMM).

[  617.921030] vfio-pci 0000:01:00.0: resetting
[  618.024719] vfio-pci 0000:01:00.0: reset done
  Error: 0000:01:00.0: failed to register region with KVM
  Warning: [0abc:aced] Error activating emulation for BAR 0
  Error: 0000:01:00.0: failed to configure regions
  Warning: Failed init: vfio__init

  Fatal: Initialisation failed

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 arch/arm64/kvm/mmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ef53af6df6de..1f1b5aa43d2d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2178,11 +2178,6 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 		if (!vma)
 			break;
 
-		if (kvm_has_mte(kvm) && !kvm_vma_mte_allowed(vma)) {
-			ret = -EINVAL;
-			break;
-		}
-
 		if (vma->vm_flags & VM_PFNMAP) {
 			/* IO region dirty page logging not allowed */
 			if (new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
-- 
2.43.0


