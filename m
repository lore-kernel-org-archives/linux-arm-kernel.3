Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E584DE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQNGyoGTk3gphP9Ejtpl8Wnab+mwXMUr4VlhvKse5UU=; b=n3qCi5kZ/cio/a0jWp2tGLw/JO
	q7FLeTIqzGS8MxN/8ggHnL2MaJjTTBKm72TMGtYlmKPVTbjgk+0+/eHGReavubq4oXcJT/k41AiDA
	vif8+hM09aWM2IqGaOGht5uKHw/bQEo2xGvmlqMHx3OtP4n6Dx3XdNxAY6c9wtUeelE6B++ItZlxX
	vUgwlvPBUxHsuKIwEiue7uwWLGODlliRVBCYq9V/pllulwu+83Jw0hybsN5T8a/OvYH7ZAiFERmDv
	Y8LzFI+yJnyy40zrUKQ7F+F6v2CLRrzwsS4tSaiFL+MARQdAwGoIanqnjCjMMQH8n0X9ynI7BJoID
	hqwmL3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB8U-00000005MAB-2gQ0;
	Tue, 07 Jan 2025 15:04:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB6y-00000005LcS-3tWr;
	Tue, 07 Jan 2025 15:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QQNGyoGTk3gphP9Ejtpl8Wnab+mwXMUr4VlhvKse5UU=; b=NXyUhvLHFpRiKWcor7q8IVmcol
	2sVdmZ6mbRrpJZJnwzs7s+9cdGot9ImqJUvY101g0DFw8pwlW7NuzKGf6nAA6R25qrbV/4jpi1Fqa
	0LPALkcvERzOrcTWj0BKGTfNgk1o9kNEG/ckwDKFv51/ZqkvbkTdSUMZZWd9zh255i2pIxBHV6Pfp
	IC7HB9gHrsYAwvlG7SHYOQozRDK2Kb6wPK1+IGa9mrHBIOWGw0HHCQaGjhJO6Oh3ukbCAZUGEktKI
	hdtl05BmaN9SU2vMJFj7eTo5yMtrh4s/dj+vGigUlyY32Ge8bEwF7lAdBLcHbAdWmYfutsDDyekNU
	OBbOWK3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58372)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tVB6l-0007db-1R;
	Tue, 07 Jan 2025 15:03:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tVB6k-0005N7-0P;
	Tue, 07 Jan 2025 15:03:02 +0000
Date: Tue, 7 Jan 2025 15:03:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_070316_966237_69311560 
X-CRM114-Status: GOOD (  24.45  )
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

On Tue, Jan 07, 2025 at 02:14:03PM +0100, Eric Woudstra wrote:
> 
> 
> On 1/7/25 1:47 PM, Russell King (Oracle) wrote:
> > Going through the log...
> > 
> > On Tue, Jan 07, 2025 at 01:36:15PM +0100, Eric Woudstra wrote:
> >> Log before this patch is applied:
> >> [root@bpir3 ~]# dmesg | grep eth1
> >> [    2.515179] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine at 0xffff800082380000, irq 123
> >> [   38.271431] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/2500base-x link mode
> >> [   38.279828] mtk_soc_eth 15100000.ethernet eth1: major config, requested inband/2500base-x
> >> [   38.288009] mtk_soc_eth 15100000.ethernet eth1: interface 2500base-x inband modes: pcs=01 phy=00
> >> [   38.296800] mtk_soc_eth 15100000.ethernet eth1: major config, active inband/inband,an-disabled/2500base-x
> > 
> > This is indeed without the PHY. We're using inband, although the PCS
> > mode is PHYLINK_PCS_NEG_INBAND_DISABLED, meaning inband won't be
> > used. As there is no PHY, we can't switch to MLO_AN_PHY.
> > 
> >> [   38.306362] mtk_soc_eth 15100000.ethernet eth1: phylink_mac_config: mode=inband/2500base-x/none adv=00,00000000,00008000,0000e240 pause=04
> >> [   39.220149] mtk_soc_eth 15100000.ethernet eth1:  interface 2 (mii) rate match none supports 0-3,6-7,13-14
> >> [   39.229758] mtk_soc_eth 15100000.ethernet eth1:  interface 3 (gmii) rate match none supports 0-3,5-7,13-14
> >> [   39.239420] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
> >> [   39.249173] mtk_soc_eth 15100000.ethernet eth1:  interface 22 (1000base-x) rate match none supports 5-7,13-14
> >> [   39.259080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
> >> [   39.594676] mtk_soc_eth 15100000.ethernet eth1: PHY i2c:sfp-1:11 uses interfaces 4,23, validating 4,23
> > 
> > The PHY comes along...
> > 
> >> [   39.603992] mtk_soc_eth 15100000.ethernet eth1:  interface 4 (sgmii) rate match none supports 0-3,5-7,13-14
> >> [   39.650080] mtk_soc_eth 15100000.ethernet eth1:  interface 23 (2500base-x) rate match none supports 6-7,13-14,47
> >> [   39.660266] mtk_soc_eth 15100000.ethernet eth1: PHY [i2c:sfp-1:11] driver [RTL8221B-VB-CG 2.5Gbps PHY (C45)] (irq=POLL)
> >> [   39.671037] mtk_soc_eth 15100000.ethernet eth1: phy: 2500base-x setting supported 00,00000000,00008000,000060ef advertising 00,00000000,00008000,000060ef
> >> [   39.684761] mtk_soc_eth 15100000.ethernet eth1: requesting link mode inband/2500base-x with support 00,00000000,00008000,000060ef
> > 
> > We decide to use MLO_AN_INBAND and 2500base-X, which we're already using.
> > 
> >> [   40.380076] mtk_soc_eth 15100000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off
> >> [   40.397090] brlan: port 5(eth1) entered blocking state
> >> [   40.402223] brlan: port 5(eth1) entered disabled state
> >> [   40.407437] mtk_soc_eth 15100000.ethernet eth1: entered allmulticast mode
> >> [   40.414400] mtk_soc_eth 15100000.ethernet eth1: entered promiscuous mode
> >> [   44.500077] mtk_soc_eth 15100000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off
> >> [   44.508528] mtk_soc_eth 15100000.ethernet eth1: No phy led trigger registered for speed(2500)
> > 
> > ... but we don't see link-up reported by the PCS after the PHY comes
> > up. Why is that - I think that needs investigation before we proceed
> > to patch the issue, because that suggests the PCS isn't seeing
> > valid 2500base-X from the PHY.
> > 
> 
> I think it is because pl->act_link_an_mode stays at MLO_AN_INBAND, but
> it needs to be set to MLO_AN_PHY, so that only the phy determines the
> link state:
> 
> phylink_resolve() {
>     ...
> 	} else if (pl->act_link_an_mode == MLO_AN_PHY) {
> 		link_state = pl->phy_state;
>     ...
> }

Please see my reply to Daniel. The PCS should still be capable of
reporting whether its link is up or down irrespective of whether
in-band status is being used or not.

While it is correct that PHY mode needs to be used here, your report
has pointed out that the driver is not reporting the PCS link state
correctly when in-band is disabled.

Given that the current state of affairs has revealed this other bug,
I would like that addressed first while there is a trivial test case
here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

