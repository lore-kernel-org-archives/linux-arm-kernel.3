Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC929C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exze3ueWY+HNg4sMqbZbk5lkw0dlxCK14ZF2dFm2BRU=; b=VwR8iuPXSzOplm03JeBcux1Vnh
	RcdXvyBxpQeCeXrdoHvdIflWT5TFXggtjwfkWGiKnWeVYkghmkH2T5CrC/4ieUYZoPj0Hwx0zwLhe
	yRN7HAzGD1SNeRBllu4QDW/NrHymL/gBsSyZdyFRN1ObGqPvytGdvixZrC9myXEJer4EfmUFXx85r
	iZ0l4BZoOf5tKAg/oNN/qfNH7XXAEGhPAJcOViH5bAI/JFhgNRNftC4oT9Q5qh4BV87fxTl5nmr3u
	wsT0ZLeCEFLBlnbf8gBSpTN/JcUj+l9ock3kmWwPYjGD7a4mmUXnHqfFpH5lVLIwzXVTgVbBoU+fi
	S2+tsUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KTC-00000005YNV-3bfa;
	Mon, 28 Apr 2025 09:08:11 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K6W-00000005VFW-21eG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:44:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C4DE432F7;
	Mon, 28 Apr 2025 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745829879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exze3ueWY+HNg4sMqbZbk5lkw0dlxCK14ZF2dFm2BRU=;
	b=cUrsXZFFd/v0NeT60IbLaHgTaEtrXloAc/FEI1pkezzTfr37o1ION9UL0dU09kyhS9lZg7
	kF3NlmFLd88E6im5ehC+SFkPTJ4N7FAx8gmOzgaQjWZ1I1whHL5LfkvRHolJ5GHdmhADOM
	V4saVye8J3rRi8QPqJP21fIckt7SthtTvxxF7v/h3iGw7N/R5jNBnHwNdRkihDGXe3yiim
	D8JlBfxfmKmqOSSSbQ5pDPfqMVbdnBWIrnjRvWpnvP/TCEpFDcb+MZeViTrsTZRNDciCP3
	E9QTweYL4AEPbrKUqC4qoEqWqKeDva9WueGKRWdcVZXoTeWIf9EP3GdyPH35hA==
Date: Mon, 28 Apr 2025 10:44:34 +0200
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
Subject: Re: [PATCH net-next v7 1/3] net: ethtool: Introduce per-PHY DUMP
 operations
Message-ID: <20250428104434.5d4fab73@device-130.home>
In-Reply-To: <20250425171044.4a9e1b4a@kernel.org>
References: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
	<20250422161717.164440-2-maxime.chevallier@bootlin.com>
	<20250424180333.035ff7d3@kernel.org>
	<20250425090153.170f11bd@device-40.home>
	<20250425171044.4a9e1b4a@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedthedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmegvhegsfhemuggtfeelmegvvgejudemudekfeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemvgehsghfmegutgefleemvggvjedumedukeefledphhgvlhhopeguvghvihgtvgdqudeftddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhto
 hepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_014444_956960_D8BDAD1C 
X-CRM114-Status: GOOD (  24.25  )
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

On Fri, 25 Apr 2025 17:10:44 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 25 Apr 2025 09:01:53 +0200 Maxime Chevallier wrote:
> > > > +/* perphy ->dumpit() handler for GET requests. */
> > > > +static int ethnl_perphy_dumpit(struct sk_buff *skb,
> > > > +			       struct netlink_callback *cb)
> > > > +{
> > > > +	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
> > > > +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> > > > +	int ret = 0;
> > > > +
> > > > +	if (ethnl_ctx->req_info->dev) {
> > > > +		ret = ethnl_perphy_dump_one_dev(skb, ethnl_ctx->req_info->dev,
> > > > +						ctx, genl_info_dump(cb));
> > > > +		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
> > > > +			ret = skb->len;
> > > > +
> > > > +		netdev_put(ethnl_ctx->req_info->dev,
> > > > +			   &ethnl_ctx->req_info->dev_tracker);      
> > > 
> > > You have to release this in .done
> > > dumpit gets called multiple times until we run out of objects to dump.
> > > OTOH user may close the socket without finishing the dump operation.
> > > So all .dumpit implementations must be "balanced". The only state we
> > > should touch in them is the dump context to know where to pick up from
> > > next time.    
> > 
> > Thanks for poiting it out.
> > 
> > Now that you say that, I guess that I should also move the reftracker
> > I'm using for the netdev_hold in ethnl_perphy_dump_one_dev() call to
> > struct ethnl_perphy_dump_ctx ? That way we make sure the netdev doesn't
> > go away in-between the multiple .dumpit() calls then...
> > 
> > Is that correct ?  
> 
> Probably not. That'd allow an unprivileged user space program to take 
> a ref on a netdev, and never call recv() to make progress on the dump.
> 
> The possibility that the netdev may disappear half way thru is inherent
> to the netlink dump model. We will pick back up within that netdev
> based on its ifindex, no need to hold it.

OK I'm good with that then ! Thanks for the explanations, makes a lot
of sense. I'll followup with a new version soon :)

Maxime

