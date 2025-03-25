Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E0DC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cp05A3ncq1r6TSS05Wy5wCIMMlphKX62znrx7IOhkM=; b=OdQ/W1TZQ1ilGM+aAPnSLPbdFN
	a/D4P93huYgKtdajFCuy8U7BNFnCybw55f8XBOGIjA7wjY49CpYFYKwEcr94QMu7GayzMOUufV9xp
	xlU06O2SNAsbH3tQdc7OmXScu+dzMNxCl22pWiXGgr/EL6Klp/gsYTbMIEaEkmxWV9Oq557I0WdzL
	9IZxnjg5h3tgKhzHFBJpTJE/5azorri1GNBYMLQgu8j8iZkOKobgAa1NtkOR5Ez/26f2GEfL1v7rr
	vdy0j0dXZ4tFlTmUzxTJ3dSwI2gvf35IWCWu5Ygf91ZFnmuU8TEVKx+fifMaNvxp7K1rk2VpcoAlh
	5skpi3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4df-000000065LU-1IBY;
	Tue, 25 Mar 2025 13:48:19 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Q5-000000062pz-2sxP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:34:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7921F4326B;
	Tue, 25 Mar 2025 13:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742909654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cp05A3ncq1r6TSS05Wy5wCIMMlphKX62znrx7IOhkM=;
	b=MT2bSinCIIJxoo+uZCXE8NobKCTATTnWXSLD+MEYn1Cbf0q4yFnCAHXwi7ksKtomi1kgg4
	O53gziaEH8muXl8V/mn5SPTQGdDkfmaMSRo3TtqiLLSN8293XcL/Pxxs4bUTrjTf2tQYd2
	MQ51TNmeNIjidkLjLWUbWNJG/219tsbchKjtxidLuHMOZV2FItfl8OvXmBsn/k7Yd2ol+Q
	Z3u58uwdkRWt64sXtcPrXNOTFr0oVKegRhq2yRQnnRxTszSKn1CON//EGSI4xq0vgtXund
	ZyndzuyJ25ixCMaNHcdqMAPW+1Ht4zbieVJUeCeNfX7RUgTTu3vFr95AEDZw5A==
Date: Tue, 25 Mar 2025 14:34:11 +0100
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
Subject: Re: [PATCH net-next v4 5/8] net: ethtool: netlink: Introduce
 per-phy DUMP helpers
Message-ID: <20250325143411.241053ec@kmaincent-XPS-13-7390>
In-Reply-To: <20250324104012.367366-6-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-6-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_063417_874410_03E89F33 
X-CRM114-Status: GOOD (  20.92  )
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

On Mon, 24 Mar 2025 11:40:07 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> As there are multiple ethnl commands that report messages based on
> phy_device information, let's introduce a set of ethnl generic dump
> helpers to allow DUMP support for each PHY on a given netdev.
>=20
> This logic iterates over the phy_link_topology of each netdev (or a
> single netdev for filtered DUMP), and call ethnl_default_dump_one() with
> the req_info populated with ifindex + phyindex.
>=20
> This allows re-using all the existing infra for phy-targetting commands
> that already use ethnl generic helpers.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V4 : No changes
>=20
>  net/ethtool/netlink.c | 78 +++++++++++++++++++++++++++++++++++++++++++
>  net/ethtool/netlink.h |  6 ++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index 0345bffa0678..171290eaf406 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -560,6 +560,84 @@ static int ethnl_default_dump_one(struct sk_buff *sk=
b,
>  	return ret;
>  }
> =20
> +/* Specific context for phy-targeting command DUMP operatins. We keep in
> context
> + * the latest phy_index we dumped, in case of an interrupted DUMP.
> + */
> +struct ethnl_dump_ctx_perphy {
> +	unsigned long phy_index;
> +};
> +
> +/**
> + * ethnl_dump_start_perphy() - Initialise a dump for PHY cmds
> + * @ctx: Generic ethnl dump context whose cmd_ctx will be initialized
> + *
> + * Initializes a dump context for ethnl commands that may return
> + * one message per PHY on a single netdev.
> + *
> + * Returns: 0 for success, a negative value for errors.

Minimal nitpick. In the kernel doc Return does not take a s.

> +/**
> + * ethnl_dump_one_dev_perphy() - Dump all PHY-related messages for one n=
etdev
> + * @skb: skb containing the DUMP result
> + * @ctx: Dump context. Will be kept across the DUMP operation.
> + * @info: Genl receive info
> + *
> + * Some commands are related to PHY devices attached to netdevs. As there
> may be
> + * multiple PHYs, this DUMP handler will populate the reply with one mes=
sage
> per
> + * PHY on a single netdev.
> + *
> + * Returns: 0 for success or when nothing to do, a negative value otherw=
ise.

Same.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

