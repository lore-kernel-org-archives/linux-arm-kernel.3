Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE407C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOMdBZHXmT6tOq4jZ3nXBaHcgelQQuneQe5MrBX2DNQ=; b=YejPsZdA8KqnvBUGmNfQZ/Bled
	FxEW+2PK8QC9Kwd1ASP1YgjeWM6SNW/o1Q4nRHgtA4DY3Nv/eH15aHAbxYLQtMziOXCKnNyAoBl6f
	AgYMFWiBHDwHKkpatOMKlpWuPUc71hJSHhU5DP1WZVilw3RO2FgN5gJgnw2jAybrUD8PTKXxgCkPi
	2LrTaft/ew1Iw2TP7p4NOXNutz93XBzyX0fmKSfJi+mApMvyJsxznsQuvjskNCWPXxVwnaSZjAAG9
	2JiYa5OFfdZOdJ4Kmrbj0HIRkJk+QvMrZHtOCGGKyv8GpVuMiKAKReD0XX875uA2yZmqvcvunRnRz
	NG0Sv49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkODL-00000008QSp-3Z2c;
	Tue, 18 Feb 2025 14:04:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOAj-00000008PzP-3Wvw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:02:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05D16152B;
	Tue, 18 Feb 2025 06:02:20 -0800 (PST)
Received: from [10.1.27.186] (XHFQ2J9959.cambridge.arm.com [10.1.27.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 623173F6A8;
	Tue, 18 Feb 2025 06:02:00 -0800 (PST)
Message-ID: <0ad8b31e-f1f1-426d-89e8-a21cf72814d1@arm.com>
Date: Tue, 18 Feb 2025 14:01:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64/hugetlb: Consistently use pud_sect_supported()
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250218113639.475947-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250218113639.475947-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_060201_926878_7DA45B2E 
X-CRM114-Status: GOOD (  16.31  )
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

On 18/02/2025 11:36, Anshuman Khandual wrote:
> Let's be consistent in using pud_sect_supported() for PUD_SIZE sized pages.
> Hence change hugetlb_mask_last_page() and arch_make_huge_pte() as required.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.14-rc3
> 
> Changes in V2:
> 
> - Added an warning when PUD_SIZE is requested but not supported per Ryan
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20250217065414.49489-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/mm/hugetlbpage.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 98a2a0e64e25..1d89599a20d7 100644
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
> @@ -364,7 +366,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>  	switch (pagesize) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	case PUD_SIZE:
> -		entry = pud_pte(pud_mkhuge(pte_pud(entry)));
> +		if (pud_sect_supported())
> +			entry = pud_pte(pud_mkhuge(pte_pud(entry)));
> +		else
> +			pr_warn("%s: pud huge page not supported\n", __func__);
>  		break;
>  #endif
>  	case CONT_PMD_SIZE:

Personally, I think something like this is cleaner than having 2 warnings:

pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
{
	size_t pagesize = 1UL << shift;

	switch (pagesize) {
#ifndef __PAGETABLE_PMD_FOLDED
	case PUD_SIZE:
		if (pud_sect_supported())
			return pud_pte(pud_mkhuge(pte_pud(entry)));
		break;
#endif
	case CONT_PMD_SIZE:
		return pmd_pte(pmd_mkhuge(pmd_mkcont(pte_pmd(entry))));
	case PMD_SIZE:
		return pmd_pte(pmd_mkhuge(pte_pmd(entry)));
	case CONT_PTE_SIZE:
		return pte_mkcont(entry);
	}

	pr_warn("%s: unrecognized huge page size 0x%lx\n",
		__func__, pagesize);
	return entry;
}

Thanks,
Ryan




