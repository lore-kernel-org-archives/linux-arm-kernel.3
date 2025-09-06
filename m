Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB040CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgkcTykk7+R5KzkauX9gIOX8VMLULnOI+6rRJfYeh1I=; b=zzVc4UIvXN1H1WEdeLzjgBftYP
	u4UVFeqaVOac1KLYQYW93KhueIdhrG4y6mufRIulZ8Qu/OfFcCrZSHR7v55DTYx0IpAbw3xrv//wq
	A41HZQP3K1NRUNYCFQD3LCWdzcRc2ZW89TrtOn3QrxEXPDcR55NWesN+UYP7G8Rfu3kg3HAOivIGc
	G4d8ulc5+DW437hM3+B9ukEQFrzQpIt2CYLK8w9FBbJ9C9h9RiL8hYFhSCZeQSycL88guFQofaYlV
	L2o+TZmAFonpM4O02d484/CevhuOpCmgFprHx26ebOBF/3Ic18kqKKTyBg2xYR40XvVQGjrMsIN+A
	URCm/eoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuler-00000006rPU-0nhr;
	Sat, 06 Sep 2025 05:40:17 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uulc0-00000006qgS-0miH;
	Sat, 06 Sep 2025 05:37:22 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 46ADD22FBA;
	Sat,  6 Sep 2025 07:37:16 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNfilUzRkkX6; Sat,  6 Sep 2025 07:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1757137032; bh=wI0wevMGuuWRJUTVju5J6qPVfzuWW/OeRDSlbWe/Uh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pc2NVmAH3A/h9UswdB5Zwb7wYJRw31J3IXwZrZenSw6QoBmAZjI9ibSO87/kEIUul
	 iOdnSjO6Z0bsB+GdZ6UoCpWjTiR9pSIrcArMD5vKSJb1p2CZaAT7RkkyBMKBKGE8KC
	 xd2WxeZRmwFeZ74F+BPLS20j5S3TKMJcRCpw1UWpy59Jy/KwIEbtVXyg0TRskhvAF8
	 huq5kEpgVs3MUnfIw5rZvp3NMPruOWqRQ/SYYyBgSHweaWEqtoIyXshIvFG7TPdS4O
	 yeGlodGUv6jA2Kn6l1JlIZOimbrshSbsWBpJ/qGpge5h/cCfshgQNuoaKII4OZ0xeF
	 xu+8C5lL2LBbQ==
Date: Sat, 6 Sep 2025 05:36:44 +0000
From: Yao Zi <ziyao@disroot.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't
 contain invalid address
Message-ID: <aLvIbPfWWNa6TwNv@pie>
References: <20250904031222.40953-3-ziyao@disroot.org>
 <aLlwv3v8ACha8b-3@shell.armlinux.org.uk>
 <b5fbeb3f-9962-444d-85b3-3b8a11f69266@rock-chips.com>
 <aLlyb6WvoBiBfUx3@shell.armlinux.org.uk>
 <aLly7lJ05xQjqCWn@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLly7lJ05xQjqCWn@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_223720_655260_379571B6 
X-CRM114-Status: GOOD (  25.15  )
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

On Thu, Sep 04, 2025 at 12:07:26PM +0100, Russell King (Oracle) wrote:
> On Thu, Sep 04, 2025 at 12:05:19PM +0100, Russell King (Oracle) wrote:
> > On Thu, Sep 04, 2025 at 07:03:10PM +0800, Chaoyi Chen wrote:
> > > 
> > > On 9/4/2025 6:58 PM, Russell King (Oracle) wrote:
> > > > On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> > > > >   	if (plat->phy_node) {
> > > > >   		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> > > > >   		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> > > > > -		/* If it is not integrated_phy, clk_phy is optional */
> > > > > +		/*
> > > > > +		 * If it is not integrated_phy, clk_phy is optional. But we must
> > > > > +		 * set bsp_priv->clk_phy to NULL if clk_phy isn't proivded, or
> > > > > +		 * the error code could be wrongly taken as an invalid pointer.
> > > > > +		 */
> > > > I'm concerned by this. This code is getting the first clock from the DT
> > > > description of the PHY. We don't know what type of PHY it is, or what
> > > > the DT description of that PHY might suggest that the first clock would
> > > > be.
> > > > 
> > > > However, we're geting it and setting it to 50MHz. What if the clock is
> > > > not what we think it is?
> > > 
> > > We only set integrated_phy to 50M, which are all known targets. For external PHYs, we do not perform frequency settings.
> > 
> > Same question concerning enabling and disabling another device's clock
> > that the other device should be handling.
> 
> Let me be absolutely clear: I consider *everything* that is going on
> with clk_phy here to be a dirty hack.
> 
> Resources used by a device that has its own driver should be managed
> by _that_ driver alone, not by some other random driver.

Agree on this. Should we drop the patch, or fix it up for now to at
least prevent the oops? Chaoyi, I guess there's no user of the feature
for now, is it?

Best regards,
Yao Zi

> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

