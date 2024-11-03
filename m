Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B04D11181
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 16:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=je3uCAcHsGiyDOgvqOvzEM2tjCfi8IWbvFmZvz9katU=; b=f5II0vuKbyVCdoWbeiiYIP+c++
	1n8np0w5RydBS1rQZ6NIv/K+OFZwMwMy8oBNNWRSrsiYxwm5Yi6qGWC2S1X7/vGVIDqQ4K/QPseXU
	I+8jhpCih7WATu6x6C8sae5vqetSs7rrllV4JWX5epdmI4ko57eSyZbiq3c6RW5z8vwiXdcreykuL
	FNfn4YekWoyXjAnJV9qdte46sU0W6wqh0jrv5uG7wdn9+UX4qSsB9Nl3FLU6PZ8sBM4+R6iLtaZ5J
	ovHaWhXv4JogkQYMMqkEE6afjgNdf5dIcFhSeymf4aDGQ4XKSiym3VCAylBnvRxA3yH5C69iCU9ed
	FDwoH/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dPM-0000000BgwE-2PPC;
	Sun, 03 Nov 2024 16:24:56 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7dNh-0000000Bgoa-2OSJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 16:23:14 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id A69264C891;
	Sun,  3 Nov 2024 16:23:10 +0000 (UTC)
Date: Sun, 3 Nov 2024 11:23:08 -0500
From: Aren <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Kaustabh Chakraborty <kauschluss@disroot.org>, =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, 
	Ondrej Jirman <megi@xff.cz>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <iyasbuxwpgqeeuaimcpnycrze3xg6u55uusfxnvy3i3k2ejy57@lbrrc7c3r4fx>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <20241103112208.233f7180@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103112208.233f7180@jic23-huawei>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730650991;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=je3uCAcHsGiyDOgvqOvzEM2tjCfi8IWbvFmZvz9katU=;
	b=WmOQ1duWnvM+PHINwEcVOHgkXZK4Gu49qiTEWLXeIMTTD/95JdSpVS0QcU3as8OuqLbPA0
	4vz3fZ7Jz7e2JgJIISbRBSCnHvGJhOECg4IO3GkWuibDZjDsncPb2JZgLwL/2Mah+Uj381
	pqrN4ROz0kl2cw9L99XRu7qgNhuCrGc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_082313_708232_76294BBA 
X-CRM114-Status: GOOD (  10.59  )
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

On Sun, Nov 03, 2024 at 11:22:08AM +0000, Jonathan Cameron wrote:
> Hi Aren,
> 
> > @@ -624,7 +640,7 @@ static int stk3310_probe(struct i2c_client *client)
> >  	device_property_read_u32(&client->dev, "proximity-near-level",
> >  				 &data->ps_near_level);
> >  
> > -	mutex_init(&data->lock);
> > +	devm_mutex_init(&client->dev, &data->lock);
> ret = devm_mutex_init()
> if (ret)
> 	return ret;
> 
> It is very unlikely to fail but technically it can.  Andy has been fixing
> this up across the kernel (including IIO) so let's not introduce another
> case that doesn't check it!

Right, I'll take this as my periodic reminder to read the docs / types
more carefully :)

> If nothing else comes up I can probably tidy that up whilst applying.

That would be great

Thanks
 - Aren

