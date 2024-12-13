Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DAFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqNLrqv94sPI27T0I4ULQ9Lnh8jweJTywCoEGauSK/w=; b=A+oxRLXo1nZOxQOWXlVjT1G1Q/
	u8dThEVZ+5QQMCQdR09BtiXw418Y3yLfcFah8OQIbkIrn2tshHai7g86PdCGonHgLzerj/Ksb/1hx
	HlkJcAe/UKp8qxs11GTUdq/He7bc/KcFHibbYue6njvZU0Uw6r8MFsON2su9sJ/75V/T4bCmzoTIp
	RGC2pVsMsH/8HESia02OUcest4zVzfCanCAHhWsV250BEtWY+ptbZy0mDt/2Tr7Ba8N6trXfgRetf
	nsEnPqBccMeKgZSgnl0oo0derM+GTckRdYRxiSsle2/t1KDlmXSxy3zoSskKSB+alB6mmC6Yo4hwc
	2BAA90Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBFj-00000004mcS-28Op;
	Fri, 13 Dec 2024 19:23:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBEe-00000004mP4-1QAv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YqNLrqv94sPI27T0I4ULQ9Lnh8jweJTywCoEGauSK/w=; b=uG2jIy/FH0VmQoAg0RISmoKUnb
	gbHYMYIaaU3K+zaGbslKBLBbZueOEWX2kWQZOzyOVGVE4oYIhjlg0lss+bo2erNZzLyQJnMb6cYlU
	dAJyEGOw6t7MezbbvaCuFzoCMOdiYnJ7fWULj4y9tTxJ+eAJvz0+PA71PZFAd4vwODCVxsg5hMzrC
	Y8IvLpiMUKUvyvgMeOGmNXDTQax96k8ly0At59PXwRX2yU3tnRdH5Xz8NGAxK9PeVrNqokpmX3sXX
	StjLJAe8nIPmJC4K4vpgba7N1hxqzudgZWqV3gw1RowjXLich0fgJldBuyaKYAqXPNARUiapWk6k4
	ljWeS0cA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39892)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tMBEO-0007C4-1H;
	Fri, 13 Dec 2024 19:21:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tMBEI-0006Xk-2p;
	Fri, 13 Dec 2024 19:21:38 +0000
Date: Fri, 13 Dec 2024 19:21:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-socfpga: Set interface
 modes from Lynx PCS as supported
Message-ID: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213182904.55eb2504@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_112200_373907_ACB06AB1 
X-CRM114-Status: GOOD (  28.28  )
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

On Fri, Dec 13, 2024 at 06:29:04PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Fri, 13 Dec 2024 12:22:45 +0000
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Fri, Dec 13, 2024 at 10:05:25AM +0100, Maxime Chevallier wrote:
> > > On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
> > > additional support for SGMII and 1000BaseX. The switch between these
> > > modes may occur at runtime (e.g. when the interface is wired to an SFP
> > > cage). In such case, phylink will validate the newly selected interface
> > > between the MAC and SFP based on the internal "supported_interfaces"
> > > field.
> > > 
> > > For now in stmmac, this field is populated based on :
> > >  - The interface specified in firmware (DT)
> > >  - The interfaces supported by XPCS, when XPCS is in use.
> > > 
> > > In our case, the PCS in Lynx and not XPCS.
> > > 
> > > This commit makes so that the .pcs_init() implementation of
> > > dwmac-socfpga populates the supported_interface when the Lynx PCS was
> > > successfully initialized.  
> > 
> > I think it would also be worth adding this to Lynx, so phylink also
> > gets to know (via its validation) which PHY interface modes the PCS
> > can support.
> > 
> > However, maybe at this point we need to introduce an interface bitmap
> > into struct phylink_pcs so that these kinds of checks can be done in
> > phylink itself when it has the PCS, and it would also mean that stmmac
> > could do something like:
> > 
> > 	struct phylink_pcs *pcs;
> > 
> > 	if (priv->hw->xpcs)
> > 		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> > 	else
> > 		pcs = priv->hw->phylink_pcs;
> > 
> > 	if (pcs)
> > 		phy_interface_or(priv->phylink_config.supported_interfaces,
> > 				 priv->phylink_config.supported_interfaces,
> > 				 pcs->supported_interfaces);
> > 
> > and not have to worry about this from individual PCS or platform code.
> 
> I like the idea, I will give it a go and send a series for that if
> that's ok :)

I've actually already created that series!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

