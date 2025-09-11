Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140D5CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3kQgAiwPfvEAAOGUV7iUTri/K2HtvbKjHs1xtQRX0U=; b=SXS86LS4juNvZ1IQi7GhFHrNEo
	pa3AR8Dq1RYVprdCbyPwipxetXa28a8i4luYJK9cvdtfYwJ8k19flIEpxURp9EMSQpX473CFohyKq
	x+vQoChqp8fnLRWl1MULpfypErBCsQj4FZpiQrcfVqKVYeK9nQRbUa7KxFMj+pYO8hRJHf0aKrsyR
	r5ynpmfjWuvcxa7HHxH0W4oNS7TXVYjpWfNjPWCemWABI5PgrJgGRZPrUtREgI/EYmVS+X3GAHgWo
	GppA566vnFLmGDDrzAM6vq/G/WVbBGDnDPIfCSC1I6IdrEgYnlOKIQcU+7WPhsHOoSwBrSJEExpMW
	nETUApzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwclp-00000001qsp-3Fdg;
	Thu, 11 Sep 2025 08:35:09 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwclo-00000001qrk-01th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:35:09 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-746dae5ff93so518146a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757579707; x=1758184507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3kQgAiwPfvEAAOGUV7iUTri/K2HtvbKjHs1xtQRX0U=;
        b=AVFY1f8Di7FtnjyXmVB+bSG8SyXNbWYlge8zrheEYA5t5bm3/98ADblG2LXpk/Eo8h
         QN3gD4eBvlNSEMcG5I5EOF/7TRJSaubduzo+42ZWPJvak/bwxlskmBZEfnpv57ybv8Tj
         0AnTVZAj/aivAZiYErW/GvztPEwRVpSNii6gZ9KKMTKd+R+Z+0U/VWiNfEQ6lvpyoM8J
         ceppdL64FcZPovGs2vywvQdbZ7Y9sjmfhl+ZwwS65Ewi3dsD3pLhJ9ErTcZgaRjDaJPR
         Th/l9q61krCZ9WiVincV6AHTUrW8LTpBan9q5R160QWUg7hNzC5FGI7tHYfqNVkdK5Zd
         4DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579707; x=1758184507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3kQgAiwPfvEAAOGUV7iUTri/K2HtvbKjHs1xtQRX0U=;
        b=Vorzg3VBQtrSe4mqGsKT0svKmWe/LqsKgnZecFOki/YckUp7XALrkNEpB473DKX+4T
         gcrZB6R4Tb17WGg8ym1tw09NWLY2cmi7PWTKs33YU+BL8g2NexX+j0k1z8ze9k85kZ2C
         En2UYsHshnnyfw/Um8QzhvOYmO+8ftOoCrL5wrFMEpa2ENEpwOD5qsK9FDyYnbYRZpm4
         NzhRWNZNqQbK+J4fjRfdzOf2Zv3IU5gmXJ0WbxUptK/Niugjqsrb7WRJus0WSyK5g3bY
         wfHbHMQHU0IDuPqfmGSUrmwDFy96ndjBCAsQ3D+chpaPrAMQMZO2CeUugAAnYDBQBvx1
         YXPw==
X-Forwarded-Encrypted: i=1; AJvYcCUv6E0n8rn1S0DQlXPMlcczA09wyPD79vG4TcZmZbHvWt2Hc6Vody+zMAhviRKT+XyLyPIE31ua2cIV8r12QVoL@lists.infradead.org
X-Gm-Message-State: AOJu0YxQNup4pxGcLuxLRVCBq7/otPumQDFwbXpzRL5ftmjsZjxAMT9f
	9fdJca4AcUnod+/fKYgPBuvjvGGKAnu+g7ZcCUYLtNbp1S7UguEVqZjk9YcDeKMMoL2BdZQb7Cz
	xyN84AXMAf2quEGKW4FwO5CR8OmZtiSxam5tJHNBpcg==
X-Gm-Gg: ASbGnctIFS9DUDjY+K6cBKOOTWJNK067sSkOf+UrLJ6si4XMHR/bVJSL8WLDoS+Hf8E
	kGxtmYpqk3CCqHtHLH5l5BIpQ2JgK+5s/JjTlZaSxD1RKPAU0k82YDsyoEbKU7UsKqPOvBcQUzq
	tCMPgSAq/KXd59IaFHLgglV7y422nYVB2JBbQqGDuj4ct0eOZSp0CF7qMWzmf06Lvh3Os697hnc
	acWY/Fg3Lqfi39GdtQ=
X-Google-Smtp-Source: AGHT+IFeh9GhwJV0/BRbDqXK1301VOv+yaAADE4wRS2wEzztzMHQXFq1Ue2WE8k5BTs1i0e0aU2GdBSeES8eqZ6R/tc=
X-Received: by 2002:a05:6830:348e:b0:74b:3422:f33d with SMTP id
 46e09a7af769-74c66acfea9mr10389569a34.0.1757579706886; Thu, 11 Sep 2025
 01:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
 <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
 <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com> <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
In-Reply-To: <CAO_48GE=FHaNzybUxjY=igyOO1oasKb9yu_yAjJEdjTQXicaJA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 10:34:53 +0200
X-Gm-Features: Ac12FXx5ebSInGSvpsrj2pSWY8lp7qtZdsTImt4o0DLikSjOCGD4PzhkPWZzq-g
Message-ID: <CAHUa44HkMNO1ONTGEKHCPXRQwg3zqYf5ZHmxEijW==vbmd1LFw@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_013508_068232_0F709561 
X-CRM114-Status: GOOD (  31.69  )
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

Hi,

On Thu, Sep 11, 2025 at 10:00=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.=
org> wrote:
>
> Hi Jens,
>
> On Thu, 11 Sept 2025 at 13:20, Jens Wiklander <jens.wiklander@linaro.org>=
 wrote:
> >
> > Hi Sumit,
> >
> > On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@lina=
ro.org> wrote:
> > >
> > > Hello Jens,
> > >
> > > On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wro=
te:
> > > >
> > > > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@ker=
nel.org> wrote:
> > > > >
> > > > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > > > Export the dma-buf heap functions to allow them to be used by t=
he OP-TEE
> > > > > > driver. The OP-TEE driver wants to register and manage specific=
 secure
> > > > > > DMA heaps with it.
> > > Thank you for the series.
> > >
> > > Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL fo=
r these?
> >
> > Sure, what namespace do you want in the argument for
> > EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?
>
> I think "DMA_BUF_HEAP" may be better?

I'll use that.

Thanks,
Jens

> >
> > >
> > > With that change, please feel free to use my
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> >
> > Thanks,
> > Jens
> >
> > > > > >
> > > > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > >
> > > > > Can we get an ack from DMAbuf maintainers here? With that we shou=
ld be
> > > > > able to queue this patch-set for linux-next targetting the 6.18 m=
erge
> > > > > window.
> > > > >
> > > > > -Sumit
> > > >
> > > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > > >
> > > > Sorry I haven't been able to participate much upstream lately.
> > > > >
> > > > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-h=
eap.c
> > > > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > > > --- a/drivers/dma-buf/dma-heap.c
> > > > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap =
*heap)
> > > > > >  {
> > > > > >       return heap->priv;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > > > >
> > > > > >  /**
> > > > > >   * dma_heap_get_name - get heap name
> > > > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_he=
ap *heap)
> > > > > >  {
> > > > > >       return heap->name;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > > > >
> > > > > >  /**
> > > > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct =
dma_heap_export_info *exp_info)
> > > > > >       kfree(heap);
> > > > > >       return err_ret;
> > > > > >  }
> > > > > > +EXPORT_SYMBOL(dma_heap_add);
> > > > > >
> > > > > >  static char *dma_heap_devnode(const struct device *dev, umode_=
t *mode)
> > > > > >  {
> > > > > > --
> > > > > > 2.43.0
> > > > > >
> > >
> > > Best,
> > > Sumit.
>
>
>
> --
> Thanks and regards,
>
> Sumit Semwal (he / him)
> Senior Tech Lead - Android, Platforms and Virtualisation
> Linaro.org =E2=94=82 Arm Solutions at Light Speed

