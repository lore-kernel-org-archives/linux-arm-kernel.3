Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F7ED33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOjBP4cOUbpMNEh/gbTqvoh/mwK9nm1pPu5RCAftrqU=; b=EwKq9a9GYRj0KNeProeAUZRJRj
	dkCTtZikfzirJrUyHThZX/fIHvqvN/BuFf8mu0dLvxvY6oG7trtR3zZoQfDYho7lwcqMEq1CxGSlj
	HwkP81EShbIhJ2AkTszFGcVn82chnaykHtZlXERKqim+Ymd2+B8LPiUa0UtH8ypJQiADYIi0nJ7gL
	xM7uh9b9O6F8AIdCYGM6A3E8HkqbUwPOO4H0Z+YknabBKB4tmFIsE8HbiOgBO3yr6ym64tAI/SE4h
	1InKiqCbjcJCEiSg+ZkEunH/jkEWQl4yq0VFfE5InvHAdgd3vFCdlMSFoVW/G2aUoq7RdUYs3is+5
	dcGaFFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ROC-0000000BGMg-0MxR;
	Mon, 28 Oct 2024 15:10:40 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Qz6-0000000BBND-1g3H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 14:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730126685; x=1761662685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bfgx/pN4+ZpmTPUi9k1nDEyQyXcONpELcSCUR7eiAy0=;
  b=JDJSBub0TsOzpLPWIcrfr7F2KVfiF9gtcZvrhXQWMp4mI7H2SrlUFRQf
   0hkQ0fpqLT9O9pR20W1z/RFJ6MPFDWJDqrD9J0pXFcH94DhSg6+1dx/In
   XUHVwJgNENlOBHFXPJR0JCW69pf8/5ThJtzuw6WcO5ovOIRo4l03JiuQo
   70Aha05LccQ5o2IJBZ7zztrJGc+njMJX9BeWvYdpebPseFKJsWp3oakTF
   s0B9Bh6Bh93kMz4vxmgz4NWXO7SdqmG7UqSsZDifDawzgmpNlIIBrfHh8
   OBbJWdXb1r1XZEry99Es0S4tsdCAUfdovg9iGl8bQ03EHqTIb0lsnc3Aj
   Q==;
X-CSE-ConnectionGUID: VnVYgGSDQRu1Co3SVuKvvQ==
X-CSE-MsgGUID: 7x6ctL2wS+27SZ+J46zAFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40824960"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40824960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:44:42 -0700
X-CSE-ConnectionGUID: Ys/a85DwTkujR009Uj6D1A==
X-CSE-MsgGUID: HVRckoVjRQaYZ+L5JfieUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81216495"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 07:44:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5Qyv-000000085jT-3zhr;
	Mon, 28 Oct 2024 16:44:33 +0200
Date: Mon, 28 Oct 2024 16:44:33 +0200
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
Subject: Re: [PATCH v3 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <Zx-jUeQ9UbZt48ss@smile.fi.intel.com>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-5-aren@peacevolution.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028142000.1058149-5-aren@peacevolution.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_074444_631827_12C3E313 
X-CRM114-Status: GOOD (  10.93  )
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

On Mon, Oct 28, 2024 at 10:19:58AM -0400, Aren Moynihan wrote:
> Using dev_err_probe instead of dev_err and return makes the errors
> easier to understand by including the error name, and saves a little
> code.

...

>  		data->reg_##name =					    \
>  			devm_regmap_field_alloc(&client->dev, regmap,	    \
>  				stk3310_reg_field_##name);		    \
> -		if (IS_ERR(data->reg_##name)) {				    \
> -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> -			return PTR_ERR(data->reg_##name);		    \
> -		}							    \
> +		if (IS_ERR(data->reg_##name))				    \
> +			return dev_err_probe(&client->dev,		    \
> +				PTR_ERR(data->reg_##name),		    \
> +				"reg field alloc failed.\n");		    \
>  	} while (0)

Same remark, if client is not used here, supply struct device pointer directly
and make these all lines better to read.

-- 
With Best Regards,
Andy Shevchenko



