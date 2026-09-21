Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03DEC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4+j22Brog1+PXaaEa1XEjIQnIPjANIzKmAnJ/wachvo=; b=xJD2ajCrRyA5srFVDWIQLEQMLw
	9umqArN/Y4CDGbTWv8ZXNtldL90qbldTvdTDq476SWh+NLShPE2mAwTtfmr2F0DS4K2jNJV/F8pDf
	7lVaz3n/2pEmuRlvjbxwpoyX37p8l0vbSQtHf7g3cXQj9z/o0tUkMLJO52cdNOgOj/E/KNAR29d90
	geXySBsE1RAOeRU2Y34VcV+Ar20PG1L4OGzhMw3qHe2J2mx+ucFgLzo8cHjfxtKJlKwmQDEa+huqj
	RNO6vb2j38csmYZWrN0/DOgZ8rFXuNhTJMYbTEg3xZxa74lqme5xmMS60LsEGagdcmvTlLpTAsWwV
	gRDoWo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jNn-00000003Cup-0NGI;
	Mon, 21 Sep 2026 19:08:55 +0000
Received: from out-149.mta0.migadu.com ([2001:41d0:1004:224b::95] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jNk-00000003CuM-1XAh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:08:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=byn7IcfYtNzqQNzC68nkMM9pNinh2rMmEj6DsERw1DA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790017728; v=1; x=1790622528;
 b=tX/m/a/avHXHHIsDdy9/0zS/5tSDLrVyTkM5/YNfvDD8fLoMSIDP1/YYtiMb0HLyCqMpmLZt
 XcfWVKfdhAHeh9aur7TlFO1CBVjjTY9+7e7Wcf0ycyc9Bh4yikl1UQYpk5vrgBna7Mr+n6e5hPa
 E0C40KnZnYkrAZBUuTBlYjQE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2fcc12c4d7f11f74;
	Mon, 21 Sep 2026 19:08:48 +0000
X-Mizu-Trace-ID: 2fcc12c4d7f11f74
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3] KVM: arm64: Clear the VM's feature bitmap when kvm_setup_vcpu() fails
Date: Mon, 21 Sep 2026 20:08:43 +0100
Message-Id: <20260921190843.107881-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120852_552522_84129993 
X-CRM114-Status: GOOD (  17.28  )
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

__kvm_vcpu_set_target() copies the requested features into the VM-wide
bitmap before kvm_setup_vcpu() runs and doesn't undo it when setup
fails, so a rejected KVM_ARM_VCPU_INIT leaves the VM recording features
that were never set up. With HAS_EL2 | HAS_EL2_E2H0 on a host without
FEAT_NV1, kvm_vcpu_init_nested() returns -EINVAL before it allocates any
nested stage-2 MMU, and vcpu_has_nv() is then true with
nested_mmus_size == 0; its -ENOMEM paths do the same on a VM's first
INIT.

Until one INIT has succeeded, every INIT that passes the feature check
rewrites the bitmap and a failure leaves it there; once
KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is set, kvm_vcpu_init_changed()
has already required the requested features to equal the bitmap, so
the copy is a no-op. Clear the bitmap on failure while the flag is
clear.

This showed up with the series that enables KVM_PRE_FAULT_MEMORY for
arm64, since the generic kvm_vcpu_pre_fault_memory() calls vcpu_load()
without checking that the vCPU has been initialised. After the rejected
INIT, the first call's vcpu_load() reads hw_mmu still set to the
canonical MMU and leaves it alone, but its vcpu_put() takes the
vcpu_has_nv() branch into kvm_vcpu_put_hw_mmu(), which clears hw_mmu.
The second call's vcpu_load() reads hw_mmu as NULL and takes the
nested branch into get_s2_mmu_nested(), whose search over
nested_mmus_size == 0 leaves s2_mmu NULL for the
BUG_ON(atomic_read(&s2_mmu->refcnt)), under mmu_lock. On kvmarm/next
with the series applied:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
  Call trace:
   kvm_vcpu_load_hw_mmu (arch/arm64/kvm/nested.c:891) (P)
   kvm_arch_vcpu_load (arch/arm64/kvm/arm.c:662)
   kvm_vcpu_pre_fault_memory (virt/kvm/kvm_main.c:170 virt/kvm/kvm_main.c:4349)
   kvm_vcpu_ioctl (virt/kvm/kvm_main.c:4639)

Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")
Suggested-by: Oliver Upton <oupton@kernel.org>
Link: https://lore.kernel.org/r/20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
v3:
 - Clear the bitmap on failure instead of saving and restoring it, only
   while KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is clear, since with the
   flag set the copy was a no-op (Oliver).
 - Commit message: drop the "latent, exposed by the series" framing and
   state the flag invariant behind the clear; the pre-fault crash is
   how the bug showed up.
 - Dropped Lorenzo's Reviewed-by since the code changed.

v2:
 - Commit message: say what the prefault series enables, bring the
   two-ioctl walk and the trace up from below the fold, the trace
   decoded, and drop the Fixes: on 1de10b7d13a97, which had nothing
   fallible after the copy (Lorenzo).
 - Fold Lorenzo's Reviewed-by.

Reproduced on kvmarm/next plus the series under QEMU (-cpu max with an
Apple M2 MIDR, which has_nv1() denies; kvm-arm.mode=nested):
KVM_ARM_VCPU_INIT with HAS_EL2 | HAS_EL2_E2H0 returns -EINVAL, then
KVM_PRE_FAULT_MEMORY twice. With the fix both calls return -ENOENT and
the host is unaffected. Based on kvmarm/fixes; applies cleanly to
v7.3-rc4 and to kvmarm/next.

v2: https://lore.kernel.org/r/20260921063718.1604533-1-fuad.tabba@linux.dev/
v1: https://lore.kernel.org/r/20260918120553.163139-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/arm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index eaf583b771931..bd19f64ae82ef 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1698,8 +1698,16 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
 
 	ret = kvm_setup_vcpu(vcpu);
-	if (ret)
+	if (ret) {
+		/*
+		 * Clear the bitmap if setup fails on the first vCPU to be
+		 * initialized.
+		 */
+		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
+			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
+
 		goto out_unlock;
+	}
 
 	/* Now we know what it is, we can reset it. */
 	kvm_reset_vcpu(vcpu);

base-commit: 6b1bca1b1ab77f60a62087337bfe6e2f0efb9e6d
-- 
2.39.5


