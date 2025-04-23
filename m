Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnq/BqqXjA7ALdZiVAuLt5golqfm+gt94XkCsxvqdSk=; b=b90Hv598nrNfAnVaQsj+Th0Q7L
	VuC1ON/drtTZ+3kJ2JmBIkD+Qr7D/BR5BBB4tbc3WG04NWjJIJSevxZUPiHCF/jYpeEeyatbyb+YP
	ttp9t9i2VFHRpUnHPyR/EWu/8+RVAdZRH1TWx/NTy0NCHpHTeQJxlJp/vvv8r4f75VHMzy382IPYp
	RjA6poqEEE0BMPBJcm3+TXeTL2OZBLFFnO189hB/V47jyNpQRccOwMZr7UgG2Jn5gbY72Birzr6iS
	eLWiYjHCDxzQvHR8jnjoh8+mm6t1WWWYPVP3lWkNE3zquoemQ/URj3O+3AHLLcajRTyBve3sRu725
	GLOUSHeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqQ-0000000BlKW-21h1;
	Wed, 23 Apr 2025 19:33:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ffW-0000000Bj9H-1Wnc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:22:03 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736b98acaadso145425b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436121; x=1746040921; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lnq/BqqXjA7ALdZiVAuLt5golqfm+gt94XkCsxvqdSk=;
        b=FJX7Um2ijM2MTfarBIqOUCVLyQOHEoN3+bZfgGliEXEfnHUj799QAwamY0R9h20oTl
         7IUONdy8kIx4AchZTd4FVJjNdJlapzAYCprM67eWH5/OuFQIjIFqkVKUFNRb3GkGyOqs
         UICXnfsLhjc+lmh5Oxlx8HDq3Nxz1IXzVDNPXl/oz80NNVxYh3vVQ2HhM6IPd4E3WXPu
         Ksh9aifzSJLeAVUswCpDDfVbPVqCdL7Yj9GOl2ot01L8klfsgxD9rq3CFpmMbHUyuCC1
         plInY8uAWpi2t7cnx0XVrhp0zmIpLwnBUNJH9cBL32Nul1wTJHvGQRebCbK3LlzJjWP+
         clJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436121; x=1746040921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnq/BqqXjA7ALdZiVAuLt5golqfm+gt94XkCsxvqdSk=;
        b=kzp8LV8uAa8uY2dzBCmDMYZBTn7HyTBrBAXvk/B6ES1VOkTR0s2OQjGbfig6zTKhk7
         KTrcjXq68pVOWfnAu/g8LjDIOiWpPFuOUIK+RALf91O9peO/YL4vRZtElo/lcPq+qhXL
         PCQMWz76upvuU9G3B6l6/klyylT9BQj7oyUXGv6QAViq8H9spXyxPVyzcDi8eepO4pMP
         vWe+xfm5kAmj6oenI/4Gx2coRbC/oNf/T+pxrYK3B5uJwCiqzhkyYAioSy3R+R7Yv8VP
         +eb5N1gzSYU2BLOd7+h4XwGtQyWG+Etn25R/lyyiacNNKtvfWLHDZcKeCEQ70JhbyXnV
         1OHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsPZ8MI2wYd9EJ9rYBb8V0F4fu5vyGyM/c6VtBLygCt8K3MLugr3RiN9nZCp9xRD/ZLDWamsmuctYTah8MQx2a@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ/g3u8Q08/hEwTbQz34j8pfzujMzA3WpQP2siX0jxyLY91cPA
	xwspCCL0T771DySdon8kiZO5HsCShvrpE7t/n6Vfzy9xnQL/v6Qj
X-Gm-Gg: ASbGncuUihhndMVvG+6eaeb4EdjR3YsDSO9BoE83XvutFavnIje7olYfmpsGCxIPN1A
	i3aptezD7zvsCahV8m2zzfLfK7YSjFis30tJSsDJwCIXG+lXPT5LL79Ya/PxDU4yOb7DpxIwe2p
	s4QPynZQLyOBb21YShZ+whz90W4Y++T6IKJAnFIfHvqKD0eKzchMBfmr7BNzKySy5G911L6JxY/
	OXY3yKKPeZB2IENJ96NVG2gwwrPjg38hjiSfm3JVIVsl6BdtPksaqUudoNgn2xFars9/SRTN7tn
	kOmfezDeUTN8bHVd8I8nP15vCFjWWQ8KUaOgSRw=
X-Google-Smtp-Source: AGHT+IGC8Nug6p+sMb1GfXDXRxrkzVBgxlxPN8V+pT09fkQHcV/gyhAXznUpN3ozAU58YHARfCLCSw==
X-Received: by 2002:a05:6a20:c6c6:b0:1f5:64a4:aeac with SMTP id adf61e73a8af0-2044116a1a7mr886917637.33.1745436121299;
        Wed, 23 Apr 2025 12:22:01 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db139eecdsm9391156a12.22.2025.04.23.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:22:00 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:21:56 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with
 devm_clk_get_optional()
Message-ID: <20250423192156.b44wobzcgwgojzk3@hiago-nb>
References: <20250423155131.101473-1-hiagofranco@gmail.com>
 <aAkf6bxBLjgFjvIZ@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkf6bxBLjgFjvIZ@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_122202_404739_66A8BCE8 
X-CRM114-Status: GOOD (  32.26  )
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

On Wed, Apr 23, 2025 at 11:14:17AM -0600, Mathieu Poirier wrote:
> Good morning,
> 
> On Wed, Apr 23, 2025 at 12:51:31PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > The "clocks" device tree property is not mandatory, and if not provided
> > Linux will shut down the remote processor power domain during boot if it
> > is not present, even if it is running (e.g. it was started by U-Boot's
> > bootaux command).
> 
> If a clock is not present imx_rproc_probe() will fail, the clock will remain
> unused and Linux will switch it off.  I think that is description of what is
> happening.
> 
> > 
> > Use the optional devm_clk_get instead.
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..45b5b23980ec 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >  	if (dcfg->method == IMX_RPROC_NONE)
> >  		return 0;
> >  
> > -	priv->clk = devm_clk_get(dev, NULL);
> > +	priv->clk = devm_clk_get_optional(dev, NULL);
> 
> If my understanding of the problem is correct (see above), I think the real fix
> for this is to make the "clocks" property mandatory in the bindings.

Thanks for the information, from my understanding this was coming from
the power domain, I had a small discussion about this with Peng [1],
where I was able to bisect the issue into a scu-pd commit. But I see
your point for this commit, I can update the commit description.

About the change itself, I was not able to find a defined clock to use
into the device tree node for the i.MX8QXP/DX, maybe I am missing
something? I saw some downstream device trees from NXP using a dummy
clock, which I tested and it works, however this would not be the
correct solution.

[1] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

Cheers,
Hiago.

> 
> Daniel and Iuliana, I'd like to have your opinions on this.
> 
> Thanks,
> Mathieu
> 
> >  	if (IS_ERR(priv->clk)) {
> >  		dev_err(dev, "Failed to get clock\n");
> >  		return PTR_ERR(priv->clk);
> > -- 
> > 2.39.5
> > 

