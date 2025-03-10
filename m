Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F39C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pre1cSCwMLHczqZ320YehUnrIubHHxclwoUWIKmSuYM=; b=1hZ8sKX+1aJZVDvFMgCsHtvtDV
	+LFIWOcXwiNar2NPz/eaDZFVfbTIBJy8TzzIp3u4gXTMhAsGPwVrpBanp9mMUsnH/BisFasoSU70G
	5QdgquTya7TU2gr6ncpJ5rgmfU8nXRCyjDUy6MabxSudOv87kS56ninFvLRQab8lKALs7V/nWz1kR
	rUqO1dEzx4EuzWoGV0D6xJAV1W/v13FtvYRJIGpQkSM8WyYgI3vkGWHtxdVkTgTU0f3uKeNTnrnCJ
	vmtMrn1Bu7KZTsMltBqxvOrLqyd7whPsT+g/KXBQCoZ2KVUOcPYIzk9uMBZoboajzIHmakOIbeBus
	+8vP2R6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcQc-00000002ebp-2o2G;
	Mon, 10 Mar 2025 12:40:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trc84-00000002adb-4BIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:21:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F34EB41DF6;
	Mon, 10 Mar 2025 12:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741609267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pre1cSCwMLHczqZ320YehUnrIubHHxclwoUWIKmSuYM=;
	b=KzKTd0NL0Gh0+LAjVx7C1mOxj0epcbNR7LZUlElc9gq/dUVHVQGK3VtS1ICqHMQYSrITzd
	FWu2rwS0OJAfbiKaMZAO1OVIpTvX0/C4cuM50Kfg0AgmAxZdqgf6riug27aQVU4AUs8NuP
	OOPDbHfUO2fGM/6oDuJL+cFU/WdQx+t+BJTD8hv1mSuF9ttVGwxfoYV0SpniSJw4gbb+2i
	dmiSSTc8LNnGwb3m8vtkLCk77NaNfFTMc2n2ipXzjdH6DxQTIEp0qHcm0MaekdR+OZWsT4
	Jwa0Qa3an69kdqyhSOiz3ACUcbBFPUHKaE0I/Pbhs5dC7RV4a4ihlgtUiRyxDg==
Date: Mon, 10 Mar 2025 13:21:03 +0100
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
Subject: Re: [PATCH net-next v2 4/7] net: ethtool: netlink: Introduce
 per-phy DUMP helpers
Message-ID: <20250310132103.1312d1b6@kmaincent-XPS-13-7390>
In-Reply-To: <20250308155440.267782-5-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
	<20250308155440.267782-5-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052109_163210_667FB503 
X-CRM114-Status: GOOD (  22.93  )
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

On Sat,  8 Mar 2025 16:54:36 +0100
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
> V2: Rebase
>=20
>  net/ethtool/netlink.c | 53 +++++++++++++++++++++++++++++++++++++++++++
>  net/ethtool/netlink.h |  6 +++++
>  2 files changed, 59 insertions(+)
>=20
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index ae06b72239a8..a09bcd67b38f 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -559,6 +559,59 @@ static int ethnl_default_dump_one(struct sk_buff *sk=
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
> +int ethnl_dump_start_perphy(struct ethnl_dump_ctx *ctx)

Could you add comments or event better, kdoc for non static function to exp=
lain
their purpose.

> +{
> +	struct ethnl_dump_ctx_perphy *dump_ctx;
> +
> +	dump_ctx =3D kzalloc(sizeof(*dump_ctx), GFP_KERNEL);
> +	if (!dump_ctx)
> +		return -ENOMEM;
> +
> +	ctx->cmd_ctx =3D dump_ctx;
> +
> +	return 0;
> +}
> +
> +void ethnl_dump_done_perphy(struct ethnl_dump_ctx *ctx)

same.

> +{
> +	kfree(ctx->cmd_ctx);
> +}
> +
> +int ethnl_dump_one_dev_perphy(struct sk_buff *skb,
> +			      struct ethnl_dump_ctx *ctx,
> +			      const struct genl_info *info)

same.

> +{
> +	struct ethnl_dump_ctx_perphy *dump_ctx =3D ctx->cmd_ctx;
> +	struct net_device *dev =3D ctx->reply_data->dev;
> +	struct phy_device_node *pdn;
> +	int ret =3D 0;
> +
> +	if (!dev->link_topo)
> +		return 0;
> +
> +	xa_for_each_start(&dev->link_topo->phys, dump_ctx->phy_index,
> +			  pdn, dump_ctx->phy_index) {
> +		ctx->req_info->phy_index =3D dump_ctx->phy_index;
> +
> +		/* We can re-use the original dump_one as ->prepare_data in
> +		 * commands use ethnl_req_get_phydev(), which gets the PHY
> from
> +		 * what's in req_info
> +		 */
> +		ret =3D ethnl_default_dump_one(skb, ctx, info);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}

Regards,
---
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

