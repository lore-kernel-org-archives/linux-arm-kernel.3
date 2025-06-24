Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667DCC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOFa14hzPvC6t+oIp0DexT1UxNfRS4Cl15Pgd6Dy9Oc=; b=djK6xJSUzcT3gfX/V5Deqe566V
	UhrCTy7kSu/B29jF1QbP6dxoM78ef7RF93MRqqHtibi5VdLHyQcvYJ//swkYyVQCJFBtAhEjgOyGY
	vDS8/m2N/KEKaLNxUEHs53OeH2Ca398tafNdEOuTcbFpgQ49s+ad/QzZ/2G/ITmAnITD0KrfPJk0J
	dk4epdl9C050eFf+v2hcN3bQ47mDsMs2yyfr6e6Xd9NZA3M6obg2MI/UEN78AVb3QqotjM3rVC5dX
	aeKqFU1AdKtFn2nfKtCS9AVOKgpODpQnjuWh1gICbt4rhRDd10y3wNKS1MFmYEX/pEgSdXpJ19luZ
	ZrxEeGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jF-00000006fUp-3p4v;
	Tue, 24 Jun 2025 19:54:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6Id-00000006FUv-3Yy4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:15:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2363497cc4dso7588025ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781707; x=1751386507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NOFa14hzPvC6t+oIp0DexT1UxNfRS4Cl15Pgd6Dy9Oc=;
        b=hGPt0Y3zpYSu7ttaWODRmwM6TN8m/x6ijAlkD2dYdWm1TA/LC0QxMQUZzH72JVDYi/
         ScJjj2WhszaImM2IEhxOb07EANNop+dFQu80lDulmW714Jd9FTkKIbAn3Q2eLP9d+3nw
         tObTAIWXqsHNHdhlKztp0WHuSdb0UJ5KSg1cZFZWTdjPOXZz1zEphNohhOuHiQfDgVat
         mHFbCnPK6aTsRzR4H949foBRhUIhzJpp3oJALTwIUCahx5o5ja+LrJjYps9Dt6K1XigL
         mQbSPCEaQCwjMjikVDjhgjuj731HRnUZSZFn4+aJkxs637qAR0j/aoakdNR1yEGCLwhu
         84sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781707; x=1751386507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOFa14hzPvC6t+oIp0DexT1UxNfRS4Cl15Pgd6Dy9Oc=;
        b=RTDHodS+0b7yuFDsTRpX00EW8BKBV51kEvkAUq8r2UafuCaUo5UzmVeYgeNvSRTNLU
         sWW+o7RospWzBeNK0vdExhY85PAkZFyrjkgwybbVyGx2JJvTNpBZTylO9S0Oc/krthdz
         kGuTC1Q1eZtOm1g/b2/KwkUBfgVP5K7CZHfbZuGrvLP0PJxW3GO8dt0Z0zUT4Is77FXs
         /k70riFc12rAad+vRkbYhOE19sg+ogSfJcgXrvRF4DXZUpAMFwp86mZwceg05XgtOVhJ
         jkl92hKUCPdB2xbY7S+AIFKbkC+UEvVh8d5ZWyEdSv+D5kPYTnONCQ5c37C0Bghm5sBr
         Ok3A==
X-Forwarded-Encrypted: i=1; AJvYcCXDdS/yFDAjPrMGN0VLY//PFa/7Cduoz8J1ZtYGdT18Yrw/Dv4bcmeOvrSvDVFxlLU6xUvvizmyvYeHogIVkI0J@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl0PfNfRFT/gprv2+y4zoZmPlgKSvsiX8PRMYs2CZ8yFjxlIPd
	n9v04u3sbyCIdeZ1tmA5DKdHUfCzguLJ0mmuTb0q3FUIArFhKFPoagJM
X-Gm-Gg: ASbGnctVrVpGBX31Lf6NuyvsF85tqdnVLZxKIdiT2yBqiiwsrg8aEjbTBEDnqSrHgb/
	F0Bw37tfUyFif/5n6Sxl5D0RLsXHU3yH548pD3CL/QIqowjKxAZ8XRN7Sz+3jYvqV2Dz6uRgBVt
	jMGBAjXVT8TrWgTroxeO8hSjA9NwJj5gu4vEN+BIYWuF65EHTcfYxc1/axFCA/lSDnBhU/R0L5m
	0nz1CalXHPLOVrSWYgqj/FxD135W2A1wLumqLRLnr0b6iEnSGsuvKxonpPbTUFcmm9vRObMmodf
	155iWF5JliVAMn6SasYGq9W+ABGbfDW6HB5zIXjAaBBwuXy3HHJ9gQHelNk=
X-Google-Smtp-Source: AGHT+IHG7rYkinFLRzsG4MwI6gkoEJZsqgBi83L3LCSzHE9voyWIDchNPTp5X+xH8/2vrw7ovBDS3g==
X-Received: by 2002:a17:902:f54f:b0:235:ea0d:ae23 with SMTP id d9443c01a7336-2381ddd180dmr3846685ad.6.1750781706256;
        Tue, 24 Jun 2025 09:15:06 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d839618esm115515765ad.33.2025.06.24.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:15:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:15:00 -0300
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
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when
 M-core is managed by the SCU
Message-ID: <20250624161500.odnopjv5jqvyyus2@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-3-hiagofranco@gmail.com>
 <aFlvqK6SHvWHIpMn@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlvqK6SHvWHIpMn@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_091507_891857_940137FD 
X-CRM114-Status: GOOD (  28.13  )
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

Hi Mathieu,

On Mon, Jun 23, 2025 at 09:15:52AM -0600, Mathieu Poirier wrote:
> Hi Hiago,
> 
> On Tue, Jun 17, 2025 at 04:34:49PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> > by the bootloader, M-core and Linux are in same SCFW (System Controller
> > Firmware) partition, so linux has permission to control M-core.
> 
> Ok
> 
> > 
> > But when M-core is started, the SCFW will automatically enable the clock
> 
> I find the "But when M-core is started" part confusing.  Started by who?  And
> are you making a distinction between "powered up" and "started"?  It is not
> possible for someone that doesn't have HW documentation to understand what is
> going on.

Ok, understood, I will improve this in the next revision. Just to make
clear, I am talking about Cortex-A bootloader starting Cortex-M (U-Boot
bootaux command in this case). This means powered up, started and
running.

> 
> > and configure the rate, and any users that want to enable the clock will
> > get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> > fails because clk_prepare_enable also fails. With that, the M-core power
> > domain is powered off when it is still running, causing a SCU (System
> > Controller Unit) fault reset, and the system restarts.
> > 
> > To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> > because SCFW will automatically enable and configure the clock.
> > 
> > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4 -> v5:
> >  - Unchanged.
> > v3 -> v4:
> >  - Unchanged.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Commit description updated, as suggested. Fixed Peng Fan email.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..627e57a88db2 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >  	struct device *dev = priv->dev;
> >  	int ret;
> >  
> > -	/* Remote core is not under control of Linux */
> > -	if (dcfg->method == IMX_RPROC_NONE)
> > +	/* Remote core is not under control of Linux or it is managed by SCU API */
> > +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> >  		return 0;
> >  
> >  	priv->clk = devm_clk_get(dev, NULL);
> > -- 
> > 2.39.5
> > 

