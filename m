Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E378C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 17:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgtKXHzGDDQyHWV9xugerf2/7MZfWzmH0C1BOKc6FKY=; b=OIMuZWRekXnqstgCECavzfRjgS
	D5mWDF/1I7pDGMaUY6kNWO0BfdAwnaqSLV/NysccUd4tBnCi1v1FKey51P3ZDMEhu6/oM8kaY1vuy
	XCN+QOTNz081vr/gLn1DV72KZ7bVE4ii/L/1cwxs+ERaa6jVbDtxiAAtbr1fRX4ZA5Aurv21ce0wa
	YmP0qBPzynryX73Dl9OGgRKeX+uGmpANZ0MZdH90N0uufgqJE7tlwc1L8Db9McbpPW81xa/yHpEKV
	KBJseLZ5Fp3aMuFI/0TfjAYz7JSOa1DYivip/ymghg42F9ipTSIiovbjopQLYkCK9b1ZvAdbO4OnE
	jwUB/8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCiG-0000000GfEw-3wAi;
	Wed, 12 Aug 2026 17:26:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCiE-0000000GfEP-2Jqo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 17:25:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 027DA1596;
	Wed, 12 Aug 2026 10:25:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B91943F66F;
	Wed, 12 Aug 2026 10:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786555556; bh=H8Ctj6oiAsOEpGNBs0wlRNq4MV8mA+m6BBgfdUbyouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7MvlTwCYIwI4GDClgPFTpjUn0sPusFPcML8t810t+/14DjgB7H6MHkilb/6UiE7z
	 ygNoSqQ5anoFHIng2RTl38bEgQufRq6aCROSFR8PsvTOYN+DONSLOZ4RNcz/oEDVl8
	 rDzolVsJ4vasql17ywsCsdZsl95wvqEHSbsasHfo=
Date: Wed, 12 Aug 2026 18:25:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
Message-ID: <anysnQFVTO_RAYxp@arm.com>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com>
 <yq5ajypvioks.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ajypvioks.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_102558_679560_0C54C216 
X-CRM114-Status: GOOD (  24.66  )
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

On Wed, Aug 12, 2026 at 04:38:03PM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Tue, Aug 11, 2026 at 07:10:56PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Systems with memory encryption use swiotlb to provide shared or
> >> unencrypted buffers for device DMA. Confidential guests may route all
> >> DMA through these buffers, while SME hosts use them for devices that
> >> cannot address encrypted memory. The default swiotlb pool can therefore
> >> be exhausted under I/O-intensive workloads.
> >> 
> >> Let architectures mark the default swiotlb pool as shared before
> >> swiotlb_init().
> >
> > I thought we wanted even this decision to be moved out of the arch code.
> 
> Architectures may want to use an unencrypted swiotlb pool for different
> reasons, one of them being CC_ATTR_GUEST_MEM_ENCRYPT. x86 hosts also
> require unencrypted pool to support SME. We can cover both cases using
> CC_ATTR_MEM_ENCRYPT.

Yes but in one case it did not do resizing. With your proposal, it now
does swiotlb resizing even for SME.

> However, pKVM does not want an unencrypted SWIOTLB
> pool. So I was thinking it would be much cleaner to let the architecture
> code drive that decision.

Let's not single out pKVM but rather the reason it does not want one -
it relies heavily on restricted mem. If you started a pKVM guest
without rmem in DT, I assume it will need swiotlb to function properly.
It's not a great heuristic (devices may not use rmem) but it preserves
the current behaviour and can be overridden on the command line.

> > BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
> > option in realms?

It's still not clear to me why we went for CC_ATTR_MEM_ENCRYPT instead
of CC_ATTR_GUEST_MEM_ENCRYPT.

> For the same reason I mentioned above, architectures may have different
> reasons for setting cc_shared = true. IMHO, it is cleaner to let the
> architecture code make that decision before swiotlb_init().

The arch code already reports cc_platform_has(), can we not rely on
this in the core code instead of specific is_realm_world() and a new
SWIOTLB_INIT_CC_SHARED flag or function call?

We have three different decisions that shouldn't be driven by a single
flag from the arch code:

1. allocate default pool
2. make default pool shared
3. resize default pool

(1) is traditionally driven by arch code and that's fine. For (2), the
core code has the information via CC_ATTR_*. For (3), we can enlarge it
based on CC_ATTR_GUEST_MEM_ENCRYPT in combination with rmem (but not
CC_ATTR_MEM_ENCRYPT to keep the current x86 behaviour).

I think we should also move the reduction based on
CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC into the core code. Riscv copied the
same heuristic as arm64, so there's precedent for sharing.

-- 
Catalin

