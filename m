Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902B8C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pxg7kmtHxx8VMZB3nCWU+ICPKhKa7foppWUZDKnG0xE=; b=gzd5zWi6TIHgUKzvM8e8CbxJXi
	uzrGiEXLeD4DscT9vOf7e2PETIojjYwSSnEMrrIFqH2y4kzv9pJjk4UrTAXPPGTrR3U8DSpbRb7OQ
	AzxgPqWnN9nDoNZ/FruIMwnV1ooCpDU8d3rVKj1yGyMtPxNYppP/6LEQbDrj1XRqTuf/IewkDIAWk
	1iU7A0NV2h7AdglXgWxtGDHIoZLQToSNCWETFFIaKxU/qPikNF3PE6DvWyPEkVED5ZrtxUOOOwLJ4
	YcrTe5OEimb/Sg9QsG2zQCsa2p9mw1TsZ7Ve9Xzjw58M/j+rnN9d7VSAebyR2RYUoniS9LE7/7TWm
	TeTu3Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fxe-0000000Ac8J-0ujR;
	Thu, 24 Sep 2026 09:41:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fxb-0000000Ac7u-3A7b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:41:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A5E61477;
	Thu, 24 Sep 2026 02:41:43 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32AA63F86F;
	Thu, 24 Sep 2026 02:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790242907; bh=RBX4B4bKtfjbLqikSvS1byAkRrvTM9BBDT0jb8BgzKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRYmoBMyAkTJmv8S3EwwsWOkLlqls6hnd0e5KRQ3xi4AhCDyvf7ksNzxK1XErIUAy
	 nJ+ZLXa2SkGUcatOXoY7H2SyzYg20ub6vaRxldbJeBmIDvTaJ8EN9jpTjigsokFaaQ
	 O/tGl5ZYwqC6VW0UIe2V5Q6F5Mrr2BAelwR2HdD8=
Date: Thu, 24 Sep 2026 10:41:41 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Fix the break-before-make flush range for
 erratum 2645198
Message-ID: <arTwVXOGRSI8MtAM@arm.com>
References: <20260923143636.89480-1-parri.andrea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923143636.89480-1-parri.andrea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_024147_853007_1A030A4C 
X-CRM114-Status: GOOD (  22.07  )
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

On Wed, Sep 23, 2026 at 04:36:32PM +0200, Andrea Parri wrote:
> modify_prot_start_ptes() performs the break-before-make TLB invalidation
> required by erratum 2645198 with __flush_tlb_range(), whose third
> argument is the end address of the range.  It passes nr * PAGE_SIZE
> instead of addr + nr * PAGE_SIZE, so __do_flush_tlb_range() computes the
> page count as (nr * PAGE_SIZE - addr) >> PAGE_SHIFT.
> 
> For addr > nr * PAGE_SIZE that subtraction underflows, the page count
> exceeds the batching limit and the flush degenerates to flush_tlb_mm(),
> so a single-page mprotect broadcasts an ASID-wide invalidation and a
> full-range mmu notifier call.
> 
> For addr <= nr * PAGE_SIZE only [addr, nr * PAGE_SIZE) is invalidated,
> and when the cleared batch starts below nr * PAGE_SIZE the tail is left
> in the TLB.  The workaround then no longer covers the whole batch, and
> for addr == nr * PAGE_SIZE the flush is empty.
> 
> On affected Cortex-A715 CPUs, this can corrupt ESR_ELx and FAR_ELx on the
> next instruction abort caused by a permission fault.
> 
> Pass addr + nr * PAGE_SIZE as the end address.
> 
> Fixes: 7efa1cd5f89b5 ("arm64: add batched versions of ptep_modify_prot_start/commit")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  arch/arm64/mm/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5dc..d4384131e10d8 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2295,7 +2295,7 @@ pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
>  		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
> -			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
> +			__flush_tlb_range(vma, addr, addr + nr * PAGE_SIZE,
>  					  PAGE_SIZE, 3, TLBF_NOWALKCACHE);

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

