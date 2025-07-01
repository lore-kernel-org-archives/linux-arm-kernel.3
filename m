Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9D5C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUn5Bt/2F8B1PBufrWMzF3aa82tzc2i8GqvMSNj5aH8=; b=n1+n7APU5hROw+rdgkcyouj11r
	+7kwVBfliC8xCRCqmwhjUQC/fCm4QAFONjHIaC2ZLKQmeOJNmnBtmjG8E+1xJ+cESArvlBgw1e2te
	wLKirXv3R1h4VdRGIvNEBoYQQxb6RN6Du8fJtKUUiUm42oa8dViOKcIppVoUkJuHpyQc1L0upoAog
	PugPuKnR2y0sglwKBedSw+jeBUH0b2gXXiD7KItlNK9t7GhUOVgTHDe/4SbHbxEE6li4pHHEGNT8w
	FX4ZIN0p1ILC/xF8MQrulYm+p+ATNjUUi2j3jP71uW1Rhn58FlhVc+V1Utoz5OHb7poCLcIciGiXD
	EdJrCtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc1y-00000005iVC-3uCg;
	Tue, 01 Jul 2025 14:32:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWadP-00000005Qnm-0liS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABCE55C1015;
	Tue,  1 Jul 2025 13:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221F4C4CEEB;
	Tue,  1 Jul 2025 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751374970;
	bh=F/84wrFwoijHU+FufPitkE6z85i1QdM2oq4GmNNuc+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhMQ2Yq+o7XnI05VtPbOaoIlF3tDHhi+binHqry62SGJq8NNmJHGvv9m+EdyYwzR7
	 IahUmrjXhg248tMGQ1OHGRC7N7VmNU/V2007UfApE+MA2EhRPpuKXR7Rt4liEV4c4P
	 JNM702/9rWgab8vLg0hezsMOojEIWvRh55CFXymv+IQrcF3r9J6gW8d+qWTmCjYoov
	 CcXo4C8TxxvPo2Pj0jDPhts3Q8BLjsPMFb100lhTASoBrbgdt1LXD3v3PvbNnPA0ax
	 zgnbXP6KsUZkj98sG0EGz7rXlMJA3DTLO+jbei3nFlFViaQcXohJJP68WqNxEf6uGT
	 8Ls51CrVOOhfg==
Date: Tue, 1 Jul 2025 14:02:43 +0100
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250701130243.GA130037@horms.kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
 <20250630143315.250879-5-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060251_260372_4C453292 
X-CRM114-Status: GOOD (  12.43  )
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

On Mon, Jun 30, 2025 at 04:33:03PM +0200, Maxime Chevallier wrote:

...

> +/**
> + * phy_port_get_type() - get the PORT_* attribut for that port.
> + * @port: The port we want the information from
> + *
> + * Returns: A PORT_XXX value.
> + */
> +int phy_port_get_type(struct phy_port *port)
> +{
> +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)

Hi Maxime,

Should this be:

	if (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASET))

Flagged by Smatch (because ETHTOOL_LINK_MEDIUM_BASET is 0,
so as-is the condition is always false).

> +		return PORT_TP;
> +
> +	if (phy_port_is_fiber(port))
> +		return PORT_FIBRE;
> +
> +	return PORT_OTHER;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_get_type);

...

