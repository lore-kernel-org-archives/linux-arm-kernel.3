Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xp1zjjKlRyu7OeI85BmdvXt9FXn5O9rwflXgJOcpd9Y=; b=V0LxDANF7jpO660Ada9F2yOasg
	NQaqKmWhriXO21pCEbosCmkfgoO2Xd5umbZs/LOCYfMsYoLzMZvbw47XuEAXLmMqFXCSkVXznZt7w
	b9Po26+aXIP6tkz+AD23al7tWr0jIzzrGR31pvD9XhjhqmX7XkSsa4OJnSdJslrV/3BWD0o/z8aJh
	4mGlZhgOYek8BhIQc7/u1t9JRToMxnFQxJdNp4s79T6QDAnDFE2Y+gl33GYhHySoIn1M6V8e6VM/L
	bONAA/prPK8aY6J1xerDjOHi1T+zN28g/FosmHmbz7ydlwOIH20be3A6FWyG1CpIpfPvV+cmzEoOI
	FPZz1qdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnkz-00000006lPA-3S43;
	Mon, 20 Jul 2026 13:10:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnkx-00000006lNm-1Cb1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:10:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F882B;
	Mon, 20 Jul 2026 06:09:55 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B73C3F86F;
	Mon, 20 Jul 2026 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784553000; bh=ujjbezLno00klbmmHLicIgWQKFr/PqCA3hYANkZ/eLc=;
	h=From:To:Cc:Subject:Date:From;
	b=cdYQvFKX9MRkyR23YiNgOG3tdvObkXRIzEzoswMK4BBaA+afm9e5Rh7sRByZaI9hs
	 1HYxpI4dQQ8DAaMW+GwEKxO04kPwxbbqCp0EK2tam41qrFtzI51qrgk96CN6WQNq3i
	 Qxxsexe7t5OUNBH374KwXxEDT6ilXtfKdnjuZNww=
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
	fuad.tabba@linux.dev
Subject: [PATCH v2] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
Date: Mon, 20 Jul 2026 14:09:42 +0100
Message-ID: <20260720130942.135033-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_061003_496428_D92BCF66 
X-CRM114-Status: GOOD (  23.40  )
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
enabled, and by reject MTE when guest_memfd-backed memslots are already
present.

Fixes: 32e200bd6e44 ("KVM: arm64: Enable support for guest_memfd backed memory")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

v1 can be found at [1].

Changes in v2:

* Added the Fixes tag (Fuad)
* Split the condition in kvm_arch_prepare_memory_region() (Fuad)
* Added the check in kvm_vm_ioctl_enable_cap() (Fuad)

Tested by using Fuad's patches to add guest_memfd support for kvmtool at [2],
with the following changes:

	diff --git a/arm64/kvm.c b/arm64/kvm.c
	index 36b3284e4a92..de83b5d7e517 100644
	--- a/arm64/kvm.c
	+++ b/arm64/kvm.c
	@@ -125,10 +125,12 @@ static void kvm__arch_enable_mte(struct kvm *kvm)
			return;
		}

	+       /*
		if (kvm->cfg.arch.guest_memfd) {
			pr_debug("MTE is incompatible with guest_memfd");
			return;
		}
	+       */

		if (kvm->cfg.arch.mte_disabled) {
			pr_debug("MTE disabled by user");
	diff --git a/kvm.c b/kvm.c
	index 96583f916442..cc8628b558ea 100644
	--- a/kvm.c
	+++ b/kvm.c
	@@ -332,8 +332,15 @@ int kvm__register_mem(struct kvm *kvm, u64 guest_phys, u64 size,
					.guest_memfd_offset     = guest_memfd_offset,
				};

	+                       if (munmap(userspace_addr, size) < 0)
	+                               die_perror("munmap hack");
	+
				ret = ioctl(kvm->vm_fd, KVM_SET_USER_MEMORY_REGION2,
					    &mem2);
	+
	+                       if (mmap(userspace_addr, size, PROT_RW, MAP_SHARED | MAP_FIXED,
	+                           guest_memfd, guest_memfd_offset) == MAP_FAILED)
	+                               die_perror("mmap hack");
			} else {
				struct kvm_userspace_memory_region mem = {
					.slot                   = slot,

(indentation is weird on purpose so git doesn't get confused). That's to
test that the user can create a guest_memfd memslot after MTE has been
enabled for the VM. Without this patch, I was able to create a VM with MTE
and guest_memfd backed ram (the guest reported MTE as enabled, but I didn't
test that it actually worked). With this patch, creating a VM with MTE is
rejected.

To test that KVM rejects enabling MTE *after* creating a guest_memfd backed
memslot, I modified kvmtool to enable MTE *after* creating the memslot.
Same situation: without this patch, KVM allows that, with this patch, KVM
rejects enabling MTE.

[1] https://lore.kernel.org/kvmarm/20260714110756.116950-1-alexandru.elisei@arm.com/
[2] https://lore.kernel.org/kvmarm/20260712142536.1391557-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/arm.c | 25 +++++++++++++++++++------
 arch/arm64/kvm/mmu.c |  4 ++++
 2 files changed, 23 insertions(+), 6 deletions(-)

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


