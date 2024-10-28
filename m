Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30278D339A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdOU4coDgP08ETzmQ6TrRirADJ9U/DUQX3kgQYM7trA=; b=XAG/E3Neblf6W5NvCojpAvaDNq
	1tyuwDLn9qq821BU0cQebt7KeF+e7kOkHiSa6VpjAQS0aXYcLILlDobuAo9gH/Wc6cdOAcxJRxc1a
	zxHipX88bX0/nh5KXfeNBJRsGqe8uIfqCsoLBtaMBzfmroPhhKyVHrqrQGP+qFv61+MsSNIR0bW2U
	Kxu0P2M95fc78z5brJPdPC/YEbnq2IjZA3CZDSyzcMpitaiyNUg2O7NWyZvyaFDJrvvNBSdRI9OIu
	C6IJIERZ3kKTBFo7R4diNO87lxYvtVkUDuFnVqBQmanJVA9TYqzw9MhNHLqllPrH+Ldasow8aIcxv
	+C4P339A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sv4-0000000BZK5-0qmh;
	Mon, 28 Oct 2024 16:48:42 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sk9-0000000BVl0-1MLk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:37:27 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id DFFE24C7D9;
	Mon, 28 Oct 2024 16:37:21 +0000 (UTC)
Date: Mon, 28 Oct 2024 12:37:14 -0400
From: Aren Moynihan <aren@peacevolution.org>
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
Subject: Re: [PATCH v3 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <ggpxs4mlkobdkvqxbzroeogqe2kxlixne7ly4njb5ynnszvvkv@3gusj5w53bbj>
References: <20241028142000.1058149-1-aren@peacevolution.org>
 <20241028142000.1058149-4-aren@peacevolution.org>
 <Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1730133443;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=gdOU4coDgP08ETzmQ6TrRirADJ9U/DUQX3kgQYM7trA=;
	b=kFVcCIcJo6Ek5A4d6Q2vJUHdv6X6HwVgUIczq4fGAc+pf54dMUmDlrVQ6Eke3XInhVXd7E
	PVtfa3b4ITCZ9SQQ/Y/6Os+XfjHE4beWqBE1BJrzfxNZHraO2ZgAak/YNnz/C9L2F1F+ij
	uXKcRDiF/zD1BEXb+ZEbsKob8TH3ZTA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_093725_539819_D7CEB519 
X-CRM114-Status: GOOD (  25.20  )
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

On Mon, Oct 28, 2024 at 04:38:37PM +0200, Andy Shevchenko wrote:
> On Mon, Oct 28, 2024 at 10:19:57AM -0400, Aren Moynihan wrote:
> > The vdd and leda supplies must be powered on for the chip to function
> > and can be powered off during system suspend.
> > 
> > Co-developed-by: Ondrej Jirman <megi@xff.cz>
> 
> Missing SoB. Please, read Submitting Patches documentation for understanding
> what has to be done here.
> 
> > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> 
> ...
> 
> > Notes:
> >     I'm not sure what the proper way to handle attribution for this patch
> >     is. It was origionally based on a patch by Ondrej Jirman[1], but I have
> >     rewritten a large portion if it. I have included a Co-developed-by tag
> >     to indicate this, but haven't sent him this patch, so I'm not sure what
> >     to do about a Signed-off-by.
> 
> Ah, seems you already aware of this issue. So, either drop Co-developed-by
> (and if you wish you may give a credit in a free form inside commit message)
> or make sure you get his SoB tag.

Alright, thanks for clarifying that.

> >  	mutex_init(&data->lock);
> 
> Somewhere (in the previous patch?) you want to switch to devm_mutex_init().

Good catch, it looks like that was being leaked before this refactor.
Yeah that sounds like the right place, I'll include it in v4.

> > +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> > +				      data->supplies);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");
> 
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "regulator enable failed\n");
> 
> > +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				     "failed to register regulator cleanup\n");
> 
> With
> 
> 	struct devuce *dev = &client->dev;
> 
> at the top of the function makes these and more lines neater.
> 
[snip]
> 
> While changing to RCT order here, it seems you have inconsistent approach
> elsewhere (in your own patches!). Please, be consistent with chosen style.

Sounds easy enough to fix, I'll include these in v4.

Thanks taking the time to review
 - Aren

