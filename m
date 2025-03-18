Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFEEC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/RzstvQ9BWwLvvMkrQEWveUn5iG+OyCk6DBs4Rad9Y=; b=DL2v2hHdM2tmSQxh/PfT7ShETp
	MKpM6+W7Kpk1he2MeimJT0EllXsX3UclCVZKE0NEdhZObO72LGQrZ8bfydYkg7lQz8HwS+RHFi7EY
	+W8czW5XvuMGd9Pqr6jQAxpgyspedCn8TPzbJmkJxDs/a5QPh3c9G2RGzmVyALgdUouX795Mp56An
	Q83zMkdGfGxRSG17ToOMoOEKJ7+HY+j9FgAW6U5VAVreKT3fsazS280XiXlzjckbhtnAN6VrsXonU
	me2hgFETfJ5VlceJk5DDnZYGxmulOF+OFcBzkhXtsoKgPRqE9CgfndhyyJZa2FNJXJ3OPaYykcEzh
	3tNA/jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXMN-0000000656v-2lUN;
	Tue, 18 Mar 2025 13:51:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXFm-000000063rw-3sfp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8/RzstvQ9BWwLvvMkrQEWveUn5iG+OyCk6DBs4Rad9Y=; b=TIykPaMSpNNvt2P5/a+iJhCdkH
	ZDU27yEMxC6rC9OBHfa9CLX+uTPrfzKx89lqkaTMu80DUdw+cgNe/cB87UYF5GoGvpaKYXa51093A
	Pv6f1eCCR9DEwQr3pZC1oPxCHdW0uc5m3ke99tB6mi7Q9b2N0Zt2MkC/rl1UySGgT60Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuXFE-006GSZ-5r; Tue, 18 Mar 2025 14:44:36 +0100
Date: Tue, 18 Mar 2025 14:44:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [net-next 4/4] net:
 ftgmac100: add RGMII delay for AST2600
Message-ID: <1a2dab82-ddb1-4c38-a576-abd1edd8d5e1@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-5-jacky_chou@aspeedtech.com>
 <dc7296b2-e7aa-4cc3-9aa7-44e97ec50fc3@lunn.ch>
 <SEYPR06MB513471FBFDEAFAA3308000699DDE2@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB513471FBFDEAFAA3308000699DDE2@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_064510_962177_FFE57DF6 
X-CRM114-Status: GOOD (  23.29  )
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

On Tue, Mar 18, 2025 at 10:46:58AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> Thank you for your reply.
> 
> > > +	u32 rgmii_tx_delay, rgmii_rx_delay;
> > > +	u32 dly_reg, tx_dly_mask, rx_dly_mask;
> > > +	int tx, rx;
> > > +
> > > +	netdev = platform_get_drvdata(pdev);
> > > +	priv = netdev_priv(netdev);
> > > +
> > > +	tx = of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay);
> > > +	rx = of_property_read_u32(np, "rx-internal-delay-ps",
> > > +&rgmii_rx_delay);
> > 
> > > +	if (!tx) {
> > 
> > The documentation for of_property_read_u32() says:
> > 
> >  * Return: 0 on success, -EINVAL if the property does not exist,
> >  * -ENODATA if property does not have a value, and -EOVERFLOW if the
> >  * property data isn't large enough.
> > 
> > You need to handle EINVAL different to the other errors, which are real errors
> > and should fail the probe.
> > 
> > The commit message, and probably the binding needs to document what
> > happens when the properties are not in the DT blob. This needs to be part of
> > the bigger picture of how you are going to sort out the mess with existing .dts
> > files listing 'rgmii' when in fact they should be 'rgmii-id'.
> 
> Why can't the MAC add internal delay to RGMII? Is it necessary to add on PHY side?

The MAC could, but that is not the point. You need to explain how you
are going to solve the mess you have in DT, why all aspeed boards have
the wrong phy-mode. You need to fix that, and i will continue to NACK
new boards until the correct rgmii-id value can be used to indicate
there do not have extra long clock lines on the PCB.

> > > +		/* Use tx-internal-delay-ps as index to configure tx delay
> > > +		 * into scu register.
> > > +		 */
> > > +		if (rgmii_tx_delay > 64)
> > > +			dev_warn(&pdev->dev, "Get invalid tx delay value");
> > 
> > Return EINVAL and fail the probe.
> 
> Agreed.
> I just show warning here, because sometimes the RGMII delay value will configure at bootloader.

That is a different issue. If there is a value in DT, it must be
valid, fail the probe otherwise.

	Andrew

