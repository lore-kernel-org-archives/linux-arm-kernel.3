Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B01ACCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 06:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tlrn7pQ6n4ywax/ExY7R5dXNwS2i4o2RMVRu3w/AtH4=; b=qJDG316Sc9d4iL5DXNouYoN019
	CaJrOcG7qABYmg8s2Yucph5z9iRaPEVvijZf8AWjB4CyWSgXMEGd/e9Yn0qHX78SfNewpRkRxQ06q
	rCmn1XobC2qUaY7JUzXtV88S65hWQPJgSd1TZBJfLpNUN7UZ2RaoI24EasMfs61Ps4C1c5wzMZfYZ
	UzWYyW3Zd81exJC0GzBk5goTmKbRT0rDyzIW7EA4md9W4cbH4k6WR51NUsJXHOkIk7/eGh16tSKtk
	xXZJx1627LPv64Gjr4Z7SF6kXlmC6u0uNw8CtW3dYmz6AT6XMyqTGsTgD2ykySF7N3UziMjsB1mm8
	klIcciyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vHL-00000000dEs-32mw;
	Wed, 15 Oct 2025 06:46:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vHI-00000000dBm-1gUo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 06:46:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21BAA1A32;
	Tue, 14 Oct 2025 23:46:17 -0700 (PDT)
Received: from [10.163.67.182] (unknown [10.163.67.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 334E83F6A8;
	Tue, 14 Oct 2025 23:46:21 -0700 (PDT)
Message-ID: <00bf0498-8f11-466e-9f2a-f7e656ecddf9@arm.com>
Date: Wed, 15 Oct 2025 12:16:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: make linear mapping permission update more
 robust for patial range
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
 cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-2-yang@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251013232803.3065100-2-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_234628_490578_C0EAD128 
X-CRM114-Status: GOOD (  19.02  )
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


On 14/10/25 4:57 am, Yang Shi wrote:
> The commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
> permissions for vmalloc_huge mappings") made permission update for
> partial range more robust. But the linear mapping permission update
> still assumes update the whole range by iterating from the first page
> all the way to the last page of the area.
>
> Make it more robust by updating the linear mapping permission from the
> page mapped by start address, and update the number of numpages.
>
> Fixes: fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>   arch/arm64/mm/pageattr.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..c21a2c319028 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -148,7 +148,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	unsigned long size = PAGE_SIZE * numpages;
>   	unsigned long end = start + size;
>   	struct vm_struct *area;
> -	int i;
>   
>   	if (!PAGE_ALIGNED(addr)) {
>   		start &= PAGE_MASK;
> @@ -184,8 +183,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	 */
>   	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>   			    pgprot_val(clear_mask) == PTE_RDONLY)) {
> -		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +		unsigned long idx = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
> +		for (int i = 0; i < numpages; i++) {
> +			__change_memory_common((u64)page_address(area->pages[idx++]),
>   					       PAGE_SIZE, set_mask, clear_mask);

Why not just use idx as the iterator in the for loop? Using i and then incrementing
idx is confusing.

As noted by Ryan, the fixes commit is wrong. The issues persists from commit c55191e.

After fixing these:

Reviewed-by: Dev Jain <dev.jain@arm.com>

>   		}
>   	}

