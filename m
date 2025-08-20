Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1608CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Y6XVa5Ajz0hP8x0NdaUNawd8S4iL6Gx7VW4sbjn67E=; b=v1rSYx0pBUAussMmp5IQc883Av
	iV/XFdqV62JVITbxBg8XNZSNJipoXBhcPURtZwO+oFSwJ3AimYjmnAJASACGpHlmB9Pd8krv/mx1G
	bzwIM7zL4reMcf4TGSTb65U37h6/t3C/Fy2M9R2lHoUcP4xoKOWhdJwL5Bd+e3uZ1oLMp7mbafBdM
	YW56Wb71kLlRTJqax362DpHjCuNT+Sy2dkApz7gboBpkYOOvrbF5Z/UMueR6N+UMQaL2Z8ybO7Pik
	lvNtMUUFhUK1BD/ls8K846F9Zx/8MHCj/adGmHdFHCx6kEeDPLiA7KCf0KWph1+VInrTQD7wu9AMe
	/BxVLmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonsg-0000000EiFj-1AxA;
	Wed, 20 Aug 2025 18:49:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokYF-0000000EDkJ-0Mad
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FCFE4474E;
	Wed, 20 Aug 2025 15:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145E1C4CEEB;
	Wed, 20 Aug 2025 15:16:32 +0000 (UTC)
Date: Wed, 20 Aug 2025 16:16:30 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: John Cox <john.cox@raspberrypi.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to
 respect dir parameter
Message-ID: <aKXmzryGjmYMG7kB@arm.com>
References: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
 <aKXMx5RZCy6cuc33@arm.com>
 <9bb085e7-9833-480b-8804-e9a0d2167f25@arm.com>
 <CAEgJzYOj3dQgS-g4ffG4eGJUQdvtSmAt_ECkMogHfvgsp+aWMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEgJzYOj3dQgS-g4ffG4eGJUQdvtSmAt_ECkMogHfvgsp+aWMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081635_165513_5B49E1A0 
X-CRM114-Status: GOOD (  42.80  )
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

On Wed, Aug 20, 2025 at 03:43:16PM +0100, John Cox wrote:
> On Wed, 20 Aug 2025 at 15:08, Robin Murphy <robin.murphy@arm.com> wrote:
> >
> > On 20/08/2025 2:25 pm, Catalin Marinas wrote:
> > > On Wed, Aug 20, 2025 at 11:28:06AM +0100, John Cox via B4 Relay wrote:
> > >> This patch makes the arch_sync_dma_for_device function on arm64
> > >> do different things depending on the value of the dir parameter. In
> > >> particular it does a cache invalidate operation if the dir flag is
> > >> set to DMA_FROM_DEVICE. The current code does a writeback without
> > >> invalidate under all circumstances. Nearly all other architectures do
> > >> an invalidate if the direction is FROM_DEVICE which seems like the
> > >> correct thing to do to me.
> > >
> > > So does arm64 but in the arch_sync_dma_for_cpu(). That's the correct
> > > place to do it, otherwise after arch_sync_dma_for_device() you may have
> > > speculative loads by the CPU populating the caches with stale data
> > > before the device finished writing.
> >
> > Exactly, not only is it unnecessary, it's not even guaranteed to have
> > any lasting effect. arch_sync_dma_for_device() has two jobs to do: 1)
> > ensure that any new data going in the DMA_TO_DEVICE direction is visible
> > to the device; a clean is sufficient for that. 2) ensure that no dirty
> > cachelines may be written back over new DMA_FROM_DEVICE data; a clean is
> > sufficient for that also. Adding an invalidate at this point serves no
> > purpose since the CPU is still free to immediately speculatively fetch
> > the same cleaned data back into the cache.
> 
> An invalidate at this point for DMA_FROM_DEVICE does satisfy (2) at least as
> well as clean and has the side benefit that any used cache lines are
> now free for use by the CPU. (1) is unaffected by this patch.
> 
> I believe that my patch is no less functional than the current code..

It's no less functional but it does not address the problem, it simply
makes it less likely. Both Robin and I explained the speculative loads
potentially leading to inconsistent data if the for_cpu API is not
called.

So I'd rather have the current behaviour and we can spot problems early
than hiding it and making it harder to debug.

> > > An attempt to a udmabuf fix (untested):
> > >
> > > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > > index 40399c26e6be..9ab4a6c01143 100644
> > > --- a/drivers/dma-buf/udmabuf.c
> > > +++ b/drivers/dma-buf/udmabuf.c
> > > @@ -256,10 +256,11 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
> > >                       ret = PTR_ERR(ubuf->sg);
> > >                       ubuf->sg = NULL;
> > >               }
> > > -     } else {
> > > -             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> > >       }
> > >
> > > +     if (ubuf->sg)
> > > +             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> > > +
> > >       return ret;
> > >   }
> 
> Indeed, though that does have the annoyance that you run two sets
> of cache ops over the entire buffer rather than one and for a decent
> size of buffer (e.g. video frame) that is not free given that you have
> to loop over every cache line.

The udmabuf code is slightly dodgy anyway. I expect the DMA buffer to
have been mapped already and a sync to_device issued long before
begin_cpu_udmabuf() is called without needing an additional dma_map here
just to populate the sg list. Otherwise it's quite late to do the sync
for_device just before the CPU is about to start reading. I'm not
familiar with this code but at this point we really should only have the
for_cpu loop.

Maybe the problem is elsewhere, I just spotted a corner case where the
sync for_cpu is not called.

> I take your points, but this patch should be no less functional and no slower
> than the current code and does work around existing cases where other
> drivers haven't got it right.

It does not work around them, it just makes them rarer. Other
architectures may get away with doing such maintenance in the for_device
sync only if they don't have aggressive speculative loads into the
cache. That's not the case for arm64.

-- 
Catalin

