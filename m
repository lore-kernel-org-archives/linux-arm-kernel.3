Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+6p82jb2/aEkt1ZTkLsvP1xOUzDqGuBhaufElbiyiI=; b=dIhs5eVFVQMAnmva97WyN+iUEc
	IEt424V/RnSHX22+Nsfpu1EXP++rWVrukosTTgyZgY0EU591Og6VCgFCzp5JEIhChCXrxyVmSAV8D
	xdkl1eoujv3f2JNRBW0drX61QSj+igu4bGas949nMojvXFTmM1Z7fQO0AcxaGRoOkjHE01BFZHo2k
	kxI3QXY8TjPIAbrh751ex51cs0sZK9o2+G3Yt6KxM3hd+lZwGb82RZwC59jw5XCRMnj2HQ4FYw2YA
	X6uvK66yFKSJw3tXDppTSpjyG0dJVt19xmDDTK7fDgitUi+s9VHiRorjj861r4rr9FHB6TO2crbjF
	Tr3JHNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiS7f-00000006JSz-0wID;
	Sat, 11 Jul 2026 07:27:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiS7d-00000006JSp-4128
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 07:27:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEE29600C3;
	Sat, 11 Jul 2026 07:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F931F000E9;
	Sat, 11 Jul 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783754856;
	bh=C+6p82jb2/aEkt1ZTkLsvP1xOUzDqGuBhaufElbiyiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZM9j+K29RqsZs/pgnjVGv1y/g1WDedJzleE5hWTeFT1NHl/YR8r7Q5VoRC5PP/rG
	 UMcyaaIxn0XOwNyxb49orLZnE6JHuDqKU7zXvxMYZTASOuFy3Rl0KF8G/aG1fQ2yFN
	 NeEX2HmUW3yKRYYI2UfxY5yVZZIkwR66AzlyTlAmS+wXGo2P7gDhmlUV7+BliJLjMq
	 swhey2eI29p+gioLYySaxV69zUnEQuZ1T4P0nDgROA2wq59QWV1QAZClGZrNYeluqm
	 lohPBUPZyrwZx4ZBOCQPV3u/E3qyqm+H7Ivc7V4QITxG6YwHXBTs6H2Vpa4dBWSf5s
	 uKpFuFsV+Xr3A==
Date: Sat, 11 Jul 2026 08:27:23 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Qi Xi <xiqi2@huawei.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Xie Yuanbin <xieyuanbin1@huawei.com>, akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, 
	liaohua4@huawei.com, lilinjie8@huawei.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, rppt@kernel.org, sunnanyong@huawei.com, surenb@google.com, 
	vbabka@kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <alHnqsIdcMghnUER@lucifer>
References: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
 <20260707131409.79043-1-xieyuanbin1@huawei.com>
 <akz8aZUW23rpyrLO@lucifer>
 <ak0cfZPZIWz4v95K@shell.armlinux.org.uk>
 <3fb3b11d-515b-400d-b1d2-5623dacb92cb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb3b11d-515b-400d-b1d2-5623dacb92cb@huawei.com>
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

On Fri, Jul 10, 2026 at 10:32:29AM +0800, Qi Xi wrote:
>
> On 07/07/2026 23:34, Russell King wrote:
> > On Tue, Jul 07, 2026 at 02:20:19PM +0100, Lorenzo Stoakes wrote:
> > > On Tue, Jul 07, 2026 at 09:14:09PM +0800, Xie Yuanbin wrote:
> > > > On Tue, 7 Jul 2026 12:57:45 +0100, Russell King wrote:
> > > > > No. This information is useful debug for kernel oops.
> > > > For kernel oops, I think it should be `!user_mode(regs)`, Qi Xi's reply:
> > > >
> > > > On Tue, 7 Jul 2026 19:48:12 +0800, Qi Xi wrote:
> > > > > For do_DataAbort() fallback:
> > > > >
> > > > > 	if (user_mode(regs)) {
> > > > > 		if (addr < TASK_SIZE) {
> > > > > 			mmap_read_lock(current->mm);
> > > > > 			show_pte(KERN_ALERT, current->mm, addr);
> > > > > 			mmap_read_unlock(current->mm);
> > > > > 		}
> > > > > 	} else {
> > > > > 		show_pte(KERN_ALERT, current->mm, addr);
> > > > > 	}
> > > > changes nothing to kernel oops. It only skip show_pte() for user-mode
> > > > faults, and the fault addr is a kernel address, which means a user
> > > > program is trying to access a kernel address.
> > > > I think it is reasonable to skip show_pte() in this case?
> > > Well the whole reason you're faulting here might be because a userland process
> > > did that right? The page tables should tell you (presumably on ARM32 :)
> > >
> > > And I hate to repeat myself, maybe you didn't read the whole thread but... just
> > > use mmap_write_lock(), this isn't necessary?
> > >
> > > What is this trying to achieve?
> > >
> > > You're not in a hotpath, why are you bothering to conditionally take/not take
> > > the lock?
> > Unconditionally taking the lock could lead to a deadlock. Consider
> > the case where the mmap lock is held, and we get an unrecognised
> > abort from the kernel.
> >
> > If we try to take the mmap lock again, we'll deadlock, which will
> > result in very little debug information being output - and the
> > system locks up. The only thing that would save such a case would
> > be if the user had decided to use a hardware watchdog, or is
> > physically present to press the reset button.

Yeah right, ugh.

We don't currently have an mmap_write_trylock(), that was removed in commit
cf95e337cb63 ("mm: delete mmap_write_trylock() and vma_try_start_write()")
but I think it's legit to bring _only_ the mmap_write_trylock() back (not
vma_try_start_write()), AND updated to account for how VMA locking works
currently (we have to update a seqcount on mmap write lock acquisition).

To make life easy - I've attached a patch that you can add as part of a
series (please keep attribution etc. to me so I can be blamed/villified if
this is insane :)

That way we avoid the deadlock and also avoid concurrent downgraded
munmap() oopsing in show_pte().

>
> We are preparing a v4 and would like to confirm the approach for
> the do_DataAbort() fallback path (__do_user_fault() is similar).
>
> As Lorenzo noted, an mmap write lock is required here because
> munmap() downgrades the write lock to a read lock before tearing
> down page tables.
>
> -	show_pte(KERN_ALERT, current->mm, addr);
> +	if (user_mode(regs)) {
> +		if (addr < TASK_SIZE) {
> +			mmap_write_lock(current->mm);
> +			show_pte(KERN_ALERT, current->mm, addr);
> +			mmap_write_unlock(current->mm);
> +		}
> +	} else {
> +		show_pte(KERN_ALERT, current->mm, addr);
> +	}
>
> The lock is taken only for user_mode(regs) + addr < TASK_SIZE, so
> kernel aborts that may already hold the mmap lock are left unchanged.
> For user-mode faults on kernel addresses (addr >= TASK_SIZE), as
> Yuanbin noted, it is reasonable to skip show_pte().
>
> Please let us know if you see any issues with this approach, or if you
> would suggest a different way to handle it.
>

In general yeah but with mmap_write_trylock() after you add the attached
patch to a series (making sure to cc- the right people etc.)... but also,
wouldn't you just generally want this in show_pte()?

Seems to me best way is to put the existing show_pte() into a __show_pte()
and then do show_pte() like (untested top of my head thing):

void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr,
	      bool is_user)
{
	/* Write lock needed to account for concurrent downgraded munmap(). */
	if (is_user && !mmap_write_trylock(mm)) {
		printk("%s[%08lx] unable to acquire lock for PTE output\n",
			lvl, addr);
		return;
	}
	__show_pte(lvl, mm, addr);
	if (is_user)
		mmap_write_unlock(mm);
}

Cheers, Lorenzo

----8<----
From 2d0906c9ca962361fcdf2a033deb2a37252c486a Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <ljs@kernel.org>
Date: Sat, 11 Jul 2026 08:07:27 +0100
Subject: [PATCH] mm: add mmap_write_trylock()

Commit cf95e337cb63 ("mm: delete mmap_write_trylock() and
vma_try_start_write()") removed mmap_write_trylock() as there were no
users.

Re-add this helper and update to have it update the mm's write lock
sequence count number as per the current VMA lock implementation.

The use cases for this function are very narrow - in the vast majority of
cases an inability to acquire the write lock is terminal so you want either
an unconditional or killable variant of the mmap write lock.

However this is being added so a subsequent patch can safely dump PTE
information when an unhandled fault arises in arm32.

Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
---
 include/linux/mmap_lock.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
index 04b8f61ece5d..fe14d4babae9 100644
--- a/include/linux/mmap_lock.h
+++ b/include/linux/mmap_lock.h
@@ -546,6 +546,18 @@ static inline void mmap_write_lock_nested(struct mm_struct *mm, int subclass)
 	__mmap_lock_trace_acquire_returned(mm, true, true);
 }

+static inline bool __must_check mmap_write_trylock(struct mm_struct *mm)
+{
+	bool ret;
+
+	__mmap_lock_trace_start_locking(mm, true);
+	ret = down_write_trylock(&mm->mmap_lock) != 0;
+	if (ret)
+		mm_lock_seqcount_begin(mm);
+	__mmap_lock_trace_acquire_returned(mm, true, ret);
+	return ret;
+}
+
 static inline int __must_check mmap_write_lock_killable(struct mm_struct *mm)
 {
 	int ret;
--
2.55.0

