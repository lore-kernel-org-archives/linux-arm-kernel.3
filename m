Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36B7CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVgpJsn+ruq48weJw6NwLHwj/v3NpoRQLvYASWSRq+w=; b=FHrOJ3oelD14cLuhGK7oBEAjU/
	J0fQzgwA1ghE5AqlTCDOT1K34LhAoFoveWx5Y//J80nfPyLIJ01+FtkDC0m2YFeRv0Uty0uhf0ecZ
	jlxnj2Ij7hLiMOhaLX3g5qJMnmO06ppX5TGZDbb6xOH3y5xNWKrQgNVTY9UKxGFpMUjzpxP0INPa4
	JuOslkHenLoY1BNDrESOBce3NPE8v/u5k/5v9Z+veo0iretSkDBcXO1dASQkrAWrIfKBcv0/BZjaj
	EgZTqJRJ5zYP6b58xC+Z8e9rrTWnM+SXj2iyX3YHpwizxtMZg2LA5YwDoDg5GxPQD1CgH3JrTf0N1
	OxsxXWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV7X-00000003BNM-0sHI;
	Tue, 29 Sep 2026 10:31:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV6v-00000003BAV-1tSP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UVgpJsn+ruq48weJw6NwLHwj/v3NpoRQLvYASWSRq+w=; b=qvCvlWpkILompaaMDfxUueNZl+
	iJnGbCFF1viBQ2qCkby/rIRtRMb9OQiW6SrnCCCG9oOdSpGVly9FNxYL2/l2Qpu1MJvtpr+1Djc2C
	V9JvD6Tg6PvgV6pBdU9DVxpwSZCyTk3OdtcckCgdM1TTwghfsM17lDkL03CHmyH9GiOmwvDbW99ZY
	Rq69OK4xhAX2U7QvC1VW1HEHLy3sF77fOfzRDmLKMiYx4MU4/dcq4YE7OiT/g5LecYsoLA1plD6Zd
	uJdMRi8rbyO7LpyQ9qIb33iUdzvMZAIvNAAfdocp/aIdeP234lBBG+RXulfmDdGHF+k4TMR1sGkTD
	wJVfqt0Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBV6r-00000002U1E-1dtO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:30:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB946497;
	Tue, 29 Sep 2026 03:30:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 271D63F86F;
	Tue, 29 Sep 2026 03:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790677850; bh=bbdhp9RZEsefco1R5gH5jLRUViZzbWUqmj9Bx9zoiTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLBHJe93XO2/suJRTcJpd3d4VEm0QBv3ll9AmKrC3PLu63rQA+ZjIfvlmGw0l4Fg/
	 pn3iR6FRBOK0ZZVq/LUXYds0tfwqvFJSZjbEJg0Mtj/plMhkNfHCl4NB87iBvhgMYP
	 n2YEYlSP+47rcFYeJ5VCkKHGP9+6+xkTR/GwyuXk=
Date: Tue, 29 Sep 2026 11:30:36 +0100
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
Message-ID: <aruTTJiIheHigPSJ@arm.com>
References: <20260913070459.2547407-1-suzuki.poulose@arm.com>
 <arK3tsTV6EDhI-nt@willie-the-truck>
 <arOyp8WUrYBAjrGH@arm.com>
 <arP0IF0MjFUv36AP@willie-the-truck>
 <49dcab27-1d03-4df2-b7cb-4df4eda6d909@arm.com>
 <araqPCdcSnqZqPWz@arm.com>
 <3934b4c9-6b1f-44fa-847e-4fb1e67a58e7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3934b4c9-6b1f-44fa-847e-4fb1e67a58e7@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113054_133434_5998B881 
X-CRM114-Status: GOOD (  48.05  )
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

On Mon, Sep 28, 2026 at 11:38:01AM +0100, Suzuki K Poulose wrote:
> On 25/09/2026 18:07, Catalin Marinas wrote:
> > On Wed, Sep 23, 2026 at 05:04:06PM +0100, Suzuki K Poulose wrote:
> > > On 23/09/2026 16:45, Will Deacon wrote:
> > > > On Wed, Sep 23, 2026 at 12:06:15PM +0100, Catalin Marinas wrote:
> > > > > On Tue, Sep 22, 2026 at 06:15:34PM +0100, Will Deacon wrote:
> > > > > > On Sun, Sep 13, 2026 at 08:04:58AM +0100, Suzuki K Poulose wrote:
> > > > > > > From: Steven Price <steven.price@arm.com>
> > > > > > > 
> > > > > > > If the host attempts to access granules that have been delegated for use
> > > > > > > in a realm these accesses will be caught and will trigger a Granule
> > > > > > > Protection Fault (GPF).
> > > > > > > 
> > > > > > > A fault during a page walk signals a bug in the kernel and is handled by
> > > > > > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > > > > > having access to a page which has been delegated to the kernel and will
> > > > > > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > > > > > delegated page.
> > > > > > > 
> > > > > > > There is work in progress to unmap the guest_memfd backed private pages from the
> > > > > > > linear map. Until we get that support, we could get spurious GPFs from within
> > > > > > > the kernel, e.g., load_unaligned_zeropad(). So, try to fix them up for now.
> > > > > > > 
> > > > > > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > > > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > > > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > > > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > > > > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > > > > > ---
> > > > > > > Changes since v17:
> > > > > > >    * Pass untagged address to die_kernel_fault() - Sashiko
> > > > > > >    * Explicitly check !user_mode() for fixups - Catalin
> > > > > > >    * Switch to BUS_OBJERR for si_code from SI_KERNEL - Catalin
> > > > > > >    * Clarify the commit description about the upcoming work on
> > > > > > >      unmapping guest_memfd backed pages from linear map
> > > > > > > Changes since v16:
> > > > > > >    * Update the commit description to indicate why we try to fixup GPFs
> > > > > > > Changes since v10:
> > > > > > >    * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > > > > > Changes since v2:
> > > > > > >    * Include missing "Granule Protection Fault at level -1"
> > > > > > > ---
> > > > > > >    arch/arm64/mm/fault.c | 30 ++++++++++++++++++++++++------
> > > > > > >    1 file changed, 24 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > I still don't think we should do this, given that the plan is to unmap
> > > > > > the memory from the linear map. If this thing fires, it's a kernel bug
> > > > > > and it should be fatal.
> > > > > 
> > > > > If the linear unmapping gets merged first, I agree, no need to handle
> > > > > these faults. I haven't followed that series, so no idea where it is at.
> > > 
> > > There doesn't seem to be much progress on that series. Brendan
> > > volunteered to resurrect the series, taking over from Nikita [0].
> > > But looks like Brendan is not working on this anymore. Will see
> > > if someone is really planning to look at it.
> > > 
> > > [0] https://lore.kernel.org/all/DJJ35VLH2PE5.DFD8OYXEOH97@linux.dev
> > 
> > I just realised that this only solves part of the problem. Normal kernel
> > allocations are delegated RMM metadata and they'll also trigger GPF
> 
> Other than Kdump, kernel shouldn't try to touch these metadata pages
> unless there is a kernel bug ?

Hibernate but we need to reject this as well since there's no way you
can save and restore the realm memory.

> And the userspace wouldn't have a mapping for them anyways ?

That's the aim but proposed KVM/CCA support still allows non-gmem slots
to end up delegated (I haven't checked the latest if addressed).

> > https://lore.kernel.org/all/a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com/
> > 
> > I think rmi_delegate_range() covers the non-kdump cases, both for
> > metadata and realm memory, we could unmap the linear map there (map it
> > back in rmi_undelegate_range()).
> 
> We could explore that option for the kernel allocations too.

I do wonder what we gain from unmapping. If architecturally we get a
synchronous fault when accessing delegated pages, it's only marginally
more code to do_gpf() (and we might need this function anyway for
kdump) and we avoid linear map fragmentation. So, I think we just need
to agree what's fatal and what can safely recover. We do need Alper's
patch for kdump, otherwise we can't fix it up in do_gpf().

-- 
Catalin

