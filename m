Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF885CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJQ7mFeR2a+rVNeTjPxe8OwQwfZtpCxHHooRXas0UfI=; b=F4wih+tcmcKj1RgIT4kqZQPVGb
	FVxqL4d+yV8X+wlRhPhftqNJrQSEEg8A6fFZFMpmkWUwauiebqa4P6QEwmcCM9c3WLr9V5n00FeBL
	DVHaahEcjojgQ+S4uU1foOEHXKlZuZolUVMk0EzmMdZlgWN39USwT06XoHVfhsHYlvmrJf7kEUcBy
	oQfO17mNcjzvmBFB79XAdot4luj1xRmHoWnzEf/qewpHODtM2DcDOHHva3UI/YV8LqpmLnckJv2QQ
	fqlPFzieLTQrHpx3bhwVz6+Z/DNhieVdKUkbxeyr3uoD3yqwDJWyG4n2cXrTKAWFiWY5E/kjfpmck
	b0EQ7v9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwN-00000007xcV-2QZm;
	Thu, 01 Oct 2026 07:10:51 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAwH-00000007xbY-3snJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790838646; x=1822374646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2BkzFXAjmTTbybLib9uPTvSgVl9rmz7HuMDD/0WeqNM=;
  b=ECxnCmQwyWmqpRtBKWB09OTEij2NQSCMTpSUYeJ+WI3ih4C7bP1OSHJy
   AYMtxJkL777v3+BW0U1wOs9X4x66LHqjahdxq1aYAUT9p1mCgR27BVQTY
   cQb8KNkH/2TeF5ggTtjhHis3vcCki5o4nJ9Fj6kw2Dnem8jmNgUf2Gap3
   Xf3F4OLDqkcTKuZznflMQMQkouMYWSGcJbkKoQu4HJs1/6sB3le7Vp+rp
   ORts1G1FgktdDeDHEyR+Aqoc/SBoueLEh+CL9JL9FvSKySH9yHUMGSa+J
   rGVBdRSLjBImbsCdFQLmTS3+6VH5uk9fEvHLlQTvrN0XSlaS7Qw/Ktswk
   Q==;
X-CSE-ConnectionGUID: vM/UrLCLQXitGV5Dl+985Q==
X-CSE-MsgGUID: Y4mzGbVlSg+YMcV3P5P56Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="102162295"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="102162295"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:10:45 -0700
X-CSE-ConnectionGUID: T/b2vH+UQxyCUoaIA7lPDw==
X-CSE-MsgGUID: qLKlflxmSwSBWcep8u/o+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275032205"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.27])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:10:42 -0700
Date: Thu, 1 Oct 2026 10:10:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/6] spi: pxa2xx: rename local status variable to ret
Message-ID: <ar4HcFk_IW7IBAgk@ashevche-desk.local>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-2-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930160629.1822-2-fourdollars@debian.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_001045_975761_AFB8671F 
X-CRM114-Status: GOOD (  14.12  )
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

On Thu, Oct 01, 2026 at 12:06:24AM +0800, Shih-Yuan Lee wrote:
> Rename the return value variable name from 'status' to 'ret' in the
> pxa2xx_spi_probe(), pxa2xx_spi_suspend(), and pxa2xx_spi_resume()
> functions to conform to standard Linux kernel coding conventions.
> 
> Assisted-by: Antigravity:gemini-3.8-flash sparse

Assisted-by: LLM

...

> -	status = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
> +	ret = request_irq(ssp->irq, ssp_int, IRQF_SHARED, dev_name(dev),
>  			drv_data);

Also fix the indentation of the second line. Actually just join them to become
a single line.

> -	if (status < 0)
> -		return dev_err_probe(dev, status, "cannot get IRQ %d\n", ssp->irq);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot get IRQ %d\n", ssp->irq);

...

>  		drv_data->gpiod_ready = devm_gpiod_get_optional(dev,
>  						"ready", GPIOD_OUT_LOW);
>  		if (IS_ERR(drv_data->gpiod_ready)) {
> -			status = PTR_ERR(drv_data->gpiod_ready);
> +			ret = PTR_ERR(drv_data->gpiod_ready);
>  			goto out_error_clock_enabled;
>  		}

Actually this can be redone as

		ret = PTR_ERR_OR_ZERO(drv_data->gpiod_ready);
		if (ret)
			goto out_error_clock_enabled;

-- 
With Best Regards,
Andy Shevchenko



