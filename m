Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC7C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 13:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGgb0gI0WsEnrlnk5sBAIi/zTeFlXCSw5R23gVgvlik=; b=NLkrmM55tr8P5U1xnmMuDMfKqC
	msHQV5oPx2bIg/g6AYZtbHiASer4W1VEGNEhM++A+Z8WLIB8Cm9u39Fyu1OVZP9rKJtcO1kX01XIc
	7TXmtWzPoxUGfgwp6i2RDyVtI5rlRAv4y13tw1tpRhatroWYsMK1MA35JGCXAniYzaPHqS6nB1g45
	nNWHA+tTobz03wQZQs3r3cgyPS7BNan3mFdC1w6UjZ8rxS/XOLogwjo4np0v8uYOURL0a6qBoDI5N
	21IXEmJI2DyP97StzL5EF17PSZAF1W3iAz1A0rUoMhmVRT8Ed+jEr6kaffwhTgAkyI7sGHXG69Zga
	tA+YoPBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJuen-0000000As2w-1i2D;
	Tue, 27 May 2025 13:47:53 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJucX-0000000ArbH-3fKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 13:45:35 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-52eff44a661so851506e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748353533; x=1748958333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGgb0gI0WsEnrlnk5sBAIi/zTeFlXCSw5R23gVgvlik=;
        b=jexMKXi0eBo6vcoK5+nPjYd6gEmJJNfGe/jSNePiL0R5lgvrIyCsN0Ph8nHRUUBRfY
         W4GjmZjG5UIO0Rjuq8SOO4S5aICP+4x4SvcL0fnOTjEvAjUPXPBm/2f8PGMV0QcMmLiY
         4Hf0yurg8F0Hg/pbueBaezTRYMWwovJDOPdFscpvvrKrIhtZUVwG2WnjsY9b75AmH48A
         iwxT1D/OVqtwCjZHbFQ3Q2me2lsTLSMBYKnJL0FyZ9XUIFWYC05gvyf5Qn/mpielFfpl
         ktIvIjU/9x7Yyk9eg3QVqSBcHJNJk33D9DItcJsujdBshajUTuUMdL2HaD4vAUbsFpYN
         tgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353533; x=1748958333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGgb0gI0WsEnrlnk5sBAIi/zTeFlXCSw5R23gVgvlik=;
        b=vUru4LzkEMg9SPIEgaMPM2ffSeIOoViM51u65DEAtbn/tHlL+y+SZ/Y9t5ZVGFD3kh
         evJKfgCMtOWlbEvoTCy0dgHxLu9Ai0T2sIdj4gx9fIVeFs3QLKtCt8iSKljQiwobfttX
         paQVGD2hvvuUwQbTDbDGgM6qN6Nkr3OvfNdz5agN1AOLOwMBdyt3n7WkrTpsv3SvpBBi
         kK19DJ0ExSzzJg4XeGU5ZP7GIdW6EN/fUB4kpyczw3ndvXNDOmaiIOtIkOQK9duH/qh/
         6Dzpi68qsREZtOu1kvNEArPoIgZ68nF/5HSNU5pdSxpR9vBcMOvD2ZGay0Mn+wSoV61j
         3sqg==
X-Forwarded-Encrypted: i=1; AJvYcCVZAMAQtYlHYGfFLFEsA9pujRW33XiUbJu658EZxjrIxUqTi/OYMj6MgnlS05+N/pnNCTXPYKZZW3AAGkqtv7vS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzu4xj6aStAqo9ahyVVGxYdxOUQyEH62+bva8FNCzEBq+Ev+on
	WIaoriyWBl1S6bOIfIlLrzF3Bcyv0hPAa9qnAstRTFKVu6gHv19XDJPq
X-Gm-Gg: ASbGncv/n+F2Fxd7aYu4ZNCFmX5f+M87pTzGawT+uZh8w1vkdaGm6zB7CKBtM1QlWdW
	xYCHQmPtQHgWM8HPkyAB/gta5z7164Cuk8ON/MaokBC2EcRt3aT2Y26OKbaKr+g/BjFo1JjWFuj
	LaQrQvR9uMcyrlRnZtcZ7nKGal3XfP28xtefWbw/G+JOFnezX5zzL/1SBdrlbRPt0cJa60Xy6Nw
	IC87ZeSNNscDPxowFF9YozIFd8iy3lW/bmtEZDNKEM6qiMTkYPGjX2DEjR4G2M/QVa8ntr90VCS
	aTbssDpvpNJOCF+sV3lLyN7yCVHNcAnz595NXMLzKvO33F3NvQ==
X-Google-Smtp-Source: AGHT+IE4BoE+wRq0vStmnqOD4qXT5MdjgPUfSxYYYKWtFbpYnegO3+6kCXHmykmhdGnIfdFOGCxs8g==
X-Received: by 2002:a05:6122:891:b0:529:2644:8c with SMTP id 71dfb90a1353d-52f2c58c9cfmr8165088e0c.8.1748353532620;
        Tue, 27 May 2025 06:45:32 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c1:78c2:1962:9d1:d346:d848])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52f6b9253fdsm2499564e0c.27.2025.05.27.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:45:31 -0700 (PDT)
Date: Tue, 27 May 2025 10:45:25 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250527134525.f7yzs4ww64xxmjmr@hiago-nb>
References: <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb>
 <20250527023921.GA14252@nxa18884-linux>
 <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_064533_915701_DEA894F8 
X-CRM114-Status: GOOD (  67.93  )
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

On Tue, May 27, 2025 at 01:58:46PM +0200, Ulf Hansson wrote:
> On Tue, 27 May 2025 at 03:29, Peng Fan <peng.fan@oss.nxp.com> wrote:
> >
> > On Mon, May 26, 2025 at 09:05:10PM -0300, Hiago De Franco wrote:
> > >On Mon, May 26, 2025 at 12:07:49PM +0200, Ulf Hansson wrote:
> > >> On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >> >
> > >> > Hi Ulf,
> > >> >
> > >> > On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> > >> > > You should not provide any flag (or attach_data to
> > >> > > dev_pm_domain_attach_list()) at all. In other words just call
> > >> > > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> > >> > > drivers/remoteproc/imx_dsp_rproc.c does it.
> > >> > >
> > >> > > In this way, the device_link is created by making the platform->dev
> > >> > > the consumer and by keeping the supplier-devices (corresponding to the
> > >> > > genpds) in RPM_SUSPENDED state.
> > >> > >
> > >> > > The PM domains (genpds) are then left in their current state, which
> > >> > > should allow us to call dev_pm_genpd_is_on() for the corresponding
> > >> > > supplier-devices, to figure out whether the bootloader turned them on
> > >> > > or not, I think.
> > >> > >
> > >> > > Moreover, to make sure the genpds are turned on when needed, we also
> > >> > > need to call pm_runtime_enable(platform->dev) and
> > >> > > pm_runtime_get_sync(platform->dev). The easiest approach is probably
> > >> > > to do that during ->probe() - and then as an improvement on top you
> > >> > > may want to implement more fine-grained support for runtime PM.
> > >> > >
> > >> > > [...]
> > >> > >
> > >> > > Kind regards
> > >> > > Uffe
> > >> >
> > >> > I did some tests here and I might be missing something. I used the
> > >> > dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
> > >> >
> > >> > @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >> >         if (dev->pm_domain)
> > >> >                 return 0;
> > >> >
> > >> >         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > >> > +       printk("hfranco: returned pd devs is %d", ret);
> > >> > +       for (int i = 0; i < ret; i++) {
> > >> > +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> > >> > +               printk("hfranco: returned value is %d", test);
> > >> > +       }
> > >> >         return ret < 0 ? ret : 0;
> > >> >  }
> > >> >
> > >> > This was a quick test to check the returned value, and it always return
> > >> > 1 for both pds, even if I did not boot the remote core.
> > >> >
> > >> > So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
> > >> > it and passed NULL to dev_pm_domain_attach_list().
> > >>
> > >> Right, that's exactly what we should be doing.
> > >>
> > >> > Booting the kernel
> > >> > now it correctly reports 0 for both pds, however when I start the
> > >> > remote core with a hello world firmware and boot the kernel, the CPU
> > >> > resets with a fault reset ("Reset cause: SCFW fault reset").
> > >> >
> > >> > I added both pm functions to probe, just to test:
> > >> >
> > >> > @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >> >                 goto err_put_clk;
> > >> >         }
> > >> >
> > >> > +       pm_runtime_enable(dev);
> > >> > +       pm_runtime_get_sync(dev);
> > >> > +
> > >>
> > >> Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
> > >> should turn on the PM domains for the device, which I assume is needed
> > >> at some point.
> > >>
> > >> Although, I wonder if this may be a bit too late, I would expect that
> > >> you at least need to call these *before* the call to rproc_add(), as I
> > >> assume the rproc-core may start using the device/driver beyond that
> > >> point.
> > >>
> > >> >         return 0
> > >> >
> > >> > Now the kernel boot with the remote core running, but it still returns
> > >> > 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
> > >> > or without the remote core running.
> > >>
> > >> dev_pm_genpd_is_on() is returning the current status of the PM domain
> > >> (genpd) for the device.
> > >>
> > >> Could it be that the genpd provider doesn't register its PM domains
> > >> with the state that the HW is really in? pm_genpd_init() is the call
> > >> that allows the genpd provider to specify the initial state.
> > >>
> > >> I think we need Peng's help here to understand what goes on.
> > >>
> > >> >
> > >> > I tried to move pm_runtime_get_sync() to .prepare function but it make
> > >> > the kernel not boot anymore (with the SCU fault reset).
> > >>
> > >> Try move pm_runtime_enable() before rproc_add().
> > >
> > >Thanks Ulf, that indeed made it work, at least now the kernel does not
> > >reset anymore with the SCU fault reset. However I am still only getting
> > >0 from dev_pm_genpd_is_on(), no matter what the state of the remote
> > >core. Maybe I am missing something in between?
> > >
> > >Peng, do you know what could be the issue here?
> >
> > imx_rproc_attach_pd
> >  ->dev_pm_domain_attach_list
> >       ->genpd_dev_pm_attach_by_id
> >               ->genpd_queue_power_off_work
> >                  ->cm40_pid0 is powered off because the genpd is set with is_off=false
> >
> > So dev_pm_genpd_is_on will return false after attach.
> >
> > This means that with U-Boot kick M4, cm40 might be powered off when
> > attaching the pd even with LINK_ON set, because genpd is set with is_off=false.
> >
> > The reason we set genpd to match real hardware status is to avoid RPC call
> > and to save power. But seems it could not work well with U-boot kicking M4.
> >
> > I not have good idea on how to address this issue. The current driver
> > could work with linux kick M4, M4 packed in flash.bin and M4 in a standalone
> > partition.
> 
> Thanks for the detailed analysis!
> 
> This is a very similar issue as many other genpd providers are
> suffering from - and something that I have been working on recently to
> fix.
> 
> A few days ago I posted a new version of a series [1], which is based
> upon using the fw_devlink and ->sync_state() support. In principle, we
> need to prevent genpd from power-off a PM domain if it was powered-on
> during boot , until all the consumer-drivers of a PM domain have been
> probed.
> 
> I had a look at the DT description of how imx describes power-domain
> providers/consumers, along with the corresponding genpd provider
> implementation in drivers/pmdomain/imx/scu-pd.c. Unless I missed
> something, I think [1] should do the trick for you, without any
> further changes. Can you please give it a try and see if that solves
> this problem?

Cool! I can give a try and provide an answer soon. Thanks!

> 
> [...]
> 
> Kind regards
> Uffe
> 
> [1]
> https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/

Best regards,
Hiago

