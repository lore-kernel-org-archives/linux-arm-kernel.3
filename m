Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDBFC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV7uMxmQxza+uYat1QLq0Yj1SFJalpcpZZ5M97JbmTE=; b=1ZPs2+YfTbx8KRGlP9m4VjUvra
	JTxOvstIHu3nODaPgvxQMo8fbe3vMHGnpcZ4E2Kxvx53GWBpa/fHjVoO3EsMZ+q22sJw4e8OJ2IWR
	OIHNG1DXYLeoguO6hNyS0A2ko/lx+9MO5VjpvRmVtxP521j0diwbGhzjbvvovqECg8dhJT2aTUMc8
	Nz3IBpWhJSU+tvUUA2Zyneln3594W95v5kMwoxHSDdrqIjuMpoDI9q2RJtLAQ0MeiVhKRTNtw28aS
	vdVK44UWzP9NlOLUAmT2zHHwqoEffEhrMQlvffUMQ8u8XFc2qas3APSuc4W9SHLx1DIGiqW4pJTrv
	CnlIm6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UvY-00000007Cwb-3YJh;
	Wed, 09 Apr 2025 12:53:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Usz-00000007CSv-2LSW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 524D15C117C;
	Wed,  9 Apr 2025 12:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F78C4CEE3;
	Wed,  9 Apr 2025 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744203032;
	bh=/jW9B44kyqNV8gjRORD3bHRgIUAe308jn00yw2IwXDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MnoGH7/So9vd/9bpPO03vMLSZNhWbekAYvl+BCmmbTLqGQSlJFJqS1PdM3P8y5Wyy
	 yu16DR8o9W8yUb7HCTLY/WAx7vMerpZygbwYzDGFD6QyfzHi7sAzFYVNni2gxOjuLA
	 nh2oLbhT54uQPNQtanuMpZEbkqyQx2bpm/8foNQEyaAl0ZegA32hKwCncxgV0d/MFj
	 W3UUEG9gYWm2vYrBhZz19jSvTXA/PU6n0qvnRXatLAbwWyDpCCuI0JwJcvD02O3Rzd
	 JCNLumTwG0/c3mNIXIvMwQtuJGhgODmSlZABTMFyzs7WmdY5KjjuHHmubf7rnF26iD
	 VaIWwvtYKojGg==
Date: Wed, 9 Apr 2025 18:20:21 +0530
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
Message-ID: <Z_ZtDQQY4eouqBh8@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1>
 <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
 <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_055033_706547_2745E987 
X-CRM114-Status: GOOD (  35.35  )
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

On Tue, Apr 08, 2025 at 03:28:45PM +0200, Jens Wiklander wrote:
> On Tue, Apr 8, 2025 at 11:14 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > > On Tue, Apr 1, 2025 at 9:58 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > > Hi Sumit,
> > > > >
> > > >
> > > > <snip>
> > > >
> > > > >
> > > > > >
> > > > > > > +
> > > > > > > +#include "tee_private.h"
> > > > > > > +
> > > > > > > +struct tee_dma_heap {
> > > > > > > +     struct dma_heap *heap;
> > > > > > > +     enum tee_dma_heap_id id;
> > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > +     struct tee_device *teedev;
> > > > > > > +     /* Protects pool and teedev above */
> > > > > > > +     struct mutex mu;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_heap_buffer {
> > > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > > +     struct tee_device *teedev;
> > > > > > > +     size_t size;
> > > > > > > +     size_t offs;
> > > > > > > +     struct sg_table table;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_heap_attachment {
> > > > > > > +     struct sg_table table;
> > > > > > > +     struct device *dev;
> > > > > > > +};
> > > > > > > +
> > > > > > > +struct tee_rstmem_static_pool {
> > > > > > > +     struct tee_rstmem_pool pool;
> > > > > > > +     struct gen_pool *gen_pool;
> > > > > > > +     phys_addr_t pa_base;
> > > > > > > +};
> > > > > > > +
> > > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > > >
> > > > > > Can this dependency rather be better managed via Kconfig?
> > > > >
> > > > > This was the easiest yet somewhat flexible solution I could find. If
> > > > > you have something better, let's use that instead.
> > > > >
> > > >
> > > > --- a/drivers/tee/optee/Kconfig
> > > > +++ b/drivers/tee/optee/Kconfig
> > > > @@ -5,6 +5,7 @@ config OPTEE
> > > >         depends on HAVE_ARM_SMCCC
> > > >         depends on MMU
> > > >         depends on RPMB || !RPMB
> > > > +       select DMABUF_HEAPS
> > > >         help
> > > >           This implements the OP-TEE Trusted Execution Environment (TEE)
> > > >           driver.
> > >
> > > I wanted to avoid that since there are plenty of use cases where
> > > DMABUF_HEAPS aren't needed.
> >
> > Yeah, but how the users will figure out the dependency to enable DMA
> > heaps with TEE subsystem.
> 
> I hope, without too much difficulty. They are after all looking for a
> way to allocate memory from a DMA heap.
> 
> > So it's better we provide a generic kernel
> > Kconfig which enables all the default features.
> 
> I disagree, it should be possible to configure without DMABUF_HEAPS if desired.

It's hard to see a use-case for that additional compile time option. If
you are worried about kernel size then those can be built as modules. On
the other hand the benifit is that we avoid ifdefery and providing sane
TEE defaults where features can be detected and enabled at runtime
instead.

> 
> >
> > > This seems to do the job:
> > > +config TEE_DMABUF_HEAP
> > > + bool
> > > + depends on TEE = y && DMABUF_HEAPS
> > >
> > > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the kernel.
> >
> > Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> > to use. We should do that such that there isn't a hard dependency to
> > compile them into the kernel.
> 
> I was saving that for a later patch set as a later problem. We may
> save some time by not doing it now.
>

But I think it's not a correct way to just reuse internal APIs from DMA
heaps subsystem without exporting them. It can be seen as a inter
subsystem API contract breach. I hope it won't be an issue with DMA heap
maintainers regarding export of those APIs.

-Sumit

