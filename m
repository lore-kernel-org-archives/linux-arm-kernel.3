Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BB3E7FDE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnbZIEEYc7qpXnHl4ZHTwHEJ9GmdouAAJMZTX/GpBdE=; b=bLa2Fvqe/6WYzcEomyRyK+yhFB
	Mu4dH+4JcDwHAe2BkO/d7Yw7W1zW237Vd6H4LmBFzltOuQpCJgTveTFu8TjjZye9oOpjBdIEdICpQ
	xMlplf5oRlRu19zEqXO5WdWmcK8AbAi33bG8D+H19CPZma5dx1T2F22rghQoJbQrMYppgiOtPT3ZX
	mCfkUjSXByEzAbndaEN5rV4atzAXcNMItzP0MVg4t/IWzTZXSw+/5XPwC+6p1iy2lCx/QzkCeWpSo
	DqgsMKY8gMgq7pEPqCPVlk1SorEecb5tZ6tq7oV6WJ6OTFPe5rMs+CjlSTcC5vFk6ELhL7wed7Qjf
	7upgBAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn46c-00000005mU3-2pmv;
	Tue, 03 Feb 2026 00:17:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn46a-00000005mTa-2jWf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cnbZIEEYc7qpXnHl4ZHTwHEJ9GmdouAAJMZTX/GpBdE=; b=VHco1eedf+GGw5ftuQkpadN50P
	7/H8FTN1MGUAxFL0qaQpqSUGBucDqIYDt2U6LLBoiqx7tvKS6VoTTBhrOYlT1RxPCi6HFdsETvIQp
	sXTZAAPd5royUP8fucUiITv0PgZWrzYozcBefdUuZQOxe2GyOcd6r+F67dWJJ3SFiTt1LB02rYw7V
	Pfll0qmBlvzg+6CwkRVObhvX8/S3fYitEX1qZyg0Dq3jn83YD/SjpS9v5OJyj6Us0yPmzm9hhgY8a
	pVqBbhlOEvLVREJxuvD4A86L1kSexJyTYxCFgGMK+cpZoLagFf11xaAlc550PdCWJ+aDfbmBgHihf
	j7NM+9ZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vn46R-000000004UO-08eh;
	Tue, 03 Feb 2026 00:17:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vn46M-000000003qY-46I1;
	Tue, 03 Feb 2026 00:17:07 +0000
Date: Tue, 3 Feb 2026 00:17:06 +0000
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
Message-ID: <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_161720_714539_B8C5B4E2 
X-CRM114-Status: GOOD (  14.90  )
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

On Mon, Feb 02, 2026 at 10:23:45PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> > If not, maybe this patch could be merged to add the flag that disables
> > EEE and I will just send a patch to disable EEE on our platforms as well.
> 
> We still need the flag to disable EEE for platforms where lpi_intr_o is
> logically OR'd with the other interrupts, so there's no way to ignore
> its persistent assertion.

I'll also state that we need both patches, but there's no point pushing
my original patch (to allow EEE to be disabled) unless Laurent is going
to also submit a patch to make use of the flag - the EEE disable and
Laurent's patch needs to be part of a series. We don't merge stuff that
adds facilities that have no users, because that's been proven time and
time again to be a recipe for accumulating cruft.

So, at the moment, "net: stmmac: provide flag to disable EEE" ain't
going anywhere until there's a patch that makes use of the new flag.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

