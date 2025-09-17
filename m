Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKIi0oR0+vdozASxcRBulxOIRwwjLIxYBZkCUe8TJ5E=; b=B/scg0ICmxbY82uz6RHZROR8Bd
	yLmvkzDygtQgTD0fSoPfnK1KOOLCSiVm1xme010OQgexwH47s7StjEM7AUteMPuj/3vpEUGNDHQRp
	EasbuDaItc0HHVDwWmdfDtqDhuwWhwu3DzdicPwL2mNotlboBP12jJqXZCm/NfkiiX97vqj6JKxhd
	hhsyc800sDCMtK5RZGGOEJwYSNckGEhc+1KfqpDuOmDHALsmYTLrsceHUfQjrExcOJRjzhnRNByMn
	BWxBOVOHZ/GE+sQJdhvKVhjH9kJk7hRiFyr/G0Wyv9+OKLok1DRM0uiQNUcAMgW31kGfGFP8kzxwy
	9fzQVYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxBH-0000000E1Hs-0fo7;
	Wed, 17 Sep 2025 18:47:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxBG-0000000E1H5-1WQU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 18:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A27AA6023C;
	Wed, 17 Sep 2025 18:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80B8C4CEF9;
	Wed, 17 Sep 2025 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758134791;
	bh=XfxdX33JVvC2rTvQ5qzTsTE9zaKknGx6DU8yDTlw1vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNjT3Y6D3/qxn1gVIjdWu1wmKpUJ75cLnWQZW5KkyFeUa2RuoBmflnQLROj5ScRUi
	 0shpzP/bFN2lGdssCIYyhCQoiCTJr7oOxsSIaXEpUVwyFxKZaBgmvxCpIchv2qGKSC
	 cKVAcQwYDSpLkadCHIDiGwRMr5q89qXgqFcju2yEmBuhvJyTO1ny6P22G+jZPFNQXn
	 THWeEnnpNNn2+r0grhXtdz2fQf5epUzyaJcjvAyMstlC+87EE6XRDjMt0nhSC8F6pS
	 oN4yUEJ3lET5bFqQ68P7buDUqyS3FvqQtjUNZQcP9ZXvoCSBTAzpI+AFay/cxTmLn9
	 U8gbaYNT1eO5g==
Date: Wed, 17 Sep 2025 21:46:25 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/4] ARM: dma-mapping: Switch to physical address
 mapping callbacks
Message-ID: <20250917184625.GA10800@unreal>
References: <cover.1758006942.git.leon@kernel.org>
 <5f96e44b1fb5d92a6a5f25fc9148a733a1a53b9d.1758006942.git.leon@kernel.org>
 <20250916184617.GW1086830@nvidia.com>
 <20250917103644.GB6464@unreal>
 <20250917113248.GA1086830@nvidia.com>
 <20250917134128.GC6464@unreal>
 <20250917135819.GA1391379@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917135819.GA1391379@nvidia.com>
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

On Wed, Sep 17, 2025 at 10:58:19AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 04:41:28PM +0300, Leon Romanovsky wrote:
> > On Wed, Sep 17, 2025 at 08:32:48AM -0300, Jason Gunthorpe wrote:
> > > On Wed, Sep 17, 2025 at 01:36:44PM +0300, Leon Romanovsky wrote:
> > > > On Tue, Sep 16, 2025 at 03:46:17PM -0300, Jason Gunthorpe wrote:
> > > > > On Tue, Sep 16, 2025 at 10:32:06AM +0300, Leon Romanovsky wrote:
> > > > > > +	if (!dev->dma_coherent &&
> > > > > > +	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> > > > > > +		__dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
> > > > > 
> > > > > I'd keep going and get rid of the page here too, maybe as a second
> > > > > patch in this series:
> > > > 
> > > > Thanks, it is always unclear how far to go with cleanups.
> > > 
> > > IMHO to maximally support what Matthew is working on I'd remove all
> > > the struct page things and prefer the pfn/phys variations from the MM
> > > side.
> > 
> > ok, my patches can be found here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio
> > 
> > I converted "struct page" path from all archs with .map_page.
> 
> Yeah, that's right, I would split this into a few series
> 
> This group is all fairly trivial stuff that didn't use the struct
> page or virt address at all:
> 
>  MIPS/jazzdma
>  x86
>  vdpa
>  xen: swiotlb:  (though make a phys_to_xen_pfn() macro)
> 
> I'd also drop the ATTR_MMIO checks from x86 and jazzdma
> since the code is obviously fine with any phys.

It is not trivial as it sounds.

Let's take as an example MIPS/jazzdma, should we call to vdma_alloc()
in DMA_ATTR_MMIO case? or directly return "phys" as it is done in other
architectures?

> 
> vdpa can support ATTR_MMIO with the same iommu prot MMIO adjustment,
> that would be a good additional patch.

There is "bounce page" in VDPA, it sounds like swiotlb to me, which
doesn't work with MMIO.

> 
> Then there are more conversions that don't use struct page or va but
> are not so trivial
> 
> alpha
> parisc
> 
> Then the last ones sparc/power are quite complicated and do use
> __va/etc.
> 
> Jason
> 

