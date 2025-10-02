Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C299CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgVDpIUaXbRIFaGTvmSsiE/BFfaSBmSlnmsfDON0gMA=; b=OLary6mXuFVgKPpokrxlLwaw4B
	NRM7luhDgnb3jSjO376ASdH1NyP5EVVMP/ykceOgYJdJs8ZEgoa8y59FM4B8pIw+kiNjh9joHAfHU
	7gjLJANPxom7pZ+RI595LCD0sD3CgD7TnsN2jOFJKQmfnFf5XD3zaxHAkhRdvmjIKtdzVBKOzRDOe
	A83QDJ5kRo1fMILBW/vJEB7etAzETUqJauUeQaBLE3JmQxHQi16SOAuIzuXVLgk0xdbbjfK3U0QEN
	ErA0s1E7M9eGlhgtK+TtlD374FpNU0W5esfoYN5r9x/kp1JFU+RQlqYBZirYBi1A0Z0HmtZUtEIT3
	13jQSYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E44-00000009pEo-0MHk;
	Thu, 02 Oct 2025 07:49:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E40-00000009pDE-3mQD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 07:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759391359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CgVDpIUaXbRIFaGTvmSsiE/BFfaSBmSlnmsfDON0gMA=;
	b=H4FSmhQquwouUb6kRHeV8996b4YS1BcCTyOrrewTnrvDRQMGYQa2cXiDpFSQeOtTB7zkeV
	SNl/q9b0Z9Flz4m1siedIYbBikL+SRAB2xbxKPJL8SlfY1iFRJ4YHG/GzVXRxLvsdhzY35
	DB6pbb6ACfj6YbXAa/s9ZZSN6gePV54=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-LUqKBptUNDGA4k-zUcyhFw-1; Thu, 02 Oct 2025 03:47:43 -0400
X-MC-Unique: LUqKBptUNDGA4k-zUcyhFw-1
X-Mimecast-MFC-AGG-ID: LUqKBptUNDGA4k-zUcyhFw_1759391262
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3f42b54d159so442796f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 00:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759391262; x=1759996062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgVDpIUaXbRIFaGTvmSsiE/BFfaSBmSlnmsfDON0gMA=;
        b=pOCXnOK/tDzRkxeMKxLjG6CU82wKHFJVOPZ5Zgoew8Wwym1XcGe6GtLIXpL2aJKw47
         AUwEV9dcRHsP+D9tkKpciXEp4UHd3K9b7avOv+6GDaxgVtSrm16LXcdjsA7Ifr27kZFm
         pAfqLn2SNcec1pnMgs13GXf1me6lFSbR2SzJmanK5mV9Y+XwmaAg0sg77yA15UWVskAH
         bd1Bu5BJBZmViYyuOcQxKDb36UlhiAILb+Ph1rrE2n7OxK0yLzqVzCvEDUrgySXRoLXg
         tmbMHBB95p5tl+Nfy8VyNbLJ9DFHr4uw80iozJUZA+GK5E7v91IoWE9qr0Hf+BgziPV/
         xJbA==
X-Forwarded-Encrypted: i=1; AJvYcCXS1tkpRQgxNAckNmM6ANfzF10hH9/Rb8aAnkhIIB/uhmslXcswNNYi9sKQHduHcIqX+V9qblAsDGf/Wz/Tgx9E@lists.infradead.org
X-Gm-Message-State: AOJu0YyaOOHgtKtBIZNF37dgXdKpjsoZcm+wotCpai1AzzhysjzfyNxI
	uTthgqkAEYgkqhew8z2TwJH9/zvVl1TtUPMI5TEzdz0mLK1DilZ4ylRWeu67j1pFKSpTOqtiGND
	GE69RbQLCujPDu7xLAsTVBro21vYwKy7bwkwCl9tajU56CmXEe1YXf5TUGwBHlt+6vratp8Zjfo
	6a
X-Gm-Gg: ASbGncvl6siTTH1S9mxPFJBX0YP/ZIF5BZRMK3uAIBTvkKgJzaVzgGRr7Dxt1aoFiu4
	dec/pC4j1dqv+0ueog6wVo32oHWjMb1Cb35K8nci9FSEp4W6nFvw2UFDo2pT29UW1AQLIlNNnAg
	3YQjlhU8qtb4pbSnbka7eSFm3fGJBA5RHVigmWzf9bObiM8YttsFkTCEPuQwc8/5hhfbwaBKNgw
	xwywwpOp7ZhY4A1kM2pylsb18bECurbxlb6ll7yODdDPnq33s/0YqCpdmUVdzs2RrGyW+6tinaR
	kZIsg7v7FzoBcUOTQ3In5w==
X-Received: by 2002:a05:6000:615:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4255780bf79mr4246066f8f.29.1759391262062;
        Thu, 02 Oct 2025 00:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP/KnwbkkSVeQQvgR4f/j6yP7T3XyqaNDmBwlBCTQIJSAplcQo89U5KExVEQ0LiNnNhN8Wxw==
X-Received: by 2002:a05:6000:615:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4255780bf79mr4246043f8f.29.1759391261558;
        Thu, 02 Oct 2025 00:47:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6b5csm2470879f8f.5.2025.10.02.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 00:47:41 -0700 (PDT)
Date: Thu, 2 Oct 2025 09:47:40 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gqzh2ah3mmdu76ac"
Content-Disposition: inline
In-Reply-To: <20250911135007.1275833-3-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_004921_053837_5C2A1DF5 
X-CRM114-Status: GOOD (  20.84  )
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


--gqzh2ah3mmdu76ac
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
MIME-Version: 1.0

Hi,

On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> Export the dma-buf heap functions to allow them to be used by the OP-TEE
> driver. The OP-TEE driver wants to register and manage specific secure
> DMA heaps with it.
>=20
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/dma-buf/dma-heap.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 3cbe87d4a464..8ab49924f8b7 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -11,6 +11,7 @@
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
>  #include <linux/err.h>
> +#include <linux/export.h>
>  #include <linux/list.h>
>  #include <linux/nospec.h>
>  #include <linux/syscalls.h>
> @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
>  {
>  	return heap->priv;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> =20
>  /**
>   * dma_heap_get_name - get heap name
> @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
>  {
>  	return heap->name;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> =20
>  /**
>   * dma_heap_add - adds a heap to dmabuf heaps
> @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>  	kfree(heap);
>  	return err_ret;
>  }
> +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");

It's not clear to me why we would need to export those symbols.

As far as I know, heaps cannot be removed, and compiling them as module
means that we would be able to remove them.

Now, if we don't expect the users to be compiled as modules, then we
don't need to export these symbols at all.

Am I missing something?

Maxime

--gqzh2ah3mmdu76ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN4uFwAKCRAnX84Zoj2+
dgXFAYCRqMeTP57unkLdOGOydUleXNO4Hyw5XxsQDOrGvzMhBXOO+wkmNxAyspbp
Ufq67PMBfjTtOUKXQIyMWncxOakNOIj4KKpCcpuXU8G+m0dpGkCeFoK4Z85nhhK9
lbC1byfHEQ==
=wMRm
-----END PGP SIGNATURE-----

--gqzh2ah3mmdu76ac--


