Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IvJKjN9K6ytbQTeJqOmyQvCBXO3iV8SIwZbwQrAn9wo=; b=Sh2J6sunz6XLfKtDcCz9sy4kne
	qj4/cZIh0Zh7J/kQiP/I/4RojvbkVgHv770/5KvLtxqx0RtMX4EDtwd68NfgE7/QV5Yo7kY7lc3DN
	p99FHOcru6jZ0x56jaR9LzAYMkNwbpn4eCtMx7OEGc/BSqQIJp8xtYvErVN3mn4mv9BGWASH7VD6+
	dxsSz1YzJUjrMCDBiY7zn07ZfiuC69lfIoTk9xx+SN9MCNYjyIwW5JVSRrXCvimW5K3lewgBfHgfg
	v1pTdiiekmn5mr8HFcZ4cOq9OjPJCHBN5scGyoYEOpSv42X78aSadOuUIHHZtzHlzMKboZVXU3CV0
	ZT7MqkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjazs-0000000BeBG-2ClK;
	Tue, 14 Jul 2026 11:08:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjazp-0000000BeAY-0fIu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:08:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4BF7497;
	Tue, 14 Jul 2026 04:08:11 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C5B13F93E;
	Tue, 14 Jul 2026 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784027296; bh=DlRcimcuxgtdW+sYVApiQq5gJS7p9R0UTH5EnebwlcI=;
	h=From:To:Cc:Subject:Date:From;
	b=KQXahb6Q+cc5EkzbyuKbTIN4Kwomg1k+tIHXgK3nfRasLrWegAxFb/fX28oBlj7nV
	 w7izbxIkYhsSoUhQx1UdVE7vM202P1Z0YdendmQJIQyjhxzEeIAohkFuyjwVyXlo9h
	 8uOMDWD3hVVnZqQAQpn8sRl2VGCpdN3IzZHIPfRE=
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
Subject: [PATCH] KVM: arm64: Reject guest_memfd memslots when the VM has MTE
Date: Tue, 14 Jul 2026 12:07:56 +0100
Message-ID: <20260714110756.116950-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_040817_276966_A3C46132 
X-CRM114-Status: GOOD (  19.34  )
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

However, the documentation for KVM_SET_USER_MEMORY_REGION2 explicitely
states that the only condition for userspace_addr is for it to be a legal
userspace address, but the mapping is not required to be valid nor
populated at memslot creation.

If userspace sets userspace_addr to an address that hasn't been mapped, or
if userspace_addr belongs to a VMA that isn't backed by the guest_memfd
file, or if the VMA doesn't intersect the memslot, memslot creation is
successful and KVM ends up with a VM with MTE and guest_memfd-backed
memslots.

Forbid guest_memfd memslots unconditionally when the VM has MTE to prevent
this from happening.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Tested by using Fuad's patches to add guest_memfd support for kvmtool at [1],
with the following changes to arm64/kvm.c:

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

and kvm.c:

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

(not pasting the full diff because last time I did, git got confused and
considered the snippet part of the actual patch).

Without this patch, I was able to create a VM with MTE and guest_memfd
backed ram (the guest reported MTE as enabled, but I didn't test that it
actually worked).

With this patch, creating a VM with MTE is rejected.

[1] https://lore.kernel.org/kvmarm/20260712142536.1391557-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/mmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..30c2ea235fa5 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2648,8 +2648,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	/*
 	 * Only support guest_memfd backed memslots with mappable memory, since
 	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 *
+	 * MTE is also not supported with guest_memfd.
 	 */
-	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
+	if (kvm_slot_has_gmem(new) &&
+	    (kvm_has_mte(kvm) || !kvm_memslot_is_gmem_only(new)))
 		return -EINVAL;
 
 	hva = new->userspace_addr;

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0


