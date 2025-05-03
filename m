Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C19C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 09:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ccW1oXGvmd8gqUNZ/j59iLCK7owhNrD948/V9jYLGk=; b=IhQSmNIbP7J6APNJjUQle3VKFT
	m1WE3kmVtDLKmgczjYYRSt92EQxUsc60k9oK3JrRfqRi087h2RrKudspxnfgAl9EFoo73g6AcS48e
	ZK/VB3/ogtZsBcApghYBOUKEHGeSs1vqJ+5lR0W6Gp1CGUckQiFB4Hs9lPQgbTg8ytYsIm73mzV4i
	OQzETuVL4jx3qXbl+Ap2G+5IOaQFpO6PWhBL+b568/WxguLU99os8LnUIHJcwdBEF36ZL5PB0CeyG
	6sDb4Z1rUUcm6jvUFTMCDFsGxeGYrBPqIk9jE0FL1hv7S98OvcA0ilvIO+vPISJRMWahl66EB0Woa
	74az9u4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8mt-00000003fg3-0Jxi;
	Sat, 03 May 2025 09:03:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB8kw-00000003fWd-1N8a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 09:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0ccW1oXGvmd8gqUNZ/j59iLCK7owhNrD948/V9jYLGk=; b=ijit1WbYamYv45iAgfjDIPxmbA
	gyCyDXhZvfFCzv5A9UTtCUd6VQepfCR/oxIcewYTaZK8A8xEM4LqM8BN/FOSipLkFQzPXQ+NlkZHn
	NM68cSefwS5yI05VcLqzxeXT76PBNWTZzLSVaevFMyYYS2Mbo/4QgEiaoJaTqS5PaRksgRh7TVTuU
	E9eRGZRjnX9+fv6HZtXaX+7ZOrfy390fQ1FPBWD0lH9vfxO7AedsOrHO89sFFBtEbjnZXtnudoAKU
	1ZNBnXRQCfV9UesnRElx9J39kNeCrpBZ7/VmTaBPwufEdAwe5OqGN9s++jL5c2MwwQgptM0lPZJ7b
	stgI/0qw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44420)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uB8kq-0002HX-29;
	Sat, 03 May 2025 10:01:52 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uB8ko-0001a7-2j;
	Sat, 03 May 2025 10:01:50 +0100
Date: Sat, 3 May 2025 10:01:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: patchwork-bot+netdevbpf@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next 0/6] net: stmmac: replace speed_mode_2500()
 method
Message-ID: <aBXbfpbmuZzQefx9@shell.armlinux.org.uk>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
 <174623583625.3773265.4045311227752993763.git-patchwork-notify@kernel.org>
 <aBXbAwMC4V_3cmj6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBXbAwMC4V_3cmj6@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_020158_366685_1B6FA085 
X-CRM114-Status: GOOD (  19.90  )
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

Ignore me, not enough coffee. Sorry for the noise.

On Sat, May 03, 2025 at 09:59:48AM +0100, Russell King (Oracle) wrote:
> Err, I sent v2 a couple of days ago, did patchwork not see it?
> 
> On Sat, May 03, 2025 at 01:30:36AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> > 
> > This series was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
> > 
> > On Thu, 1 May 2025 12:45:21 +0100 you wrote:
> > > Hi,
> > > 
> > > This series replaces the speed_mode_2500() method with a new method
> > > that is more flexible, allowing the platform glue driver to populate
> > > phylink's supported_interfaces and set the PHY-side interface mode.
> > > 
> > > The only user of this method is currently dwmac-intel, which we
> > > update to use this new method.
> > > 
> > > [...]
> > 
> > Here is the summary with links:
> >   - [net-next,1/6] net: stmmac: use a local variable for priv->phylink_config
> >     https://git.kernel.org/netdev/net-next/c/5ad39ceaea00
> >   - [net-next,2/6] net: stmmac: use priv->plat->phy_interface directly
> >     https://git.kernel.org/netdev/net-next/c/1966be55da5b
> >   - [net-next,3/6] net: stmmac: add get_interfaces() platform method
> >     https://git.kernel.org/netdev/net-next/c/ca732e990fc8
> >   - [net-next,4/6] net: stmmac: intel: move phy_interface init to tgl_common_data()
> >     https://git.kernel.org/netdev/net-next/c/0f455d2d1bbe
> >   - [net-next,5/6] net: stmmac: intel: convert speed_mode_2500() to get_interfaces()
> >     https://git.kernel.org/netdev/net-next/c/d3836052fe09
> >   - [net-next,6/6] net: stmmac: remove speed_mode_2500() method
> >     https://git.kernel.org/netdev/net-next/c/9d165dc58055
> > 
> > You are awesome, thank you!
> > -- 
> > Deet-doot-dot, I am a bot.
> > https://korg.docs.kernel.org/patchwork/pwbot.html
> > 
> > 
> > 
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

