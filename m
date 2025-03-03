Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB30C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFHt+0PcUrjf2KPzth13ahqz68xbUj7oThx+bYUbytM=; b=KhyjR4fqsizgJ8ySi24AGfoDiE
	D/YDNZ3CJJr5lUvS7+XRVn/FCO07z8I+JGdI/DtDBWDnG9wCjihEdEzVt+3pv2DpZ9YLFIN45/BPj
	s+OSobjHhvK1z0IZGyP/XRgkROdi+TROb/nqldiYPAWsxKPs9JkXVDOa/FrG117m9aRkVnKKke+OK
	pGXqYFgGrRJDwOnhUa55EQk/ie9LSa3neP2BmT6zn+k1ToXk31GYAmKMTA7zkDGLJ5jbX5TI/5AO7
	sJIBQ/5JfO7J65R4LhdQT4+DSTDsNxI32nKbPuiRFh9dED4Ih2MxtjUNXLGXdhfvc66d2m8d2PFbd
	Q34e5bfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp8JI-00000001QwR-1JLo;
	Mon, 03 Mar 2025 16:06:28 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7el-00000001Iki-3jDB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 15:24:38 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c0a974d433so520657985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 07:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1741015474; x=1741620274; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WFHt+0PcUrjf2KPzth13ahqz68xbUj7oThx+bYUbytM=;
        b=Rj2M+9WiAQ1RuI9gAuevVL0OijeaDzKgLsVqhknGCM0cXSwQVGJroSGPj4izGDI803
         bfYXFMCxL+4DNRYuNafBaiIkz2+AbV2pgGACs0sxLhCWL61WwCxw2yCfwFZSIFNyzD+T
         b4qnmLcdQtSnP5UljUnSNiXOlYKzUHmuWCwdbA3i5rcDp5ZBWK4f5X/V4RnK4PTMFOir
         xYMFdCMyjMmaV5Y8YtvaTdC27T7I1tjw18Mzo23QZL1tHFaEj1KhwJHjthwZFLctgQpu
         xR2Zb+75HON2dcM//5GbuE4WY4mzjK/Gb3rdIPYMATqrccNgk564zWCFHobjK3OCq63D
         kyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741015474; x=1741620274;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WFHt+0PcUrjf2KPzth13ahqz68xbUj7oThx+bYUbytM=;
        b=CRew/w1rno6VIF+iWTUk5iho2PFy1oy5jhYsMbnrRrS7bSqOg6xtc1Wns+i/LXF9gO
         MAIex/qQ90A+upq8BxRAajmmEVx8Sx2a48R1dRdx5NP887+iUqSZNKjApkWwesyeoRcI
         H4xZ0Lxx7ecfBmUZkQiTg1bnyrSF1TK1ZQ03o3OLNkNjUdx6KnVnD8Ol8qTefaiQUhrq
         LORjB5DE50RgjyMNg0dwLVlrbzTEnzfvhxxdovinFrtQ1voPFO+OeBnxhzWQGcNOqO/c
         0pUDzfT1nlZMEdBs5fdniKCm+IJck9YBTHnJz5qWm5uNMQKn0pCXsSQqrFTv5ZrsegBl
         932Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/iNuU7/OhY/X9PwNIS2qx5egKu9m0/MquLzCLsvKwqYo1oypFqOndkSj82rEiRdXCo2xRiYoyQKiLEWeAuMTL@lists.infradead.org
X-Gm-Message-State: AOJu0YyFq6K3u7RvrpTW/HbhNTHGm3FCGZDULytCw2YLQLTJ+D1N6Lfy
	k6vsDCEmndbl49KOlmd7dg1xfTZx3xHCnBVoA5Q1WUvicKn9NUzQ4bSjS102Q6c=
X-Gm-Gg: ASbGncuwHKkQj2fEi6lxnqVgQ8r9omiJdZAYxdxF9GnIBZo41UBMfUawG2C2fvBob6C
	05LJ2RErKLymf792qCNgONlLv00FNgG1MJyUtquH27+kK728u4hMEO84zDmNXvB++ZNTle0LR5l
	iMpA4YuiMuauxa7SS1+wJsbBN9cK7dKVJvxyLl0h79yQP2HWWO+ECAlbSFX+Ql/ov6a/N5/g5m0
	Pih3uFJ8azvSHPoAfuY6e79hUSqlG3M66f7qBho7lQ3X7jcu9qsNqKM8NNw0ZirW7+xT0hn1KDn
	rvI+WAzcd8LOla1TqN3UCjXJ/MI524wtK7tizAEJAIu4qgqYMw==
X-Google-Smtp-Source: AGHT+IFfnYkxtmeyMx4cbVUhHoEgj8vIHk0FHdrXdCz4obVUHVFmEQgHCvy9FSBCGdXes2aYUVuO3Q==
X-Received: by 2002:a05:620a:f06:b0:7bc:de68:e932 with SMTP id af79cd13be357-7c2a7632d54mr2279290185a.23.1741015473845;
        Mon, 03 Mar 2025 07:24:33 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3c89408efsm27440485a.114.2025.03.03.07.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:24:33 -0800 (PST)
Message-ID: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in
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
Date: Mon, 03 Mar 2025 10:24:32 -0500
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
	 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_072437_005113_EE752B5B 
X-CRM114-Status: GOOD (  20.56  )
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

Hi Mikhail,

Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit=C2=
=A0:
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
> a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
> bc888a84a95d5 100644
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

What would make me a lot more confortable with this change is if you
enable kernel mappings for one test. This will ensure you cover the
call to "invalidate" in your testing. I'd like to know about the
performance impact. With this implementation it should be identical to
the VB2 one.

What I was trying to say in previous comments, is that my impression is
that we can skip this for CPU read access, since we don't guaranty
concurrent access anyway. Both address space can keep their cache in
that case. Though, I see RKISP does not use kernel mapping plus I'm not
reporting a bug, but checking if we should leave a comment for possible
users of kernel mapping in the future ?

> +
> +	dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
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
> +	dma_sync_sgtable_for_device(buf->dev, sgt, direction);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
>=20


