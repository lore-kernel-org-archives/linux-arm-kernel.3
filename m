Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AA5C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 12:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rqk0XJAH2vPpD8itPZkeJ2IpfqOV0sRq5k4x8Vjtuo=; b=zy4Tx16gmtbIlrShPIXD+axcML
	lfK9dJmdnYUme/uhptbWnAew0cbcYGUo1nCZQLxBsOhsHTm/ME0z5f6DfPpn4DdG1mON74XBMcatx
	6lsYDBMbsfMMqnEJmdtgMK0EMi2xRjNOnMufjSmeDcFkyvhEQbWrKRvuLdmYTfPzhe8NiiwK053MP
	O3Vr2yad1BPsTrK8qRbVUo+ND7utOr8wb8CSjbwY/9Q1rloDe3TiXO0YOW/mZjtXlr6XWowDXFkw4
	mcVfSM9eKrn2a3VARWNUWDaMEzFxNwG4wZC95g1sFdcTMbWM9d7siYfo3ATL0zqYn02ANiDtEdr+D
	gCzdUuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52L6-00000009akl-3bBl;
	Wed, 16 Apr 2025 12:58:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52Hz-00000009aIs-20pS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 12:54:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA3B01595;
	Wed, 16 Apr 2025 05:54:48 -0700 (PDT)
Received: from [10.57.90.106] (unknown [10.57.90.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B04573F694;
	Wed, 16 Apr 2025 05:54:48 -0700 (PDT)
Message-ID: <eba7a8fa-0b85-4b30-ab3e-9c0a65b7dc80@arm.com>
Date: Wed, 16 Apr 2025 13:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
Content-Language: en-GB
To: Xavier <xavier_qy@163.com>, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
 <20250415082205.2249918-2-xavier_qy@163.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250415082205.2249918-2-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_055451_576244_6F4E5CD8 
X-CRM114-Status: GOOD (  20.45  )
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

On 15/04/2025 09:22, Xavier wrote:
> This commit optimizes the contpte_ptep_get function by adding early
>  termination logic. It checks if the dirty and young bits of orig_pte
>  are already set and skips redundant bit-setting operations during
>  the loop. This reduces unnecessary iterations and improves performance.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..0acfee604947 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>  }
>  EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>  
> +/* Note: in order to improve efficiency, using this macro will modify the
> + * passed-in parameters.*/
> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
> +		if (pte_##flag(__ptep_get(ptep))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +		} \
> +    }

I'm really not a fan of this macro, it just obfuscates what is going on. I'd
personally prefer to see the 2 extra loops open coded below.

Or even better, could you provide results comparing this 3 loop version to the
simpler approach I suggested previously? If the performance is similar (which I
expect it will be, especially given Barry's point that your test always ensures
the first PTE is both young and dirty) then I'd prefer to go with the simpler code.


> +
>  pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  {
>  	/*
> @@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>  	for (i = 0; i < CONT_PTES; i++, ptep++) {
>  		pte = __ptep_get(ptep);
>  
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>  			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>  
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>  			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>  	}
>  
>  	return orig_pte;

If we decide this is all worth the trouble, then I think we can (and *should*,
in order to be consistent) pull a similar stunt in contpte_ptep_get_lockless().

Thanks,
Ryan


