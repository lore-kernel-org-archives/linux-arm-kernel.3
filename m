Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F424CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ya793UL1t6ZXjE9Jutk32ViGQVOdRhEUj5I2c8rJ+v4=; b=wzdWwI3ofEQBTH1tzs2aAz+q5w
	G8JRV6t4TbIMw/F4GvmfCoO7b/d4Na9f9QzywBXoCikuBTOJ56DAhoryWnrO/G1H6Sx5BmLmjjfvy
	/1SLPLyWlie7zYLyIguKKUbfJpGGaYwXlZn3ICkPS+uEtgiwj+EycMG99kDTOlXv6m6byWlfnHzqP
	Zhc45HsdCbVAIXAJBk534RZLLYxT0nmKQakeq8fDPu0xWpjkqsWMfoO52/QDi814GMxVzSwe5Fn2S
	8GPf6rP7cj3IZhLPU4dS00QuKFgyIWgIIQFxxpqKTTHGd7Hl7VbQvUPEnh2CVk5TknIDxEGFAYxhM
	W3vGm3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdhg-0000000GpfJ-34wq;
	Thu, 27 Nov 2025 15:14:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdhd-0000000Gpei-3yNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ya793UL1t6ZXjE9Jutk32ViGQVOdRhEUj5I2c8rJ+v4=; b=o1345l8GjSsxF78GHz7VRDhwD1
	i+YJDPWDThMyKLUKfRMesM4wz2zGO72lbjlX2BvFQnTNn5+bk0uc47aPcECfvoTw6gCPxHfk/Tl25
	h/mlFmhSLc9mhY2J/TIrMSYfD4RyLMHyeTUHWejYNVFhfy/50Z8NSHUzyxxg327j/eKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vOdhS-00FH0H-SV; Thu, 27 Nov 2025 16:14:26 +0100
Date: Thu, 27 Nov 2025 16:14:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <858378a8-263d-473b-8a74-e9cdc8b6e3f6@lunn.ch>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <e4bdc937-04db-421b-bbce-e71f0466672a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4bdc937-04db-421b-bbce-e71f0466672a@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_071437_986720_BA6941FA 
X-CRM114-Status: GOOD (  15.33  )
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

On Thu, Nov 27, 2025 at 09:43:23AM +0100, Maxime Chevallier wrote:
> Hi Jakub,
> 
> On 27/11/2025 04:00, Jakub Kicinski wrote:
> > On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
> >> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
> >>
> >> This v19 has no changes compared to v18, but patch 2 was rebased on top
> >> of the recent 1.6T linkmodes.
> >>
> >> Thanks for everyone's patience and reviews on that work ! Now, the
> >> usual blurb for the series description.
> > 
> > Hopefully we can still make v6.19, but we hooked up Claude Code review
> > to patchwork this week, and it points out some legit issues here :(
> > Some look transient but others are definitely legit, please look thru
> > this:
> > 
> > https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
> 
> Heh this is actually fairly impressive, I'll go through that :)

Always verify what it says. This is still early testing phase, and we
expect it gets things wrong with quite a high probability.

When it does get it wrong, we would appreciate feedback saying what is
wrong. We can then ask the developer to update the rules to try to
prevent the false positive.

	Andrew

