Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF7EA8109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCvUw7/lCEGBlYKLIRMIa5KgRRKn+Acso8mw+XapQ0g=; b=BHfeA8IQFQjePduRDeTWpKg2hZ
	q99aY2PZmMB6Y2kDBiJ3kkecOvGMg63F7KQrJ5nApv6S5WXb8iKrF4GuglEWkAHF8rmd+KZpON5RF
	XBysQAH2IrnVXjsiEcy7/HrQ7xAM0aeE9id8f3HPPSeBrV7naYJ7oX6Ls2d8Miq4Z7oMz4cgUaaX3
	kCwM1FYH9eGvSNYOLIu+1gYB7G/P9S4G3BOpd3NiZVynOVa75tAtHK37XeoPG3Uxf0x/qKySSQuW0
	c0JWc+jqBk/mtf3w6PCzsyUtiGrFbk6r+NDXIQJUcEyxCm8b1sDh9MQGp234GteFYAz5E0c75PdHG
	gEuEGH7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmpS-0000000GwCg-1aQf;
	Tue, 10 Feb 2026 12:26:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmpP-0000000GwCK-0lae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uCvUw7/lCEGBlYKLIRMIa5KgRRKn+Acso8mw+XapQ0g=; b=wR0EDoHK8mRIH8uMaABT5/zC3s
	HO8R1f7x+9M/R36KD14yKssCKQQtSEP1wKrrajvtnRxorwaUWTbWf5/mk4qRZW0SoCcz3dZqNa7sM
	LGkvMLebYcdEDRiCSlnomHQvHqu3jbBPMNua/6kZOBa24d9kMwL8oeT3NZVdVYkZd6sLoSu4ysUhp
	vOT1sZL8XH6rQMBiji06An2fs5pTRhtCpSU+S3VDblGJrbECGY61XczTAhpV7i+FBf4WIVZloCG6C
	3xc+s1ehMzwFChtKgm5k91c1WegbnvuE72YAhjZBo+KuwrNQGfI7LpKGxYQb0mHkXDqBopZK2yN8U
	JBUBCU6g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40790)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpmoq-000000002XV-22Ce;
	Tue, 10 Feb 2026 12:26:16 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpmom-000000002m2-25N6;
	Tue, 10 Feb 2026 12:26:12 +0000
Date: Tue, 10 Feb 2026 12:26:12 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Schocher <hs@denx.de>,
	Jakub Kicinski <kuba@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Hu <richard.hu@technexion.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] net: stmmac: imx: Disable EEE
Message-ID: <aYsj5IayQd3NRflL@shell.armlinux.org.uk>
References: <20260209202155.2388099-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209202155.2388099-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_042651_518680_9DA45604 
X-CRM114-Status: GOOD (  23.62  )
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

On Mon, Feb 09, 2026 at 10:21:55PM +0200, Laurent Pinchart wrote:
> The i.MX8MP suffers from an interrupt storm related to the stmmac and
> EEE. A long and tedious analysis ([1]) concluded that the SoC wires the
> stmmac lpi_intr_o signal to an OR gate along with the main dwmac
> interrupts, which causes an interrupt storm for two reasons.
> 
> First, there's a race condition due to the interrupt deassertion being
> synchronous to the RX clock domain:
> 
> - When the PHY exits LPI mode, it restarts generating the RX clock
>   (clk_rx_i input signal to the GMAC).
> - The MAC detects exit from LPI, and asserts lpi_intr_o. This triggers
>   the ENET_EQOS interrupt.
> - Before the CPU has time to process the interrupt, the PHY enters LPI
>   mode again, and stops generating the RX clock.
> - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
>   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> 
> An attempt was made to fixing the issue by not stopping RX_CLK in Rx LPI
> state ([2]). This alleviates the symptoms but doesn't fix the issue.
> Since lpi_intr_o takes four RX_CLK cycles to clear, an interrupt storm
> can still occur during that window. In 1000T mode this is harder to
> notice, but slower receive clocks cause hundreds to thousands of
> spurious interrupts.
> 
> Fix the issue by disabling EEE completely on i.MX8MP.
> 
> [1] https://lore.kernel.org/all/20251026122905.29028-1-laurent.pinchart@ideasonboard.com/
> [2] https://lore.kernel.org/all/20251123053518.8478-1-laurent.pinchart@ideasonboard.com/
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> This patch depends on https://lore.kernel.org/all/E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk/

... and a few other patches as well. There is also a conflicting change
in net-next:

commit dc6597fab3e3d291da9e0b4c6f7da01a5a863e80
Author: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Date:   Tue Jan 20 21:30:04 2026 +0100

    net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP

> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b

This is v6.19

> prerequisite-patch-id: 9229185bf29c206923075a0450e763664af050bb
> prerequisite-patch-id: e17c3f8a7cb2b18fc0c3c6250773a9680bdabdba
> prerequisite-patch-id: a3c3f8b08fd66ee3ccce632aad3f4a3c21c92718

I have no idea what these are. These don't exist in Linus', net, nor
net-next trees. I'm not sure what generates these, but they are useless
unless they also indicate the summary line for the commit in question,
so that one can have some clue what change they're referring to.

While this is a fix, I think you previously suggested that this isn't
a regression, which suggests it should be merged in net-next (currently
closed due to the merge window) rather than net.

Also, referring to another patch doesn't get it applied - netdev
workflow uses patchwork, and patches to be applied need to be there.
If patches depend on each other, they need to be submitted as a
series. So either I need to pick up your patch and send it along
with mine, or you need to pick up my patch and send it with yours.
We need to come to agreement on who is submitting it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

