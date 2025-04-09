Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFE1C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aQnP8Tce3VgN1IZuBW3oPTwtH0vocVZNoFX2eGQ6Fo=; b=Ap5hsGLueRD8tad1k/cdoKGiGG
	VS37U+PJQvyVVup7bX7kYs23WuxX/ZmGwKqAyViMhvCRF3niJa+h+PAVB7lCUZd4h51lbQ/cAQ5B8
	9GlKhIdjnPVKbB0VyY01NZ75ldjgoZQbuNabc3AKXIiqTns9rTygnN9tOhHOo3XNKzCV+2K56ouWu
	4Uaqs1GExonZSrvuVSQvTZQ+FxPErWOeTt9NjouXivBGnD8oYrjKNfB+kMyjkqHrp2j2SH2+W1w6D
	V8sH6FhugcdkA7P/cNoWKb0car0Zv70daXeYJAMfWTy8c0SZmUsl2ldovJDmOhjEcbsS5MyTw1N5v
	OTQTSI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q1a-00000006Rea-3O1M;
	Wed, 09 Apr 2025 07:39:06 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Pzo-00000006RRK-1VKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:37:17 +0000
X-CSE-ConnectionGUID: xYIxt7+7SbqQWhrVN/DY3Q==
X-CSE-MsgGUID: +a7cSpzwR92/eZL45Hb9ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56310949"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56310949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:37:14 -0700
X-CSE-ConnectionGUID: Q3KlOjALRHGGFN+CYJn+Pw==
X-CSE-MsgGUID: Zy41ur7VQgi4lh34jJl58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129451172"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:37:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u2Pzg-0000000AeY9-3ZGw;
	Wed, 09 Apr 2025 10:37:08 +0300
Date: Wed, 9 Apr 2025 10:37:08 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: stm32: add oversampling support
Message-ID: <Z_YjpEFhBXgrWATp@smile.fi.intel.com>
References: <20250408173054.1567523-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408173054.1567523-1-olivier.moysan@foss.st.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_003716_426520_CB12CE23 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, Apr 08, 2025 at 07:30:53PM +0200, Olivier Moysan wrote:
> Add oversampling support for STM32H7, STM32MP15 & STM32MP13.
> STM32F4 ADC has no oversampling feature.
> 
> The current support of the oversampling feature aims at increasing
> the data SNR, without changing the data resolution.
> As the oversampling by itself increases data resolution,
> a right shift is applied to keep initial resolution.
> Only the oversampling ratio corresponding to a power of two are
> supported here, to get a direct link between right shift and
> oversampling ratio. (2exp(n) ratio <=> n right shift)
> 
> The oversampling ratio is shared by all channels, whatever channel type.
> (e.g. single ended or differential).
> 
> Oversampling can be configured using IIO ABI:
> - oversampling_ratio_available
> - oversampling_ratio

...

> --- a/drivers/iio/adc/stm32-adc-core.h
> +++ b/drivers/iio/adc/stm32-adc-core.h

Does this include bitfield.h and bits.h already?

...

> +static const unsigned int stm32h7_adc_oversampling_avail[] = {
> +	1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024

Leave trailing comma.

> +};
> +
> +static const unsigned int stm32mp13_adc_oversampling_avail[] = {
> +	1, 2, 4, 8, 16, 32, 64, 128, 256

As well.

>  };

...

> +	.oversampling = stm32h7_adc_oversampling_avail,
>  	.num_res = ARRAY_SIZE(stm32h7_adc_resolutions),
> +	.num_ovs = ARRAY_SIZE(stm32h7_adc_oversampling_avail),

+ array_size.h

...

> +static void stm32h7_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 ovsr_bits, bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32H7_OVSR_MASK | STM32H7_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	/*
> +	 * Only the oversampling ratios corresponding to 2*exp(ovs_idx) are exposed in sysfs.
> +	 * Oversampling ratios [2,3,...,1024] are mapped on OVSR register values [1,2,...,1023].
> +	 * OVSR = 2 exp(ovs_idx) - 1
> +	 * These ratio increase the resolution by ovs_idx bits. Apply a right shift to keep initial
> +	 * resolution given by "assigned-resolution-bits" property.
> +	 * OVSS = ovs_idx
> +	 */
> +	ovsr_bits = (1 << ovs_idx) - 1;

Why not GENMASK(ovs_idx - 1, 0)?

> +	bits = STM32H7_ROVSE | STM32H7_OVSS(ovs_idx) | STM32H7_OVSR(ovsr_bits);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}
> +
> +static void stm32mp13_adc_set_ovs(struct iio_dev *indio_dev, u32 ovs_idx)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	u32 bits, msk;
> +
> +	msk = STM32H7_ROVSE | STM32MP13_OVSR_MASK | STM32MP13_OVSS_MASK;
> +	stm32_adc_clr_bits(adc, STM32H7_ADC_CFGR2, msk);
> +
> +	if (!ovs_idx)
> +		return;
> +
> +	/*
> +	 * The oversampling ratios [2,4,8,..,256] are mapped on OVSR register values [0,1,...,7].
> +	 * OVSR = ovs_idx - 1
> +	 * These ratio increase the resolution by ovs_idx bits. Apply a right shift to keep initial
> +	 * resolution given by "assigned-resolution-bits" property.
> +	 * OVSS = ovs_idx
> +	 */
> +	bits = STM32H7_ROVSE | STM32MP13_OVSS(ovs_idx);
> +	if (ovs_idx - 1)
> +		bits |= STM32MP13_OVSR(ovs_idx - 1);
> +
> +	stm32_adc_set_bits(adc, STM32H7_ADC_CFGR2, bits & msk);
> +}

...

> +static int stm32_adc_write_raw(struct iio_dev *indio_dev,
> +			       struct iio_chan_spec const *chan,
> +			       int val, int val2, long mask)
> +{
> +	struct stm32_adc *adc = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;
> +	int nb = adc->cfg->adc_info->num_ovs;
> +	u32 idx;

Why this strange type for loop iterator? Shouldn't be as simple as unsigned int?

> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
> +		if (val2)
> +			return -EINVAL;
> +
> +		for (idx = 0; idx < nb; idx++)
> +			if (adc->cfg->adc_info->oversampling[idx] == val)
> +				break;

> +

Unneeded blank line as this two are coupled well together.

> +		if (idx >= nb)
> +			return -EINVAL;
> +
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0)
> +			goto err;
> +
> +		adc->cfg->set_ovs(indio_dev, idx);
> +
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put_autosuspend(dev);
> +
> +		adc->ovs_idx = idx;

> +err:



> +		iio_device_release_direct(indio_dev);
> +
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}

-- 
With Best Regards,
Andy Shevchenko



