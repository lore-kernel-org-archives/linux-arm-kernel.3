Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BB9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVVG2IwvthWW/+RBCG6i5JXoqhlYqngpobZWnBOaYI4=; b=mK1gkrzOBsO2uweh5ZFDrDKd06
	ML1gt5Lp1W26bZT0dFrZftDlfBD2fUbg8Ys+iiQE1PdkVmtdGz9Fpl3duYEJGYomCDDK+4g/8RbBd
	DD1++wN9HHrb4qrYK8ZF+30OE9WqDgrQr8ZliZMUxBGR5FJK2aWvuo5zSC+nFvOmujaYuddw3jTmw
	WJ+qn/mYFJ2V+iQ++3KNwTdiWS9I6g78ngFIGdWx6fwEzNVnPrfOdqXr5dy7H7RYDcSENaW/J8QZe
	TQPYm88rwIy9SGYGKJcu4/8fxxa0AQNw4g6pBwS/NFrVoeJ7O0QGUXWQma1aA2mKJDdC6CxUbW3lv
	o/gQihew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr6l-00000009apL-1LHF;
	Fri, 28 Feb 2025 03:32:15 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr5A-00000009aHL-3vmH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 03:30:38 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-471f9d11176so17551201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 19:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1740713436; x=1741318236; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RVVG2IwvthWW/+RBCG6i5JXoqhlYqngpobZWnBOaYI4=;
        b=rQUZk41mjYBK6McZquRkctZfnLLTyfeFCKput/M8GsD9mPUHuL0Lq+3s9IagIor8KI
         usQRVXhTB3p1mI2EwN7EX1aEvi+lI/pgo64Zr/DqJvVyJWlYjPYkkWtAm/VDOXQeBieR
         R8PKZUcrgTpyui9wrIb76aZPkbLhBsnfN+er6ntmGrF4rjLOeJFkhWhgUKiyaff6fXrX
         2jQ7yBwbdP9UXUPLZiyGUp3sjUqze3nYlEKOMiwjiYiSXQR+6RmpB371VFqhIDphux7D
         LUL0JF76RMoIGcSV5O9GInUd6vMy7B4ag9IKnpUEiZbbobFwS1AgfUCYiVAcTvy8lL7e
         7uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740713436; x=1741318236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVVG2IwvthWW/+RBCG6i5JXoqhlYqngpobZWnBOaYI4=;
        b=C5SUdRxbmkGWopTlM4ziZo0dznLH4MEDqUSTskipS9mANGfeTf2LEWydQrvNMeSpGh
         uqPR90B7X8vOd6rf4qgJHi3CFNA/+CTWbyKrpVkfe8Zm0CNnfh1d8mF1N0MapTpgul1C
         5F8jyG3zOvs6QWX0qwRwpR7dJeJS6QLw9UI0sne3lTQWvKQkbS1zWG7zv1NPJXQoNtu/
         mkAGouot3q+Y6epNImWSZzcNHuZuww4+l9k9SrwzlBSqEmtZlGJcT3ZYI3J74X6U8cQX
         uaMf4au9Bf9oPZ2pQxHW27ovBSqNb5v88to5j0n4BT3bcCu5ccLXXkT6MZ+62nPIy8t/
         uo6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVC7Xa2WSG+G3u6Bzl9SDpscplwTHSilCPJZRJ8+BJULCFJvQ1IhfEvYsGz0oSGZNeX/b4gYO8xYuFoFKdGPPo@lists.infradead.org
X-Gm-Message-State: AOJu0YznBpepetsxj1XRMi6zoeCvTbRCljwwOorZbfDJ4QSSnoKPr4dp
	EmD8WdGINOimswrSZrqnX8use8QsrIZsEj1b3QGh6Syk89zescxGpLN85Rh7FPE=
X-Gm-Gg: ASbGncupAOmFwKNi3FdrwfFzOsF8OK8h1xTPTM5OLIHXeRfSsPYNQFFR+JEU7wlyZTf
	jjZaJ02aSqj2xuVwcWT33vMZgUveJF5xm73PGHEyrfWOFDUTP3jFvty1un8nx6cC0faArLo17wa
	xLlxCL8OKQJPIgAfnxsUVrZbKYaMuCDR+wi+5asooS/3TjDMIX0e+mEuWiGJXoAkQRkT77UdMmN
	j1tHwtR3PNb8S69Nn/ZaGAgwVTi84s9dEiGJm/gtHHBZ10xDKcNcy9jZxZRXOKE8Gn8u2wrglSH
	FanWeh2Y5re0ywqX8t0/ULhd8jW765s=
X-Google-Smtp-Source: AGHT+IEEio0A7nIEAZI3ddno0TpSgz9fND8CuYHuE1x0cFd3ArDKQjvW9X1ozId7B5F4Eo4JdE2bJw==
X-Received: by 2002:a05:622a:11d0:b0:471:eca0:113c with SMTP id d75a77b69052e-474bc0fef42mr23052141cf.42.1740713435715;
        Thu, 27 Feb 2025 19:30:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-474b7696709sm11029291cf.48.2025.02.27.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 19:30:34 -0800 (PST)
Message-ID: <25beec7ea929b624d845f5ba4abce6267974ed82.camel@ndufresne.ca>
Subject: Re: [PATCH v3 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
 dma-contig
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Mikhail Rudenko <mike.rudenko@gmail.com>, Dafna Hirschfeld	
 <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Tomasz Figa	 <tfiga@chromium.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Hans Verkuil	 <hverkuil@xs4all.nl>, Sergey
 Senozhatsky <senozhatsky@chromium.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Date: Thu, 27 Feb 2025 22:30:33 -0500
In-Reply-To: <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
References: <20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com>
	 <20250128-b4-rkisp-noncoherent-v3-1-baf39c997d2a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_193037_231314_65551A3D 
X-CRM114-Status: GOOD (  18.55  )
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

Le mardi 28 janvier 2025 =C3=A0 23:35 +0300, Mikhail Rudenko a =C3=A9crit=
=C2=A0:
> When support for V4L2_FLAG_MEMORY_NON_CONSISTENT was removed in
> commit 129134e5415d ("media: media/v4l2: remove
> V4L2_FLAG_MEMORY_NON_CONSISTENT flag"),
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions were made
> no-ops. Later, when support for V4L2_MEMORY_FLAG_NON_COHERENT was
> introduced in commit c0acf9cfeee0 ("media: videobuf2: handle
> V4L2_MEMORY_FLAG_NON_COHERENT flag"), the above functions remained
> no-ops, making cache maintenance for non-coherent dmabufs allocated
> by
> dma-contig impossible.
>=20
> Fix this by reintroducing dma_sync_sgtable_for_{cpu,device} and
> {flush,invalidate}_kernel_vmap_range calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>=20
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle
> V4L2_MEMORY_FLAG_NON_COHERENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
> =C2=A0.../media/common/videobuf2/videobuf2-dma-contig.c=C2=A0 | 22
> ++++++++++++++++++++++
> =C2=A01 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index
> bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..146d7997a0da5989fb081a6f28c
> e0641fe726e63 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,17 @@ static int
> =C2=A0vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
> =C2=A0				=C2=A0=C2=A0 enum dma_data_direction
> direction)
> =C2=A0{
> +	struct vb2_dc_buf *buf =3D dbuf->priv;
> +	struct sg_table *sgt =3D buf->dma_sgt;
> +
> +	if (!buf->non_coherent_mem)
> +		return 0;
> +
> +	if (buf->vaddr)
> +		invalidate_kernel_vmap_range(buf->vaddr, buf->size);

Am I correct that this is mostly to prevent the kernel from reading
back old data from the cache after an application or other driver did
CPU writes ? If so, can't we restrict that to DMA_TO_DEVICE and
DMA_BIDIRECTIONAL ?

As for pending kernel writes, they should have been flushed before the
buffer is made available for dequeue. And any access while a buffer is
queued is concurrent access, which is expected to have undefined
behaviour.

> +
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, buf->dma_dir);

Isn't there a link to make between buf->dma_dir and direcction before
calling this ? Also, shouldn't we use direction insead of buf->dma_dir
to possibly limit the scope ?

> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -434,6 +445,17 @@ static int
> =C2=A0vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
> =C2=A0				 enum dma_data_direction direction)
> =C2=A0{
> +	struct vb2_dc_buf *buf =3D dbuf->priv;
> +	struct sg_table *sgt =3D buf->dma_sgt;
> +
> +	if (!buf->non_coherent_mem)
> +		return 0;
> +
> +	if (buf->vaddr)
> +		flush_kernel_vmap_range(buf->vaddr, buf->size);
> +
> +	dma_sync_sgtable_for_device(buf->dev, sgt, buf->dma_dir);

Similar questions for the end_cpu_access implementation.

Nicolas

> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
>=20


