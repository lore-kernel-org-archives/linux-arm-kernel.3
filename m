Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D87C98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 11:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jw7cdKPvhQqCHfyfU5u17nrqt6E9Q3a8TKdmkl3BqS4=; b=kjXi1A+Q5PogNdm6qZYPXJD7+Y
	f6A1z5N7XNhmc/5//qhYU04zmMdWXFjmDYOEo/i0IZlz4qcSOISDXZtgONMYq91O84BVhbnfYgd4Z
	QtYXiFNJBpfhkAcgWOcGXI12cvzn5KzKmGiXKFElglc7fr3y+FLRSddh7KTpUokA3Z+JmrYaFvWzW
	3AZxVZ+ytYRyRrRnvqoCGrBjgY/KBfDvg97ZIhbm0SJHf1Hh6uRY9xrSc+S5EDHGcgJDrdZs0vUab
	xHk5yeUS/Vqs+T5v1jvyzZ4Nf2n5WqtPcHo8cjN5Iy/X+S+/YvAztWjlkmL+sp7uTdHpZzIB+PpQm
	Nh3FFmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Knw-00000007zYt-2KLi;
	Wed, 23 Sep 2026 11:06:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Knu-00000007zXt-2M6W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 11:06:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D531516;
	Wed, 23 Sep 2026 04:06:17 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F314F3F86F;
	Wed, 23 Sep 2026 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790161580; bh=AiLb+XIqqeogh5YIbkCt/ug3YDrQxWlGcnRvc7/OSzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RZd6PDCElzn8tIotWwrvT9WVNfhaf+E0nsTzPz7biVZvPKwP8gDLv/16qknBwwCeE
	 XZqVX7rtPhnEOmnIpGuocfxi5mPtjFIoFr3VFosboC1I/0xJVnx9XIJolkmsXAj5+B
	 BQkCyZnQEJkrsTacXF5+UJGQn1YF7TiEHuz/UsaY=
Date: Wed, 23 Sep 2026 12:06:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
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
Message-ID: <arOyp8WUrYBAjrGH@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arK3tsTV6EDhI-nt@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_040622_691760_A10D4B71 
X-CRM114-Status: GOOD (  29.19  )
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

On Tue, Sep 22, 2026 at 06:15:34PM +0100, Will Deacon wrote:
> On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > From: Steven Price <steven.price@arm.com>
> > 
> > If the host attempts to access granules that have been delegated for use
> > in a realm these accesses will be caught and will trigger a Granule
> > Protection Fault (GPF).
> > 
> > A fault during a page walk signals a bug in the kernel and is handled by
> > oopsing the kernel. A non-page walk fault could be caused by user space
> > having access to a page which has been delegated to the kernel and will
> > trigger a SIGBUS to allow debugging why user space is trying to access a
> > delegated page.
> > 
> > There is work in progress to unmap the guest_memfd backed private pages from the
> > linear map. Until we get that support, we could get spurious GPFs from within
> > the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> > 
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> > Changes since v17:
> >  * Pass untagged address to die_kernel_fault() - Sashiko
> >  * Explicitly check !user_mode() for fixups - Catalin
> >  * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
> >  * Clarify the commit description about the upcoming work on
> >    unmapping guest_memfd backed pages from linear map
> > Changes since v16:
> >  * Update the commit description to indicate why we try to fixup GPFs
> > Changes since v10:
> >  * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > Changes since v2:
> >  * Include missing "Granule Protection Fault at level -1"
> > ---
> >  arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
> >  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> I still don't think we should do this, given that the plan is to unmap
> the memory from the linear map. If this thing fires, it's a kernel bug
> and it should be fatal.

If the linear unmapping gets merged first, I agree, no need to handle
these faults. I haven't followed that series, so no idea where it is at.

However, I'd still keep part of this patch - the reporting and panic but
without the actual exception table recovery. There's some value in
killing user-space and WARN (or pr_ratelimited) without a full panic, it
helps with debugging. That's what do_bad() via arm64_notify_die() gives
us currently anyway.

So maybe we can keep it to just:

static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
{
	if (user_mode(regs)) {
		pr_alert_ratelimited("%s[%d]: granule protection fault at 0x%016lx\n",
				current->comm, task_pid_nr(current),
				untagged_addr(far));
		mem_abort_decode(esr);
	}

	return 1;
}

and we get the SIGBUS or panic via do_mem_abort(). No recovery for
uaccess though, we get the same kernel panic.

-- 
Catalin

