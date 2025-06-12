Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A165C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmhS5q7Q2QFYu1FyChk3Bwu8/VP2DbtV3PA++BzP3I4=; b=HAXKCZCIFlf7utqYtCfFn0UFEy
	v2Jn3UIgFxjhOdRsiikSmu/bFDvp9B+mxwkFEbj4l4b0/1akN3vvPqXcIRG0DmqlMbKs8ygkjRTDF
	B9iPzh+GWUA+hoDIy2YoqoC4RsbWMbEEG8BKbzz62xt1fIuqR97dLQ0iC8T6ZvswacZDKZ37ptnCQ
	OvjxArzcvaoRq7+/hye+5Fn2P9t4yeEXbS3sT4TxYCBmmEOwwxcB8HvbMc6bbqC6Y60jzORViiaX0
	Kxu18h2w+7yOrTsG7vf6q7aqtqeuJtczoGEI1PsTlpCAOuFR/9fsXfQJtViuocSPpvXhjTfqsBF4v
	GPexr5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDd-0000000EwlH-2Nww;
	Fri, 13 Jun 2025 00:24:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkF5-0000000DrpW-3nXH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tmhS5q7Q2QFYu1FyChk3Bwu8/VP2DbtV3PA++BzP3I4=; b=xo4iP4o3N6RVnhnvSvbtonYi7l
	aY9nUo1fpB9Dag+WbMG+hJjUn8SuAFv0RKy1Nokmp66ac7FrWsP8frWtqn+N7oTI0N6Fz7HZbwQLt
	HhbCs0CeOFpE9TE0A6lx0aRU59UVxUnbxFgmrm7CYGRARBJLeGwCe5jzonHK758Mocr0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkF1-00FZHK-9n; Thu, 12 Jun 2025 17:53:23 +0200
Date: Thu, 12 Jun 2025 17:53:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 9/9] net: stmmac: rk: remove obsolete
 .set_*_speed() methods
Message-ID: <32ddc0ac-ca68-4926-b815-51183912c83a@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk3O-004CFx-Ir@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk3O-004CFx-Ir@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085327_941680_903D700C 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu, Jun 12, 2025 at 04:41:22PM +0100, Russell King (Oracle) wrote:
> Now that no SoC implements the .set_*_speed() methods, we can get rid
> of these methods and the now unused code in rk_set_clk_tx_rate().
> Arrange for the function to return an error when the .set_speed()
> method is not implemented.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

