Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1A3D12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 18:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qy4vL7Aa/N0uJPCViG8PBJ+nuYrVrBC0UAvzWwrOHL0=; b=HhDv0rcdm5PYQSz3UIYy5VYyhK
	q9J/T0+FUefJvlv1HBIYMZZoof9zDryNF+o3QPn1tVtcuAM735fiIvDJs3ZezEdBHdWvoRki6nzqc
	pMoSl3bNIBs202d84MELb4YubHVwtR1j25gpaKW9WfWHtMXWf5TrX7hKNHIB1Jitm+T0DDQhxSAI0
	FRQzU6B0tMjHEdp9Jg0LYjd+1kwybcJ7O+ADZgH444Q9Ux2rb5KTwVgX9Phx/2GIINabVQLPZcnLM
	Mz24iqE9PSZNw2hG9I+tBLCBGFZoAlT+qNwjTktVtXKY2SD3tUWHiPs1h/EyP6uurBKbALy2HGLSM
	He7ioh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tACrW-0000000FO0P-2eKp;
	Sun, 10 Nov 2024 18:40:38 +0000
Received: from a.peacevolution.org ([206.189.193.133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tACpi-0000000FNoS-2g6b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 18:38:48 +0000
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id 7ED404C930;
	Sun, 10 Nov 2024 18:38:42 +0000 (UTC)
Date: Sun, 10 Nov 2024 13:38:39 -0500
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
Subject: Re: [PATCH v4 2/6] iio: light: stk3310: handle all remove logic with
 devm callbacks
Message-ID: <mlvzaskgxqjfu6yiib2u7m3pczsifsluc4mqnzy6w3xzxblvm6@xrxvvruzftn2>
References: <20241102195037.3013934-3-aren@peacevolution.org>
 <20241102195037.3013934-7-aren@peacevolution.org>
 <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiGiK6bSd_d0VQ6@smile.fi.intel.com>
X-Spamd-Bar: /
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1731263923;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references;
	bh=Qy4vL7Aa/N0uJPCViG8PBJ+nuYrVrBC0UAvzWwrOHL0=;
	b=YaCXOLZ6I9KETZJhjAINjNnyvKBf5znCzqyzCvW4Gt6yAj5JjKSUvVMbRxsmAL17MFKNpI
	W+YoXyfVwq8Jnn5gFd/1msRzP8Ge43ZWspuzVa/ObWb/dmOzhX8EyBxwxa6YRKbM/cepxI
	mLCuNzWmXaiUdXgUFFEzx6RHq990McU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_103847_098473_8C13EB6E 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, Nov 04, 2024 at 10:32:08AM +0200, Andy Shevchenko wrote:
> On Sat, Nov 02, 2024 at 03:50:37PM -0400, Aren Moynihan wrote:
> > Using devm callbacks helps to make the ordering of probe / remove
> > operations easier to reason about and removes some duplicate code
> > between the probe error path and driver remove.
> 
> Where is SoB?

Oops that got lost in a rebase

> ...
> 
> > +	ret = devm_add_action_or_reset(&client->dev, stk3310_set_state_disable, data);
> 
> Why not simply 'dev' as in below call?

I was trying to avoid refactoring the entire function to replace
&client->dev with dev, I'll add a patch for that to the next revision.

> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register cleanup function\n");
> 
> ...
> 
> > -	mutex_init(&data->lock);
> > +	devm_mutex_init(&client->dev, &data->lock);
> 
> Missed error check, otherwise what's the point?
> 
> 
> Also can add a temporary variable for 'dev'.

Yup, fixing... I need to read the docs / function type more carefully
sometimes.

Thanks
 - Aren

