Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3106DC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTJLpEas8F0AQw6YymLULrSMVw347jl8X+/BBYINuCg=; b=m+XSwn/bHWqjUu3pGYPo4ffNj7
	3Xohginp1zCroxIwchw4PpFGT5uBJDeaGp+bIKJE5savMxJUj2Nrw1WSWsqOuoA7xsPT/fbofhOBM
	mFGDsRI26kD9NOHaf83XC47v9TvDzgAHkhAIL8ay33/QQzdKKVZAknXyhDx7tfv6Zt2lkvcYd7CVb
	VSBM+0V9HCMnqKxeHV4EHknKTYlFCFyI91v8tHxzsZZFXrmNSNd1W9XGCfRPoTjoFP8RhousJ+BeZ
	sle/5osqz++jUjqf3ahj6F1uDaOVJNUq3Zj5PyeDidlMNUcShJCV2G3KO39NDzh3YAT5pVM3KPtqo
	v2nd8GAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th8cd-0000000F2Zx-1gJ8;
	Sun, 09 Feb 2025 14:49:23 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th8bF-0000000F2Tr-0lTo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 14:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739112477; x=1770648477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mfm0fzgHcJqEKVxh9uCNABxYv9pkHhFHRmLF/klPJB0=;
  b=buoXYLemEb6bZNXyoF1r6Bi6mQ4esg3d5Uxtow4K8XS7csPJJuRE2LLp
   VZ2xAkt995jAyN4H5vMXG25sltRyBg4Xc4s+uKhMJN5VEQjNRGIvMeYDU
   Mf1pat0wrCsIs+5JR9nlvqGj5yE00RyKhw0bjdmkhtSAG0Grs2i2c4rCF
   ZGBVUbnptraRFmPJZo/vVzdW4cDaYMBiw7eDqcAQQIHQVhIZ68Fi5akGD
   Tbgn55VXQwyhMYGZHi+8RdiWwoFEaGzifOItM15jYqEeY8aqq7KPiEXW4
   iatzuUBs+ZGswYwALdxwKEi9mTiLuwCpjTXYh/OH5uAaJhdLWj8IiRbYs
   g==;
X-CSE-ConnectionGUID: t9lQnRc3RZOUhzGG/35PwQ==
X-CSE-MsgGUID: EGjy6AfLSWOmAA8MiTQvXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39814475"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39814475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 06:47:53 -0800
X-CSE-ConnectionGUID: aiO4+LsNRneHiuvh2xmPZQ==
X-CSE-MsgGUID: olmz5DBrQCayHBuyQLFg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116039181"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 06:47:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1th8b2-00000009qVD-1xjG;
	Sun, 09 Feb 2025 16:47:44 +0200
Date: Sun, 9 Feb 2025 16:47:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <trabarni@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Ondrej Jirman <megi@xff.cz>,
	Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <Z6jAEEU2dqn_FJVp@smile.fi.intel.com>
References: <20250208211325.992280-2-aren@peacevolution.org>
 <20250208211325.992280-8-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208211325.992280-8-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_064757_296233_1B240C23 
X-CRM114-Status: GOOD (  15.82  )
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

On Sat, Feb 08, 2025 at 04:13:24PM -0500, Aren Moynihan wrote:
> Using dev_err_probe instead of dev_err and return makes the errors

Use dev_err_probe()
dev_err()

> easier to understand by including the error name, and saves a little
> code.

I believe this patch will make more sense before switching to local 'dev'
variable. Then the previous one will have an additional justification as
the "struct device *dev = ...;" lines in some cases will be added already
by this patch.

...

>  	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> -	if (!indio_dev) {
> -		dev_err(&client->dev, "iio allocation failed!\n");
> -		return -ENOMEM;
> -	}
> +	if (!indio_dev)
> +		return dev_err_probe(dev, -ENOMEM, "iio allocation failed!\n");

We don't issue the messages for -ENOMEM.

If it's in the current code, add a new patch to drop this message and return an
error code directly.

...

> +	if (ret < 0)

Perhaps, while at it, drop these ' < 0' parts where they are not hinting about
anything.

> +		return dev_err_probe(dev, ret, "device_register failed\n");

-- 
With Best Regards,
Andy Shevchenko



