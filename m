Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD6yN+jo75z7qtPClbof5z7Gv2ezQi6FSb5vBI7Z6ZM=; b=Z1muRrifNJqrEPsupXzcjO5o42
	8lKITtGsGSIUNTEj4rG5PCVqbalFBG7Y9hRZR8CbVEki4WIxeFBvZYUEJ+FmCdwaYZz/1BGuGeW2j
	bvpZATOlJ0xT7ir04/rlxq060FKDGJKstxZqo1PurZfFWKk/QeLe3NWQe50XrNIk12SDAtLFUvfFQ
	f6DkZlSZfNsQi1eoWyLQc3f6vLUv5ayrwgrT9em+b0NAwiGdbyDBe3q324Iu/VNQ5c3W7/Uyel7yR
	8XslxD+7ph1ObBAROnh/b9m4CewdRA4cGset0VHV3rDV6AuHPWHKdPhhoVdX/1qsP+fVyMDUQxHYs
	sXM9d1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqFA-000000020Zi-2oUi;
	Mon, 06 Jan 2025 16:46:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqDF-00000001zod-3mEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TD6yN+jo75z7qtPClbof5z7Gv2ezQi6FSb5vBI7Z6ZM=; b=BSbpdryCv/lo3YrLHmdTg8Qrkn
	2CK7Yir7PfaW48ipgkehD4tlnyP1xsgYCVEanO4FfUS3VRiuUriPmDxq7bT0TzJdDctO+kr9XwO/2
	lBNK/cEWQQWW7aN2/SIItnjHiJ76y0WIcZPXHi4myYFLAQwAAVaRl4Qd4fYmZW15YFyw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqD0-001vqo-K3; Mon, 06 Jan 2025 17:44:06 +0100
Date: Mon, 6 Jan 2025 17:44:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 02/17] net: stmmac: move tx_lpi_timer
 tracking to phylib
Message-ID: <fc17707e-83c8-4bb3-9be4-bf583bc4c07b@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmA9-007VWp-Pg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmA9-007VWp-Pg@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_084421_936316_8E20A2EC 
X-CRM114-Status: GOOD (  13.64  )
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

On Mon, Jan 06, 2025 at 12:24:53PM +0000, Russell King (Oracle) wrote:
> When stmmac_ethtool_op_get_eee() is called, stmmac sets the tx_lpi_timer
> and tx_lpi_enabled members, and then calls into phylink and thus phylib.
> phylib overwrites these members.
> 
> phylib will also cause a link down/link up transition when settings
> that impact the MAC have been changed.
> 
> Convert stmmac to use the tx_lpi_timer setting in struct phy_device,
> updating priv->tx_lpi_timer each time when the link comes up, rather
> than trying to maintain this user setting itself. We initialise the
> phylib tx_lpi_timer setting by doing a get_ee-modify-set_eee sequence
> with the last known priv->tx_lpi_timer value. In order for this to work
> correctly, we also need this member to be initialised earlier.
> 
> As stmmac_eee_init() is no longer called outside of stmmac_main.c, make
> it static.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

