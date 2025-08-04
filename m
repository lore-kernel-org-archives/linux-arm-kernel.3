Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CACC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vK03/ClP3Z1gJdh/kyt8u3OXDFk4NFNUdrwFRyRxZZQ=; b=ilBJ+z1umW9g7phNZ7mzXGuZyq
	WJ/VUkMzmBfkw4h7wBTdENRsij/8Qon4evHSwfy7x06QM0XF9Nc59M4z1jmOJ+d7aqp/3TcqyKRqk
	VCznCGxIB3rjHu76/S6xuDJpbHojSc0KuadTwo8sBXA0tXTtTavyoyE27RA0TYr+Vb6xn9EWpyCWo
	+eWNaVW7WjcIiVT4Cu5KaRDLnMmEBXkQ1W/oSVnz4c122KYIj5fAVLrbTicgw6Zrf9aymZixLxUsx
	/EqySz+DYSSbCJG8hxcIPDt6mwrRISMUVydf5FePQznYTU4NS43Yxr2KO3d4wyzHFIZFRZ9b7loNK
	cG7mvIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwSV-0000000AhoP-2BRb;
	Mon, 04 Aug 2025 14:46:39 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivdI-0000000Aarv-0OiB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:53:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88439438D2;
	Mon,  4 Aug 2025 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vK03/ClP3Z1gJdh/kyt8u3OXDFk4NFNUdrwFRyRxZZQ=;
	b=H7Ys0e/Y9qB93J31DMjdL6CVpmejuWfKnqIYDFFM/51zT1PsPsdPIiRsXYwVGKJDMXPesD
	DnQrJs1TiwGoQA2q5IcYOaHe0XQuRI7lSiyx0JWVL6NqtLvpyU2dPBBvGRpImVu4D+vjzA
	ydoGpHtb4lD9vqSQ/TVG7SbWHRc395TrZNCgNlxv7mrrVJwT8OYQbRYiPKewh0orJ8UNhx
	YgW/9HyUPP0VVuVkd48W2S00XUUhMAp9chYG25BiHGqjQT2YXcDu9RTd/nImFDCjcXrVJT
	Gk85eps7Z7Jxa96ejGV5w6+QHjrd1YT5soXryUYxdQdiTxBka9h+a3M+Yc3qMw==
Date: Mon, 4 Aug 2025 15:53:39 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 10/15] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <20250804155339.1131365f@fedora.home>
In-Reply-To: <b6498944-0d06-459f-9668-26813f037166@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-11-maxime.chevallier@bootlin.com>
	<b6498944-0d06-459f-9668-26813f037166@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_065344_282440_90BF2172 
X-CRM114-Status: GOOD (  13.97  )
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

On Sat, 26 Jul 2025 23:17:11 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +	} else if (port->not_described) {
> > +		/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
> > +		 * of them going to an SFP and the other one to a RJ45
> > +		 * connector. If we don't have any representation for the port
> > +		 * in DT, and we are dealing with a non-SFP port, then we
> > +		 * mask the port's capabilities to report BaseT-only modes
> > +		 */
> > +		port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> > +
> > +		phy_port_filter_supported(port);  
> 
> That seems a little bit error prone. Maybe add a helper to set
> port->mediums, which also makes the phy_port_filter_supported() call?

Good point, as this will always have to be done in similar situations
for other drivers.

I'll add that, thanks !

Maxime

