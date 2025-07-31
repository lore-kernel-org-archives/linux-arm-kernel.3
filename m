Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A34C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My2aLPxmdnpZ3qTUzBLrCqn0REKR+9iuEoTW7pGZFAM=; b=EaOWuAuCQQ3VdPfYbRvl6OJrFs
	dDyw3UKtjOIVYrcbXi/mlE4ib2LREA/rQsAOUEqIZjSLPsp1uPCiPBXGDF0xIBb5SLgPNRUzrX1qO
	pMIlXpNwfNj9aRd2uH/aWkx0BWwxZa39D8TzmNqBrcdVsjRUlcFSJShN0nhh8MBJY56m9JlZArk4U
	w692PhsAYwA6brrdAULVWwZFvnYJ+dv4ZMaO1ezvhqUDv51JYR5z9HkW8WNt/+ao+6u9853NJUoEW
	ynp1PyfnE+DK5K3t30P7FTaYQOLaJG4NNQpV/ONretpnSoGq+Bp0rDXTueJJlFyVExrL7SqrlQ/Op
	3PoDVtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhU8l-00000003oPL-0tQR;
	Thu, 31 Jul 2025 14:20:15 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTR9-00000003iAe-0v6k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:35:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE10B443EE;
	Thu, 31 Jul 2025 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753968907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=My2aLPxmdnpZ3qTUzBLrCqn0REKR+9iuEoTW7pGZFAM=;
	b=BzgOYlwzGRnkYY5poCQBmzn8jMwUTz/Ok1HYLcWyM01sOXjztsfhamRlWzW9uEN8m3R9zQ
	gP4/kwyIRCDT9zoNMBSTPAVQZxwNpjOjwxA1JnHLY0Q0tliPT7Dv4xtdkZ+v085hX0uCvW
	cQW/4yTi9Anhx9gqTnfQtuoXh4LPcB/639i3TwToj+h6ZaTBomtDarh2xMDRuYRV1yCIe0
	nEn8NOpO/gkHDzXzyxL0vQLbqoZhGpurhCRgL2R6hmJToTbSPGh/DGfegjDOVq3X/ByRra
	QmyWGxzQCjK2fN358+BLWEazzVeYnqQvCzOG1ndpcBEAyZi39o9yrzJtu7/v7Q==
Date: Thu, 31 Jul 2025 15:35:02 +0200
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
Subject: Re: [PATCH net-next v10 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <20250731153502.78eebb88@fedora.home>
In-Reply-To: <8d0029bc-74b7-44bc-ae0b-606d5fd2d7c3@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-2-maxime.chevallier@bootlin.com>
	<8d0029bc-74b7-44bc-ae0b-606d5fd2d7c3@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_063511_752930_8A7BCB30 
X-CRM114-Status: GOOD (  11.45  )
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

Hello Andrew,

First, thanks a lot for taking a look a this series !

On Sat, 26 Jul 2025 21:49:07 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> >  - The number of lanes, which is a quite generic property that allows
> >    differentating between multiple similar technologies such as BaseT1
> >    and "regular" BaseT (which usually means BaseT4).  
> 
> > +            mdi {
> > +                connector-0 {
> > +                    lanes = <2>;
> > +                    media = "BaseT";  
> 
> This is correct when the port is Fast Ethernet. However, as you point
> out, now a days, the more normal case is 1G, with 4 lanes for BaseT.
> To avoid developers just copy/pasting without engaging brain, maybe
> add a comment about it being a Fast Ethernet port?

Absolutely :)

Maxime

> 
> 	Andrew


