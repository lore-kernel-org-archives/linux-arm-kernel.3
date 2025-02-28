Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A9FC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-reply-to:Date:Subject:Cc:To:From:
	References:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yky+MpWpSqBmuiHoH6G890ahUf3ki5Lz5PCO4fqT27Q=; b=GfLpEcwSfYGIkt5cvt4GXuvEDh
	oFPmi1a6NO4nD3tC2QSyGF9NYzIjrVl1RhNvtTSo17yZq8FsN1vLgdowkCUpyDXeRioqqn7bYFBZC
	9izip/vYZcC4YSDbIiJ/R23wL39POfaHB0uojOLqNdDx1LuMSDgnFt70a/oVMYJ6C7CxvmqeXVc0Z
	WQiXNfZOjUHYRKCNhO2sTOtCEThKyp7X0HZ9im7Dv2JOo3Lf0paLjo3mb68zH5T+enxH6WMcNaS1C
	QfgtxiHg0fgSEPprhzlmygPpFvXCF86JDGyYfrIsVlVhvZW+Wc9I1YJ2GhfZKWQA/ObhFXNfzdMZR
	qcNW3PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzFe-0000000ArMX-0aw3;
	Fri, 28 Feb 2025 12:13:58 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnymD-0000000An4D-41Jl;
	Fri, 28 Feb 2025 11:43:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30a303a656aso21272011fa.0;
        Fri, 28 Feb 2025 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740743012; x=1741347812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yky+MpWpSqBmuiHoH6G890ahUf3ki5Lz5PCO4fqT27Q=;
        b=P8xhbO17VuzYJeZV1m/NeWQKEW/HPr1IJCug8XZWvEtmwK3Miw1gNB3GZxSPn2xXVs
         jg6288ts8/vsED8i1nhijQO1w6SEcH8uoeF22brfzu9Xg3rZcmugkrYGt2MoOJCvT74N
         DfPFaHDw7juYz3JqwGJycH/7tKQEHFp+peQhoysAePvZj2fkSlZZ9Upk3uYecHwV/Yc7
         2uGy6qDnNp7nnFpZ2yZvT8pK3XuG7KW6C+8hue5DMzX34Zx8+sctykZIidfNb4W8wx4b
         v+hvIZN+i3a1DAAsoTfZgGmkHrXs95mA3eUUU0hZg+1xospQARw+dQ28Ni3Vuqr+9Kqu
         h5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740743012; x=1741347812;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yky+MpWpSqBmuiHoH6G890ahUf3ki5Lz5PCO4fqT27Q=;
        b=Hr1sl35v7wLCVSlEuyw+3vHbB1BD1sSriAwv24YaZgHDcHwbmUBA/qkyHWeD1WWfVO
         SAOz4w+xLw1sT1mh0Alqkg8Kn/HTy+Slad0y1q80mWhP47Xrc83EP6ZCM85SRfK4eF61
         YtWIpAVjLJEmikrZmExavZV7dk4uTrV34fk//yXqDKQQgfDhGYiyqpP2WT5iEIZXbFX/
         btpVk9ufdtUbeowI5IuhIMX+AwVmZhy1hnCHCSMsA8yvxi21X2ageDX7WV+Mqi4mhRUq
         koyMTaYLFjU5u7UhV2x1qbAqG5Ns+aCdtJcgrXsBkG3x4/eN/uLgLKCUnxTihUiIcP/Y
         n8MA==
X-Forwarded-Encrypted: i=1; AJvYcCUYFOZenowo1l7pSTgEYVzWAB2UWfD6YNylH+hCBcZkTm80aCgwV03II023U/J7jPDyDKmm28TKH1O00wXSrXw=@lists.infradead.org, AJvYcCVFqyEpO1ZMCAqmWr5kpVJT4m0AC8/cDC+7vnFHKzEyT8h3DGK4RB5g8kozwAJLohexJES6X8DWeXO0kmSDxW24@lists.infradead.org
X-Gm-Message-State: AOJu0YxbLSaFCAvpa4og1+J5wK7KuzSkNWJGETbIBHClG9Lpg6lrELbS
	i9H/oZtzo/77JMyYzROtSBWkfOHESvkcBxnzkgYo79EyWJ4OtKY5
X-Gm-Gg: ASbGncthapWX2RZvXyOVHjHXsl6AaB7AoSK8lfZPUWUvo8zZ34PT6HrdKZxrHDSyWDG
	UP0iRmdAyBihGZMssh+4x6gO/9sOcyjt2DHaHRIH73NZ/DxlCwJ6QanOlCz7Sru2PFe+2JsuJx7
	AkwjLjNy+SEyUJO0muE/MX57jqWgO22h8hT1LhyvFJyGSdeq39o81MeisJ22EaScUlaAqmSY08K
	StKl8Y1oIr3602rEEkiRpNS5Vm5DBolXeqlcIrGBP9+FWwQyhaIy99vRunNbmCg/M03JcbGzDOp
	DroZ5QNtr9KVpQrxuA35cKdG/iYd92uO7LTevu1zLZyhoQSCv5dxyx2tdeEkA0FRoLNkNe1/Aau
	nWzDhlXaSQdfqww==
X-Google-Smtp-Source: AGHT+IHOs9vqantuNod90ERM5xB3i1bFO2RtYdojT8XjyxXMwXaQtOUpbPRNc5KFH73oqV4zi5nIyA==
X-Received: by 2002:ac2:4e14:0:b0:545:93b:30bf with SMTP id 2adb3069b0e04-5494c37d894mr1314384e87.41.1740743011725;
        Fri, 28 Feb 2025 03:43:31 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441740ffsm466848e87.50.2025.02.28.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 03:43:31 -0800 (PST)
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
 <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
 <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
 <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Dafna Hirschfeld
 <dafna@fastmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
Date: Fri, 28 Feb 2025 14:41:34 +0300
In-reply-to: <CAAFQd5A4YOaSCn=xe7OM-hPKcUhqkD5hTiMUo5F9pwhKNFJ2Lg@mail.gmail.com>
Message-ID: <87h64eb8gw.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_034334_002894_D64B1EEE 
X-CRM114-Status: GOOD (  30.57  )
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


On 2025-02-28 at 19:25 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> On Fri, Feb 28, 2025 at 12:30=E2=80=AFPM Nicolas Dufresne <nicolas@ndufre=
sne.ca> wrote:
>>
>> Le mardi 28 janvier 2025 =C3=A0 23:35 +0300, Mikhail Rudenko a =C3=A9cri=
t :
>> > When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
>> > commit 129134e5415d ("media: media/v4l2: remove
>> > V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
>> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
>> > no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
>> > introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
>> > V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
>> > no-ops, making cache maintenance for non-coherent dmabufs allocated
>> > by
>> > dma-contig impossible.
>> >
>> > Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
>> > {flush,invalidate}_kernel_vmap_range calls to
>> > vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
>> > buffers.
>> >
>> > Fixes: c0acf9cfeee0 ("media: videobuf2: handle
>> > V4L2_MEMORY_FLAG_NON_COHERENT flag")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
>> > ---
>> >  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
>> > ++++++++++++++++++++++
>> >  1 file changed, 22 insertions(+)
>> >
>> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > index
>> > bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28c
>> > e0641fe726e63 100644
>> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
>> > @@ -427,6 +427,17 @@ static int
>> >  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>> >                                  enum dma_data_direction
>> > direction)
>> >  {
>> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
>> > +     struct sg_table *sgt =3D buf->dma_sgt;
>> > +
>> > +     if (!buf->non_coherent_mem)
>> > +             return 0;
>> > +
>> > +     if (buf->vaddr)
>> > +             invalidate_kernel_vmap_range(buf->vaddr, buf->size);
>>
>> Am I correct that this is mostly to prevent the kernel from reading
>> back old data from the cache after an application or other driver did
>> CPU writes ? If so, can't we restrict that to DMA_TO_DEVICE and
>> DMA_BIDIRECTIONAL ?
>
> Note that this function must also synchronize between the user-space
> and kernel mappings, where the DMA direction doesn't really matter.
> Also it's unlikely for it to be called when not needed - why would one
> begin a CPU access before the DMA, when the DMA is FROM_DEVICE?
>
>>
>> As for pending kernel writes, they should have been flushed before the
>> buffer is made available for dequeue.
>
> There is no implicit flushing for imported DMA-bufs. All the flushing
> needs to be executed directly by the CPU accessors by surrounding the
> access with begin and end CPU access, be it in the kernel or
> userspace.
>
>> And any access while a buffer is
>> queued is concurrent access, which is expected to have undefined
>> behaviour.
>>
>
> Correct.
>
>> > +
>> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
>>
>> Isn't there a link to make between buf->dma_dir and direcction before
>> calling this ? Also, shouldn't we use direction insead of buf->dma_dir
>> to possibly limit the scope ?
>
> Oh, yes, that's a good catch.

Indeed, will fix this in v4.

> It should be |direction| passed here and
> not |buf->dma_dir|, since the former determines what CPU access will
> be done.
>
>>
>> > +
>> >       return 0;
>> >  }
>> >
>> > @@ -434,6 +445,17 @@ static int
>> >  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>> >                                enum dma_data_direction direction)
>> >  {
>> > +     struct vb2_dc_buf *buf =3D dbuf->priv;
>> > +     struct sg_table *sgt =3D buf->dma_sgt;
>> > +
>> > +     if (!buf->non_coherent_mem)
>> > +             return 0;
>> > +
>> > +     if (buf->vaddr)
>> > +             flush_kernel_vmap_range(buf->vaddr, buf->size);
>> > +
>> > +     dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
>>
>> Similar questions for the end_cpu_access implementation.
>
> Yeah, same here.

Noted, will fix.

>>
>> Nicolas
>>
>> > +
>> >       return 0;
>> >  }
>> >
>> >
>>


--
Best regards,
Mikhail Rudenko

