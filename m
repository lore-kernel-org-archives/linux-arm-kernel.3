Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08460C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJVSPyBhQxEfciOdsPKbzkgk92klshtv/TeQm26hACA=; b=zu7GxCwISsGnnszJEFB3ceTefA
	n2ZjkivLX5XuBJoy9uYhjGKk/EaQiRHhabY/S60de/ZcK9wXhoml8HTIPYsMY2o0fYfTJOji8ksF9
	brftSzEbczx340/FHlY93GwYJxbPirqjkHSkC3Xc7A7tNYxW+eLrNwXIKjwBSaxPxPVT/wLCwTj6y
	FiVpX3nkE809WLe7MnrPZnLfoo6j/e7RkPcQKjIJ8J53ixyyoLE4ll0okP5sC7tktDRymlCn+bme2
	bWDeACCMWT5+mK/ryKokkHVGLbpGk9wWUIy8w+UwmDndPnBdnvdd3hwjrDz27b204Hw+4XvY/u2Tn
	Rv/zsKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWYE-00000002Gj8-32J7;
	Tue, 01 Apr 2025 08:00:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWWR-00000002GYU-0MAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 571FDA440BF;
	Tue,  1 Apr 2025 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF80C4CEE4;
	Tue,  1 Apr 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494337;
	bh=N0aOQujaXvl0WI/8gV+qMIDU5kNcN5JuX3zlJZZiu3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C8+R1PlSU58+Xkj6v72qEazJhScUDulxNjdpNdBObwRkmx1nQQVyx5DoIXo0oDXb3
	 DUbsHsJPJ04TvJZlceBAPqq9QkTPIMKh6IXC6qu4nocokujzVQjpexdRqGk7SN3xtW
	 81U6DERoHeJJEis3pWXYwt6uB1lewwO0wBKmsch+n+GAlvVVPsYOZibwbkME2snpHp
	 B+tAAUbmMcabcKha4jynjvRH7/YzHnGvLZOrRTF1F/DAybYREdxkPiQavIgTOSuWhi
	 lzNTh+JMThlogM3oqTMYcy0mWZAlLmTlyTKBEX4y1GI9wd5LeqfCghwPaN/wN8SIeB
	 KutfL59NdHQ6g==
Date: Tue, 1 Apr 2025 13:28:48 +0530
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
Message-ID: <Z-ucuPzwz4IqVTgb@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org>
 <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_005859_188116_48972C41 
X-CRM114-Status: GOOD (  11.60  )
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

On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> Hi Sumit,
> 

<snip>

> 
> >
> > > +
> > > +#include "tee_private.h"
> > > +
> > > +struct tee_dma_heap {
> > > +     struct dma_heap *heap;
> > > +     enum tee_dma_heap_id id;
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     /* Protects pool and teedev above */
> > > +     struct mutex mu;
> > > +};
> > > +
> > > +struct tee_heap_buffer {
> > > +     struct tee_rstmem_pool *pool;
> > > +     struct tee_device *teedev;
> > > +     size_t size;
> > > +     size_t offs;
> > > +     struct sg_table table;
> > > +};
> > > +
> > > +struct tee_heap_attachment {
> > > +     struct sg_table table;
> > > +     struct device *dev;
> > > +};
> > > +
> > > +struct tee_rstmem_static_pool {
> > > +     struct tee_rstmem_pool pool;
> > > +     struct gen_pool *gen_pool;
> > > +     phys_addr_t pa_base;
> > > +};
> > > +
> > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> >
> > Can this dependency rather be better managed via Kconfig?
> 
> This was the easiest yet somewhat flexible solution I could find. If
> you have something better, let's use that instead.
>

--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -5,6 +5,7 @@ config OPTEE
        depends on HAVE_ARM_SMCCC
        depends on MMU
        depends on RPMB || !RPMB
+       select DMABUF_HEAPS
        help
          This implements the OP-TEE Trusted Execution Environment (TEE)
          driver.

-Sumit

