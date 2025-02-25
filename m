Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B28C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3wq+WnthHQkqUieuoVKorC3Mua98jme7LaWQjbwl3I=; b=lyhZi4nJr73mdCucXjB7H8/nGP
	BswFKzLUlWntKRw59X0VvtmeKIt/G8j+yi+0uvgF2jIQfXC0qudOvdYzWrAdLQzZLINHff74tOGby
	Gw5ap5UsekP0KqVivEbh7RoT/cpJJNarrlQA9qHHMwKamnYMllvX/yMf1/k+NF8UfCw/aKhCKAIbm
	DV80FUCui+PdIyFZLSNxdBZRFk3n+fwhExZkY9wAlb0OOun8OEQkdalZDQRmB/+UnpNziqBQmE7Fu
	XcxdpKzLvcukYiBjDC8SxbrmKPZjPyM/nKE4Q7difNN3JBeOStwYvYbPehco23xbbQplmYlr6Q5Gw
	GXuymZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0r-00000000LMw-3aiI;
	Tue, 25 Feb 2025 16:42:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmwKV-0000000Haqd-2w1y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:54:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC1CB1BCB;
	Tue, 25 Feb 2025 06:54:54 -0800 (PST)
Received: from [10.1.27.154] (XHFQ2J9959.cambridge.arm.com [10.1.27.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABFED3F5A1;
	Tue, 25 Feb 2025 06:54:37 -0800 (PST)
Message-ID: <5edf6a80-1fbd-4be2-912b-497c044ba0f8@arm.com>
Date: Tue, 25 Feb 2025 14:54:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64/hugetlb: Consistently use pud_sect_supported()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250220050534.799645-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250220050534.799645-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_065439_787330_D64EBBC0 
X-CRM114-Status: GOOD (  15.92  )
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

On 20/02/2025 05:05, Anshuman Khandual wrote:
> Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
> Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
> Also re-arranged the switch statement for a common warning message.

Thanks, Anshuman, this looks much cleaner now, to my eye at least.

> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> This patch applies on v6.14-rc3
> 
> Changes in V3:
> 
> - Re-arranged the switch statement for a common warning message per Ryan
> 
> Changes in V2:
> 
> https://lore.kernel.org/linux-arm-kernel/20250218113639.475947-1-anshuman.khandual@arm.com/
> 
> - Added an warning when PUD_SIZE is requested but not supported per Ryan
> 
> Changes in V1:
> 
> https://lore.kernel.org/linux-arm-kernel/20250217065414.49489-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/mm/hugetlbpage.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 98a2a0e64e25..fd7448bb8c80 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -342,7 +342,9 @@ unsigned long hugetlb_mask_last_page(struct hstate *h)
>  	switch (hp_size) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		return PGDIR_SIZE - PUD_SIZE;
> +		if (pud_sect_supported())
> +			return PGDIR_SIZE - PUD_SIZE;
> +		break;
>  #endif
>  	case CONT_PMD_SIZE:
>  		return PUD_SIZE - CONT_PMD_SIZE;
> @@ -364,23 +366,21 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  	switch (pagesize) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
> +		if (pud_sect_supported())
> +			return pud_pte(pud_mkhuge(pte_pud(entry)));
>  		break;
>  #endif
>  	case CONT_PMD_SIZE:
> -		entry = pmd_pte(pmd_mkcont(pte_pmd(entry)));
> -		fallthrough;
> +		return pmd_pte(pmd_mkhuge(pmd_mkcont(pte_pmd(entry))));
>  	case PMD_SIZE:
> -		entry = pmd_pte(pmd_mkhuge(pte_pmd(entry)));
> -		break;
> +		return pmd_pte(pmd_mkhuge(pte_pmd(entry)));
>  	case CONT_PTE_SIZE:
> -		entry = pte_mkcont(entry);
> -		break;
> +		return pte_mkcont(entry);
>  	default:
> -		pr_warn("%s: unrecognized huge page size 0x%lx\n",
> -			__func__, pagesize);
>  		break;
>  	}
> +	pr_warn("%s: unrecognized huge page size 0x%lx\n",
> +		__func__, pagesize);
>  	return entry;
>  }
>  


