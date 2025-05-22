Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F370BC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYw67xI/IKxTrtB1bSGKIPB8vOPg4OeShteV/mdzGxw=; b=qcNii+d0F7CZu1vI2m8Wlkw02c
	WZjiMm41EGrAcKq10eO5d2nMxSoTga+fgLK25go5igMH8LouJgGVcTk42BTcyAmhS6/O3QWKKNBVz
	y9dEASBKtchkTQ7PPA8FgetYtC3msC9J8oYPK7j1+ZPbC5bgLIf+7Z7L9Oyl4ABQ6FCE+/q97C196
	sOe6Il5vMf0HMyFnhnK4nx/vyNF1iJbwmE7OoqeEUe7KgVYaaOFW0QYMZZMxkXsxSk/sugzVqL0iN
	xEqKZatgirrXPGELuVUV6fqnpHIxOh5jZIdGULqHuMK1NgA6olMs0TchVRukM304YpLVLlMKmPpuY
	58AzgFqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Ps-00000001MYf-13aR;
	Thu, 22 May 2025 15:01:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI76o-00000001ICq-3vZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 14:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A1BB43B40;
	Thu, 22 May 2025 14:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF73CC4CEEB;
	Thu, 22 May 2025 14:41:19 +0000 (UTC)
Date: Thu, 22 May 2025 15:41:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	anshuman.khandual@arm.com, yang@os.amperecomputing.com,
	wangkefeng.wang@huawei.com, yangyicong@hisilicon.com,
	baohua@kernel.org, pjaroszynski@nvidia.com, ardb@kernel.org,
	david@redhat.com, Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
Message-ID: <aC83jRwPNGv0yWn_@arm.com>
References: <20250522114414.72322-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522114414.72322-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_074122_991400_5E1978B5 
X-CRM114-Status: GOOD (  19.53  )
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

On Thu, May 22, 2025 at 05:14:14PM +0530, Dev Jain wrote:
> dsb(ishst) is used to ensure that prior pagetable updates are completed.
> But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
> same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.
> 
> There were no issues observed while running mm selftests, including
> test_vmalloc.sh selftest to stress the vmalloc subsystem.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index eba1a98657f1..9b4adf1ee45e 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>  		return;
>  	}
>  
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>  	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
>  			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
>  	dsb(ish);
> @@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>  {
>  	unsigned long addr = __TLBI_VADDR(kaddr, 0);
>  
> -	dsb(ishst);
> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>  	__tlbi(vaae1is, addr);
>  	dsb(ish);
>  	isb();

What about __set_pte()? We only issue (or rather queue) a barrier if we
set a valid kernel pte. I recall we added them for the case where a TLBI
won't happen, see commit 7f0b1bf04511 ("arm64: Fix barriers used for
page table modifications"). When we clear a PTE, we rely on the TLB
maintenance to issue barriers.

Maybe something that can be optimised following Ryan's reworking but I
don't think it is safe to remove them now, given that
__set_pte_complete() skips the barriers for invalid ptes. Possibly the
__flush_tlb_kernel_pgtable() is alright but not the
flush_tlb_kernel_range() one.

-- 
Catalin

