Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89086D65C61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hOqxkHTBppwid8pGiYPCcvBY5MygdugyTwbWDxFu4o=; b=OdI8v/fHirvQzahwZ5XyFU39P/
	5vLe/M2C8EqPRel3bkUfNmSPTWIJcXmO1/bp2idbH2IbjXanF9ohVnc2hxe2P6JbG7bdSTWc6puXY
	U+aRDIOOrtaj8FpUJXVBHT5Bqckeuf2sQlilRb15ynwqAajC/R1DIx3pOkH33/SSEkS+K6NhXYq3n
	YSHatcHvzVKb6SAq0YwAHvrAkjDRGJ7CYUiXr+TUed//mgaMU7M0Z7VZbxjPShFBqwD9GUEnGnZwu
	377oqK5Rf+I/RxIdN/ozwKLBIbSUzgEOYFubAwaDbEAFLyz7gaJ7jYNFNOVkxuNTp9/s9XOHRepc3
	oN/YEYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBW6y-00000009M2z-3DLN;
	Thu, 14 Nov 2024 09:26:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBW58-00000009Lp2-3s2A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 09:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6hOqxkHTBppwid8pGiYPCcvBY5MygdugyTwbWDxFu4o=; b=ApZEQeXJb3QMsX0nr8VsCR1KMk
	BHewEG01VyFqxdnj4VTIcFdMSQRLJeYAIKf2UUucjAoUiaWrhI95OpWCSwPgBXoxFSNdRBeZDn77j
	JolT1XGbISVYiaYyN/nL5Udwgwfdu2D4U8uPRxdE6zz4qw/eLNT63vswlZr2XYwZ1SDt6VK7gO6oU
	XUeL509EO7mPzL1+uEqtQ7jJ0uLRDuPBphKJEBcqyhGtJCHwsMNMhA6xhIM2WZJu0xL3Wf/3h32YJ
	gRBw5LJ/LzuhZuTWw90vnZPbVySSLnGi1jPzYFko8hPxSUd29hrE6p/djf/VQEr8dLzOP0YVJprLI
	TJyl4lUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41792)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBW4t-0007ii-1z;
	Thu, 14 Nov 2024 09:23:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBW4q-0000zW-1n;
	Thu, 14 Nov 2024 09:23:48 +0000
Date: Thu, 14 Nov 2024 09:23:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v1 1/2] net: phy: set eee_cfg based on PHY
 configuration
Message-ID: <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_012406_984720_DECD1549 
X-CRM114-Status: GOOD (  15.56  )
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

On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
> Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> designed to have EEE hardware disabled during the initial state, and it
> needs to be configured to turn it on again.
> 
> This patch reads the PHY configuration and sets it as the initial value for
> eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
> true by default.

eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
that LPI needs to be enabled at the MAC if EEE was negotiated:

 * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
 *      that eee was negotiated.

eee_cfg.eee_enabled means that EEE mode was enabled - which is user
configuration:

 * @eee_enabled: EEE configured mode (enabled/disabled).

phy_probe() reads the initial PHY state and sets things up
appropriately.

However, there is a point where the EEE configuration (advertisement,
and therefore eee_enabled state) is written to the PHY, and that should
be config_aneg(). Looking at the Marvell driver, it's calling
genphy_config_aneg() which eventually calls
genphy_c45_an_config_eee_aneg() which does this (via
__genphy_config_aneg()).

Please investigate why the hardware state is going out of sync with the
software state.

Thanks.

>  void phy_support_eee(struct phy_device *phydev)
>  {
> +	bool is_enabled = true;
> +
> +	genphy_c45_eee_is_active(phydev, NULL, NULL, &is_enabled);
>  	linkmode_copy(phydev->advertising_eee, phydev->supported_eee);
> -	phydev->eee_cfg.tx_lpi_enabled = true;
> -	phydev->eee_cfg.eee_enabled = true;
> +	phydev->eee_cfg.tx_lpi_enabled = is_enabled;
> +	phydev->eee_cfg.eee_enabled = is_enabled;

This is almost certainly incorrect, because eee_enabled should only
be set when phydev->advertising_eee (which should track the hardware
EEE advertisement programmed into the PHY) is non-zero.

Note that phy_support_eee() must be called _before_ phy_start(). I
haven't checked whether stmmac does this.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

