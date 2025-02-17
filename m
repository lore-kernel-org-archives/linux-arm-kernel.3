Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20920C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCSw3bmWjwYwuAQWl8doOYDVdqtoYKvVbYaoog5r6cI=; b=fq5kVRnoEONKX9DUDA7Xpw6j3i
	9CukkDA+GtwJmWdK0cVoIHLwnU29p/jDlH2uqa5gf4HKRWjQK+n8xvonennbX+eu/8mM9h8zpzj7t
	N/D3ZcQoMuppKpKYNGgrE/GRkehdnnj5SG3CxiPTP0X9ml9CjR7+poJ52xqqIrUafgzqN3SN/b0mY
	qpNifoOWkGfd5JtvPOCW47KHwVbEeoWG233u/LZ9MTWIP9TY/v/hmreuZfJUx+JHyuAI0DiDgGQ9R
	aHG7erTYVv21AppAw96hyvQFvb+Ew7n84xuCw4QEiLv4doNBd5fCO7jPrVHapiHW3twaI4Mdx6ppN
	BC3cd4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ag-00000004y0H-1yrp;
	Mon, 17 Feb 2025 14:59:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2RH-00000004vW3-3FDN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:49:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64A4A44430;
	Mon, 17 Feb 2025 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739803777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCSw3bmWjwYwuAQWl8doOYDVdqtoYKvVbYaoog5r6cI=;
	b=FuKbJGTPideoR9c6VeuSbGxTWhWv12fvminuJ8DDMWnRMjtEVQxnV/c1g4jtSw+pBHf3A6
	RQBlVhGKexKMWaPV/8ju+UkrJ4fsyEhpPDWgeSW8hNw3tJkQRjPC9cU+sOxOlNvfA/by7C
	h3P+/mW1/rFJ8UnPvJzgZHg52sj3CdJtWQc0TXqfKYgM0+7f+eZZ+hqZV5jTXhMHl06IU3
	Ln8wHc7cu4kdYfBxzCeKT2Wd5Puw1/vFTMCGyOSWgqfOOP2CXY5j0yg5IO3/FFnlK0npwb
	jvf1FZ3mskLOe3QP0WqZIcWoA2+0A9b1MUBCanwxV9yTMgSLsDf+eYpxkyErmA==
Date: Mon, 17 Feb 2025 15:49:34 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 05/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <20250217154934.76ec03e5@fedora.home>
In-Reply-To: <Z7NF6ciz4RHMaGo6@shell.armlinux.org.uk>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-6-maxime.chevallier@bootlin.com>
	<Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
	<20250217092911.772da5d0@fedora.home>
	<Z7NF6ciz4RHMaGo6@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_064940_253760_178E81A6 
X-CRM114-Status: GOOD (  34.33  )
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

On Mon, 17 Feb 2025 14:21:29 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Mon, Feb 17, 2025 at 09:29:11AM +0100, Maxime Chevallier wrote:
> > Hello Russell,
> > 
> > On Sat, 15 Feb 2025 18:57:01 +0000
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> >   
> > > On Thu, Feb 13, 2025 at 11:15:53AM +0100, Maxime Chevallier wrote:  
> > > > Some PHY devices may be used as media-converters to drive SFP ports (for
> > > > example, to allow using SFP when the SoC can only output RGMII). This is
> > > > already supported to some extend by allowing PHY drivers to registers
> > > > themselves as being SFP upstream.
> > > > 
> > > > However, the logic to drive the SFP can actually be split to a per-port
> > > > control logic, allowing support for multi-port PHYs, or PHYs that can
> > > > either drive SFPs or Copper.
> > > > 
> > > > To that extent, create a phy_port when registering an SFP bus onto a
> > > > PHY. This port is considered a "serdes" port, in that it can feed data
> > > > to anther entity on the link. The PHY driver needs to specify the
> > > > various PHY_INTERFACE_MODE_XXX that this port supports.
> > > > 
> > > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>    
> > > 
> > > With this change, using phy_port requires phylink to also be built in
> > > an appropriate manner. Currently, phylink depends on phylib. phy_port
> > > becomes part of phylib. This patch makes phylib depend on phylink,
> > > thereby creating a circular dependency when modular.
> > > 
> > > I think a different approach is needed here.  
> > 
> > That's true.
> > 
> > One way to avoid that would be to extract out of phylink/phylib all the
> > functions for linkmode handling that aren't tied to phylink/phylib
> > directly, but are about managing the capabilities of each interface,
> > linkmode, speed, duplex, etc. For phylink, that would be :
> > 
> > phylink_merge_link_mode
> > phylink_get_capabilities
> > phylink_cap_from_speed_duplex
> > phylink_limit_mac_speed
> > phylink_caps_to_linkmodes
> > phylink_interface_max_speed
> > phylink_interface_signal_rate
> > phylink_is_empty_linkmode
> > phylink_an_mode_str
> > phylink_set_port_modes
> > 
> > For now all these are phylink internal and that makes sense, but if we want
> > phy-driven SFP support, stackable PHYs and so on, we'll need some ways for
> > the PHY to expose its media-side capabilities, and we'd reuse these.
> > 
> > These would go into linkmode.c/h for example, and we'd have a shared set
> > of helpers that we can use in phylink, phylib and phy_port.
> > 
> > Before I go around and rearrange that, are you OK with this approach ?  
> 
> I'm not convinced. If you're thinking of that level of re-use, you're
> probably going to miss out on a lot of logic that's in phylink. Maybe
> there should be a way to re-use phylink in its entirety between the
> PHY and SFP.
> 
> Some of the above (that deal only with linkmodes) would make sense
> to move out though.

Yeah I'm thinking about moving only stuff that is phylink-independent
and only deals with linkmodes indeed. I'll spin a quick series to see
what it looks like then :)

Thanks,

Maxime


