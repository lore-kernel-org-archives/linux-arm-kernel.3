Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B3CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxZ33PuusT961rLixN2ifdvh369r1mQpzu5JayZvCM8=; b=ph5gH4nniG1D/qwjwxz7i0yb5J
	u628T6wouTryNY+U/ukaOyui72nWPU1vQz2lh4WvgVADeeiqfM1S/kfSypIK78AqAce9qBNClQuqN
	zsfyl+UQD3QdVo7zXDKuHiEa1GmEN2nVcl1AWGHiEAJTug9Fe+OXKBmo6j56aCvJyOJirCizZTeTX
	pdXhLzLj4G7hgYvDYgLnzep0OWMSvldf6CCtHrSri2M8ffm4smlXteTV59x97IyRdZ0mSHd8qfRNn
	I1DrlbqrrnGc6uQlPiVQW5UK2shZycL0NQKVFI2lLcgnx6FPONG98upPx6124HD4TZLra/H47fJKe
	vZeegaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWZT-0000000EdU8-3pVR;
	Mon, 11 May 2026 19:45:43 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWZR-0000000EdTl-2XqH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:45:43 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 6D4011300612;
	Mon, 11 May 2026 15:45:39 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Mon, 11 May 2026 15:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778528739;
	 x=1778535939; bh=KxZ33PuusT961rLixN2ifdvh369r1mQpzu5JayZvCM8=; b=
	D4z5PANbVp75yaAyqbWk8TXrVr0gxga8wuIzjhJAn/I4s82px9yxxTgj3plhNS8C
	20eCKyiL2n0yCLiKzMVsRDjz97ZANH3ZSbWryKt+ZpTxoGuzY92XCd6L+IJKOb/M
	0V1QS6L7KleXIM6f3vPP3rPWfHrNDzLPn6ocGHHkxiknoqLNCQG9pE0DPIUkMmj5
	LT4UmyY9lF6ZGbdtuWC093+nWqCIeznqeTjWNwy38ZxqG7/yzToctTHRdZV32wqo
	D12tRct0uG2yfKtr91iAy/E6IdzVGF4HI27yV3uQnl1TPd+6z8AnIu/W3NLW3kn8
	5v40edD/yWCQ+AMauLaFlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778528739; x=
	1778535939; bh=KxZ33PuusT961rLixN2ifdvh369r1mQpzu5JayZvCM8=; b=d
	lJ5/dJq6u94Ln6yeJLFGxpyMWS4jbbnDDrG9mtCg2graLDsYIYxbf1Giy15cXseT
	BdZD0L6aMIPj+mdSsOmeV/5G55uUlqSrNFSHZqDcSwAo4ey3OUnpH3kQe7qO0t99
	xwH1TCWEpkMUso4yaYoiUHtpw8MWUUHxkvgAezWWo4Mtik2E5kLpG9VoGBfBd0cs
	vYzAYLKT525QU78mHaWUM6baHfnmjQZ6nOUHNWTOdXuHc0eBmlGKPikQneSw5Aye
	PpvrXSCqcxHQ8jMgFi/g/RMv7z8w4XtKgCUohxvFncPnhtKjwRpokJ/drl3/fiOt
	UnmqWGovjPskXorK9H3oQ==
X-ME-Sender: <xms:4jECaoio-q9Hn_18suna-XMApA-5lHHUbxhhZolaW0Aa2PJm9wT5qg>
    <xme:4jECar3FEko5ciV0r8x99NHSqLrQq7B1RyOFYq9ZrejINaN5TG-r_gNwi3mPXlKTz
    iJVjCw2BWefC7WIngNE6grcHmizR-yCiQ_hEylOuNwxoTDUjVlnjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopegstg
    houhhsshhonhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepkhhhihhlmhgrnhes
    sggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfth
    drnhgvthdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgv
    rghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:4jECaq-fWu4ldeE42gFx7xpX0gT51l92nKflXvkXkKeWkMuJbPpDSA>
    <xmx:4jECaj5BEi_Xa2gk_9ctxMWOA5CaQV6l15RNRabp1EOAeBG2y8oHHA>
    <xmx:4jECaqJcOVjx5muBXjU2JNcIaUUQLkDBVLzk5tM4-Aqh-kY6Nhrw-g>
    <xmx:4jECajVQITiMaykQndkJ3I7EE_zQr88C2yi50Vcz8DgA5Yuw-Fz2Bg>
    <xmx:4zECajhIaXzc9ryCdCBEsbuNhZ66JeG0SS8KAGAV4sSG8j9QRaB__1-8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4DE381060065; Mon, 11 May 2026 15:45:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ap_j1q_rtJ4F
Date: Mon, 11 May 2026 21:45:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Simon Horman" <horms@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: Netdev <netdev@vger.kernel.org>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Eric Dumazet" <edumazet@google.com>, "Felipe Balbi" <balbi@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Kevin Hilman" <khilman@baylibre.com>, krzk+dt@kernel.org,
 "Linus Walleij" <linusw@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <edc4d6d6-7a43-442e-adb5-148e37402924@app.fastmail.com>
In-Reply-To: <20260511161243.49098-3-horms@kernel.org>
References: <20260507212451.3333185-3-arnd@kernel.org>
 <20260511161243.49098-3-horms@kernel.org>
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_124541_915406_54F58BB1 
X-CRM114-Status: GOOD (  22.00  )
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

On Mon, May 11, 2026, at 18:12, Simon Horman wrote:
>
> Simon says: As a pre-existing issue I don't think we need to be concerned
>             about this in the scope of this patch-set. But it may
> 	    be a potential for follow-up.
>
> This problem wasn't introduced by this patch, but I noticed a pre-existing
> issue in the context here. Does the p54spi_spi_read() function perform an SPI
> transfer using a stack-allocated buffer?
>
> Looking at p54spi_spi_read(), the addr variable is allocated on the stack and
> passed as a transfer buffer to spi_sync(). The SPI framework maps transfer
> buffers for DMA. Passing a stack-allocated buffer is illegal, particularly with
> CONFIG_VMAP_STACK enabled, because stack memory resides in vmalloc space and
> cannot be safely DMA-mapped.
>
> Could this cause memory corruption or a kernel panic during the transfer?

I already commented on this earlier: This is indeed a theoretical
bug, but it works in practice because DMA-capable SPI controllers
tend to all use MMIO for short transfers instead of DMA.

SPI is very fragile this way, and I do have some patches to improve
that overall, but it seems out of scope for this one driver.

>> -
>> -	gpio_direction_output(p54spi_gpio_power, 0);
>> -	gpio_direction_input(p54spi_gpio_irq);
>> -
>> -	ret = request_irq(gpio_to_irq(p54spi_gpio_irq),
>> -			  p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi",
>> -			  priv->spi);
>> +	ret = request_irq(spi->irq, p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi", priv->spi);
>
> Simon says: This one seems more concerning in the context of this patch-set.
>
> Is there missing validation for spi->irq before calling request_irq()?
>
> If the device tree node lacks an interrupts property, the SPI core may set
> spi->irq to 0 or a negative error code.
>
> Passing this directly to request_irq() without validation can successfully
> hijack a core system interrupt like the system timer on some architectures,
> leading to system instability or deadlocks.
>
> Should there be a check like if (spi->irq <= 0) to fail the probe gracefully?

I also commented on this: request_irq() already fails gracefully
with -EINVAL when presented with an invalid IRQ. IRQ 0 is guaranteed
to be invalid on any target that uses devicetree.

      Arnd

