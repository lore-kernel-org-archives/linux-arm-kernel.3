Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8D3C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXA/TkGXM5NxtIFR0Rkc5MLIvPVEhtWeAVEIdjIqSAA=; b=ebcHQOp7qP90QgG2CTl5EjEODJ
	65AHTlbeMBVdlJ3ABmZnqOkP8X3Pg9gwMpL03vMU+9QeX2NUWXqounUZfgd3yG8+zWQbWGmcsnSid
	MmkB4zeoZLsb9BR/mpRk4dE+5BCQjyAzzRoRt9/xAquEnJzmUZM8WziIB2xWtiS8LJmMHJvFMX30p
	2aKTmfp/w3CWL4BeCm9MRz672qtR4TkCjOnAjOaxwtJq5SOCnyAEh0RE0fYHmvJRaAU5A+1XCuzBU
	jfaOCnsQIsRE4pm+qtjG4OvEvbi+CRKktbXgjOCQ1Kd7ck7VD84OjQMFatr3Pl4jBfGfY+bbg1ZfO
	tTuMRb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjti-00000007Ka8-3rKy;
	Wed, 05 Mar 2025 08:14:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpjs7-00000007KML-3Zg9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:12:57 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ab744d5e567so101069366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741162372; x=1741767172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXA/TkGXM5NxtIFR0Rkc5MLIvPVEhtWeAVEIdjIqSAA=;
        b=R+b4FPUErJfeNz44iurBn3sjSXcg7trKClYGNpi+kCar+mxu651Sd03TtKlG45MLN4
         PnSEhlk7ZuboMR5R6eTwNOPmTXAt76PdXC1DpfBdrMeEbPjaaGgz5Sq7Xi7QCtqWlloa
         K5hwJR/ddLFe6aEcES0NnMYbdPV+pqu9z7Vyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741162372; x=1741767172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXA/TkGXM5NxtIFR0Rkc5MLIvPVEhtWeAVEIdjIqSAA=;
        b=St4OwNb/uLN+Qwy41Z4Xc5idGfUX98YkZkIC7W7AnTK6rDtne8x3zRhG6roz4x1O0X
         XO8MqOTnzWTtNbdPjOM4nmIBC1k/J+NrhEZlZy/dD4JbU07lHZwZFyw6rbhq2Hey0etC
         PiUFK+CeUweeYdzcXmoZ9H7i2CSWVc2oDpFZsreqCDeLUluWREgbVkElWRfRMyh9lPj8
         Z+PoIJVFj9MpBENiDzvXfFI7BFBWq/IgXt/K8IvqaARCmwumjmtv7ASh4RFlO8CLIurX
         UzjrXUgsH/jsQpd52O+P+a7zrLIWpzevzYkAMYjXHjnIOLjoFwpYsYBXfdbH64ZSkGoD
         aGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgBSqNnMf8ES0iGRxaRvXBWgeVrvtICW1ird+bqGd2U6ds1xp/AUYmnwqovyebH942EsDR66UCj0LBqPA+Ztgj@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi4Bjvt/zxanb2b0mavEiZ9eDJeccnAcAo+aL2PIhkNc40OULu
	lIHCLbuQvEUS9wmRDNHq41MsyPE+odVF+mgBSIqMuFJhtKJ0+3qu9i/SUwJ5HcupfC/kFIVfD+/
	qRw==
X-Gm-Gg: ASbGncv1d7Baq+dGnf0s84UQNadzLZOZ1BUTlCmZwl/YDXpBZjBEHnI+OLMgI2pYMu6
	WH+g18+hGQMBc3CUsMfHtJb1UsfzeBh6+zgdcTstj+GpwVM3PRS+rLOU1AO/KSFUhJpXBtyfn1I
	8WnqZD30DQryvrZAjUH8Yi/Rvi3umJG30y4mpIGW7AJJDM9wiPIt47db8XRo/Fj15c7Cg6tzc8Q
	843vLeZyfSPTzSSd9kZj3cvtqfHs/7NSaxgy+qxatDamBuPSuqYXUcArmFaHzvBjBA/gb7KeiWD
	yXo1gW3Uhx1hxNLKQeximB9vouF5KXRtRWAFKq6e1FEPWK7QVfrThM2+PZ3n15HgVS/dS1L3WoQ
	7TRCp
X-Google-Smtp-Source: AGHT+IEXR2+V53DwZbNYPDNknlYtdimsTOVykRy8EPl+JrdhQk3bHoOUd9FAAnpKDELa62ay9WUqiQ==
X-Received: by 2002:a17:906:7955:b0:abf:24f8:cc1e with SMTP id a640c23a62f3a-ac1f0e61fc1mr575009466b.2.1741162372520;
        Wed, 05 Mar 2025 00:12:52 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf42c16af2sm825394366b.116.2025.03.05.00.12.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:12:50 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so7229a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhxmmerpP/3bqF0evv2dHQf+miyMV6VkZk4XjHi7ztWgQcrW0foG5lJK5i1l9JNhdgX9jr+lsJefZHygtp7E+h@lists.infradead.org
X-Received: by 2002:a05:6402:682:b0:5e0:8003:67a7 with SMTP id
 4fb4d7f45d1cf-5e59f582d2bmr77034a12.0.1741162370247; Wed, 05 Mar 2025
 00:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
 <20250303-b4-rkisp-noncoherent-v4-1-e32e843fb6ef@gmail.com> <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
In-Reply-To: <8b3dac7baed1de9542452547454c53188c384391.camel@ndufresne.ca>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 5 Mar 2025 17:12:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CMsgjs9t3Lp-r3rqHG1dFJV5bFEFciWmKU+vq=TtAOvA@mail.gmail.com>
X-Gm-Features: AQ5f1JqMbRJjwTyn4eHWZnhmp3yyPL8Rgkfmk3Wh029t14UkPKDmnySUbUDhBgc
Message-ID: <CAAFQd5CMsgjs9t3Lp-r3rqHG1dFJV5bFEFciWmKU+vq=TtAOvA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
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
X-CRM114-CacheID: sfid-20250305_001255_918092_939A001A 
X-CRM114-Status: GOOD (  33.53  )
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

On Tue, Mar 4, 2025 at 12:24=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Mikhail,
>
> Le lundi 03 mars 2025 =C3=A0 14:40 +0300, Mikhail Rudenko a =C3=A9crit :
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
> > a13ec569c82f6da2d977222b94af32e74c6c6c82..d41095fe5bd21faf815d6b035d7
> > bc888a84a95d5 100644
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
> What would make me a lot more confortable with this change is if you
> enable kernel mappings for one test. This will ensure you cover the
> call to "invalidate" in your testing. I'd like to know about the
> performance impact. With this implementation it should be identical to
> the VB2 one.

I agree that it would be good to test that path as well. I wonder if
we could somehow do it with one of the vi* drivers...

>
> What I was trying to say in previous comments, is that my impression is
> that we can skip this for CPU read access, since we don't guaranty
> concurrent access anyway. Both address space can keep their cache in
> that case. Though, I see RKISP does not use kernel mapping plus I'm not
> reporting a bug, but checking if we should leave a comment for possible
> users of kernel mapping in the future ?

We can't skip it for CPU read access, because it may be the first read
after the DMA writing to the buffer, so we need to invalidate the
caches.

That said, on majority of systems this will be a no-op, because it
only applies to VIVT and VIPT aliasing caches + only when the kernel
mapping is actually used (the buf->vaddr mapping is created on
demand).

>
> > +
> > +     dma_sync_sgtable_for_cpu(buf->dev, sgt, direction);
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
> > +     dma_sync_sgtable_for_device(buf->dev, sgt, direction);
> > +
> >       return 0;
> >  }
> >
> >
>

