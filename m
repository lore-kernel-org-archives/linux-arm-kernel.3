Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC5EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agWMaaEU4vp0cnAil5eV67woVUsr1A/2Ld8pyt7qoFI=; b=qfajg21xCqssnGf8UAGLlKxeXT
	4kJ3j4ONPbmpoQ7TRUfEnygGoA2oG6BbPTd7QR1+t6dBhhqvUfZwO8OdPhWCXvxR3ZrYl/DZTqiJ/
	G3Y7B8iAcpUd2U67oO1Uv1UGic5YbowbUkTNKnyVNlBzp8rCmrY2nvTByuFCpoM0dku2GMuNfjIC3
	2pkHz8fXf5X8bZXt8zZvFKwugJnqm3n7k3299r5LxQmeLTFQUz+W7nMHkO4jl5r2QamWwH6nnJGCX
	zzIfwlTErJFhBLbjV9utRypbJZy7E1itv7xRi2dnHie2jXLakADmq/q5uyif/JO52GoOwec1SyXWt
	ZnNinAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2Uv-00000004wLT-0U9u;
	Mon, 17 Feb 2025 14:53:25 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk20t-00000004peM-30BP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:22:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 478D844430;
	Mon, 17 Feb 2025 14:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739802140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agWMaaEU4vp0cnAil5eV67woVUsr1A/2Ld8pyt7qoFI=;
	b=S4t1vLHCw/Kg2C8kbN3Ak0U48q7PKjHPfh+PurW6NQBhIvLAbuA7cHLbuIku/84RI3Bu8g
	OPo4PqbadCh5mZrs+bLTE2W1Zs4gF1o4mXCI89e51kvaIGHAjlUXTNnBhVrIJgPbxU5cPv
	P8ynGOg5eQUOXQeRpIlrQcSn8mGgJksmJ4hs8sswTyA5YGqIeezGdMzj9Se3kFXtItB31g
	tZX0kgMGR78MftYI5rHq2rwIaPUYWGBd1o0u5N18R5ohzCfCxtEdtNJnlrUmXL1q33IpkE
	iTTCKjdJTbzELpM4HDVjJ5xdsnbJk+hMtWlULGuaHck0mhoyA75iiQG+xC/PDg==
Date: Mon, 17 Feb 2025 15:22:16 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com, Jakub Kicinski
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
Message-ID: <20250217152216.5b206284@fedora.home>
In-Reply-To: <5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250213101606.1154014-6-maxime.chevallier@bootlin.com>
	<Z7DjfRwd3dbcEXTY@shell.armlinux.org.uk>
	<20250217092911.772da5d0@fedora.home>
	<5d618829-a9bc-4dd4-8a2e-6ce3a4acd51e@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtt
 hhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_062224_067546_D762ED15 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Andrew,

On Mon, 17 Feb 2025 14:43:00 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

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
> 
> ...
> 
> > These would go into linkmode.c/h for example, and we'd have a shared set
> > of helpers that we can use in phylink, phylib and phy_port.  
> 
> Please be careful with the scope of these. Heiner is going through
> phylib and trying to reduce the scope of some of the functions we
> exporting in include/linux/phy.h to just being available in
> drivers/net/phy. That will help stop MAC drivers abuse them. We should
> do the same here, limit what can actually use these helpers to stop
> abuse.

Can we consider having an header file sitting in drivers/net/phy
directly for this kind of things ?

Maxime

