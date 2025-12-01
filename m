Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B787D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGl7SM2seAnZb0MwfSY+i9t4y1zT3BYhdFJfFDtJktw=; b=UUgeS5g5eUYV1gV1l664QwU1Kv
	bVJ36HgHsN4eyRUhLgv+AXWunAmyX3nKoQ+CLYCQlz6YTNSn6k0CDhgzOb/6rer1P0cRnyfaMPrWV
	OYF7zwJ3kLvTaJ8Ec+GH744QkDeUh5XsuNjN8P5sp3QpH28cdKBThQJ8SvW6kJC5McxVzZ571Q8k5
	mDuf5/egSP0h7JKH8AgmXn/l+KZFOtOqxUrKofQKcH4hLj+AgHNZXrXVeaW6XOjQSwJ4rh3NMlJcS
	AcPCFgLKAIjcKtSnTxP+F+6UgDEXII2AJOtN/K3L2RldvBX4Ntezx04u2IFXeNBlqyCT33MaRZO+1
	csRhQRIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6v6-00000004HcY-0RtD;
	Mon, 01 Dec 2025 16:38:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6v3-00000004Hc1-1RRu;
	Mon, 01 Dec 2025 16:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kGl7SM2seAnZb0MwfSY+i9t4y1zT3BYhdFJfFDtJktw=; b=bSjgtfRiEoSeXqz5HE779+QRoV
	MgpQsNPROlusFGq9HSqlAQXT0zvARqbLusTkXBhgPONL7nuUA1UT2d6LrQBTYrNO9rOypoGXtpPTJ
	8XsDYxgkOrV7g+OpGYymsoHIY2uEFKj9fHc6UYs4mHUGfTmLqxeh1GUl1C7CsP2IpLaRrRbrwzFru
	RCXc4BKcri3pV1hEWttMzdzMcbxpmlCA/Ul/Rm0U7Kr2JIlTAnOXRYy3FR8MCH+PvawcjdhCS95Bv
	m+VEBkb8B/6yh71ijhfUDnhZFKSeAeDnly7BlxHcF7QRvJ4jdpqFrlSt376vlvkdCfEuDfd1Yctmt
	Ndj2yauQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52260)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vQ6uw-000000000pK-01R0;
	Mon, 01 Dec 2025 16:38:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vQ6us-000000006bg-1DIa;
	Mon, 01 Dec 2025 16:38:22 +0000
Date: Mon, 1 Dec 2025 16:38:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 00/15] net: stmmac: rk: cleanups galore
Message-ID: <aS3EfuypsaGK6Ww_@shell.armlinux.org.uk>
References: <aS2rFBlz1jdwXaS8@shell.armlinux.org.uk>
 <05db9d3e-88fa-42db-8731-b77039c60efa@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05db9d3e-88fa-42db-8731-b77039c60efa@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_083833_383093_9132EDC0 
X-CRM114-Status: GOOD (  26.37  )
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

On Mon, Dec 01, 2025 at 04:55:21PM +0100, Andrew Lunn wrote:
> > One of the interesting things is that this appears to deal with RGMII
> > delays at the MAC end of the link, but there's no way to tell phylib
> > that's the case. I've not looked deeply into what is going on there,
> > but it is surprising that the driver insists that the delays (in
> > register values?) are provided, but then ignores them depending on the
> > exact RGMII mode selected.
> 
> Yes, many Rockchip .dts files use phy-mode = 'rgmii', and then do the
> delays in the MAC. I've been pushing back on this for a while now, and
> in most cases, it is possible to set the delays to 0, and use
> 'rgmii-id'.
> 
> Unfortunately, the vendor version of the driver comes with a debugfs
> interface which puts the PHY into loopback, and then steps through the
> different delay values to find the range of values which result in no
> packet loss. The vendor documentation then recommends
> phy-mode='rgmii', and set the delays to the middle value for this
> range. So the vendor is leading developers up the garden path.
> 
> These delay values also appear to be magical. There has been at least
> one attempt to reverse engineer the values back to ns, but it was not
> possible to get consistent results across a collection of boards.

Oh yes, I remember that. I also remember that I had asked for the
re-use of "phy_power_on()" to be fixed:

https://lore.kernel.org/netdev/aDne1Ybuvbk0AwG0@shell.armlinux.org.uk/

but that never happened... which makes me wonder whether we *shouldn't*
have applied "sensor101"'s patch until such a requested patch was
available. In my experience, this is the standard behaviour - as a
reviewer, you ask a contributor to do something as part of their
patch submission, and as long as their patch gets merged, they
couldn't give a monkeys about your request.

So, in future, I'm going to take the attitude that I will NAK
contributions if I think there's a side issue that the contributor
should also be addressing until that side issue is addressed.

This shouldn't be necessary, I wish this weren't necessary, and I wish
people could be relied upon to do the right thing, but apparently it is
going to take a stick (not merging their patches) to get them to co-
operate. More fool me for trusting someone to do something.

I now have a couple of extra patches addressing my point raised in
that email... which I myself shouldn't have had to write.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

