Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671C8CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+DJDTKvKp7SGPbAJOb+eWfVkRUuGgkQ9kR2ECMk9ZY=; b=ADn5qZUBQ6TQDUrVorHJP4wA6m
	6W9tSRZzzkXvAVxl5ICxxnTLVWZwliwpWI7AI2MmiqsAD04ez3qvgVQQ3ICKpdM6+VgbwaNrAlZZj
	EfG1Jkx+yvGmscXhi0SXc0/uPXg9LXe/q4jUNeeextbNPLc50Yu3J51I/o9xaE4lW23ivK9tw7Jq/
	2H1m+8A44OxMptrNpoBNvaHdZJb3CFG7F4eM9NRQaQRWFr8vdW3AVeV9SL0AGwVy+xMMAcf3ua5aZ
	JvHlZOLl0LFkKDWnkHOJrzJELVh++bRx141dcUmeVE5RfCOQyH9ZqVKUj6cWUtu3bCWoPbyKqae5q
	QArPQQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a1y-0000000FYOe-0YC3;
	Tue, 14 Oct 2025 08:05:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a1v-0000000FYNx-2uub
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5842A1A9A;
	Tue, 14 Oct 2025 01:05:02 -0700 (PDT)
Received: from [10.57.83.223] (unknown [10.57.83.223])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 583033F6A8;
	Tue, 14 Oct 2025 01:05:08 -0700 (PDT)
Message-ID: <973e36b9-e89a-43b2-bb85-b00343dd4e36@arm.com>
Date: Tue, 14 Oct 2025 09:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: make linear mapping permission update more
 robust for patial range
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, dev.jain@arm.com, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-2-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251013232803.3065100-2-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_010511_776898_30CC1454 
X-CRM114-Status: GOOD (  20.89  )
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

On 14/10/2025 00:27, Yang Shi wrote:
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

I don't think this is the correct commit. I think this theoretical issue was
present before that. But it is only theoretical AFAIK? In which case, I'd be
inclined to just drop the tag.

Otherwise, LGTM:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/mm/pageattr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..c21a2c319028 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -148,7 +148,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	unsigned long size = PAGE_SIZE * numpages;
>  	unsigned long end = start + size;
>  	struct vm_struct *area;
> -	int i;
>  
>  	if (!PAGE_ALIGNED(addr)) {
>  		start &= PAGE_MASK;
> @@ -184,8 +183,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 */
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
> -		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +		unsigned long idx = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
> +		for (int i = 0; i < numpages; i++) {
> +			__change_memory_common((u64)page_address(area->pages[idx++]),
>  					       PAGE_SIZE, set_mask, clear_mask);
>  		}
>  	}


