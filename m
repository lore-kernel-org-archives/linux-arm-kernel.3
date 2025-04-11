Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2296DC369A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdK/6yYJzGxQnCCXgiw7P3AMqcnft/7CmOOkoaxzVSE=; b=qq9o2g3sMthMn2+Vx1MoFBlQ1S
	qBRdfD56GIMQ1pkJLHMcmzqVG5861XR5LflwtvZM82BMSGkmUq7Ny1U/rb4kzw5mUIiI4KDRHlZSB
	z0k4sq+exJNoqSh9Jj3M8t5NWB4Hzc8RXrNL2S374sklZA3vU4u2Bh5TzteVeQsqJyTr9zAHb4lVh
	6ZgHbNpx8/8t5QoKTsTJ32bhZA010d3vi/6eXUUsUoo0aYlvPZmre684tuc8njTZq0OEJsTZoIlRV
	c/cGUrUAM45U8M0bXxHhjslfwbgUMR57Kj82P8jrH1KFJwsVEXyh8yofO3tNLaRW1hdkGpo7hBOUt
	v1nzFcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39yo-0000000D3zc-1PCq;
	Fri, 11 Apr 2025 08:43:18 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38mX-0000000CqxT-0JaU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 07:26:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CA814417D;
	Fri, 11 Apr 2025 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744356387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdK/6yYJzGxQnCCXgiw7P3AMqcnft/7CmOOkoaxzVSE=;
	b=PqHLvB/P/MCc31hal1ebG34AdokMQJMst6lIK3BdFUrFdK3PorIig42wn24cFBywPgaQX3
	PWZr4hIoZ2jsEjL6/m5H5SuJI5b8fITC6ApXbPQlUt4tdMEbW6S/mheciafF0T4wY+JFA6
	+KKsElLdg74JaQh/1dPcab4XZElfOUpu+q9QeWF9q5zhZmaNDxLWc5jmRzvX4hoNjk2p4d
	Fszxo0zI9kg8W1DwuIzdV1tSw//TEgteiyF7pZRzxIJ3lC/hJm82EAuqE9uyesTUJs9hFI
	W1ibIKuj0xp8pSb9c0RdEwg9XZjLIb71Fh5kJxW2ANb5kPykpDUVwtC04vQnfw==
Date: Fri, 11 Apr 2025 09:26:19 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v5 1/4] net: ethtool: Introduce per-PHY DUMP
 operations
Message-ID: <20250411092619.722b7411@fedora.home>
In-Reply-To: <20250410172155.3cd854d8@kernel.org>
References: <20250410123350.174105-1-maxime.chevallier@bootlin.com>
	<20250410123350.174105-2-maxime.chevallier@bootlin.com>
	<20250410172155.3cd854d8@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguu
 hhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_002633_890953_482214E8 
X-CRM114-Status: GOOD (  14.85  )
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

Hi Jakub,

On Thu, 10 Apr 2025 17:21:55 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 10 Apr 2025 14:33:46 +0200 Maxime Chevallier wrote:
> > ethnl commands that target a phy_device need a DUMP implementation that
> > will fill the reply for every PHY behind a netdev. We therefore need to
> > iterate over the dev->topo to list them.
> > 
> > When multiple PHYs are behind the same netdev, it's also useful to
> > perform DUMP with a filter on a given netdev, to get the capability of
> > every PHY.
> > 
> > Implement dedicated genl ->start(), ->dumpit() and ->done() operations
> > for PHY-targetting command, allowing filtered dumps and using a dump
> > context that keep track of the PHY iteration for multi-message dump.  
> 
> Transient warnings here that the new functions are not used :(
> Would it work to squash the 3rd and 4th patches in?
> Not ideal but better than having a warning.

ah damn yes indeed... meh sorry about that, I'll squash the other
patches in (except for the net/ethtool/phy.c patch). That said are you
more comfortable with this approach ? I was unsure this was what you
were expecting from the previous iteration.

Thanks,

Maxime

