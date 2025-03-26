Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A89BC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTWyui4Xr7KMh10WBhiXRlOoGq1yggOO8oiSujDwR4E=; b=rzcksavc4866Pdf8sslphfM7UE
	DO8aLKOX/wmL43ROUi4nLQ8XOb6+Iud9c8Ht4RNn7n+tMLkhGI6h2MBRORihMb8eT47LzzZPad7y9
	5plEPhWaPeCkEahq+bMHpevHmpykjmlVcQUhKDQXCy1WxJv/B9FZM2NZ1s8ossCWl2xOlRuFRh9B5
	n1q4PjZ5iOsnJ3kZ9+jyaCFfpnwy0exQzK8wLivHv8GEHFKFT5RzqDT5HJsgF1kA7eRpmX77vP3/r
	Ie6TcvKkDsm2X06H3Fdzns33IWUygmoEOSK3tFgKX6Rb8AAgPPGYdncUdb5ODqFP1rbSdi1M5PL+Q
	XglnbLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLk6-00000007rsB-45n3;
	Wed, 26 Mar 2025 08:04:06 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLfM-00000007qQB-3Icv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:59:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EBE8443B3;
	Wed, 26 Mar 2025 07:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742975949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTWyui4Xr7KMh10WBhiXRlOoGq1yggOO8oiSujDwR4E=;
	b=O2rD/Q8Ho4tVxJBvL6/k+eaT0h0doMXKQ2STOuMEdL2NI4hyFAFqEUDqMMsKjkKG0npELf
	mqUQ2jwrqiE8aeK32fmaCadF38+ooLU2Q7VdfU2iYMYw1RLSrkjiL2kttFSwlyyBqnX5RT
	+7o5icB71s9vQrDd8wUtmEMJYuFh/PY1FSzt/bJr8JCl5jigv7qPhCG0dkMZuhj1umbek5
	Er+zqrloy3s0Hl4bgy8NTJw8kI3nX+UbO9rWvTb1apCbuw3sBWw1mKv6By/+nsO+bAOxlx
	v1fmkj2KHHByQuu4zb4VB1IwycZ+kcNhqdaR+moE0Z0NrMxZll7SJYK7g1mSwg==
Date: Wed, 26 Mar 2025 08:59:06 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, davem@davemloft.net, Andrew
 Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 2/8] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
Message-ID: <20250326085906.62a7c9fc@fedora.home>
In-Reply-To: <20250325142202.61d2d4b3@kernel.org>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-3-maxime.chevallier@bootlin.com>
	<20250325122706.5287774d@kmaincent-XPS-13-7390>
	<20250325141507.4a223b03@kernel.org>
	<20250325142202.61d2d4b3@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieegleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvt
 hdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_005912_975384_F226024F 
X-CRM114-Status: GOOD (  23.62  )
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

On Tue, 25 Mar 2025 14:22:02 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Tue, 25 Mar 2025 14:15:07 -0700 Jakub Kicinski wrote:
> > > This means the dump will have a different behavior in case of filtered dump
> > > (allow_pernetdev_dump) or standard dump.
> > > The standard dump will drop the interface device so it will dump all interfaces
> > > even if one is specified.
> > > The filtered dump will dump only the specified interface. 
> > > Maybe it would be nice to have the same behavior for the dump for all the
> > > ethtool command.
> > > Even if this change modify the behavior of the dump for all the ethtool commands
> > > it won't be an issue as the filtered dump did not exist before, so I suppose it
> > > won't break anything. IMHO it is safer to do it now than later, if existing
> > > ethtool command adds support for filtered dump.
> > > We should find another way to know the parser is called from dump or doit.    
> > 
> > Let's try. We can probably make required_dev attr of
> > ethnl_parse_header_dev_get() a three state one: require, allow, reject?  
> 
> Ah, don't think this is going to work. You're not converting all 
> the dumps, just the PHY ones. It's fine either way, then.

Yeah I noticed that when implementing, but I actually forgot to mention
in in my cover, which I definitely should have :(

What we can also do is properly support multi-phy dump but not filtered
dump on all the existing phy commands (plca, pse-pd, etc.) so that be
behaviour is unchanged for these. Only PHY_GET and any future per-phy
commands would support it.

Maxime

