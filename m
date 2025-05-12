Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554E6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 22:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xSxv/R9iGioyUUkxIlSuJoDpDl8AkHbZ/Q9eAtbTQA=; b=h9X3yjEZmGVwKsc4MYaHGF5137
	2qojK4UFlYlYJwlJvzV35XkkvyMnbot17jXBauK003i+GZwX4IlIwoYzBUfthUthIPyDu+R6U0Hk5
	qVESqcOmvcWBYgPTsY9gliSAxww0cZkpA2Y6LWKoC2so74aueCGKf+tc55yALygGF7uTfMTNOb0pV
	Vz2AFhfq555s/GB1rJPfwUQCC0uUtc1AbL6b8RlgxR677xQql9iB8aF9ZEcTGZrhkb+8JLKJpzM5U
	wF3N1doEqWAFxJN3j2rmc6My7BF8iOu4cd+ilPDwH3SK+CMyv8Ti9G+FQietERIqrLirZ74H4Ct9L
	UvC2CvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbPc-0000000Ap0t-1rAY;
	Mon, 12 May 2025 22:14:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEajT-0000000AjAz-43Wq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5xSxv/R9iGioyUUkxIlSuJoDpDl8AkHbZ/Q9eAtbTQA=; b=yR+d47NnlnHNygsqCUCBHj87uD
	EwmlJDMsrCl+Cv298HtkbrVSc/+ofncualLZwozBxmCwS+dk5r3rk9BZxI4ZF1XO0CTDypQ0lvqrZ
	LF77yoZYGANciGk9JiHRJw7nNgQqqMhKtWSEocYoha7XcGWLH6RfPVsQQJAGZsjS8NjI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uEajR-00CNs5-3n; Mon, 12 May 2025 23:30:41 +0200
Date: Mon, 12 May 2025 23:30:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH 3/7] pinctrl: armada-37xx: set GPIO output value before
 setting direction
Message-ID: <95da9408-dab6-4b69-86f2-6681db9be841@lunn.ch>
References: <20250512-pinctrl-a37xx-fixes-v1-0-d470fb1116a5@gmail.com>
 <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-pinctrl-a37xx-fixes-v1-3-d470fb1116a5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_143044_006720_AC09DBA8 
X-CRM114-Status: GOOD (  11.48  )
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

On Mon, May 12, 2025 at 04:22:39PM +0200, Gabor Juhos wrote:
> Changing the direction before updating the output value in the
> OUTPUT_VAL register may result in a glitch on the output line
> if the previous value in the OUTPUT_VAL register is different
> from the one we want to set.
> 
> In order to avoid that, update the output value before changing
> the direction.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6702abb3bf23 ("pinctrl: armada-37xx: Fix direction_output() callback behavior")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> Signed-off-by: Imre Kaloz <kaloz@openwrt.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

