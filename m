Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCC9C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNm9BSsOfq9YjNo6tMCG7wnV+C6YM+88UmyM3ASeUTg=; b=VzHhgbOYp0BLMIfWNitAq3s17U
	lRMnZHQqhI+cv6czYtWonxMcebJZqA/5bdiLqBgSLu/8FqwmU05TNr6/cEhUSQqPLfD+xbkgZcms2
	+zMC2awWheBnV1XuCVp9BgMiHZm8KELXYT+wBQLv+YB46tgIs0R0xnjtQ/FFcT8R8W5ePfYS1pxS6
	HEWni+EImVj94H5Zc9fJ1nV0KyBp0pj84+vA9eI7G7+fZpx+jUDuYHVHoTVa+6/Hvw886teB/Qguu
	0b13QURBjGDd1q+oEO2fwf/eorI9skhwrA3mcc2Dy1j0nJg1DgyeJy5bwFuBD1vTk8TKDhBQzFQlL
	K9PIaf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcP1-00000002ePI-3XfO;
	Mon, 10 Mar 2025 12:38:40 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trc1U-00000002Yuo-31WO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:14:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 922A1443F5;
	Mon, 10 Mar 2025 12:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741608858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNm9BSsOfq9YjNo6tMCG7wnV+C6YM+88UmyM3ASeUTg=;
	b=fJYw8HnhXuhCIVN13OSw37EfydbxcYN7vD4cPiEwIhg0ewJwR4m5AGcunzenv2lFQXEHXw
	mnreD61Hvp4HRIX/qRmMigw7T7thB/GbXLTUGueG+M6Td45rLGqbC8HCXJQT1294f/ivHM
	WkqMX/mMzZt6ehIcOeCh3BXGjMaxXA6qRrZeXPwosH6vicCiWjwQNb8IY8GzlL3ZxhiTXn
	appYtMEllu/YTF5yRqxF2lRzEpq1nFFVMRn7gtE6nX8RMZLNUgQOve7xZVWAaSIiPd3qNA
	heRpjAjelZWHnfNKv2h0eBbbM4crWd6ETjsYEws5j1IlfUQjN/O28xY4MzzFhg==
Date: Mon, 10 Mar 2025 13:14:13 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>
Subject: Re: [PATCH net-next v2 5/7] net: ethtool: phy: Convert the PHY_GET
 command to generic phy dump
Message-ID: <20250310131413.505e676f@kmaincent-XPS-13-7390>
In-Reply-To: <20250308155440.267782-6-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
	<20250308155440.267782-6-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_051421_362913_E2547324 
X-CRM114-Status: GOOD (  11.31  )
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

On Sat,  8 Mar 2025 16:54:37 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Now that we have an infrastructure in ethnl for perphy DUMPs, we can get
> rid of the custom ->doit and ->dumpit to deal with PHY listing commands.
>=20
> As most of the code was custom, this basically means re-writing how we
> deal with PHY listing.

Only nitpick ;)

> -static int
> -ethnl_phy_fill_reply(const struct ethnl_req_info *req_base, struct sk_bu=
ff
> *skb) +static int phy_prepare_data(const struct ethnl_req_info *req_info,
> +			    struct ethnl_reply_data *reply_data,
> +			    const struct genl_info *info)
>  {
> -	struct phy_req_info *req_info =3D PHY_REQINFO(req_base);
> -	struct phy_device_node *pdn =3D req_info->pdn;
> -	struct phy_device *phydev =3D pdn->phy;
> -	enum phy_upstream ptype;
> +	struct phy_reply_data *rep_data =3D PHY_REPDATA(reply_data);
> +	struct phy_link_topology *topo =3D reply_data->dev->link_topo;
> +	struct nlattr **tb =3D info->attrs;
> +	struct phy_device_node *pdn;
> +	struct phy_device *phydev;
 =20
Reverse xmas tree.

> -	ptype =3D pdn->upstream_type;
> +	/* RTNL is held by th caller */

Small typo here *the*.

The rest is good for me.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

