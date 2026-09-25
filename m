Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A2C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdOVtv43CHf2CxrpTi7sdO3zswv8R0WYHoLKnoRI4Uk=; b=ScEhP2o2JAmDgixc7ub5Xvg/VD
	C5sw5N5QDy0hHk4QahKz9GnWp259lIDrP/SeMJaOn6FURxGJfhBqZn/kSRY48iGRkm4ZD9kko2STU
	45lWArzkF4Xm15ORgEIaxJiaoBpTwZ0/Wq0WGq3VyxKwfLvTW5XZSCb238rgA8tD7Aq8w67PxbGUW
	faGpKJchosFl9tYBVZUKM0YRPde9ZW2EJO+2VoAX3paepu6dYjylGaDoMDEwlDMHUZSbbgMcIy/YZ
	p/KyeEYDfS2rMPdzuFXpL6DiqrWxyli/e+PQWoiL+rx8YPhiRTYwwQoD+TWFeKsF0qCVKxWhXTxM4
	nIF9GApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9OJ-0000000E2Tv-1aUk;
	Fri, 25 Sep 2026 17:07:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9OG-0000000E2Sy-1nnD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:07:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B9EF169C;
	Fri, 25 Sep 2026 10:07:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F93D3F86F;
	Fri, 25 Sep 2026 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790356034; bh=ixzfrU8lMEsDTomOcbMGSENbu/A9XPEY12QX9G9g3I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHpt1dnkgmEtCXRicfI03eywssdpZdbGJitm2LyU3/txbYynDGJW9GXrNQawbZEyw
	 3QDLIL1w9E0vjFWl3xfYaRKn3caSX1J1hyvAayOZ7OCj9NKUhHV57vPR+0QirXYeeJ
	 MOzJAeppFl24SLREnFIB5jWlehs2ggbnYJhv2Z8s=
Date: Fri, 25 Sep 2026 18:07:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Will Deacon <will@kernel.org>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, maz@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18] arm64: mm: Handle Granule Protection Faults (GPFs)
Message-ID: <araqPCdcSnqZqPWz@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck>
 <arOyp8WUrYBAjrGH@arm.com>
 <arP0IF0MjFUv36AP@willie-the-truck>
 <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_100716_593002_B1C3BC40 
X-CRM114-Status: GOOD (  36.93  )
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

On Wed, Sep 23, 2026 at 05:04:06PM +0100, Suzuki K Poulose wrote:
> On 23/09/2026 16:45, Will Deacon wrote:
> > On Wed, Sep 23, 2026 at 12:06:15PM +0100, Catalin Marinas wrote:
> > > On Tue, Sep 22, 2026 at 06:15:34PM +0100, Will Deacon wrote:
> > > > On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > > > > From: Steven Price <steven.price@arm.com>
> > > > > 
> > > > > If the host attempts to access granules that have been delegated for use
> > > > > in a realm these accesses will be caught and will trigger a Granule
> > > > > Protection Fault (GPF).
> > > > > 
> > > > > A fault during a page walk signals a bug in the kernel and is handled by
> > > > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > > > having access to a page which has been delegated to the kernel and will
> > > > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > > > delegated page.
> > > > > 
> > > > > There is work in progress to unmap the guest_memfd backed private pages from the
> > > > > linear map. Until we get that support, we could get spurious GPFs from within
> > > > > the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> > > > > 
> > > > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > > ---
> > > > > Changes since v17:
> > > > >   * Pass untagged address to die_kernel_fault() - Sashiko
> > > > >   * Explicitly check !user_mode() for fixups - Catalin
> > > > >   * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
> > > > >   * Clarify the commit description about the upcoming work on
> > > > >     unmapping guest_memfd backed pages from linear map
> > > > > Changes since v16:
> > > > >   * Update the commit description to indicate why we try to fixup GPFs
> > > > > Changes since v10:
> > > > >   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > > > Changes since v2:
> > > > >   * Include missing "Granule Protection Fault at level -1"
> > > > > ---
> > > > >   arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
> > > > >   1 file changed, 24 insertions(+), 6 deletions(-)
> > > > 
> > > > I still don't think we should do this, given that the plan is to unmap
> > > > the memory from the linear map. If this thing fires, it's a kernel bug
> > > > and it should be fatal.
> > > 
> > > If the linear unmapping gets merged first, I agree, no need to handle
> > > these faults. I haven't followed that series, so no idea where it is at.
> 
> There doesn't seem to be much progress on that series. Brendan
> volunteered to resurrect the series, taking over from Nikita [0].
> But looks like Brendan is not working on this anymore. Will see
> if someone is really planning to look at it.
> 
> [0] https://lore.kernel.org/all/DJJ35VLH2PE5.DFD8OYXEOH97@linux.dev

I just realised that this only solves part of the problem. Normal kernel
allocations are delegated RMM metadata and they'll also trigger GPF
faults. Kdump is another point raised here:

https://lore.kernel.org/all/a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com/

I think rmi_delegate_range() covers the non-kdump cases, both for
metadata and realm memory, we could unmap the linear map there (map it
back in rmi_undelegate_range()).

For kdump, we have /proc/vmcore that may be mmap'ed or read() syscalls.
I think Alper proposed an idea to use copy_from_kernel_nofault() (with
exception recovery in do_gpf()) but we'd still need to block
mmap_vmcore() or somehow handle SIGBUS in makedumpfile unless it does
this already.

So, I think we should revisit the GPF handling. If we manage to unmap
all delegated pages, we could limit the exception handling to
is_kdump_kernel(). Otherwise we keep the exception handling as proposed
earlier, maybe with some warnings like EL0 access.

-- 
Catalin

