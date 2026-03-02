Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8D1EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUCGZKFV31kvfVsTVIShtbK4EUtj1YOFeJCQlL68ZE8=; b=GaoeEc8/xqlo4+jY93FwMnLn5Z
	OeNTCXFHOcxBxI8ExdIWkDexljP2QGUqcqH/+jPUeMAJAPEhW4SCnqkS1gel36K29THAk6nm2l9XF
	aoSs58NOCFMFMKZyxjNxbQ6uIHjScXF0fLD6fFRQWVOpahY9aQGzfyKvycRTjU5G89u79NGDCsq+Q
	md+7K//oKdh0nqXaB6JFVBAG46Z8eKfs9dkB+iXtxVOHQ6KOdgcIk++UGcQ7KpZJLSt/v2Tje1K3v
	j7++gpnsOfYrmbsx/u92D+egnIFtLM7JGw7eyRryFG79eDIvWxB9E9yLOIf8436xieybAf8TrCisa
	HVWpYRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4U3-0000000DFqK-3Vyr;
	Mon, 02 Mar 2026 14:42:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4U0-0000000DFp1-3Fms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:42:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 829D81477;
	Mon,  2 Mar 2026 06:42:44 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9BBA3F694;
	Mon,  2 Mar 2026 06:42:48 -0800 (PST)
Date: Mon, 2 Mar 2026 14:42:45 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Dev Jain <dev.jain@arm.com>,
	Linu Cherian <Linu.Cherian@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/13] arm64: mm: Provide level hint for
 flush_tlb_page()
Message-ID: <aaWh5XykBfGFIObI@J2N7QTR9R3>
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
 <20260302135602.3716920-14-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302135602.3716920-14-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_064252_946635_1C2FBA94 
X-CRM114-Status: GOOD (  28.03  )
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

Hi Ryan,

On Mon, Mar 02, 2026 at 01:56:00PM +0000, Ryan Roberts wrote:
> Previously tlb invalidations issued by __flush_tlb_page() did not
> contain a level hint. But the function is clearly only ever targeting
> level 3 tlb entries and its documentation agrees:
> 
>   | this operation only invalidates a single, last-level page-table
>   | entry and therefore does not affect any walk-caches

FWIW, I'd have read "last-level" as synonymous with "leaf" (i.e. a Page
or Block entry, which is the last level of walk) rather than level 3
specifically. The architecture uses the term to match the former (e.g.
in the description of TLBI VALE1IS).

If we're tightening up __flush_tlb_page(), I think it'd be worth either
updating the comment to explicitly note that this only applies to level
3 entries, OR update the comment+name to say it applies to leaf entries,
and have it take a level parameter.

> However, it turns out that the function was actually being used to
> invalidate a level 2 mapping via flush_tlb_fix_spurious_fault_pmd(). 
> The bug was benign because the level hint was not set so the HW would
> still invalidate the PMD mapping, and also because the TLBF_NONOTIFY
> flag was set, the bounds of the mapping were never used for anything
> else.

I suspect (as above) that the current usage was intentional, legitimate
usage, just poorly documented.

> Now that we have the new and improved range-invalidation API, it is
> trival to fix flush_tlb_fix_spurious_fault_pmd() to explicitly flush the
> whole range (locally, without notification and last level only). So
> let's do that, and then update __flush_tlb_page() to hint level 3.

Do we never use __flush_tlb_page() to manipulate a level 1 block
mapping? I'd have expected we did the same lazy invalidation for
permission relazation there, but if that's not the case, then this seems
fine in principle.

> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h  | 5 +++--
>  arch/arm64/include/asm/tlbflush.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 7039931df4622..b1a96a8f2b17e 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -103,8 +103,9 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  #define flush_tlb_fix_spurious_fault(vma, address, ptep)	\
>  	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
>  
> -#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)	\
> -	__flush_tlb_page(vma, address, TLBF_NOBROADCAST | TLBF_NONOTIFY)
> +#define flush_tlb_fix_spurious_fault_pmd(vma, address, pmdp)			\
> +	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
> +			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)

Is there a reason to keep __flush_tlb_page(), rather than defining
flush_tlb_fix_spurious_fault() in terms of __flush_tlb_range() with all
the level 3 constants?

Mark.

>  
>  /*
>   * ZERO_PAGE is a global shared page that is always zero: used
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 5096ec7ab8650..958fe97b744e5 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -591,7 +591,7 @@ static inline void __flush_tlb_page(struct vm_area_struct *vma,
>  	unsigned long start = round_down(uaddr, PAGE_SIZE);
>  	unsigned long end = start + PAGE_SIZE;
>  
> -	__do_flush_tlb_range(vma, start, end, PAGE_SIZE, TLBI_TTL_UNKNOWN,
> +	__do_flush_tlb_range(vma, start, end, PAGE_SIZE, 3,
>  			     TLBF_NOWALKCACHE | flags);
>  }
>  
> -- 
> 2.43.0
> 

