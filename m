Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CC2C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBhwM6wbqAw5a+cVNgYvlXlXJxCKVG4pNRvbUVKP8IA=; b=ufN+aSMSfZr8nNdSOJDOKTWecY
	OTqWOR69LbUBSxIIFTVN7ultWFOnQMVn9AZdx7xEFnWY3LyoGE9rGbks0r0bbGO2hMx1oGEij8ZDJ
	LMApT3rl+2t8tRb17x2IFTr97KVEI0bbnhqno9ji3Zw/J/WKbJxPLaAnLDO8fBTH8k4ZMD0Wbinfa
	VKyjI3C2iffDPD6SWYUgO22tk3tcPUZr3Ia1LCg8UIiwhsie1oxh0qA4bs1VSegbrqZCCmKlhhKrT
	QVVlPtJyZ6r+l010rc3J8Vs4hYG+p+/+aBugjw7U5E5qhW3bwlX8v8y7VIsZYz8piwnhWgNwf/SQG
	nXFIvj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PAG-00000008nJc-3mAG;
	Wed, 23 Sep 2026 15:45:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PAG-00000008nJQ-03QB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:45:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C160340D91;
	Wed, 23 Sep 2026 15:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5741F00893;
	Wed, 23 Sep 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178343;
	bh=xBhwM6wbqAw5a+cVNgYvlXlXJxCKVG4pNRvbUVKP8IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KapfSIupahzymrJQOac0ZZru85avmkuCFsYN2BBX6hl8axXNJnffgnyqlm+GAqWFQ
	 xzT7HNgoPLukmPtZQiUBGjAAgsMTd8mBODvU/qvqBoVlLs8WPfPnrRxVZn6ihew8bP
	 vmmMP0HpYQBzSv0xarrSJFoDT0NNFmAVaJN5trYsm/T8kdBaP69tAOT9Jceqe5C9/t
	 LV8Gui+KCanV+FtQ1aix6tIz7u0R/FbAIq7lEskqqpVMZDrB8GsXpeMSh9MekmkAQ3
	 7ZMPHiPPDsji0EEtsNO5GjhuQJSJsjKHq/vLBxDvftss4APctbzOGdwKH6KmH4FoDW
	 ATZpPB7e1lFyQ==
Date: Wed, 23 Sep 2026 16:45:36 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, maz@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <arP0IF0MjFUv36AP@willie-the-truck>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck>
 <arOyp8WUrYBAjrGH@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arOyp8WUrYBAjrGH@arm.com>
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

On Wed, Sep 23, 2026 at 12:06:15PM +0100, Catalin Marinas wrote:
> On Tue, Sep 22, 2026 at 06:15:34PM +0100, Will Deacon wrote:
> > On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > > From: Steven Price <steven.price@arm.com>
> > > 
> > > If the host attempts to access granules that have been delegated for use
> > > in a realm these accesses will be caught and will trigger a Granule
> > > Protection Fault (GPF).
> > > 
> > > A fault during a page walk signals a bug in the kernel and is handled by
> > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > having access to a page which has been delegated to the kernel and will
> > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > delegated page.
> > > 
> > > There is work in progress to unmap the guest_memfd backed private pages from the
> > > linear map. Until we get that support, we could get spurious GPFs from within
> > > the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> > > 
> > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > > Changes since v17:
> > >  * Pass untagged address to die_kernel_fault() - Sashiko
> > >  * Explicitly check !user_mode() for fixups - Catalin
> > >  * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
> > >  * Clarify the commit description about the upcoming work on
> > >    unmapping guest_memfd backed pages from linear map
> > > Changes since v16:
> > >  * Update the commit description to indicate why we try to fixup GPFs
> > > Changes since v10:
> > >  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > Changes since v2:
> > >  * Include missing "Granule Protection Fault at level -1"
> > > ---
> > >  arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
> > >  1 file changed, 24 insertions(+), 6 deletions(-)
> > 
> > I still don't think we should do this, given that the plan is to unmap
> > the memory from the linear map. If this thing fires, it's a kernel bug
> > and it should be fatal.
> 
> If the linear unmapping gets merged first, I agree, no need to handle
> these faults. I haven't followed that series, so no idea where it is at.
> 
> However, I'd still keep part of this patch - the reporting and panic but
> without the actual exception table recovery. There's some value in
> killing user-space and WARN (or pr_ratelimited) without a full panic, it
> helps with debugging. That's what do_bad() via arm64_notify_die() gives
> us currently anyway.
> 
> So maybe we can keep it to just:
> 
> static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> {
> 	if (user_mode(regs)) {
> 		pr_alert_ratelimited("%s[%d]: granule protection fault at 0x%016lx\n",
> 				current->comm, task_pid_nr(current),
> 				untagged_addr(far));
> 		mem_abort_decode(esr);
> 	}
> 
> 	return 1;
> }
> 
> and we get the SIGBUS or panic via do_mem_abort(). No recovery for
> uaccess though, we get the same kernel panic.

But how can this ever occur in user mode? I'm fine with making that part
unconditional.

Will

