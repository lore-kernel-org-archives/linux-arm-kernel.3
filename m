Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE48CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fw4szaokxgiUPAQhZGCofjdxhTTsZbLg1OQJ1y9zeo=; b=gfllo+2ve4w5qj2Np8wnSldJUN
	nZwo3aa8xepCSDS73eMNlU8hE6sB0bcxW5QTBAE6iGMX2lg2/qjtNTI48tTusM238cBebDpFUUR3w
	bQeBkTmR6UffH1kYo5ZHCmtmw6uU7gxqwBXunuDs0ELOKdF0haZbk3MlmGXtksqzHRR/bF5A8QGpz
	n4Iw8a3JqotfVBobW5zBaamz9XInq41W09Ic4cDMmdJevUbJO1OwJkRn9DcgHqZJ/d1+S7bPrKMj0
	qqkZT1iiedTILvVl/8D4/974WrfeK8MNlStE/RZRAsx/qpyObh9naJXLM6LoMdxu7Y6N4oVcXIJUw
	aKV6nsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysPf-0000000BnPM-05rN;
	Wed, 17 Sep 2025 13:41:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uysPd-0000000BnOn-1TTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69E436022A;
	Wed, 17 Sep 2025 13:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BB3C4CEF0;
	Wed, 17 Sep 2025 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758116492;
	bh=sQdxo9SHlz51iSsTYeRMaDH1R61J5cb2/KGHfNquLPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ax4ebU2V58seIKiExQTG+K/Ojes9WRpuct4T/mglVB9AUokZ9llUAVlJTvAilmfjd
	 pbEGgmRc2FMFiqRQKWisabz0AnTaRGCy/Oc2i/AyA2KEVynk9Zm2ChnPkeiA1iQyPY
	 Pufr0WD+YSz/IhrOkbkAfxbOZ0WJVYSp4Z4EpE+LzF8AKKLobaT7JmZf0I8rczKOE4
	 PRUtTDYFeZPBMZGEJ5/IJHg6YAPygnZsbEXLkAHWj+o0iltSRZtHaJm7ZrSSXCAube
	 3JRBYiXu9Ckrhz7+Kt2Yr32kwHDfWvcRBWW2VFgbAN1lN9n2qcBM6FmmbkfFc1DMp8
	 gMjH1mt0ITNUw==
Date: Wed, 17 Sep 2025 16:41:28 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 3/4] ARM: dma-mapping: Switch to physical address
 mapping callbacks
Message-ID: <20250917134128.GC6464@unreal>
References: <cover.1758006942.git.leon@kernel.org>
 <5f96e44b1fb5d92a6a5f25fc9148a733a1a53b9d.1758006942.git.leon@kernel.org>
 <20250916184617.GW1086830@nvidia.com>
 <20250917103644.GB6464@unreal>
 <20250917113248.GA1086830@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917113248.GA1086830@nvidia.com>
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

On Wed, Sep 17, 2025 at 08:32:48AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 17, 2025 at 01:36:44PM +0300, Leon Romanovsky wrote:
> > On Tue, Sep 16, 2025 at 03:46:17PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Sep 16, 2025 at 10:32:06AM +0300, Leon Romanovsky wrote:
> > > > +	if (!dev->dma_coherent &&
> > > > +	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
> > > > +		__dma_page_cpu_to_dev(phys_to_page(phys), offset, size, dir);
> > > 
> > > I'd keep going and get rid of the page here too, maybe as a second
> > > patch in this series:
> > 
> > Thanks, it is always unclear how far to go with cleanups.
> 
> IMHO to maximally support what Matthew is working on I'd remove all
> the struct page things and prefer the pfn/phys variations from the MM
> side.

ok, my patches can be found here:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio

I converted "struct page" path from all archs with .map_page.

Thanks

