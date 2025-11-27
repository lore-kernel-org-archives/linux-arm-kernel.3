Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80664CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVdDa+AOG7bxWU39wPpsETVv0gcMopDlgo6rv4+/GLk=; b=4dJan7nFqy9bruT9+iZtCqlIny
	QMgIZ75MRMB0jjFXx9dfXUmPbnhbO7d64YKKZ7AJ8opr6Fs2nV3Q10nnOxGSkeiKgD00Dd0+zXuav
	LCtVn2RyeVf7Wjg+0ADFfQwHAHrPZSJYADB9SxgqCB1ilsysrlDOpQ6cVe0Rp9T8o/GvHZ9l5Yh1s
	xGy5HffzsoNIilW4Q4CnqlI66LGYvmVWDrE4sYfwaWnpzg2iRsayhwgFsw0mAqdLBGPL20Inl0Eo8
	fw4wJGG/c4UkSn+U/CuLlIxNdZoRGlC38ESDuNqCTHaIU78h7XdiT/HOXvPGbnVl1XLsEQal02Uj1
	tM7f8IVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgKP-0000000H2d6-2LY3;
	Thu, 27 Nov 2025 18:02:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgKM-0000000H2cc-1wc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 18:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yVdDa+AOG7bxWU39wPpsETVv0gcMopDlgo6rv4+/GLk=; b=gvrmCN0Zi73LvKtmWnZsdXwbhE
	VipcmGRjHq0XseALF1uILbX2uMIKqrWTRWnrNc9qcJWUKoAUHIjtVpIkBIkmi8t4LeptiTKkWrxtM
	+dctiqLiZUtvmEkHwbQeoBMFFE+Ocz+TnechLPiolnGtBfMzRXbFNrlQg45T6rjMEx8mE1I7JVTJU
	SFISvjY8LzPKivCBFAgsP+hqJiitfWl3JQKv9U2puBiDBuxCLsH/DT33udPcpZxDVe+R/alQd3H6K
	yA75fj55BGkUmYcI8yavLJ4DTLatLEplEVjk5hqfzfntWnr6BDiVJQjR6s1qO9GTVrmGfdIezJdw+
	mI1+nC1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50158)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOgKB-000000005at-0qZB;
	Thu, 27 Nov 2025 18:02:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOgK5-000000002rM-06I7;
	Thu, 27 Nov 2025 18:02:29 +0000
Date: Thu, 27 Nov 2025 18:02:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v20 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <aSiSNA1PaM5Md8ju@shell.armlinux.org.uk>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127171800.171330-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_100246_504616_4C163364 
X-CRM114-Status: GOOD (  14.11  )
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

On Thu, Nov 27, 2025 at 06:17:45PM +0100, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ pairs (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
> 
>  Other example :
> 
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
> 
> In the case of representing a physical port, only the medium and number
> of pairs should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of
> 1000BaseSX, 1000BaseCX and 1000BaseLX. This was reflected in the mediums
> associated with the 1000BaseX linkmode.

There's more than just those three for 1000BASE-X:
	SX
	LX
	CX
	EX
	BX10 - single fibre strand, single mode, 1310nm and 1490nm over
		10km.

to name a few more. SFP modules don't have a way to indicate EX, but do
have a way to indicate 1000BASE-BX10 (BaseBX10 bit set with the rate
indicating 1000M.)

Also note that 100BASE-T encompasses 100BASE-TX (what we generally see
as fast ethernet), 100BASE-T4, etc. Should we be getting these
descriptions correct as we're introducing this level of detail?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

