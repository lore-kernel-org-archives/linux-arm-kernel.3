Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DDBEA4FBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGF/G9VZgwv5uDw1cDEKac6MbcUJTCMmbChRNc3rhyU=; b=3ZQVy3qgt6c9HXytpEjDSk92Y8
	d3jLPMW9PJueU+e84Vd/BwPICuHLO9rIzwq3w6LScF5hHRRFazt7nuQq4WG+n4a1bgAyHiA2hiOGS
	f5lIuGQ63jlw6NtjGoZUmrdC54t00SrE9ou3sFSftYW4CemuTcXM4E/uiqUuUkISyrpLMwMqo87sv
	uD6gV8vB55NFxMmD/hFT3IATNWpvGiHIzIbMXYklyOS+Opg+7eG/mmJUevnJjTAWdo3/+HSPkn2GH
	QCYecWC8dbNfnIB927575dudFBVuAp1GMhW67HJ2m3tKoi+EwK06On/o/M6j/OEJo1yRe2gLWqRWF
	21/+JcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWHU-00000000PMw-0H32;
	Mon, 23 Feb 2026 13:47:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWHR-00000000PLq-2QvF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tGF/G9VZgwv5uDw1cDEKac6MbcUJTCMmbChRNc3rhyU=; b=YKXr/1uLiFlLjtTWx/94BTDEY4
	PWsXqFPZ7hzVbsvDV7OwZxL5gRAoeagWEG42AaxNXU+5yidUIQn9+u+/bgcF6yQq1kYNDR/Cx7Ak5
	HYmm2mo41VFEAdLt4bROjOQiy5gBryfzrOjk4Zl37LTPBCIc1QdUq3GF5fdFCbFVFL49d/vDJ2D/4
	Tfh+JXbDsNAEstdP2O1B1W6Q1Zxz8Mrevd3ESMmND+XeZbUD0ktAOSdGYpvZXiij7w+UzmxmtxlTS
	Buk39hdi/nTKDPZiRXqlj279EVslGoFr2NqsJdatWYOe1FtjvB0Hl+FfT+uiRyYaDbML6lisqL/TR
	vAvBIC4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50878)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuWH2-0000000049Y-3Ilb;
	Mon, 23 Feb 2026 13:46:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuWGw-000000007QI-0wgd;
	Mon, 23 Feb 2026 13:46:50 +0000
Date: Mon, 23 Feb 2026 13:46:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	boon.khai.ng@altera.com, rohan.g.thomas@altera.com,
	vladimir.oltean@nxp.com, hayashi.kunihiko@socionext.com,
	matthew.gerlach@altera.com, vee.khee.wong@intel.com,
	boon.leong.ong@intel.com, kim.tatt.chuah@intel.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/4] net: stmmac: Fix VLAN handling when
 interface is down
Message-ID: <aZxaSq1mrfInWClI@shell.armlinux.org.uk>
References: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223124102.120432-1-ovidiu.panait.rb@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_054721_620877_3811363D 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, Feb 23, 2026 at 12:40:58PM +0000, Ovidiu Panait wrote:
> VLAN register accesses on the MAC side require the PHY RX clock to be
> active. When the network interface is down, the PHY is suspended and
> the RX clock is unavailable, causing VLAN operations to fail with
> timeouts.
> 
> The VLAN core automatically removes VID 0 after the interface goes down
> and re-adds it when it comes back up, so these timeouts happen during
> normal interface down/up:
> 
>     # ip link set end1 down
>     renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
>     renesas-gbeth 15c40000.ethernet end1: failed to kill vid 0081/0
> 
> Adding VLANs while the interface is down also fails:
> 
>     # ip link add link end1 name end1.10 type vlan id 10
>     renesas-gbeth 15c40000.ethernet end1: Timeout accessing MAC_VLAN_Tag_Filter
>     RTNETLINK answers: Device or resource busy
> 
> Patches 3-4 address this by deferring hardware writes when the
> interface is down and reconfiguring the VLAN state on interface up.
> 
> Patches 1-2 fix some issues in the existing VLAN implementation.

First point to make is that when the netdev supports
NETIF_F_VLAN_FEATURES, receive clock stop is disabled. In stmmac:

        /* Disable EEE RX clock stop to ensure VLAN register access works
         * correctly.
         */
        if (!(priv->plat->flags & STMMAC_FLAG_RX_CLK_RUNS_IN_LPI) &&
            !(priv->dev->features & NETIF_F_VLAN_FEATURES))
                config->eee_rx_clk_stop_enable = true;

in phylink:

        if (pl->mac_supports_eee_ops) {
                /* Explicitly configure whether the PHY is allowed to stop it's
                 * receive clock.
                 */
                ret = phy_eee_rx_clock_stop(phy,
                                            pl->config->eee_rx_clk_stop_enable);

and also in phylink's phylink_rx_clk_stop_block():

        /* Disable PHY receive clock stop if this is the first time this
         * function has been called and clock-stop was previously enabled.
         */
        if (pl->mac_rx_clk_stop_blocked++ == 0 &&
            pl->mac_supports_eee_ops && pl->phydev &&
            pl->config->eee_rx_clk_stop_enable)
                phy_eee_rx_clock_stop(pl->phydev, false);

So, given that when stmmac supports VLAN, eee_rx_clk_stop_enable will be
false, so phylink_rx_clk_stop_block() does nothing useful and receive
clock stop at the PHY will be disabled.


So a few questions:

1) when the network interface is opened or resumed, a DMA reset is
performed which resets all hardware state, including VLAN state. On
resume, we call stmmac_restore_hw_vlan_rx_fltr(), but to me it looks
like that is incomplete, and bits of the VLAN configuration don't get
restored on resume. Please can you look at this and confirm whether
this is indeed the problem.

2) If we can fully restore the VLAN configuration on resume, I suspect
the driver will be doing the same work at resume as at open time, so
this code should be shared.

Please can you look at both of these points.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

