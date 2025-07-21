Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8744EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0zjOMTbsL9IYskcxTnBbpsTUpI1b+AoqR8XdDVpdrI=; b=UP1RRi5aWK85JfEnYbzZbXXLAz
	YT6WCHJ9h2Vp9/RGRrmDrmwCghHgjlFk8Z5fyzpoexZkfCmcWfaXmGU/5ztm5uHLw3RwFwZj3hyBk
	oCl5cu8gN3eEZmRc8QUGnSJsAAuy1fgkv8k7RJf1crdFq3Ly58iE9KLQSrE3pGz+WAWRhrvzi1xnx
	0gcSYND41eFcrJejXgp9+tZQRhh1Xumr/bPh+3Xf4bUy48Jpun0jlGD9zwnxGFSPV5ljtXHbyaO2o
	rwaUJEwrI96xelJakdtYTeUl8Lfm0rCAP9pqe5WtN804H+/CI01WNBvt1Fbov6iODpOgPDdxIL+tV
	i51nJKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsTh-000000005Fh-0Vzg;
	Mon, 21 Jul 2025 15:30:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqXP-0000000HO5z-1wiA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f0zjOMTbsL9IYskcxTnBbpsTUpI1b+AoqR8XdDVpdrI=; b=rDowa1V+pr1UhzVlanIV+mlqe+
	yi+x6a81Qp2xjGtBieTAdZdnaK3PLVHeziPlVeTDFY+AU7vBY2Li5ixGzFtTemQcIS20U/QvC5Ihr
	xxAkLgUGpSzVY0r0gOueIKO7mDIUSP3kdU1h3GzEwPfuofWTL4jRmOskhSRsAo9WqMVk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1udqXE-002MJh-72; Mon, 21 Jul 2025 15:26:28 +0200
Date: Mon, 21 Jul 2025 15:26:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
Message-ID: <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_062639_499115_54A204F0 
X-CRM114-Status: GOOD (  11.73  )
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

> +static int smsc_phy_suspend(struct phy_device *phydev)
> +{
> +	if (!phydev->wol_enabled)
> +		return genphy_suspend(phydev);
> +
> +	return 0;
> +}

Suspend/resume is somewhat complex, and i don't know all the
details. But this looks odd. Why does the phylib core call suspend
when phydev->wol_enabled is true? That at least needs an explanation
in the commit message.

> +static int smsc_phy_resume(struct phy_device *phydev)
> +{
> +	int rc;
> +
> +	if (!phydev->wol_enabled)
> +		return genphy_resume(phydev);
> +
> +	rc = phy_read_mmd(phydev, MDIO_MMD_PCS, MII_LAN874X_PHY_MMD_WOL_WUCSR);
> +	if (rc < 0)
> +		return rc;
> +
> +	if (!(rc & MII_LAN874X_PHY_WOL_STATUS_MASK))
> +		return 0;
> +
> +	dev_info(&phydev->mdio.dev, "Woke up from LAN event.\n");

Please don't spam the log. It is clear the system woke up, there are
messages in the log...

	Andrew

