Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB38C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0Y4rbi2Stkd9XDs1slFcKcfqbdAPedwVnV7eZWlBTw=; b=ZGWHbCl3sE9aU6B50me1t0VmQv
	UvRL8x/FhSZiAETKBJVgcNZjO7yiKjCvpiXOnDRWQ16vE/GKRXOiPG18j9Bs3OIbGbqETiHFoPk7N
	FDkIXs43K9FGgEOlGA+E/GSNMxxCrwqqZvVjpjP9Ey6R5Ts5SgUEKCzPRDFF68Wj5ExSKb24/pnkT
	UwBaVqqTuctNX5Jleg1jOxLgOxRTCuJN+VPcbXkO+i7prrMIT01qV89rh+M7sCIx1u3KyYrRo8Txe
	X0xYLNR7GlYz/meKQMKJbIVkHxkIjprWj/RHIsWTiBVCdE2TbPhm2Esq0sYrwVbjLKh89jlBbsB+I
	7M0pvYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4H6-000000061K0-0WVV;
	Tue, 25 Mar 2025 13:25:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4FM-0000000610q-1IyU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 13:23:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 422A44328C;
	Tue, 25 Mar 2025 13:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742908990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0Y4rbi2Stkd9XDs1slFcKcfqbdAPedwVnV7eZWlBTw=;
	b=LKMr+1s0QxpyenqwrJ5FOsOMT1KFchsJR6tnFf5EfFKfkrdU7q7IsdRiVQ9jcVQn5HgHSv
	x8+0tNH4e4gH240CDTEsp4Uu3ygcWKyf0ghT60MSmgag2pqNY73ofHiw5rJpcCodkNhUlA
	NC5S73rmFOSsEGNoKCtCCAoELK6mRmfRJR+m8OaJAccw4rLoaR9j9syGYosyKcDhZ+WVJU
	SmYIXi6y1V+2ozKMIrrOBnU73GBomJ3UigtQBdwWGaF14Xx1GjSI83zDvLfpcfY9/jvYII
	hZeazBA8DcAuYlVVyBQH3Bjh62QYG0KYUi49KYarNbcH5hlPFW8IzBjRc9+k0A==
Date: Tue, 25 Mar 2025 14:23:07 +0100
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
Subject: Re: [PATCH net-next v4 4/8] net: ethtool: netlink: Introduce
 command-specific dump_one_dev
Message-ID: <20250325142307.7c1b229d@kmaincent-XPS-13-7390>
In-Reply-To: <20250324104012.367366-5-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-5-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvjeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_062312_485764_D970DA95 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, 24 Mar 2025 11:40:06 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Prepare more generic ethnl DUMP hanldling, by allowing netlink commands
> to register their own dump_one_dev() callback. This avoids having to
> roll with a fully custom genl ->dumpit callback, allowing the re-use
> of some ethnl plumbing.
>=20
> Fallback to the default dump_one_dev behaviour when no custom callback
> is found.
>=20
> The command dump context is maintained within the ethnl_dump_ctx, that
> we move in netlink.h so that command handlers can access it.
>=20
> This context can be allocated/freed in new ->dump_start() and
> ->dump_done() callbacks. =20
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V4 : No changes
>=20
>  net/ethtool/netlink.c | 61 +++++++++++++++++++++++++------------------
>  net/ethtool/netlink.h | 35 +++++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 26 deletions(-)
>=20
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index 63ede3638708..0345bffa0678 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -339,24 +339,6 @@ int ethnl_multicast(struct sk_buff *skb, struct
> net_device *dev)=20
>  /* GET request helpers */
> =20
> -/**
> - * struct ethnl_dump_ctx - context structure for generic dumpit() callba=
ck
> - * @ops:        request ops of currently processed message type
> - * @req_info:   parsed request header of processed request
> - * @reply_data: data needed to compose the reply
> - * @pos_ifindex: saved iteration position - ifindex
> - *
> - * These parameters are kept in struct netlink_callback as context prese=
rved
> - * between iterations. They are initialized by ethnl_default_start() and=
 used
> - * in ethnl_default_dumpit() and ethnl_default_done().
> - */
> -struct ethnl_dump_ctx {
> -	const struct ethnl_request_ops	*ops;
> -	struct ethnl_req_info		*req_info;
> -	struct ethnl_reply_data		*reply_data;
> -	unsigned long			pos_ifindex;
> -};
> -
>  static const struct ethnl_request_ops *
>  ethnl_default_requests[__ETHTOOL_MSG_USER_CNT] =3D {
>  	[ETHTOOL_MSG_STRSET_GET]	=3D &ethnl_strset_request_ops,
> @@ -540,9 +522,9 @@ static int ethnl_default_doit(struct sk_buff *skb, st=
ruct
> genl_info *info) return ret;
>  }
> =20
> -static int ethnl_default_dump_one_dev(struct sk_buff *skb, struct net_de=
vice
> *dev,
> -				      const struct ethnl_dump_ctx *ctx,
> -				      const struct genl_info *info)
> +static int ethnl_default_dump_one(struct sk_buff *skb,
> +				  const struct ethnl_dump_ctx *ctx,
> +				  const struct genl_info *info)
>  {
>  	void *ehdr;
>  	int ret;
> @@ -553,15 +535,15 @@ static int ethnl_default_dump_one_dev(struct sk_buff
> *skb, struct net_device *de if (!ehdr)
>  		return -EMSGSIZE;
> =20
> -	ethnl_init_reply_data(ctx->reply_data, ctx->ops, dev);
>  	rtnl_lock();
> -	netdev_lock_ops(dev);
> +	netdev_lock_ops(ctx->reply_data->dev);
>  	ret =3D ctx->ops->prepare_data(ctx->req_info, ctx->reply_data, info);
> -	netdev_unlock_ops(dev);
> +	netdev_unlock_ops(ctx->reply_data->dev);
>  	rtnl_unlock();
>  	if (ret < 0)
>  		goto out;
> -	ret =3D ethnl_fill_reply_header(skb, dev, ctx->ops->hdr_attr);
> +	ret =3D ethnl_fill_reply_header(skb, ctx->reply_data->dev,
> +				      ctx->ops->hdr_attr);

Instead of modifying all these lines you could simply add this at the begin=
ning:
struct net_device *dev =3D ctx->reply_data->dev;

With that:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

