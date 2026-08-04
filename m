Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CCAC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/inuUUE7PQn5pXqFZbcUUpwxLgwvoHVFospppktrMWw=; b=R4sP/xO/c5bCwCISiShlCIXkuZ
	aXhVsHPUM4/VEWV4bnT2XH7VcDByoJOH+91L8cx1Osxcg6P0JtPSLv6drC3qZYQ0FtlPE93IZMcnP
	dhtMWOvV8UlhwdKkWSlOcU01018ViDWSwFGMld03zKsJZTc59lMkizKam6rOlsUJm31pTNIe/7poQ
	Np4n0HfPsenZFDtakckIG3JAsxIC1cOfw+9zBFEdOpCAMQHEi/M3GS0ZxZUI3xizr3RDyUcWQ0Xsa
	JwxC048gE2/Du3Xsj5lh3O36vHUNPyFrb0D3f5RFUsQCe8iYlwBMQ+/a51GkKxZk/JdRViY3rFMW+
	hhqyQfhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr940-00000001AHl-3IZ0;
	Tue, 04 Aug 2026 06:55:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr93z-00000001AHH-0tqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:55:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2446D41367;
	Tue,  4 Aug 2026 06:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F421F000E9;
	Tue,  4 Aug 2026 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826545;
	bh=/inuUUE7PQn5pXqFZbcUUpwxLgwvoHVFospppktrMWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mbNtAUP7NOImB5wZVPLajIJgt4qTJhcRTQR41c7f2f8IbyJ6bfKgDBznp+BZNkAfH
	 +C/lABCLKP88/irz3UbNtfv/pPXh9AjZHY4trB4h6AGmGfEQh+JwOB4NW5DBIJD5tC
	 OI/Sk6b2gqN3cc+YfZfxLjpRh/RW80NbiEAajjiqNXIZcNueCUj4JirZZ4/Rt10bN8
	 M98wQAMK5WdctyKVs4LcJQ44Iv18jQuihXX+1qp1ZlOh8GG31G4+BvBZkhznZUqd59
	 7/hhxUzQ0G7wJQPqlje6p0OBqkYpqeyV2qkT0/7QqK8dGrIJS7VB0cG4F3oXKySaSa
	 AVStjbMOY0Jhg==
Message-ID: <d031d9f5-b248-4251-9214-448b7be5bd3e@kernel.org>
Date: Tue, 4 Aug 2026 08:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] mm: add basic PTE const type-safety
To: Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
References: <20260803164400.531199-1-pfalcato@suse.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260803164400.531199-1-pfalcato@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 03/08/2026 à 18:43, Pedro Falcato a écrit :
> Since forever, MM code has thrown pte_t * around with no concern for const
> safety, or typesafety of any kind. This is confusing. Attempt to address it
> by:

What do you mean by "typesafety of any kind" ?

On powerpc64, pte_t is a struct so you can't play-up too much with it.

On powerpc32, pte_t is a long int because having it as a struct is 
counter-performant, but we have it as a struct when __CHECKER__ is 
defined, ie when doing a sparse check with 'make C=2'.


> 1) Making sure pte_get*() helpers can cope with const pte_t * arguments
> 2) Constifying the pte_offset_map_ro_nolock() return type, which by definition
> already pledges that users will not write to it.
> 
> These two simple steps were already able to uncover code smell from
> khugepaged + do_swap_page().
> 
> Separate steps could include introducing pte_offset_map_ro_lock() for more
> widespread usage of this.
> 
> Benefits of this include less confusion and better type-safety. It could also
> futurely aid in efforts such as [0] which may want semantic annotation of these
> accesses.
> 
> Based on mm-unstable and compile-tested on a handful of architectures.
> 
> No functional changes intended.
> 

For the series,

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



> [CC list editorially trimmed for brevity reasons; apologies if you're not on it]
> 
> Link: https://lore.kernel.org/linux-mm/20260526-kpkeys-v8-0-eaaacdacc67c@arm.com/#t [0]
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: "Liam R. Howlett" <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lance Yang <lance.yang@linux.dev>
> Cc: Usama Arif <usama.arif@linux.dev>
> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
> Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-mm@kvack.org
> Cc: linux-fsdevel@vger.kernel.org
> 
> v2:
>   - Small fixups on the arm64 side
>   - Re-order patches in a way such that bisection is preserved
>   - Pick up Helge's patch dropping parisc ptep_get()
>   - Constify s390's ptep_get() as well
> 
> Helge Deller (1):
>    parisc: Drop own implementations for ptep_get() and
>      ptep_test_and_clear_young()
> 
> Pedro Falcato (5):
>    mm/arm64: constify pte_get*() and contpte get logic
>    mm/powerpc/8xx: constify ptep_get() argument
>    mm/s390: constify ptep_get() argument
>    mm: constify generic pte_get*()
>    mm: constify the pte_offset_map_ro_nolock() return value
> 
>   arch/arm64/include/asm/pgtable.h             | 10 +++++-----
>   arch/arm64/mm/contpte.c                      | 11 ++++++++---
>   arch/parisc/include/asm/pgtable.h            | 20 --------------------
>   arch/powerpc/include/asm/nohash/32/pte-8xx.h |  2 +-
>   arch/powerpc/mm/pgtable.c                    |  2 +-
>   arch/s390/include/asm/pgtable.h              |  2 +-
>   include/linux/mm.h                           |  4 ++--
>   include/linux/pgtable.h                      |  8 ++++----
>   mm/filemap.c                                 |  2 +-
>   mm/khugepaged.c                              |  2 +-
>   mm/pgtable-generic.c                         |  4 ++--
>   11 files changed, 26 insertions(+), 41 deletions(-)
> 


