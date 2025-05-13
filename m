Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E8FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvdNMKNfVdO994gBBMv5mj9apu0nbjOHK5Q4DGEIP2k=; b=odzo84mim3MPUtNOoqbPOO6mhE
	/Ng2dwaiKzstNMI6ztqbih0D1BhkwNKlJY2Qlck31l6A6kpuuAfKewaB4ioHrupLKytmRbAuGbg45
	zoch3hJbNK4d7N8QLYvykfKX67Sx8Mc76JtRWYGo7b2zHhO4XVZ2eEbHupFEp8cD7fRryLqhDhXeE
	EQ+h31qCp8XM+U6CkFNC51kFhfLltLAAtR5MYjdG35PMfGjyxN0wz00YBcu1WMm0wlj2AJSPIWEPc
	AWtDhuCT5nnZcJ6gBEZlBeqU9hI2dywTFXBKldiOJciOn6bZeNjY7QDFyJEgFYz/ErS0Li32ZOaXq
	4PA2LIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqAO-0000000CYdx-1Zmb;
	Tue, 13 May 2025 13:59:32 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEq4b-0000000CXro-3OL7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 13:53:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0991443B08;
	Tue, 13 May 2025 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747144411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvdNMKNfVdO994gBBMv5mj9apu0nbjOHK5Q4DGEIP2k=;
	b=FbAAkOOHb7oofcvEcbkxOSpyVepJcAwlvz1Pxcu0bQYZbAtqd9TUuacDVLKV6g59Gd2W7b
	38mesvsylubAzEuBYo2zPkyrXWtT5E97UlqkLNmseqXabcZbdiFJwIKbE+ZYeiqeonruH+
	IcxC4FvdjJUitD4KSbRf4XcJC8lPEggIyp9PqrlII0zatRNdbFkHIE/o3dmDZdeWeAvDSf
	DGXo+TYbs9hRpYZ+WNmMEDpcJUU9UZ9rVKPh7hfzTG9NCehr4eaO9zq/gInwlBB1JXtyfn
	RVOBpDLdkee8IwcVLha+9uUUBHi3lGrX4tXGHaGQ3rQJKTlQdcuVJTsB9yGQAA==
Date: Tue, 13 May 2025 15:53:25 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250513155325.2f423087@kmaincent-XPS-13-7390>
In-Reply-To: <20250507135331.76021-4-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudgrmeeiudemjehfkegtmegurgehjeemfeehsggsmegttdejudemiegsvdgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdurgemiedumeejfhektgemuggrheejmeefhegssgemtgdtjedumeeisgdvsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpt
 hhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_065334_166536_28C0A5E2 
X-CRM114-Status: GOOD (  27.70  )
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

On Wed,  7 May 2025 15:53:19 +0200
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Ethernet provides a wide variety of layer 1 protocols and standards for
> data transmission. The front-facing ports of an interface have their own
> complexity and configurability.
>=20
> Introduce a representation of these front-facing ports. The current code
> is minimalistic and only support ports controlled by PHY devices, but
> the plan is to extend that to SFP as well as raw Ethernet MACs that
> don't use PHY devices.
>=20
> This minimal port representation allows describing the media and number
> of lanes of a port. From that information, we can derive the linkmodes
> usable on the port, which can be used to limit the capabilities of an
> interface.
>=20
> For now, the port lanes and medium is derived from devicetree, defined
> by the PHY driver, or populated with default values (as we assume that
> all PHYs expose at least one port).
>=20
> The typical example is 100M ethernet. 100BaseT can work using only 2
> lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> way of detecting that. The "max-speed" DT property can be used, but a
> more accurate representation can be used :
>=20
> mdi {
> 	connector-0 {
> 		media =3D "BaseT";
> 		lanes =3D <2>;
> 	};
> };
>=20
> From that information, we can derive the max speed reachable on the
> port.
>=20
> Another benefit of having that is to avoid vendor-specific DT properties
> (micrel,fiber-mode or ti,fiber-mode).
>=20
> This basic representation is meant to be expanded, by the introduction
> of port ops, userspace listing of ports, and support for multi-port
> devices.
>=20
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

...

> +	for_each_available_child_of_node_scoped(mdi, port_node) {
> +		port =3D phy_of_parse_port(port_node);
> +		if (IS_ERR(port)) {
> +			err =3D PTR_ERR(port);
> +			goto out_err;
> +		}
> +
> +		port->parent_type =3D PHY_PORT_PHY;
> +		port->phy =3D phydev;
> +		err =3D phy_add_port(phydev, port);
> +		if (err)
> +			goto out_err;

I think of_node_put(port_node) is missing here.

...

> @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
>  void phy_mac_interrupt(struct phy_device *phydev);
>  void phy_start_machine(struct phy_device *phydev);
>  void phy_stop_machine(struct phy_device *phydev);
> +

New empty line here?

> +/**
> + * struct phy_port - A representation of a network device physical inter=
face
> + *
> + * @head: Used by the port's parent to list ports
> + * @parent_type: The type of device this port is directly connected to
> + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> + * @ops: Callback ops implemented by the port controller
> + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> applicable
> + * @mediums: Bitmask of the physical mediums this port provides access to
> + * @supported: The link modes this port can expose, if this port is MDI =
(not
> MII)
> + * @interfaces: The MII interfaces this port supports, if this port is M=
II
> + * @active: Indicates if the port is currently part of the active link.
> + * @is_serdes: Indicates if this port is Serialised MII (Media Independe=
nt
> + *	       Interface), or an MDI (Media Dependent Interface).
> + */
> +struct phy_port {
> +	struct list_head head;
> +	enum phy_port_parent parent_type;
> +	union {
> +		struct phy_device *phy;
> +	};

The union is useless here?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

