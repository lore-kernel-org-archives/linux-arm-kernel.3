Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED96C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6LIA9xy4MVWHQMeHkXNEKMdqJT84UpgNFBIQAES/qE=; b=q1jDeVIknFKtrbO21H43H2MAxs
	u556cGQt4M+RYNFOaw6mIHJ3TRSB9h7WodCioyLJo0Tu5R7fkqA91XvQfSVkMZSSq1RpEM6lngW0N
	ctYIMQNEmPManlxZ7V/29jOKv6Ydh0nXwb78Pl1UGP4jHHaYMFUWEFyorhKLrydBq7+lxDewWeoSi
	4bODTrdpJANl7L+kT2oiFMMTDTKcAhEU8JF1jVex84Vf1wh/BzehA/ZeoGHVKmRTcbbEjUxwCZeVP
	azrmazpew/O4lMzcGzJ3l795k/q97NiwSf9J0WIkJMJZ8h1Glb7C79YheqkWXikBctQCcmw3lYIpV
	2B+vV99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGy4-00000003V6a-0D9S;
	Sat, 31 May 2025 07:49:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLGvv-00000003Uuf-1QaO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 07:47:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C5F25C3D84;
	Sat, 31 May 2025 07:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAB7C4CEE3;
	Sat, 31 May 2025 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748677627;
	bh=sT8ax5dbTHlITwDR7EB59IJncQ2gJREmL936Z5hIaHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m4l+/YKIs/KGay8y5vMJQ2bX/6i3fxjZ0gJ0+6SfB85gTMv9isMoswQqVsv4Dm+Yl
	 5gBNStHJ++v6+O0EtdOWObMpAyqqJtKiiiHCvqbrRYRGbqgk54Gsoto2+2xSaTGEX/
	 UjUmkcVswzLe8hErYSg4k60I8QKcdT/ikfO8I1+QYom9bCQCk6Jq/eiD5Mj9Y39hlp
	 sAiyJS/N7snMk3XQ2/Bvj/0wr0qADR+cJOCyKzCUqM5WQ0/2ASiXFMHCRpT2zrg06m
	 ciDBHHpS087W/LZIa9rTY4pgSp3axMokcqCHGPjdvNd0LKzornyQw2tVBbwFtOMgVG
	 zRx/WnEiPnYpA==
Date: Sat, 31 May 2025 10:46:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org, Jann Horn <jannh@google.com>
Subject: Re: [RFC PATCH v1 0/6] Lazy mmu mode fixes and improvements
Message-ID: <aDqz7H-oBo35FRXe@kernel.org>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <5b5d6352-9018-4658-b8fe-6eadaad46881@lucifer.local>
 <af9a96e1-064b-4627-bd34-e7e7e8a05452@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af9a96e1-064b-4627-bd34-e7e7e8a05452@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_004711_463865_B5A6548C 
X-CRM114-Status: GOOD (  34.39  )
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

Hi Ryan,

On Fri, May 30, 2025 at 04:55:36PM +0100, Ryan Roberts wrote:
> On 30/05/2025 15:47, Lorenzo Stoakes wrote:
> > +cc Jann who is a specialist in all things page table-y and especially scary
> > edge cases :)
> > 
> > On Fri, May 30, 2025 at 03:04:38PM +0100, Ryan Roberts wrote:
> >> Hi All,
> >>
> >> I recently added support for lazy mmu mode on arm64. The series is now in
> >> Linus's tree so should be in v6.16-rc1. But during testing in linux-next we
> >> found some ugly corners (unexpected nesting). I was able to fix those issues by
> >> making the arm64 implementation more permissive (like the other arches). But
> >> this is quite fragile IMHO. So I'd rather fix the root cause and ensure that
> >> lazy mmu mode never nests, and more importantly, that code never makes pgtable
> >> modifications expecting them to be immediate, not knowing that it's actually in
> >> lazy mmu mode so the changes get deferred.
> > 
> > When you say fragile, are you confident it _works_ but perhaps not quite as well
> > as you want? Or are you concerned this might be broken upstream in any way?
> 
> I'm confident that it _works_ for arm64 as it is, upstream. But if Dev's series
> were to go in _without_ the lazy_mmu bracketting in some manner, then it would
> be broken if the config includes CONFIG_DEBUG_PAGEALLOC.
> 
> There's a lot more explanation in the later patches as to how it can be broken,
> but for arm64, the situation is currently like this, because our implementation
> of __change_memory_common() uses apply_to_page_range() which implicitly starts
> an inner lazy_mmu_mode. We enter multiple times, but we exit one the first call
> to exit. Everything works correctly but it's not optimal because C is no longer
> deferred:
> 
> arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
>   <do some pte changes (A)>
>   alloc_pages()
>     debug_pagealloc_map_pages()
>       __kernel_map_pages()
>         __change_memory_common()
>           arch_enter_lazy_mmu_mode()              << inner lazy mmu region
>             <change kernel pte to make valid (B)>
>           arch_leave_lazy_mmu_mode()              << exit; complete A + B
>     clear_page()
>   <do some more pte changes (C)>                  << no longer in lazy mode
> arch_leave_lazy_mmu_mode()                        << nop
> 
> An alternative implementation would not add the nested lazy mmu mode, so we end
> up with this:
> 
> arch_enter_lazy_mmu_mode()                        << outer lazy mmu region
>   <do some pte changes (A)>
>   alloc_pages()
>     debug_pagealloc_map_pages()
>       __kernel_map_pages()
>         __change_memory_common()
>             <change kernel pte to make valid (B)> << deferred due to lazy mmu
>     clear_page()                                  << BANG! B has not be actioned
>   <do some more pte changes (C)>
> arch_leave_lazy_mmu_mode()
> 
> This is clearly a much worse outcome. It's not happening today but it could in
> future. That's why I'm claiming it's fragile. It's much better (IMHO) to
> disallow calling the page allocator when in lazy mmu mode.

First, I think it should be handled completely inside arch/arm64. Page
allocation worked on lazy mmu mode on other architectures, no reason it
should be changed because of the way arm64 implements lazy mmu.

Second, DEBUG_PAGEALLOC already implies that performance is bad, for it to
be useful the kernel should be mapped with base pages and there's map/unmap
for every page allocation so optimizing a few pte changes (C in your
example) won't matter much.

If there's a potential correctness issue with Dev's patches, it should be
dealt with as a part of those patches with the necessary updates of how
lazy mmu is implemented on arm64 and used in pageattr.c.

And it seems to me that adding something along the lines below to
__kernel_map_pages() would solve DEBUG_PAGEALLOC issue:

void __kernel_map_pages(struct page *page, int numpages, int enable)
{
	unsigned long flags;
	bool lazy_mmu = false;

	if (!can_set_direct_map())
		return;

	flags = read_thread_flags();
	if (flags & BIT(TIF_LAZY_MMU))
		lazy_mmu = true;

	set_memory_valid((unsigned long)page_address(page), numpages, enable);

	if (lazy_mmu)
		set_thread_flag(TIF_LAZY_MMU);
}

> Thanks,
> Ryan

-- 
Sincerely yours,
Mike.

