Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183C2CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OaAdYLUCjKX665SPiNgujbPAFCtj51/JdtAuXgcYhE=; b=oVBM8WOj/OTSEKGwMAwkedwlqO
	UvlBQkiYogPNWAow75hBo9IVlN8BQn/O5uro2YhPRxFSI6zzoq60eV6Vze+DFI12syLSXI57bpS3z
	8/t0jhnzfkmDfzP1MCReU3mqNSoJRoBtAExi2QlTudNoTlzrlWpOeBk48eXxAZejsfpg93GK9CTO1
	ua/MqmX4Fx/DLzgg2nkpJIXwlpAQ+eL65xgXBwjKZGYTAxvfwWt0w5mn4brXyB7iYyQqSPCznJBPY
	QTvcCYWFyKuI6hf5cx5UZ9l4EGSQ/nLDU2IHvaDu/XAz3QwXLXzwmkV47oa/Ttz16tkM/ea4r4cAN
	/RhK44Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo0P-0000000Ej6l-1GeL;
	Wed, 20 Aug 2025 18:57:53 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokqx-0000000EHS5-3jNP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:35:57 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e94f7232b30so7336276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 08:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1755704155; x=1756308955; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/OaAdYLUCjKX665SPiNgujbPAFCtj51/JdtAuXgcYhE=;
        b=iG9rmZmKsMrVhBF01L3y8748dJpFS9jCyn32LWl8Kp5bCs20ZEXvXEHZgINYvfrJgI
         YlPSZLjSCb9OM5VHei6u1ZYrsZEIlMX3QabO87zpNzDcpnwMLnZaeWOBfvKEBBEmLzWi
         Bkofp7cUsyCEOzlt4EGicd68gnLZw6kRcl3351UCJHmntTSqCybk97a7Z2iF9VzJzMqF
         M3flSRKeXZR1QxN3PoTpFtPNnCB7wTfmnC0f9dJ9UJpy9xTtrDjhdMFrHvWFM5e3IkIg
         SVL8aEF0nPvAWzIDNrkpvTLBRWbLKddtEnjtgJQ8sbc52OBO4PGvrVKMbg4VpUdM8s3o
         EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704155; x=1756308955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OaAdYLUCjKX665SPiNgujbPAFCtj51/JdtAuXgcYhE=;
        b=g59eMh76uAuy8OCKQF3usqcWXqQqOzrXAcjEQqxk3Fc81K9RsnBHijs3qYBUDmslH1
         jvWxs2PDNSjgbyHQtNOuDIFs2uku4KociBFSeeYGwnp5lD0jmQXmbUDFRR29RzR6fjfq
         5zITLUe24rSfbUBjNzmHdD/t2eE6h/mt4BImRbrBiMy4XCUSZA/Kj24lbcLrO3EwZ7KV
         0w7yk+/ayu9I6IRVRTWXMg0am06pLV01FRn2Pn2N6Uve5g7DeDDzuJLwzGbUPmElWApi
         +pu8Fy75/efcFj487oGyfaQnOylpiAwJRCGjkWgLe9DdUC83olRxYp4YkYECKF2tjUEU
         VWyw==
X-Forwarded-Encrypted: i=1; AJvYcCVE2uwYpuO+7nTMreWa+odjKM8R/bv3I1uTOcxhGfyCWUt8yanzlvnc5BNkFgC2qdau9M0jhwYACobQVrCFDrDy@lists.infradead.org
X-Gm-Message-State: AOJu0YxXL6Lr+8xDSoz6oSHNed75yti7vZ3TJ4orUCpZRgu3JoLzIlYl
	KwMYZVmLMD+aFGnGkx9/9cYMQxcPazrHFx/pj5GmDbTf+TqM97xxQmPka5KvgCK88PYUKNEoFDQ
	jYxWMLi2RyoJ1FQiP0Tjjy+QvqjGuLd6ojqeEz1KDulx3b1NpxDGb
X-Gm-Gg: ASbGncuQKqZMqwz/LELZoiQpesIBjo8XaAzBY1BDtfyGlMQ8Ym2AkeNQ/azcafPsqy5
	icSOYbG/ga8V1Y5wqe8k1FZJMaXQznDqLJMOquEhJT918nB8/iQYlN9Bl+tfHt4egvddf0iWCng
	pldHpJSfGGF1+S27pMsG499zJUkmEKrZr4parQ8BCBZgQhitDwU4g4n/dYeagVqQ1IOLDnDsRmn
	V2moLrC9v2LR3+K
X-Google-Smtp-Source: AGHT+IGsLYoqB6a7x6p7HrOdV6EBm8xUlwEUiEmKFBa4rxPR++1b6vCL2PyVSC7EE2YziIh3mVMucKSbHqyFIo48mlI=
X-Received: by 2002:a05:6902:610a:b0:e90:58b3:6442 with SMTP id
 3f1490d57ef6-e94f64c9f98mr3257051276.3.1755704154686; Wed, 20 Aug 2025
 08:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-arm64-dma-direction-fix-v1-1-818a4ca8f879@raspberrypi.com>
 <aKXMx5RZCy6cuc33@arm.com> <9bb085e7-9833-480b-8804-e9a0d2167f25@arm.com>
 <CAEgJzYOj3dQgS-g4ffG4eGJUQdvtSmAt_ECkMogHfvgsp+aWMw@mail.gmail.com> <aKXmzryGjmYMG7kB@arm.com>
In-Reply-To: <aKXmzryGjmYMG7kB@arm.com>
From: John Cox <john.cox@raspberrypi.com>
Date: Wed, 20 Aug 2025 16:35:42 +0100
X-Gm-Features: Ac12FXzJSXS64irVa3hLsu_OEObHprErnbNqCNfUMh-o8yTpwTTsrKgm-f2jwIE
Message-ID: <CAEgJzYOps1io_-XSjS4nDa5G8Fx4_=yW3O5GyzonZCJTxv_f5g@mail.gmail.com>
Subject: Re: [PATCH] arm64/dma-mapping: Fix arch_sync_dma_for_device to
 respect dir parameter
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_083555_971175_1252FD87 
X-CRM114-Status: GOOD (  50.45  )
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

On Wed, 20 Aug 2025 at 16:16, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Wed, Aug 20, 2025 at 03:43:16PM +0100, John Cox wrote:
> > On Wed, 20 Aug 2025 at 15:08, Robin Murphy <robin.murphy@arm.com> wrote:
> > >
> > > On 20/08/2025 2:25 pm, Catalin Marinas wrote:
> > > > On Wed, Aug 20, 2025 at 11:28:06AM +0100, John Cox via B4 Relay wrote:
> > > >> This patch makes the arch_sync_dma_for_device function on arm64
> > > >> do different things depending on the value of the dir parameter. In
> > > >> particular it does a cache invalidate operation if the dir flag is
> > > >> set to DMA_FROM_DEVICE. The current code does a writeback without
> > > >> invalidate under all circumstances. Nearly all other architectures do
> > > >> an invalidate if the direction is FROM_DEVICE which seems like the
> > > >> correct thing to do to me.
> > > >
> > > > So does arm64 but in the arch_sync_dma_for_cpu(). That's the correct
> > > > place to do it, otherwise after arch_sync_dma_for_device() you may have
> > > > speculative loads by the CPU populating the caches with stale data
> > > > before the device finished writing.
> > >
> > > Exactly, not only is it unnecessary, it's not even guaranteed to have
> > > any lasting effect. arch_sync_dma_for_device() has two jobs to do: 1)
> > > ensure that any new data going in the DMA_TO_DEVICE direction is visible
> > > to the device; a clean is sufficient for that. 2) ensure that no dirty
> > > cachelines may be written back over new DMA_FROM_DEVICE data; a clean is
> > > sufficient for that also. Adding an invalidate at this point serves no
> > > purpose since the CPU is still free to immediately speculatively fetch
> > > the same cleaned data back into the cache.
> >
> > An invalidate at this point for DMA_FROM_DEVICE does satisfy (2) at least as
> > well as clean and has the side benefit that any used cache lines are
> > now free for use by the CPU. (1) is unaffected by this patch.
> >
> > I believe that my patch is no less functional than the current code..
>
> It's no less functional but it does not address the problem, it simply
> makes it less likely. Both Robin and I explained the speculative loads
> potentially leading to inconsistent data if the for_cpu API is not
> called.
>
> So I'd rather have the current behaviour and we can spot problems early
> than hiding it and making it harder to debug.
>
> > > > An attempt to a udmabuf fix (untested):
> > > >
> > > > diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> > > > index 40399c26e6be..9ab4a6c01143 100644
> > > > --- a/drivers/dma-buf/udmabuf.c
> > > > +++ b/drivers/dma-buf/udmabuf.c
> > > > @@ -256,10 +256,11 @@ static int begin_cpu_udmabuf(struct dma_buf *buf,
> > > >                       ret = PTR_ERR(ubuf->sg);
> > > >                       ubuf->sg = NULL;
> > > >               }
> > > > -     } else {
> > > > -             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> > > >       }
> > > >
> > > > +     if (ubuf->sg)
> > > > +             dma_sync_sgtable_for_cpu(dev, ubuf->sg, direction);
> > > > +
> > > >       return ret;
> > > >   }
> >
> > Indeed, though that does have the annoyance that you run two sets
> > of cache ops over the entire buffer rather than one and for a decent
> > size of buffer (e.g. video frame) that is not free given that you have
> > to loop over every cache line.
>
> The udmabuf code is slightly dodgy anyway. I expect the DMA buffer to
> have been mapped already and a sync to_device issued long before
> begin_cpu_udmabuf() is called without needing an additional dma_map here
> just to populate the sg list. Otherwise it's quite late to do the sync
> for_device just before the CPU is about to start reading. I'm not
> familiar with this code but at this point we really should only have the
> for_cpu loop.
>
> Maybe the problem is elsewhere, I just spotted a corner case where the
> sync for_cpu is not called.
>
> > I take your points, but this patch should be no less functional and no slower
> > than the current code and does work around existing cases where other
> > drivers haven't got it right.
>
> It does not work around them, it just makes them rarer. Other
> architectures may get away with doing such maintenance in the for_device
> sync only if they don't have aggressive speculative loads into the
> cache. That's not the case for arm64.

Fair enough. I do understand your speculative load point and I do
understand that my patch just makes stuff rarer. I believe that
making such issues rarer is worthwhile when they are already
rare enough that they will often be simply dismissed as general
instability rather than leading to better debugging.

Having said that, I accept your point of view. Thank you for your
time.

John Cox

> --
> Catalin

