Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85A4D68BE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 19:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn+2cDfRC1yH4NOcw8ysKYN7T3VzTAsD6jJX6tRQuE0=; b=0RuNctQ7i1zJO+as0daG38HVTw
	eyWiZRiNc2ed2MYza0bENNJ4yfkBCK+Op7sxQi9PpflI9JytgDTXQ5Nos8l5UOzIGuGswvqc0ZLMd
	+DVaTwYkj4aUYInpgRxWqNB3W/GQkSST8HrID2+KH09v1R6UwzYhIIijaxhNBZ7Srp6oopuurdyeb
	8j2N0E8AmmMCMMqoBtrf39+RhqWm/FFu8BqKXiYjRVlvReRBQk7W1NrPD89aoFVcwQ2iUco2l+GhB
	hkbQoFsXAUDn8wwn7E5j4BUJWPP+DNoWwgJRqooxdH/fc9h0qRpkXJ+PRZENIysPJZh/nfLco6MMS
	5wRNXBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCOOw-000000066X5-30sd;
	Sat, 16 Nov 2024 19:24:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCOO1-000000066Gp-1BAc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Nov 2024 19:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=dn+2cDfRC1yH4NOcw8ysKYN7T3VzTAsD6jJX6tRQuE0=; b=gdRfOcvTKwxKkLKP+bQtMsvxeP
	Zcxq1PDSbPRXkd6PvRH478+Xa11lrRN3cdrqac8/EN9m0pGru+9CaGqImJwB9y2vem4kTJ9INuRjQ
	3BNTlCTAlH6WrvWOK3XO5BHaKsjGnmQlg/tFjALWn9OFuc6IOvE4cK8R+h+z/XuTo7NM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tCONh-00DXYh-Cb; Sat, 16 Nov 2024 20:22:53 +0100
Date: Sat, 16 Nov 2024 20:22:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115135940.5f898781.parker@finest.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_112313_371552_520BBDA6 
X-CRM114-Status: GOOD (  26.73  )
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

On Fri, Nov 15, 2024 at 01:59:40PM -0500, Parker Newman wrote:
> On Fri, 15 Nov 2024 18:17:07 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> > On 11/15/24 17:31, Parker Newman wrote:
> > > From: Parker Newman <pnewman@connecttech.com>
> > >
> > > Read the iommu stream id from device tree rather than hard coding to mgbe0.
> > > Fixes kernel panics when using mgbe controllers other than mgbe0.
> >
> > It's better to include the full Oops backtrace, possibly decoded.
> >
> 
> Will do, there are many different ones but I can add the most common.
> 
> > > Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.
> >
> > Since this looks like a fix, you should include a suitable 'Fixes' tag
> > here, and specify the 'net' target tree in the subj prefix.
> >
> 
> Sorry I missed the "net" tag.
> 
> The bug has existed since dwmac-tegra.c was added. I can add a Fixes tag but
> in the past I was told they aren't needed in that situation?
> 
> > > @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(mgbe->xpcs))
> > >  		return PTR_ERR(mgbe->xpcs);
> > >
> > > +	/* get controller's stream id from iommu property in device tree */
> > > +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> > > +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> > > +		return -EINVAL;
> > > +	}
> >
> > I *think* it would be better to fallback (possibly with a warning or
> > notice) to the previous default value when the device tree property is
> > not available, to avoid regressions.
> >
> 
> I debated this as well... In theory the iommu must be setup for the
> mgbe controller to work anyways. Doing it this way means the worst case is
> probe() fails and you lose an ethernet port.

New DT properties are always optional. Take the example of a board
only using a single controller. It should happily work. It probably
does not have this property because it is not needed. Your change is
likely to cause a regression on such a board.

Also, is a binding patch needed?

	Andrew

