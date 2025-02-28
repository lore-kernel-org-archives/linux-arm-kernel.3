Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE3CC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nb9NUQhb3bplKyawSYK7wGLTz8Fx3itEvvEthZZH/DE=; b=p7YCcRRRNmcgIA/w/0wPQApzxX
	Nv3p+1XwdlkI+EPU4p+qEnMgRo76I3Q3tQpWwAYN6h6Hl5GZShrzhLU+skrxGc7pqlTu18QHA56Pu
	IR/T+gfvYNmcm0Iwwew5nujzlDqKwaD2MJ36N8t64ErZU+jFzLAXkIlhfOxSDWBjA1P4HaepRvoJ4
	Pl5knQPffU6BUhyXDFFHdmkV5ojXfhKsyBGnLLJAGLTuXuu8ZrtibIw8+3fqRoYMBJ+TVtNpzO0Vw
	GC4iMHYRCMMxkcLVQHfbt4RMfViE6e+GV+BGrOu36KkUCa4a/8tXnx9liMDZZSUOULxgqLHyIvPxW
	gQrhYFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxqO-0000000Add6-3JIk;
	Fri, 28 Feb 2025 10:43:48 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZ6-0000000AaTh-33TK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:25:57 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so3200729a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740738353; x=1741343153; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb9NUQhb3bplKyawSYK7wGLTz8Fx3itEvvEthZZH/DE=;
        b=nsYWJxrFLyachQl7M4YuCwxYXFJqG+9pKsbIBr2pjTOEOPz76ZXY+mgZWSbQ9X9iKt
         IUjJOxMESookyL8k+Yjpf5bIPdN4RSDzgXLrJW6egON5GYuDJy/ghVIN0nuHH42Q/5i+
         yMudUmwOwGJiCpYcOKSHgrBCpBc7udPqNMGo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738353; x=1741343153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb9NUQhb3bplKyawSYK7wGLTz8Fx3itEvvEthZZH/DE=;
        b=EID/P2LPoRAYIpNrOXCkzOIsRrb/0HA5FYl7ab3WO6fBUyjvON6BUz7oud83gek+Sc
         i1OULbj/T7ijHA+gE7SupAVaBFXppP9UPVXh0geD9zwvkYoxz34XSopv73Qc2aagaNRd
         XFAuvfYPrMB8sbHLFxa+gkwFONm3v08KGFEBw7OU+N29noNpsKoMDc93FERwQqo8OnML
         tt90GoAYqWZoaq9emqkk36Y3+2lh4/hKhU1rlaumKyXT0cl9257s+CVuSzzBVYrI4MIL
         4p9UjIy0BiYU6HXdSAFeYin+5MD1ApFZRLx17xDTHXLljOE0a2vWaZZhZOiktKWE+y+b
         cOEA==
X-Forwarded-Encrypted: i=1; AJvYcCWHoWc7f1WczqLO70JbvByt0XMbYTubOh9alSqUypheURQv5VVPSXO70z7DYzIlTl9nFDH3Qqmq3qi+NVfg9czr@lists.infradead.org
X-Gm-Message-State: AOJu0YynY1vaOcuotihn7aTxFqY8V4SAX8J2kcp2kX8Fq/80brBoGAvV
	cpLzctLllIV9AxR9PGTUjMWywLUxAegCkIR+8xYIsBwAWO60jlRvRDoK+gK/Mcnf47t1/jRWFnR
	c3w==
X-Gm-Gg: ASbGncshKX7gBXIUz0F6RHVGVx21xnWgqYbJ3pZi3XBap57mo+5aQ1nrbA+ua0kSbgA
	i7pIMBnntND/6IgdUBhi3gN5g7FcofyoE55UkhjfXVw3zlwcMe/osw1LrNQkTYLdMvA2M4Kn9qN
	acL1wFMtc1KBDsewQHnD7Dj8nNO0QZX6PLxDQ7BaI/i61VxxI7qOT7nQXR92BjL0yKhNtgA3KYu
	sb07aJEg/+Gxvl5i4fHJ4LvhtVmtl9Cxmj376tPExF3EAY6Yj7UsQgrW5hai7/WoWht70nVl7pH
	jN7hpFhgrIgTEFgFzeqj2jfG+PyeaOme7otZgFqtlU4nwOOECJ2XBr4q+X0Www==
X-Google-Smtp-Source: AGHT+IHu4ge9zulEgURQr7EWQaxd36xY9pN/oCDictGbOxwVQ96P9DE3XF2x7gkNS1iDo6WBFkAXeQ==
X-Received: by 2002:a05:6402:50d1:b0:5de:be17:8 with SMTP id 4fb4d7f45d1cf-5e4d6b7107dmr2273971a12.23.1740738353338;
        Fri, 28 Feb 2025 02:25:53 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b6d252sm2318824a12.26.2025.02.28.02.25.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 02:25:51 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e05ac70b61so4640a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:25:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXryxpgvK8jnu8oecYuPELFf8eUHTaSLGSMX4scdERDzoLIfNpyuBqxUSef0LmXpuqC63rroy6qXO+ZZFaJo5qs@lists.infradead.org
X-Received: by 2002:a50:d7dd:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5e4d74dea39mr77472a12.4.1740738351014; Fri, 28 Feb 2025
 02:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
 <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com> <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
In-Reply-To: <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 28 Feb 2025 19:25:33 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
X-Gm-Features: AQ5f1JoHaD84fv2X5fHk6A_BWpTZQNcf1bz4WEEDQ8FkApfINlkKzBEV-PkKHU4
Message-ID: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mikhail Rudenko <mike.rudenko@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022556_760997_CED7724C 
X-CRM114-Status: GOOD (  31.37  )
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

On Fri, Feb 28, 2025 at 12:30=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresn=
e.ca> wrote:
>
> Le mardi 28 janvier 2025 =C3=A0 23:35 +0300, Mikhail Rudenko a =C3=A9crit=
 :
> > When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> > commit 129134e5415d ("media: media/v4l2: remove
> > V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> > no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> > introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> > V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> > no-ops, making cache maintenance for non-coherent dmabufs allocated
> > by
> > dma-contig impossible.
> >
> > Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> > {flush,invalidate}_kernel_vmap_range calls to
> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> > buffers.
> >
> > Fixes: c0acf9cfeee0 ("media: videobuf2: handle
> > V4L2_MEMORY_FLAG_NON_COHERENT flag")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> > ---
> >  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
> > ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index
> > bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28c
> > e0641fe726e63 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -427,6 +427,17 @@ static int
> >  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >                                  enum dma_data_direction
> > direction)
> >  {
> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
> > +     struct sg_table *sgt =3D buf->dma_sgt;
> > +
> > +     if (!buf->non_coherent_mem)
> > +             return 0;
> > +
> > +     if (buf->vaddr)
> > +             invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>
> Am I correct that this is mostly to prevent the kernel from reading
> back old data from the cache after an application or other driver did
> CPU writes ? If so, can't we restrict that to DMA_TO_DEVICE and
> DMA_BIDIRECTIONAL ?

Note that this function must also synchronize between the user-space
and kernel mappings, where the DMA direction doesn't really matter.
Also it's unlikely for it to be called when not needed - why would one
begin a CPU access before the DMA, when the DMA is FROM_DEVICE?

>
> As for pending kernel writes, they should have been flushed before the
> buffer is made available for dequeue.

There is no implicit flushing for imported DMA-bufs. All the flushing
needs to be executed directly by the CPU accessors by surrounding the
access with begin and end CPU access, be it in the kernel or
userspace.

> And any access while a buffer is
> queued is concurrent access, which is expected to have undefined
> behaviour.
>

Correct.

> > +
> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>
> Isn't there a link to make between buf->dma_dir and direcction before
> calling this ? Also, shouldn't we use direction insead of buf->dma_dir
> to possibly limit the scope ?

Oh, yes, that's a good catch. It should be |direction| passed here and
not |buf->dma_dir|, since the former determines what CPU access will
be done.

>
> > +
> >       return 0;
> >  }
> >
> > @@ -434,6 +445,17 @@ static int
> >  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> >                                enum dma_data_direction direction)
> >  {
> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
> > +     struct sg_table *sgt =3D buf->dma_sgt;
> > +
> > +     if (!buf->non_coherent_mem)
> > +             return 0;
> > +
> > +     if (buf->vaddr)
> > +             flush_kernel_vmap_range(buf->vaddr, buf->size);
> > +
> > +     dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>
> Similar questions for the end_cpu_access implementation.

Yeah, same here.

>
> Nicolas
>
> > +
> >       return 0;
> >  }
> >
> >
>

