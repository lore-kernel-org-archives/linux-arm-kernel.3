Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA86DC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7V0n2nV5tNUuCcI8fD5M/BeiXn4ecQeMTpcNlY3ll0=; b=36xYl3Dq59yl3oJK3xlrwU3spv
	Q8IM2tVdAa9bgLCpd5zMcj7ghPknApPg7adnsYFwugJEXdcIX9YbRsQvZHu0qfWdGkdg8F2z8nljB
	fXi/gLH3kFD/RGbNFB7x1WqoJyoMP5ed1qjKQsrTwGEZ75ypW20h244brey/fKygYlgmPWm12wenP
	5aKBBTVvtXvbniPACAs+oRE/wdrFIgbcCygK5UgKjTT6aRsw0nKcgsGjj7O2J/MKn+Ww+Z2a3DSqE
	ZggOHGtfhikqWxdMdo3sE3TPQOiSSpkoNRiIrGXCqWFJfP/D6CRmFsBemOqoTgQP1kvofjhYkueqk
	rhVk/E2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlV0-00000003dN7-40qP;
	Mon, 23 Jun 2025 18:02:30 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiBn-000000033Vn-3dr6;
	Mon, 23 Jun 2025 14:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750689028; x=1782225028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=48eVt2PPcxAS9n4RtU7GsK0fPkHm0p1WawWnWIodk7o=;
  b=EzWgIbUZZfQjLil/cuAboJPFsnYu00B4C/va0yT9i+IiTCcsrc1E96u3
   da5Mwl7xOJaXwyICx3x4G3IJ1WRSRIRpGUPU2HfTU5zBj1WWaSvZKb8D3
   v7F8iFJ/ASklf1sbtnObMV4DMX8AOBRUftLOIZ/DOLBpXTmyhhUmBIjO/
   vMczHqIAUw6GmyuE97uMnAzm69Offt4Vf5P6ZUAvIQAmbOqJBjNBbxV+0
   6JMJtNafAA8Up4LrPKjmSyBjMJ6IcQwr0iUubvDvbK+TELLGlsSn8OZTH
   fpQ9QwRQsORxqxigECMiy2MP7ICPthKKGCKVsbW622ivXDIAGGlbRn8Xh
   w==;
X-CSE-ConnectionGUID: 3aY12pbOSc2WBKsLo/jLEQ==
X-CSE-MsgGUID: fq9PSDPvSQqLA8wPS9gonA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53031899"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53031899"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:30:26 -0700
X-CSE-ConnectionGUID: H7JwwNNASkipLkEQE+BTyw==
X-CSE-MsgGUID: xVHtY9bDRp25jG8Rf2mRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="155914307"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:30:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uTiBf-00000009CQ9-0zoy;
	Mon, 23 Jun 2025 17:30:19 +0300
Date: Mon, 23 Jun 2025 17:30:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 4/5] iio: adc: mt6359: Add support for MediaTek MT6363
 PMIC AUXADC
Message-ID: <aFlk-l5LhgO8dnXK@smile.fi.intel.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
 <20250623120028.108809-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120028.108809-5-angelogioacchino.delregno@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_073027_953621_CFDA7122 
X-CRM114-Status: GOOD (  18.65  )
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

On Mon, Jun 23, 2025 at 02:00:27PM +0200, AngeloGioacchino Del Regno wrote:
> MediaTek MT6363 is a PMIC found on MT8196/MT6991 board designs
> and communicates with the SoC over SPMI.
> 
> This PMIC integrates an Auxiliary ADC (AUXADC) which has a grand
> total of 54 ADC channels: 49 PMIC-internal channels, 2 external
> NTC thermistor channels and 2 generic ADC channels (mapped to 7
> PMIC ADC external inputs).
> 
> To use a generic ADC channel it is necessary to enable one of
> the PMIC ADC inputs at a time and only then start the reading,
> so in this case it is possible to read only one external input
> for each generic ADC channel.
> 
> Due to the lack of documentation, this implementation supports
> using only one generic ADC channel, hence supports reading only
> one external input at a time.

> +#define MT6363_EXT_CHAN_MASK		GENMASK(2, 0)
> +#define MT6363_EXT_PURES_MASK		GENMASK(4, 3)
> + #define MT6363_PULLUP_RES_100K		0
> + #define MT6363_PULLUP_RES_OPEN		3

I would rather expect the two spaces after #define. This most likely will break
syntax highlighting in (some of) the editors.

...

> +#define MTK_PMIC_ADC_EXT_CHAN(_ch_idx, _req_idx, _req_bit, _rdy_idx, _rdy_bit,	\
> +			      _ext_sel_idx, _ext_sel_ch, _ext_sel_pu,		\
> +			      _samples, _rnum, _rdiv)				\

Wondering, and it's out of scope here, if we can go to use a macro for
initialization of struct *_fract.

>  	[PMIC_AUXADC_CHAN_##_ch_idx] = {					\
>  		.req_idx = _req_idx,						\
>  		.req_mask = BIT(_req_bit),					\
>  		.rdy_idx = _rdy_idx,						\
>  		.rdy_mask = BIT(_rdy_bit),					\
> +		.ext_sel_idx = _ext_sel_idx,					\
> +		.ext_sel_ch = _ext_sel_ch,					\
> +		.ext_sel_pu = _ext_sel_pu,					\
>  		.num_samples = _samples,					\
>  		.r_ratio = { _rnum, _rdiv }					\
>  	}

Perhaps something in math.h as

#define INIT_STRUCT_FRACT_UXX(n, d) ...

...

> +	if (MTK_AUXADC_HAS_FLAG(cinfo, IS_SPMI)) {
> +		/* If the previous read succeeded, this can't fail */
> +		regmap_read(regmap, reg - 1, &lval);

No error check? lval may contain garbage here, right?

> +		val = (val << 8) | lval;

Is it guaranteed that lval is always less than 256 (if unsigned)?

> +	}

...

> +		regmap_update_bits(regmap, cinfo->regs[desc->ext_sel_idx],
> +				   MT6363_EXT_PURES_MASK, ext_sel);

No  error check?

> +	}

-- 
With Best Regards,
Andy Shevchenko



