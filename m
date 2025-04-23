Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0207AC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rB7o53/Gx3kEOCIzSrxyfyr1JRhXA9Q/wBBn9pf1Q5o=; b=fbtPaXQNZjPCIp9JfD/TaAaZB1
	3yv0MU1ZV6y7xVTFWtCr2T2VXHcnoLfj6i6TqqBydFMIjujoqCQ9fEcOVcXJfOwOWcmUIa8xHZGiO
	hl3gwW6n5PxZdxeBoAN/nGoua2CKyYOD/4rHbga1Se4+X8VBzwagzyYZHZYoN6G6zym0awwx4DBAF
	MaFQSmh5dcw4ETRDKlJwXydORA2YCCjnMRay2MVlQz+UxiH4LiZrb8izUXjut1YHb5rWgSOAJWg4E
	xBZgo1VHGqR3YIqygt8DO9N5RLFxrq89GiUMxjcIn6pd/2x9Kao3FVPhbPkZAM7Ml6lTXyQEA4p/z
	XvdVYRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8v-0000000BODQ-0Dlr;
	Wed, 23 Apr 2025 17:44:17 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dCN-0000000BApc-2w6U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 16:43:48 +0000
X-CSE-ConnectionGUID: KD6/4TrBRCGX8RPwnJOuWw==
X-CSE-MsgGUID: 5IhsHEGxQ96UxiGv71Wqyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47160719"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47160719"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:43:46 -0700
X-CSE-ConnectionGUID: s5cnf4AERSaFpT/2Uwc5/Q==
X-CSE-MsgGUID: oay+8vSfQAa4aiFXkXdhCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="155580835"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:43:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u7dCG-0000000F7Si-3R6f;
	Wed, 23 Apr 2025 19:43:40 +0300
Date: Wed, 23 Apr 2025 19:43:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: imx93_adc: load calibrated values even
 calibration failed
Message-ID: <aAkYvE6VtoQItM5o@smile.fi.intel.com>
References: <20250423-adcpatch-v1-1-b0e84c27ae98@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-adcpatch-v1-1-b0e84c27ae98@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_094347_783477_EBCF7B2B 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, Apr 23, 2025 at 04:02:48PM +0800, Haibo Chen wrote:
> ADC calibration might fail because of the noise on reference voltage.
> To avoid calibration fail, need to meet the following requirement:
> ADC reference voltage Noise < 1.8V * 1/2^ENOB
> 
> For the case which the ADC reference voltage on board do not meet
> the requirement, still load the calibrated values, so ADC can also
> work but maybe not that accurate.

...

>  #define IMX93_ADC_PCDR6		0x118
>  #define IMX93_ADC_PCDR7		0x11c
>  #define IMX93_ADC_CALSTAT	0x39C
> +#define IMX93_ADC_CALCFG0	0X3A0

Please, keep one style of the hex values.
If the small letters are less used, prepare a patch to convert them, otherwise
do that for capital letters.

...

> +	if (msr & IMX93_ADC_MSR_CALFAIL_MASK)

Please keep {} as the body is quite long and it's easy to make a mistake in a
long term.

> +		/*
> +		 * Only give warning here, this means the noise of the
> +		 * reference voltage do not meet the requirement:
> +		 *     ADC reference voltage Noise < 1.8V * 1/2^ENOB
> +		 * And the reault of ADC is not that accurate.
> +		 */
>  		dev_warn(adc->dev, "ADC calibration failed!\n");
> -		imx93_adc_power_down(adc);
> -		return -EAGAIN;
> -	}

-- 
With Best Regards,
Andy Shevchenko



