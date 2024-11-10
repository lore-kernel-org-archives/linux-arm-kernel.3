Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C6D12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 18:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzu+fFQ9R2PNTPL2rGE7HX35eqiZ6et7aOyn84A4GMI=; b=yMwh5lSICiufoLLRv854uF+07+
	Jlp+3I4Z6ecAozZreECAjKEdU9CCol6C8kMAOJ5zB+vWArqMcJ/9IpagC4iFbM7Zs/oSkvdzr9UPv
	eg0dy+szt4mRYlUq3mBN8daR0rNkL69Ya40VU+TkbgSdCSlkXh6kiBteUYv4lRAnRsORdhVAr3QaW
	oSS0v/1OSz5ab4K3jjTRs/ijW8Fm6icCTIdipwDcFEtCCs+ckz6YntEwTcuTiTmfoo6Fb3T7/XCyG
	dq6gOx7qwJgfAwF/RrtgKAfjoiLu5+gPgtJkqce1namc4ockghfTB6wiBzWj3qt52DNPHa+vH37zU
	J7j1cFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAD6w-0000000FPPL-192h;
	Sun, 10 Nov 2024 18:56:34 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAD59-0000000FPFm-2J5S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 18:54:45 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 60E3A4C82C;
	Sun, 10 Nov 2024 18:54:41 +0000 (UTC)
Date: Sun, 10 Nov 2024 13:54:39 -0500
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
Subject: Re: [PATCH v4 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <5t7wdgzq37oiu4knc7o7kkx26k35ueu73r5m7aky747em5faqw@e5scnj6ng5pq>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-9-aren@peacevolution.org>
 <ZyiHXl0mRIvM4Qa0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiHXl0mRIvM4Qa0@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731264882;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=nzu+fFQ9R2PNTPL2rGE7HX35eqiZ6et7aOyn84A4GMI=;
	b=Eo8NXdmwWsEbOWsTdYpDI6QhJyazSLcdZWHHMOYyDmM6zdPoBbWR23Uk2K1d24I6iIhpU4
	j3LIbq8fC9P8c6D6EO7oOwLADrxCSjgNQCgomPhZCoc3QbeckTar8AbRHjcyghOKyy7iKV
	xH0MbmEgsn8QbhU95YITmrqi19tfVL8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_105443_685053_212E6EDA 
X-CRM114-Status: GOOD (  16.67  )
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

On Mon, Nov 04, 2024 at 10:35:42AM +0200, Andy Shevchenko wrote:
> On Sat, Nov 02, 2024 at 03:50:39PM -0400, Aren Moynihan wrote:
> > The vdd and leda supplies must be powered on for the chip to function
> > and can be powered off during system suspend.
> > 
> > This was originally based on a patch by Ondrej Jirman[1], but has been
> > rewritten since.
> > 
> > 1: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82
> 
> Make it a Link tag...
> 
> > 
> 
> ...here
> 
> Link: https://codeberg.org/megi/linux/commit/a933aff8b7a0e6e3c9cf1d832dcba07022bbfa82 [1]

Makes sense

> > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> 
> ...
> 
> > +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> > +				      data->supplies);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");
> 
> With previously introduced temporary 'dev' variable these become:
> 
> 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->supplies), data->supplies);
> 	if (ret)
> 		return dev_err_probe(dev, ret, "get regulators failed\n");
> 
> ...
> 
> > +	ret = stk3310_regulators_enable(data);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "regulator enable failed\n");
> > +
> > +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "failed to register regulator cleanup\n");
> 
> So do these...
> 

Cleaning all of these up

> > +	ret = regulator_bulk_disable(ARRAY_SIZE(data->supplies), data->supplies);
> 
> Is array_size.h included?

It's not, it looks like it came one of the headers that's already
included. I'll add it explicitly.

Thanks
 - Aren

