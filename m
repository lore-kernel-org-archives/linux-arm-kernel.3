Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0655BC87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUI1uF0yA+eVneoGws46GefU9bZoq7cd2UXxP673XV8=; b=Jo4lyzFSatqyykWN9mhhsWdLyG
	zO1EUPXf1qIvLOOcls21JQQnbF5HR2ZN7/S1P8DkdtL+DZYgfxQ3A+DooTxPRt+jl0+ary/YxUXX9
	2WZXg7DWM0vWFsqX0fQcI2fiAgQ+6dygRiOKHk3iKaJCj3I7wl6PHRThgQ5CwDYhsmHacqdCp44n/
	Hk4eMuULylk7yjXdKhZ7vsP4TlQd3G+cX+lzylaXiR6adyedjBplzmchve7YzuWTnqL8SSwXjW0my
	TsGtxc8SDt+YLInTpTVQQ4+EJHV7bxKRVVWlZGEbzk3l9pVkk1AUJhI1k6EkUV5X0IX/GxftSOOOJ
	xry/H+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSXV-00000007oWF-2SC1;
	Mon, 11 Aug 2025 13:26:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSUu-00000007oBn-13dJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:23:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30B8443A03;
	Mon, 11 Aug 2025 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754918607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gUI1uF0yA+eVneoGws46GefU9bZoq7cd2UXxP673XV8=;
	b=PJTZBGOc2I/0iLGm3hKvx46Ro41UxERqinu4KYAduJzMrW2ja3GzFgCUvsRFt+drRSEmhU
	RrDNVgP6/ShOWhZL5Fee+o1wZwzskhZ4V1Pq82j7kOt+yWZeFEWVH6+EmGZCrMklfbAHPv
	2ilgJXpI6B+ve6w63rmYZu2G5ljTRWT8d3ElshTtEB/5qIMHE4MgEemgVStHNVEH8r886F
	7Pamc/MBsCKaS2c0Fwjdk4SJIl+C7d2txQKGMZNwectTI9XrdvoHFqi6ML7420uGmsBsiz
	hCdBihh9Sj/ZkO8irotjUgSgkHARw9Z8hJ5ffBq029QyNEvgPwOlQYv8Yjw+DQ==
Date: Mon, 11 Aug 2025 15:23:23 +0200
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
Message-ID: <20250811152323.24012309@fedora.home>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufedvheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleehgeevfeejgfduledtlefhlefgveelkeefffeuiedtteejheduueegiedvveehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvs
 ehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_062332_429280_7ABBD302 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Russell, Andrew,

On Sat, 26 Jul 2025 23:24:36 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > -	if (iface == PHY_INTERFACE_MODE_SGMII)
> > -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");  
> 
> I think we need to keep this warning. I don't remember the details,
> but i think this is the kernel saying the hardware is broken, this
> might not work, we will give it a go, but don't blame me if it does
> not work. We need to keep this disclaimer.

As I'm preparing for the next iteration, I was wondering if this could
be something we could move into the core.

The series generalizes most of the SFP handling for PHYs, and I
actually don't have a nice spot in at803x to put the warning anymore :)

However what's being said by this warning has nothing specific to
at803x, it applies to any PHY driver (or even, any SFP upstream) that
supports 1000BaseX but does not support SGMII.

The idea is that some modules with a built-in PHY will work when using
1000BaseX as the MII (with of course the limitation that 10/100M won't
ever work), so instead of bailing out when we have an SGMII module on a
1000BaseX SFP cage, we give it a try with a very loud warning that this
is "best effort, probably won't work, don't blame the kernel".

This has been discussed a bit originally here [1]

Is it OK for you if we move that warning into core code ?

Maxime

[1] : https://lore.kernel.org/netdev/20210701231253.GM22278@shell.armlinux.org.uk/

