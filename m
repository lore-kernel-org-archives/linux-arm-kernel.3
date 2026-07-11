Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82008C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 06:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CucO9Dqyb3VrMc9+4nXcYsoF/W36DcjcAnqAMOVRe9s=; b=P/URY5uy5gTK0KBNxESNDcRswd
	5PmfzLFlsv4JhmzaxowlDSIHGTOr+q1wQpeTWh5+Fh5NGMuh3eAMb7MfmPLma4KjcWElFYMWaWB9k
	yn2vtlGkLcgFAJBK2DE7zQTFd3F+LYpNkQ+qZmgknrrFhQuSutZDgBlEfkhbJrP3Kc1KECL3Vsrec
	XOudn4fGHxzJncOkkTbU0JmDl1AszBnin5j8x0xq5J8w7RJET+YHSrBo77D+bCEwMG7TAUv5fEqyC
	AjAMdbFhmjTkXiQqfpCJ1BSK996ydog4edDt309TU3R+E+NIy7LRmpzSYRn54kxrYwNZ/iWT75pMV
	JuneEhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiRRK-00000006HOz-2ceg;
	Sat, 11 Jul 2026 06:43:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiRRI-00000006HOs-2UIj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 06:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 90AF043824;
	Sat, 11 Jul 2026 06:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAD41F000E9;
	Sat, 11 Jul 2026 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783752231;
	bh=CucO9Dqyb3VrMc9+4nXcYsoF/W36DcjcAnqAMOVRe9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kyjEDrRZbnsq6EmErAohHKx0a/rriFw3B5N1ibhCjSNx8H21OIRm+q3V900WWGh0l
	 JqWTXxrqiX4dLNe8nf2dzEjpz6ZD85jh+ejyXbN3AdzGllPOCFmOQ6mStXGasDd57W
	 fvgruQPeKnNXuG0IvvWCDMGGKlyv03JwfCTLtjnwN6TZwCKqr6vdJqHXt86/0cjUbW
	 nbLvLdj/8P90vzMPDSKzMRv//E7aB8JELHDpxZtygvdcLTCB/s1/LOkBzMOYAQzBVp
	 BWf8QSOKg57YH6S0MVIQ8OzpRWuXAHQCmQsmhKZIm6Uz3HyArtBPYjzUUbqNb9n5IW
	 VcwPjp61e0vpg==
Date: Sat, 11 Jul 2026 07:43:38 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	liaohua4@huawei.com, lilinjie8@huawei.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux@armlinux.org.uk, mhocko@suse.com, rppt@kernel.org, sunnanyong@huawei.com, 
	surenb@google.com, vbabka@kernel.org, xiqi2@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <alHl8C1gva6jrAV3@lucifer>
References: <akzgsZi6aKCFWg_U@lucifer>
 <20260707133527.81833-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707133527.81833-1-xieyuanbin1@huawei.com>
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

On Tue, Jul 07, 2026 at 09:35:27PM +0800, Xie Yuanbin wrote:
> On Tue, 7 Jul 2026 13:46:19 +0100, Lorenzo Stoakes wrote:
> > On Mon, Jul 06, 2026 at 09:32:47PM +0800, Xie Yuanbin wrote:
> >> I have read this article:
> >> Link: https://docs.kernel.org/mm/process_addrs.html
> >> `mmap_read_lock(&init_mm)` should be able to ensure that the kernel
> >> address's page tables can be traversed. But I'm not quite sure if
> >
> > I added a section specifically about this -
> >
> > https://docs.kernel.org/mm/process_addrs.html#traversing-non-vma-page-tables
> >
> > But note:
> >
> > "Since, aside from vmalloc and memory hot plug, kernel page tables are not torn
> > down all that often - this usually suffices, however any caller of this
> > functionality must ensure that any additionally required locks are acquired in
> > advance."
> >
> > With the latter part being particularly important - you really need to be sure
> > you aren't going to be raced on page table teardown by anything.
> >
> > However:
> >
> > 	* You're safe from vmalloc trying to install a huge page table (only way
> >	  it removes intermediate page tables) since !HAVE_ARCH_HUGE_VMAP.
> >
> >	* And since arm32 !ARCH_ENABLE_MEMORY_HOTPLUG you're safe from that too
> >          :)
> >
> > (Really I think you should be using walk_page_range_debug() here ultimately but
> > that's a future refactor).
> >
> > BUT see below:
> >
> >> `mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
> >> addresses?
> >
> > OK so this _does_ need addressing, and I covered it in the document:
> >
> >	We also permit a truly unusual case is the traversal of non-VMA ranges
> >	in userland ranges, as provided for by walk_page_range_debug().
> >
> >	We must take great care in this case, as the munmap() implementation
> >	detaches VMAs under an mmap write lock before tearing down page tables
> >	under a downgraded mmap read lock.
> >
> >	This means such an operation could race with this, and thus an mmap
> >	write lock is required.
> >
> > I.e. you need a write lock.
>
> Thank you very much for your reply. Now I fully understand: to traverse
> the page tables of non-VMA addr in user address space, the mmap write
> lock is required.

You're welcome! :)

>
> But I still want like to ask a question:
> > However:
> >
> > 	* You're safe from vmalloc trying to install a huge page table (only way
> > 	  it removes intermediate page tables) since !HAVE_ARCH_HUGE_VMAP.
> >
> >	* And since arm32 !ARCH_ENABLE_MEMORY_HOTPLUG you're safe from that too
> >          :)
>
> If (just hypothetically), the ARM32 architecture supports huge pages
> and memory hotplug, what kind of lock do I need to safely traverse the
> page tables of non-VMA addr in kernel space?

hotplug lock, mmap write lock.

>
> Thanks again.

Cheers, Lorenzo

