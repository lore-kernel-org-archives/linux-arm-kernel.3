Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4405AC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMmumDHJrQrC3ojVWsvTiwHp063FSyjVswid4qSVvjE=; b=l3IcWbjn8Dr9RX4lQttJXdZLDP
	XQAPZapb5sa5b/+FG99R8QC9mc0WY/sRJIFosoHcyfdAA0aV7t/0snnIM2TPYcu6k3SKjwew+H//k
	qbQzYERiiKjG79AdJgJUs2j/2xk94cXHz49TeeLUIyvOfS8Fj8DDh8eJszWlXcj8TWdYlHsqLha5H
	eyiFHzsPYtvmeEPSzXjhHRNvDZzM/cQPhlLBF9MN+zjPUZTZ+3IXrbv2wrxhz/koLQhicpLgNQWBs
	wruFSSGOr8xPweAcFTnHvX4E667eK0Ha3UasykGTSiyxeXjXEGmEpTDluxX2PzFjqbCFnYnDAWxC+
	4MLvth3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbRe-0000000ApCX-0pFR;
	Mon, 12 May 2025 22:16:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEaju-0000000AjI1-1wQz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mMmumDHJrQrC3ojVWsvTiwHp063FSyjVswid4qSVvjE=; b=tJ1KlA7lz0Bu6y5PGQfM0nW+ih
	Twa2ujZa8sqK/4HmiRRt1sdKHD0eZJfRSiUtwSICmlI4FCwKUjJcXi88swqHDTB0mtVYIoXkjZ3FR
	VHfAinUYi7NMz81oWJBTVU8Zn4jh2mqZl2YfniE8P07H7pPBYWg/vcjMi8xBpwBz42AI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEajr-00CNss-MG; Mon, 12 May 2025 23:31:07 +0200
Date: Mon, 12 May 2025 23:31:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 4/7] pinctrl: armada-37xx: propagate error from
 armada_37xx_gpio_get()
Message-ID: <e0abbcc5-1ebf-4864-a7e6-6cbcc139b978@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-4-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_143110_500604_A039AF99 
X-CRM114-Status: UNSURE (   8.30  )
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

On Mon, May 12, 2025 at 04:22:40PM +0200, Gabor Juhos wrote:
> The regmap_read() function can fail, so propagate its error up to
> the stack instead of silently ignoring that.
> 
> Cc: stable@vger.kernel.org
> Fixes: 5715092a458c ("pinctrl: armada-37xx: Add gpio support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

