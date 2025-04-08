Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64240C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=; b=bOpYVl6Rvj99/wLXc4zXNr6XE8
	oMtlH9OogEM7+PrnPBgvMsFAkfI7ve7iTcT1yE1fnxqiJNO99Jz3aFaz4qUc6Bi3HgMXr2heAbZ65
	ywpFk3tREoIy8vcMGpAnHd2Ddp2JoTin0822eujw2P0hJVzp9a27+kw2JFDlTcMpLhRpf1uW+ONI4
	+U4Ne4DGNpr3K26nYzkAFLLYWzegh0C/y1Mpjk3LpH/AD9q3UtuwAJ20xjLqU43/HgqLNpcDhYUqp
	yAgfogC1Sa1fvBHly0hR/yoHM3g9tPN7JXKD7hAJJYT1GTyRwKJvtak+AqhE707/pCKoLK/PdrmKW
	c4LBD2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QI-00000004HJe-0NwW;
	Tue, 08 Apr 2025 13:55:30 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u290d-00000004ClN-2gmT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:29:02 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-2c1caacc1f7so3338900fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118938; x=1744723738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=TyyOmNXhawXOCXGyfIUKuNdHONFhrn0zyTTrQxbQ1sFCUClA3nTgYe96AVvfuxp8Rt
         SDZTnv2SRXPrwiw4l4XZlRMNtzlyhJixxtYocAX0tipD9pLwM7AnaXts16GLCGnGTiQO
         wgJS57zPsiDutX7v1wR9pkRQz9uOuigobe4TEMzCGyRnRL9Ndi9iTrgq5lseSqig8b0Q
         o9KcI+KRVBLhf61+olMsG1oArdQxzYw9QIwuIIpm1XUrZrtoivPfeFNziBpElrrq5C90
         kTiHtlzBZxtCsK7p48XABaKzcCObrNKdb0aJIUNCyWgJIPg7pypj3SuR1XH588SSjTel
         fAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118938; x=1744723738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=s7un9KZxqjmYWWQ5aTbNESVeb3Noip3AvIRJixrfnGSU3GPo+qTwma8lFp8qE4JIRe
         v3SScAXfgWy8ScJNWyEBESnHwjf6/wy+tjtyxEk/rlhzjH34gM6DVD0HqtHYcv0+eVpK
         iWJwX3C+nbbdE4feC96y3n48WmFIWkclZ+zO19NoZFOAEHDZE9foDiqLtFeSlOYfYQHZ
         WbKpFa2KHCwsVULuQsid2mLT7ZzOhekmCVxEaGmQHQP36AmyGBG/6L9Uzic8xp6aTnJP
         kKaEQH0KQxefVtB4SpE39obO17nM90+6HIOZ68OlY7fy77vhzEXPbJmlKSHFrC5q3tDC
         OkFA==
X-Forwarded-Encrypted: i=1; AJvYcCWNhRnLaFePUV2cPzwV2/bm8NEsr9JRxbE9zWlWaROmeptNIRnKvZRNSQY10OLBufr8/7kVaWB4KT2B84CBxY1b@lists.infradead.org
X-Gm-Message-State: AOJu0YxzQrwiKceqjHvm1rgVC8FIQ+tfwbj81prXBWmhclIouC6mFwB2
	lont3mnfCqARDoQ+vJTcpiipE+2fuy3BwM3tnYWB6AhgFIEZA2qLdWxoRxzduX4+zgbFV9HFkeL
	fvY7Oa2EJF6pvp2jhGGw+OzqE+tFhZHbEn4Gkwg==
X-Gm-Gg: ASbGncv0M70miHX7IvaH3c9H/WgDzrh2LJUhNsII2FgBmZb1Vdiq7JXP4/ryPveNiPw
	i6XrrHD8gw0GRo3Vf31s2aanL7djztLOtYdnJXu60agTEV0kEZ+vRzYXM9qbYS6ntoK9pnQS1hb
	wShksLGZ1GTO8YalD9N/OsVp98joc=
X-Google-Smtp-Source: AGHT+IHAG/ejTbg5vA3Vos54fD/tOWqlevkuF4IcqFNjsV/ID7Wtar2qRZ5cZm99uR1FeZB4/PY/aA5SmWOjkV3d+8Q=
X-Received: by 2002:a05:6870:8185:b0:2c2:4eb0:41f3 with SMTP id
 586e51a60fabf-2cc9e50b24emr9010028fac.3.1744118938200; Tue, 08 Apr 2025
 06:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1> <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
In-Reply-To: <Z_To9V-JOKZ7ChhE@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:28:45 +0200
X-Gm-Features: ATxdqUHzionenqJkD4YMHdkp7sUKPz9WrHUIS_ghqCFpfmFZzX0EbynUuoPZUrs
Message-ID: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_062859_676991_9225572D 
X-CRM114-Status: GOOD (  30.31  )
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

On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > >
> > > <snip>
> > >
> > > >
> > > > >
> > > > > > +
> > > > > > +#include "tee_private.h"
> > > > > > +
> > > > > > +struct tee_dma_heap {
> > > > > > +     struct dma_heap *heap;
> > > > > > +     enum tee_dma_heap_id id;
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     /* Protects pool and teedev above */
> > > > > > +     struct mutex mu;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_buffer {
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     size_t size;
> > > > > > +     size_t offs;
> > > > > > +     struct sg_table table;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_attachment {
> > > > > > +     struct sg_table table;
> > > > > > +     struct device *dev;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_rstmem_static_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     phys_addr_t pa_base;
> > > > > > +};
> > > > > > +
> > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > >
> > > > > Can this dependency rather be better managed via Kconfig?
> > > >
> > > > This was the easiest yet somewhat flexible solution I could find. I=
f
> > > > you have something better, let's use that instead.
> > > >
> > >
> > > --- a/drivers/tee/optee/Kconfig
> > > +++ b/drivers/tee/optee/Kconfig
> > > @@ -5,6 +5,7 @@ config OPTEE
> > >         depends on HAVE_ARM_SMCCC
> > >         depends on MMU
> > >         depends on RPMB || !RPMB
> > > +       select DMABUF_HEAPS
> > >         help
> > >           This implements the OP-TEE Trusted Execution Environment (T=
EE)
> > >           driver.
> >
> > I wanted to avoid that since there are plenty of use cases where
> > DMABUF_HEAPS aren't needed.
>
> Yeah, but how the users will figure out the dependency to enable DMA
> heaps with TEE subsystem.

I hope, without too much difficulty. They are after all looking for a
way to allocate memory from a DMA heap.

> So it's better we provide a generic kernel
> Kconfig which enables all the default features.

I disagree, it should be possible to configure without DMABUF_HEAPS if desi=
red.

>
> > This seems to do the job:
> > +config TEE_DMABUF_HEAP
> > + bool
> > + depends on TEE =3D y && DMABUF_HEAPS
> >
> > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the =
kernel.
>
> Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> to use. We should do that such that there isn't a hard dependency to
> compile them into the kernel.

I was saving that for a later patch set as a later problem. We may
save some time by not doing it now.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens

