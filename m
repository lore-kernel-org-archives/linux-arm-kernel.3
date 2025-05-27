Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54262C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 00:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Addthv64Q3TTSQf/2nFhVGk8jr68iUDk2g8AigrRaGQ=; b=fZMwCFs0XK1mhlTT6gDyVxL+MS
	jJvnQ/HfAlW613uqgUK9id6W0jxdiamTIzSreo8ZEWJq/Y/n/fdM3p8osjfXOeQ8//A1CDwB4HbYt
	1h8Cmmbd7gZ+FygbXwFEfonPyhedEnOKRDWXsCCvVnWb9ukx3dXaw/m2ead1QKX2MvbOw8QJ91FVe
	tXTm+fQJFLcz+D7AR9GFKwYdKNofdOX22jIc1GMGkRcgvKmmJjXvEBhMRU+ENDxNSGM0+e3JxyW38
	2c4e2fctkqOFyRNnN41FctdBdIrK7pCVaq+cuz7raIanbIc+3EbF44u8HYee3S7Gho18KIcnnYOOe
	JOOOfysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJhqx-00000009elI-0saP;
	Tue, 27 May 2025 00:07:35 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJhok-00000009ebK-43ph
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 00:05:20 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-52413efd0d3so924539e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 17:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748304317; x=1748909117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Addthv64Q3TTSQf/2nFhVGk8jr68iUDk2g8AigrRaGQ=;
        b=L+AYcBaT8C+rLbXa5fcoTekh6JOECWvk45X7ZRaieHalspodeFVd1GG0uqtV/MsJt/
         3TWLR8CB4tEFbgYVP5dMbxR/X9lpCDy6YXmsd1s/PAoOxOUWQFcaEcC8jn6xblEga2xT
         90j763HRCm1kbiArXxrmgwMEhKOXbiu/tb07sbYmteDeOJFV2izMUMYnKTVyFae406he
         02pC37jRXjeudgex2QuY/TGnNaSolbdP9kYI+DGIYK99NCJ2J4le+Ef7o3Y3HebppnMK
         RYhSLtKWAIS8G8q69uF9rXpOnmjlygvCZrfEnv9W8Yxu06H4t0mm5El44YBz+JFCxOvt
         X0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748304317; x=1748909117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Addthv64Q3TTSQf/2nFhVGk8jr68iUDk2g8AigrRaGQ=;
        b=MFQdS6lIDsipxJvsDDHYxQMBcPLZHl1uqwa7Fa8BL0lNI9pqbLMbaRtnNGAbPo6JGo
         AZRtsrRN51a0B4kqscNmvIK+DuKbbYI8XlzG6xyXKewTUiuo9bnCQBeLdFVE8O1DQN9a
         hy15il8XYtRxe/+RUUlIAkHmxD8rZBGFh8kNdDPjwYMHtYjQ3A2AGRjWIxVQRBR0OaR1
         JZTBpRWPyuNmqeVvIQW0z/BZ4UasJSVsgg7wfnO1sxmYblF+Z6wIp1ZoDEGpryohmaSN
         w1Utbe5eSBxphyZUdw9xCmfHjnGmp7CELCB988oQS5VEclpblNT7CvUigtpzHDq98ofk
         7Kcg==
X-Forwarded-Encrypted: i=1; AJvYcCUhdCtHIgloPphJyuYf8/bmH26PPXpg6O38rAc4AX0qQdZw0TdzkgoLetUi8IyZrvWYy23zaEwexSvtCn+g0RH+@lists.infradead.org
X-Gm-Message-State: AOJu0YymxB36YSh7U6F9cdmEnS1fJFNo6sc8sh2Nb3SwdKje7P8+uxMO
	RPq/SDc/LSQrMcnqcfsjDAibmcmJzOLcXYn3wSlf99yXBJ6TzFNFTzQ7
X-Gm-Gg: ASbGncvhAue9vJkBuITNXunzBhL55lnnzj81UEmUPnRpaPC6QRYDyn/iaIkEkE2xnSk
	j6nDl3pzPVf066gV2Eb7YcauDi4XQFc9qdm+d2LZV0R/l5eKTAQuxS3kpFkE9HeZAfIYDafukfi
	HfmM3z+bHS6rKUXP+UUd/QpHmWgmO9yGRVR4X/7pjIjYi3tKn5vpdqHPrTT0+ikmU9qUyy9kW/K
	ZojvE4H4keoJ4+VAz4sfc0VKYuUHo4HoyFvlNqI4sSJgJ4xfAP906PtsB+KwRdlAdl2upgNG0dZ
	an0JWBL+uLawvVPh2MOXIntexH0f6RueJkIBvVgfsw8QYU/rnQM=
X-Google-Smtp-Source: AGHT+IHEjq49q8FhVaC/VV5WmHQM/CAYARQEncGZ9g1VnXXQ7c/Eg+DEVGvPVjcXeeAr8+7lupfz7w==
X-Received: by 2002:a05:6122:169b:b0:52a:863f:4189 with SMTP id 71dfb90a1353d-52f2c5923f8mr7340486e0c.8.1748304317399;
        Mon, 26 May 2025 17:05:17 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c1:78c2:1931:19db:1830:5cf4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52f2f73d4b4sm4433946e0c.20.2025.05.26.17.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 17:05:16 -0700 (PDT)
Date: Mon, 26 May 2025 21:05:10 -0300
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
Message-ID: <20250527000510.fofehmsdhifcwlys@hiago-nb>
References: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb>
 <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux>
 <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com>
 <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
 <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_170519_021966_FE98C00C 
X-CRM114-Status: GOOD (  54.05  )
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

On Mon, May 26, 2025 at 12:07:49PM +0200, Ulf Hansson wrote:
> On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hi Ulf,
> >
> > On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> > > You should not provide any flag (or attach_data to
> > > dev_pm_domain_attach_list()) at all. In other words just call
> > > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> > > drivers/remoteproc/imx_dsp_rproc.c does it.
> > >
> > > In this way, the device_link is created by making the platform->dev
> > > the consumer and by keeping the supplier-devices (corresponding to the
> > > genpds) in RPM_SUSPENDED state.
> > >
> > > The PM domains (genpds) are then left in their current state, which
> > > should allow us to call dev_pm_genpd_is_on() for the corresponding
> > > supplier-devices, to figure out whether the bootloader turned them on
> > > or not, I think.
> > >
> > > Moreover, to make sure the genpds are turned on when needed, we also
> > > need to call pm_runtime_enable(platform->dev) and
> > > pm_runtime_get_sync(platform->dev). The easiest approach is probably
> > > to do that during ->probe() - and then as an improvement on top you
> > > may want to implement more fine-grained support for runtime PM.
> > >
> > > [...]
> > >
> > > Kind regards
> > > Uffe
> >
> > I did some tests here and I might be missing something. I used the
> > dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
> >
> > @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >         if (dev->pm_domain)
> >                 return 0;
> >
> >         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +       printk("hfranco: returned pd devs is %d", ret);
> > +       for (int i = 0; i < ret; i++) {
> > +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> > +               printk("hfranco: returned value is %d", test);
> > +       }
> >         return ret < 0 ? ret : 0;
> >  }
> >
> > This was a quick test to check the returned value, and it always return
> > 1 for both pds, even if I did not boot the remote core.
> >
> > So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
> > it and passed NULL to dev_pm_domain_attach_list().
> 
> Right, that's exactly what we should be doing.
> 
> > Booting the kernel
> > now it correctly reports 0 for both pds, however when I start the
> > remote core with a hello world firmware and boot the kernel, the CPU
> > resets with a fault reset ("Reset cause: SCFW fault reset").
> >
> > I added both pm functions to probe, just to test:
> >
> > @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >                 goto err_put_clk;
> >         }
> >
> > +       pm_runtime_enable(dev);
> > +       pm_runtime_get_sync(dev);
> > +
> 
> Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
> should turn on the PM domains for the device, which I assume is needed
> at some point.
> 
> Although, I wonder if this may be a bit too late, I would expect that
> you at least need to call these *before* the call to rproc_add(), as I
> assume the rproc-core may start using the device/driver beyond that
> point.
> 
> >         return 0
> >
> > Now the kernel boot with the remote core running, but it still returns
> > 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
> > or without the remote core running.
> 
> dev_pm_genpd_is_on() is returning the current status of the PM domain
> (genpd) for the device.
> 
> Could it be that the genpd provider doesn't register its PM domains
> with the state that the HW is really in? pm_genpd_init() is the call
> that allows the genpd provider to specify the initial state.
> 
> I think we need Peng's help here to understand what goes on.
> 
> >
> > I tried to move pm_runtime_get_sync() to .prepare function but it make
> > the kernel not boot anymore (with the SCU fault reset).
> 
> Try move pm_runtime_enable() before rproc_add().

Thanks Ulf, that indeed made it work, at least now the kernel does not
reset anymore with the SCU fault reset. However I am still only getting
0 from dev_pm_genpd_is_on(), no matter what the state of the remote
core. Maybe I am missing something in between?

Peng, do you know what could be the issue here?

> 
> >
> > Do you have any suggestions? Am I doing something wrong with these PDs?
> >
> > Best regards,
> > Hiago.
> 
> Kind regards
> Uffe

Best regards,
Hiago

