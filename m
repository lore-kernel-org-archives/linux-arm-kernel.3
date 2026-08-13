Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D134DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoWTkmUJh/zufVuD2EZbwPjMgkQ/naSZXgSsBw6ff3g=; b=XFolGk2OHZ4KB9+O3UdKu47Q4u
	yawfRATiSMGSuvRErr+208tKhwDwTnKa/MdIWOwWTYXpD3Cve8bPw+2tVt4lXKNkeDQuiNV20ZMI0
	7Rpcyh/kiHnXTN8Q8CgPh3F+o5ymF991TtKaP4TWRxZkwqTX3yPAv+1Wx1vT3tJfPfqmq9pq9KWOk
	4oLTRyFpurkLZkT6fjnvgisR3dwG5JsyIq9Viufmz0KlL5wItR2FoayIrMtGZdr891UV7CPBbXa6N
	86HCoLem90w0l9PlKBDF18moo15Jm2jzD/JPYVQ1diZu+SRsFCVHjApBJQc/shAx8q9jpf9Y6SFFc
	had/UaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR6D-00000000Cu6-19Qw;
	Thu, 13 Aug 2026 08:47:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuR69-00000000Csi-27dy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:47:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDACB153B;
	Thu, 13 Aug 2026 01:47:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B7F53F632;
	Thu, 13 Aug 2026 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786610855; bh=u5KMzGgVOcLWbuPlGu/sTLdzSGT3hVGWZa68nwwdEyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kT2LB7gWPYpgXVp71WWZoEXALMvIuyrYp2tyQrSRM7LMcXDOoynp3ByKSZ/tbnOds
	 7sOyvXvON5GdcI8v+AGnoMPFjNbyQnUOJYmgJ/wJu21XtiGgJJDFOhsnMhJdtg/Kps
	 Ku5KeVrNaQDn+9+ZGLenYYr12tmjJiDAlfff6Owc=
Date: Thu, 13 Aug 2026 09:47:28 +0100
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
Message-ID: <an2EoONjyp570tvB@arm.com>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com>
 <yq5ajypvioks.fsf@kernel.org>
 <anysnQFVTO_RAYxp@arm.com>
 <yq5aecg2io0u.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecg2io0u.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_014737_703669_622B4BC5 
X-CRM114-Status: GOOD (  33.78  )
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

On Thu, Aug 13, 2026 at 11:02:17AM +0530, Aneesh Kumar K.V wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> > On Wed, Aug 12, 2026 at 04:38:03PM +0530, Aneesh Kumar K.V wrote:
> >> Catalin Marinas <catalin.marinas@arm.com> writes:
> >> > On Tue, Aug 11, 2026 at 07:10:56PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> >> Systems with memory encryption use swiotlb to provide shared or
> >> >> unencrypted buffers for device DMA. Confidential guests may route all
> >> >> DMA through these buffers, while SME hosts use them for devices that
> >> >> cannot address encrypted memory. The default swiotlb pool can therefore
> >> >> be exhausted under I/O-intensive workloads.
> >> >> 
> >> >> Let architectures mark the default swiotlb pool as shared before
> >> >> swiotlb_init().
> >> >
> >> > I thought we wanted even this decision to be moved out of the arch code.
> >> 
> >> Architectures may want to use an unencrypted swiotlb pool for different
> >> reasons, one of them being CC_ATTR_GUEST_MEM_ENCRYPT. x86 hosts also
> >> require unencrypted pool to support SME. We can cover both cases using
> >> CC_ATTR_MEM_ENCRYPT.
> >
> > Yes but in one case it did not do resizing. With your proposal, it now
> > does swiotlb resizing even for SME.
> 
> Isn't that a bug with x86 SME? I would expect both SME and SEV to
> require that swiotlb resize.

Maybe, but that's for a different discussion (and we may want different
sizing). Better to keep the semantics unchanged for now.

> >> > BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
> >> > option in realms?
> 
> This is getting fixed in  
> https://lore.kernel.org/all/20260701054926.825925-9-aneesh.kumar@kernel.org/

You might want to bring this early together with the swiotlb adjustment
here.

> >> For the same reason I mentioned above, architectures may have different
> >> reasons for setting cc_shared = true. IMHO, it is cleaner to let the
> >> architecture code make that decision before swiotlb_init().
> >
> > The arch code already reports cc_platform_has(), can we not rely on
> > this in the core code instead of specific is_realm_world() and a new
> > SWIOTLB_INIT_CC_SHARED flag or function call?
> >
> > We have three different decisions that shouldn't be driven by a single
> > flag from the arch code:
> >
> > 1. allocate default pool
> > 2. make default pool shared
> > 3. resize default pool
> >
> > (1) is traditionally driven by arch code and that's fine. For (2), the
> > core code has the information via CC_ATTR_*. For (3), we can enlarge it
> > based on CC_ATTR_GUEST_MEM_ENCRYPT in combination with rmem (but not
> > CC_ATTR_MEM_ENCRYPT to keep the current x86 behaviour).
> 
> Okay, if the presence of restricted-dma-pool is taken as a hint, we can
> definitely move that to generic code.
> 
> I still think not resizing the swiotlb pool on the host for SME is an
> x86 bug. However, I'll keep it compatible with the current behavior and
> use CC_ATTR_GUEST_MEM_ENCRYPT for now. We can handle host SME in a
> separate patch if needed.

Sound good.

> > I think we should also move the reduction based on
> > CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC into the core code. Riscv copied the
> > same heuristic as arm64, so there's precedent for sharing.
> 
> I already have a patch doing that.

Great. Now you have a 3-patch series for the generic swiotlb sizing ;)

-- 
Catalin

