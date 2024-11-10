Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F552D12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrTvkqnOkcGxZG1OOP+6H9s6OhWdKw5aw1bGNnugLi8=; b=vQaLJO1dtF+/03ZY9y9sypKZUl
	ORkRt1JgqVgLW1i+4FC0Zpz7y7wZFEatWT+fQDfEGagDDuUkjkxx7ctt4nkxo7xK+NcVX6i8bIUkG
	dcfxdHHKlxOSdvFTZOcBG1t0LVYCUChmcZCwHycMt5Vk4fHyuQEmEaiAt/JmnOFPZStk1KH695F8O
	Y7JaQ1l8G4f2KkFOlixIGu9Nxrxum4lYa73SeKepZDYHvymJ0NpLJAiwThpNctdN3kJzTZo8qJBgg
	Ys8VgwDiLvqd/M0k3OJRptlOTsghrmc4O4TLhdBBz69IKbl+Ioa+YapNrL6lNZKBkEqxK0N9bKoNY
	Di/VvSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAE1J-0000000FUch-1QbS;
	Sun, 10 Nov 2024 19:54:49 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADzC-0000000FUKS-1LGq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:52:39 +0000
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 5376b6f1-9f9d-11ef-8874-005056bdd08f;
	Sun, 10 Nov 2024 21:52:33 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Nov 2024 21:52:32 +0200
To: Aren <aren@peacevolution.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
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
Message-ID: <ZzEPACoblmcQD9yu@surfacebook.localdomain>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-11-aren@peacevolution.org>
 <ZyiIcDaANjxwtCz-@smile.fi.intel.com>
 <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_115238_534507_27DA8ED8 
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

Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti:
> On Mon, Nov 04, 2024 at 10:40:16AM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 02, 2024 at 03:50:41PM -0400, Aren Moynihan wrote:

...

> > >  #define STK3310_REGFIELD(name)						    \
> > >  	do {								    \
> > >  		data->reg_##name =					    \
> > > -			devm_regmap_field_alloc(&client->dev, regmap,	    \
> > > +			devm_regmap_field_alloc(dev, regmap,		    \
> > >  				stk3310_reg_field_##name);		    \
> > > -		if (IS_ERR(data->reg_##name)) {				    \
> > > -			dev_err(&client->dev, "reg field alloc failed.\n"); \
> > > -			return PTR_ERR(data->reg_##name);		    \
> > > -		}							    \
> > > +		if (IS_ERR(data->reg_##name))				    \
> > 
> > > +			return dev_err_probe(dev,			    \
> > > +				PTR_ERR(data->reg_##name),		    \
> > 
> > AFAICS these two can be put on one.
> 
> This doesn't leave room for whitespace between the end of line and "\",

Is it a problem?

> replacing "do { } while (0)" with "({ })" and deindenting could make
> enough room to clean this up the formatting of this macro though.

do {} while (0) is C standard, ({}) is not.

> > > +				"reg field alloc failed.\n");		    \
> > >  	} while (0)

-- 
With Best Regards,
Andy Shevchenko



