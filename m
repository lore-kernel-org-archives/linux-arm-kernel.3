Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF1DC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHeG1SyvdrKGHQb5ysxSkdvGXlCn0/i2CY3zwVay8Cc=; b=rCNGM2/gxt6Sh1BnFEdPQh4zoK
	ET3aoExYZR+J6ob92YYHmf2vZBAT5LAvuo+HsosmUYgG0xEeqzzieH2i/3tYq4pMKV4mn0XS7zwS4
	tessykJ3shY2kHgAkbSUcwua7xtK0iHBpvzToirtphOlixXtMetAIA+b0DwYo+u6N/+oL5boMxlAh
	zsqYixqGZgq4DteOahX8CLc6l3YVOcT+48A45uk7lnImK24GCZdvF0v5Xg0PEN4OK8kBEMkffFJX2
	ERMOYJKqAgyI8pkrfBxMROA+1K6gqxNO4ZxzRzON4oVaG5NEYxHcKV4EadwFIiAjCslbsPDbDNshx
	4YsjFaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SId-0000000CpRc-23Hh;
	Tue, 01 Sep 2026 17:29:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SIc-0000000CpRH-28Ro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46A774388E;
	Tue,  1 Sep 2026 17:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79871F00A3A;
	Tue,  1 Sep 2026 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283770;
	bh=KHeG1SyvdrKGHQb5ysxSkdvGXlCn0/i2CY3zwVay8Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=frdNKuQTDRxIJ6vJb9TfJRjkEv1h7/JY2wVGqrUjOvgRIt9wgsFBRJKCrVmacMr0y
	 efVyBp3S2voT/OVyszI3HTCOQ0fXk1IxrgysiBdydtpl6zyzlGDlma7NQUAgH07qGo
	 RIC4BsBvrlv7KIJNFsNLiO2f7SRNxF55k/pgYcbG3BE+lISADcIoWxLaXH7+mUmlSP
	 sZAjnWpm4hJuLP8TPaYdAG8nF9rnhYTgDjrUiWtf9w6duPyb5C4xg4PgfbvbUXorVM
	 0tmc/lVe4YDvY5EomxZzkeVWPBe20HmGnVII28fUk/7RtyEk7+ptUof/SbxCc3E4SA
	 D88L0ZOuDADUg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 01 Sep 2026 18:28:59 +0100
Subject: [PATCH v3 1/2] KVM: arm64: Fix spurious warning for benign stage 2
 teardown race
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-kvm-arm-nested-virt-fix-v3-1-b154676f7e4c@kernel.org>
References: <20260901-kvm-arm-nested-virt-fix-v3-0-b154676f7e4c@kernel.org>
In-Reply-To: <20260901-kvm-arm-nested-virt-fix-v3-0-b154676f7e4c@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Christoffer Dall <christoffer.dall@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4564; i=ljs@kernel.org;
 h=from:subject:message-id; bh=h3OZBV0hKeSIcPk6cRu0Lh3Bz/res8fdkObbkPEf5Rs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKmcxfNbmniOF42tW9Txfd2joibRfXNhS9OCGubG6fw9
 V3/2vOqo5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABM55cPwv6B3d+KhauHZrUGL
 3i0y9llnuWNJ9SauUz3hzz+9NNk4sYyRYV1yRuh1iw8xJo11byZIS/3h4lS68nBv36lrbzp6ZLX
 6+AA=
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

kvmtool was used to establish an L1 guest with 8 CPUs and 8 GiB of RAM, an
L2 guest with 4 CPUs and 4 GiB of RAM and an L3 guest with 2 CPUs and 2 GiB
of RAM, all of which was then exited.

Under memory pressure in the L0 host warnings were observed due to
migration triggered by compaction:

WARNING: arch/arm64/kvm/mmu.c:336 at __unmap_stage2_range+0x64/0x80,
CPU#5: kcompactd0/66

Which was, in turn, triggered by an MMU notifier for the host invalidation:

mmu_notifier_invalidate_range_start()
  -> ... -> kvm_mmu_notifier_invalidate_range_start()
    -> kvm_mmu_unmap_gfn_range()
      -> kvm_unmap_gfn_range()
        -> kvm_nested_s2_unmap()
          -> kvm_stage2_unmap_range()
            -> __unmap_stage2_range()
               -> stage2_apply_range()
       	       <- -EINVAL, triggering a WARN_ON()

Racing with L0's teardown of stage 2 page tables:

exit_mm()
  -> mmput()
    -> __mmput()
      -> exit_mmap()
        -> mmu_notifier_release()
	  -> ... -> kvm_mmu_notifier_release()
            -> kvm_flush_shadow_all()
              -> kvm_arch_flush_shadow_all()
	        -> kvm_free_stage2_pgd()
		  -> [ acquire kvm->mmu_lock for write ]
		  -> mmu->pgt = NULL [ among other tasks ]
		  -> [ release kvm->mmu_lock for write ]

It turns out there is a benign race resulting in a spurious warning:

	Thread A - notify: migration   | Thread B - notify: release
	-------------------------------|---------------------------------
	< kvm->mmu_lock held >         |
	stage2_apply_range()           |
	  get mmu->pgt, check !NULL    |
	  ...                          | kvm_arch_flush_shadow_all()
	  cond_resched_rwlock_write(); |   < contend, sleep kvm->mmu_lock >
	< drop kvm->mmu_lock >         |   < acquire kvm->mmu_lock>
                                       |   ...
				       |   kvm_free_stage2_pgd()
                                       |     mmu->pgt = NULL
				       |   < invalidate MMU >
				       |   ...
				       |   < release kvm->mmu_lock >
	[ scheduled ]		       |
	stage2_apply_range()           |
	  < loop to next >             |
	  get, mmu->pgt, check !NULL   |
	  is NULL, return -EINVAL      |
        __unmap_stage2_range()         |
	  WARN_ON(-EINVAL) <--- entirely spurious - the race was handled
                                 correctly.

Fix the spurious warning by updating stage2_apply_range() to no longer
treat concurrent PGT teardown on lock release as an error - whether the
walker is tearing down page tables or doing something else this is a
legitimate reason to abort the operation without error.

This keeps the warning in place for all other circumstances.

In practice only __unmap_stage2_range() actually does anything with the
error so this only impacts that.

Fixes: ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page tables")
Cc: stable@vger.kernel.org
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 9ba86450fe4a..2d44cd6a5aed 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -59,27 +59,36 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
  * long will also starve other vCPUs. We have to also make sure that the page
  * tables are not freed while we released the lock.
  */
-static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
+static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
 			      phys_addr_t end,
 			      int (*fn)(struct kvm_pgtable *, u64, u64),
 			      bool resched)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	bool lock_dropped = false;
+	phys_addr_t addr = start;
 	int ret;
 	u64 next;
 
 	do {
 		struct kvm_pgtable *pgt = mmu->pgt;
+		/*
+		 * We may be raced on PGT teardown when we release the
+		 * kvm->mmu_lock. That's fine as the PGT is legitimately no
+		 * longer present.
+		 */
 		if (!pgt)
-			return -EINVAL;
+			return lock_dropped ? 0 : -EINVAL;
 
 		next = stage2_range_addr_end(addr, end);
 		ret = fn(pgt, addr, next - addr);
 		if (ret)
 			break;
 
-		if (resched && next != end)
+		if (resched && next != end) {
 			cond_resched_rwlock_write(&kvm->mmu_lock);
+			lock_dropped = true;
+		}
 	} while (addr = next, addr != end);
 
 	return ret;

-- 
2.55.0


