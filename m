Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489D5C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4szaLzc/F2h1MlyYwOny8uUmi1IH+zWJep2HTDgXGs=; b=UkUQ7X6+0M6ecKIUIKzFOobhUw
	El2Ntmd/4NnLnTB1MnijIX3ubKTBaOYlz0ucYL8vRz6NaoEjlINPf7YMAyWxUE4AXFFO4QoTCzJNj
	qprFJyu+dMsrBhTLvDdljiyAcrNY5l6Ey9pQ43zfdk5YZrpaOFUVGqNzclJX48TMUnDdRruZ0Wxi5
	J5B2nUskviZthMkfS7JNGIPtuHAhFHjeFrm4LZzvWLrj08zNhlzEMRcnL5e4lYFoEmcFkkf1qJCYE
	rwXKCA1tZwStLqVjp2sVmcwfpQ58J9rSg3uSwlW7iy29jdXyLDrsmirCA18wwrZw1byGOYXwoZEn5
	zJ5xLo7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJt00-0000000AeFg-05jH;
	Tue, 27 May 2025 12:01:40 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsxo-0000000AdTt-2AwC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 11:59:26 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e7dc5f8148bso554277276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347163; x=1748951963; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4szaLzc/F2h1MlyYwOny8uUmi1IH+zWJep2HTDgXGs=;
        b=hx/k/Y1eiOR9zCnbgc4BpnIRyKmQE+sQ5VhFsLlInv7PRGxBrFo77DC6Og6z85p1OY
         St9YygVdgHNryLnOGJpjIACsMwKr7FRzNlqTkTzwE/RPeW9ezwnD0RzT+3mg12rLsdiM
         5h6Y7BJh2G5/RubGczrmr435R28ejKY3Y4e7kcqMof+2U1g3X4/6OKF1njWsiMu6DWDp
         jeoDyAfhh4W1S+wBbklC8JfjxQx1f/AM7dovKGErBtx4noQHjN0iT6goFYAWYaVrh9ro
         lq27Pr6gbGtbNPO8l4GA7qOkl76fDLd+46Gxr4Usq/V24PCRxh9QRjcevAe+vfHlBEt5
         9VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347163; x=1748951963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4szaLzc/F2h1MlyYwOny8uUmi1IH+zWJep2HTDgXGs=;
        b=Jg9lnhOE+zRHo0+o6W9pA1wVFdpxtKfS9ILrgWOhIso1vGNBKeN24mBJSyFuGFQ2g4
         85+j/aVgi7HZ2MoSvm6nWm32KJoVIXMQ7iOF1Ho2e+7+zBOA+bDonVSiwE/WLQ8ibPC2
         M5xQvLWIntJQn39ibTIYnT+N05n35+2mvKL+891EO1nFToiop+9RuFrcE6jr7ZpmUidM
         F8cS7OdQbVPTqKDBVAhb3NNSXD6fiN2v3KLQZaaTL/Ox7OPsBBQyWVx0b8q9ccvkcIrC
         P1OrTolXQ7wgOCuFiCecfDjue2ty9SMsNba7IBhsXjZy8kUoqzsG+A2zq0pNsgsQ9hrs
         9PRA==
X-Forwarded-Encrypted: i=1; AJvYcCWDXmDrBw97axVgTy/7lwXVUMJx12AilvrSjiwB0BR/L1Qy3GIGK5BoZH8SobnHmI7XknlrrfMiaIfaEFstibYp@lists.infradead.org
X-Gm-Message-State: AOJu0YzC505E8SaqzO8Lz/HlItGuxpHhMU3tjuDLyQvxso1IHCivSX+1
	PA+74YMfj4NBJkHnEYkr9p2ZaistAovrVNHqzLNqSG0Dt+TaVCLZhMzzjF5B08pUzUV0egzB4+C
	bf9J9r4qMvJrCIYTJkNCjaxiRvU7SLHex3s63Y0D1Cw==
X-Gm-Gg: ASbGnct2+gU7i02FUwpEW+In7cVhZR/+Ioei4OORIjkVKEil91WPBB9Avori5Kc7SIF
	cQmY9V8gSPFexIJuEv1VAISfJMdWmYBIYd8VdK+5YeKzVPTjCU8z0a+kTtODRTDrrjGTb7u0JNx
	RwHxHkv8yex87brsXfeQZDH1V/3vJXQbKoUg==
X-Google-Smtp-Source: AGHT+IGKfe3vNrVmk4UJNSrzHf1HzxY3z+PLvn7rrFkkGWoEaq5BirzXQytDxVB9kstnSznqWcVD3oPaUzvTQgaFbac=
X-Received: by 2002:a05:6902:722:b0:e7d:c4e4:3295 with SMTP id
 3f1490d57ef6-e7dd031e2c1mr376900276.1.1748347163229; Tue, 27 May 2025
 04:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250509191308.6i3ydftzork3sv5c@hiago-nb> <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb> <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux> <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb> <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
 <20250527000510.fofehmsdhifcwlys@hiago-nb> <20250527023921.GA14252@nxa18884-linux>
In-Reply-To: <20250527023921.GA14252@nxa18884-linux>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 May 2025 13:58:46 +0200
X-Gm-Features: AX0GCFsGQsZvMPYEw23_m2_PwaUZ98TXNs_OMa1x3DVp8g7JgD3e4NzGOr3Ljfk
Message-ID: <CAPDyKFqZkcaGfss=Oi+H9UERFU29jY2t5uTPnGVGQgSAJSeCoA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>, Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_045924_845950_1ABAB21F 
X-CRM114-Status: GOOD (  64.43  )
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

On Tue, 27 May 2025 at 03:29, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Mon, May 26, 2025 at 09:05:10PM -0300, Hiago De Franco wrote:
> >On Mon, May 26, 2025 at 12:07:49PM +0200, Ulf Hansson wrote:
> >> On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >> >
> >> > Hi Ulf,
> >> >
> >> > On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> >> > > You should not provide any flag (or attach_data to
> >> > > dev_pm_domain_attach_list()) at all. In other words just call
> >> > > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> >> > > drivers/remoteproc/imx_dsp_rproc.c does it.
> >> > >
> >> > > In this way, the device_link is created by making the platform->dev
> >> > > the consumer and by keeping the supplier-devices (corresponding to the
> >> > > genpds) in RPM_SUSPENDED state.
> >> > >
> >> > > The PM domains (genpds) are then left in their current state, which
> >> > > should allow us to call dev_pm_genpd_is_on() for the corresponding
> >> > > supplier-devices, to figure out whether the bootloader turned them on
> >> > > or not, I think.
> >> > >
> >> > > Moreover, to make sure the genpds are turned on when needed, we also
> >> > > need to call pm_runtime_enable(platform->dev) and
> >> > > pm_runtime_get_sync(platform->dev). The easiest approach is probably
> >> > > to do that during ->probe() - and then as an improvement on top you
> >> > > may want to implement more fine-grained support for runtime PM.
> >> > >
> >> > > [...]
> >> > >
> >> > > Kind regards
> >> > > Uffe
> >> >
> >> > I did some tests here and I might be missing something. I used the
> >> > dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
> >> >
> >> > @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >> >         if (dev->pm_domain)
> >> >                 return 0;
> >> >
> >> >         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> >> > +       printk("hfranco: returned pd devs is %d", ret);
> >> > +       for (int i = 0; i < ret; i++) {
> >> > +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> >> > +               printk("hfranco: returned value is %d", test);
> >> > +       }
> >> >         return ret < 0 ? ret : 0;
> >> >  }
> >> >
> >> > This was a quick test to check the returned value, and it always return
> >> > 1 for both pds, even if I did not boot the remote core.
> >> >
> >> > So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
> >> > it and passed NULL to dev_pm_domain_attach_list().
> >>
> >> Right, that's exactly what we should be doing.
> >>
> >> > Booting the kernel
> >> > now it correctly reports 0 for both pds, however when I start the
> >> > remote core with a hello world firmware and boot the kernel, the CPU
> >> > resets with a fault reset ("Reset cause: SCFW fault reset").
> >> >
> >> > I added both pm functions to probe, just to test:
> >> >
> >> > @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >> >                 goto err_put_clk;
> >> >         }
> >> >
> >> > +       pm_runtime_enable(dev);
> >> > +       pm_runtime_get_sync(dev);
> >> > +
> >>
> >> Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
> >> should turn on the PM domains for the device, which I assume is needed
> >> at some point.
> >>
> >> Although, I wonder if this may be a bit too late, I would expect that
> >> you at least need to call these *before* the call to rproc_add(), as I
> >> assume the rproc-core may start using the device/driver beyond that
> >> point.
> >>
> >> >         return 0
> >> >
> >> > Now the kernel boot with the remote core running, but it still returns
> >> > 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
> >> > or without the remote core running.
> >>
> >> dev_pm_genpd_is_on() is returning the current status of the PM domain
> >> (genpd) for the device.
> >>
> >> Could it be that the genpd provider doesn't register its PM domains
> >> with the state that the HW is really in? pm_genpd_init() is the call
> >> that allows the genpd provider to specify the initial state.
> >>
> >> I think we need Peng's help here to understand what goes on.
> >>
> >> >
> >> > I tried to move pm_runtime_get_sync() to .prepare function but it make
> >> > the kernel not boot anymore (with the SCU fault reset).
> >>
> >> Try move pm_runtime_enable() before rproc_add().
> >
> >Thanks Ulf, that indeed made it work, at least now the kernel does not
> >reset anymore with the SCU fault reset. However I am still only getting
> >0 from dev_pm_genpd_is_on(), no matter what the state of the remote
> >core. Maybe I am missing something in between?
> >
> >Peng, do you know what could be the issue here?
>
> imx_rproc_attach_pd
>  ->dev_pm_domain_attach_list
>       ->genpd_dev_pm_attach_by_id
>               ->genpd_queue_power_off_work
>                  ->cm40_pid0 is powered off because the genpd is set with is_off=false
>
> So dev_pm_genpd_is_on will return false after attach.
>
> This means that with U-Boot kick M4, cm40 might be powered off when
> attaching the pd even with LINK_ON set, because genpd is set with is_off=false.
>
> The reason we set genpd to match real hardware status is to avoid RPC call
> and to save power. But seems it could not work well with U-boot kicking M4.
>
> I not have good idea on how to address this issue. The current driver
> could work with linux kick M4, M4 packed in flash.bin and M4 in a standalone
> partition.

Thanks for the detailed analysis!

This is a very similar issue as many other genpd providers are
suffering from - and something that I have been working on recently to
fix.

A few days ago I posted a new version of a series [1], which is based
upon using the fw_devlink and ->sync_state() support. In principle, we
need to prevent genpd from power-off a PM domain if it was powered-on
during boot , until all the consumer-drivers of a PM domain have been
probed.

I had a look at the DT description of how imx describes power-domain
providers/consumers, along with the corresponding genpd provider
implementation in drivers/pmdomain/imx/scu-pd.c. Unless I missed
something, I think [1] should do the trick for you, without any
further changes. Can you please give it a try and see if that solves
this problem?

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/

