Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpKQBpchK3a2sxtbJ+PPBE6TQGmnk2auepVRoSpN+HI=; b=NGhExD5gM6SLfSqImTfNSFm+Rh
	i5/RvoLM9KzxmTuqpVlP8atICRH1ob89MJZjvYugNrZxXmSZwxFANvDesORswL/ao66iIY04M/2Px
	JSi9eSdVA9MAZ11LjiaTt28L8SLiFjWUml3zVDdZNCYRoIifu7pHqJzmYG4BEj1IoAtygVGdhGHwN
	SNUfx+okoSh3S0X5L9Npvk6kzyhC62/iEc1aQyHB+KGqdhjFgKuz1EhV3JiINpK52EetV9XCcq8v5
	eWzhCJwnPWcS1Xkjdgxw0NoNlboVYecvIUVGbCPHlVUSgZ5BGOBsH20cLYqSugHuoRij+IqOfJZtv
	X7GCFFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Sz-0000000FXzY-0BhN;
	Tue, 07 Jul 2026 17:20:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9Su-0000000FXyQ-42HY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:20:16 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707172006euoutp0144a058bd3a32ea0aeac31c1fee05e4ff~AEZo5giVv1580115801euoutp01O
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:20:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707172006euoutp0144a058bd3a32ea0aeac31c1fee05e4ff~AEZo5giVv1580115801euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783444806;
	bh=QpKQBpchK3a2sxtbJ+PPBE6TQGmnk2auepVRoSpN+HI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Azih6pt7xspBi5zObnoHYr9Rk3f+x8nEtqKrALTiBhsv+GkLgmMg1tnMwBOgIb5o3
	 fvMLB/qlt066HDdEIejiQSooyXTbJA7G9VEk/+RDp+yNKY2DXFmtdAfdXSCJxKH6FZ
	 FSd029pA5EK/dpy4qs2EerBqm84WZeWRdX5E4vy4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805~AEZoOc2XK2332823328eucas1p2h;
	Tue,  7 Jul 2026 17:20:05 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707172005eusmtip17abedc7f5d1d10048fed1712e887393a~AEZniO6pP0262802628eusmtip1S;
	Tue,  7 Jul 2026 17:20:05 +0000 (GMT)
Date: Tue, 7 Jul 2026 19:20:01 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Stefan Agner <stefan@agner.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Ovidiu Panait
	<ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net] net: stmmac: resume PHY before reopening the
 interface on MTU change
Message-ID: <ak01QZhCKkq2FM33@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707162146.73823-1-stefan@agner.ch>
X-CMS-MailID: 20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_12e94a_"
X-RootMTR: 20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805
X-EPHeader: CA
X-CMS-RootMailID: 20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805
References: <20260707162146.73823-1-stefan@agner.ch>
	<CGME20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_102013_468185_38888970 
X-CRM114-Status: GOOD (  14.18  )
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

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_12e94a_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 06:21:46PM +0200, Stefan Agner wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5884,6 +5884,15 @@
>  
>  		__stmmac_release(dev);
>  
> +		/* phylink_stop() in __stmmac_release() suspends the PHY.
> +		 * IEEE 802.3 allows PHYs to stop their receive clock while
> +		 * powered down, but the DMA software reset performed by
> +		 * stmmac_hw_setup() requires a running receive clock.
> +		 * Resume the PHY, as on system resume, to ensure its clocks
> +		 * are running before reopening the interface.
> +		 */
> +		phylink_prepare_resume(priv->phylink);

Does it work without warnings? Nothing in dmesg?
phylink_prepare_resume() does have ASSERT_RTNL() which is not called anywhere.

BR
Jakub Raczynski

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_12e94a_
Content-Type: text/plain; charset="utf-8"


------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_12e94a_--

