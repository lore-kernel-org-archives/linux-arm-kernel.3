Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7902CD609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YV7Ng+UILJGgeX2OpLHjyU7yknzjQ5R3jvrdw+xvoG8=; b=kVVc7SuI7OYYIQq+Vo5sZwWcOI
	mNjKW3n5hKtsZlvOnopYJY7UGgipdsYEC4yjjRu+pP9QHB+XwRs524j0SI1PbOvu0rSaDNFdBhhrT
	zTfhGPYBva4XJt1dCS5lmsLL6QQTWhrZOcM3BZNRqOg3yFjz214XXrt7GkkspgX+LxkV5+OELlnHx
	+yHPCoqiavfGkdFVA2MThsdn3YTTUOTc0aTVknIWbpEpr3QxjkVmp0kdfh/uHaLOn1DbhEMWkV+Mq
	W3sYsAFMQ68HBN1m2dG0pdXGWqqhXz73edvoXmXBhKX1XuUBG7OPnKwWBzxGfH2dRUg4ykbDp3eJw
	3EnmfbLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGG4I-0000000Cz0v-4BkK;
	Wed, 27 Nov 2024 11:18:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFyM-0000000Cxwt-277s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YV7Ng+UILJGgeX2OpLHjyU7yknzjQ5R3jvrdw+xvoG8=; b=nUjmzZSp0723C2w0rHv8ZaBBLX
	XrkG0T8d+DtE6S1tVqA9igzcoRFqbPXKGKBIZ4RCgzvAxBiu8zSDZRkP20hWC2zi8ejzAABOEMym7
	kYc3vo4iaWZF96oJya2fXWPR/2ADrBQ2Zc0LVayYCZsQVkNbns4K+a83WfHjjVGA5cDWoE8WNokM1
	BTj6Cw6Y2MGA2Jun7EV5DrGKSxIzwuJwfIzhGN8NocCwFQ8KLj+3vKYKXnyWG1EIJTTSRYRTqE4Ok
	SFB0hKL53Udq4ZcTt7L3qRABwslS07W0/G/N7Vg31EgBkjZdFOHliWC/4WxGFkZcvzPgVJTyDpfDt
	SsxAZIxQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39324)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tGFyC-0000E0-0T;
	Wed, 27 Nov 2024 11:12:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tGFy8-00076l-1e;
	Wed, 27 Nov 2024 11:12:28 +0000
Date: Wed, 27 Nov 2024 11:12:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 02/23] net: phy: fix phy_ethtool_set_eee()
 incorrectly enabling LPI
Message-ID: <Z0b-nJ7bt8IlBMpz@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFv3F-005yhT-AA@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_031242_545194_C85F30E6 
X-CRM114-Status: GOOD (  13.00  )
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

On Tue, Nov 26, 2024 at 12:52:21PM +0000, Russell King (Oracle) wrote:
> @@ -1685,15 +1685,21 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
>  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>  				      const struct eee_config *old_cfg)
>  {
> -	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
> +	bool enable_tx_lpi;
> +
> +	if (!phydev->link)
> +		return;
> +
> +	enable_tx_lpi = phydev->eee_cfg.tx_lpi_enabled && phydev->eee_active;
> +
> +	if (phydev->enable_tx_lpi != enable_tx_lpi ||
>  	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {

I'm wondering whether this should be:

	if (phydev->enable_tx_lpi != enable_tx_lpi ||
	    (phydev->enable_tx_lpi &&
	     phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer)) {

The argument for this change would be to avoid cycling the link when the
LPI timer changes but we're not using LPI.

The argument against this change would be that then we don't program the
hardware, and if the driver reads the initial value from hardware and
is unbound/rebound, we'll lose that update whereas before the phylib
changes, it would have been preserved.

The problem, however, are drivers where the LPI timer is dependent on
the speed.

Any thoughts?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

