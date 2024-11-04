Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26602D111BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB9I+u87EYTeGn3RwddnAvH6mkhq0GVEQ3CWs9/W6W4=; b=HlBVyNIp+zqhj52bbN2EYtFq+9
	7fGyKrsmOwuyEhxR+yD14AoNJ23M2nsbbibhzmu0uGax3N+lfGAXjrP8X+RDrnsXG31lmc1jX7DdT
	iWUrXOQ0QZu22PUQP8X7jxEOyxUpQzvuxsN43Ac4MhMee4ICCeWsSBMCj6P8oNVRLCBS2ArNvglEA
	ZlLG84Tj2XPupGO7wqN+FI6Cn7jNEAL83+6WeQl65BpWbNjRgb7UECZn6dRdvwjfyyy7xrFp2teJQ
	2OzoW5NHHDGETIcJ4DxzL5WZxvVcYjw1svJkVGIlF/KHvaiN+V1FO79Gk0UPqP1qhAQ2r/BYXiZ83
	NFIid8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sar-0000000CzhA-3fwo;
	Mon, 04 Nov 2024 08:37:49 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sYx-0000000CzLo-14jv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709352; x=1762245352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wbnG3byYpMqq7suN0oey1RV3b6DeAMAFl852jccRA8M=;
  b=Cz/nDbjXc+mXAsJa1r0J5KQABzpfCPFxjlI67X9/9Km/TFwrHKw7OPay
   lG9OxeFtcJiBTq0qSQwYv1e8oD3uhrHnHR4plwognDAk0hU+eUyfBK5HT
   fng5nhnQC9MteSAh78oyN7LWdpC4pW9CyT/vMDDP59gyMGwyfodWnEv5z
   t77a7syJ38S9koHgaTo2iJgCOrUENpG5wZM+bX5TaF22zpipg49uFHXCr
   3JCTgRhRH3SGntbl4GBBngaT/TvuxHnQpg0AdxDNsn365UneFYyYakXYN
   CKYbcdrpaeVQPNj0tYpm0ZG/hv0F95Q/ihH26pGrbZfRXisQuw35Sru6Q
   A==;
X-CSE-ConnectionGUID: Xk3/B0xqQAKX34orATbgkQ==
X-CSE-MsgGUID: 7X37Qib8TFSEvkKMLtGkow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41501576"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41501576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:35:51 -0800
X-CSE-ConnectionGUID: vsYC28+jRu676hKNhfTnag==
X-CSE-MsgGUID: E9Ezl5rPTHGFjB7sqcjLtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88165220"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:35:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7sYo-0000000Az2S-3O3j;
	Mon, 04 Nov 2024 10:35:42 +0200
Date: Mon, 4 Nov 2024 10:35:42 +0200
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
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <ZyiHXl0mRIvM4Qa0@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-9-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241102195037.3013934-9-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003553_219147_0DBF62E6 
X-CRM114-Status: GOOD (  15.75  )
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

On Sat, Nov 02, 2024 at 03:50:39PM -0400, Aren Moynihan wrote:
> The vdd and leda supplies must be powered on for the chip to function
> and can be powered off during system suspend.
> 
> This was originally based on a patch by Ondrej Jirman[1], but has been
> rewritten since.
> 
> 1: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82

Make it a Link tag...

> 

...here

Link: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82 [1]
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>

...

> +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> +				      data->supplies);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");

With previously introduced temporary 'dev' variable these become:

	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->supplies), data->supplies);
	if (ret)
		return dev_err_probe(dev, ret, "get regulators failed\n");

...

> +	ret = stk3310_regulators_enable(data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "regulator enable failed\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to register regulator cleanup\n");

So do these...

...

> +	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);

Is array_size.h included?

> +	if (ret) {
> +		dev_err(dev, "failed to disable regulators: %d\n", ret);
> +		return ret;
> +	}

...

> -	u8 state = 0;
> +	int ret;
>  	struct stk3310_data *data;
> +	u8 state = 0;

Can we try to make it RCT ordered?

-- 
With Best Regards,
Andy Shevchenko



