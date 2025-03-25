Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDC6C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lfrh2U3s5gJkhXevgALQGNGwSRMvmBuZkh+1nqK6iiw=; b=FycwaAsrvkNUXyF6iQTjA6+Zj1
	rKE5qaurTFWwT18esdBX2GWld/kXwbxhuGw3/6gnUxlLeocCR0/cEFaa7wlFkWGBXQj4UOlEC9MZh
	Eyo1EugFwrakxPFHsZuTHVyygMfZxm32zvqya7DcKSd7rpDz7KTD5UJzyEli4IB5rQy8hyRrtBzM/
	FqxY6F3RAWwL7LMnZYRaWEg95u65JJqp7/Xxdob9hHsT7LDEOMlQhzty0thkHb7lGfCViDYgonRfG
	0Zv3ve5ODuOyPK+uDn+BcLVq7bIVMFPzabijBagWTVf4UnA4n6LI6npzEwxEyBbwDVhsKTa9rC4Cx
	RErs/b4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2Sq-00000005dXW-1lSj;
	Tue, 25 Mar 2025 11:29:00 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2R6-00000005dPf-2YjE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:27:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8315643152;
	Tue, 25 Mar 2025 11:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742902029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lfrh2U3s5gJkhXevgALQGNGwSRMvmBuZkh+1nqK6iiw=;
	b=f0UULc8QP2HFxL2IDc1MxICDn1HxX6bk+rIOjyQkUMX8Jftk/Cg8VIU6gyn7iz3houuF69
	ZYqGoajDkXeshwoA46cMlw/AQD6DC4aHfs97vZSZiPKi2RlxnoTSbUDHscqs6D0dn9tqiq
	VOsMsdojlkK0P8vxpZtWHWe2Z6oFn6ZBPbDm9VfVvW+tj5k1I7azoSt7pShbjVrolDC9q9
	zZyDj5V3bNNHVh4UFW3gPDsLSBn5V8BFJ7Hm556Oh2Bw6j3pl94NH8hZZH+PejapK/mKIg
	2R0hccHCWaeP2BeJ3Fg7sWueDGZoao27rAjws7KaRrYLt3TZuZrKE+pYWACsoQ==
Date: Tue, 25 Mar 2025 12:27:06 +0100
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
Subject: Re: [PATCH net-next v4 2/8] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
Message-ID: <20250325122706.5287774d@kmaincent-XPS-13-7390>
In-Reply-To: <20250324104012.367366-3-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-3-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_042712_953823_99232283 
X-CRM114-Status: GOOD (  23.70  )
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

On Mon, 24 Mar 2025 11:40:04 +0100
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

...

> +
>  /* generic ->start() handler for GET requests */
>  static int ethnl_default_start(struct netlink_callback *cb)
>  {
> @@ -636,10 +659,10 @@ static int ethnl_default_start(struct netlink_callb=
ack
> *cb) }
> =20
>  	ret =3D ethnl_default_parse(req_info, &info->info, ops, false);
> -	if (req_info->dev) {
> -		/* We ignore device specification in dump requests but as the
> -		 * same parser as for non-dump (doit) requests is used, it
> -		 * would take reference to the device if it finds one
> +	if (req_info->dev && !ops->allow_pernetdev_dump) {
> +		/* We ignore device specification in unfiltered dump requests
> +		 * but as the same parser as for non-dump (doit) requests is
> +		 * used, it would take reference to the device if it finds

This means the dump will have a different behavior in case of filtered dump
(allow_pernetdev_dump) or standard dump.
The standard dump will drop the interface device so it will dump all interf=
aces
even if one is specified.
The filtered dump will dump only the specified interface.=20
Maybe it would be nice to have the same behavior for the dump for all the
ethtool command.
Even if this change modify the behavior of the dump for all the ethtool com=
mands
it won't be an issue as the filtered dump did not exist before, so I suppos=
e it
won't break anything. IMHO it is safer to do it now than later, if existing
ethtool command adds support for filtered dump.
We should find another way to know the parser is called from dump or doit.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

