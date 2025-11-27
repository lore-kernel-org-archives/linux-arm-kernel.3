Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2BCD10375
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkdPotq4J7OiZrvFjNi/z6yKQ2bfC1Ibf8nUJvrfels=; b=CBdIGutsF6lbWvQOU/iObEIj2B
	TAZ5J1+PcRJ6+w7Q4Jzhv1barymgMr4AlzkqjFaWyzYG+AWnTLkwO7gcULpH8spTEj3UVne4rHB+W
	XHTT5w4TquDBEaPY5KrUCB4yRNatAc+c9BqGR1Q/jPrhicbBx9TFviEQU7zc5MahmlDsi1ICVCFUU
	VT7sIg8AQm/zCQOB9g98+zozEyAA1/kJTWWya/n3LE/sWbC96F6CmhIljsMhfRaqyakc5Iu/59jHY
	ve9yPPmBq/WENseOHy20ZHUdgFQZ9I+ihVccdKV7YetkIjIFkdXU3H1YR5p+8SsN4wj4zqFa7Ml/F
	HR/TtSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOUlO-0000000G0Qq-3Mjp;
	Thu, 27 Nov 2025 05:41:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOUl1-0000000G0PY-2uEo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 05:41:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027EC1477;
	Wed, 26 Nov 2025 21:41:22 -0800 (PST)
Received: from [10.163.48.177] (unknown [10.163.48.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B54343F66E;
	Wed, 26 Nov 2025 21:41:26 -0800 (PST)
Message-ID: <efb12f46-37e1-44b7-b73f-48dead4e4da8@arm.com>
Date: Thu, 27 Nov 2025 11:11:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_214131_857365_FDBFF5B3 
X-CRM114-Status: GOOD (  25.96  )
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



On 27/11/25 9:13 AM, Jianpeng Chang wrote:
> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
> when the page is already dirty (PTE_DIRTY is set). While this optimization
> prevents unnecessary dirty page marking in normal memory management paths,
> it breaks kexec on some platforms like NXP LS1043.
> 
> The issue occurs in the kexec code path:
> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>    writable copy of the linear mapping
> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>    are writable for the new kernel image copying
> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
> 4. When kexec tries to copy the new kernel image through the linear
>    mapping, it fails on read-only pages, causing the system to hang
>    after "Bye!"
> 
> The same issue affects hibernation which uses the same trans_pgd code path.
> 
> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
> kexec and hibernation, ensuring all pages in the temporary mapping are
> writable regardless of their dirty state. This preserves the original
> commit's optimization for normal memory management while fixing the
> kexec/hibernation regression.
> 
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> ---
>  arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 18543b603c77..ad4e5e4fcc91 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * Resume will overwrite areas that may be marked
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
> +		 *
> +		 * For kexec/hibernation, we need writable access regardless
> +		 * of the page's dirty state, so force clear PTE_RDONLY.
>  		 */

Hence pte_mkwrite_novma() helper cannot be used here as would have
normally expected. Might be good idea to add to the above comment.

> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +		__set_pte(dst_ptep, pte);
>  	} else if (!pte_none(pte)) {
>  		/*
>  		 * debug_pagealloc will removed the PTE_VALID bit if
> @@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
> +		pte = pte_mkvalid(pte);

Probably better to move pte_mkvalid() just after clearing PTE_RDONLY.

> +		pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
> +		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
> +		__set_pte(dst_ptep, pte);
>  	}
>  }
>  

Just wondering if it would be worth adding a local helper for the set
PTE_WRITE --> clear PTR_RDONLY sequence describing its difference with
now updated pte_mkwrite_novma() helper with the earlier comment.

