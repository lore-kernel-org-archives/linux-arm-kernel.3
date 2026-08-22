Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EBC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sM3VSbszbYID+mAi53gO1CTblzm0fmSPiNawdrlLIS4=; b=dry4SXSSFDXlH+B26ECxWs247L
	7mtU6LP8NEGIp9rFmDYW04IorGZs/NqmSlE1N5jL+0fia9Yi8MRC9j9dLRLkopbMrJQ9F48Sz/YAb
	YJIku1uG+QXAnxwlGDYjNOGnX8qTSTIeUoiU9uT5sSezURN6e86JXB3N+5oMjcsD0/Nvm84nGQVvf
	xdJC3nDcearELkGHK/Kg1+/zGKyhrBMQTTtCIHNgUCCgQzWc0aiKfUpl3QcngzvlV1KuLiP9NDIYR
	alqfMPNfGUBbST2/wG6szDZVxZdqgx9wEiPL+smoJ7j38DE4a4uzPXBeOrSnezi3YV82wce9l/f94
	PDQf5VPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrpl-0000000ElKI-2Rix;
	Sat, 22 Aug 2026 19:56:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrpj-0000000ElJv-17XG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 19:56:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sM3VSbszbYID+mAi53gO1CTblzm0fmSPiNawdrlLIS4=; b=AlWzgNpkzHrzt6qn9k58srU/yj
	dLPS9xTGefzUq2gZV1UE4azKRFaGq6n2g8FL0FNoToFSQWwxzyn2ENFXqXgdyk5fYgRa82nKKlj8a
	GrqHR4WSlR4E6QHDCoTXHUygrCdS3F/Sg/lLm0W9cFwzFH46i3bO+j0rMC4AempT6iDs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wxrpW-0013cm-Pa; Sat, 22 Aug 2026 21:56:38 +0200
Date: Sat, 22 Aug 2026 21:56:38 +0200
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
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Subject: Re: [PATCH net] net: stmmac: selftests: Pass the IP proto mask in
 the TC selftest
Message-ID: <c7dcc194-7d30-4ac8-98cc-9d3a25cbc411@lunn.ch>
References: <20260822153245.423259-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822153245.423259-1-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_125651_310352_87768D47 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

On Sat, Aug 22, 2026 at 05:32:43PM +0200, Maxime Chevallier wrote:
> The stmmac TC filtering rules have recently gained sanity checks to make
> sure the passed keys and their respective masks are aligned with the HW
> filtering abilities.
> 
> The stmmac selftests failed to pass the mask in the match data for L4
> filtering tests, and are now failing consistently with -EINVAL :
> 
> $ ethtool -t eth1
> [...]
> 23. L4 DA TCP Filtering          -22
> 24. L4 SA TCP Filtering          -22
> 25. L4 DA UDP Filtering          -22
> 26. L4 SA UDP Filtering          -22
> 
> Let's pass the ip_proto mask in the l4 filtering tests match data. Found
> on imx8mp, which now have passing L4 tests :
> 
> $ ethtool -t eth1
> [...]
> 23. L4 DA TCP Filtering          0
> 24. L4 SA TCP Filtering          0
> 25. L4 DA UDP Filtering          0
> 26. L4 SA UDP Filtering          0
> 
> Fixes: 5536d7c84363 ("net: stmmac: fix l3l4 filter rejecting unsupported offload requests")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

