Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186B6C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z77F8t8gGlaXLq5H5fqhrXWlygcKdmYBzV6kxoIyf9k=; b=jZ35X6TGX5y9W6DYalY2Q09frJ
	3cahnU0IT0oIxaI41BKHvA3cBxcUYd6sJn8pwnMXoMfyHmq9qim90tccsbIhlk98qgv5zJdIDU3l9
	4IivbFLwe8kOX7NbT2IOwj7b+0fC5AQe0/lVhIwg3hUeo2+t8hxh2x0OdJlwRBJnurTLjPKJ7y1GP
	GgF6KhQ5coP3LaeMJ0va6sxamEhy2q/dSuBgJ9Yks54YwliA9q6T3jMyKQDx1XIjwY/od9ETIlSex
	ghJq2wbwfe08t22kQo59bjqa8NaFVQi/SNfnGOwJH9RP0MlU9WIaV0nBbjuiA29DpVLaRsYTV522k
	GwO6FOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgmH-000000029y8-0rtC;
	Fri, 17 Jul 2026 11:30:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgmF-000000029xo-4C8q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81A1C4051E;
	Fri, 17 Jul 2026 11:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6D01F000E9;
	Fri, 17 Jul 2026 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784287847;
	bh=Z77F8t8gGlaXLq5H5fqhrXWlygcKdmYBzV6kxoIyf9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mm6Mjx2WdJ6T9LFLOqOCy1chNn5Dfw9PYBRptQkrjobxEd6vdKZLFyWmyExSV/IXO
	 kAoVHmBEWIKVYOz94aV4seSn830RCuIjBT/xQg4Cr0LJVahJuc1ntlKVjPNrzVVdaV
	 thsnBEOE0IROso9ahcOE1hw75IA/w37iZJgWnJlqe3JM8tW0cGt33sGZdDndeu0nlq
	 req+4/lVTHvqtyAkvbM4J5acpd9z8LGvG4KD+v8A1sy9uFscqtEM7ZDXAgqAm+8YGh
	 HLj+sAwlRqvIpc+VPdGp7LfESROOJknoQznqamj40WF3XjNkWbqbqHyDI64Nzvgbmu
	 Hm+KJoBMLN7Bw==
Date: Fri, 17 Jul 2026 12:30:38 +0100
From: Will Deacon <will@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Toshi Kani <toshi.kani@hpe.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v4 2/4] x86/mm/pat: acquire init_mm write
 lock to avoid UAF
Message-ID: <aloSXsTLOSepa5fA@willie-the-truck>
References: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org>
 <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
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

On Thu, Jul 16, 2026 at 10:31:13PM +0100, Lorenzo Stoakes (ARM) wrote:
> x86 implements page attribute modification using its Change Page
> Attributes (CPA) mechanism.
> 
> This tracks properties of ranges such as cache mode through x86 page
> attributes, and as part of that logic manipulates kernel page tables.
> 
> Since commit 41d88484c71c ("x86/mm/pat: restore large ROX pages after
> fragmentation") ranges of kernel page table entries can be collapsed into
> huge page table entries as part of this logic.
> 
> As part of this collapse, it frees the page tables which the collapsed
> entries previously pointed to, and it does so without any relevant locks
> being held to preclude concurrent kernel page table walkers.
> 
> The only way this code can be reached is if CPA_COLLAPSE is specified, and
> this is only set in set_memory_rox() via:
> 
> set_memory_rox()
> -> change_page_attr_set_clr()
> -> cpa_flush()
> -> cpa_collapse_large_pages()
> 
> Notable users of this are execmem and bpf when manipulating executable
> mappings.
> 
> However, this is problematic for ptdump as it walks ranges it does not own
> and thus runs the risk of a use-after-free on page tables freed underneath
> it.
> 
> In addition, concurrent CPA collapse operations are possible which can also
> cause races.
> 
> Resolve the issue by acquiring the mmap write lock on init_mm across the
> whole operation.

Thanks, Lorenzo.

This ain't worth much here, but all the same:

Reviewed-by: Will Deacon <will@kernel.org>

with one nit below:

> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index d023a40a1e03..d1e63f7d267f 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -22,6 +22,7 @@
>  #include <linux/cc_platform.h>
>  #include <linux/set_memory.h>
>  #include <linux/memregion.h>
> +#include <linux/cleanup.h>
>  
>  #include <asm/e820/api.h>
>  #include <asm/processor.h>
> @@ -410,7 +411,7 @@ static void __cpa_flush_tlb(void *data)
>  
>  static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
>  
> -static void cpa_collapse_large_pages(struct cpa_data *cpa)
> +static void __cpa_collapse_large_pages(struct cpa_data *cpa)
>  {
>  	unsigned long start, addr, end;
>  	struct ptdesc *ptdesc, *tmp;
> @@ -442,6 +443,18 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
>  	}
>  }
>  
> +static void cpa_collapse_large_pages(struct cpa_data *cpa)
> +{
> +	/*
> +	 * Take the mmap write lock on init_mm to:
> +	 * - Avoid a use-after-free if raced by ptdump (which takes its own
> +	 *   write lock on init_mm).
> +	 * - Serialise concurrent CPA walkers.

The CPA lock should handle those, so I think it's the non-CPA walkers
that are problematic. Looks like Sashiko reckons it's found some that
don't take the mmap_lock at all [1], but this is still a big step in the
right direction, fixes the ptdump case and we're not trying to boil the
ocean.

Will

[1] https://lore.kernel.org/all/20260716215307.14A6E1F000E9@smtp.kernel.org/#t

