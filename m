Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF17C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mrf6cN3veEepc7FHXyJjwN1P3+1BroqMx1ZIOs0+mdw=; b=KdXO+/egUuOciVHi9Zu1sDrk/0
	OYUBmCQQ0ToPMsNr322mzfFzkxhGduTkn+tLDCQkEJyT+sP4d7idNqhn+Mc3Y2pxOf4l/XZAxKKfl
	Vu44epUZcn2NrjFQpXhc4nH5KC+KnXj6MIhT6j1WjJWdSj9+m9AKlVdTRQve5WMKbxu3bwl2wsgxY
	alrP2Hr91XO8SVlMx2he6ufSrPTgM2uFO45F7EH6NsOmggnom5ozPbkMc/Pltt82vBuOTnyRUN/f4
	ysH7NlXUoVVo7gManVfNXaKOkZCk85ryxdsa7ryQh7axh++MHPvnWYCusejE/r9njZjF3gdENx6gn
	iLGfo8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSsJ-0000000BKNl-0q3L;
	Wed, 22 Jul 2026 09:04:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSsF-0000000BKMy-4ATa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:04:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E8D41595;
	Wed, 22 Jul 2026 02:04:12 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A33BF3F86F;
	Wed, 22 Jul 2026 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784711056; bh=Uy08OORctNYlnzgl0dsDXziNd6DInQRYFzqtacEn7L8=;
	h=From:To:Cc:Subject:Date:From;
	b=E/qgmAozHkMq3Ywwistu37+/zUddgE929GJtnoSOaUIk2X4IzugM1Ug+gW0kSXdmk
	 YmEQH3I7tUSa+BJfRr/22bjgaWkCVuobRrtOS9uPALNgo5uiZ9QXF1+ipXR5qBnh4K
	 Y+qO+G20HRIjtp8y/dQk4JunzzFjuKgw3zwo61+Q=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: steven.price@arm.com,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v4] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
Date: Wed, 22 Jul 2026 10:03:54 +0100
Message-ID: <20260722090354.94245-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020420_187715_A38FD45E 
X-CRM114-Status: GOOD (  19.63  )
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

The user cannot use MTE on VMAs created by mapping a guest_memfd file,
as arch_calc_vm_flag_bits() does not set VM_MTE_ALLOWED.

When creating a guest_memfd backed memslot,
kvm_arch_prepare_memory_region() rejects the memslot if MTE is enabled for
the VM and if guest_memfd has been mapped in a VMA that intersects the
memslot.

However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitly
states that the only condition for userspace_addr is for it to be a legal
userspace address, but the mapping is not required to be valid nor
populated at memslot creation.

If userspace sets userspace_addr to an address that hasn't been mapped, or
if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
file, or if the VMA doesn't intersect the memslot, memslot creation is
successful and KVM ends up with a VM with MTE and guest_memfd-backed
memslots.

The same happens if the order is reversed: when userspace enables MTE, KVM
does not check if memslots backed by guest_memfd are already present.

Fix both issues by rejecting guest_memfd-backed memslots when MTE is
enabled, and by rejecting MTE when guest_memfd-backed memslots are already
present.

Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

v3 can be found at [1].

Changes in v4:

* Fixed the wording in docs (Fuad)
* Added Reviewed-by from Fuad (thanks!)

[1] https://lore.kernel.org/kvmarm/20260721100654.476582-1-alexandru.elisei@arm.com/

 Documentation/virt/kvm/api.rst |  6 ++++++
 arch/arm64/kvm/arm.c           | 25 +++++++++++++++++++------
 arch/arm64/kvm/mmu.c           |  4 ++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a5f9ee92f43e..e3003a241d5b 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8414,6 +8414,12 @@ When this capability is enabled all memory in memslots must be mapped as
 attempts to create a memslot with an invalid mmap will result in an
 -EINVAL return.
 
+``guest_memfd``, even though it is an anonymous file, is not supported with MTE.
+Attempting to create a memslot backed by ``guest_memfd`` when the MTE capability
+is enabled, or attempting to enable the MTE capability after
+``guest_memfd``-backed memslots have been created, will result in an -EINVAL
+return.
+
 When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
 perform a bulk copy of tags to/from the guest.
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..9a6c72a18672 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -149,14 +149,27 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
 			&kvm->arch.flags);
 		break;
-	case KVM_CAP_ARM_MTE:
-		mutex_lock(&kvm->lock);
-		if (system_supports_mte() && !kvm->created_vcpus) {
-			r = 0;
-			set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
+	case KVM_CAP_ARM_MTE: {
+		struct kvm_memory_slot *memslot;
+		int bkt;
+
+		guard(mutex)(&kvm->lock);
+		if (!system_supports_mte() || kvm->created_vcpus)
+			break;
+
+		r = 0;
+		guard(mutex)(&kvm->slots_lock);
+		kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm)) {
+			if (kvm_slot_has_gmem(memslot)) {
+				r = -EINVAL;
+				break;
+			}
 		}
-		mutex_unlock(&kvm->lock);
+		if (r == 0)
+			set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
 		break;
+
+	}
 	case KVM_CAP_ARM_SYSTEM_SUSPEND:
 		r = 0;
 		set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..2d95203386ba 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2652,6 +2652,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
 		return -EINVAL;
 
+	/* guest_memfd is incompatible with MTE. */
+	if (kvm_slot_has_gmem(new) && kvm_has_mte(kvm))
+		return -EINVAL;
+
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.55.0


