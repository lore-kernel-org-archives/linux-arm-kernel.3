Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CEAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaB+63UMpKqA/cMni297B+HHa1pb6tlIFYAG3q6MvzE=; b=rPpoMbyJmdpNd2KllQI6tDJOLY
	tq9BVEaXewLijdIhTNeP2G9y8ZpSVzYux4xpd/HekPC2zxbAzGk9luoA2U/MUX9JCNu9GDX6E551w
	bPClC3Il9mqZSpbz+hjwGyFOZftTNRkVsX/QhVAXvFw0JngR/JvLbjmlg/ZDBqtVxIM2X+8wZxp6f
	jPhrIkmjuAZvRtIj4IKuX3gv7eGciLUP0oo+zFaa+XFWVlp9xdDQ7qT7O+jJGP2igkRqu0KWDnn+9
	QQc1lvlJH/1YtCUQK5fkaqFuatcZ81D/HoekoVcyeUX2gOAAz/xaOQYeiypHZ7aSECOrJ73+0r1UT
	As2ePvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txO5d-00000008Dyh-07uI;
	Wed, 26 Mar 2025 10:34:29 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txO11-00000008C9h-3688
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 10:29:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE6194318E;
	Wed, 26 Mar 2025 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742984981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PaB+63UMpKqA/cMni297B+HHa1pb6tlIFYAG3q6MvzE=;
	b=ZkVnWLoQ+OawRtwQyePP9oplAMy9EpwY/udMgBcZP7VWRM6OO4LWMZb6ktH2TxjO6uuFYE
	T5Ho940K+8eFUiol4RmF8ZhGZbSuMrIryI7R3PLEmRGu7SVFuA+t2VxWTFs6vuBFQ+ZGPk
	8X3Fw/aj1LuIYLv9GSyhZlAYy9M7HZVbn2zCKQ3pJdegmF6n/mxwuXzkhI79WOd/Ga5ZNZ
	oY1b4nzhUf0OMr39m37HwtoJC40ZOEMdTufhoDPPq5B8cDYvjOODfGS0weY4pNhnXxwI+p
	7AONu/dVWaYnEQht37AZlLYRA0tNdNgzRudBRdVsjeFygqn7P6vlCLpYbDQo6A==
Date: Wed, 26 Mar 2025 11:29:36 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, Andrew Lunn
 <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
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
Message-ID: <20250326112936.16f8b075@kmaincent-XPS-13-7390>
In-Reply-To: <20250326085906.62a7c9fc@fedora.home>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
 <20250324104012.367366-3-maxime.chevallier@bootlin.com>
 <20250325122706.5287774d@kmaincent-XPS-13-7390>
 <20250325141507.4a223b03@kernel.org>
 <20250325142202.61d2d4b3@kernel.org>
 <20250326085906.62a7c9fc@fedora.home>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeelkegvsgemjeejvggsmeejieefmegufeefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeelkegvsgemjeejvggsmeejieefmegufeefvgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_032944_229947_C788BB82 
X-CRM114-Status: GOOD (  17.77  )
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

On Wed, 26 Mar 2025 08:59:06 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> On Tue, 25 Mar 2025 14:22:02 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
>=20
> > On Tue, 25 Mar 2025 14:15:07 -0700 Jakub Kicinski wrote: =20
>  [...] =20
> > >=20
> > > Let's try. We can probably make required_dev attr of
> > > ethnl_parse_header_dev_get() a three state one: require, allow, rejec=
t?
> > > =20
> >=20
> > Ah, don't think this is going to work. You're not converting all=20
> > the dumps, just the PHY ones. It's fine either way, then. =20
>=20
> Yeah I noticed that when implementing, but I actually forgot to mention
> in in my cover, which I definitely should have :(
>=20
> What we can also do is properly support multi-phy dump but not filtered
> dump on all the existing phy commands (plca, pse-pd, etc.) so that be
> behaviour is unchanged for these. Only PHY_GET and any future per-phy
> commands would support it.

Couldn't we remove the existence check of ctx->req_info->dev in
ethnl_default_start and add the netdev_put() in the ethnl_default_dumpit()?
Would this work?

Or we could keep your change and let the userspace adapt to the new support=
 of
filtered dump. In fact you are modifying all the ethtool commands that are
already related to PHY, if you don't they surely will one day or another so=
 it
is good to keep it.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

