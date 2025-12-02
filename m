Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0810ACFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2VLEFo1nx+kkbQ1dQKX77wDUPS9Fed99C+XKzhv7UI=; b=trpvb4B27vHB3uN2XwDi7B8vk+
	CJ7ZAp/UymBMLPoEAgvCL9LYQ5vt6LUKfeqhn/k6KDdvHOUWkttfyBRimTXhRGSZz/RlrqjB+1e5p
	Z9CHY7vRU1mp9jE2BKImtzHO1j7CYWVeW/xBhPrOSiaFde3hfMaTZkpTzfWUYX2VuWSqHpw/6aM9B
	6Wwilk8+UnThK5z04GZ2NlVLWGFcZbY2Y0mgPLqqZr+OPZ3CLocljoBlelSZH7u68gxnmYx2xikRP
	I3dMuEt30VzRDqF2A7QWNZPw1y9+PjzwPhY4e3KvJqkPPQHIYbp2YcbMA8qSXg60oSv90mO2WKueF
	uoFLJxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKKF-00000004vsH-1wgh;
	Tue, 02 Dec 2025 06:57:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQKKB-00000004vrs-1Bic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 06:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45BFA153B;
	Mon,  1 Dec 2025 22:57:11 -0800 (PST)
Received: from [10.164.18.79] (unknown [10.164.18.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD54C3F59E;
	Mon,  1 Dec 2025 22:57:16 -0800 (PST)
Message-ID: <381a3974-aafa-419f-a7ad-ed6e4c1671f0@arm.com>
Date: Tue, 2 Dec 2025 12:27:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_225724_660380_FDC20976 
X-CRM114-Status: GOOD (  27.57  )
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



On 02/12/25 7:57 AM, Jianpeng Chang wrote:
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

via pte_mkdirty() ?

> kexec and hibernation, ensuring all pages in the temporary mapping are
> writable regardless of their dirty state. This preserves the original
> commit's optimization for normal memory management while fixing the
> kexec/hibernation regression.
> 
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> ---
> v2:
>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
> 
>  arch/arm64/mm/trans_pgd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index 18543b603c77..08f5ee6643e1 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * Resume will overwrite areas that may be marked
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
> +		 *
> +		 * For kexec/hibernation, we need writable access to all
> +		 * pages in the linear mapping to copy the new kernel image.
> +		 * Mark pages dirty first to ensure pte_mkwrite_novma()
> +		 * clears PTE_RDONLY.
>  		 */

	       /*
		* For both kexec and hibernation, writable accesses are required
		* for all pages in the linear map to copy over new kernel image. 
		* Hence mark these pages dirty first via pte_mkdirty() to ensure
		* pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
		* required write access for the pages.
		*/

> -		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		__set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>  	} else if (!pte_none(pte)) {
>  		/*
>  		 * debug_pagealloc will removed the PTE_VALID bit if
> @@ -57,7 +62,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  

The comments should be replicated here as well given the same special situation.

> -		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
> +		__set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>  	}
>  }
>

static inline pte_t pte_mkwrite_novma(pte_t pte)
{
	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
	if (pte_sw_dirty(pte))
		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
	return pte;
}

static inline pte_t pte_mkdirty(pte_t pte)
{
	pte = set_pte_bit(pte, __pgprot(PTE_DIRTY));

	if (pte_write(pte))
		pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));

	return pte;
}

So if pte_write() is true, there will be a redundant PTE_RDONLY clearing which is OK.
Should this be mentioned in the commit message ?

