Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C54CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 03:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fs6pzcFRfuk1HEj3n7YIn4AqvWgvz9+8/2xjZTxmZoY=; b=dgJNel8rEXEKInkqNTdl8TW8A5
	NKgRFaWuPsG7XmtaSUdNqyxixzd2k1pONFtzkkZa+C8PQ8CG60sCULyqFVKndTf18pmjNHfyUqVMy
	CwIalqqLy5TSRlzEd3pGLKaGKcpxmthu3MXEYw4CTWBekF14zfRq2qQ+IQgiFTp0x+e0+c1T+gTx7
	4Wnu2OHDV4oezEk0RfYqpCtFd56XykTwW26Dx6pMT8CEKzEBEmKe/HsDBSihH6TUXW3aDCEO003DE
	NQlyru94nqK2hymlq75y6RbUzmspXbaOeHdgSAnSIX3lzu/ZIrXw/HpiEpX4CauPDprUjU9SLFl3t
	WQGF/tMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqkKW-0000000ARaJ-0KzT;
	Tue, 26 Aug 2025 03:26:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqkCW-0000000AQqH-0Z4A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 03:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Fs6pzcFRfuk1HEj3n7YIn4AqvWgvz9+8/2xjZTxmZoY=; b=WEgzZL61kJnw32A5oSkohRl/ER
	OgcFmeG2v/j2w/acUPDqQIctI4nkAWMcJoaGoJTN+DRFJNCd1VLKq9Ks/CLfkD4PsZUuYsGQPNNfJ
	W1JLMEPpQ1EkC2fJRJnXSKTOjdJEA7RBEVkpZ4fhsGFbBUTgWUlYnExfEz/fOtY6EbjY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uqkC1-0061wJ-02; Tue, 26 Aug 2025 05:17:53 +0200
Date: Tue, 26 Aug 2025 05:17:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [net-next v2 0/4] Add AST2600 RGMII delay into ftgmac100
Message-ID: <0c3ab6ae-a013-4d22-a05d-2760c8bca7ff@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
 <a9ef3c51-fe35-4949-a041-81af59314522@lunn.ch>
 <SEYPR06MB513431EE31303E834E05704B9D33A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <3966765c-876e-4433-9c82-8d89c6910490@lunn.ch>
 <SEYPR06MB51342BAA627D12DA4DC32D6E9D39A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51342BAA627D12DA4DC32D6E9D39A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_201824_182721_B2AF6B54 
X-CRM114-Status: GOOD (  23.54  )
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

> I would like to discuss with you how we fix the RGMII of AST2600 in this thread.
> And thank you for your patience in reviewing our code.
> 
> Currently, the RGMII delay in AST2600 is configured in U-boot stage, not in Linux.
> The ftgmac driver will not use the phy-mode to configure the RGMII delay on MAC side.
> 
> I list the parts that I think need to be modified.
> 1. Change the phy-mode to "rgmii-id" in aspeed-ast2600-evb.dts.
> 2. Add the tx/rx-internal-delay-ps in dts.
> 3. Add RGMII delay configuration in ftgmac driver. If the tx/rx-internal-delay-ps has not existed,
>   according to the phy-mode to configure default value.
> 
> These are the fix items I can think of.
> Could you point out what I miss or a clear direction to correct the RGMII mode on AST2600?

We have to be careful with the assumption u-boot is configuring
delays. I've seen DT blobs which use 'rgmii-id', which suggests
something is disabling the MAC delays, maybe because they are using a
different version of u-boot, or barebox etc.

You should be able to read what the MAC is doing with delays. You can
compare this with what the phy-mode is.

* If the MAC is adding delays, and the phy-mode is rgmii-id, disable
  the MAC delays, pass rgmii-id to the PHY.

* If the MAC is adding delays, and the phy-mode is rgmii, issue a
  warning the DT blob is out of date, disable the MAC delays, and pass
  rgmii-id to the PHY.

* If the MAC is not adding delays, and the phy-mode is rgmii-id, pass
  rmgii-id to the PHY.

* If the MAC is not adding delays, and the phy-mode is rgmii, that
  suggests the PCB has extra long clock lines, and the board is using
  a U-boot which has been modified to not enable MAC delays. Pass
  rgmii to the PHY.

I would also suggest you review all DT blobs in mainline and see if
any are using rgmii-rxid or rgmii-txid. If not, i would go with KISS
and return -EINVAL for these, with a comment. Support for these can be
added when somebody actually needs them.

Most boards today will be the second bullet point. With time, they can
transition to the first. New boards should hopefully be directly the
first bullet point.

Backwards compatibility is however an issue. Anybody with a new DT
blob won't have working Ethernet with an old kernel if they are using
the first bullet point. So we should not edit every DT blob in
mainline and change rgmii to rgmii-id. We want to leave it to the
board owner to decide it is time to make the warning go away.

tx/rx-internal-delay-ps are optional. I would not add them yet,
because it makes the logic more complex. As far as i understand, no
board has required them so far, so there does not appear to be a need
for them.

You need good commit messages with these changes. Make it clear there
could be backwards compatibility issues, but that is the cost of
fixing up a broken implementation.

	Andrew

