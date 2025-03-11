Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F021FC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 04:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RExaR/LsnulB+htniR6mF68pVFsct95vxebqlNxNLAU=; b=fCihHJauDRWRUa1X6SnQnTWI1T
	bkM6oxQMDjgsiHf70GiHOUYrUP1fDs0p7njEXTPLj80xPCK7DWP3kxbmW1Ac3NNroXfu67IR+dUb/
	uL/we9sC4Ap4nbw5AhjOsFS6Vj353r2DVexV45kL66BOtqvF908I7aABCXEhedDx3OMgJmzQSq+Ff
	LWYWnQsoZ0YJA79Pe2ENuv8Df1o1xYa3/EmFrw4w4rdW5r9ewpOZ/b1u8+Po/voBFzPUnTcbcqYn+
	vbjX534uNeKMPEMbG+zBA8q6yTGsqqDBb2P9LzAGRKZ6MvZz/LA/1bnWIasRiO+v3q1ptyTh4R2F8
	CgKAb9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trr1b-00000004aQZ-2KCZ;
	Tue, 11 Mar 2025 04:15:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trqyR-00000004a0T-37sn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 04:12:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 426A81516;
	Mon, 10 Mar 2025 21:12:19 -0700 (PDT)
Received: from [10.162.40.19] (a077893.blr.arm.com [10.162.40.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A933F694;
	Mon, 10 Mar 2025 21:12:05 -0700 (PDT)
Message-ID: <2931b574-35ff-4a3e-b073-47ca94c45787@arm.com>
Date: Tue, 11 Mar 2025 09:42:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/kernel: Always use level 2 or higher for early
 mappings
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>
References: <20250310183011.2591600-2-ardb+git@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250310183011.2591600-2-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_211211_837677_BEB09D11 
X-CRM114-Status: GOOD (  25.91  )
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



On 3/11/25 00:00, Ard Biesheuvel wrote:
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
> 
> So only permit block mappings at level 2, and page mappings at level 3,
> for any page size, and use table mappings exclusively at all other
> levels. This change should have no impact in practice, but it makes the
> code more robust.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Reported-by: Ryan Roberts <ryan.roberts@arm.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
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

LGTM and as Ryan mentioned, D128 ready as well !

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

