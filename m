Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEJXi3Ipa/GF3uVFfVgIRTBsXVg1ufevqdVuD40f/4c=; b=xnQoVTI2x+C6+tNe2qV3l65JkQ
	wixtnU6fRfXOq5RmGcuAAHrxuITUqmfqzea4dW6KSoYJgPYY/9EBBuPRfxGrWqxa99jw4eReNpVhx
	0EYZNIjW79BKRziDnayLMk4I2d8s8KX51ENwaVlJ8bw6+gj7tPc+/2Gzy4ILDlOIbmmym2QKwGNxl
	xAPyh7aZ/sPajIf+CuUrxfcX+gDKJ98h8UdqwF/NRoHV+Bp3PQnEicQ5bSFP+uKk9wexxv8gQdwPw
	8GVYIoTPpuc3nuIj8BxyelDZH4vTCkYJ2vU64Prg2SvGML0J0bCtnEi0mhlJMRA5PdpowQaKPZhGW
	OmEY1Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSi6-00000006LRh-2iyZ;
	Sat, 11 Jul 2026 08:05:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSi5-00000006LRZ-2GUs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 08:05:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 554CC60051;
	Sat, 11 Jul 2026 08:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A3C1F000E9;
	Sat, 11 Jul 2026 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783757116;
	bh=oEJXi3Ipa/GF3uVFfVgIRTBsXVg1ufevqdVuD40f/4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RrA69GHoEQEWSHV9FU+fJtMJB2iGQ06pVUQwtOrx8BpMO1GgoBGlvan9iYFRWTfNP
	 9GGC5tfncOgs7hIDPl0MF43uMuNPgPDJR0n149gZx4Bnm9sRD4kPH4jEaGUplQ+Ko7
	 INy66aVReGmFuTWGgR4BC/GBMV2Ll54xeCnx2JWTKiBLoOpSIZ3EaVcY9J/AHtNbg/
	 TjVgv122gKFOPu7uoXJgvJaRGVJM7rW/8D2ocoNsrL1BRoSFquwgMRG1+N0KtcKUBq
	 lyd2gOAlszvYPPmKIITFDPK3wZWBDHFJh9S2M6ySdIW1C5ACa3ykMpDNj09Sz+YlVZ
	 UFofibfsgZMSg==
Date: Sat, 11 Jul 2026 09:05:03 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, akpm@linux-foundation.org, david@kernel.org, 
	liam@infradead.org, liaohua4@huawei.com, lilinjie8@huawei.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, rppt@kernel.org, sunnanyong@huawei.com, surenb@google.com, 
	vbabka@kernel.org, wangkefeng.wang@huawei.com, xiqi2@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <alH4-zEWkSDK5EvK@lucifer>
References: <alHnqsIdcMghnUER@lucifer>
 <20260711075651.3114-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711075651.3114-1-xieyuanbin1@huawei.com>
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

On Sat, Jul 11, 2026 at 03:56:51PM +0800, Xie Yuanbin wrote:
> On Sat, 11 Jul 2026 08:27:23 +0100, Lorenzo Stoakes wrote:
> > In general yeah but with mmap_write_trylock() after you add the attached
> > patch to a series (making sure to cc- the right people etc.)... but also,
> > wouldn't you just generally want this in show_pte()?
> >
> > Seems to me best way is to put the existing show_pte() into a __show_pte()
> > and then do show_pte() like (untested top of my head thing):
> >
> > void show_pte(const char *lvl, struct mm_struct *mm, unsigned long addr,
> > 	      bool is_user)
> > {
> > 	/* Write lock needed to account for concurrent downgraded munmap(). */
> > 	if (is_user && !mmap_write_trylock(mm)) {
> > 		printk("%s[%08lx] unable to acquire lock for PTE output\n",
> > 			lvl, addr);
> > 		return;
> > 	}
> > 	__show_pte(lvl, mm, addr);
> > 	if (is_user)
> > 		mmap_write_unlock(mm);
> > }
>
> For user faults, I think we don't need to worry about deadlock issues.
>
> As Russell King described, deadlock problems can only occur in kernel faults.
> On Tue, 7 Jul 2026 16:34:21 +0100, Russell King wrote:
> > Unconditionally taking the lock could lead to a deadlock. Consider
> > the case where the mmap lock is held, and we get an unrecognised
> > abort from the kernel.
>
> As we never return to user mode with mmap lock held, so for user faults,
> it is safe to acquire mmap lock. This is just the same with the syscall
> entry of `pkey_alloc`, we immediately acquire the mmap write lock:
> Link: https://elixir.bootlin.com/linux/v7.2-rc2/source/mm/mprotect.c#L1011
>
> For the kernel, the user faults entry and the system call entry are not
> fundamentally different; they are both kernel entry points.

OK given arm32 can't do any of the stuff that makes kernel faults an issue, and
if it's certain you can't deadlock on mmap write lock for VMA or non-VMA ranges
on user fault, then no need for the mmap write trylock, and just take the mmap
write lock unconditionally for user faults, and no lock for kernel faults I
guess?

