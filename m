Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7D0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQDJSZlvsPxdtXrcfxhzYY3pnuTPlN7iObJIZ09ja6k=; b=AHVIOtGpDzgisYbl90U0CPSir+
	2rUP/AEDjqk0Fj0SQy3BEHbEiX9pAuVgKIgJP3GETIwPL22Ho1LBIG+/mB53OO5BGhTLaEXRDy7J+
	vruRAzsLm1eveIO0fgCqjz2zEGgbh9jREqSF2fvTh1pd6o4UryF81KTaeVcB1Dj6aF2HdBZhPoWSy
	vjDeE4A0WbKqClkIe2G24ru45SHWsMvgY2M76gY69NaLx+BmJb1tJGP69EeJttjk+Tid6tjz7td9E
	+wT29fwMvy9BcadtsoY62hDHcuUNtzutPOn0aBXqn7iudYLGG012y4Mtg4+e+3G3c/n6AgSzSN1jP
	RIp/YjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuAAJ-00000002fpl-1q9E;
	Mon, 17 Mar 2025 13:05:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA8c-00000002fTq-1C35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 13:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QQDJSZlvsPxdtXrcfxhzYY3pnuTPlN7iObJIZ09ja6k=; b=lYp3UZUYsynZHh9SB8+AUqn7QV
	AyCwpZ8gMkzuLmEHDZlx0CX1cJWd/yocolMKVYsRv55tey9MEQwUSpi36y3RIBZAPtPPkU3wUiSOx
	ef+YKgM+xnNz05PyqngL0J8pWFoe17d+g4PUZE99fHXCZppS+aSBCwmUiLyNxV/j14aY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuA8M-0068KE-SL; Mon, 17 Mar 2025 14:03:58 +0100
Date: Mon, 17 Mar 2025 14:03:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, ratbert@faraday-tech.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: Re: [net-next 4/4] net: ftgmac100: add RGMII delay for AST2600
Message-ID: <dc7296b2-e7aa-4cc3-9aa7-44e97ec50fc3@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317025922.1526937-5-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_060414_320858_6842F3F4 
X-CRM114-Status: GOOD (  10.27  )
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

> +	u32 rgmii_tx_delay, rgmii_rx_delay;
> +	u32 dly_reg, tx_dly_mask, rx_dly_mask;
> +	int tx, rx;
> +
> +	netdev = platform_get_drvdata(pdev);
> +	priv = netdev_priv(netdev);
> +
> +	tx = of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay);
> +	rx = of_property_read_u32(np, "rx-internal-delay-ps", &rgmii_rx_delay);

> +	if (!tx) {

The documentation for of_property_read_u32() says:

 * Return: 0 on success, -EINVAL if the property does not exist,
 * -ENODATA if property does not have a value, and -EOVERFLOW if the
 * property data isn't large enough.

You need to handle EINVAL different to the other errors, which are
real errors and should fail the probe.

The commit message, and probably the binding needs to document what
happens when the properties are not in the DT blob. This needs to be
part of the bigger picture of how you are going to sort out the mess
with existing .dts files listing 'rgmii' when in fact they should be
'rgmii-id'.

> +		/* Use tx-internal-delay-ps as index to configure tx delay
> +		 * into scu register.
> +		 */
> +		if (rgmii_tx_delay > 64)
> +			dev_warn(&pdev->dev, "Get invalid tx delay value");

Return EINVAL and fail the probe.

	Andrew

