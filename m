Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5CA103E190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FZ5QXHUzU1ata4VbBabv3m2vQppMp/lSd5sxHdN7Sc=; b=Ku5bBYGgIr+MXxUPE6DoyxXgCp
	GDKFFE8mRh+e06WkgCY/uwWWAbYlBkTTfsON7NhS04mwYOQ88R56r2Xso4uirHWShTm7xkLVOkmJq
	WU0ckjeCByq1KAeKVU/PDDBTjmy+5ydPv/9iQOkh1e8a/vRHqR9I7xDN/w1Sw6QbyfmCMCwC/mVgf
	PQodl6eea5Et4BRmtYD7GAxpE9yxZwZWkakxi/996naGprXg7M6jv5sTq5BoCxsuSNuux0qTDlacH
	mCrZO0wTTUJoouqa5aIjSEWnVxgRooKMFrA9Z3lcLifLm8pd2G/YkH6bioZX7D0WotSviYzg9aa9t
	VUcRN1vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rhs-00000008Zj0-2jNx;
	Wed, 18 Mar 2026 14:17:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rhq-00000008ZgR-0uTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCAC7415F6;
	Wed, 18 Mar 2026 14:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B834CC19421;
	Wed, 18 Mar 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843423;
	bh=Nka2tAu2xfrAzh/LVz+kPzjJGV26abtbTSAN+jQ1zCs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=l2n98eIWgaO3CjkFjgd0Sou85/DdxxIF5f5x0NNXjCnRCCUzjcWJiinkayJ878aww
	 BMJ0pXZVJUefOLLhpj2fMemzle19sO2O1t5wBOu4oWg54p9ZGJdEhdeS/Czy9hnQXA
	 eulz6Qr5rpmd86XRFktfVxpPiPuG0bWwvXiusqCzjYmb/h8nhtFZfXIiV7SJql6pbr
	 L4xv+2VnZl426NR2cd+2lb906X8FppURSFBE0mng0zk5Fvon36cCbedPT6Sf5MOPBk
	 nKWZjGbed3op7zsa/QhDxrRfMTA0/5KlsKm4GWT7flFR84ReuRSkL4lH9ODOoxK1Dd
	 vepd5z1nkYYfQ==
Message-ID: <11428d25-7bea-4be6-a6ee-bfeac1d50807@kernel.org>
Date: Wed, 18 Mar 2026 15:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH 3/8] mm: move free_reserved_area() to mm/memblock.c
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andreas Larsson <andreas@gaisler.com>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Brendan Jackman <jackmanb@google.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christian Brauner <brauner@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>,
 Johannes Weiner <hannes@cmpxchg.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Will Deacon <will@kernel.org>, Zi Yan <ziy@nvidia.com>,
 devicetree@vger.kernel.org, iommu@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20260318105827.1358927-1-rppt@kernel.org>
 <20260318105827.1358927-4-rppt@kernel.org>
In-Reply-To: <20260318105827.1358927-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_071706_303069_25002616 
X-CRM114-Status: GOOD (  23.12  )
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

On 3/18/26 11:58, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> free_reserved_area() is related to memblock as it frees reserved memory
> back to the buddy allocator, similar to what memblock_free_late() does.
> 
> Move free_reserved_area() to mm/memblock.c to prepare for further
> consolidation of the functions that free reserved memory.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


> ---
>  mm/memblock.c   | 37 ++++++++++++++++++++++++++++++++++++-
>  mm/page_alloc.c | 36 ------------------------------------
>  2 files changed, 36 insertions(+), 37 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index b3ddfdec7a80..8f3010dddc58 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -893,6 +893,42 @@ int __init_memblock memblock_remove(phys_addr_t base, phys_addr_t size)
>  	return memblock_remove_range(&memblock.memory, base, size);
>  }
>  
> +unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
> +{
> +	void *pos;
> +	unsigned long pages = 0;
> +
> +	start = (void *)PAGE_ALIGN((unsigned long)start);
> +	end = (void *)((unsigned long)end & PAGE_MASK);
> +	for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
> +		struct page *page = virt_to_page(pos);
> +		void *direct_map_addr;
> +
> +		/*
> +		 * 'direct_map_addr' might be different from 'pos'
> +		 * because some architectures' virt_to_page()
> +		 * work with aliases.  Getting the direct map
> +		 * address ensures that we get a _writeable_
> +		 * alias for the memset().
> +		 */
> +		direct_map_addr = page_address(page);
> +		/*
> +		 * Perform a kasan-unchecked memset() since this memory
> +		 * has not been initialized.
> +		 */
> +		direct_map_addr = kasan_reset_tag(direct_map_addr);
> +		if ((unsigned int)poison <= 0xFF)
> +			memset(direct_map_addr, poison, PAGE_SIZE);
> +
> +		free_reserved_page(page);
> +	}
> +
> +	if (pages && s)
> +		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
> +
> +	return pages;
> +}
> +
>  /**
>   * memblock_free - free boot memory allocation
>   * @ptr: starting address of the  boot memory allocation
> @@ -1776,7 +1812,6 @@ void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
>  		totalram_pages_inc();
>  	}
>  }
> -
>  /*
>   * Remaining API functions
>   */
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 2d4b6f1a554e..df3d61253001 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6234,42 +6234,6 @@ void adjust_managed_page_count(struct page *page, long count)
>  }
>  EXPORT_SYMBOL(adjust_managed_page_count);
>  
> -unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
> -{
> -	void *pos;
> -	unsigned long pages = 0;
> -
> -	start = (void *)PAGE_ALIGN((unsigned long)start);
> -	end = (void *)((unsigned long)end & PAGE_MASK);
> -	for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
> -		struct page *page = virt_to_page(pos);
> -		void *direct_map_addr;
> -
> -		/*
> -		 * 'direct_map_addr' might be different from 'pos'
> -		 * because some architectures' virt_to_page()
> -		 * work with aliases.  Getting the direct map
> -		 * address ensures that we get a _writeable_
> -		 * alias for the memset().
> -		 */
> -		direct_map_addr = page_address(page);
> -		/*
> -		 * Perform a kasan-unchecked memset() since this memory
> -		 * has not been initialized.
> -		 */
> -		direct_map_addr = kasan_reset_tag(direct_map_addr);
> -		if ((unsigned int)poison <= 0xFF)
> -			memset(direct_map_addr, poison, PAGE_SIZE);
> -
> -		free_reserved_page(page);
> -	}
> -
> -	if (pages && s)
> -		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
> -
> -	return pages;
> -}
> -
>  void free_reserved_page(struct page *page)
>  {
>  	clear_page_tag_ref(page);


