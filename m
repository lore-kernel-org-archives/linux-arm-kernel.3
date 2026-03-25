Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDADE109C05B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Di57j/xK/Ly5JGYoBcWWHHq0+OqlE9jenZQR7DPGhU=; b=L0SHHnyqBH4YmpSUGl/M+3wOp7
	2zK3gAOLM0mSh75L/Cj/es6hiyIfdmRVBuu1G7jEiBkWxjsU6vStxWbkJaLyOViyUOpapkzNTVked
	2sb5GLjXEJEStyG8zz0GW3dXMYOpysMSunmN5ahQlS/vcXQP1sEyjZYuKmB9vl5rr7VklSVbZeEXw
	hT/kwYfCXVn0yquPcryCnCZV2HGb0rwD530zzwxnCg3hZImmmBA5XTN+1oxBJe9CcmrAVzlv/y8F3
	mLF4YJs3nySjC0aTHkkL7l3bnRBEetJ+8p5CrOZqC3uohiFs79Kzf9y1qizwpF4FVUH3HPQlsXDNV
	hb8ftI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ubk-00000004CJa-3dSv;
	Wed, 25 Mar 2026 20:13:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ubi-00000004CJ0-1uKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 20:13:39 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 06C8D1BA;
	Wed, 25 Mar 2026 21:12:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774469536;
	bh=7BsRlEHo9DuNRcemqGPBLT932bs5lLCqHzyJZhsZrS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0AC0wLn3Ob992yC9suQRcS93NkYNC9Ll/NgROD2xXR6oqAMCm78nzYvCg2EIY4gF
	 f6Jbp405eKuz1i9nTY0+PS5tHE8c/9RKIHI12Ecp49luwgITLgdzHPvck9js6zRLoy
	 ftEim5hQ4AMyO7uN2YyLcQ2sQLCjZrn+7inbXkvg=
Date: Wed, 25 Mar 2026 22:13:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: netdev@vger.kernel.org
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, imx@lists.linux.dev,
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
Subject: Re: [PATCH v3 1/2] net: stmmac: provide flag to disable EEE
Message-ID: <20260325201332.GA2670326@killaraus.ideasonboard.com>
References: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
 <20260323093933.1785583-2-laurent.pinchart@ideasonboard.com>
 <acEOGMHfYsxv3GOk@shell.armlinux.org.uk>
 <20260323100801.GA1514659@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323100801.GA1514659@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_131338_656866_CC796D08 
X-CRM114-Status: GOOD (  32.07  )
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

On Mon, Mar 23, 2026 at 12:08:02PM +0200, Laurent Pinchart wrote:
> On Mon, Mar 23, 2026 at 09:55:36AM +0000, Russell King (Oracle) wrote:
> > On Mon, Mar 23, 2026 at 11:39:32AM +0200, Laurent Pinchart wrote:
> > > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > > 
> > > Some platforms have problems when EEE is enabled, and thus need a way
> > > to disable stmmac EEE support. Add a flag before the other LPI related
> > > flags which tells stmmac to avoid populating the phylink LPI
> > > capabilities, which causes phylink to call phy_disable_eee() for any
> > > PHY that is attached to the affected phylink instance.
> > > 
> > > iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> > > along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> > > to the receive clock domain, and takes four clock cycles to clear, this
> > > leads to interrupt storms as the interrupt remains asserted for some
> > > time after the LPI control and status register is read.
> > > 
> > > This problem becomes worse when the receive clock from the PHY stops
> > > when the receive path enters LPI state - which means that lpi_intr_o
> > > can not deassert until the clock restarts. Since the LPI state of the
> > > receive path depends on the link partner, this is out of our control.
> > > We could disable RX clock stop at the PHY, but that doesn't get around
> > > the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> > > 
> > > Previously, iMX8MP worked around this by disabling gigabit EEE, but
> > > this is insufficient - the problem is also visible at 100M speeds,
> > > where the receive clock is slower.
> > > 
> > > There is extensive discussion and investigation in the thread linked
> > > below, the result of which is summarised in this commit message.
> > > 
> > > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Closes: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > As you are sending this on my behalf, you need to add your s-o-b after
> > mine:
> 
> Oops, I'm not sure how I missed that. Sorry.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Should I submit a v4, or can this series be picked for v7.1 with my SoB
added ?

> >  Any further SoBs (Signed-off-by:'s) following the author's SoB are from
> >  people handling and transporting the patch, but were not involved in its
> >  development. SoB chains should reflect the **real** route a patch took
> >  as it was propagated to the maintainers and ultimately to Linus, with
> >  the first SoB entry signalling primary authorship of a single author.

-- 
Regards,

Laurent Pinchart

