Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CD3CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijozv1/zYB/1FW5r3iA6BSCWEsMm1mHuR8XAqmCPWx4=; b=q7z7S9Ce3LJbW8bDVc97sChbrA
	cIUASbKKZyhBlfm2wSD0lstyLQgJpu1YmkU/gysH6kJxfq2PAUPd6CVxnsl31azXM+1lOwA0bTeuV
	d7lSwLD5t0qjPnqTc1mpYPs8M53BzpHp07JkJOLjftS9hcgwkRP0fdDIrdaIV9fWYNne7QTTgVbCG
	SWc+jVwrHmDtc3C+vglMCzy6DiFLDAPkJk7Q5pzwMko3a+9rs6ywzsNN+B0uda0+b81H3OWZnPugq
	rpPmrUx7Wbl8v5XT4S7AYyUuDzZblqkTzrGOuyCK/asfS/p2vIBQtWGi3o4Hox/BEIZ1oz48cuwZp
	B3Ns05rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ7A-0000000C3dK-1len;
	Sat, 13 Jun 2026 07:49:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ77-0000000C3cM-3PBS;
	Sat, 13 Jun 2026 07:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ijozv1/zYB/1FW5r3iA6BSCWEsMm1mHuR8XAqmCPWx4=; b=IQpKBRcqQLSbefm3KDuxhfWcFc
	BgLCoBRK4g/QV7+3gQR1kTDZyHg3RUkT0NcxAdhym2ecnyz7JtlbTzqr/rVGg3fbKd4Dv5KM4aBmG
	BtIjToxReUvu8qIlJIKCuzKB8oKl7oarePJmPKIP0sco0QIbFQ1XdAbyZjytECiCpw80=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wYJ6k-007RqY-AP; Sat, 13 Jun 2026 09:48:46 +0200
Date: Sat, 13 Jun 2026 09:48:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: lizhi2@eswincomputing.com, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com,
	weishangjuan@eswincomputing.com, horms@kernel.org, lee@kernel.org
Subject: Re: [PATCH net-next v8 3/6] net: stmmac: eic7700: make RGMII delay
 properties optional
Message-ID: <30229cfe-b395-4d0f-81ef-eb780ac26599@lunn.ch>
References: <20260610012727.848-1-lizhi2@eswincomputing.com>
 <20260610012937.911-1-lizhi2@eswincomputing.com>
 <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaa645fc-be06-4a15-8c2f-6e82129c4715@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_004909_856087_DFFB12B2 
X-CRM114-Status: GOOD (  23.64  )
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

On Wed, Jun 10, 2026 at 10:26:50AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 6/10/26 03:29, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> > 
> > Make rx-internal-delay-ps and tx-internal-delay-ps optional in the
> > EIC7700 DWMAC driver.
> > 
> > The driver previously required both properties to be present and would
> > fail probe when they were missing. This restricts valid hardware
> > configurations where RGMII timing is instead provided by the PHY or
> > board design.
> > 
> > Update the driver to treat missing delay properties as zero delay,
> > allowing systems without explicit MAC-side delay tuning to operate
> > correctly.
> > 
> > This aligns the driver behavior with the updated device tree binding
> > and provides a safe default configuration when MAC-side delay
> > programming is not required.
> > 
> > Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > index 4ac979d874d6..ec99b597aeaf 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> > @@ -165,9 +165,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_RX_ADJ_DELAY;
> >  		dwc_priv->eth_clk_dly_param |=
> >  				 FIELD_PREP(EIC7700_ETH_RX_ADJ_DELAY, val);
> > -	} else {
> > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > -			"missing required property rx-internal-delay-ps\n");
> >  	}
> >  
> >  	/* Read tx-internal-delay-ps and update tx_clk delay */
> > @@ -187,9 +184,6 @@ static int eic7700_dwmac_probe(struct platform_device *pdev)
> >  		dwc_priv->eth_clk_dly_param &= ~EIC7700_ETH_TX_ADJ_DELAY;
> >  		dwc_priv->eth_clk_dly_param |=
> >  				 FIELD_PREP(EIC7700_ETH_TX_ADJ_DELAY, val);
> > -	} else {
> > -		return dev_err_probe(&pdev->dev, -EINVAL,
> > -			"missing required property tx-internal-delay-ps\n");
> >  	}
> 
> I think then you need to handle RGMII, RGMII_ID, RGMII_RXID and RGMII_TXID,
> by using default delays for these (usually around 2ns), as here all delays
> will be set to 0, regardless of the RGMII mode in use.

No. By default, the MAC adds 0ns delay, and passes the phy-mode to the
PHY. It will then add the 2ns delay. It is possible to use the
tx-internal-delay-ps and rx-internal-delay-ps in the MAC to add small
tuning delays, but not the full 2ns.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

	Andrew

