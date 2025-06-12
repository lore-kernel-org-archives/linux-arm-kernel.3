Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D465C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNxFg8PxKyiuoizCWNy+6ACkP8PYHeNOWM+dAdRlSGg=; b=3gZ/MHZloHFMWGoWEuBoeYSyOB
	kluN/KQ7O5aOT8NvymVfZZOXANke5RA2I+XByykCdfF6oH+5mUbUBtVDPLWVF15lyH8lnYEFcOl7j
	UYd2NJLeebjRVjRGQVqyQPUq5hBwGSkwi12F9BVQ/ET/OmP8Lubne1whVbGzFNWgJpksMsGRWjJl8
	5BzfXcRK+vrkOxEeUMVyEoLgd6m9dQQvAM3Kv8l+0iZcNxF0oly9qFURR3ssPktj0u83daI4TZKfd
	aoVeQy6zaWlilXFA5ogO53qdJzwAwCcEOG9N0+ps5LmrmpWUN8miTWJmu4OVogjyW5OYsAP8o9rEQ
	Ic5n6LgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDk-0000000EwsW-3AqM;
	Fri, 13 Jun 2025 00:24:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPlN5-0000000E0Tj-1FkQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:05:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso1560486a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749747946; x=1750352746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNxFg8PxKyiuoizCWNy+6ACkP8PYHeNOWM+dAdRlSGg=;
        b=AI8n0+kJkUT8XI4pdsljsASsiwQcbH5CLFNsSK0R1Q1g045/S6nocnfhi/l2anwjYT
         n64zcQy4O9/W2Fo/Tp2LAN8xSk2ycaQ+sAqCme1N97EFcI6uGdxpe8hJAUyMOpzTb/iX
         blFoM3D/bxsby2nOuHFBllfqa/NIKjY/lcN867KTPskp7ADdHx7ZLDH6q/j+59TgPubE
         TsgYrhsrWkKwuMP6NlNMEE6W0DnnY3z7+WP7EJo0jsFrP2tMS8lD77gGWti7271tE20X
         8KhPLBTKGRnauz3rZAJa4C8e5GJ2L8UV/sQbAEX0bfUBWm9muw+Im1bm+3jhSz8hEL7w
         /F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747946; x=1750352746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNxFg8PxKyiuoizCWNy+6ACkP8PYHeNOWM+dAdRlSGg=;
        b=WaXim1MKgOLhAU7tCONDsVrm8uktGLQMUBQrVxNQXHypxrc3LZzOBlVApISdfrpl/c
         D4eYtamTLLFQVo1e6or6mLNt30cfIVCH788HMiOtZ8YXQ5Gd0SQtyQDDx3G/YJ+Mg6Gv
         mqqPw7U24+6Tj3XlzQ5yl0w6kY0UrsCYT2qjbTl5mDuR1Bai9AOuN2wHrDQJNY54dGaX
         e5vTosTaZL4jz3wgx3RjqZc1NOXzlvpdIirGjfvhiQFbUcWNBcq10DBAzm1gfNQMoEn0
         hjqb9ImZGfO25prP9bFfM7IEkvxuws2r25dMZV7sppvlH2/5W3CZSvPUBYtW90ItqkMO
         Ic3A==
X-Forwarded-Encrypted: i=1; AJvYcCVyuLcE+eK11anhhxpOWFtQQoIkBZNPwcCzXoDcIEgM6wtqBDZreCfG0wLNtCNV7vlrLFlkSBQI9v2LPfOFnANG@lists.infradead.org
X-Gm-Message-State: AOJu0YyHOq5njAA86/w8grcN5yodAjLtiFp8zglgjztbEP+F/l2d3CRu
	ZCo7DP9vAtHsexRdbG+mxRIF38PoRamJZv+FjILXk6L+Tm7bsAW99UV3
X-Gm-Gg: ASbGnctBl84sXJfxBF/FskqE1anUbmZ6LZKV6tKVf4JKEsklLq7rXb/kEyW7TH7rjyA
	eM1Kjtd+hMHtxtTQ0DPFTJkh94R9ELo4L+HmfO8Ret4D7w/ORFwvJQ8VvcWmSaiKdq6nZs4uk/y
	UMaTDpNmQgrdIbtqfCGiFvSLAKdM5iUp2DVvYii2Shtu8LO4yQ3D4YVL+EWQem/+PuKXjLmaRgW
	IdfShyF5B4H4SkTVwxuITlaqY5gkAzzc0GY77A2tdf2dDwhSEyLXFIwxIis1lRjt1xWFBJA1eIY
	WpC6X5rYSGHwLt9cfXa20zkQmziXyeNolj7kG1wFOvjouUGETfAfDiIeD5Pj
X-Google-Smtp-Source: AGHT+IHhknZBtS5YbF0CJppl2HUlNUSeEzsngrk+Z0OR6pwaGzvadi+iraIcZLg169ex6XW9Mg09aQ==
X-Received: by 2002:a17:90b:2704:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-313af12a2bcmr13383532a91.11.1749747946385;
        Thu, 12 Jun 2025 10:05:46 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d2dd0sm1760004a91.17.2025.06.12.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:05:45 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:05:40 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
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
Message-ID: <20250612170540.ulflkvws4nty5vz5@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <wlcbd6tgwptv25ms2xfpqo5xkfoczg3l5kr6jae6qamdevmvbt@3ikiy7i53qy2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wlcbd6tgwptv25ms2xfpqo5xkfoczg3l5kr6jae6qamdevmvbt@3ikiy7i53qy2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_100547_341666_801784D6 
X-CRM114-Status: GOOD (  48.44  )
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

Hi Bjorn,

On Wed, Jun 11, 2025 at 10:36:33AM -0500, Bjorn Andersson wrote:
> On Wed, Jun 04, 2025 at 03:19:52AM +0000, Peng Fan wrote:
> > > Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
> > > pre-booted remote cores
> > > 
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > When the remote core is started before Linux boots (e.g., by the
> > > bootloader), the driver currently is not able to attach because it only
> > > checks for cores running in different partitions. If the core was kicked
> > > by the bootloader, it is in the same partition as Linux and it is already
> > > up and running.
> > > 
> > > This adds power mode verification through dev_pm_genpd_is_on(),
> > > enabling the driver to detect when the remote core is already running
> > > and properly attach to it if all the power domain devices are on.
> > > 
> > > To accomplish this, we need to avoid passing any attach_data or flags
> > > to dev_pm_domain_attach_list(), letting the platform device become a
> > > consumer of the power domain provider. With that the current power
> > > state of the genpds will not change, allowing the detection of the
> > > remote core power state.
> > > 
> > > We enable and sync the device runtime PM during probe to make sure
> > > the power domains are correctly managed when the core is controlled
> > > by the kernel.
> > > 
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v4: Changed to use the new dev_pm_genpd_is_on() function instead,
> > > as suggested by Ulf. This will now get the power status of the two
> > > remote cores power domains to decided if imx_rpoc needs to attach or
> > > not. In order to do that, pm_runtime_enable() and
> > > pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v3: Unchanged.
> > > v2: Dropped unecessary include. Removed the imx_rproc_is_on
> > > function, as suggested.
> > > v1:
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
> > >  1 file changed, 24 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > > 627e57a88db2..6f9680142704 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct
> > > notifier_block *nb,  static int imx_rproc_attach_pd(struct imx_rproc
> > > *priv)  {
> > >  	struct device *dev = priv->dev;
> > > -	int ret;
> > > -	struct dev_pm_domain_attach_data pd_data = {
> > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -	};
> > > +	int ret, i;
> > > +	bool detached = true;
> > > 
> > >  	/*
> > >  	 * If there is only one power-domain entry, the platform driver
> > > framework @@ -902,7 +901,22 @@ static int
> > > imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  	if (dev->pm_domain)
> > >  		return 0;
> > > 
> > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv-
> > > >pd_list);
> > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +	/*
> > > +	 * If all the power domain devices are already turned on, the
> > > remote
> > > +	 * core is already up when the kernel booted (e.g. kicked by
> > > the
> > > +	 * bootloader). In this case attach to it.
> > > +	 */
> > > +	for (i = 0; i < ret; i++) {
> > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +			detached = false;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (detached)
> > > +		priv->rproc->state = RPROC_DETACHED;
> > > +
> > >  	return ret < 0 ? ret : 0;
> > >  }
> > > 
> > > @@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev)
> > >  		}
> > >  	}
> > > 
> > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_enable(dev);
> > > +		pm_runtime_get_sync(dev);
> > 
> > Need put and disable in imx_rproc_remove.
> > 
> 
> Note that you also need to pm_runtime_put() if pm_runtime_get_sync()
> returns an error. So the suggestion is to use the convenience helper
> pm_runtime_resume_and_get() to handle this for you.
> 
> Probably a good idea to check the return value regardless.

Thanks for the review, noted, I can include this in the next version.

> 
> Regards,
> Bjorn
> 
> > BTW: Has this patchset tested with M4 in a separate partition,
> > saying M4 image packed in flash.bin?
> > 
> > Regards,
> > Peng
> > > +	}
> > > +
> > >  	ret = rproc_add(rproc);
> > >  	if (ret) {
> > >  		dev_err(dev, "rproc_add failed\n");
> > > --
> > > 2.39.5
> > > 
> >

Best Regards,
Hiago.

