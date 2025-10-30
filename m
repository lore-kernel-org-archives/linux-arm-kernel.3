Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CB8CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0Y78kjdZB9qurE4MI+T/bMh3arrMfi+mi377H2n21A=; b=vAbjK2y1sDrZZAFpvziBpNyN46
	dAGRy3IMjBDm9eH32YlU+L0jBC8y/11yN6HDvBqq6Clka6EZRlMaGcYTJMAbQPWVh81UEFRfv0/p9
	7hDIfSoYr54y0M8s+GgymwUgDcwTK0GfTHhZUguIJSNndRy3xCriAA08oloIXQOp8LVfOogQSPW4o
	Pl5q/01Gh6Qcn1aeGFXRMatwTKAF3d4v14XMTLaEie40rh1kW9QSRRDf6Co6dODmi2K21pPHpb4AP
	sTNPgy/CL+U0MrGiPzWd6M9M4ibxXmWCVqskD8qAczUaOSB26dO1+FvnWoiVpxcfioXoMoIWFGutx
	pFZ9qyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESdR-00000004CEs-2tbx;
	Thu, 30 Oct 2025 13:24:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESdO-00000004CEO-3CQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 13:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r0Y78kjdZB9qurE4MI+T/bMh3arrMfi+mi377H2n21A=; b=mxWg7ClHfEhUgZHomS6qMqLvp9
	6ISViMZNpFt3HbNMjk9qghTjF2k4C4AXKtzrhaSuDVol3/fCO7yeYt7Zcdq/G3OBtG38CpzIcAWSe
	bzUDf/Awohi+40E83mPY+KCLaVzZQ/YqLi2dPog9b+fLbn1F9K016vIidzE2A9aInk30=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vESd7-00CVeI-OG; Thu, 30 Oct 2025 14:23:53 +0100
Date: Thu, 30 Oct 2025 14:23:53 +0100
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
Message-ID: <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_062410_825210_EBCCD369 
X-CRM114-Status: GOOD (  18.56  )
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

On Thu, Oct 30, 2025 at 01:13:14PM +0100, Maxime Chevallier wrote:
> Hi,
> 
> > @@ -313,5 +324,12 @@ examples:
> >                      default-state = "keep";
> >                  };
> >              };
> > +            /* Fast Ethernet port, with only 2 pairs wired */
> > +            mdi {
> > +                connector-0 {
> > +                    lanes = <2>;
> > +                    media = "BaseT";
> > +                };
> > +            };
> >          };
> >      };
> 
> As Andrew suggest clearly differentiating "lanes" and "pairs", do we
> want this difference to also affect the binding ?
> 
> I still think "lanes" makes some level of sense here, but at least
> the doc will need updating.

How do you define MDI?

For copper, one possibility is an RJ-45 plug/socket, and you have
twisted pairs, 2 or 4 of them.

Some people are old enough to remember 10Base2, using a coaxial cable
and BNC connectors. Would you consider that a pair? A lane?

How about an SFF, a soldered down module. Its MDI interface is likely
to be 2 fibre strands. But consider so called bidi modules, which use
one fibre, and two different wavelengths of light.

Or an SFP, where you have no idea what the MDI is until you plug it in
and read the EEPROM.

Do we need to be able to describe all the different MDI? Do we maybe
need to look at the media property to decide it is an RJ-45 connector
so there should be a pairs property? Or the media is -KS, so there
should be a lanes property for the number of PCS lanes on the PCB?

This needs further discussion, what are you actually trying to
represent here?

	Andrew

