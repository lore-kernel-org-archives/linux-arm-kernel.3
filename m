Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E998C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75qj38gUt9K8kC/h4fbdxHuyt0mz8emxnm7YZkvJPt8=; b=IGTVFXEb/NL8w5rKxOCwHLef3K
	iMZQQ8ie+yM8aZKqk/2HxpNTze8L/Sl4FDNYgT0NlI0c1PTGFQGq1WS8bPVUeHkVA4mlrIS2JDQoj
	Kk8omdHLzc6tWSt6j3qEeAhsx3RVOzQ3UH5/ywIbT6XsQ8GYnpP7+jZPFgkFVBFK9+rv9dS2Uqyd7
	fg76VZr1mLrIJC84eADcB5o+QG9pUoF8fbdHRL792htqvEbLYkfftvtc9mVhjBTI7eWUEUHw4IOSc
	2grYmi7RwG1eC/17ZBk5Dzw9swz3NxrGyQFnBn1ADVBSDf8ZZGZ1lCj8xdS+n5z1kUw+q9hJwFDjw
	dIaPUcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU9Q-000000059ck-3ntq;
	Sun, 19 Jul 2026 16:14:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlU9O-000000059bi-2mYk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=75qj38gUt9K8kC/h4fbdxHuyt0mz8emxnm7YZkvJPt8=; b=IUnTmK2AhPCSYk1gnkvX4O1kVm
	gfw+TWnesSzskcNAFGUgUbsqBZEwqQCQhZjn1APM4nmmxIspxizsk/kx0xtItzznFM6t3UEdk30nN
	S6qg60Fe/CaPVmDQZBrBQDvKO+NA/N0TUZA1WCFE9iiqlc3NRDxgTTsu64l1evggmBWs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wlU9D-00D6hX-8z; Sun, 19 Jul 2026 18:13:47 +0200
Date: Sun, 19 Jul 2026 18:13:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
Message-ID: <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_091358_700670_B4D8C519 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

> Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
> handling in phy_mii_ioctl(). Looks like we can ?

I'm not sure about that. We need Richards input.

The code in phy_mii_ioctl() allows the MAC to be bypassed, it goes
straight to a PHY based stamper. It could be the MAC has no idea the
PHY has this capability, so it has not implemented the .ndo?

It might be we need to hoist the code from phy_mii_ioctl() into
dev_{sg}et_hwtstamp()?

	Andrew

