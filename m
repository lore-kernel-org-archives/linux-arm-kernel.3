Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA942C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqAT5+Gi1O68uLcYreVHzC9MDAGC4lcpXT9gC3flVdI=; b=45EJkxEHpJy3sQOLn75vSrC4p9
	lPffOPjwdi+zJwm/Sdmayh47qKGo9rMmkydn34xAcU///l63su/epNZlPHGFv7P64g12fB3d7/H2T
	xjRWcKIPglJ7/M5tGtr/tD6pCkqnfmFgg5k4My5AfNPUMgMUQqgDodRI/jkyA1C2agut59w04Hpc5
	SOHFcREdE8SMRb187U2rqYIrup/tKAIEcEReUPM6P4JXMWx41Zf0IffSN3QcrXtsRjAOScTip7taF
	+oWeD9WTSYs+3ELPmA+2Sf+lm/e7cPcfde3hwq5PpgfTMXIZBv3aJdXzheUkqicWx+8lpEKhG5zk+
	dYkRP6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWPI-00000005iEN-3dm4;
	Tue, 04 Mar 2025 17:50:17 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUvV-00000005NsR-1ysH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 16:15:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0A8720479;
	Tue,  4 Mar 2025 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741104921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CqAT5+Gi1O68uLcYreVHzC9MDAGC4lcpXT9gC3flVdI=;
	b=o9OpQSWCPcLhU75kNX2KB5/lnvHNChPaWtHihmyulicnkYRnOi0iBSibqDPh1HIurd5oXa
	I8YiOwkICGHH3ijfJHOspj/VJLvjtz2DlSh+Bm5gAyC7rHHtSLhXp143kVLyZS0xblCbxy
	GnHWOPVcYD+nAQ+wn2K1khX2vrkj+D8MMHwmxxkUTTFCFshXEbkYNMnhpxi7X2Lc7pqTfa
	cNNZwJoEJqtLXnVLoXIKDuvzE+ZQybJEVzqdOfexBoUSMDrrWx0uFTJd3uDtXqx/sUU5je
	uSScUY8lwpYIcZOGgvyNhh4fd3+xdXA3FGhygoOH6J5hzvElm5v03SYg1D1rww==
Date: Tue, 4 Mar 2025 17:15:15 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net] net: ethtool: Set the req_info->dev on DUMP
 requests for each dev
Message-ID: <20250304171515.297d15df@fedora.home>
In-Reply-To: <20250304170051.607097e9@kmaincent-XPS-13-7390>
References: <20250302162137.698092-1-maxime.chevallier@bootlin.com>
	<20250304170051.607097e9@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrt
 ghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081525_641098_32B41511 
X-CRM114-Status: GOOD (  30.14  )
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

Hi K=C3=B6ry,

On Tue, 4 Mar 2025 17:00:51 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Sun,  2 Mar 2025 17:21:36 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
>=20
> > There are a few netlink commands that rely on the req_info->dev field
> > being populated by ethnl in their ->prepare_data() and ->fill_reply().
> >=20
> > For a regular GET request, this will be set by ethnl_default_parse(),
> > which calls ethnl_parse_header_dev_get().
> >=20
> > In the case of a DUMP request, the ->prepare_data() and ->fill_reply()
> > callbacks will be called with the req_info->dev being NULL, which can
> > cause discrepancies in the behaviour between GET and DUMP results.
> >=20
> > The main impact is that ethnl_req_get_phydev() will not find any
> > phy_device, impacting :
> >  - plca
> >  - pse-pd
> >  - stats
> >=20
> > Some other commands rely on req_info->dev, namely :
> >  - coalesce in ->fill_reply to look for an irq_moder
> >=20
> > Although cable_test and tunnels also rely on req_info->dev being set,
> > that's not a problem for these commands as :
> >  - cable_test doesn't support DUMP
> >  - tunnels rolls its own ->dumpit (and sets dev in the req_info).
> >  - phy also has its own ->dumpit
> >=20
> > All other commands use reply_data->dev (probably the correct way of
> > doing things) and aren't facing this issue.
> >=20
> > Simply set the dev in the req_info context when iterating to dump each
> > dev.
> >=20
> > Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some
> > commands") Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.=
com>
> > ---
> >=20
> > Fixes tag targets the phy-index commit, as it introduced a change in
> > behaviour for PLCA. From what I can tell, coalesce never correctly
> > detected irq_moder in DUMP requests.
> >=20
> > We could also consider fixing all individual commands that use
> > req_info->dev, however I'm not actually sure it's incorrect to do so,
> > feel free to correct me though.
> >=20
> > Maxime
> >=20
> >  net/ethtool/netlink.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> > index b4c45207fa32..de967961d8fe 100644
> > --- a/net/ethtool/netlink.c
> > +++ b/net/ethtool/netlink.c
> > @@ -582,6 +582,7 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
> >  		dev_hold(dev);
> >  		rcu_read_unlock();
> > =20
> > +		ctx->req_info->dev =3D dev; =20
>=20
> I would rather put it in ethnl_default_dump_one() before
> ethnl_init_reply_data() call.

Ah yes true, that'll be more consistent with the other callpaths.

> With this change:
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Tested-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you for testing, I'll respin.

Maxime

>=20


