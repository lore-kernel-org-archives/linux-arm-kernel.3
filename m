Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87312CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp9OqGVcpm3i2O5NHj9EOKrITC6p74S82P6MuP0Ebhk=; b=fzZfvJzT0DVg3EvUWFp46vTIzS
	UFqkSc5y0A9tj6y27LR9YS8duvbITwthzb4cq1xhdodtfEvrUO5UDI2D5tpT+PaBpuvvIXRWwy4ZZ
	KoD9/VlCvYroQecFhvyeWZY8uRd/b19G8h99z1RG3quLwTjgmjTDFBIyTpBHgEY/U0Vad3HheV7dF
	kMuhd9x46O0KsTcqw3wkurJeI/FrvjjPoo2NWbG38UHfMjjsvz5nj1P2kRyXYfPHouYkbQnZ+DZ1G
	E3Ncdmo4FhOoqAyEaqCyh8x36FOj0rEG66wgslJTYFx09Cw1XiuTTCuSGQG/rbLO6JQi32SkNA2sh
	3RdDo+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5ec-00000006kYQ-0UfC;
	Tue, 23 Jun 2026 18:15:22 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc5eZ-00000006kY3-3BWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 18:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782238519; x=1813774519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcbEsbtbk3fPpranQsUZotb8RvoHkOQhoDEUoBvvYgE=;
  b=YMTSiFAZbPZiwdr2ug59iDfv3I4FuUqfVFzceUokCLjijg/vytXh8rHl
   rLWa5axSrl1L0IqhxnY0DWUQSI8M58ECOx5K5EquZBzLTMcKosn250Y6U
   U+6+axpa6UhbwOuuPdQV53St1s0kNaMjUTw0DcqiEAr+Az8P2Bnt3Ksqq
   HxPACukXNiC6iysw735FBH7YhJOzWi7QcIVSr5Oz3IYSM+8zWsmDQFI+O
   Kdc1+jSvMpbh8RhYb2CgjHucZXuur0FesmiHCIEn19p+maQDLzq/PqIEt
   NbOMm2nr4uSXAlv7OUBTn+QahDuglLutG4s7g8n05q20xfDTeorkgQmvw
   Q==;
X-CSE-ConnectionGUID: lJRkQn/qRwSjwhtFuOBU9g==
X-CSE-MsgGUID: lFUDZvFnSLamtz7y8REdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="85547064"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="85547064"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:15:18 -0700
X-CSE-ConnectionGUID: r0kpRXVzSiiF80Ar8mHq4w==
X-CSE-MsgGUID: d0ukBF0MT8aIr32sW04SQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="287715607"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 11:15:14 -0700
Date: Tue, 23 Jun 2026 21:15:11 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ehristev@kernel.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Message-ID: <ajrNL2RcvpNMjjMj@ashevche-desk.local>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
 <20260623105944.128840-3-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623105944.128840-3-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_111519_813735_14BA20B5 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Jun 23, 2026 at 04:29:34PM +0530, Varshini Rajendran wrote:
> Extend support to handle different temperature calibration layouts.
> 
> Add a temperature calibration data layout structure to describe indexes
> of the factors P1, P4, P6, tag, minimum length of the packet and the
> scaling factors for P1 (mul, div) which are SoC-specific instead of the
> older non scalable id structure. This helps handle the differences in the
> same function flow and prepare the calibration data to be applied. Add
> additional condition to validate the calibration data read from the
> NVMEM cell using the TAG of the packet.
> 
> Use cleanup helpers for NVMEM data buffer wherever applicable.

> +#define AT91_TEMP_CALIB_TAG_ACST	0x41435354

This seems like FourCC that can be represented in ASCII (I suppose "ACST").
Can you add a short comment on top to decode that?
/* ...blablabla... in ASCII "ACST" */

...

>  struct at91_adc_platform {
>  	const struct at91_adc_reg_layout	*layout;
> @@ -481,6 +504,7 @@ struct at91_adc_platform {
>  	unsigned int				chan_realbits;
>  	unsigned int				temp_chan;
>  	bool					temp_sensor;
> +	const struct at91_adc_temp_calib_layout	*temp_calib_layout;
>  };

Is this the best placement in accordance with `pahole` tool?

...

> -	u32 *buf;
> +	u32 *buf __free(kfree) = NULL;

This looks like a separate change. Why is it in this patch?

-- 
With Best Regards,
Andy Shevchenko



