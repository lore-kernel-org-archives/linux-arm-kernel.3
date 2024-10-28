Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B475D5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6VHi9LZFK4zXCefo38sWE3uouLH3hNuY5lZ5SerTS4=; b=4MW9sAsuNWqusAumoHQKfTcz2w
	ekVikswKjuFizgS8SBIcZf7DsBQt51xznua9h3gLbSigUXbO9jw2u3YR1vfCbPocWA/fFTRw3J+iZ
	7iozSE9QjGwaPqmX6NW8rUc3cDoPLQTK9+AUyIK08L0tYpqHg2Xw9VJ0gPgZgL73lfxuBELjmG1qJ
	zkzaeNJLyrkJxos3AoZ2dFL4cmHd+Bs4RlmpRgI56aeS4C0R5qNVZY3uxFmLLoVHbGcVW1j+hmPJa
	zo8qLQtSPzGF1SXzY/hc5Sa1E+N4bDnvmDBQtpXc8Xq+JJMdHYlSQD8rgi8mOYro9HlsXEoEthF4U
	p+i5SyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5X2F-0000000CIc6-39HR;
	Mon, 28 Oct 2024 21:12:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WVq-0000000CDCa-0YD7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61FCD5C593F;
	Mon, 28 Oct 2024 20:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99932C4CEC3;
	Mon, 28 Oct 2024 20:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147930;
	bh=m3PZAoWfta+ZnN37Ke0OPKpW1qTjsH1pXd/rg1xGge8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oMIV7ouoNxO1A4ULnqqb+zD3y3ho0clS8GBIBs9qHMH/dskaNgIq+bZz1RhmTW+DE
	 SdERiwUKLf/JmJS73kqRx3/PkieSIliCACITTT85+ZwQcUoI1m4mnZR2cD4eGCc3O5
	 DnKK7yMH+cuPax9jnFOtaF0Loz/0flFGLZJWwepSNIQAT8Cg7Kmr4liSyVojS5UznI
	 3JHumZdHCyFHX/xpTUN6XW06BesrhaH7FMdfjfSl3K4hMRUump6ly9ZSFMU54gRSiV
	 HJO6jwiYGeUjG9em0maWV5mqGxa0K2xPhFnz5ulbFyTuX2kLo1eg1TnyrnoTAmZnnb
	 wz3rU2IKfHlCA==
Date: Mon, 28 Oct 2024 20:38:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Aren Moynihan <aren@peacevolution.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Kaustabh Chakraborty <kauschluss@disroot.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, Ondrej Jirman
 <megi@xff.cz>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Dragan
 Simic <dsimic@manjaro.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] iio: light: stk3310: Implement vdd and leda
 supplies
Message-ID: <20241028203839.65debe2b@jic23-huawei>
In-Reply-To: <ggpxs4mlkobdkvqxbzroeogqe2kxlixne7ly4njb5ynnszvvkv@3gusj5w53bbj>
References: <20241028142000.1058149-1-aren@peacevolution.org>
	<20241028142000.1058149-4-aren@peacevolution.org>
	<Zx-h7QUnCKwtu8iC@smile.fi.intel.com>
	<ggpxs4mlkobdkvqxbzroeogqe2kxlixne7ly4njb5ynnszvvkv@3gusj5w53bbj>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_133854_294712_F58F268F 
X-CRM114-Status: GOOD (  30.38  )
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

On Mon, 28 Oct 2024 12:37:14 -0400
Aren Moynihan <aren@peacevolution.org> wrote:

> On Mon, Oct 28, 2024 at 04:38:37PM +0200, Andy Shevchenko wrote:
> > On Mon, Oct 28, 2024 at 10:19:57AM -0400, Aren Moynihan wrote:  
> > > The vdd and leda supplies must be powered on for the chip to function
> > > and can be powered off during system suspend.
> > > 
> > > Co-developed-by: Ondrej Jirman <megi@xff.cz>  
> > 
> > Missing SoB. Please, read Submitting Patches documentation for understanding
> > what has to be done here.
> >   
> > > Signed-off-by: Aren Moynihan <aren@peacevolution.org>  
> > 
> > ...
> >   
> > > Notes:
> > >     I'm not sure what the proper way to handle attribution for this patch
> > >     is. It was origionally based on a patch by Ondrej Jirman[1], but I have
> > >     rewritten a large portion if it. I have included a Co-developed-by tag
> > >     to indicate this, but haven't sent him this patch, so I'm not sure what
> > >     to do about a Signed-off-by.  
> > 
> > Ah, seems you already aware of this issue. So, either drop Co-developed-by
> > (and if you wish you may give a credit in a free form inside commit message)
> > or make sure you get his SoB tag.  
> 
> Alright, thanks for clarifying that.
> 
> > >  	mutex_init(&data->lock);  
> > 
> > Somewhere (in the previous patch?) you want to switch to devm_mutex_init().  
> 
> Good catch, it looks like that was being leaked before this refactor.
> Yeah that sounds like the right place, I'll include it in v4.
Not really on the leaking.  Take a look at the cleanup for devm_mutex_init().
It's debug only and not all that useful in most cases.

However, it is good to not assume that now we have a devm_mutex_init()
available that is easy to use.

> 
> > > +	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(data->supplies),
> > > +				      data->supplies);
> > > +	if (ret)
> > > +		return dev_err_probe(&client->dev, ret, "get regulators failed\n");  
> >   
> > > +		return dev_err_probe(&client->dev, ret,
> > > +				     "regulator enable failed\n");  
> >   
> > > +	ret = devm_add_action_or_reset(&client->dev, stk3310_regulators_disable, data);
> > > +	if (ret)
> > > +		return dev_err_probe(&client->dev, ret,
> > > +				     "failed to register regulator cleanup\n");  
> > 
> > With
> > 
> > 	struct devuce *dev = &client->dev;
> > 
> > at the top of the function makes these and more lines neater.
> >   
> [snip]
> > 
> > While changing to RCT order here, it seems you have inconsistent approach
> > elsewhere (in your own patches!). Please, be consistent with chosen style.  
> 
> Sounds easy enough to fix, I'll include these in v4.
> 
> Thanks taking the time to review
>  - Aren


