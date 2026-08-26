Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA94C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAjODtpQqyueJbvp6Fq4/45DZn9lRL9ZRH+sAfq2788=; b=jc7m/gLJrLfiHdLS+eHN9GLX63
	3DJAjz0EK/5UnDOJBJoqOE2RnIqeqfEzG0BH9z+ob9e4I1jRooYrWUPudBvYHayOStSCIuUUTjYcz
	6aDIwmaBakKyCaqhwviT6Iyv2tYz2DCJ2Zs0TuDckDaK6lrKqPmjgKWMMy3Y882tRhZxRv18gyIg3
	fDKeosFlr00R9/YSZWdQxjNZRoeFWPAQ1SazpCBdGpy2dSYRfTLQ7FpxXs/+X42HQVHSgpZVawwuu
	428mHWPtm/LoB7Ie2D4npCryy8eyaZPneGETQ98rMElA/GjSNfIqfilXf9nTzZFYsONUCbQFzAHaX
	6lmpMtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHDm-00000002nf3-24s6;
	Wed, 26 Aug 2026 17:15:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHDk-00000002nea-0imA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=pAjODtpQqyueJbvp6Fq4/45DZn9lRL9ZRH+sAfq2788=; b=phZDpajStQl/ZW14WG+hCFWE8R
	zr+Bd88VPCP8uUTag9XQ/e3W0xqSQov70rgBgfjtdvbM4LSYAH8Udh8P+7/EWhSTfTpXLu5//SRMB
	ad2B5G6D8H/2lI6SfDA/D+728CfVIEXuxF1b+wUEH3776mhh6sC9BTOM6DgDQB7wUy3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wzHDC-001Y3I-2I; Wed, 26 Aug 2026 19:14:54 +0200
Date: Wed, 26 Aug 2026 19:14:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net 1/6] net: stmmac: selftests: Check multiple MMC
 counters
Message-ID: <3d6e75eb-be26-47a2-96de-d29c0b634bfc@lunn.ch>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
 <20260826140500.616466-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826140500.616466-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_101528_242356_9A53C5B1 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Aug 26, 2026 at 04:04:53PM +0200, Maxime Chevallier wrote:
> The MMC counters report MAC statistics. Multiple counters can be
> enabled when the IP is integrated, however there's no way to know
> exactly which ones. Un-implemented counters seem to report 0.
> 
> It was found that on StarFive JH7110 and Amlogic SM1, the counter that's
> used by the selftest (mmc_tx_framecount_g) isn't implemented, triggering
> an MMC selftest failure.
> 
> Both the above SoCs seem to implement mmc_rx_framecount_gb, let's use
> this counter as well for MMC counter validation.
> 
> Note that this doesn't guarantee that we won't encounter the same issue
> again if another IP implements yet another set of counters that don't
> include that new one.
> 
> If the game of whack-a-mole with implemented counters becomes too hard to
> maintain, we may simply consider removing the MMC selftest entirely.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Seems sensible.

If more moles need whacking, we could consider the value of 0 as
success.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

