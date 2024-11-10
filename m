Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE90D12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51rqIAyIcgVeblNDeIP0tTw9wHbZ9mHgSey++a7S7Rs=; b=UwlucLRrjETA1IH7S+95NbztzG
	EDwQNv/ukrxqzcwuUicjXbFmIyPiSYZek2J32Viegt/Cbf1RigjuQSRCHI4Gq0UmVyId5Wy4rAsAJ
	TZi2FdrCFpVuZ93TLgS3ZSlBkmehv78hcffgN7gJb7ihHsJVS4G2j5y6TQgjVFfNRJnq1INGzv4Ft
	yukVA3G+1UaZ1Ob/joGJx8WqDUzaayIR7DFhD3M+5Nj3hdC0iBBkGeeksYYldthtdYPaMWHapsn1x
	CN4mz9k6HLA/vy0f/3IXZQLkeWOKghpR0ruFxc+i6507RWvnrBRm4qQxxtPOwjvo9MDpDq57ceJ9W
	lEk6q2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADQ3-0000000FRLb-33ts;
	Sun, 10 Nov 2024 19:16:19 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADOH-0000000FR7k-0uHB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:14:30 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id D1C6F4C8F6;
	Sun, 10 Nov 2024 19:14:26 +0000 (UTC)
Date: Sun, 10 Nov 2024 14:14:24 -0500
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731266068;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=51rqIAyIcgVeblNDeIP0tTw9wHbZ9mHgSey++a7S7Rs=;
	b=ZdmkzEBetq5p08NJ3nLHjD9gFK6PpH/wA0tEND6xZ6NolUi11FiaYC0d1G4nFmrVYifsGi
	4vc8pLErZjr1TFqPJH0x0TjG1/0xThg/2L8TNHf1VXUPhUkchzwS+BWWbXOd23hSHTynaR
	/yqRwQQzRjl2SBGhmZi8H+0SJCFjA5Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_111429_465279_901D58AC 
X-CRM114-Status: GOOD (  16.94  )
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

On Mon, Nov 04, 2024 at 10:40:16AM +0200, Andy Shevchenko wrote:
> On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:
> > Using dev_err_probe instead of dev_err and return makes the errors
> > easier to understand by including the error name, and saves a little
> > code.
> 
> ...
> 
> >  #define STK3310_REGFIELD(name)						    \
> >  	do {								    \
> >  		data->reg_##name =					    \
> > -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> > +			devm_regmap_field_alloc(dev, regmap,		    \
> >  				stk3310_reg_field_##name);		    \
> > -		if (IS_ERR(data->reg_##name)) {				    \
> > -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> > -			return PTR_ERR(data->reg_##name);		    \
> > -		}							    \
> > +		if (IS_ERR(data->reg_##name))				    \
> 
> > +			return dev_err_probe(dev,			    \
> > +				PTR_ERR(data->reg_##name),		    \
> 
> AFAICS these two can be put on one.

This doesn't leave room for whitespace between the end of line and "\",
replacing "do { } while (0)" with "({ })" and deindenting could make
enough room to clean this up the formatting of this macro though.

> > +				"reg field alloc failed.\n");		    \
> >  	} while (0)
> 
> 
> ...
> 
> > @@ -654,12 +652,11 @@ static int stk3310_probe(struct i2c_client *client)
> >  	int ret;
> >  	struct iio_dev *indio_dev;
> >  	struct stk3310_data *data;
> > +	struct device *dev = &client->dev;
> 
> This should has been done a few patches earlier...

Moving it there now

 - Aren

