Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB93CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=; b=jakX71OaawLMiUsE+JiytazlZC
	WZWzqjH4gma2QjKZwLQfxqNfxQiI/RpICWTxyUwRtsKWUlKMXLHUZMWkR/wcWi3lEh9vywd9TatpQ
	N9cXNhgShh1LhF19m/eBcEfbxyaGGBOIx4i8O2cPfFSkbO1aMU+tjjNyRAf00BRPS1+zjiruYo+ej
	uZTQTsfybBId37wpGUfD2+Yd1IPr0BBgskveplNqXySuWUJ/QcJ3q0Lx1AeG1aWUbPQFQA5RaF3Ds
	bw0MK8BlHRJKScB9+xqorCVWE30CNlp4b+57uY+PF8Uv4rL157pstqGhMmYogNL/LtiVfIC1DEg/K
	rUx8LU7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4IsP-0000000AUVW-34ip;
	Thu, 02 Oct 2025 12:57:41 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4IsM-0000000AUUx-44pK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 12:57:40 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-43f8911522cso1290543b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 05:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759409858; x=1760014658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
        b=cBIbvxfFmjllINiELFrufj/bOmzZGBj0PSbXhPAMPEQK/H22BqicZ1vCYKKwkDYIdM
         N8A/6hc4oTrqRECEyfyToZfXKgeTQTfHd0WTfUrevt2Ki7VdsVQL2EKOr6paakruHc77
         OJ6vUxlgSGRIBouYozti8SJ/CtPzJuRJ6wm91e9Q61VY0QqiB3XtV/pvdjfCk5bfSkE9
         aPllKAOUYXoyy27rPkbgZJq66Z7tq5fWwTI0UWPQ6F7g4gcxB8Kdi8h0vxs45pK2pwPA
         gZAlTJV6wg8Yyuj3c3PTSTKtdlIi4b8fNPxrSwdG3MEDXyFpEKnXScFnjncITSvMhCTI
         jU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409858; x=1760014658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZ9DvIz4r5smSG4dSA4CIzbwRw8riJPhilOOGaBUqN0=;
        b=Nj6ANTxApXdz4ZAP5yixUkxUNvvJE9MWEgdMQiBVW33nFv3v0+DdIS5z+JvvQp10ja
         l2iCwoOVmv31HdE7/bQYBAVUl3xD+qz0egjMx4m6MgWlwBT7HMV/OClQr0PpCbJklsup
         moQZBzZjSz+YK0bHYGwAOZestRqm4H9LqydmZa+oVzs8LAHVpjJUUFj8eluV90DFYE1B
         eOLncxADcD1Mxgy3KlgeXAxm1CXuXnWGBPykf3jjgiB5H/vCuYd5B9yUdkdal6yjL8y+
         78e7ZXR9ROkMswX4AOUA2DIP3S3Bd1JyOyHy/OYB081jsC0fU+g/YWkbV9LrfqL3WAg9
         epNg==
X-Forwarded-Encrypted: i=1; AJvYcCVa2rB0B/2uPot+Yb7C6yyiSKhlVVXiBNATkxD5ceGCIbKYnSqrdQ3bK3IUwwmicVtxkieIv/kGBZzmg/YTwjFR@lists.infradead.org
X-Gm-Message-State: AOJu0YzVIf12DCZQ7ImlnjtT+m+JHv/8c5z6DW99V3ql97AmpjcWQDxN
	qIwGP7IKTXSDaFoI7nv+uT9jJzcB0xqaN2weQkr7FWNcLUPYdciwJogGayEVKGcq+rv9pcmQf7J
	RqCydF5xHDQgiKhjTGKRMR1+aZKMtkNAq6j8Z23yb4g==
X-Gm-Gg: ASbGncvyeSEkpxpN/x8LjvUk3JxUkIb5mnb7xvTXjdXbG+97wKevnm9qDbD9xMTmADR
	Obh54K3K57Fr+QT6RUc5CuC8O3TNXIyWzQ2b2dW3ObKiJqrkdqGqoAAbI1YehEK2/JpbFk2lePK
	/8T2aBVc9tcHIYpxaGieufC6WOPu43j3MmJvs2qo5P1OsX2IuGEEiNJMmiinoxFoVU15TMEGsy+
	/lPOxzdAYcDHBbi7Dhx3Za8NfmohAiMYBAu
X-Google-Smtp-Source: AGHT+IHYX7pg60feCJITkUMOxMprgz6P5nDIrUPJazgK/QAWeqrWOagX4EH5hYzH12fx7NdLiTURGQeRt8nyhXDnw20=
X-Received: by 2002:a05:6808:2385:b0:438:23ad:5dbc with SMTP id
 5614622812f47-43fb15cb75cmr1662193b6e.20.1759409857632; Thu, 02 Oct 2025
 05:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-4-jens.wiklander@linaro.org> <20251002-sceptical-goose-of-fame-7b33d6@houat>
In-Reply-To: <20251002-sceptical-goose-of-fame-7b33d6@houat>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 2 Oct 2025 14:57:25 +0200
X-Gm-Features: AS18NWB-MzLg3sZZl_om3Nb3U3T2KFc8NTfBmABGN9BozXUUDdedKeLjWJJE67A
Message-ID: <CAHUa44H3nGgY9q68YRRp5A7Q6Ku3P_URuv+L7H8chYzLAKd8mQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/9] tee: implement protected DMA-heap
To: Maxime Ripard <mripard@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_055739_014591_02700BFB 
X-CRM114-Status: GOOD (  18.30  )
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

On Thu, Oct 2, 2025 at 9:54=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
>
> On Thu, Sep 11, 2025 at 03:49:44PM +0200, Jens Wiklander wrote:
> > +static const char *heap_id_2_name(enum tee_dma_heap_id id)
> > +{
> > +     switch (id) {
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_PLAY:
> > +             return "protected,secure-video";
> > +     case TEE_DMA_HEAP_TRUSTED_UI:
> > +             return "protected,trusted-ui";
> > +     case TEE_DMA_HEAP_SECURE_VIDEO_RECORD:
> > +             return "protected,secure-video-record";
> > +     default:
> > +             return NULL;
> > +     }
> > +}
>
> We've recently agreed on a naming guideline (even though it's not merged =
yet)
>
> https://lore.kernel.org/r/20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0d=
fd@kernel.org

I wasn't aware of that (or had forgotten it), but during the revisions
of this patch set, we changed to use "protected".

>
> Secure and trusted should be defined I guess, because secure and
> protected at least seem redundant to me.

Depending on the use case, the protected buffer is only accessible to
a specific set of devices. This is typically configured by the TEE
firmware based on which heap we're using. To distinguish between the
different heaps, I've simply added the name of the use case after the
comma. So the name of the heap for the Trusted-UI use case is
"protected,trusted-ui". What would a heap called "protected,ui"
represent? Protected buffers for a UI use case? What kind of UI use
case? If the name of the heap is too generic, it might cover more than
one use case with conflicting requirements for which devices should be
able to access the protected memory.

Thanks,
Jens

