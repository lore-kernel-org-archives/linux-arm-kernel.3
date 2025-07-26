Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61666C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 19:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw/7c/a8OLgnYaUzTv8cMEI87YfbQ4Gsk3r35pIOJiM=; b=VHnYCrpm8Gp0QbWTvLxN1+Wgkz
	2bCfRCgcFPDq/LX6eDXk85qakyQ1G29EFBsQe6zFju+mqDXJar9tJ2q+A7vSAHO5R4lmwI5CTJulO
	6JKjWzdcls1C6uxDFw/V8bSFhXvOdbGlCGRPNHlhDP6sKb/gpg+u9DmmxWolV6aTZL/DWKE+JRLQp
	o7dbSnxBmbCvMh5Wp67VE6dr1e63jAhdGkp9sL2dRyMmBTZfneaO3msq1iAXhzN5C226T/foAIAu8
	rHUNzLd/l5VaCw860fVDC+gfQ1Kp0fWFBXvZiZOWeBl6AsjXUxjQPfpjjZT+ywKMQQLHaUeAEVjes
	zHRboCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufkw3-0000000Bo02-1ot9;
	Sat, 26 Jul 2025 19:51:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufktV-0000000Bnn0-0IFy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 19:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Aw/7c/a8OLgnYaUzTv8cMEI87YfbQ4Gsk3r35pIOJiM=; b=anaOAwDt1I8LYFAqXfsid+9XKN
	Mj/q33Ncdq3RzPp6/vCLe2Sfkq8FB34u1PU/gKhrJySj7Gs/jEcsHafcFPUc2oikf4AWQjXRSFFbc
	KepNVxDcikkuwBx5S47LHPcaBW35fqjZUKytZblg1Tj5pOTsxtuVW1FMuiFC816c+kAU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufktH-002xhZ-RG; Sat, 26 Jul 2025 21:49:07 +0200
Date: Sat, 26 Jul 2025 21:49:07 +0200
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
Subject: Re: [PATCH net-next v10 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <8d0029bc-74b7-44bc-ae0b-606d5fd2d7c3@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_124921_124834_5FD8839B 
X-CRM114-Status: UNSURE (   9.40  )
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

>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).

> +            mdi {
> +                connector-0 {
> +                    lanes = <2>;
> +                    media = "BaseT";

This is correct when the port is Fast Ethernet. However, as you point
out, now a days, the more normal case is 1G, with 4 lanes for BaseT.
To avoid developers just copy/pasting without engaging brain, maybe
add a comment about it being a Fast Ethernet port?

	Andrew

