Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A4D185F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUwpAxZ0PDYNZc3h1MMX+qPvPoKglabLUwPyaMJykIM=; b=GNDcdICNgo8AK97NYsezYkiTLb
	Hspu4DDPiUp1I1U8vEiSqudGY6RsDFmLhHysgwvgKDYhNpKcqkcN5LPEgWDsW116V5GMhWeADB0x5
	3UcZJT2LVnHDEQW6PJPQhKKNh9kCUWcxUTA8rQacrHvgzAOiZpwSi8UawRwUD7uawLWj4SJit+LTP
	TPIOSmRvDvxtex3+ZtIyEeivs4VNPbFP7jQNTNypBg494/16eKwR3YGAbMAtMidR7X0ACQgdO+S24
	8RAiYHhqgu9jWO5HifdgOVFV9O1NgNIbN1f0FZjEivmhxKcLUfmwXa6woOvA/sxyZv7LJS2lR3mMx
	cm0a7Usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpxu-0000000H916-22Bf;
	Thu, 08 Jan 2026 13:22:14 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpxr-0000000H904-2Bty
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:22:12 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ee147baf7bso954401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 05:22:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767878529; cv=none;
        d=google.com; s=arc-20240605;
        b=ar6aKaueG0eWN66PHLsCFwNTSqE6jp7wj0wEZWDbrlaXU3Lni/CUfLshG8FDBzAD5E
         kqrzs1CJuwHsEUwWX5G1KitGUOZ0u/J8ErrPsZNIiFD12Mq3p1kKE8nxw2q0X/eK+pFJ
         P+Us0O3osbLhWNGsYa337qLPZvUMbi2OJVLlRnrkSG6nxA/T1lFf5j7FMFhglS8ppzdZ
         TpBXxSs4BCNx2vrHtj7y5Skb+tOrIyENGwo4/QnnoliOffHqJ4/bdqlN7XocdgacNgWX
         12GlbyjoANBrTZmugipf8u3+RN1w4iYpxGm3K7AWzQPMZe5nOjDR+gXQjT6N2Dru9FDq
         gh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UUwpAxZ0PDYNZc3h1MMX+qPvPoKglabLUwPyaMJykIM=;
        fh=F97qMb2D4zXLejl0iDHqdoDeavqlR326/vRKso95G7k=;
        b=CqiWmR6Gj3G9mSKosz0OLLWSSjbShF7Hfefct0SSCKU0c0GtdLIRjL3mzO1DxIEh2R
         UwcqlGxANQ56737xcXMeMltT8jwLYThksFsIzcHUNibwNNDKxuWAskOKPwH+k5sE+jMv
         wkQm3KUtLASmD9dmOQRoHQR/R8G9YGa1GDEFyMa0x9M4CIHqOUC891NDpQLoykUFDUFw
         A2p4YW8qdbxBJDL9GeLgW8I00Hh0jHZ+dfWP4YWyWJh0SuRffXjh2EPfOVgRHGH8NC4n
         GPMpE7ZptF4uddMEm3YaNsetUJCit6Rnq5yWOQHx/C60BaTgT1BbciYLYKhAKthC9a21
         rkKQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767878529; x=1768483329; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUwpAxZ0PDYNZc3h1MMX+qPvPoKglabLUwPyaMJykIM=;
        b=zsqOaY+6PBVM4pX+eHI6kYXfTxMaQKBdYRxLdaKuKhZMxrHkPQow+3dagbLaXFDtSt
         vZx30mcMpQmVUmlL5QcuvoYYChBqBTtj7oOohaHUY0so5rzoGV4my2dQMkVVVBNukOcY
         IByQqpeKMFz7TI2Ps1cfMpDJCTeASO1sI+sw1oCUK9f+Gq9RJu5KIjmBgQ3YPpHTZt6l
         4gaETPM701YD5bJP/WhoA84duZITF7SW41Rih0lGxcuahWnmTy/S2pGTrUOElDwevS+G
         OfjFPUXkl3+07+AdWMV1Auw16xDRCD3fM/vCmULYIuQHAYjJx8CQCyMNw/ixE6ekTiOT
         K1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878529; x=1768483329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UUwpAxZ0PDYNZc3h1MMX+qPvPoKglabLUwPyaMJykIM=;
        b=MySvNjBGauVuqF07F1VHQ0AqMNPEIWbFSm0SP0OA+woTbNPivR8a7ZHldzGy5fhUJF
         +Rsi+fdtVl36arHgWqwAfE9ycpA1RTrMR8kv1SvCQWUc3cIyXpVeW6lwM0SdtAz0GbRv
         ZZYh0OZVAzOsUO5qPaG+PFdmJMCTEX9OjdwNqhDInNzZHhEi/p8oljPa2MvjLutaRaBW
         V84stYtfCntKKq5TehvRjCHSEgIhSDKqoYkzjKAnsr/X1cBMnS2q3e5OcMc01QmVtlDc
         u2tQGvT81hMJIfz53x6ChYeqOVVz2RXQ9yb4VL/eQcZUOypRAJF+5VksLf75V/b388pJ
         rBvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLP8A95RaB4Q2xG9OI+snqTHt6e+4ISIN5h1QePBq43WMSrFqLVCXm7P9H3VxpdAznK3Xj+/O6drSX3nPyV+j3@lists.infradead.org
X-Gm-Message-State: AOJu0YxYKXiL7zhTyPXvI4XSl9T+rrt+hDY5paBqEp2+9jMs6sanxLCV
	Ah29SZijs9YNp9VPNxJTs/oUyL0/F/Ddp5K03gqLEsVuFNvPl9cD4piSvTqfNniQ84ci5GZerKF
	P5XCc3xbGmYeFrxYJRi7Fbc2Mlz5mV/GlueyaX1iN
X-Gm-Gg: AY/fxX72OXDqrsqO4Qfgz1MRaWW7/XF2rzxal3QnooRMUWelSQ9MRBLGOZcQHcwSJwf
	+uUfGikEoWZ/MY+1xoT/v5bUwNcylNYVwuJ7q86aGOT88yCRXsBQ0kLzO69Ym9sttMM55s65RXz
	WTfjKkH1nkYU1rak+Givtxiz5Fyf46p1PKOTfSrYITmMbx5qqrzEIKLt1EURTxgj/5KdX/ntAyZ
	XVw4asRWKSnHwE8AIp3dpUkHdg9rmcXmWpGQzcLuiZFxCPADRMfJ8UDIKsdwVYnfz8dDhEPw4qa
	l7DtTtNH+NXCVmamgcExA/Quc8v+7g==
X-Received: by 2002:a05:622a:290:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-4ffc094e8e8mr8148651cf.9.1767878528486; Thu, 08 Jan 2026
 05:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20260108113846.56179-1-smostafa@google.com> <56c39e62-0417-495d-a40e-99180a107777@arm.com>
In-Reply-To: <56c39e62-0417-495d-a40e-99180a107777@arm.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Thu, 8 Jan 2026 13:21:56 +0000
X-Gm-Features: AQt7F2oJd-G6BRgQsOUJ1Fsn5-oRiR5Pkxii3P307v5vqF9EVKhsthRl8tsstiI
Message-ID: <CAFgf54r_xyyu46ADB5rLj5jZ+doCVjyVaJaQZf5bnYfKZBkF7g@mail.gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, joro@8bytes.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_052211_586450_88AB3A41 
X-CRM114-Status: GOOD (  51.66  )
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

On Thu, Jan 8, 2026 at 12:52=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2026-01-08 11:38 am, Mostafa Saleh wrote:
> > As part of the KVM SMMUv3 series[1], we are trying to factor out
> > the kernel specific code from io-pgtable-arm so it can also compile
> > for the hypervisor.
> >
> > Jason pointed out that the DMA-API calls are not really needed [2].
> >
> > Looking more into this. Initially, the io-pgtable API let drivers
> > do the CMOs using tlb::flush_pgtable() where drivers were using the
> > DMA API (map/unmap_single) only to do CMOs as the low-level cache
> > functions won=E2=80=99t be available for modules.
> >
> > This was later moved to the core code [3], with possibility to
> > convert it to full blown DMA-API code if there was a use case.
>
> I don't understand that sentence at all.
>
> > However, no such use case appeared, and we can simplify the code
> > slightly by doing CMO directly instead of going through the DMA-API
> > functions just for CMOs.
> >
> > Although HTTU is not used at the moment, leave the
> > arch_sync_dma_for_cpu() in __arm_lpae_free_pages() as this is not a
> > hot path.
> >
> > Removing the DMA-API will also remove some extra checks ensuring that
> > the IOMMU can deal with physical addrs. we can add those check at
> > page table creation time (Something as use_dma_iommu/is_swiotlb_active
> > However, that seemed a little too much as Linux doesn't support such
> > topologies anyways.
>
> NAK - io-pgtable is regular driver code doing what is absolutely a DMA
> mapping operation. How would Panfrost calling arch_sync_* signal to hyp
> that the page is now being used for DMA so needs mapping/pinning at
> stage 2? We can't even say that that doesn't apply to "real" IOMMU
> drivers, since there do unfortunately exist cases where an entire "stage
> 1" SMMUv3 is upstream of a "stage 2" SMMUv3 such that it's only workable
> if the former is assigned to EL1 as just another black-box device, while
> only EL2 knows about the latter.
>

This is not about Stage-1/Stage-2 assignment or pinning, my simplistic
understanding is that we don=E2=80=99t deal with cascading IOMMUs, so the D=
MA
API here must go through DMA direct which boils down to CMOs.

My intention was to call CMOs directly instead of calling the DMA API
to make the code slightly portable (And EL2 can provide its
arch_sync_*)

> If "pagetable creation time" means alloc_io_pgtable_ops() as I've taken
> it to, how do you specifically propose to check that pages which haven't
> been allocated yet will definitely be valid for DMA in future? Also note
> that the only reason for the virt_to_phys() check (which *has* often
> caught genuine driver/platform configuration issues to a degree that I
> would be very uncomfortable removing it) is basically laziness, in that
> nobody's got round to doing the work to be able to keep track of kernel
> addresses separately from the DMA addresses in the tables themselves,
> and thus allow visibly-remapped pagetables - every now and then there
> arises a situation where that would be really useful, so it is still on
> my wishlist.
>

I see, thanks for the explanation. I was imagining checking if SWIOTLB
is active. AFAIK, it will be set if the device has a smaller DMA mask
than the CPU.
Probably, that doesn't cover all the cases, but I thought that any
system with such constraints would also be unusable with the current
implementation. However, the virt_to_phys() check would at least make
debugging easier.

Anyway, I will drop this.

> Frankly if KVM is going to have increasingly divergent requirements and
> assumptions about pagetables, then it should have its own pagetable code
> like it does for the CPU.
>

So far, KVM has no special requirements for the pagetable, it only
needs to provide implementations of CMOs and memory allocation.
In the last version __arm_lpae_alloc_pages() implementation was fully
different between the hypervisor and the kernel, I was trying to
simplify that.

Thanks,
Mostafa

> Thanks,
> Robin.
>
> > [1] https://lore.kernel.org/linux-iommu/20251117184815.1027271-1-smosta=
fa@google.com/
> > [2] https://lore.kernel.org/linux-iommu/20251216005834.GC31492@ziepe.ca=
/
> > [3] https://lore.kernel.org/linux-iommu/7c5584d3efa61ee6b0b87efb72f24f3=
2852aafb7.1438195011.git.robin.murphy@arm.com/
> >
> > Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >   drivers/iommu/io-pgtable-arm.c | 39 +++++++--------------------------=
-
> >   1 file changed, 8 insertions(+), 31 deletions(-)
> >
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-=
arm.c
> > index e6626004b323..0da9195155ec 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -15,7 +15,7 @@
> >   #include <linux/sizes.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> > -#include <linux/dma-mapping.h>
> > +#include <linux/dma-map-ops.h>
> >
> >   #include <asm/barrier.h>
> >
> > @@ -254,7 +254,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gf=
p_t gfp,
> >   {
> >       struct device *dev =3D cfg->iommu_dev;
> >       size_t alloc_size;
> > -     dma_addr_t dma;
> >       void *pages;
> >
> >       /*
> > @@ -271,32 +270,10 @@ static void *__arm_lpae_alloc_pages(size_t size, =
gfp_t gfp,
> >       if (!pages)
> >               return NULL;
> >
> > -     if (!cfg->coherent_walk) {
> > -             dma =3D dma_map_single(dev, pages, size, DMA_TO_DEVICE);
> > -             if (dma_mapping_error(dev, dma))
> > -                     goto out_free;
> > -             /*
> > -              * We depend on the IOMMU being able to work with any phy=
sical
> > -              * address directly, so if the DMA layer suggests otherwi=
se by
> > -              * translating or truncating them, that bodes very badly.=
..
> > -              */
> > -             if (dma !=3D virt_to_phys(pages))
> > -                     goto out_unmap;
> > -     }
> > -
> > +     if (!cfg->coherent_walk)
> > +             arch_sync_dma_for_device(__arm_lpae_dma_addr(pages), size=
,
> > +                                      DMA_TO_DEVICE);
> >       return pages;
> > -
> > -out_unmap:
> > -     dev_err(dev, "Cannot accommodate DMA translation for IOMMU page t=
ables\n");
> > -     dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
> > -
> > -out_free:
> > -     if (cfg->free)
> > -             cfg->free(cookie, pages, size);
> > -     else
> > -             iommu_free_pages(pages);
> > -
> > -     return NULL;
> >   }
> >
> >   static void __arm_lpae_free_pages(void *pages, size_t size,
> > @@ -304,8 +281,8 @@ static void __arm_lpae_free_pages(void *pages, size=
_t size,
> >                                 void *cookie)
> >   {
> >       if (!cfg->coherent_walk)
> > -             dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(page=
s),
> > -                              size, DMA_TO_DEVICE);
> > +             arch_sync_dma_for_cpu(__arm_lpae_dma_addr(pages),
> > +                                   size, DMA_TO_DEVICE);
> >
> >       if (cfg->free)
> >               cfg->free(cookie, pages, size);
> > @@ -316,8 +293,8 @@ static void __arm_lpae_free_pages(void *pages, size=
_t size,
> >   static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries=
,
> >                               struct io_pgtable_cfg *cfg)
> >   {
> > -     dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(pt=
ep),
> > -                                sizeof(*ptep) * num_entries, DMA_TO_DE=
VICE);
> > +     arch_sync_dma_for_device(__arm_lpae_dma_addr(ptep),
> > +                              sizeof(*ptep) * num_entries, DMA_TO_DEVI=
CE);
> >   }
> >
> >   static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgta=
ble_cfg *cfg, int num_entries)
>

