Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6608CD1D893
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W7wNmuypsJF46yhDyGNTvVyhNWPHHjBNdtDIrnVsV4=; b=0gHh4KSEd5nY2Z1AEZyx/mMJi0
	f0sX5xjxQ7A5VIxwxS7q1SKVpYm6cx0GWd5e8/FoPsjQSAxtx5YtpQlXsBdnBFaYIiCsLnpDTAZWe
	VG15TmpPsHG5Lqy02ku1zbRE4Q9/mgl7MT1xDCj/ZDnAg/iaVpuQ1nEnDjX9iPRznU0J7uTHT6P4u
	kIaSN84KKCwbePW3xr5FGbLxZj6ijql6G3efqmbpNiO14Gs5Gnq+rklCc74ZYusDjtnp328BkGsAq
	Cdrz/DaKS43hsREA/vUyIqMiJbRgA+ezoBYSy+z4a0itv97z6pbbpZDgzZ1ZK7hukR6WuoFrkIWnX
	N0ENwuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4N0-00000007eLY-1r4x;
	Thu, 04 Dec 2025 08:07:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR4Mx-00000007eL9-2Hhx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 08:07:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1105E339;
	Thu,  4 Dec 2025 00:07:09 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DDB43F73B;
	Thu,  4 Dec 2025 00:07:14 -0800 (PST)
Message-ID: <8248c3fa-5c17-419c-ad8d-7abda988f0aa@arm.com>
Date: Thu, 4 Dec 2025 13:37:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
 catalin.marinas@arm.com, will@kernel.org, ying.huang@linux.alibaba.com,
 ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_000719_718777_4A6BCA87 
X-CRM114-Status: GOOD (  29.34  )
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

On 04/12/25 11:57 AM, Jianpeng Chang wrote:
> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
> when the page is already dirty (PTE_DIRTY is set). While this optimization
> prevents unnecessary dirty page marking in normal memory management paths,
> it breaks kexec on some platforms like NXP LS1043.

Why is this problem only applicable for NXP LS1043 ? OR is that the only
platform you have observed the issue ? although that is problematic else
where as well.

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
> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
> hibernation, making all pages in the temporary mapping writable regardless
> of their dirty state. This preserves the original commit's optimization
> for normal memory management while fixing the kexec/hibernation regression.
> 
> Using pte_mkdirty() causes redundant bit operations when the page is
> already writable (redundant PTE_RDONLY clearing), but this is acceptable
> since it's not a hot path and only affects kexec/hibernation scenarios.
> 
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
> ---
> v3: 
>   - Add the description about pte_mkdirty in commit message
>   - Note that the redundant bit operations in commit message
>   - Fix the comments following the suggestions
> v2: https://lore.kernel.org/all/20251202022707.2720933-1-jianpeng.chang.cn@windriver.com/
>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
> 
>  arch/arm64/mm/trans_pgd.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 18543b603c77..766883780d2a 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -40,8 +40,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * Resume will overwrite areas that may be marked
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
> +		 *
> +		 * For both kexec and hibernation, writable accesses are required
> +		 * for all pages in the linear map to copy over new kernel image.
> +		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
> +		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
> +		 * required write access for the pages.
>  		 */
> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>  	} else if (!pte_none(pte)) {
>  		/*
>  		 * debug_pagealloc will removed the PTE_VALID bit if
> @@ -57,7 +63,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
> +		/*
> +		 * For both kexec and hibernation, writable accesses are required
> +		 * for all pages in the linear map to copy over new kernel image.
> +		 * Hence mark these pages dirty first via pte_mkdirty() to ensure
> +		 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
> +		 * required write access for the pages.
> +		 */
> +		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>  	}
>  }
>  


