Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA3C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GWaCWfMGOeVLl+TC602dyEUg8hYPmCqnXlyFHBYtbE=; b=hdR258UUVIa4sBz9Xyec83HQZh
	I/7Kgw1/tNaAeu1e4gMJfPXomsPumw/KpDpkOJq7qSI72zYGlF83xxVNM63ZwttkO6A3qM6TVud0n
	V7ARPfFI1jiySzt2lr+VHUG39YU7aEIjiQKjv7uN0JcPW5RwE+OwwNmcqN7nBDJs2EDeQHITVnX8V
	KoAFn2yzeERAQ0t3Vxne/59TlKdzoZD14z+CJaWRfBP6fu1zy0axu0/P//+5l4bFwqFmoPHg6c9Hz
	5D7TgRDFdIHtX/VWtTsP8kRdk/k4Thyx/zCfEzV1szentZ0IjO4ITPR/MeEXsfuYh7dMJNDCXrr87
	EADTkwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwV1-0000000AhzB-1DpO;
	Mon, 04 Aug 2025 14:49:15 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivgE-0000000Ab5L-23zN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:56:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A67CC44987;
	Mon,  4 Aug 2025 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754315804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3GWaCWfMGOeVLl+TC602dyEUg8hYPmCqnXlyFHBYtbE=;
	b=if8Cno+pLmFsNTLP9iO4kurwuCoJS+SM7SNnUVQRcbIXkBglBAdWaO3TqC/NeSnvZRiz7U
	70SgMt2IDllHWTN9fVAtnCknmWDz4bSfyyHW4fuG+rd2W59h5QTAsBTxNP9QkEPoHYsvTw
	dLwvquxfVQ71NstbxTN+136qyBeoOkzKr7QGRktAlQ2SP2GJ8i+bgSsZs2VkwEoOk6878m
	2cJFd9uJsod2ohNYPYwsq9FqKWCMawJfypBtQ330aSBCgIlnCbtonIBaeVOsloYQxsZ7Vt
	1sZUXqZ8/hBK330il1NmzhQCw75BQpCtRg6zlzqZkYr8W6gMLDXEL+9+KRF/XQ==
Date: Mon, 4 Aug 2025 15:56:41 +0200
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
Subject: Re: [PATCH net-next v10 11/15] net: phy: at803x: Support SFP
 through phy_port interface
Message-ID: <20250804155641.176a64f7@fedora.home>
In-Reply-To: <67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-12-maxime.chevallier@bootlin.com>
	<67dd0a3e-12ac-49ab-aec1-f238db7030e6@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_065646_692191_650A018D 
X-CRM114-Status: GOOD (  23.51  )
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

On Sat, 26 Jul 2025 23:24:36 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Jul 22, 2025 at 02:16:16PM +0200, Maxime Chevallier wrote:
> > Convert the at803x driver to use the generic phylib SFP handling, via a
> > dedicated .attach_port() callback, populating the supported interfaces.
> > 
> > As these devices are limited to 1000BaseX, a workaround is used to also
> > support, in a very limited way, copper modules. This is done by
> > supporting SGMII but limiting it to 1G full duplex (in which case it's
> > somwhat compatible with 1000BaseX).  
> 
> Missing e
> 
> > +static int at8031_attach_port(struct phy_device *phydev, struct phy_port *port)
> >  {  
> 
> ...
> 
> > +	if (!port->is_mii)
> > +		return 0;  
> 
> That seems common to all these drivers? Can it be pulled into the
> core?

If we pull that into the core, we'll need to add specialised
.attach_port() callbacks in phy_driver, such as

	.attach_mii_port() or .attach_serdes_port()
	.attach_mdi_port()

I'm perfectly OK with that though :)

> 
> > -	if (iface == PHY_INTERFACE_MODE_SGMII)
> > -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");  
> 
> I think we need to keep this warning. I don't remember the details,
> but i think this is the kernel saying the hardware is broken, this
> might not work, we will give it a go, but don't blame me if it does
> not work. We need to keep this disclaimer.

Sure thing, looking at it now I'm not sure why I removed that...

I'll add it back,

Maxime

