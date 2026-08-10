Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F148DC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqINAqAraeuaQOxZaToqgZdJ+DInHV7P85k0QYJH4QY=; b=YqnKT8DIws2+FhimhMolmGL105
	rDjb9g7slvM0L+J1lK0an1udXNiRrmEJev+LB8KblOaefyDERiFy1e4N5+y7yL25X9nl2lYAkC13k
	CeUOzohHCljMVEDDrGrCsceDtcPZrOTw0WRocYpt8JzFvkve70t37TFJh4UhVX5y7QwSGEbLITkXi
	fF2Lh2b5aVw0n1dl7jY2VS1q6ueS1eYX0/C9qBwJW87/1tSUkNtUgnzRKz2dF5dKDFHq2qZckasQM
	AkAfBw/7DKbImidq2f/4V9ycw9wknP3uv+9aXIRCYz0ypbHV+nKDT1ZVsWzIQsZi8U7PyMM8POns8
	N5MiNlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLQy-0000000BIZR-1CZQ;
	Mon, 10 Aug 2026 08:32:36 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLQv-0000000BIYN-2L8y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786350753; x=1817886753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tdrdz1u6rgrIEVnUV5DMQCAm7IonxepyebG8e6Gz7ss=;
  b=QKgq0Zb+LwIS1CM/+sihEX/ikL3N/VtS0luxFdPAykTskwwjcbGIvVbO
   Cl92RnemeJpxen+Rrr5RP/+R0lrUu4DNumNmOPbWoNe/UEb/8M+Lqz8CT
   wtFIXIWZyoLoG4Gp+AVXZCk03wB4whXHnMJ/86Hp8LB573OfPsrXBfrtJ
   KqVBRzot0EzTDwcEs6ItAxTiDqu1KxTLkPl8S+HVrSVLX52FfKBnP3Fm3
   zpxhfdLPtDY52TeCh3gS86XgyYhTJmXSCGrI62thbqHHKOQYjuIIziWbS
   IFUhIVd9OnyJz51lPZs7HyUrUYacXFTGPMDtaZvwRYeBe4v8x6ZbJ+skH
   g==;
X-CSE-ConnectionGUID: tRI5PYg5SJeoxwBG3ryskg==
X-CSE-MsgGUID: yXQUEHsBTjieI0a0f35tjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85826073"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="85826073"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:32:33 -0700
X-CSE-ConnectionGUID: sIJ0ylteRzil7Tggq5BpnQ==
X-CSE-MsgGUID: QKCbDoS9Q5eT0pVl2JntGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="261689002"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:32:30 -0700
Date: Mon, 10 Aug 2026 11:32:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Joshua Crofts <joshua.crofts1@gmail.com>, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] iio: adc: bcm_iproc_adc: Convert probe error
 handling to dev_err_probe()
Message-ID: <anmMmrbhUvtmm5xs@ashevche-desk.local>
References: <20260806023902.8608-1-mdshahid03@gmail.com>
 <20260806023902.8608-4-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806023902.8608-4-mdshahid03@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_013233_608298_23B35406 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, Aug 06, 2026 at 08:09:02AM +0530, mdshahid03@gmail.com wrote:

> Replace open-coded dev_err() followed by return with dev_err_probe()
> for probe failures that immediately return.
> 
> Leave error paths that jump to cleanup labels unchanged to reduce code
> churn. These paths will be converted separately together with the
> planned devm-managed cleanup using devm_add_action_or_reset().

...

>  	adc_priv->regmap = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
>  			   "adc-syscon");

Size note: the above can be also amended (since you have a 'dev') to

	adc_priv->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
							   "adc-syscon");

But we can go even further (in a separate patch) and move it to

	adc_priv->regmap = syscon_regmap_lookup_by_phandle(dev_of_node(dev),
							   "adc-syscon");

...

>  	adc_priv->adc_clk = devm_clk_get(dev, "tsc_clk");
> -	if (IS_ERR(adc_priv->adc_clk)) {
> -		dev_err(&pdev->dev,
> -			"failed getting clock tsc_clk\n");
> -		ret = PTR_ERR(adc_priv->adc_clk);
> -		return ret;
> -	}
> +	if (IS_ERR(adc_priv->adc_clk))
> +		return dev_err_probe(dev, PTR_ERR(adc_priv->adc_clk),
> +				     "failed getting clock tsc_clk\n");

>  	ret = clk_prepare_enable(adc_priv->adc_clk);
> -	if (ret) {
> -		dev_err(&pdev->dev,
> -			"clk_prepare_enable failed %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clock\n");

This will be less churn if the previous (new) patch will convert this to use
devn_clk_get_enabled(). But if Jonathan is okay with this patch as is, you
can take my
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



