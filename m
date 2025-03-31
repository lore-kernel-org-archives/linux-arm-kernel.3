Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF4EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeAm+G0R8MwSbWTJUOg8OxTZOg3adOagbUoCj/whS9U=; b=wF77jhipReG2rNofUGaXUbAdAG
	L2Q201SbIlo1kXY5cgKtI1EK8OsQy1eoXU5mwN+ED0u2rExk5txf37x61pZSVb7oR+LRZFCnEYb/m
	W/BzwOY8jqiAMXEmxbG08AL0lA6kOkHDOrP1FI4HQQWKnKrOzANhF6g2vst/+JbtCIkPJ62YJm+q3
	NwZPic+rJrH+F+ZW9ik+dpWY06jNHxr+jYYIEECoOrS2VNbBIqm3hSrMO/fpim+FvNgKQ8wRFALei
	Sj6cangSQmaEta2AtSmWhm1RzYC+e2ur+5N9KBt4DxhcUeioHeS5sHLfSj8lH/G85ME+bdfKAQzNf
	dn69dooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzG18-00000000XXK-2bSp;
	Mon, 31 Mar 2025 14:21:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzFwr-00000000Wo3-0GxA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 14:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=oeAm+G0R8MwSbWTJUOg8OxTZOg3adOagbUoCj/whS9U=; b=jt
	IWmmTkOYvq5tnXXTHiFjP32orY6aWMgPaJ6IiadRAbGsb/eYsHINOrGMDFqPZVYEvagQJ1mXKxPYY
	e4t+nTkrwXHa/ID0YCxKhsLl84AiYph7N+w1w01fE1C26rYmeQf197u18Aa5XlqYgSjYFQfKW8wZZ
	pdsnrwq+1P4/ioA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tzFwk-007aEo-6c; Mon, 31 Mar 2025 16:17:02 +0200
Date: Mon, 31 Mar 2025 16:17:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Simon Horman <horms@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
 <20250307173611.129125-10-maxime.chevallier@bootlin.com>
 <8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
 <20250328090621.2d0b3665@fedora-2.home>
 <CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
 <12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
 <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_071709_100227_D73E90E9 
X-CRM114-Status: GOOD (  29.99  )
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

On Fri, Mar 28, 2025 at 04:26:04PM -0700, Alexander Duyck wrote:
> On Fri, Mar 28, 2025 at 2:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > > Also I am not sure it makes sense to say we can't support multiple
> > > modes on a fixed connection. For example in the case of SerDes links
> > > and the like it isn't unusual to see support for CR/KR advertised at
> > > the same speed on the same link and use the exact same configuration
> > > so a fixed config could support both and advertise both at the same
> > > time if I am not mistaken.
> >
> > Traditionally, fixed link has only supported one mode. The combination
> > of speed and duplex fully describes a base-T link. Even more
> > traditionally, it was implemented as an emulated C22 PHY, using the
> > genphy driver, so limited to just 1G. With multigige PHY we needed to
> > be a bit more flexible, so phylink gained its own fixed link
> > implementation which did not emulate a PHY, just the results of
> > talking to a multigige PHY.
> >
> > But i don't think you are actually talking about a PHY. I think you
> > mean the PCS advertises CR/KR, and you want to emulate a fixed-link
> > PCS? That is a different beast.
> >
> >         Andrew
> 
> A serdes PHY is part of it, but not a traditional twisted pair PHY as
> we are talking about 25R, 50R(50GAUI & LAUI), and 100P interfaces. I
> agree it is a different beast, but are we saying that the fixed-link
> is supposed to be a twisted pair PHY only?

With phylink, the PCS enumerates its capabilities, the PHY enumerates
its capabilities, and the MAC enumerates it capabilities. phylink then
finds the subset which all support.

As i said, historically, fixed_link was used in place of a PHY, since
it emulated a PHY. phylinks implementation of fixed_link is however
different. Can it be used in place of both a PCS and a PHY? I don't
know.

You are pushing the envelope here, and maybe we need to take a step
back and consider what is a fixed link, how does it fit into the MAC,
PCS, PHY model of enumeration? Maybe fixed link should only represent
the PHY and we need a second sort of fixed_link object to represent
the PCS? I don't know?

> In addition one advantage is that it makes it possible to support
> speeds that don't yet have a type in the phy_interface_t, so as I was
> enabling things it allowed some backwards compatibility with older
> kernels.

I don't like the sound of that. I would simply not support the older
kernels, rather than do some hacks.

	 Andrew

