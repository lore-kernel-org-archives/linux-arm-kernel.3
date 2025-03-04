Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4781CC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7OS0LOkCHZYOvTzYUlUPDCBu1mJHvnSntjZBz82JaU=; b=asQz4KTJpHinImuNbBFMbfHjOw
	JGqdON9IajM5Aq37l/SUYZ/cfOrJxaH+96CMa1mtKsxtTI1nhPIO6oHk2UXAp2ruMMzIxhMsS34XD
	pZ2i04jGpHsHJ9rrqyGi1m6YX5ZlYw+5v258hk1eFuDVukbS88Hp2IDB6IyM3QSy26hCPvQrS7zCY
	nmDCCfvPi+PrCMgSsus4rRve+UB+g76yCoQgDcb7LcljCg7Ygfmly6wLDEPe/kZaNO5yZcj+Cp8LI
	PJQrOSMvzM8b4BOIUD8ykD9bo83KmWUuyU4TDKlyU2bIUDin028IMo/BeuuoDlKdHAcH4/WPW6dFH
	kuMrEDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO5U-00000003jWg-2dwX;
	Tue, 04 Mar 2025 08:57:16 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO1m-00000003icP-1GJs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:53:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DBD9443D9;
	Tue,  4 Mar 2025 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741078401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7OS0LOkCHZYOvTzYUlUPDCBu1mJHvnSntjZBz82JaU=;
	b=XqUkLWDqe84uXl7cJWzGct2BwfVaESHXhXtPCBQJl84dwiPJA/bM785kb44C+jbPsnMWcw
	Cw+IL7XbITW4xWvVgSobe+4dOCUpaC2cHzfHQT1y4bp0KCRglUPZA4t47OQMam5eqU4Uxg
	y41tOs2ftiuCYXy6VcgobrVjVzP72cSxLLp5PXVyyQS+Ui4PeWL7tfe2FOV0FtsQn3yLkG
	JGLuHgo30+38mC0yFcESR/ssloLzppVnosNbrtHjNn2P1VQvFMglV+qgOEEnYxZQzrcclp
	cwwz7epKs+n7jlBKFwCRW4RJ1nx5Rp8emGPZBFL5LHLFh/N+9KU+usTezrPXew==
Date: Tue, 4 Mar 2025 10:52:39 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net v2] net: ethtool: netlink: Allow NULL nlattrs when
 getting a phy_device
Message-ID: <20250304105239.747500be@fedora.home>
In-Reply-To: <20250303161024.43969294@kernel.org>
References: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
	<20250303161024.43969294@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdduheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkr
 ghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepphgrrhhthhhisggrnhdrvhgvvghrrghsohhorhgrnhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005326_784893_AB7EE232 
X-CRM114-Status: GOOD (  24.96  )
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

On Mon, 3 Mar 2025 16:10:24 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Sat,  1 Mar 2025 15:11:13 +0100 Maxime Chevallier wrote:
> > ethnl_req_get_phydev() is used to lookup a phy_device, in the case an
> > ethtool netlink command targets a specific phydev within a netdev's
> > topology.
> > 
> > It takes as a parameter a const struct nlattr *header that's used for
> > error handling :
> > 
> >        if (!phydev) {
> >                NL_SET_ERR_MSG_ATTR(extack, header,
> >                                    "no phy matching phyindex");
> >                return ERR_PTR(-ENODEV);
> >        }
> > 
> > In the notify path after a ->set operation however, there's no request
> > attributes available.
> > 
> > The typical callsite for the above function looks like:
> > 
> > 	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_XXX_HEADER],
> > 				      info->extack);
> > 
> > So, when tb is NULL (such as in the ethnl notify path), we have a nice
> > crash.
> > 
> > It turns out that there's only the PLCA command that is in that case, as
> > the other phydev-specific commands don't have a notification.
> > 
> > This commit fixes the crash by passing the cmd index and the nlattr
> > array separately, allowing NULL-checking it directly inside the helper.
> > 
> > Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some commands")
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> Well, this alone doesn't look too bad.. :) Hopefully we can address
> adding more suitable handlers for phy ops in net-next.

Yeah I'm cooking something to improve on that, and I have also dusted
off a netdevsim patch I had written back when working on the
phy_link_topology that adds very very basic PHY support so that we can
start covering all these commands with proper tests. I'll hopefully send
something in the coming week or so.

> Didn't someone report this, tho? I vaguely remember seeing an email,
> unless they said they don't want to be credited maybe we should add
> a Reported-by tag? You can post it in reply, no need to repost 
> the patch.

Parthiban reported this without CC: netdev, but I think it's fair to
add :

Reported-by: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>

I didn't include it in the first place because checkpatch complained
about a reported-by tag without a "Closes:", which we don't have
because of the private reporting :)

Thanks Jakub,

Maxime

