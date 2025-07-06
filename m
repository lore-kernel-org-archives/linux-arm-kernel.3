Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9B5C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWfeIfuL/kwNF8nAD5QuTvp840QjR9/bbiTVVW0dfhk=; b=dVBJkzTS3s8SKf2KPp9YbnjJTT
	DNMiIy621N65EroUEtCKGWa23kBPsq9Uw08w2t+sGNPlFZnZB0SQPxPXgx3xHrpYEihs+W7S1bc4o
	7b1IcsY7EsU2r3Ld9nTtXEJgoQ1cILgvRhBopGbTnOp6ZgXaNpdS3PZ0SeyqJgf/zkkK6ehnBxl1Y
	H9k/7upR4SB3+TQ0OIzDzWwp8vpb6Abh7t8/H7SdrYoQo5a8QOcfDuu6nX5XnKi5vKv2E/YA6ts38
	jzHWbZ0s+QkBwBhvKmJ1D9p1+jZ7HeCUOgUoyjX9OdRUW9JRUZNoZ8VcrZp+b+idmy87NYQyw8PjT
	ICPcPOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMJ1-000000006l4-2Xk4;
	Sun, 06 Jul 2025 10:09:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMGh-000000006Y9-3m2S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 10:06:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IWfeIfuL/kwNF8nAD5QuTvp840QjR9/bbiTVVW0dfhk=; b=iU5ZzXcNVcNXf4OCCNIVweOmSz
	hiHERGwNfjqeYzsY1DNxe+aGznYucGnwzjIDO1pnnaDrV70QF49/IGm+Qf9gzrCSwsrC5QxyIkSK9
	WIAezClT4H61s8UjuL9hOpXEUu4TfEWLY3PyQWm+GqneNTlpm/QrkD+3DfYDouJA5Wi1nahWcvgMD
	uLNwbwyT98O/RlkjerGR5DK6Jw9YY3FunMqfpKvzRIajDfqE75N2a7q0LmOq9Aahft7hZjzl2Pxd5
	0wNWmFmQvEZS9C1+pFFsDYWouTGOaIOu3p9EmrJg2TxGb4GMs8WxCfSJ8SAZXKJW7TPBTHBDc9hp2
	hupzmhwg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uYMGR-0003xa-2A;
	Sun, 06 Jul 2025 11:06:27 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uYMGL-0007ya-32;
	Sun, 06 Jul 2025 11:06:21 +0100
Date: Sun, 6 Jul 2025 11:06:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
Message-ID: <aGpKncEeZTifSlA2@shell.armlinux.org.uk>
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
 <aGl9e9Exvq1fVI0s@shell.armlinux.org.uk>
 <TYCPR01MB11332BCE03B3533784711A5BF864DA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460004F6A57B3AAD77E86E864CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_030643_938203_0A3103F3 
X-CRM114-Status: GOOD (  11.41  )
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

On Sun, Jul 06, 2025 at 08:45:14AM +0000, Biju Das wrote:
> Hi Russell King,
> 
> FYI, The above testing is done with rootFS mounted on SD card.
> 
> But when I mount rootFS on NFS, after wakeup, I am not able to contact the NFS server.
> 
> The below patch makes it to work[1].
> Not sure, why the original code is failing if the rootFS is mounted on NFS?

It would be good to understand exactly what is going on there.

As stmmac sets mac_managed_pm to true, which is propagated to phylib,
this means the mdiobus suspend/resume will be no-ops, as the MAC driver
needs to do everything necessar to resume the PHY.

Is your PHY losing power over suspend/resume?

Maybe phylink_prepare_resume() needs to call phy_init_hw() as well,
like mdio_bus_phy_resume() does?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

