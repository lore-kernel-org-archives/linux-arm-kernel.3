Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E05E75453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlfSgkXrPPUfteCGen9BskymZlk+ZQwNku4KYIKs/xo=; b=u3o2E0lpUOSb47IV8OSUMXpd8W
	9JRMm1XwhNJwoUn5nWdYQ5u2n5d6rTaeFiwnFWCSlizCIVnD5peS+0uAOlkOsB9anOKhkh8D7M/Vl
	blnBawdU6KzSY1LZFv9DA7alW70pCfe947PxYmIbdGAWniZDc0zoGk5BpwoHBHr6HxkzksN034gXQ
	1zLk+Lvgy+9qHlMt9TUthhMAopckDbaK9VLLpHh07RtiOHwyHVdXfB2jfF3ML9iI5Boa6/oNDY2IP
	ibdiVpsUt0TKyw3KhOqs+U4+JrWqjQ7WB/38Ur8O9p1CckDD9pvdAAHB2wx9pAPmkTGIvwtl+rxRo
	CMLEEuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPH8-0000000Gv9u-3TFo;
	Wed, 24 Dec 2025 13:51:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPH1-0000000Gv8f-467d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 13:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E673339;
	Wed, 24 Dec 2025 05:51:20 -0800 (PST)
Received: from [10.57.93.190] (unknown [10.57.93.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A15DB3F694;
	Wed, 24 Dec 2025 05:51:24 -0800 (PST)
Message-ID: <6440050d-844b-4587-8531-038038d32f67@arm.com>
Date: Wed, 24 Dec 2025 13:51:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] arm64: mm: factor out the address and ptep
 alignment into a new helper
Content-Language: en-GB
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, riel@surriel.com,
 harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
 baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1766455377.git.baolin.wang@linux.alibaba.com>
 <47e29030347c23ffce238ff5ed752da01a8cc7cb.1766455378.git.baolin.wang@linux.alibaba.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <47e29030347c23ffce238ff5ed752da01a8cc7cb.1766455378.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055132_055092_1BD618A9 
X-CRM114-Status: GOOD (  17.18  )
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

On 23/12/2025 05:48, Baolin Wang wrote:
> Factor out the contpte block's address and ptep alignment into a new helper,
> and will be reused in the following patch.
> 
> No functional changes.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

LGTM:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/contpte.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 589bcf878938..e4ddeb46f25d 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -26,6 +26,26 @@ static inline pte_t *contpte_align_down(pte_t *ptep)
>  	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>  }
>  
> +static inline pte_t *contpte_align_addr_ptep(unsigned long *start,
> +					     unsigned long *end, pte_t *ptep,
> +					     unsigned int nr)
> +{
> +	/*
> +	 * Note: caller must ensure these nr PTEs are consecutive (present)
> +	 * PTEs that map consecutive pages of the same large folio within a
> +	 * single VMA and a single page table.
> +	 */
> +	if (pte_cont(__ptep_get(ptep + nr - 1)))
> +		*end = ALIGN(*end, CONT_PTE_SIZE);
> +
> +	if (pte_cont(__ptep_get(ptep))) {
> +		*start = ALIGN_DOWN(*start, CONT_PTE_SIZE);
> +		ptep = contpte_align_down(ptep);
> +	}
> +
> +	return ptep;
> +}
> +
>  static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
>  					pte_t *ptep, unsigned int nr)
>  {
> @@ -569,14 +589,7 @@ void contpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
>  	unsigned long start = addr;
>  	unsigned long end = start + nr * PAGE_SIZE;
>  
> -	if (pte_cont(__ptep_get(ptep + nr - 1)))
> -		end = ALIGN(end, CONT_PTE_SIZE);
> -
> -	if (pte_cont(__ptep_get(ptep))) {
> -		start = ALIGN_DOWN(start, CONT_PTE_SIZE);
> -		ptep = contpte_align_down(ptep);
> -	}
> -
> +	ptep = contpte_align_addr_ptep(&start, &end, ptep, nr);
>  	__clear_young_dirty_ptes(vma, start, ptep, (end - start) / PAGE_SIZE, flags);
>  }
>  EXPORT_SYMBOL_GPL(contpte_clear_young_dirty_ptes);


