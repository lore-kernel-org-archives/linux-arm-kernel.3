Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M83njLRgDWo9HchPv8kCC6c+xifLr9LeFMIrCAqugJM=; b=aEhIJuLemDkPingaP7osYKxGlm
	RkqTvWqDe5S7JkfGjFOD/570a5Y/FN4XCR085UGAj5I74IX/0wnXTa5hm8FpdsKdODHhuBDCjfPuZ
	EGy55gUJvGitVYeApMdOOqv6wQAWIKwUzATksSDVJ3pNAkT58ae/6Rcw7+5dFUHbiJ08thvi93862
	ino8Tfp2CuPTmf3owgLvoRCXFRJQQtsq8mOrCMId6wF9F961INtlHPfiumV3FtC72+JEf7jERUKam
	8ik+UHSMvtP2B7/zSvVHHaOQvqewbp1Hhvk17/XL0SI8TfQ0D14IB+IQq3TMpgNkAbf/M1s2GZwTZ
	ZcS7Q/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXOL-0000000GxYy-1t5f;
	Tue, 30 Jun 2026 12:16:41 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXOJ-0000000GxYP-1EMS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 12:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782821799; x=1814357799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VmtYJeyjTF+nW+MqqASSDf26xTqsmBZJhwKzsP7qfPA=;
  b=STD34L9T4RflfiP/F7gR6vn+LvUVqoeTv/JPQfuk9JNYtNZck7elfs0f
   nM6juxjIWI7ox4ldCnAEoym+ispPz1enUJFvd7wnvc2C1DT67RUqn5R9a
   njcD8s30JoyEoiD5WChlk3tL9DlcS3/HhCLUGoxnjfP0JL83TBzWDm3oM
   WsS5pHm6jhQ4xGwvWMFwMSxssU8vZqzKAMY2Ch/atc5p68YAmxux7L7Sx
   Lv5Qlls1yJmYgC/aBxN/eHXGDi91nQSj+1H+MersKeZ8jHXbeFg4ljnDX
   Pg9Va5AF/dJFqa/hrl6zdAeVSOCjVq92O1j4G6y03nQITrGP4r9QRbDVK
   Q==;
X-CSE-ConnectionGUID: FmhYdmoMQvKIwl7auYgdPA==
X-CSE-MsgGUID: JZ7Vj+xARQGuF+UCPT9hVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82521280"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82521280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:16:39 -0700
X-CSE-ConnectionGUID: dJEhJRdtTxqOgFFYZ+iaZg==
X-CSE-MsgGUID: yA1VguZ+QZukmHFHt/ditg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="276531891"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 05:16:33 -0700
Date: Tue, 30 Jun 2026 15:16:31 +0300
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
Subject: Re: [PATCH v3 03/13] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
Message-ID: <akOzn9ci3FPCtqqo@ashevche-desk.local>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
 <20260630093603.38663-4-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630093603.38663-4-varshini.rajendran@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051639_341330_3CA6D92E 
X-CRM114-Status: GOOD (  14.58  )
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

On Tue, Jun 30, 2026 at 03:05:53PM +0530, Varshini Rajendran wrote:
> Extend support to handle different temperature calibration layouts.
> 
> Add a temperature calibration data layout structure to describe indexes
> of the factors P1, P4, P6, tag, minimum length of the packet and the
> scaling factors for P1 (mul, div) which are SoC-specific instead of the
> older non scalable id structure. This helps handle the differences in the
> same function flow and prepare the calibration data to be applied. Add
> additional condition to validate the calibration data read from the
> NVMEM cell using the TAG of the packet.

...

>  /**
>   * struct at91_adc_platform - at91-sama5d2 platform information struct
>   * @layout:		pointer to the reg layout struct

>   * @oversampling_avail_no: number of available oversampling values
>   * @chan_realbits:	realbits for registered channels
>   * @temp_chan:		temperature channel index
> + * @temp_calib_layout:  temperature calibration packet layout

This uses spaces instead of tab(s).

>   * @temp_sensor:	temperature sensor supported
>   */

...

> +	layout = st->soc_info.platform->temp_calib_layout;
> +	if (!layout || !layout->p1_div)

Technically speaking the !layout condition rather means -ENODEV.

> +		return -EINVAL;

...

> +	clb->p1 *= layout->p1_mul;
> +	clb->p1 /= layout->p1_div;

So, p1 can be defined in layout as struct u32_fract.

-- 
With Best Regards,
Andy Shevchenko



