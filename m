Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA864C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3F19ni0D0rMQE6sBKRDx0Kq08dUhlD3d42RuDyW7RI=; b=QA/grPm2VxtMjcIZpOHTgsCHTA
	Sfgv/j/91Z13TEUXagoXoB8XjFiewAlPAq+apQCU/v1jBUPFSqhMZlFp7nNVfckb4Kiit8BxP9pIu
	96/OVreV5d+a0wJDuznWiwtwYtxoqyJ7hTH2eGabInG/WTzrb52OWai/lSMFjTzK+Hta6yfLsGWJA
	b5uquRsJTHwYIA7A4xPzPS269k07MonUEr/g8cbAw+QgYXxJXXnmPRzCMSvAnkB6qiZUTQzcsmZwG
	+Y7J8b+oDffo3AoeaF3QutanPdTLPSsGu1l6a5W3i1d9hSTZQyNvpdMe9xH7fIlTFQqrH/ltypswm
	aON0ubmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwAa-0000000AfYi-2Jxb;
	Mon, 04 Aug 2025 14:28:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivKH-0000000AY5e-03un
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 13:34:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23EB744278;
	Mon,  4 Aug 2025 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754314440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3F19ni0D0rMQE6sBKRDx0Kq08dUhlD3d42RuDyW7RI=;
	b=JAUh1LIjf6sGsOeF1M+6HCgaexWuinu/lk6NSlxbE3jGH4S88jLQU9gZfO1w8D7RWs93fj
	jzkTPbtsGSWQFf+egVqwudIj/F6hANfSBIkTqtPA2GOgPtmgUI0veeF4GKl46le5yeQ5Do
	9AI4hsZQ32HS/pnkncf9m5AVEUsbCgMDN5GONSwawocMO/mzk6MN9NoZ7nniKjF79jJr2n
	OJru1HkcpnIeQKmRk5MEfzHpHUhuYJB7vP5sGLTMyY88+gyMibvYYhNjfEf1eQlGc9n/d8
	C+xRQDPkZS34u4RTd1cvKmmRPIZ/lr+FvXzFH56cE/NT4824/vShpuFXkyWD+A==
Date: Mon, 4 Aug 2025 15:33:53 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250804153353.1d83f8ab@fedora.home>
In-Reply-To: <a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
	<20250722121623.609732-5-maxime.chevallier@bootlin.com>
	<a915e167-1490-4a20-98a8-35b4e5c6c23c@lunn.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddvgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063405_366696_AABD8925 
X-CRM114-Status: GOOD (  22.67  )
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

On Sat, 26 Jul 2025 22:33:33 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

> > +
> > +/**
> > + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> > + * @supported: After this call, contains all possible linkmodes on a given medium,
> > + *	       and with the given number of lanes.  
> 
> Maybe nit picking, but maybe append:
> 
> , or less.
> 
> > +		/* For most cases, min_lanes == lanes, except for 10/100BaseT that work
> > +		 * on 2 lanes but are compatible with 4 lanes mediums
> > +		 */
> > +		if (link_mode_params[i].mediums & BIT(medium) &&
> > +		    link_mode_params[i].lanes >= lanes &&
> > +		    link_mode_params[i].min_lanes <= lanes) {  
> 
> We should only care about min_lanes here. I don't think the
> link_mode_params[i].lanes >= lanes is needed.
> 
> Maybe you can add a BUILD_BUG_ON() into the macro to ensure
> min_lanes <= lanes?
> 
> > +struct phy_port *phy_of_parse_port(struct device_node *dn)
> > +{
> > +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> > +	enum ethtool_link_medium medium;
> > +	struct phy_port *port;
> > +	const char *med_str;
> > +	u32 lanes, mediums = 0;
> > +	int ret;
> > +
> > +	ret = fwnode_property_read_u32(fwnode, "lanes", &lanes);
> > +	if (ret)
> > +		lanes = 0;  
> 
> The DT binding says that both properties are required. So i think this
> should be:
> 
> 		return ret;

Ah true indeed, let me fix that then :)

> 
> > + * phy_port_get_type() - get the PORT_* attribut for that port.  
> 
> attribut_e_
> 
> > +	 * If the port isn't initialized, the port->mediums and port->lanes
> > +	 * fields must be set, possibly according to stapping information.  
> 
> st_r_apping
> 
> 	Andrew

Sorry for all the typos, it's a weak excuse but lately my laptop's
keayboard has been acting up, and it either misses strokes or gets the
letters stuck in repeat-mode. Russell has similar issues, so I'm still
unsure if this is a hardware or software thing... I'll install and pass
spellcheck for the next iteration to avoid that :)

Maxime

