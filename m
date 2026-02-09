Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4554EE81BC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WZ814WtklkN2HL0wq4j7pdENKt1KinNwm3K1fvraCE=; b=Mj4cw1hDGLdEqRqtyD8CvyoeXD
	Q2eW26l3XelccpRqCMjtYeqwn6LWmUSGYTnIpKNsNdkgXKsxxF2QwZxx+wzLzNfT3WS0kNE41q9Zl
	aeAsAJ3IKnwGuWboOKELTyXjCCdnf7ltgmbf41ICsTATvl2o73xvgsd6aEhsMZcpyNj4Ag3MlmfGO
	VHp1hPrGSGRiMsOdIrRE6XOc4+VIskMgzpa8PH1lGd9PduI26WJWj9gkgBEGxoLgp2NC8vK3207Uk
	T3mWtEUVIBtBR+hDMrJWk2xv5f1aLnWFXYivK3UhRzVlJ1Nffdz2EHVJmK9Qiw2EtUoP/ADnf6EGL
	oyk6ERHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRD0-0000000FQi8-2TeW;
	Mon, 09 Feb 2026 13:21:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRCw-0000000FQgI-46dq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:21:45 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F0DDB454;
	Mon,  9 Feb 2026 14:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770643254;
	bh=7ovSodLbOpn2W27nDVgvF+GU2exE6mG03PG81HU6Tok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ogqu1sL8zkEDDFjyCVDcTsVWUQk2mNJ+aATnmwhyu5XSrwbGmYqwzi/Byk7b6g/qY
	 WbnYgly/qwg8VKu7YgS3AQwulcYhNlyIRgxNR85c44I3bjWOW+aVxEjlgqqxX35z4d
	 +sx/rXQCCwIGjM0wFrZBHnGyM7YNDlE1t4tTV3G0=
Date: Mon, 9 Feb 2026 15:21:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
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
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
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
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] net: stmmac: imx: Disable EEE
Message-ID: <20260209132138.GF2302514@killaraus.ideasonboard.com>
References: <20260208232931.2272237-1-laurent.pinchart@ideasonboard.com>
 <aYndOVkz7AOQK7qr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYndOVkz7AOQK7qr@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_052143_163822_98D8F457 
X-CRM114-Status: GOOD (  21.27  )
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

On Mon, Feb 09, 2026 at 01:12:25PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 09, 2026 at 01:29:31AM +0200, Laurent Pinchart wrote:
> ...
> > Fix the issue by disabling EEE completely on i.MX8MP.
> > 
> > [1] https://lore.kernel.org/all/20251026122905.29028-1-laurent.pinchart@ideasonboard.com/
> > [2] https://lore.kernel.org/all/20251123053518.8478-1-laurent.pinchart@ideasonboard.com/
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch depends on https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> 
> Are you sure? That's the one adding the DT property, not my patch that
> adds the flag you need for this.

Oops, wrong link. I meant

https://lore.kernel.org/all/E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk/

> > @@ -355,7 +354,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
> >  	.addr_width = 34,
> >  	.mac_rgmii_txclk_auto_adj = false,
> >  	.set_intf_mode = imx8mp_set_intf_mode,
> > -	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
> > +	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY
> > +	       | STMMAC_FLAG_EEE_DISABLE,
> 
> I thought we had a coding style comment about wrapping like this
> (operators should be trailing on the previous line, not at the
> beginning of the following line) but I can find nothing in
> Documentation/process/coding-style.rst  Confused. Maybe it's
> somewhere else in the re-organised documentation.

I'll move it at the end of the line, no problem. It's one of those
pieces of coding style where different driver authors and subsystems
have different opinion so I'm never quite sure what to do when
submitting patches for areas of the kernel I don't usually touch. I
should have looked at the rest of the file, sorry about missing it.

-- 
Regards,

Laurent Pinchart

