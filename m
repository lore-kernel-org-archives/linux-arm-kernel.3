Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgsLfidqIhlHf3EJwMY3mp/OkWEZkG2Dv0GxRVFknvc=; b=VimU9Z7etnb9wQU9yXlDvzALK9
	KLeAGtPZWHKSRe0i1rtcLY2KEOfVad5pD+R2L0ZboMvXicIFfHc0gdNOhDUwDRMvFJAI+Wu4WDiWe
	hiP4zaH9PITR7qu0grqA37YsfRi9OOD5jUDrAs+UOGFimDvYOp6NxSAgHw0h3TTKHIcbzFrRVWJ8v
	sLVSt9HdX2VQ0zOcUvQIBPFsxxcQKWuaxADJ7xz7L3HVR3IUeyJ+FY7cqiYOLucBSc5J1Asv/NZIC
	IE+RJzTIbglg4co6TaYepfH2Lki1hstukuCASwhmqnF89ZFlnGX7LF2aC6rRj2XulcZMFHnxlgksa
	FiYjDPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trbTW-00000002SZG-17Az;
	Mon, 10 Mar 2025 11:39:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traqX-00000002Lwg-2B58
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 10:58:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 559DC433E9;
	Mon, 10 Mar 2025 10:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741604331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgsLfidqIhlHf3EJwMY3mp/OkWEZkG2Dv0GxRVFknvc=;
	b=TzK4TmYsJBOQ5EYDy0mNyCM+pPktsxgHe5f34lRQAb1LQs5uS5VyA218yw0AkE8fpCMCL1
	pzQnDO4egdAuf7MZXDr1+8GWzOp1zQOES7kdoOwdl2HzSI9lnsfps61eXrAxqKghyKd3NN
	bWcJIldW27eXbth5gnGWiY8gevMuSdKg7bhAX1ycZuJTJAz0cAs99B+NhCHivdCulu/YMs
	IZBRqfk37H+eti87iJU7/HUEy+ky0Ax9eZznJezoxJgpZY82UdjzZGNBw0opsstWhVXTmg
	cXwWDUKidx9ZEoBlOUpMuNhmC9cfvGv26ET+8k8ThPB3jz+V16sCf2jaXi0fDA==
Date: Mon, 10 Mar 2025 11:58:45 +0100
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
Subject: Re: [PATCH net-next v2 1/7] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
Message-ID: <20250310115845.17a04100@kmaincent-XPS-13-7390>
In-Reply-To: <20250308155440.267782-2-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
	<20250308155440.267782-2-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudeludejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_035858_321424_A5BF9CB2 
X-CRM114-Status: GOOD (  22.80  )
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

On Sat,  8 Mar 2025 16:54:33 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> We have a number of netlink commands in the ethnl family that may have
> multiple objects to dump even for a single net_device, including :
>=20
>  - PLCA, PSE-PD, phy: one message per PHY device
>  - tsinfo: one message per timestamp source (netdev + phys)
>  - rss: One per RSS context
>=20
> To get this behaviour, these netlink commands need to roll a custom
> ->dumpit(). =20
>=20
> To prepare making per-netdev DUMP more generic in ethnl, introduce a
> member in the ethnl ops to indicate if a given command may allow
> pernetdev DUMPs (also referred to as filtered DUMPs).
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2: - Rebase
>     - Fix kdoc
>     - Fix bissectabilitu by using the right function names
>=20
>  net/ethtool/netlink.c | 45 ++++++++++++++++++++++++++++---------------
>  net/ethtool/netlink.h |  2 ++
>  2 files changed, 31 insertions(+), 16 deletions(-)
>=20
> diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> index 70834947f474..11e4122b7707 100644
> --- a/net/ethtool/netlink.c
> +++ b/net/ethtool/netlink.c
> @@ -586,21 +586,34 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
>  	int ret =3D 0;
> =20
>  	rcu_read_lock();
> -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> -		dev_hold(dev);
> +	if (ctx->req_info->dev) {
> +		dev =3D ctx->req_info->dev;
>  		rcu_read_unlock();
> -
> -		ret =3D ethnl_default_dump_one(skb, dev, ctx,
> genl_info_dump(cb)); -
> +		/* Filtered DUMP request targeted to a single netdev. We
> already
> +		 * hold a ref to the netdev from ->start()
> +		 */
> +		ret =3D ethnl_default_dump_one(skb, dev, ctx,
> +					     genl_info_dump(cb));
>  		rcu_read_lock();
> -		dev_put(dev);
> -
> -		if (ret < 0 && ret !=3D -EOPNOTSUPP) {
> -			if (likely(skb->len))
> -				ret =3D skb->len;
> -			break;

You are not checking -EOPNOTSUPP, so you can return this error in the
ctx->req_info->dev condition. I am not sure about the policy but do we want=
 to
report the EOPNOTSUPP error in the dump command instead of simply returning
nothing.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

