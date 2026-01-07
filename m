Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF84CFD642
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H8gpQwI1s7Zi9ax0A0QaFOEFUuLgbrlyL5uRKTHwoI=; b=ddquacif7KjygBOuwfr0Rrmu9k
	1VxhoxXX6yoXiqOmantvp7gDlUpbhUlTp419uaJ3kNsUvtrdmsSPDm/rh0stfShzFgeDtNrHw8VXd
	dhzYvymaZNB+AIytww5Kp53a8+vWDdA//1QpV+Fk4DPpL4ZQR+j5ei5z4h7vaL73IOMBH8QBHJpnJ
	pS8587EtbOOGOmkYEgkOt/Re4f1Eyvw13ZEZSFecRe2DMXaph1KMFc7L0u0PsmDeKIjOPiANaxNo0
	NUhkEthUfd2+GCZkpd3qpZ7R/bLIk4Gu112mqqVh1a5cfNiKVnsJ9NV+Qc7rLfw0Zv4hjdWO1TiXo
	H+A5K3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUmH-0000000F77C-2nXQ;
	Wed, 07 Jan 2026 14:44:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUmD-0000000F76p-2TPw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:44:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 229F7497;
	Wed,  7 Jan 2026 06:44:36 -0800 (PST)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21E253F6A8;
	Wed,  7 Jan 2026 06:44:41 -0800 (PST)
Date: Wed, 7 Jan 2026 20:14:38 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 13/13] arm64: mm: Provide level hint for
 flush_tlb_page()
Message-ID: <aV5xVhE1sf4l0gRf@a079125.arm.com>
References: <20251216144601.2106412-1-ryan.roberts@arm.com>
 <20251216144601.2106412-14-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216144601.2106412-14-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_064445_690015_F7ADC3AB 
X-CRM114-Status: GOOD (  21.79  )
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



On Tue, Dec 16, 2025 at 02:45:58PM +0000, Ryan Roberts wrote:
> Previously tlb invalidations issued by __flush_tlb_page() did not
> contain a level hint. But the function is clearly only ever targeting
> level 3 tlb entries and its documentation agrees:
> 
>   | this operation only invalidates a single, last-level page-table
>   | entry and therefore does not affect any walk-caches
> 
> However, it turns out that the function was actually being used to
> invalidate a level 2 mapping via flush_tlb_fix_spurious_fault_pmd(). The
> bug was benign because the level hint was not set so the HW would still
> invalidate the PMD mapping, and also because the TLBF_NONOTIFY flag was
> set, the bounds of the mapping were never used for anything else.
> 
> Now that we have the new and improved range-invalidation API, it is
> trival to fix flush_tlb_fix_spurious_fault_pmd() to explicitly flush the
> whole range (locally, without notification and last level only). So
> let's do that, and then update __flush_tlb_page() to hint level 3.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h  | 5 +++--
>  arch/arm64/include/asm/tlbflush.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index b96a7ca465a1..61f57647361a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -138,8 +138,9 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
>  	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>  
> -#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
> -	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)			\
> +	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
> +			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
>  
>  /*
>   * ZERO_PAGE is a global shared page that is always zero: used
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index fa5aee990742..f24211b51df3 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -577,7 +577,7 @@ static inline void __flush_tlb_page(struct vm_area_struct *vma,
>  	unsigned long start = round_down(uaddr, PAGE_SIZE);
>  	unsigned long end = start + PAGE_SIZE;
>  
> -	___flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
> +	___flush_tlb_range(vma, start, end, PAGE_SIZE, 3,
>  			   TLBF_NOWALKCACHE | flags);
>  }


Reviewed-by: Linu Cherian <linu.cherian@arm.com>


