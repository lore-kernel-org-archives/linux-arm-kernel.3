Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423EFD12D55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZcPhgVogTXytMRM2X3xlfPRj/xPsn3yw0hTKHL8ttU=; b=EaD3MjPsT+oXKQEHCoWjbM3AiU
	hpnnCRQJHyWwe3LGUMBwJZsI1S7CmtR2cSiV/yD9TpnsBapKXaLmad+upFXbDMgeHEEb1h2o5lHtb
	KkRXrFbyxNnaBRcZuviShjekvhiaElXPbqf4BZhhOOcCGPw+RHxCIEK8BUH2Q6xC2tDV9c9wPrZzb
	KzMuvazDGXxW7Vc5/seofONfc2+pl55a/0gQj8l7frfhXcCiJ+tdhdYWyYF6jGW3HQb3gFRE97Xud
	81z+px7dkoqa/82sTS5qkXI2r000aUJIkCdhpMNzPGU3IU7sm4qrHmuqwAGKenb3dFiy6kAidepbz
	n1lSdYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFbi-0000000Fds4-0q4k;
	Sun, 10 Nov 2024 21:36:30 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAFZs-0000000FdaG-1JsP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 21:34:37 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 2763C4C949;
	Sun, 10 Nov 2024 21:34:33 +0000 (UTC)
Date: Sun, 10 Nov 2024 16:34:30 -0500
From: Aren <aren@peacevolution.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
 <ZzEPACoblmcQD9yu@surfacebook.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzEPACoblmcQD9yu@surfacebook.localdomain>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731274474;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=oZcPhgVogTXytMRM2X3xlfPRj/xPsn3yw0hTKHL8ttU=;
	b=f9tVVIwxnKGQLg6bmCXySmWScp8LSpvZQfexKo1/aOdBOYhvxAdyTpFbVZUj3C2ce1hshi
	iixMbVEkA1qUwuAwFnlTEC1qAYNUMd6D5MeRodWpF/VCKgPS9VXM1nAPOtNjlKcSsYiodK
	L6nJMhaEPdkFvEp7pHwo/J+aFEuiEbQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_133436_538615_3355C29A 
X-CRM114-Status: GOOD (  16.74  )
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

On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote:
> Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> > On Mon, Nov 04, 2024 at 10:40:16AM +0200, Andy Shevchenko wrote:
> > > On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:
> 
> ...
> 
> > > >  #define STK3310_REGFIELD(name)						    \
> > > >  	do {								    \
> > > >  		data->reg_##name =					    \
> > > > -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> > > > +			devm_regmap_field_alloc(dev, regmap,		    \
> > > >  				stk3310_reg_field_##name);		    \
> > > > -		if (IS_ERR(data->reg_##name)) {				    \
> > > > -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> > > > -			return PTR_ERR(data->reg_##name);		    \
> > > > -		}							    \
> > > > +		if (IS_ERR(data->reg_##name))				    \
> > > 
> > > > +			return dev_err_probe(dev,			    \
> > > > +				PTR_ERR(data->reg_##name),		    \
> > > 
> > > AFAICS these two can be put on one.
> > 
> > This doesn't leave room for whitespace between the end of line and "\",
> 
> Is it a problem?

It feels a bit camped and not as readable to me:

#define STK3310_REGFIELD(name)						    \
	do {								    \
		data->reg_##name =					    \
			devm_regmap_field_alloc(dev, regmap,		    \
				stk3310_reg_field_##name);		    \
		if (IS_ERR(data->reg_##name))				    \
			return dev_err_probe(dev, PTR_ERR(data->reg_##name),\
					     "reg field alloc failed.\n");  \
	} while (0)

Removing a level of indentation makes it much better

#define STK3310_REGFIELD(name) ({						\
	data->reg_##name = devm_regmap_field_alloc(dev, regmap,			\
						   stk3310_reg_field_##name);   \
	if (IS_ERR(data->reg_##name))						\
		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
				     "reg field alloc failed\n");		\
})

> > replacing "do { } while (0)" with "({ })" and deindenting could make
> > enough room to clean this up the formatting of this macro though.
> 
> do {} while (0) is C standard, ({}) is not.

({ }) is used throughout the kernel, and is documented as such[1]. I
don't see a reason to avoid it, if it helps readability.

1: the "GNU Extensions" section of Documentation/kernel-hacking/hacking.rst

 - Aren

