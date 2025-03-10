Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D8FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRVSnqX6Z6NbD7FVqGx9dBgHWrvTmAf+IlYTtEU3Q/k=; b=nQSWB0BiLFsJCgVBCBXruOUyjj
	20IKpUEAmqvvPWrSPZxDva2OpFNoT7CqrTMS2hmA0jP6CndifQHMO97aE4hkdUTbpNvzVQvxFbvu5
	vKzgDEkisAq8edIpA9ATOviD1z1LJnVxmjPQII97n/bOW9j1OeLMbZrvYcUtcbjZ+tdyAFF2/vY7f
	aiKChgiUr0uAkgHH0VMmK9ZtN5YWUPaHqntHt9SfIAIIC9BDYhOU1yQttgxFEK3mcDnWA5PkuMybW
	5jt0iMoHPgiPY8AP7yvOoD23G8sndzbsTGj0SqtMNR2IQo0cQ1gFWX8l0PbMllwfqTgHDLShH15cX
	NtKLay5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkSi-00000003zL4-1trb;
	Mon, 10 Mar 2025 21:15:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkOG-00000003yOA-2DLO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:10:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 054261516;
	Mon, 10 Mar 2025 14:10:35 -0700 (PDT)
Received: from [10.57.83.165] (unknown [10.57.83.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3923F5A1;
	Mon, 10 Mar 2025 14:10:21 -0700 (PDT)
Message-ID: <948cccde-6b00-4542-9882-47d24f3d0d78@arm.com>
Date: Mon, 10 Mar 2025 21:10:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/kernel: Always use level 2 or higher for early
 mappings
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250310183011.2591600-2-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250310183011.2591600-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_141024_656944_415E552E 
X-CRM114-Status: GOOD (  27.48  )
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

On 10/03/2025 18:30, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The page table population code in map_range() uses a recursive algorithm
> to create the early mappings of the kernel, the DTB and the ID mapped
> text and data pages, and this fails to take into account that the way
> these page tables may be constructed is not precisely the same at each
> level. In particular, block mappings are not permitted at each level,
> and the code as it exists today might inadvertently create such a
> forbidden block mapping if it were used to map a region of the
> appropriate size and alignment.
> 
> This never happens in practice, given the limited size of the assets
> being mapped by the early boot code. Nonetheless, it would be better if
> this code would behave correctly in all circumstances.

ahha, yes I had a hunch we would be able to guarantee not to hit this condition
in practice. Thanks for the explanation.

> 
> So only permit block mappings at level 2, and page mappings at level 3,
> for any page size, and use table mappings exclusively at all other
> levels. This change should have no impact in practice, but it makes the
> code more robust.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

This looks good to me, and it's D128 ready!

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/kernel/pi/map_range.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/map_range.c b/arch/arm64/kernel/pi/map_range.c
> index 2b69e3beeef8..025bb9f0aa0b 100644
> --- a/arch/arm64/kernel/pi/map_range.c
> +++ b/arch/arm64/kernel/pi/map_range.c
> @@ -40,17 +40,10 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>  	/* Advance tbl to the entry that covers start */
>  	tbl += (start >> (lshift + PAGE_SHIFT)) % PTRS_PER_PTE;
>  
> -	/*
> -	 * Set the right block/page bits for this level unless we are
> -	 * clearing the mapping
> -	 */
> -	if (protval)
> -		protval |= (level < 3) ? PMD_TYPE_SECT : PTE_TYPE_PAGE;
> -
>  	while (start < end) {
>  		u64 next = min((start | lmask) + 1, PAGE_ALIGN(end));
>  
> -		if (level < 3 && (start | next | pa) & lmask) {
> +		if (level < 2 || (level == 2 && (start | next | pa) & lmask)) {
>  			/*
>  			 * This chunk needs a finer grained mapping. Create a
>  			 * table mapping if necessary and recurse.
> @@ -64,6 +57,14 @@ void __init map_range(u64 *pte, u64 start, u64 end, u64 pa, pgprot_t prot,
>  				  (pte_t *)(__pte_to_phys(*tbl) + va_offset),
>  				  may_use_cont, va_offset);
>  		} else {
> +			/*
> +			 * Set the right block/page bits for this level unless
> +			 * we are clearing the mapping
> +			 */
> +			if (protval)
> +				protval |= (level == 2) ? PMD_TYPE_SECT
> +							: PTE_TYPE_PAGE;
> +
>  			/*
>  			 * Start a contiguous range if start and pa are
>  			 * suitably aligned


