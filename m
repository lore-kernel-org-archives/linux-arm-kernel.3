Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF04BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb0h/YsizHuVvnuUp4K2SVvW9N7wx3di/O4XuChoFGg=; b=vI8z2YAwyG4SkCj8/F7rD60lzP
	zq1znylpQWm2d3OfzUAVa8FeQgGGmUW+YBGKSfMTN9667O9yEgJJ89Rn3hEev0PRLUFXyTQY+KTpe
	IV3nnMVSi3iZwbzYl0zqE/GPAdKRf8y7J8urTYh2GJFxgitGfAlpn2S568nxb6H1fJpgk1QaUNGUF
	2nRfwxmZCP9nhUVvE7qe55U2hXzCC9anew4AykM88OpgfLEddiyQLOxM034X9OF5q0EDcmzo+C3IB
	CQwf+WuAuhJYti+EQlEz26gOoYs1D5CHwdX4a8YuwOP2PafZ47/NNz6nKWiEqpCRzmX88xyHK/cab
	TmZ1UQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowSY-00000006tzN-37T9;
	Wed, 29 Jul 2026 05:04:02 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowSU-00000006ty0-2Dv5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:04:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 810B7201D4B;
	Wed, 29 Jul 2026 07:03:54 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wowSQ-001pNA-1L;
	Wed, 29 Jul 2026 07:03:54 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wowSQ-0000000CKiD-1CKm;
	Wed, 29 Jul 2026 07:03:54 +0200
Date: Wed, 29 Jul 2026 07:03:54 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Zxyan Zhu <zxyan0222@gmail.com>, thomas.petazzoni@bootlin.com,
	Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: Don't rely on the PHY for
 flow-control testing
Message-ID: <ammJus9isvL5M-Lx@pengutronix.de>
References: <20260728155728.1193169-1-maxime.chevallier@bootlin.com>
 <20260728155728.1193169-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728155728.1193169-3-maxime.chevallier@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_220358_724645_03807CDB 
X-CRM114-Status: GOOD (  18.34  )
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

On Tue, Jul 28, 2026 at 05:57:27PM +0200, Maxime Chevallier wrote:
> For flow-control testing in loopback mode, we don't need to ask what the
> PHY is currently using as pause/asym settings. The PHY is no longer
> involved in selftest, we rely strictly on MAC loopback. We therefore

In case of the Full-Duplex, Link-wide PAUSE (IEEE 802.3 Annex 31B),
the PHY is not involved in actual flow control. PHY role is limited only
to autoneg part - announce own and receive link partners caps.

With this reasoning this patch will have more weight, i guess :)

> only need to know if the MAC supports Symmetric pause for the test, as
> we exercise both TX and RX pause support in the selftest.
> 
> Remove phydev requirement for flowcontrol selftest as well as the
> AsymPause requirement.

This is currently the weak point of generic and stmmac selftests,
we actually need to force the link in some specific state.

On the PHY side we would need to enabled force link mode (disable
autoneg) and bypass link-up status (PHY may still signal link down)

> With that, we can also drop the linux/phy.h include.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Otherwise, LGTM:
Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

