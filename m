Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C7FD3B98D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 13:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky6HbS31SSAdMYxozY6xIMAs0Cpmlvp4GWo+IUxC3Gc=; b=Tqz/dsNDxDckVgNOoxZQgXYFN7
	vDNMiOzhTj9k6jUnRcN3god1V2hf2HFSDyis+Q7pBhBMoixoMMX72s07uTtxr2ZZsnWJiuC1Eh7eI
	TI7M1jL3G9J5PrRhBrnOMeGtWzQVBxm2C1vgyFvyqLR6C+w39EgUG3XLuE76YbF0VGoVNH3E7BJWR
	mSLgS0TeKDv0pf8zMGosw+/gv5T4wXF1FlZbhJVuBo2rHRAgTqe8XO/Bja9F7ooDZlFkAODzofPQg
	raTOsY0OiF1fsrHWUqtM2dKw4cDnEzhow/kfzZXN2/l0320pkj5EqjxUjX0wkGY0DKrHZhaF+0SF4
	cv6M8XEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvSA-0000000AgnV-1WJN;
	Tue, 26 Nov 2024 13:18:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFvC1-0000000Adq1-0RK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 13:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ky6HbS31SSAdMYxozY6xIMAs0Cpmlvp4GWo+IUxC3Gc=; b=sA/wh2QdMDG6PLLquxIEEkTzeN
	r8oRRbixq8aAWGNui9FskfeZ+s+CruyDf1QNYcJu1YTw1B59tqTMhKJR5jcBCUo9aYxQfbbZSAbcy
	UpRmoq+0oztPAtiTZR6Jf3kg5fvS/1q+fWAJT5LrwrQ3ap6KoivSQLAQ9JoXquDPGhH60kjpyU37Z
	ch0Ypjw60dLf9Z4KZrdjMH+PaZkow2p6pzin2z+wpe5l+BuIFlWrY+PUbynf8x03RargY5D9GF0m1
	X4wNGVCYilk3TcsMtkI4sJ0U6Rpug2xNX4sO5o4186DptWdSkvOXoUIFEfbvq1X8w7oRZhuxM13zB
	aQRGky1w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54564)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tFvBq-00070g-17;
	Tue, 26 Nov 2024 13:01:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tFvBn-0004ZI-1q;
	Tue, 26 Nov 2024 13:01:11 +0000
Date: Tue, 26 Nov 2024 13:01:11 +0000
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
Subject: Re: [PATCH RFC net-next 00/23] net: phylink managed EEE support
Message-ID: <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_050125_139894_297B703A 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, Nov 26, 2024 at 12:51:36PM +0000, Russell King (Oracle) wrote:
> Patch 11 adds phylink managed EEE support. Two new MAC APIs are added,
> to enable and disable LPI. The enable method is passed the LPI timer
> setting which it is expected to program into the hardware, and also a
> flag ehther the transmit clock should be stopped.
> 
>  *** There are open questions here. Eagle eyed reviewers will notice
>    pl->config->lpi_interfaces. There are MACs out there which only
>    support LPI signalling on a subset of their interface types. Phylib
>    doesn't understand this. I'm handling this at the moment by simply
>    not activating LPI at the MAC, but that leads to ethtool --show-eee
>    suggesting that EEE is active when it isn't.
>  *** Should we pass the phy_interface_t to these functions?
>  *** Should mac_enable_tx_lpi() be allowed to fail if the MAC doesn't
>    support the interface mode?

There is another point to raise here - should we have a "validate_eee"
method in struct phylink_mac_ops so that MAC drivers can validate
settings such as the tx_lpi_timer value can be programmed into the
hardware?

We do have the situation on Marvell platforms where the programmed
value depends on the MAC speed, and is only 8 bit, which makes
validating its value rather difficult - at 1G speeds, it's a
resolution of 1us so we can support up to 255us. At 100M speeds,
it's 10us, supporting up to 2.55ms. This makes it awkward to be able
to validate the set_eee() settings are sane for the hardware. Should
Marvell platforms instead implement a hrtimer above this? That sounds
a bit problematical to manage sanely.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

