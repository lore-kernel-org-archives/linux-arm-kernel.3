Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B297CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa1KzTlpJw/4PwCX0xo+PChv9OvsGcXeaMqVMawBDC0=; b=3sLbc7CquITeJS8P0gw9EuOJOH
	d88cjWCutoEho7zCdVLfPjI3K2QJNk/nUvpWcJziFFPkJgj1mrm5O1Vl+wSftLjkgagMkxPYbeAkM
	6C18B6eRvXdeDkVrEV53kwoPzaIHr597eRsYuJCKFsPJ6fwd912y+U/P/7VwDkkSu6+UtOJCyEw1P
	1jDVdZqKjrTVDiWl6gDN2IqaSYU0bYdNj71M01x9g7qP63VhmrqWRj71DIhxz2EboAtsLux3Kg8FU
	PhujrbprJFmNDQLzAZRiyy8bwiLghXN0UtdcLtm12ABkQAFCx1rMzMUKgekO2LV4RsEH1Lbx2Nyd9
	UxXndO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21P-00000008wmg-2Qa7;
	Tue, 09 Sep 2025 17:20:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvz5b-00000007eid-1mL2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 14:12:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B9E86022B;
	Tue,  9 Sep 2025 14:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6180CC4CEF4;
	Tue,  9 Sep 2025 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757427172;
	bh=AX9MMeSgETU6qD9Ntz+/92wH3f8ROfXy7XhXey8zuzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/shuU2w3GDrK9uP/4gYzJi3MfUQO8VdHq0Qr4lIrT/C2DILDr/VBq4BZYyo1txz+
	 62Fj3YAYoqIqTpRCY3SUkOlz/i+aK+YyDovMendCLJkpg/ShBGLVhYcBjn/FmA8Q7/
	 vGvyY3Ywv/yDsED0SsTU/0eut0NF60qZGmyOsFhxuQzTLdCsOrfELgm7dkwpMFFovm
	 10G6sKosQ5rRg+JTy5NKVMwJw66kQyurqclErDnWao5WD0qTcbQERaNOK+ktYbCzEu
	 LYRa839E484K2LW9AXuNEC5ABQGoNAR2shXZcgdm8y5P9sCUumNMnzOyhhjXN0FpEP
	 oz5YNA1jFy4Bw==
Date: Tue, 9 Sep 2025 15:12:45 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 02/28] KVM: arm64: Donate MMIO to the hypervisor
Message-ID: <aMA13Sowq91XEqP9@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819215156.2494305-3-smostafa@google.com>
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

On Tue, Aug 19, 2025 at 09:51:30PM +0000, Mostafa Saleh wrote:
> Add a function to donate MMIO to the hypervisor so IOMMU hypervisor
> drivers can use that to protect the MMIO of IOMMU.
> The initial attempt to implement this was to have a new flag to
> "___pkvm_host_donate_hyp" to accept MMIO. However that had many problems,
> it was quite intrusive for host/hyp to check/set page state to make it
> aware of MMIO and to encode the state in the page table in that case.
> Which is called in paths that can be sensitive to performance (FFA, VMs..)
> 
> As donating MMIO is very rare, and we don’t need to encode the full state,
> it’s reasonable to have a separate function to do this.
> It will init the host s2 page table with an invalid leaf with the owner ID
> to prevent the host from mapping the page on faults.
> 
> Also, prevent kvm_pgtable_stage2_unmap() from removing owner ID from
> stage-2 PTEs, as this can be triggered from recycle logic under memory
> pressure. There is no code relying on this, as all ownership changes is
> done via kvm_pgtable_stage2_set_owner()
> 
> For error path in IOMMU drivers, add a function to donate MMIO back
> from hyp to host.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 64 +++++++++++++++++++
>  arch/arm64/kvm/hyp/pgtable.c                  |  9 +--
>  3 files changed, 68 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index 52d7ee91e18c..98e173da0f9b 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -37,6 +37,8 @@ int __pkvm_host_share_hyp(u64 pfn);
>  int __pkvm_host_unshare_hyp(u64 pfn);
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
>  int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot);
> +int __pkvm_host_donate_hyp_mmio(u64 pfn);
> +int __pkvm_hyp_donate_host_mmio(u64 pfn);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 861e448183fd..c9a15ef6b18d 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -799,6 +799,70 @@ int ___pkvm_host_donate_hyp(u64 pfn, u64 nr_pages, enum kvm_pgtable_prot prot)
>  	return ret;
>  }
>  
> +int __pkvm_host_donate_hyp_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	void *virt = __hyp_va(phys);
> +	int ret;
> +	kvm_pte_t pte;
> +
> +	host_lock_component();
> +	hyp_lock_component();
> +
> +	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +
> +	if (pte && !kvm_pte_valid(pte)) {
> +		ret = -EPERM;
> +		goto unlock;
> +	}

Shouldn't we first check that the pfn is indeed MMIO? Otherwise, testing
the pte for the ownership information isn't right.

> +	ret = kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)virt, &pte, NULL);
> +	if (ret)
> +		goto unlock;
> +	if (pte) {
> +		ret = -EBUSY;
> +		goto unlock;
> +	}
> +
> +	ret = pkvm_create_mappings_locked(virt, virt + PAGE_SIZE, PAGE_HYP_DEVICE);
> +	if (ret)
> +		goto unlock;
> +	/*
> +	 * We set HYP as the owner of the MMIO pages in the host stage-2, for:
> +	 * - host aborts: host_stage2_adjust_range() would fail for invalid non zero PTEs.
> +	 * - recycle under memory pressure: host_stage2_unmap_dev_all() would call
> +	 *   kvm_pgtable_stage2_unmap() which will not clear non zero invalid ptes (counted).
> +	 * - other MMIO donation: Would fail as we check that the PTE is valid or empty.
> +	 */
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HYP));
> +unlock:
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return ret;
> +}
> +
> +int __pkvm_hyp_donate_host_mmio(u64 pfn)
> +{
> +	u64 phys = hyp_pfn_to_phys(pfn);
> +	u64 virt = (u64)__hyp_va(phys);
> +	size_t size = PAGE_SIZE;
> +
> +	host_lock_component();
> +	hyp_lock_component();

Shouldn't we check that:

  1. pfn is mmio
  2. pfn is owned by hyp
  3. The host doesn't have something mapped at pfn already

?

> +	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
> +	WARN_ON(host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt, phys,
> +				PAGE_SIZE, &host_s2_pool, PKVM_ID_HOST));
> +	hyp_unlock_component();
> +	host_unlock_component();
> +
> +	return 0;
> +}
> +
>  int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
>  {
>  	return ___pkvm_host_donate_hyp(pfn, nr_pages, PAGE_HYP);
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index c351b4abd5db..ba06b0c21d5a 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1095,13 +1095,8 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
>  	kvm_pte_t *childp = NULL;
>  	bool need_flush = false;
>  
> -	if (!kvm_pte_valid(ctx->old)) {
> -		if (stage2_pte_is_counted(ctx->old)) {
> -			kvm_clear_pte(ctx->ptep);
> -			mm_ops->put_page(ctx->ptep);
> -		}
> -		return 0;
> -	}
> +	if (!kvm_pte_valid(ctx->old))
> +		return stage2_pte_is_counted(ctx->old) ? -EPERM : 0;

Can this code be reached for the guest? For example, if
pkvm_pgtable_stage2_destroy() runs into an MMIO-guarded pte on teardown?

Will

