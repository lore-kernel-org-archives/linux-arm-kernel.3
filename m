Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BE6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPUk0tK7dnxSRwlTSpiw1hFsw3wyFM85DDCNS3QkcBM=; b=3P7t+RI9Y4vWq3D6hhiByWbpGl
	fAMg+4uki2t7rTXNaYycARMXKMfyXHLDGeFSQ+kAfiPUHWDniNpCVYS8sYEW4wzqB1Snz2+kXFEvc
	w2KItTGnQ4tE3asfgNfMPM2KhcMWf2Qr6KAN/z52HEXSTCQEVAh54RB/tkc/D/v4hnuPGkbpQtsRm
	jub5i9E6JSQ7JRbEiPVuL6fdSN+rLFllH8M3KQ3GDeY54vWomT6CEV54jkEDGt2va65Um+1syHUXA
	w/vZVZQaNZO3M3mwrcphPJprpc7B5BRN7TAzYIHMewyJdhHqwS5eGBJu3Bhn9Hghpi+u4HYqfcsk9
	yJ0/p5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we59d-0000000Djuk-2l8N;
	Mon, 29 Jun 2026 06:07:37 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we59b-0000000Djn6-1VxQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782713256; x=1814249256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iY967g1ZEXuRDMEeq8Z98MT4WkdJAVc0EMew914JPwE=;
  b=KkNOYxp7hPfBtPfuKENwQubgjykpWl0WfLRAx+mIU/PIKLy2fTD5idX8
   xedwCod5XINRHAJdlnLWe/6atE0hMtSkV/MPX6HmMZmGVLHQaMAaJBEqg
   El+y0DEmrKrDKtPBRek1vmbSKWJZ5vVZolfiMFbnUR8AX/4DhgQA4JwAn
   a55kL4udubGf7h02BDl2z3xnrCIYpNqKr2/iZEtvycaV873UaIgykEP69
   bdmcNv4ItEidWPVGmD9uFTpny1MlJLNasQBGrqE/s7TfZKrg9sYbGK39P
   ZWbcdDd79QwZKpWDioFJP7iwrU5wQ+CjXf+KHScs6HMBbsJk5xrX81zH7
   g==;
X-CSE-ConnectionGUID: J6LmZXhxRsiuaKSgk+0B2g==
X-CSE-MsgGUID: qqfRvLrfRt+kmb9Z8F5ySw==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83533038"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83533038"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:05:33 -0700
X-CSE-ConnectionGUID: X2Y08qLLQWiV8H/vMCy++g==
X-CSE-MsgGUID: r9Evo2xCRPm5B0mtFMWtOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="252000444"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 23:05:30 -0700
Date: Mon, 29 Jun 2026 09:05:27 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: David Lechner <dlechner@baylibre.com>, Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: add Axiado SARADC driver
Message-ID: <akILJ0zG-g8rMzts@ashevche-desk.local>
References: <20260622-axiado-ax3000-ax3005-saradc-v3-0-e57c7c7ae675@axiado.com>
 <20260622-axiado-ax3000-ax3005-saradc-v3-2-e57c7c7ae675@axiado.com>
 <6770a7af-06cc-4240-9b20-c299e7080ab1@baylibre.com>
 <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b06005e0-b7bc-4967-ac7b-cb170219f131@axiado.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_230735_441482_B255DFAE 
X-CRM114-Status: GOOD (  16.28  )
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

On Mon, Jun 29, 2026 at 04:33:00AM +0200, Petar Stepanovic wrote:

...

> >> +static const struct iio_chan_spec axiado_saradc_iio_channels[] = {
> >> +     AX_SARADC_CH(0, "adc0"),   AX_SARADC_CH(1, "adc1"),
> >> +     AX_SARADC_CH(2, "adc2"),   AX_SARADC_CH(3, "adc3"),
> >> +     AX_SARADC_CH(4, "adc4"),   AX_SARADC_CH(5, "adc5"),
> >> +     AX_SARADC_CH(6, "adc6"),   AX_SARADC_CH(7, "adc7"),
> >> +     AX_SARADC_CH(8, "adc8"),   AX_SARADC_CH(9, "adc9"),
> >> +     AX_SARADC_CH(10, "adc10"), AX_SARADC_CH(11, "adc11"),
> >> +     AX_SARADC_CH(12, "adc12"), AX_SARADC_CH(13, "adc13"),
> >> +     AX_SARADC_CH(14, "adc14"), AX_SARADC_CH(15, "adc15"),
> > Two columns looks a bit odd.
> 
> I will also reformat the channel table to one entry per line.

I think with a new approach David proposed, 4 per line will be also acceptable.

> >> +};

...

> >> +static void axiado_saradc_disable(void *data)
> >> +{
> >> +     struct axiado_saradc *info = data;
> >> +
> >> +     writel(AX_SARADC_GLOBAL_CTRL_PD, info->regs + AX_SARADC_GLOBAL_CTRL_REG);
> > People usual make read and write wrappers or use regmap to avoid having
> > to write `info->regs + AX_SARADC_GLOBAL_CTRL_REG` so many times.
> 
> My understanding is that simple read/write wrappers are not always
> preferred unless they provide additional value. Would switching the
> driver to regmap be acceptable here to avoid repeating the base address
> calculation?

This is the value of transition --> having that register base to be hidden and
not repeated all the times.

-- 
With Best Regards,
Andy Shevchenko



