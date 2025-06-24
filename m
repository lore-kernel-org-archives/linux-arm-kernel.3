Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84001C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=; b=oM1nFMTne1lj9G/wu/Q3vWisUo
	0b3LnDuYfaxRMDtWLXkjL83Dzcwrdn3VfW5oYrf0Pos3sGBobzxoJlYFiC/vX85HXvWnGXKOEQl7t
	zl1g5yjfbt8ADKSoznTtHGA1VvA9LHS7R+i16cUYzNbPVcZSZwmOFDBzZlkQylrOMmPfLJPC+7BhV
	QrxsW1Gg95oY4hCN986iGhKE1rTyjmU1WgGjeAq8Vn9THYva6Il23pPiY97gF4G2egZ/GkQT4kjCF
	MfarmdIyo5OcL2z5rkzUQUzaXprYDmzR9k0OWxnN6UAAS4KRveWtp4ERBpdqQDrmd9Lqz2l/tC1wQ
	K7BmkAvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jJ-00000006faJ-16YE;
	Tue, 24 Jun 2025 19:54:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6K5-00000006Fln-0Y5B
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 16:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=; b=ddeXr3yLbbHQk/+UsGFa/YjkYh
	38piAr/opVivm5hYvQr2U3l5mKo0wjyywMdp1Rn3Ro/9+9XkqX0ikKj4dVLQ+bVC3jbCJed82ZF9q
	NR849PrNciIwmBf6OJv39lhCLnGZUZ6rxxwfDf33sh0cS+69xXMGVhXNE5P8YbBNPlrv7wRpk2jzb
	O2vekXGm7qHfAp90SUKrjcignt6F1MU/gVDw1PEYG6ISXqmQbWjmHgv4eZXAtMBahhohTHPCL9Jn7
	bxSPdGxOfBJpEBta1uExIez0oKqsE5Wf/H1I4iRawk7rzIbTDnaiZfLTtnF1jJMXEiHNEcEWfwRDz
	VrNM4a4A==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6Jy-00000005Udw-3gLK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:16:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-237e6963f63so21100385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781788; x=1751386588; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=;
        b=bMCKBxfX5sANu7PENoNu1HFQjwGYCcIGAKspVsK1sPpweSwwrrZmbz5n5j3/3rrU+4
         49UPT8WGz19DI4G1I10Ianm169cB9pPheI9MMmOs2sQ7UMfRXTVwJF4YrNMInKZ7e4cV
         Q50yGlmkH1Ig/IqlplMMDfNseP08HX6NXhXYi/COJDQ9rhEeKezrUNCQZhmilh8JqAii
         BqSPaegjCy1QfBkC3zZW0ptsmafp+//D+C/6/yS1Qsyvk1Il5T0NtF8SVVPlAAwvU40/
         OHoQiYfJijVqkfi0rNngFv+9dVnY1OPT8JxkW8iWJ0WroCdL5hyoKr1gr80tKvBD+L0p
         xSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781788; x=1751386588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=;
        b=nZcD3c2XSwgZB7719FKwum4Td1Nr8d+Wh8uILjKAq/vvF4eJz0vVQ5TEcdO+sNHpt6
         lpOVPq/KlGmDpk57dNtXi5S8PcHFEgMeBo0v4L2FNgB6Q9ysnp50yPiOpV7OL3VIXwZl
         /n7+Hff/ebbGKC1Yha47S8eGu/KgFziIOC8QvWA3yrywqOon/tW3PwcSJRtbyGVFeOFp
         ZhMgegUmPnPPSCRISGR1IDBzebdRBOUqlZ/tkM/w6SDxQtantHIoDy8+5iZkH4yZDPI4
         oBTLCvnMoKfDiZN4/Sol+t6VjPYtSjepihkq6nt4m+F1X9CK+tz5Jg6+FUOkmHfwYDWJ
         hi7g==
X-Forwarded-Encrypted: i=1; AJvYcCVOoz6OqXamFG7w46sfDECVOUu87vtV2aty2R8vKkNFOJhD/JovKS86xnN9e8QTHqM0WjbA4sTSyv4598iQwV/l@lists.infradead.org
X-Gm-Message-State: AOJu0YxeDhJLJzeh6KCTSBeo3lEOVdUUi6Hseehk0I+lZdVpeAM9Uaz2
	DOM38O6YqMOIZCpi9bWT216RA7gibSIu2yQfmIIkB0nXRSTjFUBv75ku
X-Gm-Gg: ASbGncsWWI6xB6yMeL08nfKaRusLr099xincOzDxd8mRThNSyk0V8MNDzdv84ninKr2
	p61thIgq6UuQY8JnMxOvHy0yxHLxmrAggB8oM/lA7CU9/bLZ9xlvmDcXac1xEYX/TEmhJSfcptX
	7iBcKWWWlRughkhk+EwkLipzTgTq4MZ2gu9aF56YvztWYPouzkNoO+Gn+brMZ4qyPQrbFJX2qZr
	/LXPfRgcsNPP1RC+u5e2hsfnJ37vCLopHp3P9Dl0GUeHJig4kWPPaQdAbHlwigblTAcjFuiAuGi
	zgbLGIxJ9S7gjf5pBOJcAienb3SvPAUEVJ81BjsZjpScqmCW5I4luR46Xxc=
X-Google-Smtp-Source: AGHT+IEB7+JGugYqV5zduLPORaFjWnC/NvHOQ1eCIFSqcy93HLbICht89vczTaXjsuDyhkTFRVgqjQ==
X-Received: by 2002:a17:902:ce8c:b0:235:880:cf8a with SMTP id d9443c01a7336-237d97fbc21mr269719685ad.15.1750781787597;
        Tue, 24 Jun 2025 09:16:27 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23809a8ee2esm16496185ad.227.2025.06.24.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:16:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:16:21 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250624161621.fezba5p3dmecnor6@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-4-hiagofranco@gmail.com>
 <aFly61yCMttkp12e@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFly61yCMttkp12e@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_171630_992579_E8037289 
X-CRM114-Status: GOOD (  46.90  )
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

On Mon, Jun 23, 2025 at 09:29:47AM -0600, Mathieu Poirier wrote:
> On Tue, Jun 17, 2025 at 04:34:50PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> 
> Again, we have a nomenclature issue here with "If the core was kicked by the
> bootloader".  What does "kicked" mean here?  Is it just powered and held in
> reset or is it executing.  And are you referring to the A core or the M core?

Ok, same here, I will improve this in the next revision. Thanks.

> 
> 
> > by the bootloader, it is in the same partition as Linux and it is
> > already up and running.
> > 
> > This adds power mode verification through dev_pm_genpd_is_on(), enabling
> > the driver to detect when the remote core is already running and
> > properly attach to it if all the power domain devices are on.
> > 
> > To accomplish this, we need to avoid passing any attach_data or flags to
> > dev_pm_domain_attach_list(), letting the platform device become a
> > consumer of the power domain provider. With that the current power state
> > of the genpds will not change, allowing the detection of the remote core
> > power state.
> > 
> > We enable and sync the device runtime PM during probe to make sure the
> > power domains are correctly managed when the core is controlled by the
> > kernel.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4 -> v5:
> >  - pm_runtime_get_sync() removed in favor of
> >    pm_runtime_resume_and_get(). Now it also checks the return value of
> >    this function.
> >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> >    function.
> > v3 -> v4:
> >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> >    suggested by Ulf. This will now get the power status of the two
> >    remote cores power domains to decided if imx_rpoc needs to attach or
> >    not. In order to do that, pm_runtime_enable() and
> >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >    suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..b53083f2553e 100644
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
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  {
> >  	struct device *dev = priv->dev;
> > -	int ret;
> > -	struct dev_pm_domain_attach_data pd_data = {
> > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > -	};
> > +	int ret, i;
> > +	bool detached = true;
> >  
> >  	/*
> >  	 * If there is only one power-domain entry, the platform driver framework
> > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  	if (dev->pm_domain)
> >  		return 0;
> >  
> > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +	/*
> > +	 * If all the power domain devices are already turned on, the remote
> > +	 * core is already up when the kernel booted (e.g. kicked by the
> > +	 * bootloader). In this case attach to it.
> 
> Same comment as above.  What got kicked?  A core or M core.  And what does
> "kicked" mean?  I can guess what is happening but guessing rarely leads to
> anything positive.
> 
> In the next revision, please use other words than "kicked".

Noted, thanks.

> 
> 
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
> 
> Ok for the above.
> 
> >  	return ret < 0 ? ret : 0;
> >  }
> >  
> > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_enable(dev);
> > +		ret = pm_runtime_resume_and_get(dev);
> > +		if (ret) {
> > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > +			goto err_put_clk;
> > +		}
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> >  	struct rproc *rproc = platform_get_drvdata(pdev);
> >  	struct imx_rproc *priv = rproc->priv;
> >  
> > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_disable(priv->dev);
> > +		pm_runtime_put(priv->dev);
> > +	}
> >  	clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> >  	imx_rproc_put_scu(rproc);
> > -- 
> > 2.39.5
> > 

