Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5B0E7AD44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma4TUbuDVbjYOdFrkGJYla9jNc+5PWT/yJiIA5v8X/s=; b=pX9r1Aq1mrF4e4
	P4aPuFkIWdFubYxRJgogzUlx8eEp8Hfk+KJgca1tp6o11pQSVGhuHN8Om3aT+TaMBhPj18WIg65i6
	JnY6lhE9Zjlk8ycnSrZDVOq/3ylxG1HOjzszB4aUETAQIpRx/kYFE+9edn1lZdmydVSetVh83GpW5
	IpPRSHgT1li5SjvIcVWYFI7gJLGN2vZK6JMLnD/YqSslM0N9nik58xYZlYHHkgPvSV8V1RhhbBaCj
	D+kdjEwWnQ4Iq97NYzcMp7Dy356yoo4SkC/Xc5xul3gs+bW/lIiQbDrcCpVYVlfui/0QDR2Sx5WDw
	RvbX7Z50beBXG0lp3Iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYlRd-00000000Rl3-3Ydy;
	Thu, 25 Dec 2025 13:31:57 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYlRb-00000000Rk2-1OoM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 13:31:57 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-88a26ce6619so71853036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 05:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766669514; x=1767274314; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma4TUbuDVbjYOdFrkGJYla9jNc+5PWT/yJiIA5v8X/s=;
        b=j+gnJUcIWZKVm/qCTfsHJblQEn2Cmde6tbog+NZEQ1gOxOpC58v+TOYqX7+/p47QwV
         8CTgtbXcEOvrrdWEkyLgssEC1ObZd5msD0Y/JwYx831eZAsUumWD54Sjl+3ikHFcJG5O
         nU6OPcGybShkZx+3rkStsYnJH/a20iJ3+AuXJiiE7iijTVRKj9hX17FYcNKTxfoDJ3fJ
         +16g6EwRJ8rWqmjONtJOE9HnTe7hMny5SVZDEFiarI1ghRjmjxFZtMprRgKub2SfxQDE
         NAIx2qTNQugHlXdBT7lnYHNxRk+dWDgStufYL/QsrgyOlnE9MQMVpdAzxxPxGw3S9Bik
         JJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766669514; x=1767274314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ma4TUbuDVbjYOdFrkGJYla9jNc+5PWT/yJiIA5v8X/s=;
        b=tp9eXrZYrZ2yWc5rFxHgUIT2i2eKmTaYA+o3W3/v7aKiY3xRb9pV9Zbuv6r25IzwJJ
         DA7KG9A+mhqImU33yasbBX4l2a/Qx99QuHbdVB1egJugeZE2pwE3Swr2M3EqtWGUYIeq
         Kxbuervab2COlZ1Y/8Ojav/u9t6NuF5LM8pKg79FdnxCdWKGuRATac24cI2svyem17HG
         7tJjn1xD3+Zmv36mp/tDMNUlR+wGhiPAP20JQhhZJWWunzwmdFdcRpK8iT1JDR99pb2W
         3jgeMokwXIDlYVwPIMGVa0uNfCFbQZvU0oRDlWemcVC1qAu4qa8f0s7RfAXvcbHTtdha
         sQKA==
X-Forwarded-Encrypted: i=1; AJvYcCV4IbAvb2n4Gqrj3jdoWTjBPVvkdNkoUUNwoEEyRagFIqkBqFJuKe5aHv4Lqt89/GyHNELPlUDtrKToe9G9Vg6T@lists.infradead.org
X-Gm-Message-State: AOJu0YzreBLuzrCZidd7u+rRcghYYhtHj5QJv+knxfqYyF4MsULg/zBA
	gCF13fKgBBagTh0NaalbiPg2x/HxrAi13LTGaalJpTM+fKNQAkWEjVH4kntn3ELmcOYf9drVZ3G
	b29U216tFY0V3RjHnj7z0QSoxBQ9kIu8=
X-Gm-Gg: AY/fxX7kMmnl1zcx6l8LK+pz2QYjzZdf9rxvYhDQQKgkyGJtxJaJqigfctO3s4mZMWG
	O6/2lkUfSlsyxbvQpcTMfLONI+Rqrnfw3sgP4YlWcMA1eAFw7o4Iy+5R993grzDCG39N+4ZdhrD
	0lUXc638Cnrr0vq/i5qb7mhgRS7iDkeihvn4TfB2+5jKzdWQxYPWXFVCrwq9UCCSirnj3Ok5vJN
	xElQ7gHne2yd/cfpeqn1F6dAVTkxIVrHoWHbFvGNBP3Od6SyyQx0r1ZUbcIt75jc03nOQ==
X-Google-Smtp-Source: AGHT+IFXqVfQGdKCFtie54AHWuyFuSYXtx9jQJRfVs1svScjN64NEzVwJFTqHKBOW4bSKBKLL8LD99WEEiFY991yy+w=
X-Received: by 2002:a05:6214:3f92:b0:88f:e333:4a9c with SMTP id
 6a1803df08f44-88fe3334c18mr92100216d6.51.1766669513817; Thu, 25 Dec 2025
 05:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20251224085145.GF11869@unreal> <20251225054509.39917-1-21cnbao@gmail.com>
 <20251225123650.GJ11869@unreal>
In-Reply-To: <20251225123650.GJ11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 26 Dec 2025 02:31:42 +1300
X-Gm-Features: AQt7F2poVyCilMC4Mh0wp6dzeQVZK_rbefSQzETylBy7BEICZTKnZkktLmE29Wc
Message-ID: <CAGsJ_4zpWWLaynh1U4MKCS-N8tZ0tvE6tAmb0m+Pbf-kPsYQJg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_053155_500380_05374152 
X-CRM114-Status: GOOD (  22.13  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 26, 2025 at 1:36=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Thu, Dec 25, 2025 at 06:45:09PM +1300, Barry Song wrote:
> > > > >
> > > >
> > > > OK. Could you take a look at [1] and see if any further
> > > > improvements are needed before I send v2?
> > >
> > > Everything looks ok, except these renames:
> > > -                       arch_sync_dma_for_cpu(paddr, sg->length, dir)=
;
> > > +                       arch_sync_dma_for_cpu_batch_add(paddr, sg->le=
ngth, dir);
> >
> > Thanks!
> > I'm happy to drop the rename as outlined below-feedback welcome :-)
> >
> > diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/ca=
che.h
> > index dd2c8586a725..487fb7c355ed 100644
> > --- a/arch/arm64/include/asm/cache.h
> > +++ b/arch/arm64/include/asm/cache.h
> > @@ -87,6 +87,12 @@ int cache_line_size(void);
> >
> >  #define dma_get_cache_alignment      cache_line_size
> >
> > +static inline void arch_sync_dma_flush(void)
> > +{
> > +     dsb(sy);
> > +}
> > +#define arch_sync_dma_flush arch_sync_dma_flush
> > +
> >  /* Compress a u64 MPIDR value into 32 bits. */
> >  static inline u64 arch_compact_of_hwid(u64 id)
> >  {
> > diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> > index b2b5792b2caa..ae1ae0280eef 100644
> > --- a/arch/arm64/mm/dma-mapping.c
> > +++ b/arch/arm64/mm/dma-mapping.c
> > @@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size=
_t size,
> >  {
> >       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> >
> > -     dcache_clean_poc(start, start + size);
> > +     dcache_clean_poc_nosync(start, start + size);
> >  }
> >
> >  void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> > @@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t =
size,
> >       if (dir =3D=3D DMA_TO_DEVICE)
> >               return;
> >
> > -     dcache_inval_poc(start, start + size);
> > +     dcache_inval_poc_nosync(start, start + size);
> >  }
> >
> >  void arch_dma_prep_coherent(struct page *page, size_t size)
> > diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> > index 4809204c674c..e7dd8a63b40e 100644
> > --- a/include/linux/dma-map-ops.h
> > +++ b/include/linux/dma-map-ops.h
> > @@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr=
_t paddr, size_t size,
> >  }
> >  #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
> >
> > +#ifndef arch_sync_dma_flush
>
> You likely need to wrap this in "#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FLUSH"
> as done in the surrounding code.

I've dropped the new Kconfig option and now rely on whether
arch_sync_dma_flush() is provided by the architecture. If an arch
does not define arch_sync_dma_flush() in its asm/cache.h, a no-op
implementation is used instead.

Do you still prefer keeping a config option to match the surrounding
code style? Note that on arm64, arch_sync_dma_flush() is already a
static inline rather than an extern, so it is not strictly aligned
with the others.
Having both CONFIG_ARCH_HAS_SYNC_DMA_FLUSH and
"#ifndef arch_sync_dma_flush" seems duplicated.

Another potential optimization would be to drop these options
entirely and handle this via ifndefs, letting each architecture
define the macros in asm/cache.h instead.

Whether arch implements arch_sync_dma_for_xx() as static inline or
as external functions makes no difference.

- #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
- void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,-
                enum dma_data_direction dir);
- #else
+ #ifndef arch_sync_dma_for_cpu
static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
                enum dma_data_direction dir)
{
}
#endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */

>
> Thanks
>
> > +static inline void arch_sync_dma_flush(void)
> > +{
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
> >  void arch_sync_dma_for_cpu_all(void);
> >  #else
> >

Thanks
Barry

