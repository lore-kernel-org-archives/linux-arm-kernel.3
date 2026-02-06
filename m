Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE54EE20B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=; b=orVXp8XLwfBCHteNux5nLPrPBv
	DehmUPbD/ZKx86qGG1+S014zwjX5xC8CdCtXy9LbrsYeLCPo3uDQP+H2mk1xE21EOY9Rpi3fTZ64T
	yQ+3V4H4P16zXcZYAUIaE6D9yyLc+ya3AuFUzp9oM2LLT8fWzuRUhrZiup2b9xKl1FPOTrbSCiPMo
	pyTGR5fDw2UGpoyxzQJ0rJJU/bTKhQEYRJT6eTWnuKdBwWuDDn18zztwcX+XatTBrA4z3rPgT2HbH
	5UI12IvP6zM5qzIE9fMlYGRPBeBJwux45MA94aEIQngziMjaoQ/zVrp6fpWIY4qE6aTxJ7lYZb1W3
	iylc8vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOPS-0000000BXdd-45NV;
	Fri, 06 Feb 2026 16:10:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOPQ-0000000BXcz-1Dxw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:10:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a8a7269547so21001445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770394214; x=1770999014; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=SwpUBIWlGLdrlPjH/lPPYs56sTfFc9PkCTf3Ctmnv3OBvxreDeKg3zWdoKcP0amOU5
         BOkF5zx7zHZwSBe6vvP+v1XXTTl/6fR6RBy7+m2nG0HtPCgPt9cBGSbY/9dCwErJjK1L
         TA15ihhysYtJYNqKmiBnvJ1UBGWJ9mR1s2pQulJvJ85W0uFkqsTO2vI2IxpfBQvbtJ5y
         MLkdyZwJ7L5RfSlNGRDn/7x+egUK3Q4fI4jUO7t8mTeM0z2XWPkkEEAD0avDuVnuMe9M
         gZmIgYZzfyuBW3kBLAfexw/8bSK67uTH6D7zWqZp++vrCzmHDAY7lVzZRU8CAsmylgC8
         fTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770394214; x=1770999014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOEJZRVPudm8f+CgXHv89P8iLoQHtMeP5j8jQ4S4oiM=;
        b=A38AyxT/WxnuyNsXRweLJh6YUJjI2MTQQFsFrCyYxeL7+5dN/xyaZOGak+wU5mjyU0
         MeMfg6eXAnPZmVAZqMjebHV1wuipQMSTUmglywexOX9/CN3EvXSjoiMGBsCXAvdFpMSz
         AAZjWEt4bXAhNw8FX1k9RWkv0TMHJWLuRYUWlGYAvjYdf9NZFCSe6y5dORk48Y52rxOa
         Ktaanppaf69PtoWjDBqtWUXavWoIJvMXG+PdyKBsYVAG4AOiQyB7oXwZu4Pd2eib/DSl
         r+fpeL21ZMvQWIAZZ29TDjic4ZtsmhrVDAAFJlt2W54NVy6eMiEAM7u+tPIm+8gG3jzH
         aS2w==
X-Forwarded-Encrypted: i=1; AJvYcCXRhYZi5B9GPmAmYeu6TeHJvUfbWuZt9wAHaPzybOHBsecz2HsZSLCvXJBkc+32Odye6WNqJACfIL2LE9v+qpsY@lists.infradead.org
X-Gm-Message-State: AOJu0YxZw8MSgd0XJvkpb1jHxh4jjipHbAtesE1Zf+wfy60Vne9oQ9Vi
	/n9PCuz8cF7OlcMa3pkYCkuFUqiqLlU0jJN3vne76N0vASZXaBMNEJ6Xpoy3P/9EoCwwNvqkbVO
	sK7wkdJ0=
X-Gm-Gg: AZuq6aJd7pi3D/wo5sz4NjJuloqd58SXBV9fvQo5zGgUzh6wEgN0YPrCK4blPVeyZqq
	f9NALqrHy+wMovlnKGQzzZZ9u+AJEymw+XPitM/rB4Di1SuRggRGuo7MMKAg+HiWDyAPN3xR0sU
	nxcAH7pXSD83+BZuaqgBnPRdouo2wtg0TtBX8EoAFeNIBn4aj+2Rr4ATKVfRBD+N0m72Y6X4Rn5
	C5xvF/o76bBwSrE2+vOYfIr+yRKfyV5xfKX4lPEeuyhiTqHHUYVGDaWs7CUxjUvPbTGEJ9GxMqP
	6xbtAUYRI8FbE6dB7KAjiclZ47NHN2p5SN2KRWcd5Q4GOA3B30IrPgxuUmTQ03Q5boywGIAaCBB
	Pw9YzC0WWs1piYTWiE4APOlVtzhtHPtIoh/bRqFJ3ZG430P+JsoDkHW9LmhvOkFfnnsXHUUMGz6
	JROHJEclcaEeYh
X-Received: by 2002:a17:902:e5ca:b0:2a7:757b:35ad with SMTP id d9443c01a7336-2a95170b352mr36939965ad.42.1770394214292;
        Fri, 06 Feb 2026 08:10:14 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:fa3:e3b4:3597:587a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c722c3sm26045635ad.23.2026.02.06.08.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 08:10:13 -0800 (PST)
Date: Fri, 6 Feb 2026 09:10:11 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Chen Ni <nichen@iscas.ac.cn>,
	"andersson@kernel.org" <andersson@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: imx_rproc: Check return value of
 regmap_attach_dev() in imx_rproc_mmio_detect_mode()
Message-ID: <aYYSY3Rn3702zk3S@p14s>
References: <20260205050905.3031134-1-nichen@iscas.ac.cn>
 <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459ABF483274720F6BB23188866A@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_081016_359768_CD95CDC2 
X-CRM114-Status: GOOD (  22.30  )
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

On Fri, Feb 06, 2026 at 03:34:41AM +0000, Peng Fan wrote:
> > Subject: [PATCH] remoteproc: imx_rproc: Check return value of
> > regmap_attach_dev() in imx_rproc_mmio_detect_mode()
> > 
> > Add error checking for regmap_attach_dev() call in
> > imx_rproc_mmio_detect_mode() function to ensure proper error
> > propagation.
> > 
> > Return the value of regmap_attach_dev() if it fails to prevent
> > proceeding with an incomplete regmap setup.
> > 
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index f5f916d67905..0e23f519c247
> > 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1007,7 +1007,9 @@ static int
> > imx_rproc_mmio_detect_mode(struct rproc *rproc)
> >  	}
> > 
> >  	priv->regmap = regmap;
> > -	regmap_attach_dev(dev, regmap, &config);
> > +	ret = regmap_attach_dev(dev, regmap, &config);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "regmap attach
> > failed\n");
> 
> 
> In the main probe, there is already dev_err_probe for
> detect_mode. So I would use below style as other error
> return in imx_rproc_mmio_detect_mode():
> dev_err("regmap attach failed\n");
> return ret;
> 
> Let's wait Mathieu's view.
>

I agreew with Peng's assessment.
 
> Regards
> Peng.
> 
> > 
> >  	if (priv->gpr) {
> >  		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
> > --
> > 2.25.1
> > 
> 

