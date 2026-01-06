Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7239CEFCEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIXoBgSYkP/sd1BWOcNCLESjfDQLcEW6GaW2Kbu8M0A=; b=0gCnIeNjoQhvTq
	Z/OgUIEJyQpRlL1VkmDZQ2UewIj+F3CDUs/divrGbLnyIUVL3LkLkpjzXzULih9f6QmHe8Dv9QSYg
	pK6hIVKmP2EFdeYZ3GIaW+luFPYsTYENLRWTJkUwMZ/lqgHgEOsW1EREsZFKP45EGlS8Qa2ERiQqs
	FF5ilr1XXRsWm5f548OSGn9bA2XZXc7rmKmfBWOXQxD4y1Bv/jynfHSIxbHKOSRDbAJvsWJxf9gFt
	Iw3C+3AWvXNbJOBsXvK6AdG0qJRqKE/WOV+YGRV6fC23ZPg50qZp9BIvCLbQmzazCLlQ5xO7heYNW
	SR7EF1hTIDhp3QcuMXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0Y-0000000DhHS-2feQ;
	Tue, 06 Jan 2026 18:42:18 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC0S-0000000DhAe-09yR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:42:13 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5dd88eef2f3so446833137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 10:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724930; x=1768329730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIXoBgSYkP/sd1BWOcNCLESjfDQLcEW6GaW2Kbu8M0A=;
        b=U4TqZ3cSF3Qk6URQWD/knQg5E80BeZMaugDiQr++LZuQkC1ILqIof0o7HDcx7I5NRc
         4T8Ru41XdkyUloXhqyX7ohhAsxdZpwZAzm8BwEVap2QVamNd7cxelRsLwE0/irFLxMMI
         4fE3YueFalsfRzQiMauDrSjGicKbYDXToZ8QPPTwj7kj3YzgasQ7q+AMBAwIjm95ls2K
         mdKUl5wllv/0YG23trErFsBGOuz+2CPDN+tqQ7s4uXk60enXdmiMrBI72wqJWMo2LGQi
         KzvN/H7pWJEGsVU9EEU397kp6+Rx3s95Z8o1FHHk2mrqAtdt4I6slrMpz/35UmyX73Md
         Y6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724930; x=1768329730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CIXoBgSYkP/sd1BWOcNCLESjfDQLcEW6GaW2Kbu8M0A=;
        b=dnsjJcri9hSBduAA8Bh+EXphI+Pb7YIkMKz0xtloOV1dh0vfxMEOsx/PYPE3eBkLve
         9nsYgV5W4uoLaFS4+3I3AjB88xfpIXhanF2EfSLsCSkjQBXyOMxr3zbyhCy4pF5y/AYn
         R54CPcl7lN0uudlj04jWBkVt38DcZuqMe2R59AET9VeD99B+aX2z5+FezG555RHe17Ww
         eESdzAAKnHdKjmflLqlz4CyIE5JuA7rxbvc40KBKASPNP66OXAlcrx8iTstmiVR7Od+1
         K/mni564Iqa1pE8wPIpxOqtDosByqJYuFxzK9c1EjWqz7UvGRPDcRrTsKt612uq04+Qe
         F0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCX7omdkcrOlLN4txqLj+udaR+fVBzj4Z9VV6PZr2qaxS+vOplJUHgYc1I2c2mG1uqRIX+iBIAdUAWrB1iWcZs+S@lists.infradead.org
X-Gm-Message-State: AOJu0YweP2b4bGigMtVGeF8VScapaM2ZTVsmERonrOVLuIXp0lDe69vh
	NzKgUeNSlmu9tt82sq0PBiQhmc7lCNolTgBYcO4xc+uZIjDdjieZr/t4z0GCYp1fVDngtddIHOz
	n6jBsM3cqRhAa5gSbMTq0gU5/3TJrBkA=
X-Gm-Gg: AY/fxX6TzGRgZWZguBVwL/IIr+wybqb/aALeT6t50DFlKUSpeLg+wjERWC271ILUfmR
	tz3fOeDcmV24gGQg6nAC0T55LyNsRJ2IUMUzsRIyawM1aZE0JXROqeR1c2R22n+gdgjhkVJX+jY
	zU440CrKjunQluF4vq5wPsT9qjH7UrfYQHBg6xg4lHh8m9NEzQKJBGV8x4E+Pq6icFdFvY13gTn
	MjzMMnMuJZ5/tVvmQg2293EbdVVuUg/LMEe6qr5u6M0gM4z2mKQbWakTjvMZjzQyI12tQ==
X-Google-Smtp-Source: AGHT+IGzdDZdJH61h073/MhkLoyFPUTEGFa4biMd35SsepoUxfnatinjaLQUW4RiSiTNL7sRRTPCzkdKJMTlCl0LUrk=
X-Received: by 2002:a05:6102:560f:b0:5df:aff3:c41c with SMTP id
 ada2fe7eead31-5ec744a174bmr1358450137.30.1767724928829; Tue, 06 Jan 2026
 10:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal> <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal>
In-Reply-To: <20251228145041.GS11869@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 07:41:57 +1300
X-Gm-Features: AQt7F2qVpIXArh0HsV3sq1RKrv0OCVapLrZHo6-0eziWiogqpS6BzLG8_AyfAb8
Message-ID: <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104212_111574_5DEA779C 
X-CRM114-Status: GOOD (  27.08  )
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

On Mon, Dec 29, 2025 at 3:50=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> > On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> > > > From: Barry Song <baohua@kernel.org>
> > > >
> > > > Instead of performing a flush per SG entry, issue all cache
> > > > operations first and then flush once. This ultimately benefits
> > > > __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> > > >
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: Will Deacon <will@kernel.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> > > > Cc: Ard Biesheuvel <ardb@kernel.org>
> > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> > > > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > > > Cc: Suren Baghdasaryan <surenb@google.com>
> > > > Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> > > > Signed-off-by: Barry Song <baohua@kernel.org>
> > > > ---
> > > >  kernel/dma/direct.c | 14 +++++++-------
> > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > <...>
> > >
> > > > -             if (!dev_is_dma_coherent(dev)) {
> > > > +             if (!dev_is_dma_coherent(dev))
> > > >                       arch_sync_dma_for_device(paddr, sg->length,
> > > >                                       dir);
> > > > -                     arch_sync_dma_flush();
> > > > -             }
> > > >       }
> > > > +     if (!dev_is_dma_coherent(dev))
> > > > +             arch_sync_dma_flush();
> > >
> > > This patch should be squashed into the previous one. You introduced
> > > arch_sync_dma_flush() there, and now you are placing it elsewhere.
> >
> > Hi Leon,
> >
> > The previous patch replaces all arch_sync_dma_for_* calls with
> > arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> > functional change. The subsequent patches then implement the
> > actual batching. I feel this is a better approach for reviewing
> > each change independently. Otherwise, the previous patch would
> > be too large.
>
> Don't worry about it. Your patches are small enough.

My hardware does not require a bounce buffer, but I am concerned that
this patch may be incorrect for systems that do require one.

Now it is:

void dma_direct_sync_sg_for_cpu(struct device *dev,
                struct scatterlist *sgl, int nents, enum dma_data_direction=
 dir)
{
        struct scatterlist *sg;
        int i;

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                if (!dev_is_dma_coherent(dev))
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

                if (dir =3D=3D DMA_FROM_DEVICE)
                        arch_dma_mark_clean(paddr, sg->length);
        }

        if (!dev_is_dma_coherent(dev)) {
                arch_sync_dma_flush();
                arch_sync_dma_for_cpu_all();
        }
}

Should we call swiotlb_sync_single_for_cpu() and
arch_dma_mark_clean() after the flush to ensure the CPU sees the
latest data and that the memcpy is correct? I mean:

void dma_direct_sync_sg_for_cpu(struct device *dev,
                struct scatterlist *sgl, int nents, enum dma_data_direction=
 dir)
{
        struct scatterlist *sg;
        int i;

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                if (!dev_is_dma_coherent(dev))
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);
        }

        if (!dev_is_dma_coherent(dev)) {
                arch_sync_dma_flush();
                arch_sync_dma_for_cpu_all();
        }

        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

                if (dir =3D=3D DMA_FROM_DEVICE)
                        arch_dma_mark_clean(paddr, sg->length);
        }
}

Could this be the same issue for dma_direct_unmap_sg()?

Another option is to not support batched synchronization for the bounce
buffer case, since it is rare. In that case, it could be:

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 550a1a13148d..a4840f7e8722 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -423,8 +423,11 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
        for_each_sg(sgl, sg, nents, i) {
                phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(sg));

-               if (!dev_is_dma_coherent(dev))
+               if (!dev_is_dma_coherent(dev)) {
                        arch_sync_dma_for_cpu(paddr, sg->length, dir);
+                       if (unlikely(dev->dma_io_tlb_mem))
+                               arch_sync_dma_flush();
+               }

                swiotlb_sync_single_for_cpu(dev, paddr, sg->length, dir);

What=E2=80=99s your view on this, Leon?

Thanks
Barry

