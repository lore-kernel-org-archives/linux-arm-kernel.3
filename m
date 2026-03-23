Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08234EC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1JtUgAJo9zz29RauK3FUJzPu0iLBjOxgL8d3JFQYgo=; b=XNQsQPZybruZUMfg7KhlnohhP2
	JS7K0VPjZcGz/UIX3xHwf8YBW9CEuVjB5bIqoAnBCRhbCjNABH24HalwSO22coI/TehCrUdaVL3Kt
	2RWBARF5zwiApsdNteBS+S+RQCUBusdv8tRFSwfCmvx+nuHtGWUQl3Ettl4F7poRmbQDvts2W+Tlr
	8KbNjnKSUf/gGxZ2TZhy8Iix/FadZBkArYV3oj/fE9DAxi8M3bHE9DouoIgSpL1c5vobvhthq9t5j
	wrEziHaYaoqX+UfrOQQ5+w8Od+eK1t/nZLse52690Lm/9VgqTT2Zc8UuzCi9UVx8QXBL2iOjLvi9o
	dbbrbpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bzA-0000000GQ63-2trO;
	Mon, 23 Mar 2026 09:54:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bz8-0000000GQ5h-0DZF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c1JtUgAJo9zz29RauK3FUJzPu0iLBjOxgL8d3JFQYgo=; b=Cxjo/Yn0PNrXJyYp78jYI1Lr3m
	ju8Kh2IvRY5ar5bE5Pw+4HTNk0GKuL4aEgKkhhVFh2kN/jnHBjSX4/N0WIIugMxhZnKVB4lInlcMG
	HtAA+hyqdOCA2kruIi0C35/bz3L//QZtb2JepV0Rai8uJZdTNMfgjdxXFh2Dg9IZw1sw91RnaP8Io
	fgQpwDXpxqpd/ThjJY80fbLgeHm29H4xXzRlziw37OvjpNrM1HCzCUap2NNVuTxrrNHILg8Fc1mnr
	DXWbtjrtjP1t+jNFZQAC38vH6rYaktnzIfwCcGtI77IgYt7JlonIIYcwy3LWm5V0BKnsFUrIpo3wL
	c3Z0XMKg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54524)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4byv-000000000Fk-2JZx;
	Mon, 23 Mar 2026 09:53:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4byt-000000003w1-0vsp;
	Mon, 23 Mar 2026 09:53:55 +0000
Date: Mon, 23 Mar 2026 09:53:55 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] net: stmmac: imx: Disable EEE
Message-ID: <acENs-IoUZwz-Wdl@shell.armlinux.org.uk>
References: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
 <20260323093933.1785583-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323093933.1785583-3-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025410_093292_54DCA673 
X-CRM114-Status: GOOD (  15.21  )
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

On Mon, Mar 23, 2026 at 11:39:33AM +0200, Laurent Pinchart wrote:
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

