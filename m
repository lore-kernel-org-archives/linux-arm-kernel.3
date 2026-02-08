Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ADFEF06FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIFi9EpRnhwtDIqLczwRt4cw5x9CO68vcVFcvmpAQIQ=; b=v5fHnc4gsD55Vv+6sf+c6Ap/gJ
	g+4ow+7Vgr/EuLGfYiqLVInpE8yS+4KKvH7pcUrVC7oLj0uQBtnI7XggR5nkORARVF5QR+L0tLMQx
	e1MAKsGsfQ0lZVRWBftefOaGd8glNCUgqusGR5EbaCFQg9MhAWY8Ks9NFZLbojxjqfq5IFl5/DemW
	1YZwt62WpG6Ig5nQ/H94nz/GG2r/1jAfUHKSNqwfaE1Wu2CyoAUjCsAl70cpsoxP8uxAoalOfpbxK
	+HUWpsghEaTDiQ0xDmsFcjhMlCUwNNLivLyfuV7VgEKEcAQuzemYX63gkij1GVqnfYNGyi51gnuig
	CuJBpa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpEF1-0000000EZ7K-30Me;
	Sun, 08 Feb 2026 23:30:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpEEz-0000000EZ6r-06mM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 23:30:58 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4B5B582A;
	Mon,  9 Feb 2026 00:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770593410;
	bh=BqBwXlW1DYlKifkNzuD8EgN86/kfJHvciyDW4WXpDPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/R3LPSpkb93wFdSWlOX+/jeCfLOWluI9DhYaiJ+yJSYViQVHcpq2vU/8sQbNM8KW
	 OzgvhCQDj4C29gAhRIz/QUtDJkAZwZ1B0An2C4xXoRtexqrXdGpW4BkrBAeKi/GBLD
	 X7uukJHcWOKAMAPGF88XW8kAiir3KJ3mnbQTR9/M=
Date: Mon, 9 Feb 2026 01:30:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
	Wei Fang <wei.fang@nxp.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
Message-ID: <20260208233054.GA1987960@killaraus.ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
 <20260203231832.GB133801@killaraus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260203231832.GB133801@killaraus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_153057_231131_B3C713EA 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed, Feb 04, 2026 at 01:18:33AM +0200, Laurent Pinchart wrote:
> On Tue, Feb 03, 2026 at 12:17:06AM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 02, 2026 at 10:23:45PM +0000, Russell King (Oracle) wrote:
> > > On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> > > > If not, maybe this patch could be merged to add the flag that disables
> > > > EEE and I will just send a patch to disable EEE on our platforms as well.
> > > 
> > > We still need the flag to disable EEE for platforms where lpi_intr_o is
> > > logically OR'd with the other interrupts, so there's no way to ignore
> > > its persistent assertion.
> > 
> > I'll also state that we need both patches, but there's no point pushing
> > my original patch (to allow EEE to be disabled) unless Laurent is going
> > to also submit a patch to make use of the flag - the EEE disable and
> > Laurent's patch needs to be part of a series. We don't merge stuff that
> > adds facilities that have no users, because that's been proven time and
> > time again to be a recipe for accumulating cruft.
> 
> Sorry for having dropped the ball on this. Your patch arrived just when
> I travelled to Japan for a month, and then it got burried in my inbox.
> Now that it has resurfaced, and that an issue that prevented i.MX8MP
> from booting with v6.19-rc has been fixed, I'll rebase my kernel and
> finally fix that problem.

Done. https://lore.kernel.org/r/20260208232931.2272237-1-laurent.pinchart@ideasonboard.com

> Once again, thank you for all your help with this issue, you have been
> extremely helpful and I'm very grateful.
> 
> > So, at the moment, "net: stmmac: provide flag to disable EEE" ain't
> > going anywhere until there's a patch that makes use of the new flag.

-- 
Regards,

Laurent Pinchart

