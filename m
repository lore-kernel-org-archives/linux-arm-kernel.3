Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D93C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfG1ZHcv+rjvAHjyJjxi2sRN0IfFFjf4AjdeqTop9C4=; b=RKVEyCrDoXedRB2eKf1OsAlqv5
	ceTVvIKHEt1Oz1k6XnbIPsYNylm9RP890XkhiZcaXnhpxXY1r2I02lez1wBSzhUW/w9ha5gJlOaxT
	o5DgaSi1ZoWADxWuUGvdc1bAzX4HsfkqnGzbGJxfpalouv8yQyhFwVq2cwifIkABV6ml8LVdxMOUw
	ER1wEnUGklHAp9wtHWUgAI7Ptzkqts1eEFQxFR3lW0jkYWUwOsSwDmNaFK/ZqNxEEcQG+FyF1rhDH
	Xg4ZsVQHcwvlxtqFc/py0A3rze9O+x2e7Add7nYrHDRWZaQCxhxM3eCCkuVCKFBC80RSwlNIwDZjW
	P/ISiXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmfc-00000006eYz-1z8P;
	Mon, 20 Jul 2026 12:00:28 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmfZ-00000006eXo-3WVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:00:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784548811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JfG1ZHcv+rjvAHjyJjxi2sRN0IfFFjf4AjdeqTop9C4=;
	b=Zz/2JB1+Mjxt6Dns0uYzFOLTpBQzIGJuYWgxQWef6tQ/Sif17tZoTMbnsT31ipbxFQqIC1
	by46BgHzKdI49KEy4T6VOcJ9sDDWluNNus+x4SW729AZrSg7ZqMe59h+dIAuyEei/KIDgi
	jnbZK4lJjvBXGxcY5kNPMkJxf7hndIU=
From: Usama Arif <usama.arif@linux.dev>
To: Rik van Riel <riel@surriel.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	kernel-team@meta.com,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 3/6] mm: rename get_user_page_vma_remote() to get_user_page_lookup_vma()
Date: Mon, 20 Jul 2026 05:00:01 -0700
Message-ID: <20260720120002.299101-1-usama.arif@linux.dev>
In-Reply-To: <20260717170036.743149-4-riel@surriel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_050026_156071_6D69C4BA 
X-CRM114-Status: GOOD (  19.61  )
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

On Fri, 17 Jul 2026 13:00:33 -0400 Rik van Riel <riel@surriel.com> wrote:

> get_user_page_vma_remote() faults in the page at @addr in a remote mm and
> also looks up the VMA that covers it, handing both back to the caller.
> 
> This cleans up the name space for adding a get_user_page_vma() variant

nit: s/name space/namespace/

> where the caller already has the vma.
> 
> Assisted-by: Claude:claude-opus-4.8
> Signed-off-by: Rik van Riel <riel@surriel.com>
> ---
>  arch/arm64/kernel/mte.c   | 2 +-
>  arch/x86/kernel/uprobes.c | 2 +-
>  include/linux/mm.h        | 2 +-
>  mm/memory.c               | 4 ++--
>  mm/rmap.c                 | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 


I think good to add no functional change intended in the patch.

Acked-by: Usama Arif <usama.arif@linux.dev>


> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 1a9aad6ef22a..7a6ecc3d9294 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -459,7 +459,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
>  		struct vm_area_struct *vma;
>  		unsigned long tags, offset;
>  		void *maddr;
> -		struct page *page = get_user_page_vma_remote(mm, addr,
> +		struct page *page = get_user_page_lookup_vma(mm, addr,
>  							     gup_flags, &vma);
>  		struct folio *folio;
>  
> diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
> index 3af979fb41d3..329efac0cfb3 100644
> --- a/arch/x86/kernel/uprobes.c
> +++ b/arch/x86/kernel/uprobes.c
> @@ -1036,7 +1036,7 @@ static int copy_from_vaddr(struct mm_struct *mm, unsigned long vaddr, void *dst,
>  	struct vm_area_struct *vma;
>  	struct page *page;
>  
> -	page = get_user_page_vma_remote(mm, vaddr, gup_flags, &vma);
> +	page = get_user_page_lookup_vma(mm, vaddr, gup_flags, &vma);
>  	if (IS_ERR(page))
>  		return PTR_ERR(page);
>  	uprobe_copy_from_page(page, vaddr, dst, len);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 485df9c2dbdd..24ead14b4790 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3238,7 +3238,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
>  /*
>   * Retrieves a single page alongside its VMA. Does not support FOLL_NOWAIT.
>   */
> -static inline struct page *get_user_page_vma_remote(struct mm_struct *mm,
> +static inline struct page *get_user_page_lookup_vma(struct mm_struct *mm,
>  						    unsigned long addr,
>  						    int gup_flags,
>  						    struct vm_area_struct **vmap)
> diff --git a/mm/memory.c b/mm/memory.c
> index ff338c2abe92..3b86eeaf084f 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -7039,7 +7039,7 @@ static int __access_remote_vm(struct mm_struct *mm, unsigned long addr,
>  		void *maddr;
>  		struct folio *folio;
>  		struct vm_area_struct *vma = NULL;
> -		struct page *page = get_user_page_vma_remote(mm, addr,
> +		struct page *page = get_user_page_lookup_vma(mm, addr,
>  							     gup_flags, &vma);
>  
>  		if (IS_ERR(page)) {
> @@ -7167,7 +7167,7 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
>  		struct page *page;
>  		struct vm_area_struct *vma = NULL;
>  
> -		page = get_user_page_vma_remote(mm, addr, gup_flags, &vma);
> +		page = get_user_page_lookup_vma(mm, addr, gup_flags, &vma);
>  		if (IS_ERR(page)) {
>  			/*
>  			 * Treat as a total failure for now until we decide how
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 1c77d5dc06e9..b36f2e219b8f 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2838,7 +2838,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
>  	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
>  	 */
>  retry:
> -	page = get_user_page_vma_remote(mm, addr,
> +	page = get_user_page_lookup_vma(mm, addr,
>  					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
>  					&vma);
>  	if (IS_ERR(page))
> -- 
> 2.53.0-Meta
> 
> 

