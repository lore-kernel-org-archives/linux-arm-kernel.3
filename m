Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2a3b5p9dXW8xDs6N43urtooM//9nuIAlbzejMFuCGo=; b=VHTug9nkj6TMeusEJFkI0qg3oK
	uUzE93HGzSoYjx1ZDJaCI27gZRNL+x3rXNCihSmhk0OnHSmyF3b/vR/rclN4nJ9dfzgHkXRuDuziS
	cVRWkjbBhMTjKkpZLtzcXj9fFwYe2tfkAaK9rsJj73ulc7ao2jnYfTacYzQM9+rwGOCo4vWh5MiXP
	MiF0CupQIH096lBX9OVV2+o+pXBktXkkMky2sSlU0hB3ARVwYsLPreeGAvh1eqCIMckAj2GRWWw5k
	u7R1HMkACrTEY06MzgfFgwrgMsga/CZpsCbhdGyI10cgrtTGlLD0pXGrnlSpduPfCW9NPFFYDJQJm
	84A7lDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXPo-0000000Gxsz-3Gcc;
	Tue, 30 Jun 2026 12:18:12 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXPl-0000000GxsL-3qUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821890; x=1814357890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L6xp0DTy9IxxrWFDObsUK7MAMrgrWXdOPmbbvUmwO7U=;
  b=EDpfygE/O4OTau6UPILamTlY126TvQxPYcOlNnSVqutvLv78JdZ8Ejp4
   qjVAvyYk6kKaJ91+qTjdRC4XHqbLjWzDfGBDs/M9UuavzulpfDROTQva9
   GkvcOhA7nblq7w3LtC5Af3ZukDQDr8Rk8vadJd3koszCKlH2YpHiPVud8
   94cgSEkUIURCen06rGlVoJ+iO/a0esbARi6cEYLvy0WXMqDT9YLS8chjn
   +ExYvaRFd7B6zwPFt+8C6MVkKYiLZEXCLSJioDf1cQGcK0QgQYy2wD1DI
   97afpFGPrbACObgo8PA+VaPO41j8ch7JXKU/v8orss/YvR2LpTiTiOSgb
   Q==;
X-CSE-ConnectionGUID: kjTqnaExQsGS4p7hwQqO7w==
X-CSE-MsgGUID: JBhmPLK5QFqDXeevVJLn6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="106325480"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="106325480"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:18:09 -0700
X-CSE-ConnectionGUID: W0felgykRje2Q5K6ZMNsyA==
X-CSE-MsgGUID: XVi5LnrERTuYihhS0ukT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="282312161"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:18:04 -0700
Date: Tue, 30 Jun 2026 15:18:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	marcelo.schmitt@analog.com, jorge.marques@analog.com,
	mazziesaccount@gmail.com, Jonathan.Santos@analog.com,
	jishnu.prakash@oss.qualcomm.com, antoniu.miclaus@analog.com,
	duje@dujemihanovic.xyz, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/13] iio: adc: at91-sama5d2_adc: adapt the driver
 for sama7d65
Message-ID: <akOz-Q7Hvxbyzbl7@ashevche-desk.local>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-5-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630093603.38663-5-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051809_994227_EF7DC436 
X-CRM114-Status: GOOD (  12.70  )
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

On Tue, Jun 30, 2026 at 03:05:54PM +0530, Varshini Rajendran wrote:
> Add support for sama7d65 ADC. The differences are highlighted with the
> compatible. The calibration data layout is the main difference.
> 
> Update Kconfig help text to mention SAMA7 SoC family support.

...

> +static const struct at91_adc_platform sama7d65_platform = {
> +	.layout = &sama7g5_layout,
> +	.adc_channels = &at91_sama7g5_adc_channels,
> +	.nr_channels = AT91_SAMA7G5_SINGLE_CHAN_CNT +
> +		       AT91_SAMA7G5_DIFF_CHAN_CNT +
> +		       AT91_SAMA7G5_TEMP_CHAN_CNT,
> +	.max_channels = ARRAY_SIZE(at91_sama7g5_adc_channels),
> +	.max_index = AT91_SAMA7G5_MAX_CHAN_IDX,
> +	.hw_trig_cnt = AT91_SAMA7G5_HW_TRIG_CNT,
> +	.osr_mask = GENMASK(18, 16),
> +	.oversampling_avail = { 1, 4, 16, 64, 256, },

In this case the inner trailing comma is not needed (because everything is on
the same line).

> +	.oversampling_avail_no = 5,
> +	.chan_realbits = 16,
> +	.temp_sensor = true,
> +	.temp_chan = AT91_SAMA7G5_ADC_TEMP_CHANNEL,
> +	.temp_calib_layout = &sama7d65_temp_calib,
> +};

-- 
With Best Regards,
Andy Shevchenko



