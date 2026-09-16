Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7CAC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng5Zu+aUVbAlVXMDxQDeNTu+eY1GxRlbs2O8z/fRats=; b=E4J7ZiSh6rBrOHVYqRXv5Mam3Q
	S/7nc3ZYsl2AFUSlwuW62LRN+HugYIsGQQ1kLWtfAr8hVG9N3Zcv09tOW16QtXfAXatuDi5p4dhJt
	8mfSMx0UzfM28AMq5mKI8i26uLISm681sTCJU4YyHbmwkr8+RHG9DW7T6LWKDjRTwhtKJTWOVa/+3
	co1KFP9t3hNiGeEw/ulrVgMmOB+poLyD34Obmq4pRK/ED+0nf0oqUD5RT+8715oJv7tGRcTQGAc2Q
	5u6NsbOpFyMEj4NJeb4GmUUqj57v8mnzNpke0/uOes2A/mMSeohT87aEVh7uGBhN8irOD2EWRrfDO
	7qEjtccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nN6-000000091kZ-3xJP;
	Wed, 16 Sep 2026 11:00:12 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nN4-000000091k1-1VUv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789556410; x=1821092410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jKMCZsqefUPFu4iT0IUKJlmYzNOQK5RGDlACcK0O1Uc=;
  b=mxvPgcUoRBAdqpVkPOFGf8VZzyWTJVl7SgY3BFbHrTlP2T0y8/mKF9qW
   hxvtRryiwqGBz7ejZYVROo+LvUqllqFiU7Mk5junDASFxpfXgEvUfdfww
   jm0A87Mk8AoiD5nRcLa3KsV4KZB82jIP8jWKgr6BJE3MhDGCleKAtanPn
   ksFpeHUH49NXWlJa0ojqrslrFyH0yMG9OiTrWxWAu2kLJEB3pz/n6Jve8
   84nVu0/aEX1VfLyLlpd60aqTYCtk43id0gLFE+SNwHxZSizs1iChMscGc
   QgHtj/fjrtHgo5P94KD/RmDa5c+GWpU4Dlc0qCVV9qMSVUp83SJbaZ5Wq
   A==;
X-CSE-ConnectionGUID: tU09eJDiSzy/h9f2kMBcxA==
X-CSE-MsgGUID: l18LdN5OTO+FCIGuwgvACw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100595047"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100595047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:00:09 -0700
X-CSE-ConnectionGUID: QxgxPO6ORc2kH+0xVscjdg==
X-CSE-MsgGUID: Rw6uQNYZRCentKvYux1vGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277432941"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 04:00:06 -0700
Date: Wed, 16 Sep 2026 14:00:03 +0300
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
Message-ID: <aqp2s5TjgIZS7i-L@ashevche-desk.local>
References: <20260915-adc-fix-div0-v1-1-7daed9e52f2f@foss.st.com>
 <aqpGy9oQkDC-xZGW@ashevche-desk.local>
 <bd47e39c-18e0-46ba-8cdf-9ba35f387793@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd47e39c-18e0-46ba-8cdf-9ba35f387793@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_040010_438992_F8DB0F2D 
X-CRM114-Status: GOOD (  26.44  )
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

On Wed, Sep 16, 2026 at 12:23:38PM +0200, Fabrice Gasnier wrote:
> 
> On 9/16/26 09:35, Andy Shevchenko wrote:
> > On Tue, Sep 15, 2026 at 06:10:40PM +0200, Fabrice Gasnier wrote:
> >> In case the conversion has failed or returned zero, processing *val
> >> can lead to a division by zero.
> >> Need to check for errors, or converted value is zero, before processing
> >> the data.
> >> In case converted value is zero, e.g. the Vrefint channel, this should
> >> be considered as invalid in all case.
> > 
> > Something went very wrong with the indentation of the above.
> 
> Hi Andy,
> 
> Euh, sorry but I don't understand what's wrong with indentation in the
> commit message ? Could you clarify ?

Each sentence seems to be a separate paragraph. Paragraphs are delimited
by a blank lines. But are they (sentences) really so independent?

Compare to:

  In case the conversion has failed or returned zero, processing *val
  can lead to a division by zero. Need to check for errors, or converted
  value is zero, before processing the data. In case converted value
  is zero, e.g. the Vrefint channel, this should be considered as invalid
  in all cases.

(also I fixed the typo, should be plural for 'cases' at the end).

...

> >> -		if (mask == IIO_CHAN_INFO_PROCESSED)
> >> -			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> >> +		if (mask == IIO_CHAN_INFO_PROCESSED) {
> >> +			if (ret >= 0 && *val)
> >> +				*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> >> +			else
> >> +				ret = ret < 0 ? ret : -EINVAL;
> >> +		}
> > 
> > Reuse of the *val makes code harder to follow. Add a temporary variable for
> > this and do something like this (also note other simplifications)
> > 
> > 		tmp_choose_good_name = *val;
> 
> In case ret is an error; this lead to evaluate (e.g. read) *val from the
> (maybe uninitialized) stack. Probably not an issue? But would prefer to
> keep reading it only when ret >= 0, as done currently with the if
> condition above ? (e.g. evaluate ret, before *val)

> > 		...
> > 		if (mask == IIO_CHAN_INFO_PROCESSED) {
> > 			if (ret < 0)
> > 				return ret;

Then simply move the assignment here

			tmp_choose_good_name = *val;

> > 			if (tmp == 0)
> > 				return -EINVAL;
> 
> I've started with something similar before, but we can't return directly
> here. Must call iio_device_release_direct() first. This would add more
> lines.
> 
> So I chose to implement above ternary ret = ret < 0 ? ret : -EINVAL, to
> fall-through.
> 
> Please advise on the preferred way,

As per above.

> > 			*val = STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / tmp;
> > 		}
> > 
> >>  		iio_device_release_direct(indio_dev);
> >>  		return ret;

-- 
With Best Regards,
Andy Shevchenko



