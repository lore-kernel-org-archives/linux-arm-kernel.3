Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B01D65C76
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQeUKWqacSfgCW37cA4xUbE+Eq7a4taaKHHUWJFU+2k=; b=ar1fEjuJYrEu35p1dUwRKDtbZD
	bTFQLwKpQH0LrU4fyv1FAusEcPWb/D/l0uo8BfolMdEWTdWH3FXwEl8Y5R5opLVGZKtkPw6fKjLUN
	+URmjSSMS6hVaOdriR/8JXhDf7rP8BadNdwNKkNiW40KA4PCHoEIH87Q/MMZIHjr0NpvjSlcPrbzU
	deREFQYWOAuvKQshx/wQNP3Xn10F1jJGjZbL2xdu/ogGUN3aABkRjPtsCW2C5rG+0hEbT42UEgnSR
	czdpt/iReT8weFQN9KWVDlBArTb878zZpUUM/qRd42OyGtYo6hZ9yRSiLX16uVK2blBvgSQ7kZ91m
	Ugb/bAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXoe-00000009gWG-2ENR;
	Thu, 14 Nov 2024 11:15:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWu9-00000009V8V-1bt3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 10:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UQeUKWqacSfgCW37cA4xUbE+Eq7a4taaKHHUWJFU+2k=; b=KwdpNgRM4UcCBOuf93b6jxWErT
	rTmZJP/8ZkBLnRhAjHoSSXpA4o41ZwYCzcm5aZ4doBU1dwP2O4GT96LA4HDkOCxgVaERbrLiKKaKc
	iS+6syRaSbx4EdqDN33wdkAFGC35ymWnsTJ6eKkAR/zEHftP8znJq4MiOrISPuP9xjhKzBVXvWM9l
	8ImY5AhJpLT66aaJRkAW03jezgs7n5OGsH/76apZrKib0gZJsI30jvY4VG0FjenWIUardw+SOt1qu
	Jp2uusv9CtUisoGcWEi2zx/SXGImkc6ucRqjn6s5knkTP49V46eLjBlWJVEDj/CnctFSOgpLqAM3w
	xyNkUvuw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWu6-0000000DbQ8-1K5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 10:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UQeUKWqacSfgCW37cA4xUbE+Eq7a4taaKHHUWJFU+2k=; b=EKdxYz4cjDjcDbN/5Eim1cU0zF
	m0Ab8tdmycKewlP4QFRolSJMOyGu2gyQascXJbVJQS2fjLRBP0JkVEGn4kCQWy0cvXF8BSwz6xZTL
	aHzJ8NRFeh518NKW85GgyNAfsBH1/eW8nTyH+9Oo7BD95uFBDgeV6CipZtit3ODL2JK6G+JlzybcW
	wBJRiIXQupbtFsYdCK9Mu1JwSkpOeFiSzHz+TxbqXLNDVMkzKO1J/mxvs9uC8Y3MtK7Cl61H21e0l
	SAfW+CFUDJVcvZAoU8W3eOWbElGWeTAF/zNAU0jq+H0fB7qZlk83x1OrXIk+yuNu8EZ3tqqJ34O4a
	k7zQ6aiQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46564)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tBWtw-0007oh-2N;
	Thu, 14 Nov 2024 10:16:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tBWtv-00012F-0T;
	Thu, 14 Nov 2024 10:16:35 +0000
Date: Thu, 14 Nov 2024 10:16:34 +0000
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
Message-ID: <ZzXOAvc__iQscSb4@shell.armlinux.org.uk>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
 <20241114081653.3939346-2-yong.liang.choong@linux.intel.com>
 <ZzXBpEHs0y2_elqK@shell.armlinux.org.uk>
 <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzXLgEjElnJD1445@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_101646_507274_EB7A3FF6 
X-CRM114-Status: GOOD (  28.20  )
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

On Thu, Nov 14, 2024 at 10:05:52AM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 14, 2024 at 09:23:48AM +0000, Russell King (Oracle) wrote:
> > On Thu, Nov 14, 2024 at 04:16:52PM +0800, Choong Yong Liang wrote:
> > > Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> > > designed to have EEE hardware disabled during the initial state, and it
> > > needs to be configured to turn it on again.
> > > 
> > > This patch reads the PHY configuration and sets it as the initial value for
> > > eee_cfg.tx_lpi_enabled and eee_cfg.eee_enabled instead of having them set to
> > > true by default.
> > 
> > eee_cfg.tx_lpi_enabled is something phylib tracks, and it merely means
> > that LPI needs to be enabled at the MAC if EEE was negotiated:
> > 
> >  * @tx_lpi_enabled: Whether the interface should assert its tx lpi, given
> >  *      that eee was negotiated.
> > 
> > eee_cfg.eee_enabled means that EEE mode was enabled - which is user
> > configuration:
> > 
> >  * @eee_enabled: EEE configured mode (enabled/disabled).
> > 
> > phy_probe() reads the initial PHY state and sets things up
> > appropriately.
> > 
> > However, there is a point where the EEE configuration (advertisement,
> > and therefore eee_enabled state) is written to the PHY, and that should
> > be config_aneg(). Looking at the Marvell driver, it's calling
> > genphy_config_aneg() which eventually calls
> > genphy_c45_an_config_eee_aneg() which does this (via
> > __genphy_config_aneg()).
> > 
> > Please investigate why the hardware state is going out of sync with the
> > software state.
> 
> I think I've found the issue.
> 
> We have phydev->eee_enabled and phydev->eee_cfg.eee_enabled, which looks
> like a bug to me. We write to phydev->eee_cfg.eee_enabled in
> phy_support_eee(), leaving phydev->eee_enabled untouched.
> 
> However, most other places are using phydev->eee_enabled.
> 
> This is (a) confusing and (b) wrong, and having the two members leads
> to this confusion, and makes the code more difficult to follow (unless
> one has already clocked that there are these two different things both
> called eee_enabled).
> 
> This is my untested prototype patch to fix this - it may cause breakage
> elsewhere:

As mentioned in the other thread:

Without a call to phy_support_eee():

EEE settings for eth2:
        EEE status: disabled
        Tx LPI: disabled
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  Not reported
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

With a call to phy_support_eee():

EEE settings for eth2:
        EEE status: enabled - active
        Tx LPI: 0 (us)
        Supported EEE link modes:  100baseT/Full
                                   1000baseT/Full
        Advertised EEE link modes:  100baseT/Full
                                    1000baseT/Full
        Link partner advertised EEE link modes:  100baseT/Full
                                                 1000baseT/Full

So the EEE status is now behaving correctly, and the Marvell PHY is
being programmed with the advertisement correctly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

