Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E376ECEFD03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pntXy9Hj0WqvRGVZav4oj27VTA9+7WcxJK6ERgbcGK8=; b=x1YcUHQjYVGds5
	25h1g/cFzQjIEKspR2zeGHnBtFm+U818M/kKJXr31wB4+Os8cFgQNCctaqY6dCJmo2r1DtirmpM0W
	vKnZjcTfX60xJ8DHTCy63YMnQZDCG1WOT5JWWJWBRuK9SxGimIFyAd6Nl8eDube2zQ2GNkaqEoALk
	77ndGm31KLy8VGGNuuwsDn2D6pTliCzAJVgS6bX/YWUQr8tQizogPxcDqt61XPtCRSzd064VOJlT3
	MznSwH7eeYldbiDO6OMm3cZw0SCmtWVtLfm8nsY7Ig4EUY+Sat4xdN9AxoA0gmOaQ5Oyz0L8TJMaK
	QOti14Rpr7zmnui4mbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD20-0000000DmOy-1Vga;
	Tue, 06 Jan 2026 19:47:52 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD1x-0000000DmOT-1tp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:47:50 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8887f43b224so16144546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 11:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728868; x=1768333668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pntXy9Hj0WqvRGVZav4oj27VTA9+7WcxJK6ERgbcGK8=;
        b=Gp9kRpbUxs94mhoBqRLfDqoK4vWg0Qu0AGeM4nMI1ppCyi/YhxacHH0tSz7JYgisnD
         eN+VEPuYNrC2uJKtUexhssTIAfE9WLSKoLA9XxjhnsU460VL2QuBSSFOnPZevRhJaPJS
         7/sViRxU3v+DYEMMvfFvJi8Q6iOfRO8Vpxt5s3rhnoBkTcAHmfzqhG1B5p6aLn0pUKXg
         PVIgkLs4shb5mg+6L47WK7J+5tusa1xEYy4y8oDPVQMQBWnL1xpzw4955JH+/TwdMxpv
         vKrowg95PUmNXybSR5H2LqNqpeJqEB+qRs6I4fQ77UX4rO7zac5yb0MW+Ax9UTo/B/As
         I8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728868; x=1768333668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pntXy9Hj0WqvRGVZav4oj27VTA9+7WcxJK6ERgbcGK8=;
        b=WUMNp+O5b5z4iXoWNE5Tf1U/WxDbolrBYBfpsnHgnQi71Zut/VzGIe4UVs4ItNqfL/
         4rr3Le8eDfyfTcW1EX+vandfw7fEm1Z4sd2j0Ad+PoFWEPeRK/T9U7ZkEmfcfRAxxwve
         eLAC1KgiT582GqdZ0zOS0AYzI6Uha1xIJ0y5yTu5vnnvEsfc54sDE3sey4Ss9IK4nO1P
         9c3lEgbLA/hb+saaYfaaXFPbAiZjq3sfRZPzC/vJLiab7Cu5om6F1PzytxqsoBDJJMpk
         8kA2BiOej1xsKwnnaKjNUqWWXws1MHQ3YH7QIJXStcYvV1696B9P9CF/yhU1j6ODVT75
         Z1NA==
X-Forwarded-Encrypted: i=1; AJvYcCUYqnA3E4uHbYsAALzCUnSKvtpwUlwVVVQxQ0CVnB0mdB8nQjd9RmY6wAGMDUgmv6zQ0nCJ6yYZh+f4N63wPHsU@lists.infradead.org
X-Gm-Message-State: AOJu0YymblB7kEYuny6BeGshS/L04Zja/Balw2JT+TMUcCl6cH6qgNEB
	cyQSY+/P4IsSif9vfoFttaXMyUW6+v1ms+mFiqiafX1FT9dnt83CV0ykVPZiR0s8MAu3oXknw5w
	nmhasHxhVO0U3HPViPvWe71o1GZWkpbY=
X-Gm-Gg: AY/fxX6VFBEmSTgwqecPSxFFQ1CM2uYTcU6oQI8PiIwZLEOyRA7KgKdCL8YBZ6nGswV
	I4pvbaJ2Y7fP633++QRCB7MfRoN3lpSO4zPRxOkzlwutyJDh+/ufEsTa+tfRhH8TPXS6Ogy6jvl
	RpgqKqSwIn3YUVsHi9DqW10WAa7yZJ5ATFDJn2ArKhTh66nzs9grdF/b11Ilay9+5jqIZPKlP4G
	EKQP4UFq+kV8K5pSZtNgi7WuzQUDhM6U3p8imYG2bDHCAokcWmQEmbhCThzQF1hohPB1Q==
X-Google-Smtp-Source: AGHT+IEsDozTTuOpHzQH0xjAygijM9mAO6rgCGg7RgPz/1lUD4/ZMIEqkH9QqpKy9eDQlYCqtEtPfalOfqOAQTgTldI=
X-Received: by 2002:a05:6214:622:b0:890:5973:a567 with SMTP id
 6a1803df08f44-890841e56d5mr1480896d6.12.1767728867862; Tue, 06 Jan 2026
 11:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20251226225254.46197-1-21cnbao@gmail.com> <20251226225254.46197-6-21cnbao@gmail.com>
 <20251227200933.GO11869@unreal> <CAGsJ_4yA83-K7PXiEtyidzF_j6qqKkt92z485KBS9+zGe_rjnw@mail.gmail.com>
 <20251228145041.GS11869@unreal> <CAGsJ_4yex5MKQkGtFr2zUcg4h0PtsFs2QVcE_NSfiyOn4qBzhQ@mail.gmail.com>
 <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
In-Reply-To: <de876e61-42c5-414d-b439-2f9196c6c128@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 7 Jan 2026 08:47:36 +1300
X-Gm-Features: AQt7F2rGhHEzeZcOruGijVOJFT9sChymTkhWX1JfhRWGcohbyfQWWuu1bqdVJW0
Message-ID: <CAGsJ_4xYqseJMFXOU39JJW4Lk2ZHXAnRJLhZdVuFLxAi=Dy5sw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dma-mapping: Support batch mode for dma_direct_sync_sg_for_*
To: Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_114749_501953_9584C2B0 
X-CRM114-Status: GOOD (  30.44  )
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
Cc: Tangquan Zheng <zhengtangquan@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, iommu@lists.linux.dev, Marc Zyngier <maz@kernel.org>, xen-devel@lists.xenproject.org, will@kernel.org, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 7, 2026 at 8:12=E2=80=AFAM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 2026-01-06 6:41 pm, Barry Song wrote:
> > On Mon, Dec 29, 2025 at 3:50=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
> >>
> >> On Sun, Dec 28, 2025 at 09:52:05AM +1300, Barry Song wrote:
> >>> On Sun, Dec 28, 2025 at 9:09=E2=80=AFAM Leon Romanovsky <leon@kernel.=
org> wrote:
> >>>>
> >>>> On Sat, Dec 27, 2025 at 11:52:45AM +1300, Barry Song wrote:
> >>>>> From: Barry Song <baohua@kernel.org>
> >>>>>
> >>>>> Instead of performing a flush per SG entry, issue all cache
> >>>>> operations first and then flush once. This ultimately benefits
> >>>>> __dma_sync_sg_for_cpu() and __dma_sync_sg_for_device().
> >>>>>
> >>>>> Cc: Leon Romanovsky <leon@kernel.org>
> >>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >>>>> Cc: Will Deacon <will@kernel.org>
> >>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>> Cc: Robin Murphy <robin.murphy@arm.com>
> >>>>> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> >>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
> >>>>> Cc: Marc Zyngier <maz@kernel.org>
> >>>>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> >>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
> >>>>> Cc: Suren Baghdasaryan <surenb@google.com>
> >>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> >>>>> Signed-off-by: Barry Song <baohua@kernel.org>
> >>>>> ---
> >>>>>   kernel/dma/direct.c | 14 +++++++-------
> >>>>>   1 file changed, 7 insertions(+), 7 deletions(-)
> >>>>
> >>>> <...>
> >>>>
> >>>>> -             if (!dev_is_dma_coherent(dev)) {
> >>>>> +             if (!dev_is_dma_coherent(dev))
> >>>>>                        arch_sync_dma_for_device(paddr, sg->length,
> >>>>>                                        dir);
> >>>>> -                     arch_sync_dma_flush();
> >>>>> -             }
> >>>>>        }
> >>>>> +     if (!dev_is_dma_coherent(dev))
> >>>>> +             arch_sync_dma_flush();
> >>>>
> >>>> This patch should be squashed into the previous one. You introduced
> >>>> arch_sync_dma_flush() there, and now you are placing it elsewhere.
> >>>
> >>> Hi Leon,
> >>>
> >>> The previous patch replaces all arch_sync_dma_for_* calls with
> >>> arch_sync_dma_for_* plus arch_sync_dma_flush(), without any
> >>> functional change. The subsequent patches then implement the
> >>> actual batching. I feel this is a better approach for reviewing
> >>> each change independently. Otherwise, the previous patch would
> >>> be too large.
> >>
> >> Don't worry about it. Your patches are small enough.
> >
> > My hardware does not require a bounce buffer, but I am concerned that
> > this patch may be incorrect for systems that do require one.
> >
> > Now it is:
> >
> > void dma_direct_sync_sg_for_cpu(struct device *dev,
> >                  struct scatterlist *sgl, int nents, enum dma_data_dire=
ction dir)
> > {
> >          struct scatterlist *sg;
> >          int i;
> >
> >          for_each_sg(sgl, sg, nents, i) {
> >                  phys_addr_t paddr =3D dma_to_phys(dev, sg_dma_address(=
sg));
> >
> >                  if (!dev_is_dma_coherent(dev))
> >                          arch_sync_dma_for_cpu(paddr, sg->length, dir);
> >
> >                  swiotlb_sync_single_for_cpu(dev, paddr, sg->length, di=
r);
> >
> >                  if (dir =3D=3D DMA_FROM_DEVICE)
> >                          arch_dma_mark_clean(paddr, sg->length);
> >          }
> >
> >          if (!dev_is_dma_coherent(dev)) {
> >                  arch_sync_dma_flush();
> >                  arch_sync_dma_for_cpu_all();
> >          }
> > }
> >
> > Should we call swiotlb_sync_single_for_cpu() and
> > arch_dma_mark_clean() after the flush to ensure the CPU sees the
> > latest data and that the memcpy is correct? I mean:
>
> Yes, this and the equivalents in the later patches are broken for all
> the sync_for_cpu and unmap paths which may end up bouncing (beware some
> of them get a bit fiddly) - any cache maintenance *must* be completed
> before calling SWIOTLB. As for mark_clean, IIRC that was an IA-64 thing,
> and appears to be entirely dead now.

Thanks, Robin. Personally, I would prefer an approach like the one below=E2=
=80=94
that is, not optimizing the bounce buffer cases, as they are already slow
due to hardware limitations with memcpy, and optimizing them would make
the code quite messy.

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

I=E2=80=99d like to check with you, Leon, and Marek on your views about thi=
s.

Thanks
Barry

