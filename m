Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2C9C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSDpv1cK4ROYQ8y4HkuXiu+aWSa+g6zObCto20zUYas=; b=qaqeA3V5gBYM5q22H03Ub9zhzl
	hqdpBeEuAL6rvHeEK2KGY3VM/aJplz1opUW2c7QWkM/LOU4iosKW55PVKVOWOEqJzDb3xMtmBdxWz
	3F5k2pwOQPLJxWxi20OmurdPYJiBm1OU8W7Nn+xfd4dJLn/6xP+vj4VrxPjmgLBlQKLoF4fXL/b3l
	DYXozHrXBttrny6A121EAMGoreh+/DuyWyQNX2Ngg9I18rWW38CBjRQ/VA+wnbDXO9/WHaPqMhbXT
	QadEEProPCd+MnNHl30hSJWv3sqOMzAHnGBviVar9HQcnKdOqZD8RHRy+gWnAPoJGsvYwdIFKp996
	0KxzTGnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPt-000000041Eg-1fl7;
	Tue, 29 Sep 2026 16:10:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPr-000000041Dc-1j0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wSDpv1cK4ROYQ8y4HkuXiu+aWSa+g6zObCto20zUYas=; b=3+zr4eicpBhwbJf1E88FQ1yQj6
	vzpIVLyibo4vAI9bUfs/vIXeJt9eS8xMCmNB787frZMILX7i7xihJAwugT6bm6twt5NLalJ2/s+In
	0J+aCSII/4YVrHH0XV6YrpKPuqTqHQB1NhdI5RAsOPYefMf6VTfOtaaf8N/9u67B6Fow=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xBaPd-007yxK-4d; Tue, 29 Sep 2026 18:10:37 +0200
Date: Tue, 29 Sep 2026 18:10:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
Message-ID: <93870bce-b18e-4eed-a9ca-1d01313c61a7@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <9cc61625-47c9-4bdf-97f0-0528f661a399@lunn.ch>
 <1j7bkb9h5k.fsf@starbuckisacylon.baylibre.com>
 <5fae3b42-552a-458a-9710-927360e58c37@lunn.ch>
 <1jv77u8yak.fsf@starbuckisacylon.baylibre.com>
 <491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch>
 <1jse2x91oh.fsf@starbuckisacylon.baylibre.com>
 <b41e7fe4-2ec8-428e-81ff-47e1c75003b1@lunn.ch>
 <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jecec3xnd.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_091051_452233_9B54B22D 
X-CRM114-Status: GOOD (  16.72  )
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

> Thanks for the heads up. So if I'm reading the doc correctly the PHY
> adds 2ns
>  * on RX if there a 4.7k pull-up on RXD0
>  * on TX if there a 4.7k pull-up on RXD1
> 
> The schematics for the board are available here [1]
> 
> * 4.7k pull-up on RXD0: so we should have 2ns Rx from the PHY
> * 4.7k pull-down on RXD1: no idea what this does. Presumably no delay ?
> 
> I've cross-checked the HW, the resistors are actually fitted as the
> schematic says they are.
> 
> With the HW setup, the MAC setup that works for me remains
> 
> 	tx-internal-delay-ps = <1620>;
> 	rx-internal-delay-ps = <1800>;

These values suggests there are delays on both Rx an Tx.

> 
> I know it is not aligned with what it expected but still.

I'm flexible, if in the end this is what is required, that is fine. It
will need a comment explaining why it is needed, why the guidelines
are not being followed.

Where i have real problems is with developers who don't respect what
the guidelines say, even when their hardware could do what is
asked. They just do the minimum to make it work, and call it done.

The comment is then important, because i don't want developers using
this as an excuse not to do the correct thing.

     Andrew

