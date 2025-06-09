Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0Qu66z7kDW3js03KQPZ0HZb8QpcE1+x1gXTQ8PQnaU=; b=uvIbvGRCQse2BBteMVqmxmMMg9
	Su61CZqvY96tn081AuQQPwb9ixqzw4m2WHyGomnFb0NxOCfaLkS5v5wMoSmvtZqFVAkcADiiPHq9F
	roGeFjUjFHr1FJ5oHqhTlocJ66C+blcctP9waDv0kBA7j+OlOI3xkUcpC2PY/cPZGS76MYAyBb/p3
	7mXsJs/T8SVuFIqMxgY3ngM1oDQe5AJNg6UCxx5CtWf59amLAZl1G/W1siLgq2FOrgIghxkahqH+b
	V5TUBq6UMFYgFlu+UsVxK2+UHJ5irjY8/B5dShjtA3SYMSvW6OfqeTVZMkuTX9vatv1l7ovfa5z/U
	VzT8xQWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOhXB-00000004wOJ-19HM;
	Mon, 09 Jun 2025 18:47:49 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOgLE-00000004oHw-3xhZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:31:26 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-530eec21626so722590e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749490283; x=1750095083; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Qu66z7kDW3js03KQPZ0HZb8QpcE1+x1gXTQ8PQnaU=;
        b=N5UuceqY+5u1SB9cL18P1KoaiziNCKUJKafWE9d6bVkforOrFI7MRG01TwQFfOIQSx
         ocnhYMOnobLtvinBbwBX9voM47vJYjOoW/QB/8F2n/MP4TWoa+g6Hm+6zBr9AD9YSbyc
         +fJYEiSKAgb/+ZIokZPyBIbMqkEWrc99MyexUXIt5lPTB8lgoV6qxp4L3TkDkTy0lCMJ
         HtkN2jQGdJEzBweQahRLzbMFBuKDIfo+OxwkkpWHlTZdPq0DbN0o8Ya2jXpNcjDZdaoC
         zJlYiV7JR2yDYMeXWCWUO4vGvtV0V9zALvbhE+8FxyAu+0EYS46mt5Ji2Sx13+FwHyf+
         Vkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490283; x=1750095083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Qu66z7kDW3js03KQPZ0HZb8QpcE1+x1gXTQ8PQnaU=;
        b=WsLNOoHjHfbVvAxCW37jKEZyvpURpOZyX+fbCzT/1F3A5BpFISTyj6jfP14nFXMIDs
         qiJJtCrdJjuC/FZQvmDiLe6rHqY5mX75Y4NlKstjyAmAeadpTg2vyAxWRW2m5ZjjhUGz
         GGqEH5Nz5+Nsi0gdjCfg99MLeKv13ZLQVsN6/I+Js6+tWWz0sJSG6nqS5pdyFree61Vh
         jZ58kMmgg0O+GL8JPSk0w7iJ3mbY9pm5ULE3Vhgu2ReXOJCafZgrC0pJePtXxATsOuOU
         K0CmpmOLY37uVVsBarZGYI8vv+yV8+RT6cYO6MnJGfl5KlCXnIgugGHtMlgEt+EoUtwA
         9s4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWALYt3lTHeKTIfjbSgnfExJpnh+LVS7BGucmNT7lJ5KCCZ9yGbHBk1izzKZHoe3bc77yGwyFbHZeFJ54zijvub@lists.infradead.org
X-Gm-Message-State: AOJu0Yw84H2jyRMdzK5Er95PHsBFHG3cnivpCF3noDqjyZv7yHVzKLKN
	yEzBstg3olbqBV5x1U/DYKfgwwjZycfNVTRmRJ7xt3qyN/yv2T8KVyi0
X-Gm-Gg: ASbGncuoTlgOJgpbbUOBgUsDJ7Tvhka20QStqDIRVG0IUSq1S6cehqhDcv43IsSWmef
	jDkeuSpbkW13M0Z+I9AqwcKjguBQ/uSEyzGOdEwkzEwtYUhglEGnQC7/2UrKtsLJx/pYBHhI4Av
	OKD4O6WkoFO7SOzhLHDDBBMg6QyqGP+xwLRGJGFkXHHDZ9mdsMcFE8PkCw0cD7XMXRYjl1Sx7PU
	2sNJURFM6VvPPXa8sxDmp48x7ZU/+50gxHAfV0BZfLdvB4MXWiDDqEBW5zZmF6lonQuxncC50Ko
	lqSx6rCGYmAoC8kTxJM0Fg3oXI65At/uNpqScgIdF+uSEHtgag==
X-Google-Smtp-Source: AGHT+IGzoebj1QMPet5l8I9qWvt9vrbw2pGLKm4WGcWKCZt5wa18t6jdZYC5Lc1lX0z+RxP/znejvw==
X-Received: by 2002:a05:6122:8d1:b0:52b:789:2d0 with SMTP id 71dfb90a1353d-530e47ed0a2mr11738050e0c.5.1749490282233;
        Mon, 09 Jun 2025 10:31:22 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113abd74bsm32564e0c.17.2025.06.09.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:31:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:31:15 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250609173115.qecc2noswkcgr3hm@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_103124_984927_A5E75548 
X-CRM114-Status: GOOD (  43.66  )
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

On Wed, Jun 04, 2025 at 03:19:52AM +0000, Peng Fan wrote:
> > Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
> > pre-booted remote cores
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> > by the bootloader, it is in the same partition as Linux and it is already
> > up and running.
> > 
> > This adds power mode verification through dev_pm_genpd_is_on(),
> > enabling the driver to detect when the remote core is already running
> > and properly attach to it if all the power domain devices are on.
> > 
> > To accomplish this, we need to avoid passing any attach_data or flags
> > to dev_pm_domain_attach_list(), letting the platform device become a
> > consumer of the power domain provider. With that the current power
> > state of the genpds will not change, allowing the detection of the
> > remote core power state.
> > 
> > We enable and sync the device runtime PM during probe to make sure
> > the power domains are correctly managed when the core is controlled
> > by the kernel.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4: Changed to use the new dev_pm_genpd_is_on() function instead,
> > as suggested by Ulf. This will now get the power status of the two
> > remote cores power domains to decided if imx_rpoc needs to attach or
> > not. In order to do that, pm_runtime_enable() and
> > pm_runtime_get_sync() were introduced and pd_data was removed.
> > v3: Unchanged.
> > v2: Dropped unecessary include. Removed the imx_rproc_is_on
> > function, as suggested.
> > v1:
> > ---
> >  drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> > 627e57a88db2..6f9680142704 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct
> > notifier_block *nb,  static int imx_rproc_attach_pd(struct imx_rproc
> > *priv)  {
> >  	struct device *dev = priv->dev;
> > -	int ret;
> > -	struct dev_pm_domain_attach_data pd_data = {
> > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > -	};
> > +	int ret, i;
> > +	bool detached = true;
> > 
> >  	/*
> >  	 * If there is only one power-domain entry, the platform driver
> > framework @@ -902,7 +901,22 @@ static int
> > imx_rproc_attach_pd(struct imx_rproc *priv)
> >  	if (dev->pm_domain)
> >  		return 0;
> > 
> > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv-
> > >pd_list);
> > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +	/*
> > +	 * If all the power domain devices are already turned on, the
> > remote
> > +	 * core is already up when the kernel booted (e.g. kicked by
> > the
> > +	 * bootloader). In this case attach to it.
> > +	 */
> > +	for (i = 0; i < ret; i++) {
> > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +			detached = false;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (detached)
> > +		priv->rproc->state = RPROC_DETACHED;
> > +
> >  	return ret < 0 ? ret : 0;
> >  }
> > 
> > @@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct
> > platform_device *pdev)
> >  		}
> >  	}
> > 
> > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_enable(dev);
> > +		pm_runtime_get_sync(dev);
> 
> Need put and disable in imx_rproc_remove.
> 
> BTW: Has this patchset tested with M4 in a separate partition,
> saying M4 image packed in flash.bin?

Sorry for the delay.

I tested it now and there must be something missing on my U-Boot:

Disable imx8x-cm4 rsrc 278 not owned
Disable imx8x-cm4 rsrc 297 not owned

It removes my nodes from the DT before starting the kernel, so I cannot
attach. Do you know what should I do in this case?

But apart from that, at least the imx-rproc does not crash or anything.

> 
> Regards,
> Peng
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> > --
> > 2.39.5
> > 
> 

Best Regards,
Hiago.

