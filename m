Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A8AD111BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBlZA/HGTCpHhEeBtRTSuBk2pjYTdOiWdgTqLgMDlac=; b=24isCph/lQ5oB3f0ZEsvxyp3q+
	FNT0GW1s/wSi8PnrTyEILJj9YIm8AEaQw1A0WWnv4hZRzBSlA7S4Ktx8WtDf2IJYSneN8o6A99VAT
	Uw5iHYhYXqvVfxRwvxhOtZkb1cZvRwJn9nWcQUSPbgsxtnpTMq7UbjQ0acNKDjGfkJliLZK3FAkaE
	6Ok9KMngRuTi7elMH5eksd5An1Ee2T2T4Pq8kF7AG6Z9TxwvQWqZOpXijlKhwSOE0DwcUQkGxVJuP
	rMsNrwTHMX+zyu9YvazoodMIoSwr1dVnrstBBx5WiiDYsqVe4kEAJLQTjFRZoITbMqLFovAgCsh0P
	9kU1wTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sg9-0000000D0g0-0Yhj;
	Mon, 04 Nov 2024 08:43:17 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sdx-0000000D0Ga-37hN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709662; x=1762245662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dQ2Nrwr8qCKLCZXi+hDpCYjvtmhoN1vcdUbtbhzg0e4=;
  b=GN63/JWnGoC/22jVMSM+Gz+X1FLcbZMfmE1wTXGSSp/I7qUPIuhxbA+k
   E6LZUIkcMA2SNlOIxnivH4Dj+WcXGWuxvSRp/BiSJYrQeWQMk7knEWUrS
   wpHnTg4CphCttq+ELrL2Ix6hKRDHqAhGrSuooffyAoZFRqwUIDTcyfkOx
   hLRmy0dmjE6gqZ9hiuLAAGxugu2AnOvevE7tjj6Dq79UgWADsUnWfHLna
   1qLXO4+h/tdGg4lGHQtnuyLc7/a3co0S7bmu6ZtEkU24SHN6D89Amp8FJ
   ZDim/I8A66sKX2ouQXXb/zeXiN9OinPd1/rN8MKKZ9OklUz4IKstx8Lfc
   A==;
X-CSE-ConnectionGUID: hb40ujcfTea5ScOmTy1zNw==
X-CSE-MsgGUID: PWTHmhYqQxeuLml6YODw+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30498306"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="30498306"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:40:24 -0800
X-CSE-ConnectionGUID: dxjsGfaERoSkVhACXThpVw==
X-CSE-MsgGUID: 3wo+BoLAQjG0Cnx6nxvy6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="87520297"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:40:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sdE-0000000Az6Y-1XIN;
	Mon, 04 Nov 2024 10:40:16 +0200
Date: Mon, 4 Nov 2024 10:40:16 +0200
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
	Ondrej Jirman <megi@xff.cz>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102195037.3013934-11-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_004101_850601_81AA29BD 
X-CRM114-Status: GOOD (  14.97  )
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

On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:
> Using dev_err_probe instead of dev_err and return makes the errors
> easier to understand by including the error name, and saves a little
> code.

...

>  #define STK3310_REGFIELD(name)						    \
>  	do {								    \
>  		data->reg_##name =					    \
> -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> +			devm_regmap_field_alloc(dev, regmap,		    \
>  				stk3310_reg_field_##name);		    \
> -		if (IS_ERR(data->reg_##name)) {				    \
> -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> -			return PTR_ERR(data->reg_##name);		    \
> -		}							    \
> +		if (IS_ERR(data->reg_##name))				    \

> +			return dev_err_probe(dev,			    \
> +				PTR_ERR(data->reg_##name),		    \

AFAICS these two can be put on one.

> +				"reg field alloc failed.\n");		    \
>  	} while (0)


...

> @@ -654,12 +652,11 @@ static int stk3310_probe(struct i2c_client *client)
>  	int ret;
>  	struct iio_dev *indio_dev;
>  	struct stk3310_data *data;
> +	struct device *dev = &client->dev;

This should has been done a few patches earlier...

-- 
With Best Regards,
Andy Shevchenko



