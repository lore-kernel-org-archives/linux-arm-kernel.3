Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9FFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ewdqf09/9A0MElDORLS07X9p5VzrfDnnvCn9V/hQNQs=; b=1ux6o5OkPMrqyBo3oWX4fF3kGl
	vGm+aYpkov3Q0E+lBJQluGRYbOAYznKyPIzkH4GfozqtzPd5BI0ldw9dZtnWYBdBDAvVs7hPgXcLn
	JkNdFw/6y3bEGQwz+s2dD4TH3c94JRuUIJEN6EtO7z+nRHOFJArP3kR0G8YNtKsSyXGsinKy8D4ge
	z3/kcXmg88jiyzU9shjjWr6IHTD8RpLTLuc55hGj02g1L+m/JHt951Ceet3fW7wW8Nmj3O3h7OO/D
	ZPuqMDinMXt46x18PMfgPZDqwZ8jPl6U2wnuSRTMpAUHzYCGr98xTO8OgDT2n8WYg06BDCSPIDsgf
	iPdbIyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5C6-0000000EzU7-0JCv;
	Tue, 07 Jul 2026 12:46:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5C3-0000000EzTc-3o5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:46:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FAEB60018;
	Tue,  7 Jul 2026 12:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD181F000E9;
	Tue,  7 Jul 2026 12:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428390;
	bh=Ewdqf09/9A0MElDORLS07X9p5VzrfDnnvCn9V/hQNQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rjy0cnLisBi/mSGas37kSJEpI9VAejdyGuMOsAFnwpaMXWu6H9/WK70LPa1xkEoKZ
	 4b6kCyS0M3vkqr2+GfByl/DG/qJUwgrvZlSpddhx1d6XbaO2a551L70HBpSZG03924
	 pmeYYxEJs5qEqpzeMi1gJeqnHo3hpAnUwN1v3HYDCT4BxPgtzCDOoPmnYneUd4hK8c
	 ryoIxcYXyJ0usBMe8qWST91pCaeYMq239IlRiwqiMdF5BtY+s3ruk4KM+ytwM8pxy1
	 cIu5giQhHvAzfe2yXvCGJ7/SWBx06xdh7lOYWHnBbh+m4HIxyvbotZ3iPD/E47iLyU
	 eGiVf2Ev5yJSA==
Date: Tue, 7 Jul 2026 13:46:19 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: xiqi2@huawei.com, akpm@linux-foundation.org, linux@armlinux.org.uk, 
	david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sunnanyong@huawei.com, 
	linux-mm@kvack.org, lilinjie8@huawei.com, liaohua4@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <akzgsZi6aKCFWg_U@lucifer>
References: <20260626073048.3595106-2-xiqi2@huawei.com>
 <20260706133247.145485-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706133247.145485-1-xieyuanbin1@huawei.com>
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

On Mon, Jul 06, 2026 at 09:32:47PM +0800, Xie Yuanbin wrote:
> On Fri, 26 Jun 2026 15:30:47 +0800, Qi Xi wrote:
> > @@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
> >  		pr_err("8<--- cut here ---\n");
> >  		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
> >  		       tsk->comm, sig, addr, fsr);
> > +		mmap_read_lock(tsk->mm);
> >  		show_pte(KERN_ERR, tsk->mm, addr);
> > +		mmap_read_unlock(tsk->mm);
> >  		show_regs(regs);
> >  	}
> >  #endif
>
> I found that this fix does not completely solve the problem. For a user
> fault, the addr could also be a kernel address. For arm32/x86, the kernel
> address space and user address space share the same pgd page table,
> but the kernel address space's page table is not protected by
> current->mm->mmap_lock.
>
> I have written a use case to construct and verify this point. When A user
> program accesses a kernel address and triggers __do_user_fault(),
> show_pte() will directly print the kernel page table.
>
> So, I suggest that:
> ```c
> 	if (user_mode(regs)) {
> 		struct mm_struct *const pt_mm = addr >= TASK_SIZE ?
> 			&init_mm : current->mm;
>
> 		mmap_read_lock(pt_mm);
> 		show_pte(KERN_ALERT, pt_mm, addr);
> 		mmap_read_unlock(pt_mm);
> 	} else {
> 		// .. keep nothing change
> 		show_pte(KERN_ALERT, current->mm, addr);
> 	}
> ```
>
> I have read this article:
> Link: https://docs.kernel.org/mm/process_addrs.html
> `mmap_read_lock(&init_mm)` should be able to ensure that the kernel
> address's page tables can be traversed. But I'm not quite sure if

I added a section specifically about this -

https://docs.kernel.org/mm/process_addrs.html#traversing-non-vma-page-tables

But note:

"Since, aside from vmalloc and memory hot plug, kernel page tables are not torn
down all that often - this usually suffices, however any caller of this
functionality must ensure that any additionally required locks are acquired in
advance."

With the latter part being particularly important - you really need to be sure
you aren't going to be raced on page table teardown by anything.

However:

	* You're safe from vmalloc trying to install a huge page table (only way
	  it removes intermediate page tables) since !HAVE_ARCH_HUGE_VMAP.

	* And since arm32 !ARCH_ENABLE_MEMORY_HOTPLUG you're safe from that too
          :)

(Really I think you should be using walk_page_range_debug() here ultimately but
that's a future refactor).

BUT see below:

> `mmap_read_lock(&current->mm)` provides protection for user-space non-VMA
> addresses?

OK so this _does_ need addressing, and I covered it in the document:

	We also permit a truly unusual case is the traversal of non-VMA ranges
	in userland ranges, as provided for by walk_page_range_debug().

	We must take great care in this case, as the munmap() implementation
	detaches VMAs under an mmap write lock before tearing down page tables
	under a downgraded mmap read lock.

	This means such an operation could race with this, and thus an mmap
	write lock is required.

I.e. you need a write lock.

So in conclusion the patch should be:

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index e62cc4be5a..1f2a85e1fa 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -181,7 +181,9 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 		pr_err("8<--- cut here ---\n");
 		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
 		       tsk->comm, sig, addr, fsr);
+		mmap_write_lock(tsk->mm);
 		show_pte(KERN_ERR, tsk->mm, addr);
+		mmap_write_unlock(tsk->mm);
 		show_regs(regs);
 	}
 #endif

>
> Also cc to mm maintainers:
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Linus Walleij <linusw@kernel.org>

Thanks :)

Cheers, Lorenzo

