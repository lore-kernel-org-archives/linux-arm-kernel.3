Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA6ED12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DL2Fl3LKukV+Qyotv88zHkcHQGogxHcynlsAbu1jEk=; b=4wRY2NUDGE6VPzOVT6AbU8IK0Q
	xIvYsMl58GJilOPhTdwvzy+7YhBObwIy77hfDHPbbmc+rH36AJwdQlT1jtitSjyxvUEMNOLA2VjB7
	TH9U7pBewJ2kIxiTfpztt31YfTQHdrbXQZiYOZuJAXrBlMsbl0kIgELXSoB+PWmuVNSo2mu2zIR2w
	JXf01SRnUZ75jLxoECGywEWlfrrPipN9n/78O3s4m2nzNxe7Wn22woo3ZKeiy9bmD7iT5k3ExjgqN
	RaaDe7xTl5IZYAvFYO1Dwd4RUF7kGHU3I98gL4ZG6XmQErIk6RXy/QdKTc3LhkWHP3XR0O4f1EDPG
	OdqTH0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tADza-0000000FUQp-2dpM;
	Sun, 10 Nov 2024 19:53:02 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tADxo-0000000FUAC-3IsE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 19:51:14 +0000
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 1eef05fe-9f9d-11ef-9aff-005056bd6ce9;
	Sun, 10 Nov 2024 21:51:07 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 10 Nov 2024 21:51:04 +0200
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
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <ZzEOqC9dAHCRX5a9@surfacebook.localdomain>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
 <mlvzaskgxqjfu6yiib2u7m3pczsifsluc4mqnzy6w3xzxblvm6@xrxvvruzftn2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mlvzaskgxqjfu6yiib2u7m3pczsifsluc4mqnzy6w3xzxblvm6@xrxvvruzftn2>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_115113_005394_FB4F9B59 
X-CRM114-Status: GOOD (  13.91  )
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

Sun, Nov 10, 2024 at 01:38:39PM -0500, Aren kirjoitti:
> On Mon, Nov 04, 2024 at 10:32:08AM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 02, 2024 at 03:50:37PM -0400, Aren Moynihan wrote:

...

> > > +	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
> > 
> > Why not simply 'dev' as in below call?
> 
> I was trying to avoid refactoring the entire function to replace
> &client->dev with dev, I'll add a patch for that to the next revision.

I'm not talking about refactoring, I'm talking only about the lines that you
have touched / added.

> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to register cleanup function\n");

-- 
With Best Regards,
Andy Shevchenko



