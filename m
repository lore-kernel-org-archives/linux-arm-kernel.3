Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4291C55174
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 23:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWg4/vazTsGxm7MjgMLKjfveUvNnWZH6aqxiwnp7eGk=; b=3K0Njw/hMAPIAZelPq4ycSCFZc
	i8wWgXXUIikRGVefM8aeOskW7VEOJtXis1Nv/Meqarr5FdUZ2XcFnOd8HLdAX3wVnu008DyoABc07
	1UEAXl+t+ODU/vfSoaCksiQitgDfoEq4pvfydPN3BpYoJ/FJg0N+iF4UYE/OJoNCDYNajjq+fTEia
	GfDNc4ZwaM8ckmy1zwM0LTK5AEua3kEzyPSEh3CfkbGjaKUgywlCLlxga/3l8nPRA54ejjesu7qqI
	IJP7YQQW485J8qG6KCdv6uLFAm2BGTvtKsnaJnYOoLtaCNtz00TWA4qLn4Gx1KKaTzG19Ad/3ulY4
	0415Z5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfPz-0000000G779-18SK;
	Sun, 02 Aug 2026 23:16:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqfPv-0000000G76W-3t4w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 23:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aWg4/vazTsGxm7MjgMLKjfveUvNnWZH6aqxiwnp7eGk=; b=Lzfh8r0a6LlxU/U2aPQug+b7m2
	iTJnmEJNDi2kQiMVPI88eu8xpLbqOKdBdpgjcCWA+xSkBfHpYGOPKZIEtE2QwcahmWekuP9zrVx3o
	qTI805nazCo7JlVNBcgWPjdel4pHxY9gFixZXWbD/RXsWt304s9BQInXI+5OBr/FWxpc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wqfPZ-00FcrB-EB; Mon, 03 Aug 2026 01:16:05 +0200
Date: Mon, 3 Aug 2026 01:16:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: ethtool: Address off-by-one
 when reading the coal rx-usecs
Message-ID: <1a4b6a74-de10-4d77-aa84-b32bae36daef@lunn.ch>
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
 <20260802114015.214212-3-maxime.chevallier@bootlin.com>
 <4e76d7c1-0052-4689-be7c-9c31dc24516a@lunn.ch>
 <5f2f0e3c-cc4e-4110-ad4c-180abba5356d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f2f0e3c-cc4e-4110-ad4c-180abba5356d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_161627_963816_DBAF3BDA 
X-CRM114-Status: GOOD (  12.51  )
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

On Sun, Aug 02, 2026 at 10:29:22PM +0200, Maxime Chevallier wrote:
> Hi Andrew,
> 
> On 8/2/26 17:05, Andrew Lunn wrote:
> >> This does change the boundaries of accepted rx-usecs parameters, as the
> >> previously accepted values were in the 16-246 us range, and now fall
> >> into the 15-245 range on imx8mp.
> > 
> > With this change in place, what happens when trying to set 246?
> > EINVAL?
> 
> Yes indeed :
> 
> # ethtool -C eth1 rx-usecs 246
> netlink error: Invalid argument

I guess nobody will report a regression, but if they do, we can map
246 to 245. But until somebody does report it:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

