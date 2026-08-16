Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5916C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 01:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFmGP0VJtabRx/4pFXIvCVtLulMVCbvWMx/1YBF3fdM=; b=Uq815Wj2n+Ac4Q+OM3UFLaxioK
	sWY1rs7fwAO6xMK4Cyitsr4EYRgSYIVsSggwqAPIbiiD52YMs43ELGEZxSLKCDvyZ2ozZ+WrsFMgB
	JuQuald+RCBnLzYhtKerS3juwhvh9+8E4jUmraaVgTAAqyipznE27aJWbab0L7PqDBhAYHKVK8OCH
	If2tGFTfrTcWIvlm35vHRgUXfbFUzI6GlElcU2qETz7a2TZt5fcijRJKScsDX6bqodvQoA3T/0u1T
	E5JTRJc0h4YlURY1S/O/De+IxwD8MLBuHjMgn1uIYm+QIxB5dR07lgWNlZ2UdmS77MisS0taF3ODH
	AfvPF7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvPTU-00000004N5C-28Ny;
	Sun, 16 Aug 2026 01:15:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvPTS-00000004N4y-357k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 01:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F1DB340BF1;
	Sun, 16 Aug 2026 01:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDE21F000E9;
	Sun, 16 Aug 2026 01:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786842941;
	bh=JFmGP0VJtabRx/4pFXIvCVtLulMVCbvWMx/1YBF3fdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ecs2r+s/2ExFbUc3zmpWPXzsPkwLyD4uyeow+63PNcNBszfM5VPFA6WBJJMlC4rp7
	 ynZ57pGKuXnY0sVbPgo82340LM0cPyuO1oLQPGJ3OHW0H6LziULspZ/uhVV0WHpy+x
	 HFNrm5WL8u6JjmvgxP0DXX8EQ8I+ndQjUUTdPxugOSbVpa8I3R0NLchb0C5pykI/Ki
	 oBF0THPz5kCD0Fbi0NVyEEcuhKDJQJTIQokottACSGek0sOXhAD/jE7JD6ttakrY+3
	 FDCygu29E7DLsceRzdZJcB4qEJH86FwUeEahAF2oljbNERglR+Q2wMzl3XorOa34Ge
	 JfaWk5Y2OfXRA==
Date: Sun, 16 Aug 2026 02:15:39 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: mdshahid03@gmail.com, Andy Shevchenko <andy@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Ray
 Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Markus
 Elfring <Markus.Elfring@web.de>, Joshua Crofts <joshua.crofts1@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
Message-ID: <20260816021539.5f95f403@jic23-huawei>
In-Reply-To: <anmMmrbhUvtmm5xs@ashevche-desk.local>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
	<20260806023902.8608-4-mdshahid03@gmail.com>
	<anmMmrbhUvtmm5xs@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 10 Aug 2026 11:32:26 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Thu, Aug 06, 2026 at 08:09:02AM +0530, mdshahid03@gmail.com wrote:
> 
> > Replace open-coded dev_err() followed by return with dev_err_probe()
> > for probe failures that immediately return.
> > 
> > Leave error paths that jump to cleanup labels unchanged to reduce code
> > churn. These paths will be converted separately together with the
> > planned devm-managed cleanup using devm_add_action_or_reset().  
> 
> ...
> 
> >  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> >  			   "adc-syscon");  
> 
> Size note: the above can be also amended (since you have a 'dev') to
> 
> 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> 							   "adc-syscon");
> 
> But we can go even further (in a separate patch) and move it to
> 
> 	adc_priv->regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev),
> 							   "adc-syscon");
> 
> ...
> 
> >  	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
> > -	if (IS_ERR(adc_priv->adc_clk)) {
> > -		dev_err(&pdev->dev,
> > -			"failed getting clock tsc_clk\n");
> > -		ret = PTR_ERR(adc_priv->adc_clk);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(adc_priv->adc_clk))
> > +		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
> > +				     "failed getting clock tsc_clk\n");  
> 
> >  	ret = clk_prepare_enable(adc_priv->adc_clk);
> > -	if (ret) {
> > -		dev_err(&pdev->dev,
> > -			"clk_prepare_enable failed %d\n", ret);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to enable clock\n");  
> 
> This will be less churn if the previous (new) patch will convert this to use
> devn_clk_get_enabled(). But if Jonathan is okay with this patch as is, you
> can take my
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Too much in my backlog for me to keep track so I'll merge what we have
here and a follow up bit of devm_ work can be a separate series (this
time - look for similar opportunities if you do similar work
in future!)

Series applied to the testing branch of iio.git.

Jonathan

> 


