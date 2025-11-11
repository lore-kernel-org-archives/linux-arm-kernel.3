Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD6CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 03:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4kespPJAX780SRcbkhss/5F3BwJsDQHjd1c+gCxX18=; b=ZyGpckfmrC6HBeEvSyO5bK01sV
	/+x2+KAfJ9l7Zc6tMgju316gijzvOR1pjN9591oK4oIPzVP1RwBQHs0abiLDzTGgImNi/ORnfiRIZ
	00eccRAmemN4Ly/XB+eTiWd0YJ/T5gQDvOL85hobXdV/qXD2WfsrpVzoNBX0N5YlxhxKSehKHeHCy
	qgf+TorThtsaL4Qdh99mef7SvvERXcsUU14WplknPXzVS1UbFfHL6dykjLqgM453D1uHE34uAUBn0
	NA2LtijbTa7PsXnHQIPosWZ1ksV5JO4DYWJgnkjh+YJ27kNMu3fQRL1TVR2iBWsN93mmLiX5nqsNV
	F69ExNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfSG-00000006T2y-00XN;
	Tue, 11 Nov 2025 03:54:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIfSE-00000006T2d-04vZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 03:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h4kespPJAX780SRcbkhss/5F3BwJsDQHjd1c+gCxX18=; b=NdhlIjcYaZoiEC6QhpeYMvI82X
	OLGLdJmjw2jTpUXThEJJqgXr21OzxIYhDvnrnzQe6hvmNvo61GWoQGeaXTcEDL/OwbH9chfIewjaL
	MR+/cSqqChZcvgA1yoNrcqvQpd8swZ6MIcViFz6v5NtbrMtVrvG35X2J9BK70jjIKtZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfS4-00DaTH-Mx; Tue, 11 Nov 2025 04:53:52 +0100
Date: Tue, 11 Nov 2025 04:53:52 +0100
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
Subject: Re: [PATCH net-next v15 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-4-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_195402_063168_BAA1A374 
X-CRM114-Status: GOOD (  13.54  )
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

> +/**
> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> + * @supported: After this call, contains all possible linkmodes on a given medium,
> + *	       and with the given number of lanes, or less.

lanes -> pairs?

> +	/* The PHY driver might have added, removed or set medium/lanes info,
> +	 * so update the port supported accordingly.

lanes -> pairs?

> +struct phy_port *phy_of_parse_port(struct device_node *dn)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> +	enum ethtool_link_medium medium;
> +	struct phy_port *port;
> +	const char *med_str;
> +	u32 pairs = 0, mediums = 0;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "pairs", &pairs);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

I think this needs to come later. It is not critical now, but when we
come to add other medium, it will need moving. If we add say -K, and
need lanes, we don't want to error out here because pairs is missing.

> +	ret = fwnode_property_read_string(fwnode, "media", &med_str);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	medium = ethtool_str_to_medium(med_str);
> +	if (medium == ETHTOOL_LINK_MEDIUM_NONE)
> +		return ERR_PTR(-EINVAL);

> +	if (pairs && medium != ETHTOOL_LINK_MEDIUM_BASET) {
> +		pr_err("pairs property is only compatible with BaseT medium\n");
> +		return ERR_PTR(-EINVAL);
> +	}

This i think needs changing, if medium == ETHTOOL_LINK_MEDIUM_BASET
then get pairs, and validate it. I would probably also test it is 1,
2, or 4.

	Andrew

