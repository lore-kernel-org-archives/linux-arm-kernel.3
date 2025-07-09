Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D02C83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fTnbnfI2D0SW9Wd78YXcLrbOHt8ziweqWLL9StcYkQ=; b=N4hjw3cPfrkYyHNaM5zDen55/k
	Es8oLr+OZi7Rly19jG5s7s2L1bPdPc3eLPYCuAfggnEmzaj2JhrrLrmApxg4yOyVzb3sPwqoKcmQA
	XF+GiTHeEn7ZpmrBw34JBX5kBOB5U9w9SKO3GYNkFurOBQikcpj4psk+x3ohr7o0abVni/4SxAdPV
	52TqlQyLcCmo01iMaqlb+eXun+Y8sKXw02Q39upkmigtI03pLl+Sidew6ygdrQoxnpDSaTPIRE1rP
	g6s3mAJX2hAUN9c1wszZfMZnP75V/vDNRnk1HNo/tyaXTIPrFhA0fTT++LSMXKHHqMWBN2kmvBvYI
	oHbD9ALA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5T-00000009cP0-0VA6;
	Wed, 09 Jul 2025 19:04:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWQC-000000096kp-2m2W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5fTnbnfI2D0SW9Wd78YXcLrbOHt8ziweqWLL9StcYkQ=; b=FAWPm5uy6nPc15hpxU3RR511Jg
	Tc8DelvKLdVlYFxHWtnEt/iAWsIh+jdVvO1PmXKMvvJ8CeE+UqxXKz9HctVZkPkvV7IDZMKkqOLZS
	dtwVH/SZHK7vsK7b1bZSPVjbf3ArK81Px1Jns8WQv17ZTkbeId18fpJmmHcOpVK1y0vQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZWQ9-000xH4-4l; Wed, 09 Jul 2025 17:09:17 +0200
Date: Wed, 9 Jul 2025 17:09:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
Message-ID: <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112658.1987608-5-ioana.ciornei@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_080920_697050_AAC5FDA3 
X-CRM114-Status: GOOD (  21.52  )
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

On Wed, Jul 09, 2025 at 02:26:53PM +0300, Ioana Ciornei wrote:
> There are GPIO controllers such as the one present in the LX2160ARDB
> QIXIS CPLD which are single register fixed-direction. This cannot be
> modeled using the gpio-regmap as-is since there is no way to
> present the true direction of a GPIO line.
> 
> In order to make this use case possible, add a new callback to the
> gpio_config structure - .get_direction() - which can be used by user
> drivers to provide the fixed direction per GPIO line.
> 
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 17 ++++++++++++++++-
>  include/linux/gpio/regmap.h |  3 +++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 87c4225784cf..dac2acb26655 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -32,6 +32,8 @@ struct gpio_regmap {
>  	unsigned int reg_dir_in_base;
>  	unsigned int reg_dir_out_base;
>  
> +	int (*get_direction)(struct gpio_regmap *gpio, unsigned int offset);
> +

This is not my area, so i will deffer to the GPIO
Maintainers. However, it is not clear to me what get_direction()
should return. Is it the current direction, or the supported
directions? Maybe it should be called get_fixed_direction()?

I then wounder how it will be implemented. Since it is fixed, it is
probably just a constant bitmap, and you look at the offset bit in
this batmap? At minimum a ready made helper could be provided, or
rather than have this op, just provide the bitmap, and gpio-regmap.c
can look at the bit in the bitmap?

	Andrew

