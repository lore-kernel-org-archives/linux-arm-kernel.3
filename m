Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331BD2E9CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5S8BeF0nrq18mdCPjfEkKwRZjU4HVR6Gm86rMtGyyBk=; b=Zc9J3m0SeClJCB1jFyLWUkTwRD
	UKmV+2dRUAlOqXEoEy3jCDXohqG5LnSEbiRFaU2BEnni4dBh4sRzT0jdcAUm+EZUDnLlHFpnHpWXd
	0uoowMIEokpSz6ZbLS2DLjihBwTk98pSAZI8Z0zuMpeDq9wNP9YI6DX4Rx88DZ2vE5mxDvkrnidAr
	ZDm5hRp0QAzcCxdMXcbIn1fByA8ajlwivefWYmIywU3Bv3wU+4R4zO3anhG3gaQ5UAuDVdeUM8Og3
	wisd23K8xWVoGOC7aOF2ayDKUt5/8HzbGtUJ5vSAYtq6hJMHpJOB0eq+2fkUoJRSYbF8+fYgNgDwH
	1O+TJRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR0a-0000000HAKd-02Sj;
	Mon, 11 Nov 2024 09:46:56 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQyi-0000000H9ov-43dU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:45:03 +0000
X-CSE-ConnectionGUID: F9rdtuwbRMiTrYhw6p8ZaA==
X-CSE-MsgGUID: jFKoCMtBS86foIg3Cz7acA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30972330"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30972330"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:45:00 -0800
X-CSE-ConnectionGUID: /eX76d9LRjOk6/8VeX37PA==
X-CSE-MsgGUID: UvJCofyfTlmID8eXgH3kkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="91926457"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:44:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1tAQya-0000000DXxa-0N1Q;
	Mon, 11 Nov 2024 11:44:52 +0200
Date: Mon, 11 Nov 2024 11:44:51 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Aren <aren@peacevolution.org>
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
Message-ID: <ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
 <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014501_068590_88552C34 
X-CRM114-Status: GOOD (  25.30  )
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

On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote:
> On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> > > On Mon, Nov 04, 2024 at 10:40:16AM +0200, Andy Shevchenko wrote:
> > > > On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:

...

> > > > >  #define STK3310_REGFIELD(name)						    \
> > > > >  	do {								    \
> > > > >  		data->reg_##name =					    \
> > > > > -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> > > > > +			devm_regmap_field_alloc(dev, regmap,		    \
> > > > >  				stk3310_reg_field_##name);		    \
> > > > > -		if (IS_ERR(data->reg_##name)) {				    \
> > > > > -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> > > > > -			return PTR_ERR(data->reg_##name);		    \
> > > > > -		}							    \
> > > > > +		if (IS_ERR(data->reg_##name))				    \
> > > > 
> > > > > +			return dev_err_probe(dev,			    \
> > > > > +				PTR_ERR(data->reg_##name),		    \
> > > > 
> > > > AFAICS these two can be put on one.
> > > 
> > > This doesn't leave room for whitespace between the end of line and "\",
> > 
> > Is it a problem?
> 
> It feels a bit camped and not as readable to me:
> 
> #define STK3310_REGFIELD(name)						    \
> 	do {								    \
> 		data->reg_##name =					    \
> 			devm_regmap_field_alloc(dev, regmap,		    \
> 				stk3310_reg_field_##name);		    \
> 		if (IS_ERR(data->reg_##name))				    \
> 			return dev_err_probe(dev, PTR_ERR(data->reg_##name),\
> 					     "reg field alloc failed.\n");  \
> 	} while (0)

Rather this way (besides the fact of having spaces instead of TABs for
the last formatting, in such case you even can simply add yet another
column with spaces):

#define STK3310_REGFIELD(name)								\
	do {										\
		data->reg_##name =							\
			devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##name);	\
		if (IS_ERR(data->reg_##name))						\
			return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
					     "reg field alloc failed.\n");		\
	} while (0)

> Removing a level of indentation makes it much better

You can do it differently

#define STK3310_REGFIELD(name)							\
do {										\
	data->reg_##name =							\
		devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##name);	\
	if (IS_ERR(data->reg_##name))						\
		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
				     "reg field alloc failed.\n");		\
} while (0)

> #define STK3310_REGFIELD(name) ({						\
> 	data->reg_##name = devm_regmap_field_alloc(dev, regmap,			\
> 						   stk3310_reg_field_##name);   \
> 	if (IS_ERR(data->reg_##name))						\
> 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> 				     "reg field alloc failed\n");		\
> })

I am against unneeded use of GNU extensions.

> > > replacing "do { } while (0)" with "({ })" and deindenting could make
> > > enough room to clean this up the formatting of this macro though.
> > 
> > do {} while (0) is C standard, ({}) is not.
> 
> ({ }) is used throughout the kernel, and is documented as such[1]. I
> don't see a reason to avoid it, if it helps readability.

I don't see how it makes things better here, and not everybody is familiar with
the concept even if it's used in the kernel here and there. Also if a tool is
being used in one case it doesn't mean it's suitable for another.

> 1: the "GNU Extensions" section of Documentation/kernel-hacking/hacking.rst

-- 
With Best Regards,
Andy Shevchenko



