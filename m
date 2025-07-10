Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE02AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOi4fzk3ASVt0mY1ngardFfCARG3dEcjzdkvD2yUmiM=; b=uKNJnTqIvdDe6iz9hT1E0L1Wnq
	MnLnLdgO70as6wuQshLDsFXKczYQjAz4Mn95XM/rhXDul8SJi1l99Y827RCNMsQ3TM5fJlHRJ+w9m
	S5Y8+LrMaQNlnPUifvA3OklLFRkbsl07T4pg3CCcZ8b/Eo0MAdFmYY+gFeLSRyg51pQkaBjn7Rybu
	DX9c8F7LfXdZsLhav15AWMn+kv25BeQE64ekbc/whjMRlkq8HLMIddYHRl4RwauoWwKvSEynMG527
	FbEFK/bzo/0kNgC64jw3ZQyuTMaCi+98tk5F81aH7+l2vMXDL5c1fujD0IzVYX/dGx9FhDtn+N+PX
	X9Fz7dhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp1o-0000000BZ6T-15lF;
	Thu, 10 Jul 2025 11:01:24 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnUX-0000000BKeC-0UBz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752139377; x=1783675377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oMuEnzSiV/0zGJRZTSJdmYqP9+3hpJC5wE7fsmK9ILg=;
  b=FVJ+7Tum/MbOJ+Rtr350MgOo9D+Mou04yhaQcybM8I1ViTx3hCAcR5Mc
   K5VNFl1MWss8Toz3u26kjoaEjsyxMdQHEc8jOLOZqfucaQJdcAokR84hr
   MSWr71F/IqKN4Dlh+5y9fR2D7rknXamHmPulZqr9IepluuOAyJuXjkSOc
   hJx7DjrCmqHwDoObp3m0jzRnRM98EATIa5DJzNEgINTzrZ+s4q/UTGS+8
   G2DVa6QXG0RVjN/Gj9K0VbKTCxTyEujNGmHCPmdqn6xqUxSBlYpLoTi/V
   +z7EWKbJJNprpX4sTCipsadxtGcXM8TDCCAHINs8NI3BAY2S3i/2W8plg
   g==;
X-CSE-ConnectionGUID: UKHL3idWQfOMu9EqL+pQcw==
X-CSE-MsgGUID: 0c/DQ3jbTVa+XEi3bZVIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54130109"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54130109"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:22:56 -0700
X-CSE-ConnectionGUID: p0j4cVbgRGuYdUOREp4FBQ==
X-CSE-MsgGUID: hsWdMsaBR2aaOXEUBxOdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="186994717"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 02:22:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uZnUN-0000000E9eg-1XWN;
	Thu, 10 Jul 2025 12:22:47 +0300
Date: Thu, 10 Jul 2025 12:22:46 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 2/2] iio: adc: imx93: Make calibration parameters
 configurable
Message-ID: <aG-GZqhABwErcEyM@smile.fi.intel.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
 <20250710073905.1105417-3-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710073905.1105417-3-primoz.fiser@norik.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022257_190259_1338341B 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Jul 10, 2025 at 09:39:04AM +0200, Primoz Fiser wrote:
> 
> Make i.MX93 ADC calibration parameters:
>  - AVGEN: Enable calibration averaging function,
>  - NRSMPL: Select number of calibration samples,
>  - TSAMP: Select sample time of calibration conversions,
> 
> in the MCR register configurable with the corresponding device-tree
> properties:
>  - nxp,calib-avg-en,
>  - nxp,calib-nr-samples and
>  - nxp,calib-t-sample.

...

>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/property.h>

Keep it in order.

...

> +	ret = device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
> +	if (!ret) {
> +		if (val != 0 && val != 1) {
> +			dev_err(adc->dev, "invalid nxp,calib-avg-en: %d\n", val);
> +			return -EINVAL;
> +		}
> +		reg = val;
> +		mcr &= ~IMX93_ADC_MCR_AVGEN_MASK;
> +		mcr |= FIELD_PREP(IMX93_ADC_MCR_AVGEN_MASK, reg);
> +	}

Please, since it's optional, do other way around.

	val = $DEFAUTL;
	device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
	FIELD_MODIFY(...)

Similar approach may be used for the other properties.

...

> +	/* write calibration settings to MCR */
> +	writel(mcr, adc->regs + IMX93_ADC_MCR);

Please, factor out this to the function, so we won't see the direct IO in the
->probe().

-- 
With Best Regards,
Andy Shevchenko



