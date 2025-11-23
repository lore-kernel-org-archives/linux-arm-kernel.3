Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEDDCFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guU6EtjifAGE68XECfBoFK6FHhJVVgrsHG71+R0xF5s=; b=iwjdC7KSFcKEI81m/Q6LXLe9vX
	MHjZYwYsx2V9CsdTlAWU/Cznn5zank4gjn0Ha/V+N2/wKdPmxLG1TcXmjOR+WBGAtXAIX0PikpWc8
	6bIgWVHmmuRSonK37uhw18goTwNDWBNl5tLI4rSOLtse9iYxwh18Y8v+zN8g/Jx8yCZpacnZg0gGG
	1vA9LAhDvIfPT7eBmaazc1Qy9tsAmzdn48uYvqdnxt2UR7YmWP616+mSyyNktoF0OT0GMOviynaqR
	IEB24AniMB+/fspOc9x2Uwp4erC9Xbv4vTGeq+g8JYW/XgxAb+4MpjhQDw7zAaU6cLMllFtikl2NJ
	o1n4pHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNBvH-0000000AVZQ-3psP;
	Sun, 23 Nov 2025 15:22:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNBvE-0000000AVZ4-3G0J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 15:22:42 +0000
Received: from pendragon.ideasonboard.com (fs276ed015.tkyc509.ap.nuro.jp [39.110.208.21])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DB0FE606;
	Sun, 23 Nov 2025 16:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763911228;
	bh=q89lS8EidiOlwgzxNGKjSVvReDwqkctFKR97mMOtEuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7ZEnNMiw2YT8c7Qi/u4Zrxuu7qj+HqIXy2bArYHbW0z6anjqi/mLIwWZoMFKnwfL
	 g6i2ixRV+FgP3CDB3tjapxwnJfcU+jzW2Z9qLcfrgmK8Ra6fV/8nRp58NIh+VF+NeZ
	 /LFr/W02WTI5v0pKpYVs73QfzEUFGiBeMwP1IJyA=
Date: Mon, 24 Nov 2025 00:22:08 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Schocher <hs@denx.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Joakim Zhang <qiangqing.zhang@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Hu <richard.hu@technexion.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Subject: Re: [PATCH] net: stmmac: imx: Do not stop RX_CLK in Rx LPI state for
 i.MX8MP
Message-ID: <20251123152208.GE15447@pendragon.ideasonboard.com>
References: <20251123053518.8478-1-laurent.pinchart@ideasonboard.com>
 <aSLKLYuz0WA2LpFF@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aSLKLYuz0WA2LpFF@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_072241_098274_7F61DC4E 
X-CRM114-Status: GOOD (  43.82  )
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

Hi Russell,

On Sun, Nov 23, 2025 at 08:47:41AM +0000, Russell King (Oracle) wrote:
> On Sun, Nov 23, 2025 at 02:35:18PM +0900, Laurent Pinchart wrote:
> > The i.MX8MP-based Debix Model A board experiences an interrupt storm
> > on the ENET_EQOS IRQ (135) when connected to an EEE-enabled peer.
> > 
> > Setting the eee-broken-1000t DT property in the PHY node solves the
> > problem, which confirms that the issue is related to EEE. Device trees
> > for 8 boards in the mainline kernel, including the i.MX8MP EVK, set the
> > property, which indicates the issue is likely not limited to the Debix
> > board, although some of those device trees may have blindly copied the
> > property from the EVK.
> > 
> > The IRQ is documented in the reference manual as the logical OR of 4
> > signals:
> > 
> > - ENET QOS TSN LPI RX Exit Interrupt
> > - ENET QOS TSN Host System Interrupt
> > - ENET QOS TSN Host System RX Channel Interrupts, Logical OR of
> >   channels[4:0]
> > - ENET QOS TSN Host System TX Channel Interrupts, Logical OR of
> >   channels[4:0]
> > 
> > Debugging the issue showed no unmasked interrupt sources from the Host
> > System Interrupt (GMAC_INT_STATUS), Host System RX Channel Interrupts or
> > Host System TX Channel Interrupts (MTL_INT_STATUS, MTL_CHAN_INT_CTRL and
> > DMA_CHAN_STATUS) that was flagged at an unexpected high rate. This
> > leaves the LPI RX Exit Interrupt as the most likely culprit.
> > 
> > The reference manual doesn't clearly indicate what the interrupt signal
> > is, but from its name we can reasonably infer that it would be connected
> > to the EQOS lpi_intr_o output. That interrupt is cleared when reading
> > the LPI control/status register. However, its deassertion is synchronous
> > to the RX clock domain, so it will take time to clear. It appears that
> > it could even fail to clear at all, as in the following sequence of
> > events:
> > 
> > - When the PHY exits LPI mode, it restarts generating the RX clock
> >   (clk_rx_i input signal to the GMAC).
> > - The MAC detects exit from LPI, and asserts lpi_intr_o. This triggers
> >   the ENET_EQOS interrupt.
> > - Before the CPU has time to process the interrupt, the PHY enters LPI
> >   mode again, and stops generating the RX clock.
> > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > 
> > The ENET_EQOS interrupt will keep firing until the PHY resumes
> > generating the RX clock when it eventually exits LPI mode again.
> > 
> > As LPI exit is reported by the LPIIS bit in GMAC_INT_STATUS, the
> > lpi_intr_o signal may not have been meant to be wired to a CPU
> > interrupt. It can't be masked in GMAC registers, and OR'ing it to the
> > other GMAC interrupt signals seems to be a design mistake as it makes it
> > impossible to selectively mask the interrupt in the GIC either.
> > 
> > Setting the STMMAC_FLAG_RX_CLK_RUNS_IN_LPI platform data flag gets rid
> > of the interrupt storm, which confirms the above theory.
> > 
> > The i.MX8DXL and i.MX93, which also integrate an EQOS, may also be
> > affected, as hinted by the eee-broken-1000t property being set in the
> > i.MX8DXL EVK and the i.MX93 Variscite SoM device trees. The reference
> > manual of the i.MX93 indicates that the ENET_EQOS interrupt also OR's
> > the "ENET QOS TSN LPI RX exit Interrupt", while the i.MX8DXL reference
> > manual doesn't provide details about the ENET_EQOS interrupt.
> > 
> > Additional testing is needed with the i.MX8DXL and i.MX93, so for now
> > set the flag for the i.MX8MP only. The eee-broken-1000t property could
> > possibly be removed from some of the i.MX8MP device trees, but that also
> > require per-board testing.
> > 
> > Suggested-by: Russell King <linux@armlinux.org.uk>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > I have CC'ed authors and maintainers of the i.MX8DXL, i.MX8MP and i.MX93
> > device trees that set the eee-broken-1000t property for awareness. To
> > test if the property can be dropped, you will need to
> > 
> > - Connect the EQOS interface to an EEE-enabled peer with a 1000T link.
> > - Drop the eee-broken-1000t property from the device tree.
> > - Boot the board and check with `ethtool --show-eee` that EEE is active.
> > - Check the number of interrupts received from the EQOS in
> >   /proc/interrupts. After boot on my system (with an NFS root) I have
> >   ~6000 interrupts when no interrupt storm occurs, and hundreds of
> >   thousands otherwise.
> > - Apply this patch and check that EEE works as expected without any
> >   interrupt storm. For i.MX8DXL and i.MX93, you will need to set the
> >   STMMAC_FLAG_RX_CLK_RUNS_IN_LPI in the corresponding imx_dwmac_ops
> >   instances in drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c.
> 
> Hang on... also check 100M connections, as I indicated, the lpi_intr_o
> is slow to clear even when the receive clock is running (it takes for
> receive clock cycles - 160ns for 100M, 32ns for 1G.)
> 
> So, I suspect you still get a storm, but it's not as severe.

Of course you're right, I rejoiced too fast :-/

The numbers are getting low enough to not be suspicious, so the
measurements are less precise. I've compared the number of interrupts
right after reaching the login prompt with and without the
eee-broken-100tx and eee-broken-1000t DT properties:

100TX link, eee-broken-* set: 7000 interrupts
1000T link, eee-broken-* set: 2711 interrupts
100TX link, eee-broken-* unset: 9450 interrupts
1000T link, eee-broken-* unset: 6066 interrupts

-- 
Regards,

Laurent Pinchart

