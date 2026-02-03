Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4326E87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzeM8oaESwR5f6Qc18NJENPAHewlAD17RZTiqrl1jUw=; b=xg0p4qsL5upv6oHROFHPKiqElH
	+ifSS0XX6b2t+NxA1hTlrGroGu6BwMO99kB9QwEfdZCVwZuPcne8ptn80ogWc7b5j104owL/toIs/
	x0ISGfh+ja3WS+eQbZdkN158t4lGMGg3Uygwoc7l+KerqQRl0ir0Ngefzj6OzlRNYvGWr5oq1Hjzt
	YltDE5USJlWRhMHWROIYK7e9RcYxlMrx+lbCHXKsr+tcXM3qIzCET35zfxp+uSKaPbUuc1wLdJPFS
	3grQQ6aRqfHCsxBiJbdUo8Z9rwU8yj/q6JXkzxDQghcJt7711ZOI+JI2BecvSXeB+gJYL5jnOfRxa
	x38JZv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIZ0-00000006r0P-3N6E;
	Tue, 03 Feb 2026 15:43:38 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIYx-00000006qzX-1HsZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RzeM8oaESwR5f6Qc18NJENPAHewlAD17RZTiqrl1jUw=; b=Jt0kIIivMsAafQg+iXRknxBUz6
	F/yuYSd/CfJA/N0eRjBsL+4fi2Q3FsHCPR9M5rdXzRrQWKlPH7WnXlgXUnZ+b4s2MD5nHekUB2MCL
	ThA/6rkEuHK2KZyrXiR1bGbRYvoH8F+Oebt9U7lOWk9KSAjVk46UxW/ZQuv7wsyT8ttlaJj4xHac/
	NmW/h1b2jqJpPk1aEiB6Wq7N8sfvM6q6uH7JYE8wL++vKpFL9JkfmtzbAzrUz0ywT0dJ9TeABywca
	mJDKj6Oi3LUbfI1dsueqDjZK8SMsaRR6Ao9flVloipD9KuSGLQisEH6eWPU5dTZGh1qA4rE7OrvcP
	7nUacWuQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42522)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vnIYn-000000005EC-41oW;
	Tue, 03 Feb 2026 15:43:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vnIYk-000000004UW-1y5v;
	Tue, 03 Feb 2026 15:43:22 +0000
Date: Tue, 3 Feb 2026 15:43:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Wei Fang <wei.fang@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
Message-ID: <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074335_509721_4DC502E2 
X-CRM114-Status: GOOD (  46.58  )
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

On Tue, Feb 03, 2026 at 05:42:07PM +0200, Ovidiu Panait wrote:
> 
> Hi Russell,
> 
> On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
> > On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> >>
> >> Hi Russell,
> >>
> >> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
> >>> Some platforms have problems when EEE is enabled, and thus need a way
> >>> to disable stmmac EEE support. Add a flag before the other LPI related
> >>> flags which tells stmmac to avoid populating the phylink LPI
> >>> capabilities, which causes phylink to call phy_disable_eee() for any
> >>> PHY that is attached to the affected phylink instance.
> >>>
> >>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> >>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> >>> to the receive clock domain, and takes four clock cycles to clear, this
> >>> leads to interrupt storms as the interrupt remains asserted for some
> >>> time after the LPI control and status register is read.
> >>>
> >>> This problem becomes worse when the receive clock from the PHY stops
> >>> when the receive path enters LPI state - which means that lpi_intr_o
> >>> can not deassert until the clock restarts. Since the LPI state of the
> >>> receive path depends on the link partner, this is out of our control.
> >>> We could disable RX clock stop at the PHY, but that doesn't get around
> >>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> >>>
> >>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> >>> this is insufficient - the problem is also visible at 100M speeds,
> >>> where the receive clock is slower.
> >>>
> >>> There is extensive discussion and investigation in the thread linked
> >>> below, the result of which is summarised in this commit message.
> >>>
> >>
> >> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
> >> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
> >> separate, dedicated interrupt line to the CPU rather than being OR'd
> >> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
> >> "eth_lpi" interrupt in the stmmac bindings:
> >> """
> >> - description: The interrupt that occurs when Rx exits the LPI state
> >> const: eth_lpi
> >> """
> >>
> >> Looking through the other glue drivers/device-trees, it looks to me that
> >> every platform that defines a separate "eth_lpi" irq might have the
> >> interrupt storm problem.
> > 
> > That is highly likely.
> > 
> >> To fix this issue on these platforms, rather than disabling EEE
> >> altogether, would it be possible to just not request the eth_lpi
> >> interrupt and let EEE continue to work? Perhaps a new flag could let
> >> each platform decide.
> > 
> > Yes, because lpi_intr_o serves no purpose from a software point of
> > view - see the commit message below for the details. I do like
> > removing code from stmmac :)
> > 
> >> If not, maybe this patch could be merged to add the flag that disables
> >> EEE and I will just send a patch to disable EEE on our platforms as well.
> > 
> > We still need the flag to disable EEE for platforms where lpi_intr_o is
> > logically OR'd with the other interrupts, so there's no way to ignore
> > its persistent assertion.
> > 
> > 8<===
> > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
> > 
> > The dwmac databook for v3.74a states that lpi_intr_o is a sideband
> > signal which should be used to ungate the application clock, and this
> > signal is synchronous to the receive clock. The receive clock can run
> > at 2.5, 25 or 125MHz depending on the media speed, and can stop under
> > the control of the link partner. This means that the time it takes to
> > clear is dependent on the negotiated media speed, and thus can be 8,
> > 40, or 400ns after reading the LPI control and status register.
> > 
> > It has been observed with some aggressive link partners, this clock
> > can stop while lpi_intr_o is still asserted, meaning that the signal
> > remains asserted for an indefinite period that the local system has
> > no direct control over.
> > 
> > The LPI interrupts will still be signalled through the main interrupt
> > path in any case, and this path is not dependent on the receive clock.
> > 
> > This, since we do not gate the application clock, and the chances of
> > adding clock gating in the future are slim due to the clocks being
> > ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
> > requests the interrupt, and all associated code.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
> with this patch and didn't see any issues:
> 
> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Would you say this is a regression or a new problem?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

