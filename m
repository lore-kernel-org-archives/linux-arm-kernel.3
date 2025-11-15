Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DBCCEBF86
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/whuAK3kZgLzmadCmNYa4Vh8RN8Z7SP1J4SvcMcHv2Q=; b=flrXAI4QkHecIKfj1Ywn7L13Kk
	s2efdzWpnqvZ2Z78wDzXTcL+RIvq4nl0uHMm33M2bsjLMwM7iIEi2/TSKOJvh0Bk4rzc+kUrtrBLH
	yK+DRPLk+gWurNNLjn+1WUzmTC67vfLDnQoDx7+jdVZYKFThdEOGZ6rCxvMZXYtpIrMFIwhn1WsJJ
	fRvJsMOvilKMpFugi5uPgwA6xToUDYevvQ5YifwUVJTvvVoOWOrZOFLJ/9v5Yi9Sw5XGWgVQi8eKZ
	5sflo6CO6h5m5o2ix9QTJRD1TWAvW+xipDzJoH0dWzQzOeT/8hJUmtah6WQd5f/BUu/HLMUqho7cZ
	96cFi6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKO6V-0000000E87N-0EBl;
	Sat, 15 Nov 2025 21:46:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKO6S-0000000E873-0a3U
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 21:46:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/whuAK3kZgLzmadCmNYa4Vh8RN8Z7SP1J4SvcMcHv2Q=; b=BqUkofmWLA/5XsBL3zG6W2CG9A
	2w8hAJDCdvu170jvmqVCh3C7wzLAfwYwGsO7TlSjv4QZyuFKHdKFjBZt+zm705bTebsUzav8cupwK
	AUWns5itZzZxccGXPwG6PL43hFGPs/s9dw/D5mG+LY37jHakJ8jsJNv+muqE7HUbJMJw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vKO60-00E7C7-S7; Sat, 15 Nov 2025 22:46:12 +0100
Date: Sat, 15 Nov 2025 22:46:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v4 4/4] net: ftgmac100: Add RGMII delay support
 for AST2600
Message-ID: <041e23a2-67e6-4ebb-aee5-14400491f99c@lunn.ch>
References: <20251110-rgmii_delay_2600-v4-0-5cad32c766f7@aspeedtech.com>
 <20251110-rgmii_delay_2600-v4-4-5cad32c766f7@aspeedtech.com>
 <68f10ee1-d4c8-4498-88b0-90c26d606466@lunn.ch>
 <SEYPR06MB5134EBA2235B3D4BE39B19359DCCA@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <3af52caa-88a7-4b88-bd92-fd47421cc81a@lunn.ch>
 <SEYPR06MB51342977EC2246163D14BDC19DCDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB51342977EC2246163D14BDC19DCDA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_134640_176527_31DCCF25 
X-CRM114-Status: GOOD (  19.07  )
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

> Based on the above information, I have attempted to outline my understanding.
> 1. 'rgmii' + MAC delay:
> Add warming, keep MAC delay and pass "rgmii-id" to PHY driver.

Think about that. What delays do you get as a result?

> 2. 'rgmii-id' + MAC delay:
> disable MAC delay and pass "rgmii-id" to PHY driver
> 
> 3. 'rgmii-id' + no MAC delay:
> Keep disabling MAC delay and pass "rgmii-id" to PHY driver
> 
> 4. 'rgmii-txid' or 'rgmii-rxid':
> Keep original setting

> I have some idea to discuss with you.
> 1. On 'rgmii', I want to add warming and directly disable MAC delay and pass 'rgmii-id' 
> to PHY driver.

Yep.

> 
> 2. On 'rgmii-id', ignore if enabling MAC delay, all disable MAC delay and pass ' rgmii-id'
> to PHY driver.
> 
> 3. On 'rgmii-txid' or 'rgmii-rxid', keep the above item 4.
> 
> Actually, it's difficult for the driver to determine whether the MAC delay is enabled or not.
> Our design doesn't use a single bit to indicate the delay state. Instead, the delay setting is 
> derived from the user's configured delay value.

But you can turn it back to ps. I would say, if it is > 1000, the
intention is it provides the 2ns delay. If it is < 1000 it is just a
minor tuning value because of bad board design.

Do you have experience from the field, what do real boards use? Are
they all inserting the same 2ns? Or is each customer tuning their
bootloader to configure the hardware differently per board design?

You might even need a more complex solution. If the bootloader is
adding a delay between say 200ps and 1600ps, it suggests a poorly
designed board, and the PHY adding 2ns is not going to work. There is
a need for rx-internal-delay-ps or tx-internal-delay-ps in DT. You can
give a warning, and indicate what values are needed, but leave the
hardware alone. If the bootloader is setting the delay > 1600, passing
_RGMII_ID to the PHY, and disabling MAC delays is likely to work, so
you just need to warn about phy-mode being wrong. If the bootloader is
inserting < 200ps, and phy-mode is rgmii-id, that is just fine
tuning. Maybe suggest rx-internal-delay-ps or tx-internal-delay-ps be
added in DT, but leave it alone.

Whatever you do, you need a lot of comments in the code and the commit
message to help developers understand why they are seeing warnings and
what they need to do.

	Andrew

