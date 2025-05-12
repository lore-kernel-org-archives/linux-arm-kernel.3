Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EB0C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5XbTPT9ktX1zk54qFhJAtK3gzja6m/tnN4R9IXWUSY=; b=TLRhUNOnooIjC3rsPQ97PeS3BH
	r+AGYI9c1U9LijCJaHyTwhz3jxhJRMDHSKZTUbXMo6sq+TfZeLZDHhhncZItDy5IJFiQVrRZYQU2p
	+szasQJ8JDPo7cxUkpRmHvs9sqo84oU1HjZiJFse+Nwedw9X0dTcNA+Qi9DVhMGGaxpzYeTMi1H6A
	MKCdFxWDJIvcHuYKRrz7EnOiFWwqEOubG7CjHr8U613heWIdmArDRopUAKg8+otvVhjPCJQQhsdQ7
	tOKp9kQUjSZs5bUCbh9JIGbm7qxYvdEZdYUvVG8cQKi0pDuO7Jejh07rEf+b+UahX06v/ovFzWcvo
	C4SWiTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEb3W-0000000AmCp-1Wsx;
	Mon, 12 May 2025 21:51:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEai5-0000000Aimw-0JYJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x5XbTPT9ktX1zk54qFhJAtK3gzja6m/tnN4R9IXWUSY=; b=AJmpw6jsmkNJM33wxWXjUp3mgx
	9lCtZyKYbsGIB04QB50S1SNKwLQ6m832AoDiOWi+By6LBJaFPbm7xgbFQJdNiT8YjHZ6uNR6TZnJ0
	Z+j0fv2S1Y7A2RzRJC2lOwoqikTSnDyjvzPVw5vx/CO3hmx5x5EPezzgnla/Ck80MO4k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEai2-00CNrX-PA; Mon, 12 May 2025 23:29:14 +0200
Date: Mon, 12 May 2025 23:29:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 2/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_direction_output()
Message-ID: <8945ab39-cca2-46e5-821a-df24bb6d9218@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-2-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142917_114080_95680DB0 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 12, 2025 at 04:22:38PM +0200, Gabor Juhos wrote:
> The regmap_update_bits() function can fail, so propagate its error
> up to the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

