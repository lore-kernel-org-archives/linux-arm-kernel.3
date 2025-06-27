Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895E2C83028
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAnce52V/7SwBr3WQruM3/+NAZWkJnhagjSqlHXqpIA=; b=VSEPTuqjmI5FTiqL8H2gfkzlJz
	uHot9aIZ9za4O99ybsJJPJoJ11l9Plc3JTc+TZlcDyiHwbta6jXWD/tpRM34s5P8L7CTh6oMuo13d
	0dUmknVTXTjNyGkjS7uYQI+awPsMbtu3MamnhpO+mbnnWQTE9ZBl0YFXjKRZ6CX27cxwY2FglX5LH
	X1EICJivCp7pSfnf/f0uz6SOKPPMI7Ap1KDI3DKfA1xtc9pLnj366TZhUgo3adylzc0nQuLYW+0p/
	byimYGxfeqzE4FalvzkzFZCRgIcl+4nmac9uacb1E2vqUTHx7X0nkOswsnEr30DqWMt/cp44oKqUO
	8QenIdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEN0-0000000FYAH-3sec;
	Fri, 27 Jun 2025 19:04:18 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCTb-0000000FLwO-1xT2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1DA744350;
	Fri, 27 Jun 2025 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAnce52V/7SwBr3WQruM3/+NAZWkJnhagjSqlHXqpIA=;
	b=fCcRrGSN3as1/zQoH2mX7cN5ay6JkjjHj6uY+Su6E4xXpDAJxmy8rmKCgxRjG4rK+Kl3hw
	7ibhJeoW3YJBaf+bOw5lL9rb2hNcY4CVBZ0aVD3RQwyZyHn7+g5j4PyMJlOLEPuiP12vSJ
	+s509tkTytzi8jhvwLGK9gUX6/Zz0f5IUI4s3YzbJhVzh4gXlMWHKQsYsfqGkNGCGR+KiK
	KYO8vNCLDeqg3OPBjehqor0XhVidsSO0rOqkSvPum195Wzzn8pODgQ6hUL4G3gF8LVPrmJ
	2ON27Whj3Rj4YElvP6C0NrY7/gHK71xrCnkmB2VX7au7GtDFAb1pjHt2eQCeEQ==
Date: Fri, 27 Jun 2025 19:02:50 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
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
Message-ID: <20250627190250.63a1848a@fedora>
In-Reply-To: <20250513155325.2f423087@kmaincent-XPS-13-7390>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
	<20250513155325.2f423087@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_100259_643381_7CAB4206 
X-CRM114-Status: GOOD (  34.42  )
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

Hi Kory,

On Tue, 13 May 2025 15:53:25 +0200
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed,  7 May 2025 15:53:19 +0200
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > Ethernet provides a wide variety of layer 1 protocols and standards for
> > data transmission. The front-facing ports of an interface have their own
> > complexity and configurability.
> > 
> > Introduce a representation of these front-facing ports. The current code
> > is minimalistic and only support ports controlled by PHY devices, but
> > the plan is to extend that to SFP as well as raw Ethernet MACs that
> > don't use PHY devices.
> > 
> > This minimal port representation allows describing the media and number
> > of lanes of a port. From that information, we can derive the linkmodes
> > usable on the port, which can be used to limit the capabilities of an
> > interface.
> > 
> > For now, the port lanes and medium is derived from devicetree, defined
> > by the PHY driver, or populated with default values (as we assume that
> > all PHYs expose at least one port).
> > 
> > The typical example is 100M ethernet. 100BaseT can work using only 2
> > lanes on a Cat 5 cables. However, in the situation where a 10/100/1000
> > capable PHY is wired to its RJ45 port through 2 lanes only, we have no
> > way of detecting that. The "max-speed" DT property can be used, but a
> > more accurate representation can be used :
> > 
> > mdi {
> > 	connector-0 {
> > 		media = "BaseT";
> > 		lanes = <2>;
> > 	};
> > };
> > 
> > From that information, we can derive the max speed reachable on the
> > port.
> > 
> > Another benefit of having that is to avoid vendor-specific DT properties
> > (micrel,fiber-mode or ti,fiber-mode).
> > 
> > This basic representation is meant to be expanded, by the introduction
> > of port ops, userspace listing of ports, and support for multi-port
> > devices.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>  
> 
> ...
> 
> > +	for_each_available_child_of_node_scoped(mdi, port_node) {
> > +		port = phy_of_parse_port(port_node);
> > +		if (IS_ERR(port)) {
> > +			err = PTR_ERR(port);
> > +			goto out_err;
> > +		}
> > +
> > +		port->parent_type = PHY_PORT_PHY;
> > +		port->phy = phydev;
> > +		err = phy_add_port(phydev, port);
> > +		if (err)
> > +			goto out_err;  
> 
> I think of_node_put(port_node) is missing here.

I don't think so, this is the _scoped variant so it takes care of
that for us.

> 
> ...
> 
> > @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
> >  void phy_mac_interrupt(struct phy_device *phydev);
> >  void phy_start_machine(struct phy_device *phydev);
> >  void phy_stop_machine(struct phy_device *phydev);
> > +  
> 
> New empty line here?

Oops, this will be removed

> > +/**
> > + * struct phy_port - A representation of a network device physical interface
> > + *
> > + * @head: Used by the port's parent to list ports
> > + * @parent_type: The type of device this port is directly connected to
> > + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> > + * @ops: Callback ops implemented by the port controller
> > + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> > applicable
> > + * @mediums: Bitmask of the physical mediums this port provides access to
> > + * @supported: The link modes this port can expose, if this port is MDI (not
> > MII)
> > + * @interfaces: The MII interfaces this port supports, if this port is MII
> > + * @active: Indicates if the port is currently part of the active link.
> > + * @is_serdes: Indicates if this port is Serialised MII (Media Independent
> > + *	       Interface), or an MDI (Media Dependent Interface).
> > + */
> > +struct phy_port {
> > +	struct list_head head;
> > +	enum phy_port_parent parent_type;
> > +	union {
> > +		struct phy_device *phy;
> > +	};  
> 
> The union is useless here?

For now yes :( But this will change when adding support for
non-phy-driver ports.

Maxime

> 
> Regards,


