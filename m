Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2333ECCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMx/pBIc7baCIIFWi7F4x4oW//4oX2tqQgVeFsSMo44=; b=ztcZKX5ftCD5NB0qlODf2u8XHm
	1YxZ9iB/MKZ1tqdraaA9bIW94NDgl49+1TduWRLd8mSBVDggkNNCDdc0kA1yrarMqWmIjIMK6EKu/
	MyI9SjhT5aM7vSu1FTACcYq2JaxuqeHUB9rHPGgpwtjJc6JlTAUVOI7lx0jGZbn0i8RnOjZ3AdgVO
	K0SgPxV8/vQGxXV4BYUBuTpiQrv3XUpOqMU95dQnTIvPGq9QoDbD65tOhscpqINRFTXDi4Hk+8XHr
	Cje6adnz6Jlw3Y3qJiOHCkIC/pdB5qI0Lz6+NswhJ/IySNLQT2L2x3jucAQgijObmz8anr7mBmiOc
	D7A9Gxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrFP-00000009Xu8-1G1B;
	Mon, 03 Nov 2025 09:53:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrFM-00000009XtX-0dm5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cMx/pBIc7baCIIFWi7F4x4oW//4oX2tqQgVeFsSMo44=; b=f0o0aiuSsPBELTITSHiT3sl/9F
	ShJW0uMV84XXqKe4DehAuu+wJzWgWhk7SWRFBP0A3rg76j4tuP6h7DgXL0+ao8kzDoUgxYVP9f6Kc
	obDUjGatfPJ1zHDrnwLuMjQItLa0XRvgJA7U6JQUvhQOxBJrNlVx+BUnb1P2aCM/gCPr1AoxGSa66
	8PdsRaHvNHOSdMpeDAUBDQLXtn/S4vzKPFVAAqLAFUHLmRDPbotH8s7FhKPmJvB/3tSOuAcsNPI6N
	2ZN0iLv6qwulY6mTM2Jj7MX5w5PmW4UoxJzDR0g9qtgzz3KvfxFLOGdYj8MU/t4KYfb4CuUlJxV4v
	Z04rEpow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54432)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vFrEz-000000000Tv-17fT;
	Mon, 03 Nov 2025 09:52:45 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vFrEs-000000003hg-47Cx;
	Mon, 03 Nov 2025 09:52:39 +0000
Date: Mon, 3 Nov 2025 09:52:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Furong Xu <0x1207@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH net-next 0/3] net: stmmac: phylink PCS conversion part 3
 (dodgy stuff)
Message-ID: <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_015308_476933_40EA2841 
X-CRM114-Status: GOOD (  21.05  )
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

On Mon, Nov 03, 2025 at 02:28:24PM +0530, Mohd Ayaan Anwar wrote:
> On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> > On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > > 
> > > > This is probably fine since Bit(9) is self-clearing and its value just
> > > > after this is 0x00041000.
> > > 
> > > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > > "okay". Nothing more.
> > > 
> > > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> > 
> > Note also that testing a 10M link, 100M, 1G and finally 100M again in
> > that order would also be interesting given my question about the RGMII
> > register changes that configure_sgmii does.
> > 
> 
> Despite several attempts, I couldn't get 10M to work. There is a link-up
> but the data path is broken. I checked the net-next tip and it's broken
> there as well.
> 
> Oddly enough, configure_sgmii is called with its speed argument set to
> 1000:
> [   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
> [   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
> [   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
> [   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
> [   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
> [   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
> [   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off

If you have "rate matching" enabled (signified by "pause" in the mode=
part of phylink_mac_config), then the MAC gets told the maximum speed for
the PHY interface, which for Cisco SGMII is 1G. This is intentional to
support PHYs that _really_ do use rate matching. Your PHY isn't using it,
and rate matching for SGMII is pointless.

Please re-run testing with phy-mode = "sgmii" which you've tested
before without your rate-matching patch to the PHY driver, so the
system knows the _correct_ parameters for these speeds.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

