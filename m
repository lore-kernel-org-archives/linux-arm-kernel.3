Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314FDE6B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3LOicgErNhTFYQEd3WH4kuv3Qzd96akWti2P2bwjKXg=; b=fGWZRzkqUyz0U0
	7GqqNNmnM+nm7w0ZUvEXhZJdjMHDgzBrRUeKZUhjb5AQDChveoRu2JUegTQEnAI7zxZw6SJYYv4hh
	0qRRG/rMHTJtLoEno2bKrcJpa87Qw2BURd6lsW69mbfsDjGCqL3pTFVsOP4W4QLts5pvMe/fod+KR
	7gwsiMbimhP6+H7ppNtEJB/+bYqGlGpwYSHP62/0CI+1BSjd0BuYk+EFxveH7vCQzA52b7NMItLrH
	ENI1vRPyWQARsFvfbQ6Mq4i9CuUwnaBPLOLlheNf76G4ln4J5BR6fITkDq5eUWKaw5E76frw56K7Y
	HYZKJFl+1bwok/ezW8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXprq-0000000EHfk-21yD;
	Tue, 23 Dec 2025 00:03:10 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXpro-0000000EHfN-1k7N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 00:03:09 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-88a288811a4so50541666d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 16:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766448186; x=1767052986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LOicgErNhTFYQEd3WH4kuv3Qzd96akWti2P2bwjKXg=;
        b=WRKPxcP2psjwPmePxWkba1D0mnKCmCsMCSHRhadZ6ArC7n+AdpgX+bs9L7lfzU3XZP
         RM3ZM//d0UZ/FvSrMXqIjMK1yRanTuBQMzF6t709mcGA6Xwo4OwyJpuT2/it6upvvxlk
         rTEiiyLCPSCtv2hqxGCD34tcoNnc7+oGa9y2/ap7uZSy6qSvaX0dyWx9lclX6xmuvtZw
         fA2wrNjsHLMUE24N8cYavZ+2gPRM/4gTXKDZbutoiekHx3q1APAh3vb1nLseRaO0clTJ
         QkWatTZuu24RUHfiiXfzMzws3Eh7UFGa+AGOh9ujysq+yOStROazde9o1UW7dE6z/qtv
         Vr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766448186; x=1767052986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LOicgErNhTFYQEd3WH4kuv3Qzd96akWti2P2bwjKXg=;
        b=Xu7aLAQE+MMy1GnD9LI8HO7AlzmtDUIvvAVCYDlFfKlyX5KUFAKj+7r7uCCgKpE1B7
         yYo5WGycW9FM4xHSrs3mV5sLyq9Gs46AZXmdwVS7NCgbloYpKCuhvZBohIMb17JmmwrA
         i3jqabtqmV8s1Ak/ug7F+YZVC5LcejzuRHxgrVDBSGKp1SSJpyQp+Zr9NoVq0ytLNSnS
         bjrd3Mf4XCo5fUjEI6WvQEz3V350hi8U6Iq0uFvPT+Geg26il57tOlgP2pSEiiSAxbYs
         by6JDNgkowLLkYQnMqwTCTef0CsAvO8JpvR9+Ili4P+2s/5wCMuU+v7/pksQTbutM2p+
         QeQg==
X-Forwarded-Encrypted: i=1; AJvYcCWIW24zprSfZQ5hIaslcpLVu3SBfABOId9WHmnaSuKQnSYUFiSx8/hUwOszpLsTvsao39siSO6k5hlfYX0c2Idn@lists.infradead.org
X-Gm-Message-State: AOJu0YxfxALTdOaQ/sdrCP1wrrK/A12ryUZddqacPOtc5lit+6IqV/AP
	iResAC+MvErM+PZcaR6OcwZGXhcVOMrNjY98DC2J4NawSCzObFjzdFzedoElP/JNfToE4Y4hMe/
	0AkTk/W4ZEbyWxSKhxZ2myF6Z4xShgNs=
X-Gm-Gg: AY/fxX4qL1FjmeF3AxAogxVMV45/bk9ESHNzzs4pq0zUF7ybCRuESGyBvZu0jP1R3uw
	LsLBpxgnzeiVBW9rA5+6YnCsgD8cNw7qU2OXs7kh4Bj1uGcTgkPkHiqsOp+MgLS2whHB2w4Hn+H
	hNk8xzFOg9EzCY6DRm/dcF3FoUNEn1bLwNOesbnlkIxkXYQE2CdZXbOgpDFNBGrxRhRK8lq7tao
	aZ5b7m51N1TrOSP4Tga0OtFn/QKF5XaFT1/uPvFXvqKLd15DGzAY18Z1Q93x3xCajrlPg==
X-Google-Smtp-Source: AGHT+IEZZVrQZ0i2FOsWBMrA37EgStlHwxoujL9L1Fx4NStIdzIudBmVYo0v/NHWIETz9sf+Dm3aWxP2ut/+MfFNKiE=
X-Received: by 2002:ad4:414c:0:b0:880:4310:7e02 with SMTP id
 6a1803df08f44-88d81d42e4bmr152858826d6.21.1766448186339; Mon, 22 Dec 2025
 16:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20251221115523.GI13030@unreal> <20251221192458.1320-1-21cnbao@gmail.com>
 <20251222084921.GA13529@unreal>
In-Reply-To: <20251222084921.GA13529@unreal>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 23 Dec 2025 13:02:55 +1300
X-Gm-Features: AQt7F2rid0y3y0Yd9WtXER6TR3yir1jQ4ns4ZMhe7WurwhJeM4kREFYEM2znxW0
Message-ID: <CAGsJ_4yuvHNqHDi8eN-8UoY2McoXUeCMmbjFAr=jSdv8GpGKeg@mail.gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_160308_466615_CA0C5584 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, Dec 22, 2025 at 9:49=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Mon, Dec 22, 2025 at 03:24:58AM +0800, Barry Song wrote:
> > On Sun, Dec 21, 2025 at 7:55=E2=80=AFPM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > [...]
> > > > +
> > >
> > > I'm wondering why you don't implement this batch=E2=80=91sync support=
 inside the
> > > arch_sync_dma_*() functions. Doing so would minimize changes to the g=
eneric
> > > kernel/dma/* code and reduce the amount of #ifdef=E2=80=91based spagh=
etti.
> > >
> >
> > There are two cases: mapping an sg list and mapping a single
> > buffer. The former can be batched with
> > arch_sync_dma_*_batch_add() and flushed via
> > arch_sync_dma_batch_flush(), while the latter requires all work to
> > be done inside arch_sync_dma_*(). Therefore,
> > arch_sync_dma_*() cannot always batch and flush.
>
> Probably in all cases you can call the _batch_ variant, followed by _flus=
h_,
> even when handling a single page. This keeps the code consistent across a=
ll
> paths. On platforms that do not support _batch_, the _flush_ operation wi=
ll be
> a NOP anyway.

We have a lot of code outside kernel/dma that also calls
arch_sync_dma_for_* such as arch/arm, arch/mips, drivers/xen,
I guess we don=E2=80=99t want to modify so many things?

for kernel/dma, we have two "single" callers only:
kernel/dma/direct.h, kernel/dma/swiotlb.c.  and they looks quite
straightforward:

static inline void dma_direct_sync_single_for_device(struct device *dev,
                dma_addr_t addr, size_t size, enum dma_data_direction dir)
{
        phys_addr_t paddr =3D dma_to_phys(dev, addr);

        swiotlb_sync_single_for_device(dev, paddr, size, dir);

        if (!dev_is_dma_coherent(dev))
                arch_sync_dma_for_device(paddr, size, dir);
}

I guess moving to arch_sync_dma_for_device_batch + flush
doesn=E2=80=99t really look much better, does it?

>
> I would also rename arch_sync_dma_batch_flush() to arch_sync_dma_flush().

Sure.

>
> You can also minimize changes in dma_direct_map_phys() too, by extending
> it's signature to provide if flush is needed or not.

Yes. I have

static inline dma_addr_t __dma_direct_map_phys(struct device *dev,
                phys_addr_t phys, size_t size, enum dma_data_direction dir,
                unsigned long attrs, bool flush)

and two wrappers:
static inline dma_addr_t dma_direct_map_phys(struct device *dev,
                phys_addr_t phys, size_t size, enum dma_data_direction dir,
                unsigned long attrs)
{
        return __dma_direct_map_phys(dev, phys, size, dir, attrs, true);
}

static inline dma_addr_t dma_direct_map_phys_batch_add(struct device *dev,
                phys_addr_t phys, size_t size, enum dma_data_direction dir,
                unsigned long attrs)
{
        return __dma_direct_map_phys(dev, phys, size, dir, attrs, false);
}

If you prefer exposing "flush" directly in dma_direct_map_phys()
and updating its callers with flush=3Dtrue, I think that=E2=80=99s fine.

It could be also true for dma_direct_sync_single_for_device().

>
> dma_direct_map_phys(....) -> dma_direct_map_phys(...., bool flush):
>
> static inline dma_addr_t dma_direct_map_phys(...., bool flush)
> {
>         ....
>
>         if (dma_addr !=3D DMA_MAPPING_ERROR && !dev_is_dma_coherent(dev) =
&&
>             !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
>         {
>                 arch_sync_dma_for_device(phys, size, dir);
>                 if (flush)
>                         arch_sync_dma_flush();
>         }
> }
>

Thanks
Barry

