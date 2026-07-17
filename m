Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B798C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMxcpm+IoVsxd9X54J6KG7SdZat99QLXoKqL6gFffBA=; b=D5ZRUamXsHkLe5GXWQmvjl1a7K
	ZbwwZmyUzm61ldo/N/WRlXcy9/bnics3u2TqN5ZkjJXxTM7a+knPNzPs+fOXv8v6KzkmgcCNFK03W
	YZ6Xsz+1ECZ4M2KfmVaRvL4ZoPrE+Vy4i6cy4C51nDjNK+sBqk+6yVbVpXmdDSlMNHFuovYJJvsXU
	fKJh0+cyxf9W6NZVlmTKu88uCUZVC9EL+cN4M9ldKgemdnDx0Xq/KPw2X9ECySuqQ6UiXNMackM9w
	W6A7tRPlhPsg96bXfFPrvxzL2upk8VqxyDtbvKTFJUD11c/Jz2FWMmDVW0PHgyWv24Xuf8lWQxCu5
	0z1nVl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgw7-00000002Ava-41N6;
	Fri, 17 Jul 2026 11:40:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgw7-00000002AvS-0CDZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:40:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FAD143B13;
	Fri, 17 Jul 2026 11:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5B41F000E9;
	Fri, 17 Jul 2026 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288458;
	bh=wMxcpm+IoVsxd9X54J6KG7SdZat99QLXoKqL6gFffBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F+ylRJNlTcwJhGBJ01DIn7oLm7TXQAXu2+mO4HsHi6022TFDme52Ltzf3ykFIWRiX
	 sDUdKjTGWVvaP9TatyQ/XjfOHTVub9UT1FV65inDcTpw4W8oOP9O6WVi9El6ZeqsqJ
	 m46cQ0zYPorXuwz6Y8HY8rwe2DW1IF0j5tCHwJX9N192yjBgysenD381xVaGlm/Fvk
	 Cvsz+r+CrYck/qWkFmT6wVGOyFCWQqzs3VrwfmwtwPew8yesYwgkFpSzcvp0B+O/Fz
	 6Ct97dz1xPU8clKQl2wZ+nr4fCUbBsTibi8odepAZRFcXrNNRwCVOw1m3xVZHW8xNn
	 UNs+8qr93MSiw==
Date: Fri, 17 Jul 2026 12:40:38 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>
Cc: David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v4 2/4] x86/mm/pat: acquire init_mm write
 lock to avoid UAF
Message-ID: <aloAVwijpWpfO-5n@lucifer>
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

OK so note to self - don't send series late in the evening when you're
exhausted :)

I rather glossed over the problem, Will's reply, and Denis's excellent bug
report at [0].

So. The (other) problem with CPA, as Denis pointed out, is that
__change_page_attr() can update something in a page table that is
concurrently being torn down, with set_pte_atomic() being the point at
which the UAF occurs.

With the switch to a write lock we can simply do:

	scoped_guard(mmap_read_lock, &init_mm)
		ret = __change_page_attr_set_clr(&cpa, 1);

In change_page_attr_set_clr().

Since CPA_COLLAPSE is only ever invoked via set_memory_rox() collapse is
only done via change_page_attr_set_clr() and this covers all callers which
are impacted by this.

If people are agreeable to this I will respin with an additional patch to
do this, as it makes sense to bundle it in this series with its depend
change (this patch) included and properly ordered.

Cheers, Lorenzo


[0]:https://lore.kernel.org/all/20260626163213.2284080-1-den@openvz.org/

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
>
> It is safe to acquire a sleeping lock as all the callers invoke
> set_memory_rox() from process context and in any case,
> change_page_attr_set_clr() calls vm_unmap_alias() which ultimately takes a
> mutex, disallowing atomic context here.
>
> Fixes: 41d88484c71c ("x86/mm/pat: restore large ROX pages after fragmentation")
> Cc: stable@vger.kernel.org
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  arch/x86/mm/pat/set_memory.c | 15 ++++++++++++++-
>  include/linux/mmap_lock.h    |  2 ++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
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
> +	 */
> +	scoped_guard(mmap_write_lock, &init_mm)
> +		__cpa_collapse_large_pages(cpa);
> +}
> +
>  static void cpa_flush(struct cpa_data *cpa, int cache)
>  {
>  	unsigned int i;
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 6b5c2390cc30..047f5f5e2c34 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -621,6 +621,8 @@ static inline void mmap_read_unlock(struct mm_struct *mm)
>
>  DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
>  	     mmap_read_lock(_T), mmap_read_unlock(_T))
> +DEFINE_GUARD(mmap_write_lock, struct mm_struct *,
> +	     mmap_write_lock(_T), mmap_write_unlock(_T))
>  DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
>
>  static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
>
> --
> 2.55.0
>

