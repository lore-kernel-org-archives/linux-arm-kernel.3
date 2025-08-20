Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5C9CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfXvIw8M3rhpGDqe9ypeEk0Xb18BQOEfD1R8D+1jD8Y=; b=dfVS/1fJYB//BA0AF/4mNO3Vqv
	dZilpUablra+n/54xflSRXD0w8GjO8hCzWEvxBDxQyLoND/jATiNgZ/hBQPn7GH19ytTAIxANYQJc
	oC/W6nPvdzO2HE7zGQ4kkOTYsu6F90haTuDiARsT+fSf4ATtDpWpU9MSoALW8ADfTUITCrVdyQOGR
	05WqRSYvs6/Xn+FCgb7Cn0KDgA3Pzls85Ye/sOmVz3BGCZsrMViWUIVEbLmmsVajIIaEx5Gg81mkg
	Oh+AFIglyzHb7bLF9/2tKtV4v3819D+L8l4+KT62diC5RpnN0gf/7JqBQYnvpqmWnbQkPA24Yg7LV
	bpLzeFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoljv-0000000EPPr-0Wpe;
	Wed, 20 Aug 2025 16:32:43 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uok2E-0000000E8O5-2TSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:43:31 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e931cad1fd8so6677444276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1755701009; x=1756305809; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfXvIw8M3rhpGDqe9ypeEk0Xb18BQOEfD1R8D+1jD8Y=;
        b=MLX+JFd6CDlgk1K3+CS+t4zLqCZAaZ0X4Zoce5BXt4wwpkmcKJxF+50eG1mRo+xxqw
         dgoec/agp7/HqPeJVypWD9Ksld+PyCsQOWXZWI+FGtzTR5Ubg++Ddp8bpUTyKF57Qh9r
         3rJzDb0rNVzQBWuPa6ZMFk9pTdYm7meCh3lA3JkZWdNvRBWXFABN5WA4clqbAqu+Ho9d
         rUl9aaQkPilpA4n2CUTUgY6pAE+A20mbK4y0Sn15Pwq7OjQyLnIs/DQVpdeiZjzbR3Oc
         1dEDn92GHYt5ZwEZf8GYcG23L18b8JCpkGxUlKw/8L3zEIR/fVbXmLdCa54ujnPgVc/j
         Qpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701009; x=1756305809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfXvIw8M3rhpGDqe9ypeEk0Xb18BQOEfD1R8D+1jD8Y=;
        b=TuTtFLfoIlKsBuDYzOOnEWduvFrJosca+yROLg6vgSTbo5dvpaCs/Px/GdjuBzyJ5Z
         C0sjgy77OIrT92Rt4joTbqUcjTRUUtXVHavYRCWqmay4tojP3wkX/mu9sdfZmR8APR6Q
         Wcqvom10k9/UmwqMPMkjwYuiTB9TmFhsPlesep4qg0qGUlyrd+DgF69TcCwMpkJMk6Yb
         2i1IkhwE/4p/Q164QyNhLKxjN475O56jSq/lfBwZtLqnv9kspKpfAhAY9RiyD31+CxWK
         vZC4tWXiUGwKp2+VNPNaQivT252GGfhqrd0z1UIRhmytZ0MzW7btBfIvLc39Q3H7Hzdu
         +0AA==
X-Forwarded-Encrypted: i=1; AJvYcCVmJveYaa931OVaBp9ryQsFWq4ngqKchjtXJxBxwFJEdB0C48yavOSPexuRloPR8eZNUiWzP8o4UQzl9W3MFG4k@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuvw7PLPXG5YSNVo3tAro+38IV+Cd/gECu9E3N91E3Q+1LS9Pu
	vzoxDDY4Y8JZqEIxKQT1bliUy9TCgVBvkE+yJ0XKFo7UxNGLV+wb2S6VFpybmDBmDCa2zHKfxIR
	rRz7KTRMaPo1j/iCsy3BCVlvT0WAIV0PwXUoPc7ufVQ==
X-Gm-Gg: ASbGnctUQKjIeFSNCukW/1l8tDg45CouOG56a6evfd4axc6hsV9vvmsD+0Q8T8g21p4
	2z3LafMME/gATTMThcpk4f5GMYPfHcUdWpCCkzQcQmRsplcqfSS2fBiCh/1gwxd8Osu4gBfDPmg
	vkkjx0DAeweXuXlijMFs73e6ASlDngMLolrv36o34D6gpedMvEGseL+H6RvxvXH9ecRy7v/vWRz
	jT32Yjwo+tZPO94
X-Google-Smtp-Source: AGHT+IGKVwurNNVoTc+24AR7qNEs19XqT6ymEiGAd/pauKcT2CdeYLK79V42u0xyC9b9JOo/FRonGkezfrGKdcHpM9c=
X-Received: by 2002:a05:6902:4005:b0:e94:626b:c13a with SMTP id
 3f1490d57ef6-e94f657af0dmr3861671276.15.1755701008953; Wed, 20 Aug 2025
 07:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
 <aKXMx5RZCy6cuc33@arm.com> <9bb085e7-9833-480b-8804-e9a0d2167f25@arm.com>
In-Reply-To: <9bb085e7-9833-480b-8804-e9a0d2167f25@arm.com>
From: John Cox <john.cox@raspberrypi.com>
Date: Wed, 20 Aug 2025 15:43:16 +0100
X-Gm-Features: Ac12FXyTjMjSCWZ1ObQfEsmEe7w2RdfkJQZOOSeF70CU7hFAK8rLEYepRHg6oX8
Message-ID: <CAEgJzYOj3dQgS-g4ffG4eGJUQdvtSmAt_ECkMogHfvgsp+aWMw@mail.gmail.com>
Subject: Re: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to
 respect dir parameter
To: Robin Murphy <robin.murphy@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_074330_722767_33CCDB36 
X-CRM114-Status: GOOD (  55.61  )
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

On Wed, 20 Aug 2025 at 15:08, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 20/08/2025 2:25 pm, Catalin Marinas wrote:
> > On Wed, Aug 20, 2025 at 11:28:06AM +0100, John Cox via B4 Relay wrote:
> >> All other architectures do different cache operations depending on the
> >> dir parameter. Fix arm64 to do the same.
> >
> > I suspect that's a bug in the users of the DMA API. We shouldn't modify
> > the arm64 implementation to cope with them.
> >
> >> This fixes udmabuf operations when syncing for read e.g. when the CPU
> >> reads back a V4L2 decoded frame buffer.
> >>
> >> Signed-off-by: John Cox <john.cox@raspberrypi.com>
> >> ---
> >> This patch makes the arch_sync_dma_for_device function on arm64
> >> do different things depending on the value of the dir parameter. In
> >> particular it does a cache invalidate operation if the dir flag is
> >> set to DMA_FROM_DEVICE. The current code does a writeback without
> >> invalidate under all circumstances. Nearly all other architectures do
> >> an invalidate if the direction is FROM_DEVICE which seems like the
> >> correct thing to do to me.
> >
> > So does arm64 but in the arch_sync_dma_for_cpu(). That's the correct
> > place to do it, otherwise after arch_sync_dma_for_device() you may have
> > speculative loads by the CPU populating the caches with stale data
> > before the device finished writing.
>
> Exactly, not only is it unnecessary, it's not even guaranteed to have
> any lasting effect. arch_sync_dma_for_device() has two jobs to do: 1)
> ensure that any new data going in the DMA_TO_DEVICE direction is visible
> to the device; a clean is sufficient for that. 2) ensure that no dirty
> cachelines may be written back over new DMA_FROM_DEVICE data; a clean is
> sufficient for that also. Adding an invalidate at this point serves no
> purpose since the CPU is still free to immediately speculatively fetch
> the same cleaned data back into the cache.

An invalidate at this point for DMA_FROM_DEVICE does satisfy (2) at least as
well as clean and has the side benefit that any used cache lines are
now free for
use by the CPU. (1) is unaffected by this patch.

I believe that my patch is no less functional than the current code..

> >> This patch fixes a problem I was having with udmabuf allocated
> >> dmabufs. It also fixes a very similar problem I had with dma_heap
> >> allocated dmabuf but that occured very much less frequently and I
> >> haven't traced exactly what was going on there.
> >>
> >> My problem (on a Raspberry Pi5):
> >>
> >> [Userland]
> >> Alloc memory with memfd_create + ftruncate
> >> Derive dmabuf from memfd with udmabuf
> >> Close memfd
> >> Queue dmabuf into V4L2 with QBUF
> >> <decode a video frame>
> >> Extract dmabuf from V4L2 with DQBUF
> >> Map dmabuf for read with mmap
> >> Sync for read with DMA_BUF_IOCTL_SYNC with (DMA_BUF_SYNC_START |
> >> DMA_BUF_SYNC_READ)
> >> Read buffer
> >> Sync end
> >> Unmap
> >
> > Between the device writing to the buffer and the "read buffer" step
> > above, is there a call to arch_sync_dma_for_cpu()? A quick look at
> > begin_cpu_udmabuf() shows a dma_sync_sgtable_for_cpu(), though there is
> > a branch where this is skipped. get_sg_table() seems to do a DMA map
> > which I think ends up in arch_sync_dma_for_device() but the sync
> > for-CPU is skipped.
>
> Indeed that path is clearly wrong.

As I noted, there is a patch for udmabuf going through at the moment that
reworks that section of the code and may well fix the issue above. However
I had a similar issue, though much less frequent with dma_heap/system
allocated buffers which this patch also fixes. Now I grant that finding and
fixing every bit of code that gets this wrong would be ideal but this does
improve the situation where other drivers make incorrect / outdated
assumptions about what arch_sync_dma_for_device does, possibly based
on what is done for other architectures (e.g. armv7).

> Thanks,
> Robin.
>
> > An attempt to a udmabuf fix (untested):
> >
> > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > index 40399c26e6be..9ab4a6c01143 100644
> > --- a/drivers/dma-buf/udmabuf.c
> > +++ b/drivers/dma-buf/udmabuf.c
> > @@ -256,10 +256,11 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
> >                       ret = PTR_ERR(ubuf->sg);
> >                       ubuf->sg = NULL;
> >               }
> > -     } else {
> > -             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> >       }
> >
> > +     if (ubuf->sg)
> > +             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> > +
> >       return ret;
> >   }

Indeed, though that does have the annoyance that you run two sets
of cache ops over the entire buffer rather than one and for a decent
size of buffer (e.g. video frame) that is not free given that you have
to loop over every cache line.

> >> I get old (zero) data out of the "Read buffer" stage in some cache
> >> lines sometimes.
> >> It doesn't matter which way round the mmap & sync are.
> >>
> >> I am aware that there is a patchset going through for udmabuf that may
> >> well fix the udmabuf case above, but given that this patch fixes
> >> something similar in dma_heap/system too I think it is still worth
> >> having.
> >> ---
> >>   arch/arm64/mm/dma-mapping.c | 16 +++++++++++++++-
> >>   1 file changed, 15 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> >> index b2b5792b2caaf81ccfc3204c94395bb0faeabddd..51c43c1f563015139e365ed86f0f5f0d9483fa7f 100644
> >> --- a/arch/arm64/mm/dma-mapping.c
> >> +++ b/arch/arm64/mm/dma-mapping.c
> >> @@ -16,8 +16,22 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> >>                            enum dma_data_direction dir)
> >>   {
> >>      unsigned long start = (unsigned long)phys_to_virt(paddr);
> >> +    unsigned long end = start + size;
> >>
> >> -    dcache_clean_poc(start, start + size);
> >> +    switch (dir) {
> >> +    case DMA_BIDIRECTIONAL:
> >> +            dcache_clean_inval_poc(start, end);
> >> +            break;
> >> +    case DMA_TO_DEVICE:
> >> +            dcache_clean_poc(start, end);
> >> +            break;
> >> +    case DMA_FROM_DEVICE:
> >> +            dcache_inval_poc(start, end);
> >> +            break;
> >> +    case DMA_NONE:
> >> +    default:
> >> +            break;
> >> +    }
> >>   }
> >
> > As explained above, that's not the right fix. We need to identify what's
> > missing on the ioctl() paths.
> >

I take your points, but this patch should be no less functional and no slower
than the current code and does work around existing cases where other
drivers haven't got it right.

Many thanks for your swift responses

John Cox

