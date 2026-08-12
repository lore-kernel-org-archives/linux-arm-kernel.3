Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC30BC5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc1dJgNFPhFAUKTazkqSjXkd0S7WfNcp7Fj08b74Ygg=; b=xjOONaCdUbltQXWdON9VJ3hONS
	UNv88TaBPsMiEC6bu64Nu5WftHl+41NKEcpmuVcbK4SuyLlrVjtAV8+n9+WoNN3e7DnF2sEnH3LVh
	iPANc/vagallJk0AO6w21cpAB+X7rDhS+P7Or96fO9sAQTj4H5tuPa7BCadj494PL0Omjg6kUsSu5
	eZdqlYTsus/E0TpuUzavf0YGhO7e3ZaYiB3J/3f7MCSpAU3gxOVunj3sPxkmQlmc2929XoGfUVKmD
	O07q6w2hh4iZuxYalZdU7D+I5djp8H+600WiLGhMmTcy55XAGJfQnjO5aLSAau+axuSNEB+pw3acQ
	Y1+MhLfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu93P-0000000GI9B-3eQY;
	Wed, 12 Aug 2026 13:31:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu93M-0000000GI7W-0eUV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8339543E69;
	Wed, 12 Aug 2026 13:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA47A1F000E9;
	Wed, 12 Aug 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786541491;
	bh=Xc1dJgNFPhFAUKTazkqSjXkd0S7WfNcp7Fj08b74Ygg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jYz2EhUqqsIVbliose2b7vSWVnZoG+oLWobO9XZ4zFlEN5l1mlhA2wNmhNhY1n9zc
	 eORvQj5U0+BQzyMivvh+TdOasKUKekPBHgByiPe4GYc6KrxshY1sePWlYCOYtG8HBH
	 QlA+C0lSKDzLu0FVXEJHz51VNHXFBFEkquYsvDYcJuyMRM2bnZuS/4ye9qWzgaTZWc
	 LIBTSKxLrLJZg4NBWNO/zNiVVTdHgzuQN31tdx1YOQKfpJTR9Y9jK8ZqvlQ7lAVN60
	 6SURZxSjhaHIjyVuSTBVlDYsNzYF6diZmu+0AATx/DqOwcJcmzAuVqRy0cRBNj6QKY
	 6NN842SF3E1Sg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 12 Aug 2026 14:31:21 +0100
Subject: [PATCH 2/2] KVM: arm64: nv: Fix null ptr deref in
 kvm_nested_s2_unmap() on S2 teardown
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-kvm-arm-nested-virt-fix-v1-2-4ad883f1b6a5@kernel.org>
References: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
In-Reply-To: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jintack Lim <jintack.lim@linaro.org>, 
 Christoffer Dall <christoffer.dall@linaro.org>, 
 Christoffer Dall <christoffer.dall@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ebHCoiKax54AQOHYUYR/XNV51O7qILF7crOxXBEsDN0=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJqSlcZ7/Ca21D/Ul3XJ+7ZjJVHJ7XKWh4QtxXw2/j6w
 cWDq18Ld5SyMIhxMciKKbI8/yK+P0gkbF7nBX83mDmsTCBDGLg4BWAiIe8Z/nuoKldLLp6x3Trw
 0KJUsZZDqxbfDBXfJGxw0mVO3KID114yMszZrH1i6renC1W9FHMjTm0y5bg+Z4b4oVe9omKvW9f
 aLGcFAA==
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

Commit 7270cc9157f4 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU
notifiers") introduced VNCR_EL2 invalidation in kvm_nested_s2_unmap().

However at the point of this being performed concurrent stage 2 teardown of
a nested guest can cause kvm->arch.mmu.pgt to be set to NULL.

This happens in kvm_flush_shadow_all() -> kvm_arch_flush_shadow_all() ->
kvm_free_stage2_pgd() and is performed under the kvm->mmu_lock.

Commit ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page
tables") introduced the teardown of the entire nested MMU range, which then
invokes stage2_apply_range() with resched=true:

mmu_notifier_invalidate_range_start()
  -> ... -> kvm_mmu_notifier_invalidate_range_start()
    -> kvm_mmu_unmap_gfn_range()
      -> kvm_unmap_gfn_range()
        -> kvm_nested_s2_unmap()
          -> kvm_stage2_unmap_range()
            -> __unmap_stage2_range()
                -> stage2_apply_range()

This means that stage2_apply_range() can drop the kvm->mmu_lock and thus
concurrent progress can be made in lockstep with
kvm_arch_flush_shadow_all().

If kvm_arch_flush_shadow_all() advances ahead of stage2_apply_range() and
completes its operation it guarantees a NULL pointer deref.

Since kvm_free_stage2_pgd() is performed under the kvm->mmu_lock this will
either be observed NULL or not and serialised against
kvm_free_stage2_pgd().

Resolve the issue by explicitly checking for a NULL value. Since this
shouldn't be possible if blocking is not allowed, raise a warning if it is
ever NULL in this case.

Fixes: 7270cc9157f4 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
Cc: stable@vger.kernel.org
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/nested.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 17123f0b6dab..9fc0b1696dcb 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1295,7 +1295,11 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
 	}
 
-	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
+	/* NULL pgt should only be possible if raced when mmu_lock dropped. */
+	if (kvm->arch.mmu.pgt)
+		kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
+	else
+		WARN_ON(!may_block);
 }
 
 void kvm_nested_s2_flush(struct kvm *kvm)

-- 
2.55.0


