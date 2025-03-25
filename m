Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0818C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QdYd+vEdamak2MCnqAsE3kD8l4P2fha+M49/OdiAbBM=; b=ESgEyxxxVF99qVBPB7z1rUcVUN
	dWTTTOT5hFwDmbxsbIwDIqcGRsQi2kgA+fb06i+++n71NK0E7PTaJcPPum6wW8MadhV/CF/Hplt41
	IRbrRwGv9QvcBwOupcb8Bdf1i9+gX8MtqW5wtr+Xb7moQTk0QJj8lTHcgHRt0XP5vCQIwsThfIczr
	zSQyIg/sULEvm0PkteoGERXz5zTZQx0ZFreKiCOtx/6S5kpOyUdk51bftqfZpE7ha0bQSbOOcPr41
	mou2DhnsJrDFz28DPai6TzBMOu/UQZywOHQQQ0OaO0HTLxPQbuqnxdnfYTzkvR4uYbL+G8Q9E01QS
	Oe5L0Rzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx26g-00000005aFO-1wQI;
	Tue, 25 Mar 2025 11:06:06 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx23s-00000005Zmd-0tiQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:03:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D33844268;
	Tue, 25 Mar 2025 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742900587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdYd+vEdamak2MCnqAsE3kD8l4P2fha+M49/OdiAbBM=;
	b=iqNRSa8/yPLQTgVKWPi+RLTphyxOq4JVLBg3B2sCSYLzaAmHtwnyFX1fU4yezUdeaCfn4F
	ctIN8baZucCaWhOoHvKnfwwxfv+aFYqYHbC6VwP1rnfVpRMiT1pB/hZ9ukgXXE391Emqjs
	aVkP/ooFYfWZtclKdzUukz8ouq+PmAuxnj2kdG9eRtolJvyszH5sz2gN4rHd9VbY6aT6CW
	/8JXUWmBWo65hqknFSz5uPpQxYy1wh8hAGiu5VB5gIcAKTzVp4laUYnPL8MzGn5nytPdFk
	WppW0HmnjULiONbEX2SB0jbG596/aj47G6Vx/FBpVzFbm1ZEIBA9sVlqJIUuaw==
Date: Tue, 25 Mar 2025 12:03:05 +0100
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
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 1/8] net: ethtool: Set the req_info->dev on
 DUMP requests for each dev
Message-ID: <20250325120305.0650bb0a@kmaincent-XPS-13-7390>
In-Reply-To: <20250324104012.367366-2-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-2-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvgeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040312_900670_8E6FD66C 
X-CRM114-Status: GOOD (  17.35  )
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

On Mon, 24 Mar 2025 11:40:03 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> There are a few netlink commands that rely on the req_info->dev field
> being populated by ethnl in their ->prepare_data() and ->fill_reply().
>=20
> For a regular GET request, this will be set by ethnl_default_parse(),
> which calls ethnl_parse_header_dev_get().
>=20
> In the case of a DUMP request, the ->prepare_data() and ->fill_reply()
> callbacks will be called with the req_info->dev being NULL, which can
> cause discrepancies in the behaviour between GET and DUMP results.
>=20
> The main impact is that ethnl_req_get_phydev() will not find any
> phy_device, impacting :
>  - plca
>  - pse-pd
>  - stats
>=20
> Some other commands rely on req_info->dev, namely :
>  - coalesce in ->fill_reply to look for an irq_moder
>=20
> Although cable_test and tunnels also rely on req_info->dev being set,
> that's not a problem for these commands as :
>  - cable_test doesn't support DUMP
>  - tunnels rolls its own ->dumpit (and sets dev in the req_info).
>  - phy also has its own ->dumpit
>=20
> All other commands use reply_data->dev (probably the correct way of
> doing things) and aren't facing this issue.
>=20
> Simply set the dev in the req_info context when iterating to dump each
> dev.

Tested-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you, this fixes the PSE dump!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

