Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D695E6BF17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZzYYZ47MhM5DbXuBFYv+5+5v+vkghMIaO5mgHVitCI=; b=RfrWFpiiBbZifn5p4zsnHaBOnX
	MDq55BC4qFRjyaNKCLKYvy0+IJeMIhrSZCE9Kglb7Xjx6RmDAfvsB75dqu1sA0YfOkZCawnzVjYHK
	TAiiDTnkHFk0ErDSRM9lDys6AsqoWqUCclWuKJKhEO+UJncGswExK6RKj1zafdlcecnug2ggrua0E
	4ICWqrGWtrkFUITWaDtEbXpGHjZEFgQbSgdnUik6icAE6To/fjTsBVa8ZJTqvgYdo6ADYf4vyb1R3
	cR2NxbHeS/VKNPHuHvrcHqXmu/pUP65hbsEMyHkx7hbfY1+unJLpET64IgMdHCjVi9+91ZWw3nwSj
	ItuRnj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlppJ-00000001bWB-05WK;
	Fri, 30 Jan 2026 14:50:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlppF-00000001bVj-46Sn;
	Fri, 30 Jan 2026 14:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LZzYYZ47MhM5DbXuBFYv+5+5v+vkghMIaO5mgHVitCI=; b=WH5B80zX3ZnL/qn/O8PYSUOAQF
	/EGSfRNsE7jPycCz+dQZZzZe8SalMBbiZQXiHm4FltNSMewf03zVxDP/jFqYOUFGteKF3Ngv9ZlkX
	iFPNODNPoWnURYUS0Vhowsvpmae3wTfe19CCBUl2nXKX2jr7kMwHDiX5sVud9TSAtW5MiGjMh10pG
	76sp88yzPMDzxq3EWeO0W4PYsh00qKNcAxFD4gkSKRE7vAdrMWHXnzx+56maqPQhpm5ZlcDkkBM4I
	TqTTE7+ISJl9mtxhtXHZeSenO5EvjqZcSafwi0aQu66BUUbABkXv3Dkd8xHMQK889/gg8cyKUkp/c
	RVy6FFaQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35632)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlpp4-000000001Cc-1afO;
	Fri, 30 Jan 2026 14:50:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlpp2-000000000b3-0oEH;
	Fri, 30 Jan 2026 14:50:08 +0000
Date: Fri, 30 Jan 2026 14:50:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, neil.armstrong@linaro.org,
	Simon Horman <horms@kernel.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	Ionut.Vicovan@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXzFH09AeIRawCwU@shell.armlinux.org.uk>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
 <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
 <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
 <CAKfTPtCiJcNOdoddZN5N1dKHXfUJBe0=zeWfZ5uENoXDvbMnpQ@mail.gmail.com>
 <aXtl6eQ8zD_olTdc@shell.armlinux.org.uk>
 <aXtvDn_-pCuKPrnf@vaman>
 <aXtwfj1vqB1cXKFM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXtwfj1vqB1cXKFM@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_065022_022928_8ED1898C 
X-CRM114-Status: GOOD (  33.86  )
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

On Thu, Jan 29, 2026 at 02:36:46PM +0000, Russell King (Oracle) wrote:
> On Thu, Jan 29, 2026 at 08:00:38PM +0530, Vinod Koul wrote:
> > On 29-01-26, 13:51, Russell King (Oracle) wrote:
> > > On Thu, Jan 29, 2026 at 02:36:01PM +0100, Vincent Guittot wrote:
> > > > On Thu, 29 Jan 2026 at 14:23, Russell King (Oracle)
> > > > <linux@armlinux.org.uk> wrote:
> > > > >
> > > > > On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> > > > > > yes, the usual pattern is :
> > > > > > - phy_set_mode_ext()
> > > > > > - then phy_power_on()
> > > > > > but I can add an additional check
> > > > >
> > > > > Please read Documentation/driver-api/phy/phy.rst section "Order of API
> > > > > calls" which suggests phy_set_mode_ext() after phy_power_on().
> > > > 
> > > > Fair enough.
> > > > That being said, all pcie drivers  that use phy_set_mode_ext(), call
> > > > it before phy_power_on()
> > > 
> > > It looks like many ethernet drivers do the same, so I think maybe the
> > > generic PHY documentation is incorrect or misleading, or is expressing
> > > a preference that almost no one follows. Something for the generic PHY
> > > maintainers to look at and/or comment on.
> > 
> > I would feel it makes sense to configure the mode first and then power
> > the phy up. As commented above yes it looks like apart from one tegra
> > driver rest seem to do it this way.
> > 
> > Lets update the documentation
> 
> Please also indicate in the documentation whether changing the submode
> of the serdes (particularly for ethernet) is permitted without doing a
> phy_power_down()..phy_power_up() dance around the phy_set_mode_ext()
> call.

Maybe something like this, which simply alters the documentation to
indicate that phy_set_mode*() is permissible prior to phy_power_on(),
and should be used at that point where drivers know the mode which
will be used.

Leaving the existing phy_set_mode*() in the sequence also indicates
that it's permissible to call this while the PHY is still powered
on.

For drivers such as stmmac, it will be important that details such as
whether phy_est_mode*() can be called with the PHY powered on are
riveted down and not left up to the generic PHY driver author - without
that, generic PHYs basically aren't usable from SoC/platform
independent code, and stmmac has bazillions of platform specific glue
already because of (a) bad code structuring and (b) lack of
generalisation through standardised interfaces that abstract platform
differences.

I want to be able for core stmmac code, or even phylink code (which
is even more platform generic) to be able to make use of generic PHY
stuff, but if the calls that can be made into generic PHY are platform
dependent, that is a blocking issue against that, and makes me question
why we have the generic PHY subsystem... it's not very generic if it
exposes the differences of each implementation to users of its
interfaces.

I think generic PHY has had the idea that its interfaces will only be
used from platform specific code that knows about the behaviour of it's
generic PHY driver, but as can be seen above, this will not remain the
case given that we have hardware designs where the core of the driver
is one vendor's IP that gets re-used across many different platforms,
but the SerDes PHY is one of many other vendor's IP.

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 719a2b3fd2ab..cf73e4fb0951 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -142,6 +142,7 @@ Order of API calls
 
     [devm_][of_]phy_get()
     phy_init()
+    [phy_set_mode[_ext]()]
     phy_power_on()
     [phy_set_mode[_ext]()]
     ...
@@ -154,7 +155,7 @@ but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
 others may use a default mode (typically configured via devicetree or other
 firmware). For compatibility, you should always call this function if you know
-what mode you will be using. Generally, this function should be called after
+what mode you will be using. Generally, this function should be called before
 :c:func:`phy_power_on`, although some PHY drivers may allow it at any time.
 
 Releasing a reference to the PHY

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

