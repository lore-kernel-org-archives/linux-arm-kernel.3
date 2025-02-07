Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 16:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=; b=Zq23PIyT7IKS/gHgTAOOsBT4gy
	A3uBSjhfqqmLcR56eHMRm1dPau4x3kes9nIDeTmskF4X/6kfWUV+uWoZj/Jbo3jU+SMd/+7KPAiGw
	y3+jpNwrMkoT2wNKZ2URdDK14cSZ777oIzL0PtQbpprq0E7cRcTgf+A2S/lW5cKUyrXeXWXUyIZBO
	diaUmbrhoqhlmHv3px07Yh1aTSmYBYEaof/mTp84dkq0S97ggDpMoX/OwEpg6C28/VL7yK8vcyyU+
	F37ETuGUF1UyR1EMUP6Z08L7r/qZt65HbpajQGU5ndaaqsNSVhZGu32qSg+6ZzVGb0rzog8DtuTo1
	BLIDcZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR92-0000000AGdb-3xCR;
	Fri, 07 Feb 2025 16:23:56 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR7e-0000000AGKC-1lkr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:22:31 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so1135077a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738945347; x=1739550147; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=E0DKXf5M89HhjHsgfG3lk1xNHP1okdU0SgmL3QB0vWSqRX0FRZ7he9+iMwijVmScKs
         nYRPtslqd5pIaoZbrXvfqOJF19u7sQDMgRajMv59+KHQBi3d8FAmOi44icuXRPA7eLdI
         uHivnZAkjjOnCkqa9iPDYooEkj6GPMFzX2Ykk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945347; x=1739550147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCn5Dk3vMVo7X1t68AtKlpToAukuif5wkQVCcdE+FHY=;
        b=XesQs0diJ7kKAVYu7as0V53UE2UAJ+oXCABJLfLppEkf0NHK9vyCCtDg3FPtqych4C
         XxXRvbpdNNOPoVdO2wkowgQ4VFodLIIY5Vc8K2tL6XMS6uFHwbfc9bRIc9onWFWgHY8P
         noeaJQ49liXOuqKUMEVqTAkYPY7VQOjotf9Q3b3UyAUTt9xxcW7ONymWYTi9pXn1tuIv
         fFT2nC0RAl9C4srnHvulFFQG2fPcmUgoG5C3GMQnloW0TkhG8Bpzdd7s9yviJUphfSJA
         cZgZaHtIHdFpqKeOuP5VY1qcSE8PpQHOj739mPjpp2+fIhNEJBIl0e+zvZ586kMdIamX
         ARdg==
X-Forwarded-Encrypted: i=1; AJvYcCX+bjQSY5Cbi9Z/AeMhADMov7LrZadIIxtZoY1l0+odznnKnMRUlZyCIlr8NRXtrlyNLxl+18Crp6uj8fSvKj4d@lists.infradead.org
X-Gm-Message-State: AOJu0YyKs7y5Uri/Cckf7Ez97wa4gVtmSgTIi3qy9v66q6tb/zmpXODq
	Qvdx8M2KFDLzFv7lWN2rFdo46Mfnr3WQRoG3+31pXcpC6nx1nAxKY0v0eQJ2gr979PPvKWPDU6/
	2jtY7
X-Gm-Gg: ASbGnctIVz3L7Wg2TkICFp6Ouu0/X74pD6Y+XScWzcfdzMNSizm6k2iLoCN921+9skr
	hikiavw78b5UtPTDbr3EPgLpca102umTqjNOHRhUhDTySjFts0N/XCkhsjtvYHXnj6zeRvehmAZ
	xnIs/eecaZKsrXLF43tNZ8w9DJGZv0+nR0Rq47XanySaM3tZgdj/Bz2Uub4fQNIyxiGHdWsaATS
	dUD5VJQpPC5mZ8c+fW5pyc0F51mM4pTwH1Cp0CPMZK+nFXGKKl0sZu3lHX2S7z8Jr8MoZEm9Y7B
	wbyQFt0Gp11yh6AN+EfY2riNEWBODxaBx1ZrLzHfUKXQWeYzNn8=
X-Google-Smtp-Source: AGHT+IEM2g60UR1ktULdO07j8ErY6em6uvLet7Bgn9KINObmvJ8+VyU6SKJ40Nm/I/07ErIn9aaYnQ==
X-Received: by 2002:a05:6402:1ec2:b0:5dc:cc90:a390 with SMTP id 4fb4d7f45d1cf-5de4508fbebmr5031424a12.32.1738945347056;
        Fri, 07 Feb 2025 08:22:27 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4690311csm1491919a12.60.2025.02.07.08.22.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 08:22:26 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso11200a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 08:22:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEpRzToEf4kWuG6bv1bjE12kOq22d0sQXzACkMNuOABNQILeC5FtpgF6N0Ptu7k6t1ke5lg9X5KYKuANB3zlcI@lists.infradead.org
X-Received: by 2002:a50:ee16:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5de46901c8dmr116990a12.4.1738945344498; Fri, 07 Feb 2025
 08:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com> <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 7 Feb 2025 17:22:08 +0100
X-Gmail-Original-Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
X-Gm-Features: AWEUYZkLRr1JxCvNI8JDDZBOdbLkP21kufM0wZUw4Akj7bxs1aInWlFMBNe_a0o
Message-ID: <CAAFQd5BkbJz4VJOvj8P5gBtbi=VCgsgebw12PnepLj6Qn6C_AQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Christoph Hellwig <hch@lst.de>, 
	Robin Murphy <robin.murphy@arm.com>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082230_487791_4D6EF276 
X-CRM114-Status: GOOD (  22.82  )
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

On Tue, Jan 28, 2025 at 9:36=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gmail=
.com> wrote:
>
> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> commit 129134e5415d ("media: media/v4l2: remove
> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> no-ops, making cache maintenance for non-coherent dmabufs allocated by
> dma-contig impossible.
>
> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> {flush,invalidate}_kernel_vmap_range calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHER=
ENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f2=
8ce0641fe726e63 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,17 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               invalidate_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }
>
> @@ -434,6 +445,17 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem)
> +               return 0;
> +
> +       if (buf->vaddr)
> +               flush_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +       dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);
> +
>         return 0;
>  }

I took some time (over)thinking the kernel vmap range synchronization,
because these functions can be called both from the kernel space using
respective dma_buf_*() kAPI and also from the user space using the
DMA_BUF_SYNC IOCTLs, so we could in theory have the multiple
invocations racing with each other, but then I realized that we don't
really provide any guarantees for concurrent writes and reads from the
CPU, so I believe this should work fine. Sorry for the delay.

Acked-by: Tomasz Figa <tfiga@chromium.org>

Let me add @Christoph Hellwig and @Robin Murphy just in case I'm wrong
on that, though... Hans, let's give them some time to take a look
before applying this.

Best regards,
Tomasz

