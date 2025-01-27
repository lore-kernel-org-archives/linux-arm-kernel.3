Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD5EC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj/btp7iB/WVExe7HRHgQ+HsqxBZyERYlUan4lSFhKQ=; b=22TIR+uKNyaHCt6ADF1TsXE1VD
	GVfMs1kgm7dv0vbUPVVRfFa5tbUqOFmAU2t1kBKuEvIxT63/C6XFI6cHZw1/3yPvE48K6UvfnGnPx
	ZSjuFFnn5W5h79q+m4xbxxKwlQlzjfC4KIhjBRcsZR9wtYETR736TZp4M7xL8yG1BIjhmX8wkfj/A
	g2MSiK3k0pF1H4hkkbakSelCJgyJTNqcnZX0MK81bvVy4FVyyEOTprYUstPCahFPbHbzLmZPR22pc
	oghH8b8RAoD8mHcR7kSJjiHJYtHdNpvp8ajegwk0qY0FbY8PnkFKzQ3GrEc9HbGOxMrV9zaU9hyW9
	faMwCvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNAI-00000002CrV-2kUn;
	Mon, 27 Jan 2025 11:20:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcN8z-00000002Cgk-1Gk7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 11:19:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaeef97ff02so714713166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737976743; x=1738581543; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bj/btp7iB/WVExe7HRHgQ+HsqxBZyERYlUan4lSFhKQ=;
        b=laIzELY2dWUoG017EYNzEb1aMoVnvU51EGLtxq8N+m4TZ1TdG62hNHALW7oGrxSjeC
         VuYqmqIP9djYBSKstdJjWhoZ44UwgRtg2i1vx0TstbDnRnDfSYraH85XxIuveXnO3Ww7
         tILjlgRrn9IIIVsyzdIJeAEcZofG2i8jrKf0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737976743; x=1738581543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj/btp7iB/WVExe7HRHgQ+HsqxBZyERYlUan4lSFhKQ=;
        b=tDZ4Ykej8oZPsFUxxQqJWzCYBMtNNnxoy3U+i2jRTi61rzvSzgGbZyRCjQABM5zdPP
         pSGXj3WS/QiOD1Dn0x43Qgo4FVNKOJ1EaAvxlvMB7vovdQ1nQUYOgYOBbZ4EWa5kYXou
         7ExEvzBuPBd8AvCI7lKj6LdTaoAlCrx9LVxd37mNED8fa6e/RamCWZ93yPoNlZfSvojE
         Bdm3QW+KaYqtpo7sa0dtJIW1vrWzOQMktAf1u/sEzayTyeSEZxzso03NY2Nn7ImI9tdn
         3uMNRT4x9B7DqBGjckhng4Las1eojVwSj71fvn8xXh6//2rMJlUMLTKMF22OnHX1rnDl
         zCfw==
X-Forwarded-Encrypted: i=1; AJvYcCXSl2GR4m1jv7Q6Q+QXI4T5sBvyzdHyS78fJop5jAT9Zh+X3iwFVqlLZsUZqzQF1ZGtcMvZsFZLNr70mp/hjHdi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3lfhtgbOkuBEgG1WmRiXV34XHTSIDYt/cxAqz4OnOTfAl/ebJ
	r+ae9yM0Kpq/W5wEuMDYnMJGwxn/Xsm+Ae/+63Rxc3W59eWJjS2MqZoZtl2mWh/fG8U1SNpAVCA
	=
X-Gm-Gg: ASbGnct9TcVxqBY3dP5yz8mDDCbL2UTSROQMhO4mRw9SzN6IUeQ6L+5GI1kfaAM3K8L
	1datg+e2OlnmkJfFnPTrfJ0D07IO3DmmBzcXnb2Ym4eK6rYhSHMnbSY9azVGf8WAP04JGtSNy28
	N8PFHjZ/3C3IlMo3944fpW4LXLOAII+Fuc/CFXRr0hb6nx4YmaJAckrpOBju0ZRrpRN0mo6hKxg
	0/zDmKyz+wnOivUT2t/z4FAK9hyGiqksQzsO3aDeQfz7rJiD+dt3niozqh5S/wEsV1KnKxpCZQc
	uCoJgSr0sLOu1FfO821iUV8udCkjkhh7wY5kGEXe
X-Google-Smtp-Source: AGHT+IG3WCKE046s48jkOpkOF+4YLBkj20ujsI3Dpb1w5cR19kXs9s11HYkX5lAIjtfQC6ghzGbirw==
X-Received: by 2002:a17:907:3e0f:b0:ab6:5074:f584 with SMTP id a640c23a62f3a-ab65074f8f0mr2208519966b.10.1737976742748;
        Mon, 27 Jan 2025 03:19:02 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fc50bsm563423566b.158.2025.01.27.03.19.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 03:19:01 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so8879a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 03:19:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXw25UmB2VG2Vr4Kvz5exRm6EG1L3KtlIYuu3g6dR+NCQspJWLc0foeETOjUvxpgnBhWPFS+mfjKIapXFOmpWXt@lists.infradead.org
X-Received: by 2002:a50:8a8e:0:b0:5d9:693e:346 with SMTP id
 4fb4d7f45d1cf-5dc243b84e8mr130774a12.4.1737976741062; Mon, 27 Jan 2025
 03:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com> <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
In-Reply-To: <20250115-b4-rkisp-noncoherent-v2-1-0853e1a24012@gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 27 Jan 2025 20:18:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
X-Gm-Features: AWEUYZn0_AfnNbH4PuJVO5cenPSqx6huf_K_307ofmg4I9T9Tf9BB4t2frTysv0
Message-ID: <CAAFQd5DFuw9e85X-UhVfonb5C9F0tG6xyn9RUGitKDQXifcUyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
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
X-CRM114-CacheID: sfid-20250127_031905_377863_9A6CCC8E 
X-CRM114-Status: GOOD (  25.03  )
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

On Thu, Jan 16, 2025 at 2:25=E2=80=AFAM Mikhail Rudenko <mike.rudenko@gmail=
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
> Fix this by reintroducing dma_sync_sg_for_{cpu,device} calls to
> vb2_dc_dmabuf_ops_{begin,end}_cpu_access() functions for non-coherent
> buffers.
>
> Fixes: c0acf9cfeee0 ("media: videobuf2: handle V4L2_MEMORY_FLAG_NON_COHER=
ENT flag")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 14 +++++++++++++=
+
>  1 file changed, 14 insertions(+)
>

Thanks a lot for the patch!
Sorry, for the delay. Ended up being sick with some nasty cold that
took quite a while to recover.
Please take a look at my comments inline.

> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/driv=
ers/media/common/videobuf2/videobuf2-dma-contig.c
> index bb0b7fa67b539aa73ad5ccf3c3bc318e26f8a4cb..889d6c11e15ab5cd4b4c317e8=
65f1fef92df4b66 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -427,6 +427,13 @@ static int
>  vb2_dc_dmabuf_ops_begin_cpu_access(struct dma_buf *dbuf,
>                                    enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_finish)

skip_cache_sync_on_finish shouldn't apply to this function, because
the buffer was shared with an external DMA-buf importer and we don't
know in what state it is at this point.

> +               return 0;
> +

We should also take care of the kernel mapping if it exists, because
on some platforms it may not be coherent with the userspace one -
using flush_kernel_vmap_range(). Please check how
vb2_dc_prepare()/vb2_dc_finish() do it.

> +       dma_sync_sg_for_cpu(buf->dev, sgt->sgl, sgt->nents, buf->dma_dir)=
;

We can use the dma_sync_sgtable_*() variant here so we can just pass
the entire sgt to it.

>         return 0;
>  }
>
> @@ -434,6 +441,13 @@ static int
>  vb2_dc_dmabuf_ops_end_cpu_access(struct dma_buf *dbuf,
>                                  enum dma_data_direction direction)
>  {
> +       struct vb2_dc_buf *buf =3D dbuf->priv;
> +       struct sg_table *sgt =3D buf->dma_sgt;
> +
> +       if (!buf->non_coherent_mem || buf->vb->skip_cache_sync_on_prepare=
)
> +               return 0;
> +
> +       dma_sync_sg_for_device(buf->dev, sgt->sgl, sgt->nents, buf->dma_d=
ir);
>         return 0;

Overall the same comments here as for
vb2_dc_dmabuf_ops_begin_cpu_access() +/- flush would change to
invalidate.

Best regards,
Tomasz

