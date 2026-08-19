Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AD5C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 06:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d351kwETeBhwKUAevfFIdhiS/3pPYk4RDmKm2u9Xu0=; b=B9fpfxDsAahO6Y1mRRYNcwjIfs
	jPId8Fqh3OJMypRtjXie5F5VkFTgN9eLvND0I1LJJBkgDS4iQkR3dYVa2QrA3QBTozYa4tY6wdUfY
	V0eYLWu2jZUJkwveAkb+41lCTXhDNjde2Vwyt+mJ245DOho7PZmShVY+NTJdsL9zb5WKm3wDJwMhi
	vQZ2PM6ubfD4ZDt8ELIc2fCW+qnrUQgwveFKdGmb8czoalb4iNyNTRlGj+8k8AvLbfrB5RTnL0W1Z
	nuJfCh11+b9lG76plNhEf8Q68cXyqJHW5JY554Qr/qb2PRnQNzxJVWo43pU7//17QPdKidi4Zzvtu
	wZp35CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaAC-000000097y0-0ig1;
	Wed, 19 Aug 2026 06:52:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaAA-000000097xc-0qst;
	Wed, 19 Aug 2026 06:52:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACAF0436FF;
	Wed, 19 Aug 2026 06:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7811F000E9;
	Wed, 19 Aug 2026 06:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787122357;
	bh=7d351kwETeBhwKUAevfFIdhiS/3pPYk4RDmKm2u9Xu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WkLTMf+qpN/io805Y+2gkeOkMbkpIKzf/6QzY2J/6Bl2FWOx3hYwxZqHUNh5M4dgw
	 NmuyAHXcBRvh2GxscHJW61nXGUBR8lNKbUmLxqWPpQcQgLHWUAVlSWz6LVoosdqCUL
	 ZEmosEMGQfwSgXLsUlMUGHaMqKfk3Jvw8lbWY34WrNbJ3DRB7qmc/YZZa7OShj2kZU
	 9F9gzCeo4nBVxNMDWaMYPftvg52ti3BnqeVARRjJq5cVbN2pVAHAoYGhFw0l1dFtDu
	 nWSAaMBzSD2S1DqUVmDAMWvEN7eDywpx8rVr2/eMxUkxs3qh6vnl3GoJDWDRt0ReB8
	 kGYH6E45e0M5Q==
Date: Wed, 19 Aug 2026 09:52:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Brendan Jackman <brendan.jackman@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 1/6] set_memory: add number of pages parameter to
 set_direct_map APIs
Message-ID: <aoVSpnf-b-btyHR9@kernel.org>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-1-90944a3ad43f@kernel.org>
 <DKR7IK0VAERF.3ALVHRNQMSXZU@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKR7IK0VAERF.3ALVHRNQMSXZU@linux.dev>
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

On Mon, Aug 17, 2026 at 02:10:39PM +0200, Brendan Jackman wrote:
> On Sun Aug 16, 2026 at 12:59 PM CEST, Mike Rapoport (Microsoft) wrote:
> > When set_direct_map APIs were introduced by the commit d253ca0c3865
> > ("x86/mm/cpa: Add set_direct_map_*() functions") the single page
> > parameter made sense because the initial callers (vmalloc and
> > hibernation) had sets of unsorted struct pages that required changes of
> > their mappings in the direct map.
> >
> > Since there is an increasing demand for direct map manipulation and it
> > is also desirable to be able to update larger physically contiguous
> > mappings, for example an entire large folio, extend set_direct_map APIs
> > to receive number of pages parameter.
> >
> > As there is still only a handful of callers, change the existing
> > functions directly and update all the call sites rather than adding
> > wrappers for single page case.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> I think if we add this arg we also need to specify how the
> implementations are supposed to behave when they fail midway?

This is the same as set_memory, I don't think it deserves a special care
right now.

> IIUC the incumbent answer for stuff like this is:
> 
> - The implementation might leave partial modifications behind when it
>   fails. The caller needs to deal with that.
> 
> - ... But, that's gonna be due to allocation failure. So the caller can
>   just do the inverse operation in the failure path as a cleanup, and
>   assume that inverse operation succeeds since the pagetables are
>   already allocated up to the failure point.
> 
> I guess it's worth making that a sort of explicit contract since it
> makes certain implementation details load-bearing, e.g. I think...
> 
> - It forces the pagetable update algorithm to work in a fixed order.
> 
> - it forbids us to e.g. merge PTEs into a PMD if the region might be
>   pending such a cleanup, since it would force that cleanup to
>   reallocate a PTE table.

I'd leave the load-bearing parts for now ;-)

I'm going to resend the patches that generalise CPA and I'll add some docs
to that set.

[1] https://lore.kernel.org/linux-mm/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org/

-- 
Sincerely yours,
Mike.

