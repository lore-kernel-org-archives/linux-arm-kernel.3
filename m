Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B34DC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5LjwyqHv+cuF7cox7QKxMaKT1u+xe8DMZ1+K1paDkg=; b=CkkmeyAELM+g7mdXrbYL4l84KJ
	X2xAGtY8nr2Hyr0ZUVQ0PVhvUvAGTLCIyNJy3bKxJKo4lKe+IKlL20mQnQfXuchgC77C0jQvcyZR3
	5haZl6+Pd0YZ7IfhC8eoGLmFPmANwSgHO9REtIcxeitsJDTpXI77pBjeQHai61YYSEcWaOCv+kOWS
	NVmnwotGHvK/47zfgsPAgaPjSgZYJjDQb4gumIj1tUUuk4ktmMaZLkrh7jbkfdncekiCUYM/yRDvx
	/cFJfnKFgtFi9g7XkICEe6PQqUrbUQ0S0R3wtAc33Ce0kDCDIRQJ8L1FDbohD7hikAcazYI0njII3
	fhR/ALdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGxt-0000000CHtI-3nO3;
	Tue, 02 Jun 2026 04:42:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGxr-0000000CHsi-0VcD;
	Tue, 02 Jun 2026 04:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EBE56001A;
	Tue,  2 Jun 2026 04:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758F31F00893;
	Tue,  2 Jun 2026 04:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780375374;
	bh=q5LjwyqHv+cuF7cox7QKxMaKT1u+xe8DMZ1+K1paDkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NX7UIQafey5Ppn3S4T1W8ulKWcx4GVHL15p4QQacar67iFhuJ0SNvibBo7j5gjswm
	 JcsAqP7zzZJzRnXqBdU6QzcN+4R7VKIeX8Xdykkre0iNXgb6t953myJbsK50zpg649
	 HE0ZA2rzhJDVPZNjRWV9WaDh9YH2eHkyATGegZvIUvbXG5v8xMKnkL74KMQNC/kNlZ
	 KmgKKRYH1J5c1mXc7/VgzS/aLHeNKUEj83ZfX+Ne/KdABkR9otndfuDAiJoe5YDyPi
	 XDsF7iWnVbPKMaoX/HaJJ0jS+/fBdjlRU2RNdW2K5dYPOAPsoYmXIasV6MVTYSvymN
	 PNjrjnre0i6Pw==
Date: Tue, 2 Jun 2026 06:42:45 +0200
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>,
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v3 2/5] arm64/mm: drop vmemmap_pmd helpers and use
 generic code
Message-ID: <ah5fRXPvpOSmKoxl@localhost.localdomain>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-3-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084845.3792171-3-songmuchun@bytedance.com>
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

On Mon, Jun 01, 2026 at 04:48:41PM +0800, Muchun Song wrote:
> The generic implementations now suffice; remove the arm64 copies.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Acked-by: Will Deacon <will@kernel.org>

Reviewed-by: Oscar Salvador (SUSE) <osalvador@kernel.org>

> ---
> v2->v3:
> - Collect Acked-by from Will Deacon
> ---
>  arch/arm64/mm/mmu.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 24388e5c727d..ea10b0ebecd7 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1776,20 +1776,6 @@ static void free_empty_tables(unsigned long addr, unsigned long end,
>  }
>  #endif
>  
> -void __meminit vmemmap_set_pmd(pmd_t *pmdp, void *p, int node,
> -			       unsigned long addr, unsigned long next)
> -{
> -	pmd_set_huge(pmdp, __pa(p), __pgprot(PROT_SECT_NORMAL));
> -}
> -
> -int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
> -				unsigned long addr, unsigned long next)
> -{
> -	vmemmap_verify((pte_t *)pmdp, node, addr, next);
> -
> -	return pmd_leaf(READ_ONCE(*pmdp));
> -}
> -
>  int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap)
>  {
> -- 
> 2.54.0
> 
> 

-- 
Oscar Salvador
SUSE Labs

