Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5FAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plcjdq1Cw3VHe3Q3xX6iPoi4v2r7SMlsaZ2RjBJbaI4=; b=asn4453qJJ+Y1ecfh2a7v5WqVk
	+VB23ezx4xe8W3fP9uqtY2O1CYDAhnqrftOMFsR7dTySuJFZbKX/t6dfUX7ThgmZdXtAD1lNPgt3H
	yESqlhov0iqcWTXRhH+OaqIK7EY56b3jCQNEDNhv+rMz6kzH8+edDSyDuXdW/pTnjqXdt6stbGPkg
	qF+uVPBE0w//2Or0cF+ayc1L3mvy+tfaJJjl/eDpV6j6KspYIKZiGtsakj0er6gGh5M+wix1Yhtph
	9tyMnS0S10Ztja0gbu1Z8tItWD1BNsOEMVG9qZZNs17x4hGOrCk3UpFZMYUUZylPGsU+6m2/1U/+s
	nxLNw32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrWY-0000000ByUn-0DU2;
	Thu, 10 Jul 2025 13:41:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqG7-0000000BkZ4-2yMn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 12:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752150016; x=1783686016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Ars87cWfPNJmxmVVHggBVpUXosQcIraO2lesp921A0=;
  b=f/3EV4OF0nCNMsr2JCcPEsJbTEfdy1ynffuo4+EHZWCmmx8qjfWIBwFQ
   LGdVGQ53uh/OCmLnvJC4Izk7phk7noSIqyNmheDKCTbqzRYvpE9qgZ/pz
   MWEwK8E3PG506/xtSaT52yaExO09YdueFlf+FGVq1mT3y0F03eFPehKZ4
   wFQQFePwTWpkuPS+c3EsahmogRYkvoDCs0IOy1inRQ+9O1XE1aT5GHjt8
   MbwSYLUCMxA0ooBGUsmiEFketlx2+oo185bxKdMIFFb3kG7GbXVpbTsSw
   IcqB1XxSobdN18iuZwJe42AJ+rOzdnGacnAeeKWQg2H+bt43GXSFHYow8
   g==;
X-CSE-ConnectionGUID: XQ3XJq+CRXOCX4RXITzp7Q==
X-CSE-MsgGUID: pjHkq6QvSGmvE2joADFDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71877344"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="71877344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:20:12 -0700
X-CSE-ConnectionGUID: GXz77hyaR7K/tYrlBBMkog==
X-CSE-MsgGUID: kYPUpfJ0QvqQJaA5ZICfig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160078428"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 05:20:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uZqFw-0000000EC0t-26Sd;
	Thu, 10 Jul 2025 15:20:04 +0300
Date: Thu, 10 Jul 2025 15:20:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de, andrej.picej@norik.com
Subject: Re: [PATCH 2/2] iio: adc: imx93: Make calibration parameters
 configurable
Message-ID: <aG-v9IxJ-XAxmnyh@smile.fi.intel.com>
References: <20250710073905.1105417-1-primoz.fiser@norik.com>
 <20250710073905.1105417-3-primoz.fiser@norik.com>
 <aG-GZqhABwErcEyM@smile.fi.intel.com>
 <42dd658e-555a-43f7-a7bf-e5365d508f4a@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42dd658e-555a-43f7-a7bf-e5365d508f4a@norik.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_052015_790410_9AE1C1EB 
X-CRM114-Status: GOOD (  21.74  )
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

On Thu, Jul 10, 2025 at 12:23:58PM +0200, Primoz Fiser wrote:
> On 10. 07. 25 11:22, Andy Shevchenko wrote:
> > On Thu, Jul 10, 2025 at 09:39:04AM +0200, Primoz Fiser wrote:

...

> >> +	ret = device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
> >> +	if (!ret) {
> >> +		if (val != 0 && val != 1) {
> >> +			dev_err(adc->dev, "invalid nxp,calib-avg-en: %d\n", val);
> >> +			return -EINVAL;
> >> +		}
> >> +		reg = val;
> >> +		mcr &= ~IMX93_ADC_MCR_AVGEN_MASK;
> >> +		mcr |= FIELD_PREP(IMX93_ADC_MCR_AVGEN_MASK, reg);
> >> +	}
> > 
> > Please, since it's optional, do other way around.
> > 
> > 	val = $DEFAUTL;
> > 	device_property_read_u32(adc->dev, "nxp,calib-avg-en", &val);
> > 	FIELD_MODIFY(...)
> > 
> > Similar approach may be used for the other properties.
> 
> OK, I guess I could implement it like you suggested to explicitly set
> the default parameter values.
> 
> But in current implementation MCR values are read at the beginning of
> imx93_adc_calibration(), meaning calibration parameters are register POR
> defaults. With you suggestion, we put defaults in software rather than
> reading them from the hw directly.

I see, then you need to read, do FIELD_GET()/device_property_read()/FIELD_MODIFY().
You got the idea.

...

> > Please, factor out this to the function, so we won't see the direct IO in the
> > ->probe().
> 
> Sorry I don't understand this part.
> 
> What do you mean by factoring out this writel()?
> 
> Do you perhaps suggest to implement function
> imx93_adc_configure_calibration() and put all our changes into it?
> 
> But we are already in imx93_adc_calibration() which is separate from
> probe().

Ah, sorry for the mistakenly read the function name. Ignore this comment.

-- 
With Best Regards,
Andy Shevchenko



