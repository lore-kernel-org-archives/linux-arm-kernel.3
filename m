Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0C7D66B9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 20:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkZw88bP/WyfJ8Slp31S2XqQ4vEo9HvTWj1BeMFalg4=; b=30NGSxk5S+Xzu7NzB/G8u2F2aI
	wSTieRzJIprCgJuzAK3wxipMb2/uhSSqLYN/y5kiPTKzaHilYvqutQFqPp/PhiwNI0isU3Mo+0UcT
	sNCKLcgz430j+kc7sh8i5klXDe3XJs1ow+k8daVzxDH7PtnHJa3QaXCV8ZgdkzIy0bZNvdajVzK6q
	mu12Lajbo3WAHlmRGVoy8+sOXkVT7agLOVxD9spl3znA7nwp5ajqCbFzUAhkS11vdrdM1xlYW5a8L
	4AjfJTxlbTWLRC+h2fTZ1I8LTV6DPw6B1pv+xPZ6GrBQTBK4JS9AXPmsy5uINWHpsQGzrlLnKdKdP
	m9WUPrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxmH-00000007M7y-1W7C;
	Wed, 17 Dec 2025 20:05:41 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVxmD-00000007M7X-0uRc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 20:05:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so7786842b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766001936; x=1766606736; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KkZw88bP/WyfJ8Slp31S2XqQ4vEo9HvTWj1BeMFalg4=;
        b=tMpnN0N0vzfNViHe2wg2AsoZGLVEg32J0mcfeB5SseyVbg7xxFygCtphkek5+VKneS
         SANd2ay0Y4kuYDMjmF3TlJExpTXXLa8y8hf8RNNmaz8zb3TGt+eYajk4GJqFcOSmThem
         tCoLJ2NXsza4mBbmRAX8VQeW1ryN98jXxWyh7l/vfEXcCj9rDerStMh/OM73bUqdX0Gx
         A2vKjy6+zTLVmAOcXCzds5UAtZZkKh75J6VrlyMJXsAz5qBgaSDc4Wz/y7YxG+rbs7oo
         cvQQCVW3LmYkKkoyUgo+gzYYI6O/BTYHINu4MEhx7Zbg2oNd4dt0wPJodxL1VLzbrb2b
         ESyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766001936; x=1766606736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkZw88bP/WyfJ8Slp31S2XqQ4vEo9HvTWj1BeMFalg4=;
        b=UI5oSy0WMTsm8n8uTRlbfHL0G4tsYSS5cJktiH6luUiLOWEosdvG9gIMrilMTRqc84
         9PIotQc2vEOc7ei7nr3K+JCsJ2MYdVLjdmuTz/r6G3/hFP1lNpyFvkWzSyFYFTpLzmPa
         NnLOZpO4j2qgRDn+x9rZYCI7BzLxB/QAAqv5BS2NJg7Wj80wddxCxu+x2Bxw4B9N3UYM
         2q+2yo0caA4pLoq9P8nhHe6epoOtji+mME9AVbNneXtAcwQqtpdsNkeCPjdJZ17u8zif
         tPlyYW3EePU/vlorWdcn2zAkdztibQ73Okad6af34M7j6QXPPy6FseLOeD7EjHlA0gQb
         CqCA==
X-Forwarded-Encrypted: i=1; AJvYcCVz9q+sEk33ktCnRbySmDY90d6mnWwiUndFW74LhFfOuEKyarUd6dE73tts2ynCeIhw9M0Buq+/mq4NbDBQFlAQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi1JlPb6HiM9wnhKXW6QRX8AHmSVxdrtvDbREmNhunX81YMnpH
	PtvJNGxc/WE8Yht3KW+JxoYvWKzLG/JBeLqPmeswUu8UK/kkp1MHXIq9ZrBjJfnXOdQ=
X-Gm-Gg: AY/fxX6g4/fK2utguUcGl1XqHrQDNqYGuX6f8GEJ22apO2SX2TQKL9Zg5e42b5ujqQ5
	KWDkoTUK96rOfX8TVgj2TsOpL7cqxevM7Ox5fboFMjgm21OG3vOftu8+XLsxvfZWxfQ+qjFtsPa
	GNrUbWhkWioFD3UVmxbZSNbCCPqqM8+8WYfNcu5KfuVSZsNj1PR5ljqH64s8k6g7os9WXCjrcAA
	pam2zueZg4vcwRu6yPBI+PJgjgXy2BGevJXl9FRAQebGNJre23o2ofNy3YFrUu15jA882qlIw42
	Z16HYE7Wp86npTFR5KkOyFf0VmD+6eWxawY6ZAZ2jqz1PEiFF7Ws32rilTBq8hoK55PW0hQ8ACR
	2qiKU3l4NloMkLtJMBVu8Qu1e+A7atxGzEUtaO3s+uc8vGyoGLe6f8sXGwAeZPXcb9dxNODGqJU
	pKARRxKj85r1fgVg1IZXrHl/Q=
X-Google-Smtp-Source: AGHT+IGVFo2yytymuAHw5hqToh3gZn9Ym3kLzhpy9bauNTlCV7XCowv2jhys9XWTGUuET8Vi204aBA==
X-Received: by 2002:a05:6a20:7344:b0:366:581e:1a07 with SMTP id adf61e73a8af0-369afff165cmr18496165637.60.1766001936049;
        Wed, 17 Dec 2025 12:05:36 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1d304d1909sm206545a12.31.2025.12.17.12.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:05:35 -0800 (PST)
Date: Wed, 17 Dec 2025 13:05:32 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
	m.szyprowski@samsung.com, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	arnaud.pouliquen@foss.st.com, robh@kernel.org,
	geert+renesas@glider.be, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iuliana.prodan@nxp.com
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop
 operations
Message-ID: <aUMNDPDgN7ACvry9@p14s>
References: <20251210154906.99210-1-daniel.baluta@nxp.com>
 <aUHZaapZ1IAs_mRE@p14s>
 <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_120539_502722_5075C421 
X-CRM114-Status: GOOD (  36.17  )
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

On Wed, Dec 17, 2025 at 02:57:24PM +0200, Daniel Baluta wrote:
> On Wed, Dec 17, 2025 at 12:13 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> > > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > > functions for "memory-region"") following commands with
> > > imx-dsp-rproc started to fail:
> > >
> > > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > > -sh: echo: write error: Device or resource busy
> > >
> > > This happens because aforementioned commit replaced devm_ioremap_wc with
> > > devm_ioremap_resource_wc which will "reserve" the memory region with the
> > > first start and then will fail at the second start if the memory
> > > region is already reserved.
> > >
> > > Even partially reverting the faulty commit won't fix the
> > > underlying issue because we map the address in prepare() but we never
> > > unmap it at unprepare(), so we will keep leaking memory regions.
> > >
> > > So, lets use alloc() and release() callbacks for memory carveout
> > > handling. This will nicely map() the memory region at prepare() time
> > > and unmap() it at unprepare().
> > >
> > > Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > > Changes since v1:
> > >  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com/T/#t
> > >  * took a different approach and instead of partially reverting the
> > >   faulty patch, used alloc() and release() callbacks to handle memory
> > >   region mapping.
> > >  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
> > >  1 file changed, 33 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index 5130a35214c9..83468558e634 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
> > >       mbox_free_channel(priv->rxdb_ch);
> > >  }
> > >
> > > +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> > > +                                struct rproc_mem_entry *mem)
> > > +{
> > > +     struct device *dev = rproc->dev.parent;
> > > +     void *va;
> > > +
> > > +     va = ioremap_wc(mem->dma, mem->len);
> > > +     if (!va) {
> > > +             dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> > > +                     &mem->dma, mem->len);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     mem->va = va;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> > > +                                  struct rproc_mem_entry *mem)
> > > +{
> > > +     iounmap(mem->va);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  /**
> > >   * imx_dsp_rproc_add_carveout() - request mailbox channels
> > >   * @priv: private data pointer
> > > @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >       struct device *dev = rproc->dev.parent;
> > >       struct device_node *np = dev->of_node;
> > >       struct rproc_mem_entry *mem;
> > > -     void __iomem *cpu_addr;
> > >       int a, i = 0;
> > >       u64 da;
> > >
> > > @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
> > >               if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
> > >                       return -EINVAL;
> > >
> > > -             cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
> > > -             if (!cpu_addr) {
> > > -                     dev_err(dev, "failed to map memory %p\n", &att->sa);
> > > -                     return -ENOMEM;
> > > -             }
> > > -
> > >               /* Register memory region */
> > > -             mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
> > > -                                        att->size, da, NULL, NULL, "dsp_mem");
> > > +             mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> > > +                                        att->size, da, imx_dsp_rproc_mem_alloc,
> > > +                                        imx_dsp_rproc_mem_release, "dsp_mem");
> >
> > Was there a reason you kept those here rather than moving them to probe() as
> > Iuliana suggested?  Note that I would be fine with this solution since this is
> > how it was before, but if we have to go through a refactoring we may as well
> > take those things into account.
> 
> Tried moving imx_dsp_rproc_add_carveout at probe() time but it doesn't work
> because stop() will clean the carveout list and then the next start() will fail.
> 
> at probe()
> imx_dsp_rproc_add_carveout
> -> rproc_add_carveout (adds allocated carveout to the list).
> 
> at start():
>    -> first start OK
> 
> at stop()
>    -> rproc_shutdown
>        -> rproc_stop
>        -> rproc_resource_cleanup ;//cleans up careveout allocations
> 
> at next start()
>      -> CRASH

I have applied this patch.

Thanks,
Mathieu


