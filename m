Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E96CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev+WYGcskpqGIIHF3ivwDxrnkr+tx39eqoXSZQFeHS4=; b=fiCFX8eZGrKEZZkSTsueXkX8Az
	gHBheq2WS//FKZUhhK4fW1uzmbMIrG54c84bWUSeHBUISHul7UB5yX2NmKkJ+4vhYhoQMUbH5v2Hn
	mHJlgBNdRICvS5nDM7r/hBQcEQ2W6RTacW9Hhs0WMDsrfvTs2wjTSrHAa8QXl3SoKQ9i5wIXuy+nh
	bcxSERHH0DGTxnV7P01sNOSHLFG33xQp/8RlyYNo4N5C0YIlwtByRXEDrjnrXqIfY0WuXAWEUEMSc
	PQpVjEyiUsjLHaJalcNB4wehymliUD/0cBQox+gvmk3IOBwoHPx+OR6fbGNRa3mINmqGXyfwFsoaZ
	V/4XjWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEU9k-00000004LPP-3bTb;
	Thu, 30 Oct 2025 15:01:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEU9h-00000004LOk-1gQJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ev+WYGcskpqGIIHF3ivwDxrnkr+tx39eqoXSZQFeHS4=; b=s7j2QD18Ifk5JJ5i3kDidFZBGP
	1ZSafhgxrWn784jyyT40jnXFTQXSOup0KQKwY0Qo//PIMODPXAD/K0lT2Jo6jU1ML+h1zR92GcqOD
	kXNyTJI+rAUedXLIAnw9SP//oUMikCeIIXltq+lT5vdFqrocJ7jb1+VOe3Zua8Y0+qmg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEU9W-00CWJa-69; Thu, 30 Oct 2025 16:01:26 +0100
Date: Thu, 30 Oct 2025 16:01:26 +0100
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
 <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_080137_462547_343A2A20 
X-CRM114-Status: UNSURE (   9.69  )
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

> So that being said, an option could be to only focus on pairs, only
> for medium = BaseT, and ditch the "lanes" terminology, at least when
> it comes to the DT bindings.
> 
> Does that sound good ?

That sounds reasonable.

In the binding, maybe try to express that we might in the future
extend it. You can do that with conditionals. medium is required.  If
medium = BaseT then pairs is required. That leaves it open, e.g. in
the future we could add medium = BaseKS, and require that has lanes.

	Andrew

