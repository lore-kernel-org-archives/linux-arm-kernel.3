Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64C4C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/EnXB3OfGjg/mZD1m8+aHh6UqrBK8LUyoH1Ya5uEAw=; b=GdF+iO0a+zeGfZJKlI0yL0+E8b
	nVhYTpXVhYBnR8uBI6Db0tf5IgBedo6qJgei1TEVxwSH7VR1ywg6z+4ECXrk5tVc80y/TMLhGF7yK
	h0d+/R4Q4454RKh9eGShCi7vMXLvJPVP0w2xhpduZXuF7ctgW7npvasgro4s64TST6wWuEvRdVDUH
	Exq2oWhoG0ylZN+/1YVwHinwfC6v6Zb6uMf0lEKCSh/FiVgow8bE8VtNhdS4pIEcOxLOhBoi4WPdC
	+7aAgtcj+4UK2Cl28GMqCnvgwRVGc/kyfrb8fTC7AF86UxAmFqi9yprfWPcHF8aU/LKJyCtKx+gty
	li4kSaqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qn4-00000009Rwb-2Y8e;
	Wed, 16 Sep 2026 14:39:14 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qn1-00000009Rw6-1UCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789569551; x=1821105551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XrmV5AYtnPtVAHzQnffCQxg/8kqWWYTjiNeJHagDZwA=;
  b=J5iWqCSEhawVHsAIvpz3zjMhnJyN6luR3VJNNuW5HVWRFGCIMSLm18SD
   8NxNAR0nQKt0vZUpWQcdXBNB7SHuG+CCjTiDgnCaHNqBO/+KqwrpcRLsI
   3cU7mCDug8MZbIserpWnPEHZ4hbRlkKqcglu1GQAjtEV6EVgS7dWCLkkF
   o7dbCgQTKTi8XxhbkYNiSotyIam58KYQyZkGWDSvM97pbDsPPtNfjmq4m
   r4kz3xcfTGMynlHQEtWmh2bm5xYSaC5KRMn9S6Z8mxGs14VRiwZECayu5
   /tAoYPHIUA1rMrGTbhYjFa1xb5kf0f+tAy2e+irqC5GnOdEky4hpCQyi8
   w==;
X-CSE-ConnectionGUID: z2UbawDCRJeVXFnS2DWfBA==
X-CSE-MsgGUID: BDFAQ0W9QDqmJgRWk8l72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115483552"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115483552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:39:11 -0700
X-CSE-ConnectionGUID: FstFep20SDOsQTM+1NaYBw==
X-CSE-MsgGUID: qK+yDxxsQBWJyllQdob0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269657357"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:39:07 -0700
Date: Wed, 16 Sep 2026 17:39:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: stm32-adc: fix possible division by zero in
 processed channel
Message-ID: <aqqqCf6mQPMoKZRj@ashevche-desk.local>
References: <20260916-adc-fix-div0-v2-1-f702d3ed782c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-adc-fix-div0-v2-1-f702d3ed782c@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073911_597944_565E9231 
X-CRM114-Status: GOOD (  16.05  )
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

On Wed, Sep 16, 2026 at 04:10:05PM +0200, Fabrice Gasnier wrote:
> In case the conversion has failed or returned zero, processing *val
> can lead to a division by zero. Need to check for errors, or converted
> value is zero, before processing the data. In case the converted value
> is zero, e.g. the Vrefint channel, this should be considered as invalid
> in all cases.

...

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/all/20260911161555.244F31F000FF@smtp.kernel.org/

Closes: ^^^


> +		if (mask == IIO_CHAN_INFO_PROCESSED) {
> +			int vrefint_raw;
> +
> +			if (ret < 0) {
> +				iio_device_release_direct(indio_dev);
> +				return ret;
> +			}
> +
> +			vrefint_raw = *val;

> +

Unneeded blank line.

> +			if (vrefint_raw == 0) {
> +				iio_device_release_direct(indio_dev);
> +				return -EINVAL;
> +			}
> +
> +			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / vrefint_raw;
> +		}

Let's look at the current code in this switch-case

	case IIO_CHAN_INFO_PROCESSED:
		if (!iio_device_claim_direct(indio_dev))
			return -EBUSY;
		if (chan->type == IIO_VOLTAGE)
			ret = stm32_adc_single_conv(indio_dev, chan, val);
		else
			ret = -EINVAL;

		if (mask == IIO_CHAN_INFO_PROCESSED)
			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;

		iio_device_release_direct(indio_dev);
		return ret;

In the previous version you were trying to keep goto-less approach.
However in the current state of affairs I don't think the goto is
too bad (after all we need to backport this to the kernels that may
not have IIO_DEV_ACQUIRE_DIRECT_MODE() macro).

Also checking 'ret' under another condition seems unusual.

What about

	case IIO_CHAN_INFO_PROCESSED:
		if (!iio_device_claim_direct(indio_dev))
			return -EBUSY;
		if (chan->type == IIO_VOLTAGE)
			ret = stm32_adc_single_conv(indio_dev, chan, val);
		else
			ret = -EINVAL;
		iio_device_release_direct(indio_dev);
		if (ret)
			return ret;

		if (*val == 0)
			return -EINVAL;

		if (mask == IIO_CHAN_INFO_PROCESSED)
			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;

		return 0;

? (Yes, we leave that line untouched, but we get the change cleaner.)


-- 
With Best Regards,
Andy Shevchenko



