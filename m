Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF3BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5Yuxxu0WAoN1GxBYvN/CmEDsSXx0gVMofLIggB5ihw=; b=1IPp5BXo7EUPd8X7ZdVcTztzXk
	q4KyK0QXVyKF+c6q8fB0ee5ZFE6IIn59PiJjFve0Edo1Lj4NOS8UbBSPGAkIDoPgw7EsC7ArzPMKG
	RdKNPF+mFgVKRxXR6K1B2NJde0kvK0jVpGu2uvsu24FkWy+jzNKeKV+zejcGCVwSJr38/Wh71/lr7
	HpDEG+/wpppQb+J6UdjZudxkdEiGir2KkgfRoCRMGXAugmPs7rfu/5G4fxmEiA897CVyml7NijUvH
	YlJSsE6EpjfzKirI7vBzPBzEm/7Y+Rf7A5GpAqA4/Ql2jX4v6I7jM5AX2OQqURezrZHFFxMSR3AyN
	KiPjf7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZ1T-00000001zfb-0tWA;
	Mon, 10 Mar 2025 09:02:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYzq-00000001zOq-0Pw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:00:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abf48293ad0so635724366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 02:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741597224; x=1742202024; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5Yuxxu0WAoN1GxBYvN/CmEDsSXx0gVMofLIggB5ihw=;
        b=QOEmFAAIJ0KGva8+2gxNYCvM+kPdW0e35mjubIlZ1a8JFY8WHTJVpZgUvGUmq/4vI1
         aCqTAiNWqPzqGJgvecnHxbOMyZGYM2Ols77SYhulhWzuFiC9kYegvOJwwHXADL2D0LrZ
         En7LjY2ShkyUJCCD3Hq+NnrGH279M913v3tzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597224; x=1742202024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5Yuxxu0WAoN1GxBYvN/CmEDsSXx0gVMofLIggB5ihw=;
        b=CThRon6GVnphTpfpH2XkhQmhbGcwpz45yenrTZLKCfdk0hwPBspWq3dukTStqbxc3y
         M+eGrzEkmeCPqOcjtTKMyb2Ru82RpNK9kbPb+C2+CCQpkC8P0CfDm/rJuhDU5VXn3gO3
         Jj2qvo32Yo66rXK8WuM5QL9xqjPYOYbzNFKx+Dx81U/ixFXCqPg/IXQEjOQrjAPNk3lH
         9L5JUfpk7J9Hc/cyzWzBmudorWQz8GIWPX+bjU4181KpX2qfk7rPLm8/13Oo2zCNacEh
         WCuSNh6KygOZVcJIatD5xQt/6Rex36FoIkN+7gs4K71ojnvzDyPvCUUJ9vjjiPykPgu2
         AaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeYgwCIXVHr+W+Ja79Ym3/apTJ5fO70AjV9/S/m4FQ+XUatuMXkzFyx4i4l0ScIKQfmK9FpzvrsMB4uMT6zRnD@lists.infradead.org
X-Gm-Message-State: AOJu0YwE7aS6Si7//vt+Ofwr5MMm8ztwa4ZK75HKnkRSr5obVxfORFLr
	JOWq67jI+/MyeiSJylQMDKj/m7golsEelwc156dnSsMZvVJxb3DICMTJiyJ4AFGb09FyBcclUtM
	=
X-Gm-Gg: ASbGncuqfuLr9o9rb+1jcOSjcNosxog4F+UlMDx86iBdcbB5QfeaHsmeSR/vFTvAzAx
	VJYpe7AgDi5PipAOSyVs9og479pzQi8vKfoKsS5PtnIJDYcl58qEWVZTzXgZaFSBXF2BBuRDV6t
	lJB241S2HBoY/BGkfR477SqmeKI8o1oOQSkfWRQ4f5JamjmW28P/5I/8vye1eRWq/4goNTtLbrq
	aDNT2W8Pw3JmgwJjhIg6KJrE6AHq+AKow92pQpFY41kY2ynQQQ28BXP1IXv3jWzeZzBS37Bt7UD
	Zj45D3JqSKauHjjCJ7MZuxwabBLDS3nzvVQ3rYzD/lwst7hrgS3mhMzIPBTpbeCFUAY9XvYdvGu
	wSryKxO7A6LO25Ho=
X-Google-Smtp-Source: AGHT+IGjH7YsfX6Ud3Jz5e9jAJViE3vy69vK8J5dLBWYZ97SjiRXgCaWpjg20JMKl3XXDj02LXcrSA==
X-Received: by 2002:a17:907:2d20:b0:ac2:b086:88e3 with SMTP id a640c23a62f3a-ac2b0868a8cmr62161566b.10.1741597222244;
        Mon, 10 Mar 2025 02:00:22 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2394858a3sm735326266b.62.2025.03.10.02.00.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 02:00:21 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e50bae0f5bso9242a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 02:00:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvbc7EMGBWensTqpdS3aKIpaIVPONrlDYtGlTiX48Y03xcKUYaxWDUX95fiktN2pAzA9DrB/XIQ3VyTUXdtlr9@lists.infradead.org
X-Received: by 2002:a05:6402:95a:b0:5e6:887f:6520 with SMTP id
 4fb4d7f45d1cf-5e6887f672fmr62677a12.5.1741597220471; Mon, 10 Mar 2025
 02:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
 <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca> <87wmcxs1xw.fsf@gmail.com>
In-Reply-To: <87wmcxs1xw.fsf@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 10 Mar 2025 18:00:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A70T2iaN17X2Jfk_6fCKRYZdKpreb+9i76n5WMYNEt1A@mail.gmail.com>
X-Gm-Features: AQ5f1JowVCHSCv6zRQDIlGrshBtBzEUT-W75FlZzOuUhz9aDBR_F5KxVvuObz24
Message-ID: <CAAFQd5A70T2iaN17X2Jfk_6fCKRYZdKpreb+9i76n5WMYNEt1A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Dafna Hirschfeld <dafna@fastmail.com>, 
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
X-CRM114-CacheID: sfid-20250310_020026_131160_25442320 
X-CRM114-Status: GOOD (  29.49  )
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

On Mon, Mar 10, 2025 at 5:52=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
>
> Hi Nicolas, Tomasz,
>
> On 2025-03-03 at 10:24 -05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> > Hi Mikhail,
> >
> > Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit =
:
> >> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> >> commit 129134e5415d ("media: media/v4l2: remove
> >> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> >> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> >> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> >> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> >> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> >> no-ops, making cache maintenance for non-coherent dmabufs allocated
> >> by
> >> dma-contig impossible.
> >>
> >> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> >> {flush,invalidate}_kernel_vmap_range calls to
> >> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> >> buffers.
> >>
> >> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
> >> V4L2_MEMORY_FLAG_NON_COHERENT flag")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> >> ---
> >>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22
> >> ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> index
> >> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
> >> bc888a84a95d5 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> >> @@ -427,6 +427,17 @@ static int
> >>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> >>                                 enum dma_data_direction
> >> direction)
> >>  {
> >> +    struct vb2_dc_buf *buf =3D dbuf->priv;
> >> +    struct sg_table *sgt =3D buf->dma_sgt;
> >> +
> >> +    if (!buf->non_coherent_mem)
> >> +            return 0;
> >> +
> >> +    if (buf->vaddr)
> >> +            invalidate_kernel_vmap_range(buf->vaddr, buf->size);
> >
> > What would make me a lot more confortable with this change is if you
> > enable kernel mappings for one test. This will ensure you cover the
> > call to "invalidate" in your testing. I'd like to know about the
> > performance impact. With this implementation it should be identical to
> > the VB2 one.
> >
>
> I have re-run my tests on RK3399, with 1280x720 XRGB capture buffers (1
> plane, 3686400 bytes). Capture process was pinned to "big" cores running
> at fixed frequency of 1.8 GHz. Libcamera was modified to request buffers
> with V4L2_MEMORY_FLAG_NON_COHERENT flag. DMA_BUF_IOCTL_SYNC ioctls were
> used as appropriate. For kernel mapping effect test, vb2_plane_vaddr
> call was inserted into rkisp1_vb2_buf_init.
>
> The timings are as following:
>
> - memcpy coherent buffer: 7570 +/- 63 us
> - memcpy non-coherent buffer: 1120 +/- 34 us
>
> without kernel mapping:
>
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): =
428 +/- 15 us
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 42=
2 +/- 28 us
>
> with kernel mapping:
>
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_START|DMA_BUF_SYNC_READ}): =
526 +/- 13 us
> - ioctl(fd, DMA_BUF_IOCTL_SYNC, {DMA_BUF_SYNC_END|DMA_BUF_SYNC_READ}): 51=
9 +/- 38 us
>
> So, even with kernel mapping enabled, speedup is 7570 / (1120 + 526 + 519=
) =3D 3.5,
> and the use of noncoherent buffers is justified -- at least on this platf=
orm.

Thanks a lot for the additional testing.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

