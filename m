Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6D2CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=; b=2ggV91lruEs7/FuJdfeus1mrlp
	hEM1swSON5hb81gqFPcVHPjCwk1PwVfLklYrUOV+98LCMTLmWdcS6AQJZwLHuoBwDQe+7XU6boYqt
	gNimqzeB5ozBkfbl8krc+cRx+qollxCWW+FjZj7kDxUVSLdQ6TFLev58z93dbUoHYcfLXcrfhpBW5
	sflbwxwxcNeVjjLgnWVWE3CeYGNludt4eOZcZGtR76D+T9sfhpUPQZepv/nUViFvkPHtvuc4tyjLM
	IV+5AcAXk1W0k88zoyBMp2CE1xUU6NnGigppeAVajlhrD3U3B1pkeYyEs/ADHiLmsaykqf62Jr5EB
	Bvh+iASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fl3-0000000CO44-1rlj;
	Fri, 03 Oct 2025 13:23:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fl0-0000000CO36-23uk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759497812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
	b=HodfxINm++2lnUCJAgORolHxNFS8j2NMJoCS5kUkFYzLUAaBBDYczn6Wnvi0xGWDz1JozI
	NQTUh71/CjNs58PK5PzqU+AWj6UJUhKLjBASmcBg4iLsCfmP8cVHzH9fbBDqvhUYBoJjwm
	Ku18QXmWL6j7EbePPL79O3aJ4eeyCfA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-19LQdYjnNUO1F7D5TUM5oQ-1; Fri, 03 Oct 2025 09:23:28 -0400
X-MC-Unique: 19LQdYjnNUO1F7D5TUM5oQ-1
X-Mimecast-MFC-AGG-ID: 19LQdYjnNUO1F7D5TUM5oQ_1759497808
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46e45899798so9593145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759497808; x=1760102608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
        b=BSbFQlDEwZeYqA7umPixECWWZAwVMSqfNzuqxaGXGAahuPp2Y5J58mzNK/1dnWmGdR
         tsg6zymNOIAgOl/BMUac4JCLbCO7FpiokYys1ZfvyFqQ6w/pVl7PD5sAH5ppgL+V3VK3
         6+lFB++90OhO1JWHc8ODbQ4TphpPi5i9FbycUGTqnqglvI4f6xkTvR+gFhBPElClClOw
         P5xOBrizuXph4zbKlXLM3r29ZZTGdxHP60Zuk+1mj1U7cQCPQtUCj0bmgo4mA7iiaCEy
         ZPohJE1B94XhbJCSEUZ0MBHtqYGHAZZoFYl+oMKPv70o3xrwl9QUOJhaN+SVVFCPbh3D
         VK4w==
X-Forwarded-Encrypted: i=1; AJvYcCUc/oQwIlt2JpEP2gTwfSHrpjGJb/Htn8U/VrjsuLcP4DxshROG9FZafoNyGPVeD5OJ34Jb/aZc6Zj5CWpPZOZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5edEYm9QzN/D8ZoWsIT7bQfehwfTcn2oyxsLiS/qMW+ko7myP
	OE7r0sHlxhtyMR6WWKRp14i+Vh6O6U5R8Pj/NdeNKhnlN5Tp32d4W8ZRuaNzhy9fHP23hGcW1t7
	dRntu2TalsfiUXZ7E+2GZGLk4xQNlHvrfLWOAzEcBKoTO/vbJn1S6F04foxUYhGG76hnZZecLM4
	1q
X-Gm-Gg: ASbGnctnHJnvOjMtemABN2FnrRO53PrRI80KfZ88XJOxDHd/N1Qv6P3VJj80FsHtnsd
	tTN4i0KS1amyZsCOBQVIFptxvngkPuA6ezb2dLciDEo+vcFDdOIki7KiaRVN51JtvBYF6OC3OHe
	3Vf7aVBG18aFTCbg0rOICeAylKZ6uGYgqiPpM5qVhLkWiPE5HjeL+FKRnnybUe69YlA6rYPDpGG
	+gjYRsqvxtrqwldBGnRiUxLTIb1UNj7mT2bYOsipGR1hVj40qGDlmUS5ybyKIG7etzn0mOeKgeA
	6GXasP/AJeu0Wqw7rQQg2A==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id 5b1f17b1804b1-46e71140be1mr25355375e9.24.1759497807549;
        Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOOjaj75XO52nWI2I6UTsKjmFKM3jXrNLUe3y6zOumiOqPFkEXqNu9rSWvZBXSmGhaUe3KVg==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id 5b1f17b1804b1-46e71140be1mr25355005e9.24.1759497807018;
        Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b5csm7942733f8f.5.2025.10.03.06.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 06:23:26 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:23:26 +0200
From: Maxime Ripard <mripard@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, "T . J . Mercier" <tjmercier@google.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <20251003-brilliant-golden-lion-fbedc9@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
 <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bmweveq2oxpjd6s2"
Content-Disposition: inline
In-Reply-To: <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_062334_596369_B8173C82 
X-CRM114-Status: GOOD (  31.22  )
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


--bmweveq2oxpjd6s2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
MIME-Version: 1.0

On Thu, Oct 02, 2025 at 12:45:41PM -0700, John Stultz wrote:
> On Thu, Oct 2, 2025 at 12:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> > On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secure
> > > DMA heaps with it.
> > >
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..8ab49924f8b7 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-heap.h>
> > >  #include <linux/err.h>
> > > +#include <linux/export.h>
> > >  #include <linux/list.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/syscalls.h>
> > > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> >
> > It's not clear to me why we would need to export those symbols.
> >
> > As far as I know, heaps cannot be removed, and compiling them as module
> > means that we would be able to remove them.
> >
> > Now, if we don't expect the users to be compiled as modules, then we
> > don't need to export these symbols at all.
> >
> > Am I missing something?
>=20
> For things like distro kernels (or in Android's case, the GKI),
> there's a benefit for modules that can be loaded permanently (not
> having a module_exit hook).
> One doesn't have to bloat the base kernel image/memory usage for
> everyone, while still not having to necessarily deal with
> complications from module unloading issues.

Ack. We should at least document it then.

Maxime

--bmweveq2oxpjd6s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/OTQAKCRAnX84Zoj2+
dtj+AX9Z6mfBBmJxP6k0eTgjg+qG1U5U8jSi9QuHw6zfKnsmrcwgrOYtur1R6Pew
cpDvn3QBfR0GnE+hRXWrYWoFPItAzGGTqManWkqHoYmL3MvlOwO7ECQmeIAe8L4a
Hi/ZAVgLUQ==
=rb0f
-----END PGP SIGNATURE-----

--bmweveq2oxpjd6s2--


