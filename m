Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC85CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=; b=wWBLmgdtO2uDcTEyFutt92TA4x
	67ED3ikqXvu4PnKreF9aMrK69KQzoR4ML7OaLhEqD4dzdd/33OtLKjHOBdvz7gFNrf8J6sbI86wW/
	Zi9ABYqfWnTqKKXUo5Uu028CaA19+Hox4WtHr0u7sM3sD+LqA0nLoAjUCHVetcCKo+fBUY4sSEC9b
	xHD78taYJ01h1PVxZIFgjcYTkbDHihcfuQeAIHVG1bXcYTFJmKk8PDs4YNktTTvwLaaGQY8Scsbp6
	92qtWWWaVhU9jD0pJsPYhtaQcjp1o2PRebI1LrNfDXvF5UUnG/rJi6z2ovRJpTdqCCcExLhpYpVSV
	nXbaosoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbX9-00000001Qln-0VWP;
	Thu, 11 Sep 2025 07:15:55 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbX7-00000001QkZ-0A3i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 07:15:54 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso731646a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757574951; x=1758179751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
        b=sxBBd2DUF6CBMm3ghdYQkCdI8jOPD/IsaW5PBJ6oZxMzpW9d0xLOp43MIMzIpC5ca6
         B51sYUvgT6SzzhAKQY/eOn3cdkStWNYiOtrBPqFnnAkatHVMqL4DtPr2YtdiZRltHTKb
         VFTDOYkfPylQZ/YsPc9MRiRaXMhWVLPlMK3jNuJTcERbRH5/2Qe3zejQFr7ZzPZ1bw/S
         ry0K6s8swXcKHWL/91GDQEt8/sqMznBZZmGk2XbNwLqQ/Z01tEzPPjz1aNr+rS8piieX
         mFZzyf735Ru4sf7KKqYivpMAcGDzAQGqF3BrsHxf4BNF1zjaFWAMF3pPb/xxJu5mHs6g
         eSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757574951; x=1758179751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP9NntJ30KfEYObDqnhrL+C6H0K6PogP4x/qLVkNDh8=;
        b=JGyQngXTmPBmtQyXqNR9K2phj2CmMJ2cBh9rqwPwxJXlsceN2HKp1sC27aCA/gtdGA
         5lrhjTKEm5/zfXCcd43M1hkFEUt/lAW41bDLpeNLDImMDBUqfD7LmlRlRVzgYzJBsbY6
         7A6vgJMKN3C5aNCLwckRGZlR36IV+YSwyL+7hEFC1YhP4UD8QT1ckJ7jL6jmu6hrb2bq
         vum1oSAEbmPgiQqKKvBupp+fJKiahjnwxC9mLAc8bYOMgdnfvOhXtVlep7DPf3wo612E
         2h7eHDipKW91WHpCbfcci7cdas6LUEGwc7T9MX4+M/ZlYev2bxWWjgqSHbNlc5CBH9OE
         RmKw==
X-Forwarded-Encrypted: i=1; AJvYcCW5OufBnl1JhxGnEUlJcJt3eG+7gCt8Ea6oxX/JBwQuRLOtsRxHvCOEIz3tNmRZy1Gm2/OE+IuSMEVpXrG6JWTd@lists.infradead.org
X-Gm-Message-State: AOJu0YxeZPyDNcGt2pzi06kBMZZQXO/ZNIIL6c44xKluhHt/rftoCcI3
	Q1gu2g5lzx8BJ3kge0wggadz98O5bLC7rmEXS5t7VwVAMkK9tOvN7b/dWKWbYU3OYfE5KPBr18j
	/bMxK8Mer0xmXRfxsl+3Zb5r3c6JJMKMVrXcYdyE83Q==
X-Gm-Gg: ASbGncsbIjx5Y2CX6jfhVthgC+hxVQxUC19S3Du6QoQpm3CsrNVM+CuebZOetz6k7zj
	uWmvbm1Jf7qPmcvvX30y6EHydL2hIoDW4k3/y+gfkpkiGOqHZPPZZb1WXvbeEwip2qbvUGJQ3C0
	cSl/hGTHy0n9kIMHyQSLAVbbhY2GK3JTX4Z+/Fgwi11xpDgMD1S/EZJATxUoqhI3QEMuq2SNTsS
	L1XLAlwmNn8pavU4tGAGfqWDhyPWpfFTGaSjWg=
X-Google-Smtp-Source: AGHT+IHy2Mv7dBIklAlXQ3z1llA5qfh3QOZdDcp9k/xtxjZUz/DCzy7vfzzhI0hlOYW8883NeAHTA7AVAmb3DRGTR8w=
X-Received: by 2002:a17:906:730e:b0:b04:6546:345a with SMTP id
 a640c23a62f3a-b04b16c733fmr1789866766b.52.1757574950692; Thu, 11 Sep 2025
 00:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org> <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
In-Reply-To: <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 11 Sep 2025 12:45:39 +0530
X-Gm-Features: Ac12FXy7pNPcf0b_CAub_P3Nk83sbsucFa_59lr_vcagvKGZnRZhFr4eESPBY3M
Message-ID: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
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
X-CRM114-CacheID: sfid-20250911_001553_107230_470F3F1E 
X-CRM114-Status: GOOD (  21.97  )
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

Hello Jens,

On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> >
> > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secur=
e
> > > DMA heaps with it.
Thank you for the series.

Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for thes=
e?

With that change, please feel free to use my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> >
> > Can we get an ack from DMAbuf maintainers here? With that we should be
> > able to queue this patch-set for linux-next targetting the 6.18 merge
> > window.
> >
> > -Sumit
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
>
> Sorry I haven't been able to participate much upstream lately.
> >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_get_name);
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL(dma_heap_add);
> > >
> > >  static char *dma_heap_devnode(const struct device *dev, umode_t *mod=
e)
> > >  {
> > > --
> > > 2.43.0
> > >

Best,
Sumit.

