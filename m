Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA291073C9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRFz4qrlYe2T4To4MwhNJij8uVy+cIcUloAamrZKv+w=; b=O7N1Txy488L0MKkBBTcFC3oD6E
	TYMS4bk2rTrQQWc1mKwRcFGXdXGJysamaxqE4N1fiYdU8L0k+WoeVXAOIs0o2tREBfYy2OADNZNtd
	N3kKP9kykcTQk17ZIY+bnzJjRMsqLwzsmFRLIyOLAbCO9Zfv4icr4PwjZsni9TAx6CM3LWQ5rqKX7
	A//Megps+irM+orzf0S3yH5hRsMf3Z4/0FfchSyh7YzKgV9Ljjs+Kh2FPJs/I8xPO0eDhexoKgLO7
	qF2sDQ+PiPB8l3QoYf1yM/ZsFGJCtriABZe/N1Qj/MQYo343RqIi7DHjKVGwYSY76D0UqVPcUR8DE
	KW+ACH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARDJ-00000008lXi-3NFJ;
	Wed, 08 Apr 2026 11:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wARDH-00000008lXK-3M4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 11:36:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF0263161;
	Wed,  8 Apr 2026 04:36:44 -0700 (PDT)
Received: from [10.164.148.132] (unknown [10.164.148.132])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7CFE3F641;
	Wed,  8 Apr 2026 04:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775648210; bh=TIvBYgco5Q0zBdawPxnIjX/uGosAzf3bmZeuxmZn3AQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tyc+ZDtXxSniCkUDIjLP6KKzflE6CwlBnHALqx63GTUFrNyU2JF3Ef62mtN/YsHmb
	 7ZEmNUADsIcp/gy+CcyNXX5DahMmcxjlRYvvs8Yq3SrrwZoM/CCxHo98FmeQUtJ6BB
	 3JVJIanKmDREHSh3cxE5uq5C9ysDoD1/Bt4VzYbc=
Message-ID: <90cfbbb4-9f75-4c67-a1c5-34780b2f7108@arm.com>
Date: Wed, 8 Apr 2026 17:06:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] mm/vmalloc: Coalesce same page_shift mappings in
 vmap to avoid pgtable zigzag
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: linux-kernel@vger.kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org,
 Xueyuan.chen21@gmail.com
References: <20260408025115.27368-1-baohua@kernel.org>
 <20260408025115.27368-8-baohua@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260408025115.27368-8-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_043651_903688_6D614E00 
X-CRM114-Status: GOOD (  15.78  )
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



On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> For vmap(), detect pages with the same page_shift and map them in
> batches, avoiding the pgtable zigzag caused by per-page mapping.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---

In patch 4, you eliminate the pagetable rewalk, and in patch 5,
you re-introduce it, then in this patch you eliminate it again.
So please just squash this into #5.

>  mm/vmalloc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6643ec0288cd..3c3b7217693a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3551,6 +3551,8 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages)
>  {
>  	unsigned int count = (end - addr) >> PAGE_SHIFT;
> +	unsigned int prev_shift = 0, idx = 0;
> +	unsigned long map_addr = addr;
>  	int err;
>  
>  	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> @@ -3562,15 +3564,29 @@ static int vmap_contig_pages_range(unsigned long addr, unsigned long end,
>  		unsigned int shift = PAGE_SHIFT +
>  			get_vmap_batch_order(pages, count - i, i);
>  
> -		err = vmap_range_noflush(addr, addr + (1UL << shift),
> -				page_to_phys(pages[i]), prot, shift);
> -		if (err)
> -			goto out;
> +		if (!i)
> +			prev_shift = shift;
> +
> +		if (shift != prev_shift) {
> +			err = vmap_small_pages_range_noflush(map_addr, addr,
> +					prot, pages + idx,
> +					min(prev_shift, PMD_SHIFT));
> +			if (err)
> +				goto out;
> +			prev_shift = shift;
> +			map_addr = addr;
> +			idx = i;
> +		}
>  
>  		addr += 1UL << shift;
>  		i += 1U << (shift - PAGE_SHIFT);
>  	}
>  
> +	/* Remaining */
> +	if (map_addr < end)
> +		err = vmap_small_pages_range_noflush(map_addr, end,
> +				prot, pages + idx, min(prev_shift, PMD_SHIFT));
> +
>  out:
>  	flush_cache_vmap(addr, end);
>  	return err;


