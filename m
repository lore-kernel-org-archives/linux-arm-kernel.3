Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAADFC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfxhwSOG/RM0gPvUyXeyOo3ZKbVYGqvyCyXESojdWoQ=; b=I8Bzw0/gmuTaVyFOvAGwSFDLkY
	B7JnrK+FRRj616Q9Jsrozf7iIqD3a2U+ciktV+lK7T3FXASmzDLjkP5B02IV1/jBdK+nP0ODzX7rs
	rljLLogCIzo6iDUwv7NNs0u0wDdRMdUG9qkEoHUI338sLMcyueRY7xzCMDRjAgIIHxjEC5L1TXC21
	u89jLTK20JBUmaCdlUSkX9/7yGwlDdwNhVfHh2Ip6fpXHcAdSm8TB0Qs551zAAX46SbmKbgKFFw8s
	TkflvH+VIjGFL0xR9zLR9oau7g+fLOPg2DvfNfyrVYtPeiGAIReTZ4qO1krsOPYgmXVKYrVRqTr8n
	KkK0Sq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAki-0000000FfE1-2Zsu;
	Thu, 05 Jun 2025 13:35:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAao-0000000Fctz-39W8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 13:25:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-747fba9f962so873473b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129913; x=1749734713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfxhwSOG/RM0gPvUyXeyOo3ZKbVYGqvyCyXESojdWoQ=;
        b=ByXS8FjlY+zs8QXqQ8qIvmytl8gxSnKBM92LVwX3kEegw1r2heCLxZQ4T9hXicGpat
         iWPUXdqg80hbH4JyRtHvzOT1Mm3u9yO1QQw/FNyhAmgINQEKRYekTtksDXiVJ2l/0aRK
         CRxvmwweYtgdTwzz6qiVQ+Olx1mgBero1CzOy0dbi8StZeG8DXPp2gEVE1Yr4DWWOutV
         04LxZmrltm1tezrRWPYjEb7tpI2oOMPhP0eQ8VOHRto7VBLeHAUgIxZml76HK2H0Y1ob
         xSjhUUAC/0Qm4zw1XY7v6BwRgXt8ALkRvVzyL4rNpJxppkyM/eTCplkvR32AyIjFYbIw
         KI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129913; x=1749734713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfxhwSOG/RM0gPvUyXeyOo3ZKbVYGqvyCyXESojdWoQ=;
        b=jf80HsQbesmLaqQ7NXuRVahzIuL9AoxZo+EwiAprndKRAx6w0VzLGalhO+5fIEqcco
         If2cWbAozLCukU7eU3pJlIWMw7PDwB5Hk7eqyQ1Ll8Nv1VkyDx5RoffbOynGLvWtVbrT
         TXR2KZScTjXV/xeYQtdoMIYL063pkivQJR4dktMSo+ZLhagXpnDsUHRiUA8E91E2Zs6/
         cPx5zYyvbaXw5G/nCeQtcp9JaR/7vdDcSJLb++HnKHKGJDS+DOHNUjdSRMbBENKadud8
         6VWYd1E/ggGEQGRKHQwdc4RTZKH4YAXRLTFB/JNlu1fXkDY+NvEmMV20VFBApQkTwrow
         ri5g==
X-Forwarded-Encrypted: i=1; AJvYcCUjzoDu96R0iUe9JJAGCYeyvyHfPlCcxZ/TT7TpjN+ysCti9yimvpEAR7plU5OBZZiRMnnGwpL3yH5tfIhbLGkT@lists.infradead.org
X-Gm-Message-State: AOJu0YxXuYvMVoVw++e6oQEfCgTSBO7qCcUTH7ZfB85L2orIrO7lGZ0G
	utfKQLTuL+LB7nK50r7e8I/MB84u7Oekvs/i9DAmdZM9jWv/vIVuloLH
X-Gm-Gg: ASbGncv/enonigbhqa/q4Nd7ZnRhkDa9FXa3OlRRX/LcpRBpex8MnBqCs0fHNAyHBVc
	uQidMmQ+ACZVE1XEpR8/IO7eSew+ZmVLncdsVEkrTdLMrcYdYP2vr+HRf8HZ2wDh/rsJLdNljzt
	cWzpJUxQfn/KF/+JN6e0dRmXcLSRllMwLYxf4MMLlPhMdXYDC8tGBVvemH4DFgCyXDef2g0VC9u
	qIqiXZ4SY5e29YaXtsOdml1TZKIlXjODoNXUM+q92TEmcAdH2iZA3K2MkMaxkPyNe0+QBNw2feu
	PBQwSq/3VGnEPkb62MuzIqBNZ2GJJpGBn7KuZ6N2ROKyr5AvMw==
X-Google-Smtp-Source: AGHT+IHQGzKHWpB4RSPbdx58AntCVZ2keB8gOeLail6WPggKiKp/eXtko5QLgS4IoilLjWPFK9AAoA==
X-Received: by 2002:a05:6a00:c83:b0:746:2ae9:fc49 with SMTP id d2e1a72fcca58-748184ab829mr4203417b3a.9.1749129913242;
        Thu, 05 Jun 2025 06:25:13 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab79bsm13234842b3a.50.2025.06.05.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:25:12 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:25:07 -0300
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
Message-ID: <20250605132507.2td5zlnlapraoggn@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_062514_812681_94ED9991 
X-CRM114-Status: GOOD (  42.39  )
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

Hi Peng,

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

I will add it in a v5, thanks.

> 
> BTW: Has this patchset tested with M4 in a separate partition,
> saying M4 image packed in flash.bin?

Not yet, I will prepare this test today and let you know.

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

