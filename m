Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC98C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SP/Rn9GVQbubBhb5+qSARLbwYuxfvTtFdJfuIPrSrc=; b=M8CF/4GrRA19wzEdWCkeeB575/
	x8WWDc3XWwVLQzRg7DPC8qfBNecDxtu61Hq5Yx3AAVcB+GPAKfPZ7m+GyzftNmR4YA9Yr7lIGcrfS
	yQMDDtUa05c2lz5Oo43dcd+cQJEszIbZVjdlpUO8M6kWRWXCjDV9LmDcuWn1zBF149vTN0GVHbjvl
	2fh2SPJb4Rs8PQblfVzKz+Ww3AeSEaAVm0gPGQtE7X0S33wZUlb9lDImwpw/LQ+hZaJZDN27+ZPAh
	zK7y5kvLQ1AVX1VNw0xvJ9kDEFaLIPBHD2SXd1K+nwCa925840VkOre7vFcvVwCW1SMgdeKkOIPoO
	HZAUlPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Db-00000003QxP-0X7k;
	Tue, 08 Apr 2025 09:26:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u252W-00000003P1b-2HEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB85060007;
	Tue,  8 Apr 2025 09:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0BCC4CEEC;
	Tue,  8 Apr 2025 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744103679;
	bh=5T96jd+YxJ7IGn6UQn3A5R31GnrSZ6GL7SLpCq5VmKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSWNR0ZfWAED8hNKIJ7DVGo7/V4mFLjdGDbDeA49eX+0ZFM2ERQMmj4JTo2BsJ5U7
	 NDkIzHb1xw2+71csR2AtpMXLlrB78qDptAL1FSIPPMWuD9ilO7R1UJpReoHugBjTqK
	 /CYKNXoEsBDBLlPp7S+fp5QjXW+C54362lQou8nh80P5RRiGRdcRTFxrv1mv+dpcl9
	 rssVvDPM/HEOTI1UQZk14UFeKdtW41XdoW7yDYQr18+sOlk6eP2A/lVaVBePoxasPf
	 6WNG2dCiRSeuP5IKM6F+k4tlSomwoJFV2K9IS6toDtnQRPHpGMGoXHyBM3I7sI7U0F
	 vJ+eCCwSWWGZg==
Date: Tue, 8 Apr 2025 14:44:29 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
Message-ID: <Z_To9V-JOKZ7ChhE@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
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

On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> On Tue, Apr 1, 2025 at 9:58 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > Hi Sumit,
> > >
> >
> > <snip>
> >
> > >
> > > >
> > > > > +
> > > > > +#include "tee_private.h"
> > > > > +
> > > > > +struct tee_dma_heap {
> > > > > +     struct dma_heap *heap;
> > > > > +     enum tee_dma_heap_id id;
> > > > > +     struct tee_rstmem_pool *pool;
> > > > > +     struct tee_device *teedev;
> > > > > +     /* Protects pool and teedev above */
> > > > > +     struct mutex mu;
> > > > > +};
> > > > > +
> > > > > +struct tee_heap_buffer {
> > > > > +     struct tee_rstmem_pool *pool;
> > > > > +     struct tee_device *teedev;
> > > > > +     size_t size;
> > > > > +     size_t offs;
> > > > > +     struct sg_table table;
> > > > > +};
> > > > > +
> > > > > +struct tee_heap_attachment {
> > > > > +     struct sg_table table;
> > > > > +     struct device *dev;
> > > > > +};
> > > > > +
> > > > > +struct tee_rstmem_static_pool {
> > > > > +     struct tee_rstmem_pool pool;
> > > > > +     struct gen_pool *gen_pool;
> > > > > +     phys_addr_t pa_base;
> > > > > +};
> > > > > +
> > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > >
> > > > Can this dependency rather be better managed via Kconfig?
> > >
> > > This was the easiest yet somewhat flexible solution I could find. If
> > > you have something better, let's use that instead.
> > >
> >
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -5,6 +5,7 @@ config OPTEE
> >         depends on HAVE_ARM_SMCCC
> >         depends on MMU
> >         depends on RPMB || !RPMB
> > +       select DMABUF_HEAPS
> >         help
> >           This implements the OP-TEE Trusted Execution Environment (TEE)
> >           driver.
> 
> I wanted to avoid that since there are plenty of use cases where
> DMABUF_HEAPS aren't needed.

Yeah, but how the users will figure out the dependency to enable DMA
heaps with TEE subsystem. So it's better we provide a generic kernel
Kconfig which enables all the default features.

> This seems to do the job:
> +config TEE_DMABUF_HEAP
> + bool
> + depends on TEE = y && DMABUF_HEAPS
> 
> We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kernel.

Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
to use. We should do that such that there isn't a hard dependency to
compile them into the kernel. 

-Sumit

> 
> Cheers,
> Jens

