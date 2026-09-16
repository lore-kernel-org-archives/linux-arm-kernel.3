Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5D3C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dhBACnfFW0lZq3owWF1y4rQyWs5vN0+T5NVuBSpLlI=; b=14ySPlWC2zPHIM/p6sL4Yig6+w
	S/IT04i7ByFYLRQ94LUvDW+LVfso+xhdQh+oV+KoMwlgaJuU8vdD7zEZD8/sBVo4cfEZZ5L7blu87
	VM62PM/IRdhWenIjO7XVPWfkbH8FLhaHRgQIoBaEO7gozhkEe81qM19PLUjAJzYTirRMPvXdLkunl
	6lm7bxBp9/MbGRCWHiPV4SxQ2oPnHaYVpjmCrpFHZI7TNgfcs+jdMVQaOHqWh5vzKaKOV0SiFjTob
	Mng5PMZfEKi/q1lD2k0Yqg3pq7upRKa+IdLooXt2BH+MLtl87qREJecaexwhakLRd5xqxAPIXKBoB
	cVSTWE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kBI-00000008bDF-2zrq;
	Wed, 16 Sep 2026 07:35:48 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kBF-00000008bCF-3slJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789544146; x=1821080146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GkzRMnHLUAmW3pw+F+QgiPFULxg/81kYYY7dmuCPp9U=;
  b=SXP0qSAUF0iBUZ3kE0HcnHrx9vCM7Q9efpB/P/ahsIiT8Y1zez2gGfNE
   iLPsLa1KbLggER9PFw9Li/VJHDK+aM0T2gLAxkMv24znx/gn/uY1zV4/h
   ppNM87IXZsV1ED7CDiB7o99VmBtSaf2dT/N9P3QFU3Llr5DDjNYvrSme9
   6aBzsIGAIi33SoQfM8eFaXS1LTpfObD+4XAtVRTb+0sATcsCK8drdYw4X
   XrKyZWzXTNl+owsBFTRJ4kH8eVnflgCtv6LAvPUo9HiTirXWNil2RasgU
   MpQEyO3iIxFgMM0UrhAfX0Id/CejCZX11L3Z95dMU+b9QbuIhlx1yoaKe
   A==;
X-CSE-ConnectionGUID: 8WbQ3gkLSM2nQxbk5QJZmg==
X-CSE-MsgGUID: xk1J/9/3SdywcG5aOq6fiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100239439"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100239439"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:35:45 -0700
X-CSE-ConnectionGUID: GSN9yJVbRO2xpOZsPAj3VA==
X-CSE-MsgGUID: VOs25VG+S32ijjFd8p0pTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267043796"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:35:41 -0700
Date: Wed, 16 Sep 2026 10:35:39 +0300
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
Subject: Re: [PATCH] iio: adc: stm32-adc: fix possible division by zero in
 processed channel
Message-ID: <aqpGy9oQkDC-xZGW@ashevche-desk.local>
References: <20260915-adc-fix-div0-v1-1-7daed9e52f2f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-adc-fix-div0-v1-1-7daed9e52f2f@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_003546_012807_D142883B 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Sep 15, 2026 at 06:10:40PM +0200, Fabrice Gasnier wrote:
> In case the conversion has failed or returned zero, processing *val
> can lead to a division by zero.
> Need to check for errors, or converted value is zero, before processing
> the data.
> In case converted value is zero, e.g. the Vrefint channel, this should
> be considered as invalid in all case.

Something went very wrong with the indentation of the above.

...

> -		if (mask == IIO_CHAN_INFO_PROCESSED)
> -			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> +		if (mask == IIO_CHAN_INFO_PROCESSED) {
> +			if (ret >= 0 && *val)
> +				*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> +			else
> +				ret = ret < 0 ? ret : -EINVAL;
> +		}

Reuse of the *val makes code harder to follow. Add a temporary variable for
this and do something like this (also note other simplifications)

		tmp_choose_good_name = *val;
		...
		if (mask == IIO_CHAN_INFO_PROCESSED) {
			if (ret < 0)
				return ret;
			if (tmp == 0)
				return -EINVAL;

			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / tmp;
		}

>  		iio_device_release_direct(indio_dev);
>  		return ret;

-- 
With Best Regards,
Andy Shevchenko



