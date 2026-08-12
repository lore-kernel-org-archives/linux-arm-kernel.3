Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF696C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 23:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SvcwiWpjNEhpKhaflOyTLzEj6AjTjQKsW6m/9WF+dE=; b=FH+1xC/czm3LIPtM77gSdCo5s+
	7Rt5WWcdqgcrZx4g43RavZ4YSN/yD/WdS6dL7M7PB8emkoyQLEfJFgexhFWYXrHByD3IfyH8iMzbL
	D842Ir+oArXz2K0adnytKvLv9xDe1PXo5SyfPrRgR91rVRSKLVG0qvszxWynXsHJSx6Zk/TJJ6eZ7
	ejVmZqqCkcELwqF0oRXLLL8tKLxXBjUENnWHUxQECJ9MKsj/ARpiJk9w7LqEs5baq9vXeiUprlOEz
	9mvV1lFexjrkw8fgn/I+aS+PJujj+N/paGr0D+uKjB0W2n+y/9nS8xeDAoRoJPOtrIv942THa9v0p
	qScjs9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIFr-0000000H8jh-2pPd;
	Wed, 12 Aug 2026 23:21:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIFm-0000000H8iN-3G2w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 23:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB31C153B;
	Wed, 12 Aug 2026 16:20:50 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F3EF3F673;
	Wed, 12 Aug 2026 16:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786576854; bh=9cBVCmEpx9hBzn7jRJeTK3dyTGjtjOtHpTN6vszWliE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoW3ci1//DXHkRt9Dyfnsa7rB03/KlQU4p5ge6kMf5EH3c4+mRRlorkvZBlxdMdPF
	 Gna60culXoDSTTM1Ak35b6yG5n60r4/O5gywUYXioXTibXc92NO3EMyWZA1Q9z+qS+
	 xN9l1cU1mckcKGXzzzbUriQIoL4jpqnlpGRYhPzM=
Date: Thu, 13 Aug 2026 00:20:43 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jintack Lim <jintack.lim@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Christoffer Dall <christoffer.dall@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Fix spurious warning for benign stage 2
 teardown race
Message-ID: <qfhlmmidzdmmsfopfhxpddgwa7nob45jwgb6sabskawaxtox7i@mnxplk3zn34k>
References: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
 <20260812-kvm-arm-nested-virt-fix-v1-1-4ad883f1b6a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-kvm-arm-nested-virt-fix-v1-1-4ad883f1b6a5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_162059_068032_76DBB978 
X-CRM114-Status: GOOD (  37.48  )
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

Hi Lorenzo,

Thanks for the detailed analysis!

I can follow what's happening from the report, but one thing I don't
get:

On Wed, Aug 12, 2026 at 02:31:20PM +0100, Lorenzo Stoakes (ARM) wrote:
> A batch of kernel warnings were triggered in the L0 host kernel when using
> kvmtool to experiment with nested virtualisation.
> 
> The issue was observed on an M2 macbook pro with 24 GiB of RAM running
> asahi linux 7.1.6-400.asahi.fc44.aarch64+16k with 16 KiB page size.
> 
> The bug is confirmed to exist in mainline and does not appear to be
> impacted by any downstream patches carried by asahi.
> 
> kvmtool was used to establish an L1 guest with 8 CPUs and 8 GiB of RAM.
> 
> kvmtool was then run again within the L1 guest to establish an L2 guest
> with 4 CPUs and 4 GiB of RAM.
> 
> Then it was run again to establish another inner guest with 2 CPUs and 2
> GiB of RAM at L3.
> 
> Both the L2 and L3 guests were then exited and another L2 guest was
> established with the same characteristics.
> 
> Sufficient memory pressure was present in the L0 host to trigger indirect
> reclaim, waking kcompactd up and triggering migration.
> 
> Shortly afterwards the L2 guest was stopped, at which point three warnings
> were observed in the L0 host in quick succession with the second and the
> third occurring 114us and 189us after the first, respectively.
> 
> In each case the call trace was the same:
> 
> WARNING: arch/arm64/kvm/mmu.c:336 at __unmap_stage2_range+0x64/0x80,
> CPU#5: kcompactd0/66
> ...
> __unmap_stage2_range (arch/arm64/kvm/mmu.c:335 (discriminator 3)) (P)
> kvm_stage2_unmap_range (arch/arm64/kvm/mmu.c:346)
> kvm_nested_s2_unmap (arch/arm64/kvm/nested.c:1168 (discriminator 14))
> kvm_unmap_gfn_range (arch/arm64/kvm/mmu.c:2416)
> kvm_mmu_notifier_invalidate_range_start (arch/arm64/kvm/../../../virt/kvm/kvm_main.c:718 ...)
> mn_hlist_invalidate_range_start (mm/mmu_notifier.c:525)
> __mmu_notifier_invalidate_range_start (mm/mmu_notifier.c:580)
> try_to_migrate_one (./include/linux/mmu_notifier.h:478 ./include/linux/mmu_notifier.h:471 mm/rmap.c:2459)
> rmap_walk_anon (mm/rmap.c:3001)
> rmap_walk (mm/rmap.c:3106 mm/rmap.c:3101)
> try_to_migrate (mm/rmap.c:2774)
> migrate_folio_unmap (mm/migrate.c:1330 (discriminator 3))
> migrate_pages_batch (mm/migrate.c:1909)
> migrate_pages_sync (mm/migrate.c:2026)
> migrate_pages (mm/migrate.c:2135)
> compact_zone (mm/compaction.c:2663)
> compact_node (mm/compaction.c:2932)
> kcompactd (mm/compaction.c:3230)
> kthread (kernel/kthread.c:436)
> ret_from_fork (arch/arm64/kernel/entry.S:858)
> 
> Analysing this:
> 
> try_to_migrate() performs the first part of migration on a folio -
> establishing migration entries in all page tables mapping it - calling
> try_to_migrate_one() for each VMA the folio is mapped in.
> 
> Immediately prior to installing the migration entry, try_to_migrate_one()
> calls mmu_notifier_invalidate_range_start() to signal to notifiers that the
> existing page table entry is about to be unmapped.
> 
> Since this range happened to contain folios used by the virtual machine
> (given its memory consumption this was highly likely to be a target) this
> in turn triggers arm64 kvm code via an MMU notifier:
> 
> mmu_notifier_invalidate_range_start()
>   -> ... -> kvm_mmu_notifier_invalidate_range_start()
>     -> kvm_mmu_unmap_gfn_range()
>       -> kvm_unmap_gfn_range()
>         -> kvm_nested_s2_unmap()
>           -> kvm_stage2_unmap_range()
>             -> __unmap_stage2_range()
>                -> stage2_apply_range()
>        	       <- -EINVAL, triggering a WARN_ON()
> 
> Since commit ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page
> tables") kvm_unmap_gfn_range() invokes kvm_nested_s2_unmap() which takes
> the rather drastic step of evicting the entirety of the stage 2 shadow page
> tables for each nested guest:
> 
> 	for (i = 0; i < kvm->arch.nested_mmus_size; i++) {
> 		struct kvm_s2_mmu *mmu = &kvm->arch.nested_mmus[i];
> 
> 		if (kvm_s2_mmu_valid(mmu))
> 			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
> 	}
> 
> This will iterate through every valid MMU.
> 
> mmu_notifier_invalidate_range_start() sets the MMU_NOTIFIER_RANGE_BLOCKABLE
> flag when signalling notifiers, so may_block is true here.
> 
> __unmap_stage2_range() wraps invocation of stage2_apply_range() in a
> WARN_ON():
> 
> 	WARN_ON(stage2_apply_range(mmu, start, end, KVM_PGT_FN(kvm_pgtable_stage2_unmap),
> 				   may_block));
> 
> Which is precisely the triggered warning and means stage2_apply_range() is
> returning an error.
> 
> In arm64 return values are stored in the x0 register and in each splat w0
> (since it's a 32-bit value) is 0xffffffea which, by two's complement, is
> -0b00010110 or -EINVAL.
> 
> The only way in which stage2_apply_range() can return an error is if either
> the passed in walk function (kvm_pgtable_stage2_unmap()) returns an error
> or mmu->pgt is NULL:
> 
> 	static int stage2_apply_range(...)
> 	{
> 		do {
> 			struct kvm_pgtable *pgt = mmu->pgt;
> 			if (!pgt)
> 				return -EINVAL;
> 
> 			next = stage2_range_addr_end(addr, end);
> 			ret = fn(pgt, addr, next - addr);
> 			if (ret)
> 				break;
> 			if (resched && next != end)
> 				cond_resched_rwlock_write(&kvm->mmu_lock);
> 		} while (addr = next, addr != end);
> 
> 		return ret;
> 	}
> 
> This loop is batched by stage2_range_addr_end() at the granularity of
> kvm_granule_size(KVM_PGTABLE_MIN_BLOCK_LEVEL), which for a 16 KiB page size
> kernel is 32 MiB.
> 
> kvm_pgtable_stage2_unmap() only returns an error if
> kvm_pgtable_walk_begin() or _kvm_pgtable_walk() return an error. On arm64
> the former doesn't ever do so, and the latter only returns -EINVAL if
> either pgd is NULL (we gate that already) or an invalid pgt->start_level is
> specified (not the case).
> 
> So the cause of the warning is that mmu->pgt is NULL here.
> 
> This field is protected by kvm->mmu_lock, but after each invocation of the
> walk function, if the end of the range has not yet been reached, the lock
> is dropped.
> 
> This is done by calling cond_resched_rwlock_write() which drops
> kvm->mmu_lock when yielding the time slice before reacquiring it upon being
> scheduled again:
> 
> 		if (resched && next != end)
> 			cond_resched_rwlock_write(&kvm->mmu_lock);
> 
> Note that resched = may_block here and is always true for these walks.
> 
> This points to something else racing this code to clearing the pgt, and
> brings us back to the observation above that the issue occurs when tearing
> down the L2 guest.
> 
> Upon L0's userspace mm_struct teardown, stage 2 mappings for IPAs mapped by
> the guest are unmapped via mmu notifier:
> 
> exit_mm()
>   -> mmput()
>     -> __mmput()
>       -> exit_mmap()
>         -> mmu_notifier_release()
> 	  -> ... -> kvm_mmu_notifier_release()
>             -> kvm_flush_shadow_all()
>               -> kvm_arch_flush_shadow_all()
> 	        -> kvm_free_stage2_pgd()
> 		  -> [ acquire kvm->mmu_lock for write ]
> 		  -> mmu->pgt = NULL [ among other tasks ]
> 		  -> [ release kvm->mmu_lock for write ]

You mentioned stopping the L2 VM only, which means L1 is still running.
Why would the L0 userspace mm_struct get torn down if L1 is still live?
What did I miss?

Thanks,
Wei-Lin Chang

[...]

