Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E6E8B377
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3OCu/vZ0+qnXKwcMUbCErKdVAJ8duvO3nNP8PiJONE=; b=oLVUYSkVrsPlg//Jtm7KoZPLLb
	su0sGdZhjCHrVc2g8VgTCrAB+EIFfVXxo86IzDrLSodNTb5ZCUpAIDKcpUtbwYYmjmQxotlQQxtO/
	gviznf/OL3gq8HNyxQobUbdWR85FGHzjwe5mFupS1I+VWd9HcKTaqN6bICbSQiT6WZAmsMIgP3LLJ
	n3gtPorg5owvLY8Q7dCE8DP6R6WzICHHTMEI5VMCC5sxStsLYQUZOJnwR0CZisepbZgW/yOST8ZGk
	6/CyjggEiMVmBiYYVVAt3oZdT0b5Z9csj/ae29CRNV5vJoezyBj2oJFEvifSlovhyXK3UcP8FAILu
	Rb2BWkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPfL-00000007YJE-1jYG;
	Tue, 03 Feb 2026 23:18:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPfI-00000007YIS-1Z6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:18:37 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27D023A4;
	Wed,  4 Feb 2026 00:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770160672;
	bh=JLvdn8c+w8EK175ZjsQD8328a8YMf7HlLS6KIMPD2J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASL6uVy+l61WXBOcb/BAGP2WpnImm1KBztFatWHrjlPrp5EkvorBDCbcku7zqjwop
	 AS5akvYHIoKc3VE5nO19wH3wf1tj+HSNhtWvqe6bYM5YFz2B25I6JDCCCHR/dV+0at
	 eULHhmqTSHDuz/Eg2ZidnMrO34VtKMJpevIqWB7I=
Date: Wed, 4 Feb 2026 01:18:32 +0200
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
Message-ID: <20260203231832.GB133801@killaraus>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_151836_573698_ED6304EE 
X-CRM114-Status: GOOD (  20.93  )
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

On Tue, Feb 03, 2026 at 12:17:06AM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 02, 2026 at 10:23:45PM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> > > If not, maybe this patch could be merged to add the flag that disables
> > > EEE and I will just send a patch to disable EEE on our platforms as well.
> > 
> > We still need the flag to disable EEE for platforms where lpi_intr_o is
> > logically OR'd with the other interrupts, so there's no way to ignore
> > its persistent assertion.
> 
> I'll also state that we need both patches, but there's no point pushing
> my original patch (to allow EEE to be disabled) unless Laurent is going
> to also submit a patch to make use of the flag - the EEE disable and
> Laurent's patch needs to be part of a series. We don't merge stuff that
> adds facilities that have no users, because that's been proven time and
> time again to be a recipe for accumulating cruft.

Sorry for having dropped the ball on this. Your patch arrived just when
I travelled to Japan for a month, and then it got burried in my inbox.
Now that it has resurfaced, and that an issue that prevented i.MX8MP
from booting with v6.19-rc has been fixed, I'll rebase my kernel and
finally fix that problem.

Once again, thank you for all your help with this issue, you have been
extremely helpful and I'm very grateful.

> So, at the moment, "net: stmmac: provide flag to disable EEE" ain't
> going anywhere until there's a patch that makes use of the new flag.

-- 
Regards,

Laurent Pinchart

