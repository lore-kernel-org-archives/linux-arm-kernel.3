Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB412C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThonobVbutjdpxgi4zCNaSyVPNB4espWFRa4yco1WyI=; b=lX8vtUn2INo4a4bQW4RCyaFbEN
	OF0HNQshCpnZ5UJM3NN1MP9bkDO6JXiahWl1W4mm/VOj0y4UC9ivquyYBJmRR8QlCF9o7RUCDV3xZ
	qbx7bhyxHB8hc8Me1J08f30tnIfXYQQN+uKOBOd+uX6MR5sNxtSYURkfoNQwvsUmZssDIwQPPjG3E
	6IC8pRTwcQWo5hFwl6Tek0364zn4IKUH4RSZmEVFqh/P7xxqw+Y2YOLeZL2wK+m1SmhizZvcXnoIs
	XPvVv/ZDl+dk4wgFEOQGEKonzRDF2GaWs642JXbn5FRPVkHv1GGrTVXnxIJmZn9DfIqJ8dLAsk73T
	gXEy6wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5j0-0000000F2WE-2K1O;
	Tue, 07 Jul 2026 13:20:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5iw-0000000F2Vk-0ykw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:20:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E212D40711;
	Tue,  7 Jul 2026 13:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289511F000E9;
	Tue,  7 Jul 2026 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430429;
	bh=ThonobVbutjdpxgi4zCNaSyVPNB4espWFRa4yco1WyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WcsyS1rNE6zpcJVBcO6MxkNMQ+nR+95qJS5iXV1kQ5CxwF2mZYtdDYpZTej7gCmS9
	 4qI533fxLYj4yayOmzWhL2+jhmX+KXpWvHuB1qF3Hnd8pM4Kh1/S6+JU/JzEsYq4j2
	 ptzrWG7Mkr9iVH/adrDExEHfHN6+/itICaG2k9BIHYfd/m2/zYEt4H84kX9Jw1tDHc
	 cpYnwRUMn1wFSAlKAefI9Z+htPe5TaMjG763Xuacmc84aH2TwLV5NqC49Nt+Yq+C7B
	 uF2/D3NeP2p4B7kSKotFUyELmyRYpDmb6sba+EYTl2L6jZ/J78cLQYnYcm20RYtxdb
	 UvBxkn0uXde9g==
Date: Tue, 7 Jul 2026 14:20:19 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux@armlinux.org.uk, akpm@linux-foundation.org, david@kernel.org, 
	liam@infradead.org, liaohua4@huawei.com, lilinjie8@huawei.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	mhocko@suse.com, rppt@kernel.org, sunnanyong@huawei.com, surenb@google.com, 
	vbabka@kernel.org, xiqi2@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <akz8aZUW23rpyrLO@lucifer>
References: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
 <20260707131409.79043-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707131409.79043-1-xieyuanbin1@huawei.com>
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

On Tue, Jul 07, 2026 at 09:14:09PM +0800, Xie Yuanbin wrote:
> On Tue, 7 Jul 2026 12:57:45 +0100, Russell King wrote:
> > No. This information is useful debug for kernel oops.
>
> For kernel oops, I think it should be `!user_mode(regs)`, Qi Xi's reply:
>
> On Tue, 7 Jul 2026 19:48:12 +0800, Qi Xi wrote:
> > For do_DataAbort() fallback:
> >
> >	if (user_mode(regs)) {
> >		if (addr < TASK_SIZE) {
> >			mmap_read_lock(current->mm);
> >			show_pte(KERN_ALERT, current->mm, addr);
> >			mmap_read_unlock(current->mm);
> >		}
> >	} else {
> >		show_pte(KERN_ALERT, current->mm, addr);
> >	}
>
> changes nothing to kernel oops. It only skip show_pte() for user-mode
> faults, and the fault addr is a kernel address, which means a user
> program is trying to access a kernel address.
> I think it is reasonable to skip show_pte() in this case?

Well the whole reason you're faulting here might be because a userland process
did that right? The page tables should tell you (presumably on ARM32 :)

And I hate to repeat myself, maybe you didn't read the whole thread but... just
use mmap_write_lock(), this isn't necessary?

What is this trying to achieve?

You're not in a hotpath, why are you bothering to conditionally take/not take
the lock?

Thanks, Lorenzo

