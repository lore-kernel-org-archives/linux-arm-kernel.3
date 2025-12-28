Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC236D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P98SRjdk1udPfTRCe0tHmfxAuIA7U+aCJhLYgNaVUQA=; b=tqKi1D1A9AL6vidpxfLxKCl787
	ANi1hD/Uo4OiO6ih1PvfUTYWnZpp3RCvYz1rO45G0YrX5hJXmwJH+L4aEAFZNsZ2Io4yft1isPEW9
	7RQqeCrYk/Ql0KWu1e7LO7OXy5SyeoKrND5dW/HWA/6r1fS2i5SPoN9lVDGY8H8KmHFWwMzcpJhUE
	+V5/nvyq9jPIjcuM6AeCozri1ib4mg/qW5T8f69W9YG3jQqJ3EWmEeRiGzUl7K8Ko4IyH55mv3Yc5
	t7YrBAltPIrqNT/tOhKl6toa0WMYa+o4YYLLdoEXggZNKMJqrmE4BgzQgbIqW0FqOWuagMDNwCRWG
	q1wTedsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZs6a-00000002ovO-10vi;
	Sun, 28 Dec 2025 14:50:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZs6X-00000002oun-3lL5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 14:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B69B43EC7;
	Sun, 28 Dec 2025 14:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDB8C4CEFB;
	Sun, 28 Dec 2025 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766933445;
	bh=qbiHTFr5GuNGzRGenhnbtkv5WysSVwMoyJI42ZMBbjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uR1KTIMbxcfjIMp5BeqFx3rLg3y1/DslfD3E9dpTGsYLDXumEMvyTDlrtJexRliP8
	 4rMhxVlEgscTX6SMvyoGGbqBB9s3IhOyr0Dq1rOTTq9DRKyQCs5R4MMaiXq5SMJDv8
	 ypPf4xJu36IIq2elskChlmVCggK0X5P0P3iMsdzipt3Q/Pz09VtoJGRlajt3LsI+Wl
	 gbwuGIGXFZFArEze9cY3ogr29kq3DbeOzLDvfFkXuQM3i0eAPwqneC1a0xL9kATsPV
	 e7ey8Ht1VOWWZqIFGccgi1XAHIthQy1YRdTkX615ut3eBb5C2AjajZOKWeMy6qELr1
	 bfIt1iNGLWgqA==
Date: Sun, 28 Dec 2025 16:50:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for
 dma_direct_sync_sg_for_*
Message-ID: <20251228145041.GS11869@unreal>
References: <20251226225254.46197-1-21cnbao@gmail.com>
 <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal>
 <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_065045_974715_1272F9DC 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, robin.murphy@arm.com, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> On Sun, Dec 28, 2025 at 9:09 AM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > > From: Barry Song <baohua@kernel.org>
> > >
> > > Instead of performing a flush per SG entry, issue all cache
> > > operations first and then flush once. This ultimately benefits
> > > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> > >
> > > Cc: Leon Romanovsky <leon@kernel.org>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > ---
> > >  kernel/dma/direct.c | 14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> >
> > <...>
> >
> > > -             if (!dev_is_dma_coherent(dev)) {
> > > +             if (!dev_is_dma_coherent(dev))
> > >                       arch_sync_dma_for_device(paddr, sg->length,
> > >                                       dir);
> > > -                     arch_sync_dma_flush();
> > > -             }
> > >       }
> > > +     if (!dev_is_dma_coherent(dev))
> > > +             arch_sync_dma_flush();
> >
> > This patch should be squashed into the previous one. You introduced
> > arch_sync_dma_flush() there, and now you are placing it elsewhere.
> 
> Hi Leon,
> 
> The previous patch replaces all arch_sync_dma_for_* calls with
> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> functional change. The subsequent patches then implement the
> actual batching. I feel this is a better approach for reviewing
> each change independently. Otherwise, the previous patch would
> be too large.

Don't worry about it. Your patches are small enough.

> 
> Thanks
> Barry

