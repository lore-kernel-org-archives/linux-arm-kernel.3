Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323B9CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgcDdqOqUi/8D0xc5CjYvzb5Vi4Dqd8Gi3YciLv8nXI=; b=wHnfHTMCHG7VjhxgN4+XXRGuje
	uBEpHIvbYJRHJtPl/4ija8IcBodKVCHDK2czwabwJC0r6UVW9xbBuAslqneBO4BDMc7Q6NZEnklHN
	6klDY015bg125u2i1528f2Gy6cgHMm8+GBw8/wvBxfw+yRJj6r/IQ5vGuOEH6uw7QqR7xM10iK7bu
	NzpX/XWyO96o+grpEoUPzrCr2Gwxm0psI9cN8MjH7MFWYKN7+3MGUUwFTDjFO5Z8OTpYYBHi1Aw69
	Pi/igeF3wFB0ExrJjSCc6LYWI8nqutGsxZNs+8qtPCnw7LNlxVKvFnY4sdDn4hbB0vCAUhsfMmAFD
	2kYzkCAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCl9-0000000CqOF-0xVw;
	Thu, 04 Sep 2025 16:24:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8Yv-0000000BO0g-396t;
	Thu, 04 Sep 2025 11:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 235AD60212;
	Thu,  4 Sep 2025 11:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A6DC4CEF0;
	Thu,  4 Sep 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986932;
	bh=L9cH6bNwYJRlk6FzxhgqsLMYSpGTEmwCEBwi3x9KT/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6mjvK+469qhzIL3ZY7OLkZG43jt44zcrcpC0SLg+x90jVrWCN4wHiXo7MpMy7adT
	 rFtCuOtKzPv3SCl+1a8iA9VpOzMBrPDZJJ1d9Vgu/n0MZO+y/Z28JeLMsddhB0cWea
	 RleDBDLnf3OLJlwClV84wBgTsGkZkS81LNVCy38Ye4/7nOnd4gE/t0eSwIeO5ttp3B
	 H+owTOKY2NwyL6jQxgmnOxrwFpmn6Ou6pQwbhAXkR9KUmS6EjJSZ5jPtIfC8BuANMa
	 8R3iX32k2EwaEj3QR0QO5ZPrGtPX/z8LW7tiqgfBgjIhl4xmzLimlzEm30SP6ANOKo
	 kaDVgda/8+bIA==
Date: Thu, 4 Sep 2025 14:55:21 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Justin Sanders <justin@coraid.com>, Jens Axboe <axboe@kernel.dk>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/7] Cleanup free_pages() misuse
Message-ID: <aLl-Kd4nmgSEr8WV@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
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

On Wed, Sep 03, 2025 at 11:59:14AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() is supposed to be called when we only have a virtual address.
> __free_pages() is supposed to be called when we have a page.
> 
> There are a number of callers that use page_address() to get a page's
> virtual address then call free_pages() on it when they should just call
> __free_pages() directly.
> 
> Add kernel-docs for free_pages() to help callers better understand which
> function they should be calling, and replace the obvious cases of
> misuse.
> 
> Vishal Moola (Oracle) (7):
>   mm/page_alloc: Add kernel-docs for free_pages()
>   aoe: Stop calling page_address() in free_page()
>   x86: Stop calling page_address() in free_pages()
>   riscv: Stop calling page_address() in free_pages()
>   powerpc: Stop calling page_address() in free_pages()
>   arm64: Stop calling page_address() in free_pages()
>   virtio_balloon: Stop calling page_address() in free_pages()

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  arch/arm64/mm/mmu.c                      | 2 +-
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  arch/riscv/mm/init.c                     | 4 ++--
>  arch/x86/mm/init_64.c                    | 2 +-
>  arch/x86/platform/efi/memmap.c           | 2 +-
>  drivers/block/aoe/aoecmd.c               | 2 +-
>  drivers/virtio/virtio_balloon.c          | 8 +++-----
>  mm/page_alloc.c                          | 9 +++++++++
>  8 files changed, 19 insertions(+), 12 deletions(-)
> 
> -- 
> 2.51.0
> 
> 

-- 
Sincerely yours,
Mike.

