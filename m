Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1177BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8o4xL9Xg/TVAMzLue2tOCCtzkOBZX86+LUieZdb5lY=; b=PEpqi9YYzvfLNZ9yUWAlpHoQIG
	uyfEXFJydX7QruSPGF8jdlr8/FqiRPwCsea8TianJYI88q4fPptivUz0PMYEoD3IwdcaB5OWd5HfK
	O1P7eLV9ro5ta2DPoTQQeJ+BCHzCVf0FwH0D3C3GJ2IvDNCVXo5GI1osHP2EK7tBZNLsDcawdaPYk
	YOm1W0iTBQNjCMl2FsQEJodQMPRrE0+ZkScQkbF3b774vuW9ssge7luviDEwCAcQ6HMJZjx40g4D0
	8Ogo1xr744iJRvyYZC30NYE86sDNt8hNB2owIR7RWIXElCoyGeP6eeYVhs2A1VNstTO54Nqwu7gQs
	FAe9anoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLVw-00000009BiY-1i2I;
	Fri, 07 Feb 2025 10:23:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLUY-00000009BTX-3kkq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 10:21:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 927F2113E;
	Fri,  7 Feb 2025 02:22:08 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 407113F63F;
	Fri,  7 Feb 2025 02:21:39 -0800 (PST)
Message-ID: <15660c4c-5c4d-4229-b5c5-abcabd402058@arm.com>
Date: Fri, 7 Feb 2025 15:51:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/16] mm: Don't skip arch_sync_kernel_mappings() in
 error paths
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-14-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-14-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_022146_971398_D916EBD9 
X-CRM114-Status: GOOD (  17.48  )
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



On 2/5/25 20:39, Ryan Roberts wrote:
> Fix callers that previously skipped calling arch_sync_kernel_mappings()
> if an error occurred during a pgtable update. The call is still required
> to sync any pgtable updates that may have occurred prior to hitting the
> error condition.
> 
> These are theoretical bugs discovered during code review.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 2ba3e6947aed ("mm/vmalloc: track which page-table levels were modified")
> Fixes: 0c95cba49255 ("mm: apply_to_pte_range warn and fail if a large pte is encountered")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

This change could stand on its own and LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  mm/memory.c  | 6 ++++--
>  mm/vmalloc.c | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 539c0f7c6d54..a15f7dd500ea 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3040,8 +3040,10 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_none(*pgd) && !create)
>  			continue;
> -		if (WARN_ON_ONCE(pgd_leaf(*pgd)))
> -			return -EINVAL;
> +		if (WARN_ON_ONCE(pgd_leaf(*pgd))) {
> +			err = -EINVAL;
> +			break;
> +		}
>  		if (!pgd_none(*pgd) && WARN_ON_ONCE(pgd_bad(*pgd))) {
>  			if (!create)
>  				continue;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6111ce900ec4..68950b1824d0 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -604,13 +604,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  			mask |= PGTBL_PGD_MODIFIED;
>  		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
>  		if (err)
> -			return err;
> +			break;
>  	} while (pgd++, addr = next, addr != end);
>  
>  	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
>  		arch_sync_kernel_mappings(start, end);
>  
> -	return 0;
> +	return err;
>  }
>  
>  /*

