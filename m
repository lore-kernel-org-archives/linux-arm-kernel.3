Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11EDCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCMFGSHPN1P9CMT/IyRTo+NVM2s+JIb76/UoGvaxvr0=; b=uz6gr68RFEjrGmY19vX22+GJX8
	eI5nroZXvM6YNeCeC+Nwvkdw8kuI/DVyPjePBFQNCHungiKejI60avonkaJnSYQFWZpSyhwGUXK7J
	Rfb5Gfh6H/JzqsFTtgP0dkG1E//N+8P3Q3UFbmmYtF6cOgrKONQsqjg3OUrWmxOavFx84Yk54+voS
	2DkNnaQwgA1VVOMjxwDMGBvz37bQTIe15t5DMi+HmZ8OhoDodd205CSOWvyOJUpizrdvC5Nw6n8h1
	V/UFEVYxNQ8PsbQP5zcja3Xffcd9Tav5i/wBZVmKaHlRugzzwh+43QOR7DQTkAz0rGiNMFS5+kpUV
	DxtfIVuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjbY-0000000GI1A-2ICF;
	Tue, 12 May 2026 09:40:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjbV-0000000GI0S-3xm4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F8ED60055;
	Tue, 12 May 2026 09:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2D3C2BCF5;
	Tue, 12 May 2026 09:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778578839;
	bh=MQw7xk7AK7vUUFTxVKsaMlXHU3CigVS/H91vrn522b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UD4r/Q8SkhsDvHSeevTzvHmw6vz0Z+dZ58YkwWZkda6Ul7/l5f/CCzmlRP0IomKA5
	 aynp0zH103Kmr4Eixzpci+QzROxprbZXnvAw0q4d0E7PC5QHBqpo0cU9PttPlRhM2o
	 Bdw0s7lt2PrsE/IHKalO15/J1qYM4kTagd1v6cpiQ0mKs7DaCXmN0MRyaLV1YrKq8+
	 RJUw/11YbCCJnOd2h1H2WCehjtJquNzS9aYRZboEYm25V81Ez7OhUt59g/Z2oSEvmv
	 vOi0ZyWhaAd7tY1WjTQJ4L1LIQsKnm2wiBFX87ptwvUgcm1pwEg7kA05doboaeXvDK
	 fJfUQXv/NTBTA==
Date: Tue, 12 May 2026 10:40:32 +0100
From: Simon Horman <horms@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Netdev <netdev@vger.kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	"David S . Miller" <davem@davemloft.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Felipe Balbi <balbi@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kevin Hilman <khilman@baylibre.com>, krzk+dt@kernel.org,
	Linus Walleij <linusw@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/3] [v5 net-next] p54spi: convert to devicetree
Message-ID: <20260512094032.GI27589@horms.kernel.org>
References: <20260507212451.3333185-3-arnd@kernel.org>
 <20260511161243.49098-3-horms@kernel.org>
 <edc4d6d6-7a43-442e-adb5-148e37402924@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc4d6d6-7a43-442e-adb5-148e37402924@app.fastmail.com>
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

On Mon, May 11, 2026 at 09:45:18PM +0200, Arnd Bergmann wrote:
> On Mon, May 11, 2026, at 18:12, Simon Horman wrote:
> >
> > Simon says: As a pre-existing issue I don't think we need to be concerned
> >             about this in the scope of this patch-set. But it may
> > 	    be a potential for follow-up.
> >
> > This problem wasn't introduced by this patch, but I noticed a pre-existing
> > issue in the context here. Does the p54spi_spi_read() function perform an SPI
> > transfer using a stack-allocated buffer?
> >
> > Looking at p54spi_spi_read(), the addr variable is allocated on the stack and
> > passed as a transfer buffer to spi_sync(). The SPI framework maps transfer
> > buffers for DMA. Passing a stack-allocated buffer is illegal, particularly with
> > CONFIG_VMAP_STACK enabled, because stack memory resides in vmalloc space and
> > cannot be safely DMA-mapped.
> >
> > Could this cause memory corruption or a kernel panic during the transfer?
> 
> I already commented on this earlier: This is indeed a theoretical
> bug, but it works in practice because DMA-capable SPI controllers
> tend to all use MMIO for short transfers instead of DMA.
> 
> SPI is very fragile this way, and I do have some patches to improve
> that overall, but it seems out of scope for this one driver.

Thanks, I agree this is out of scope.

> >> -
> >> -	gpio_direction_output(p54spi_gpio_power, 0);
> >> -	gpio_direction_input(p54spi_gpio_irq);
> >> -
> >> -	ret = request_irq(gpio_to_irq(p54spi_gpio_irq),
> >> -			  p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi",
> >> -			  priv->spi);
> >> +	ret = request_irq(spi->irq, p54spi_interrupt, IRQF_NO_AUTOEN, "p54spi", priv->spi);
> >
> > Simon says: This one seems more concerning in the context of this patch-set.
> >
> > Is there missing validation for spi->irq before calling request_irq()?
> >
> > If the device tree node lacks an interrupts property, the SPI core may set
> > spi->irq to 0 or a negative error code.
> >
> > Passing this directly to request_irq() without validation can successfully
> > hijack a core system interrupt like the system timer on some architectures,
> > leading to system instability or deadlocks.
> >
> > Should there be a check like if (spi->irq <= 0) to fail the probe gracefully?
> 
> I also commented on this: request_irq() already fails gracefully
> with -EINVAL when presented with an invalid IRQ. IRQ 0 is guaranteed
> to be invalid on any target that uses devicetree.

Thanks, and sorry for not seeing your earlier comment.
Or realising it is a false positive.

