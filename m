Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98D2C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhTPrG3YQEfBVn0yyzrLN6C3o96SAGlfQ2/4r1lWCWQ=; b=tTw4zLce7d7CCUuzW3+VqXRPjY
	iod4sJXNoQKEp3Bt6pAArE2sSK62kkngoZvxMIuC247JD++vfkICgpcJLRbCtJU4vr9QgrCoC94uR
	c6u9sqjEFNUTVu8942FuWgGjx536ZxOP5I7TmTeNgetgUP5zEpxZFhopevi9XibssjpXG+3QdhkWg
	y32E4lx3x0dvXeC4E3ZDrHphNXGuQ3H7Kkp5BfVGNC9p3Rupqa7l9/wRGQ39YHWBHZlfZJvLwcmAr
	BEWqHnXTRBDbmlbU9cA2c/mgCg8MwjVE7Z5Vw7/f88Bo98AylHTwS7aLGL4s2qqSSl+AOXeQ8UjYZ
	JoJZSvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJd-0000000H8Qo-3FHI;
	Thu, 16 Jul 2026 11:31:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKJc-0000000H8QJ-18DE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:31:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6FC84186F;
	Thu, 16 Jul 2026 11:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECA71F00A3A;
	Thu, 16 Jul 2026 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784201503;
	bh=ZhTPrG3YQEfBVn0yyzrLN6C3o96SAGlfQ2/4r1lWCWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CU8PyQnpbvCRE3vUmMHtzieTpGX2UBTMwb0mi88LgLxkSs8B/ksftCcM5iz3NUd7A
	 fb8sHvnwCl7Rr4+CQEHwLGQjWOD3HXM5jPd5Cc8rCwwABcs8eQ+BKe0BjntQ/EVekx
	 dCYd2NVN2TxTIh+bleHc9Mrq3zRtYkVxaE0UqGfb4CkNFltxw8JAppM9iqDmYpCTt0
	 gr4x6uAHVmNLV4MlaNFHizKmi/tvmxJdDgxQqcFCa06FzxAgCNdY51pKLaGwJPAlOY
	 1KPwHyfp5KJywmQSfRSQ0QHUlhb6Srefcz+e9NxqkaeYr/Q75MW2N2bjgJnsxF9rfo
	 ndpfdliuZ0loQ==
Date: Thu, 16 Jul 2026 12:31:35 +0100
From: Will Deacon <will@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>,
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
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
	abarnas@google.com
Subject: Re: [PATCH mm-hotfixes v3 2/4] x86/mm/pat: acquire mmap lock on page
 table free to avoid ptdump UAF
Message-ID: <aljBF-am7dqqG8Gd@willie-the-truck>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714-series-vmap-race-fix-v3-2-b812eccfa0f9@kernel.org>
 <alemS7vxeRB7NcBO@willie-the-truck>
 <alesCtwXdIqH6bOP@kernel.org>
 <178419641178.59347.17339330762419756196.b4-reply@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178419641178.59347.17339330762419756196.b4-reply@b4>
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

On Thu, Jul 16, 2026 at 11:06:51AM +0100, Lorenzo Stoakes (ARM) wrote:
> On 2026-07-15 18:49 +0300, Mike Rapoport wrote:
> > On Wed, Jul 15, 2026 at 04:24:59PM +0100, Will Deacon wrote:
> > > > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > > > index d023a40a1e03..4c4b8244502f 100644
> > > > --- a/arch/x86/mm/pat/set_memory.c
> > > > +++ b/arch/x86/mm/pat/set_memory.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <linux/cc_platform.h>
> > > >  #include <linux/set_memory.h>
> > > >  #include <linux/memregion.h>
> > > > +#include <linux/cleanup.h>
> > > >
> > > >  #include <asm/e820/api.h>
> > > >  #include <asm/processor.h>
> > > > @@ -436,9 +437,16 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > > >
> > > >  	flush_tlb_all();
> > > >
> > > > -	list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
> > > > -		list_del(&ptdesc->pt_list);
> > > > -		pagetable_free(ptdesc);
> > > > +	/*
> > > > +	 * ptdump might read these page tables, so avoid a use-after-free by
> > > > +	 * acquiring the mmap read lock on init_mm (ptdump acquires the mmap
> > > > +	 * write lock).
> > > > +	 */
> > > > +	scoped_guard(mmap_read_lock, &init_mm) {
> > > > +		list_for_each_entry_safe(ptdesc, tmp, &pgtables, pt_list) {
> > > > +			list_del(&ptdesc->pt_list);
> > > > +			pagetable_free(ptdesc);
> > > > +		}
> > >
> > > As I understand it, the argument for taking the read lock is that we're
> > > operating on a region that we "wholly own" and therefore we can happily
> > > run concurrently with CPUs walking distinct parts of the page-table.
> > > However, from what I can tell, the CPA collapse logic will operate on
> > > regions outside of the address range being manipulated by its caller
> > > because it rounds up to the PMD size.
> > >
> > > As a made-up example, imagine I have a 2MiB aligned region where the
> > > first 1MiB is read-only and the second 1MiB is in the default r/w state.
> > > If one CPU calls set_memory_rw() on the first 1MiB while another CPU is
> > > walking the second 1MiB (via some other API that doesn't take cpa_lock),
> > > it looks to me like the first CPU can collapse the page-table and free
> > > the unused pages under the feet of the other CPU. What prevents that
> > > from happening?
> >
> > Nothing, and there's a patch to fix that that synchronizes
> > cpa_collapse_large_pages() using cpa_lock:
> >
> > https://lore.kernel.org/all/20260626163213.2284080-1-den@openvz.org

Hmm, but that relies on all concurrent walkers taking cpa_lock, no? Surely
that's not generally the case.

> Thanks Mike!
> 
> >
> > This still won't be enough to sync with ptdump though.
> 
> Yeah, so this patch is still necessary.
> 
> But that patch conflicts with this one as it holds a spin lock over the page
> table freeing, which prevents taking an rwsem... :/
> 
> Anyway I think this one is still fine as it seems there's not a consensus over
> there as there was discussion about just removing the locking anyway ([0])?
> 
> So can kick that can down the road and just get these ptdump bugs fixed :)
> 
> >
> > > If all concurrent walkers have interrupts disabled, I guess the TLB
> > > invalidation logic would do it, but it would be good to call this out in
> > > the commit message because it's not clear to me why the read_lock is
> > > sufficient for the collapsing case.
> 
> Yeah, so this patch is _only_ fixing the ptdump case. Any existing bug must be
> addressed separately.

Up to you folks, but if you took the write lock during collapse wouldn't
that fix it for all concurrent walkers and we wouldn't need another patch?

I would argue that using the read lock here directly contradicts the
rationale for why this is safe, because this is an occurence of code
that operates on a range that it doesn't wholly own. It seems bizarre
to me to go to the effort of adding locking, but then not adding
sufficient locking for all concurrent walkers.

Will

