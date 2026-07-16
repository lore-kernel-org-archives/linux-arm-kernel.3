Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5683C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/SyxMPIaPUuP8evJ5FrQ+d3a/rGOBD7f2mYFAW4BZY=; b=YjefltLuG1uL1i6WzQq1qMnBFN
	3JD30OD38ClVYUjcFdoVCJMBRZm5VsHggR97c7mkxlccodLP6i+v7pjp2UtiNZFe9Zle8rjxpgPC7
	YwPOcvZj14zoX5VfufKbzwZthUCsgMUL/hiknO3m1sNL4Wv4icbX8OayAqdHNE45umm9Z/Vn54LIX
	eJFwGVg1+galGuG3N0llgO5PNy7oLqSIewE6SapTrouivHqf4Ueqo6OLtv9qt3Z3s/6lGSzABp2RZ
	AROhFcE4DHKD+R+p3kmEVeH6axfPOkS9OUUJTXMAP1AUCjRBSE4O2ABu0vuh3vRU88gHKIQcsr1a1
	2jQXBcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIo4-0000000Gw7V-37zm;
	Thu, 16 Jul 2026 09:55:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIo3-0000000Gw6t-1x8R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:55:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0893943AF3;
	Thu, 16 Jul 2026 09:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9905A1F000E9;
	Thu, 16 Jul 2026 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784195702;
	bh=0/SyxMPIaPUuP8evJ5FrQ+d3a/rGOBD7f2mYFAW4BZY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ox/bS8GOAiz3ddOEb5s6tXfBT47YKSkPHImeTD5McWUIQJirA93UP+YdQ+CCxYrK2
	 XadnBH1n9BEZu6pLviso5nDeoDyb5gOcCHLglh0iALbqqZIJtRIXhjeom4dIyqFJ/y
	 lXBichlZN0LXLt4LEVvE03cOWN2fcl+R6f2M6pvJpiXppA9EjknjVsmlbEfngNR8YR
	 p3GPYWk11s9QCNhy6RyoZ0mxvIYPsRbrdczK9NJJ1XeUHWBjKGIt8nfaBNo6wM6T+T
	 YCBfEGG+CUxhcq/+psTJ5H3Nc0rnt60cd8gRWf1EdOLExy4mkNiuxOEimRxbP3sPXz
	 k8iCp344bixkg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH mm-hotfixes v3 1/4] mm/vmalloc: acquire init_mm lock on
 huge vmap to avoid ptdump UAF
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Kiryl Shutsemau <kas@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com
In-Reply-To: <20260715121452.3e8047663eeaaa3048f80985@linux-foundation.org>
References: <20260714-series-vmap-race-fix-v3-0-b812eccfa0f9@kernel.org>
 <20260714-series-vmap-race-fix-v3-1-b812eccfa0f9@kernel.org>
 <aldhVdwj9oMRN1Lk@thinkstation>
 <178412496800.59347.11482869717348078349.b4-reply@b4>
 <20260715121452.3e8047663eeaaa3048f80985@linux-foundation.org>
Date: Thu, 16 Jul 2026 10:54:42 +0100
Message-Id: <178419568212.59347.281101439296944826.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3870; i=ljs@kernel.org;
 h=from:subject:message-id; bh=a3CCqUij9CeairDpkpveB5vWdZj6OHQzdpzaVSurYpQ=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLIiViXLzvfdvWpHXm8JowZLd/gCGQaViuLTDDPKU/ksu
 sW/7D/XUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgIvsZWSYO3PrIh6mG7LObzIv
 HPh0fdN9HnOOArWtLj9q3VIWL7rTwMhwm88zw6rY416zv/DxR1f+PW27sGV/znlhyxOv5CXOWpW
 xAgA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

On 2026-07-15 12:14 -0700, Andrew Morton wrote:
> On Wed, 15 Jul 2026 15:16:08 +0100 "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
>
> > On 2026-07-15 11:34 +0100, Kiryl Shutsemau wrote:
> > > On Tue, Jul 14, 2026 at 06:24:23PM +0100, Lorenzo Stoakes wrote:
> > > > Currently there is a nasty race between ptdump and vmap when attempting to
> > > > map a huge P4D, PMD or PUD entry:
> > >
> > > Nit: that's a strange order of levels :P
> >
> > Ha, seems I couldn't decide on ordering so went with something random :P
> >
> > Let's try 'P4D, PUD or PMD' instead :))
> >
> > >
> > > > Fix this by holding the mmap read lock in vmap_try_huge_*() when freeing
> > > > page tables.
> > >
> > > How about adding here something like:
> > >
> > >   The read lock is sufficient: ptdump is the only walker that must be
> > >   excluded and it holds the mmap write lock. Other holders of the read
> > >   lock may run concurrently, but each exclusively owns the range it
> > >   operates on and cannot reach the page tables freed here.
> >
> > You mean maybe I put the commit message on _too_ much of a diet? :)
> >
> > Yeah sure, sounds good.
>
> I made this changelog alteration:
>
> --- a/txt/mm-vmalloc-acquire-init_mm-lock-on-huge-vmap-to-avoid-ptdump-uaf.txt
> +++ b/txt/mm-vmalloc-acquire-init_mm-lock-on-huge-vmap-to-avoid-ptdump-uaf.txt
> @@ -103,6 +103,11 @@ walk_page_range_debug(), vmap takes no relevant locks at all.
>  Fix this by holding the mmap read lock in vmap_try_huge_*() when freeing
>  page tables.
>
> +The read lock is sufficient: ptdump is the only walker that must be
> +excluded and it holds the mmap write lock.  Other holders of the read lock
> +may run concurrently, but each exclusively owns the range it operates on
> +and cannot reach the page tables freed here.
> +
>  We also hold the lock while assigning the huge page table entry, which
>  means page table walkers observe only the huge or non-huge page table
>  entry.

Perfect, thanks!

>
> > >
> > > > +	/*
> > > > +	 * Kernel page table walkers either walk ranges they own exclusively or
> > > > +	 * hold the mmap write lock on init_mm (ptdump being the motivating
> > > > +	 * case).
> > > > +	 *
> > > > +	 * Therefore, acquire the mmap read lock to prevent use-after-free when
> > > > +	 * freeing page tables.
> > > > +	 */
> > >
> > > Same for the comment, maybe:
> > >
> > >       /*
> > >        * Acquire the mmap read lock to exclude ptdump, which walks
> > >        * kernel page tables it does not own under the mmap write lock.
> > +	 *
> > >        * Concurrent read lock holders are safe: each exclusively owns
> > >        * the range it operates on and cannot reach this page table.
> > >        */
> >
> > Yeah that's better agreed.
> >
> > Let's replace it, but I think (being super nitty) with an extra blank line as
> > above.
>
> This?
>
> --- a/mm/vmalloc.c~mm-vmalloc-acquire-init_mm-lock-on-huge-vmap-to-avoid-ptdump-uaf-fix
> +++ a/mm/vmalloc.c
> @@ -163,12 +163,11 @@ static int vmap_try_huge_pmd(pmd_t *pmd,
>  		return pmd_set_huge(pmd, phys_addr, prot);
>
>  	/*
> -	 * Kernel page table walkers either walk ranges they own exclusively or
> -	 * hold the mmap write lock on init_mm (ptdump being the motivating
> -	 * case).
> +	 * Acquire the mmap read lock to exclude ptdump, which walks kernel
> +	 * page tables it does not own under the mmap write lock.
>  	 *
> -	 * Therefore, acquire the mmap read lock to prevent use-after-free when
> -	 * freeing page tables.
> +	 * Concurrent read lock holders are safe: each exclusively owns the
> +	 * range it operates on and cannot reach this page table.
>  	 */

Yes that's great thanks!

>  #ifndef CONFIG_ARM64
>  	scoped_cond_guard(mmap_read_lock_try, return 0, &init_mm)
> _
>
>
>

Cheers, Lorenzo


