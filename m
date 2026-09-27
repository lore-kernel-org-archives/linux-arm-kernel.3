Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E48C98338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 22:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRCO1hCvm+HcqUF0cIAAS7cPIp9rv+bSF/z0y9cWaHQ=; b=1dyjffkMULxrFd5JBl8/az8jyN
	MPz8j6v0YdMrupnHBHsIn3dskf3S5qdnuog5OjqqXiP5F5ZBAtWPEN89bckvWJxlCISsB1MEuXdbq
	Gcm54wwV+4EGPb9bPYzmcEUeAu+fIpRNaiBlRjXGHUaUaHwIEZNzllMsF6MF+jm/SrlS2De9djYBG
	FUzdgDbCsdQJD6DKMTg8UYuLGCk27CXkfJO/eu29b/akrvVydjx9Sz7/IYo+jiTidj5PWS653o3QV
	nFhUK6Bj6c8Js98SZ5jwGlMiYiGY+j607DHMWpi7NvVamingJcMxRPjQ3B3gEUX7fBMTp36ensPyq
	QWwluznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwjt-0000000GuJO-2F5Y;
	Sun, 27 Sep 2026 21:48:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwjr-0000000GuIt-0YeD;
	Sun, 27 Sep 2026 21:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uRCO1hCvm+HcqUF0cIAAS7cPIp9rv+bSF/z0y9cWaHQ=; b=Oef4GSQIwPZhqB72EoCeNbmCAq
	irFkql9KZPdDbyxsCkLuIvvPTBcEDaProqDUuRc/XEMrrz43SR/x9RNcawsFv2BRBxChM/DczMi4e
	EmNeU5/fV2D+Jcox6GfO+YtEQV7awuKJOQKbUjo9CPeqGOjyKYGTnwRPtOm6g2+qRdFY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xAwjU-007ZW8-Q9; Sun, 27 Sep 2026 23:48:28 +0200
Date: Sun, 27 Sep 2026 23:48:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
Message-ID: <f4fb3c02-34ec-4ce4-8abe-d85e1d09cb5c@lunn.ch>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
 <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
 <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab97c6e.f5ac67e6.37e70.11e5@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_144851_177375_D82B68BB 
X-CRM114-Status: GOOD (  26.24  )
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

On Sun, Sep 27, 2026 at 10:28:25PM +0200, Christian Marangi wrote:
> On Sun, Sep 27, 2026 at 09:02:09PM +0200, Andrew Lunn wrote:
> > On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> > > In preparation of support of DSA Switch from Airoha, create a mt7530
> > > library module and move there all the common function.
> > > 
> > > Function are generalized to use the reg_field regmap API but still apply
> > > the same exact logic. Every function is renamed to mt7530_lib prefix to
> > > better identify it.
> > > 
> > > Minimum modification are needed to the register header and common enum and
> > > macro are moved to the mt7530 library header to permit reuse.
> > > 
> > > A library struct is introduced with everything required for the common
> > > functions.
> > > 
> > > The generalization and the introduction of reg_field regmap API have the
> > > side effect of permitting to clean the mirror functions that required
> > > special handling for MT7530 and MT7531 based switch that had different
> > > registers. This is done by declaring a common MT7530 reg_field and a
> > > specific one in the Switch match table.
> > > 
> > > No behaviour change is expected by this change as it's just a code move and
> > > reimplementation.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/net/dsa/Kconfig       |    4 +
> > >  drivers/net/dsa/Makefile      |    1 +
> > >  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
> > >  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
> > >  drivers/net/dsa/mt7530-mdio.c |    4 +
> > >  drivers/net/dsa/mt7530-mmio.c |    4 +
> > >  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
> > >  drivers/net/dsa/mt7530.h      |  256 ++----
> > 
> > The number of mt* file keep going up. Is it time to move it into a
> > subdirectory?
> 
> The problem as always is that mediatek directory will also contain airoha
> stuff...

That is only a Marketing problem, and Mainline generally ignores
marketing. Companies get bought and sold all the time. We don't rename
anything because of that.

> I would like to fix some trivial things pointed out by sashiko. Can I apply
> those and keep the review tag? For this patch for example it's just the
> typo for the multicast MIB.
> 
> For the other patch is also very trivial stuff. 

Yes, not a problem. If you make major changes then drop it, but
trivial stuff is fine.

	Andrew

