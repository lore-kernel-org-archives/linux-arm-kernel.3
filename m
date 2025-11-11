Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 03:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0r//aGWrlmi6Dku4SGylGdOm8j4QEiQNTC0qV/wOxJc=; b=0wc1rHlwgqJSF8+OK9fz2EWdoq
	WnGUGUg80X8DcbaoSmvz9En6+Ho2Y7W+8WCE7PfUkeTgUpNARmWmFA9oWWeSipiUFY5vEbwfO8h7b
	v1XoTZmR68DaTOrTsYzxNnvn88JPdIZK451iuibtj7XYazVUhgxIbPNhGeHgMEyd6hA+eFTy015Ee
	t6DpBXlA302hZiQ9+dIctIH0TggAO3kyRBGNv8525z0pilLwW0era/ohf27Lu5obLWcLEnNRr+IBW
	ARDKFalJjJ/Nm7HKJQM6Fhm6URvNp49JtSe+EO8OLp5tQOMjGL/oz/kKnbjV1+DTpwIhc+RrsIsrs
	my9g6LsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfCm-00000006Rv6-29QL;
	Tue, 11 Nov 2025 03:38:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfCk-00000006Ruk-3Szk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 03:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0r//aGWrlmi6Dku4SGylGdOm8j4QEiQNTC0qV/wOxJc=; b=dn0WswuuraMNIHUtJcky8SsfHD
	lYIF25aVVaICooOnwK6+1PhUjbAamJyARyDAbXGu23yIu3Ji7VCSMdoZoeArPgiHPP2RbbwUC4nnH
	QFDYH0MFaWvFlkZznzTej00KZ9EL9ucvBHfCt8FyHwRAH9hk+DJELfuWxhdzwBv2b7W8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfCf-00DaPh-BJ; Tue, 11 Nov 2025 04:37:57 +0100
Date: Tue, 11 Nov 2025 04:37:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <71c1c7a9-db8b-4efe-94fe-0f7f9ef00840@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_193802_894178_332FF1D7 
X-CRM114-Status: GOOD (  18.99  )
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

On Thu, Nov 06, 2025 at 10:47:27AM +0100, Maxime Chevallier wrote:
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
> 
> These mediums are set in the net/ethtool/common.c lookup table that
> maintains a list of all linkmodes with their number of lanes, medium,
> encoding, speed and duplex.
> 
> One notable exception to this is 100M BaseT Ethernet. 100BaseTX is a
> 2-lanes protocol but it will also work on 4-lanes cables, so the lookup
> table contains 2 sets of lane numbers, indicating the min number of lanes
> for a protocol to work and the "nominal" number of lanes as well.
> 
> Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
> the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
> macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
> .mediums bitfield with all appropriate mediums.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

