Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53549C83000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeSFO9YmP+VkNGWgZDjeNmNRPcvML0v01nWUb6jOpZU=; b=pEvpmbKP1goOSE0Ej9VX9i+e2w
	6NjJXHCjjOKAKRp4sRAFxpAroqGW01ySjaNNnlyYOhY84MrfzWgaJKgM+BveANq3WrTZOpPwaSS0z
	Y9+ZgPz8kqrGuIkcOk0XQVrHZMHCe3YEruIvc7rPqMCTVZotIZ7TQMiR6E3gJspYMycbzXSzKCKsc
	/NE++swATxhiuTSC6K81SNPU7IDrgqtJXy8RWJrHir7xhl3n82wXf9n/e1QzJ68NxLmUfKzjqWrOP
	VsmBYIIpisDY6uW/S3BUS+JsOAvfPJ6WAowBxYDVqQ6RMrwRGaZpv6m7hxr9QnYPIufLgioFEdFli
	C6376gdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEMx-0000000FY77-1WTt;
	Fri, 27 Jun 2025 19:04:15 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCL4-0000000FKx0-1vT9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 16:54:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 155E0443CE;
	Fri, 27 Jun 2025 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751043247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XeSFO9YmP+VkNGWgZDjeNmNRPcvML0v01nWUb6jOpZU=;
	b=HlFqDnEqkvlG3RejH7/pchC3wYToHai2TPtoWVJHInnRmRTY382TJUp4B9i2cWXv6mCbrD
	UtMdobSU1Rhc1WtcIs1sf1ef4b8g6h/yb/qYq0z9MDs6QuCIHV7ESwMns/z4/2ttDO0ATO
	TQdVtivdHisypeWtFdc8LOcHjI2w+pICCCSeyuSDddanF7ufvYRAaName34eCJze+2ouRE
	prgET+ehViEi0VXPeSE4+Wihe6n2n4jZJWEbjkVgEexCAikjZuje4WDJAr3qA5zKzxZxCJ
	3zHK32zHwsWuJ7ZDyFWMZ60t02OHT9h+BX0aXLQdGAZpVu/fwA1GXC2g8xCB+w==
Date: Fri, 27 Jun 2025 18:54:04 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Daniel Golle
 <daniel@makrotopia.org>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v6 03/14] net: phy: Introduce PHY ports
 representation
Message-ID: <20250627185404.7496fbc4@fedora>
In-Reply-To: <3878435.kQq0lBPeGt@fw-rgant>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
	<20250507135331.76021-4-maxime.chevallier@bootlin.com>
	<3878435.kQq0lBPeGt@fw-rgant>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_095411_431121_AA8C4F11 
X-CRM114-Status: GOOD (  44.61  )
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

Hi Romain,

On Mon, 12 May 2025 09:53:09 +0200
Romain Gantois <romain.gantois@bootlin.com> wrote:

> Hi Maxime,

I'm about to send a V7, but I realise now I didn't address these
reviews... sorry about that

> On Wednesday, 7 May 2025 15:53:19 CEST Maxime Chevallier wrote:
> > Ethernet provides a wide variety of layer 1 protocols and standards for
> > data transmission. The front-facing ports of an interface have their own
> > complexity and configurability.
> >   
> ...
> > +
> > +static int phy_default_setup_single_port(struct phy_device *phydev)
> > +{
> > +	struct phy_port *port = phy_port_alloc();
> > +
> > +	if (!port)
> > +		return -ENOMEM;
> > +
> > +	port->parent_type = PHY_PORT_PHY;
> > +	port->phy = phydev;
> > +	linkmode_copy(port->supported, phydev->supported);
> > +
> > +	phy_add_port(phydev, port);
> > +
> > +	/* default medium is copper */
> > +	if (!port->mediums)
> > +		port->mediums |= BIT(ETHTOOL_LINK_MEDIUM_BASET);  
> 
> Could this be moved to phy_port_alloc() instead? That way, you'd avoid the 
> extra conditional and the "default medium == baseT" rule would be enforced as 
> early as possible.

I'll actually remove that altogether. For a single-port PHY, we can
actually derive the mediums from the PHY's supported field.

[...]

> > +	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST) {
> > +		linkmode_zero(supported);  
> 
> ethtool_medium_get_supported() can only set bits in "supported", so you could 
> just do:
> 
> ```
> for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
> 	ethtool_medium_get_supported(port->supported, i, port->lanes);
> ```
> 
> unless you're wary of someone modifying ethtool_medium_get_supported() in a 
> way that breaks this in the future?

Hmm yes, but at least here it makes it obvious we're accumulating the
linkmodes :/

> 
> > +		ethtool_medium_get_supported(supported, i, port->lanes);
> > +		linkmode_or(port->supported, port->supported, supported);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(phy_port_update_supported);
> > +
> > +/**
> > + * phy_port_get_type() - get the PORT_* attribut for that port.
> > + * @port: The port we want the information from
> > + *
> > + * Returns: A PORT_XXX value.
> > + */
> > +int phy_port_get_type(struct phy_port *port)
> > +{
> > +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)
> > +		return PORT_TP;
> > +
> > +	if (phy_port_is_fiber(port))
> > +		return PORT_FIBRE;
> > +
> > +	return PORT_OTHER;
> > +}
> > +EXPORT_SYMBOL_GPL(phy_port_get_type);
> > diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> > index c1d805d3e02f..0d3063af5905 100644
> > --- a/include/linux/ethtool.h
> > +++ b/include/linux/ethtool.h
> > @@ -226,6 +226,10 @@ extern const struct link_mode_info link_mode_params[];
> > 
> >  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
> > 
> > +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> > +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> > +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> > +
> >  static inline const char *phy_mediums(enum ethtool_link_medium medium)
> >  {
> >  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> > @@ -234,6 +238,17 @@ static inline const char *phy_mediums(enum
> > ethtool_link_medium medium) return ethtool_link_medium_names[medium];
> >  }
> > 
> > +static inline int phy_medium_default_lanes(enum ethtool_link_medium medium)
> > +{
> > +	/* Let's consider that the default BaseT ethernet is BaseT4, i.e.
> > +	 * Gigabit Ethernet.
> > +	 */
> > +	if (medium == ETHTOOL_LINK_MEDIUM_BASET)
> > +		return 4;
> > +
> > +	return 1;
> > +}
> > +
> >  /* declare a link mode bitmap */
> >  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
> >  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index d62d292024bc..0180f4d4fd7d 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -299,6 +299,7 @@ static inline long rgmii_clock(int speed)
> >  struct device;
> >  struct kernel_hwtstamp_config;
> >  struct phylink;
> > +struct phy_port;
> >  struct sfp_bus;
> >  struct sfp_upstream_ops;
> >  struct sk_buff;
> > @@ -590,6 +591,9 @@ struct macsec_ops;
> >   * @master_slave_state: Current master/slave configuration
> >   * @mii_ts: Pointer to time stamper callbacks
> >   * @psec: Pointer to Power Sourcing Equipment control struct
> > + * @ports: List of PHY ports structures
> > + * @n_ports: Number of ports currently attached to the PHY
> > + * @max_n_ports: Max number of ports this PHY can expose
> >   * @lock:  Mutex for serialization access to PHY
> >   * @state_queue: Work queue for state machine
> >   * @link_down_events: Number of times link was lost
> > @@ -724,6 +728,10 @@ struct phy_device {
> >  	struct mii_timestamper *mii_ts;
> >  	struct pse_control *psec;
> > 
> > +	struct list_head ports;
> > +	int n_ports;
> > +	int max_n_ports;
> > +
> >  	u8 mdix;
> >  	u8 mdix_ctrl;
> > 
> > @@ -1242,6 +1250,27 @@ struct phy_driver {
> >  	 * Returns the time in jiffies until the next update event.
> >  	 */
> >  	unsigned int (*get_next_update_time)(struct phy_device *dev);
> > +
> > +	/**
> > +	 * @attach_port: Indicates to the PHY driver that a port is detected
> > +	 * @dev: PHY device to notify
> > +	 * @port: The port being added
> > +	 *
> > +	 * Called when a port that needs to be driven by the PHY is found. The
> > +	 * number of time this will be called depends on phydev->max_n_ports,
> > +	 * which the driver can change in .probe().
> > +	 *
> > +	 * The port that is being passed may or may not be initialized. If it   
> is
> > +	 * already initialized, it is by the generic port representation from
> > +	 * devicetree, which superseeds any strapping or vendor-specific
> > +	 * properties.
> > +	 *
> > +	 * If the port isn't initialized, the port->mediums and port->lanes
> > +	 * fields must be set, possibly according to stapping information.
> > +	 *
> > +	 * Returns 0, or an error code.
> > +	 */
> > +	int (*attach_port)(struct phy_device *dev, struct phy_port *port);
> >  };
> >  #define to_phy_driver(d) container_of_const(to_mdio_common_driver(d),		  
> \
> >  				      struct phy_driver, mdiodrv)
> > @@ -1968,6 +1997,7 @@ void phy_trigger_machine(struct phy_device *phydev);
> >  void phy_mac_interrupt(struct phy_device *phydev);
> >  void phy_start_machine(struct phy_device *phydev);
> >  void phy_stop_machine(struct phy_device *phydev);
> > +
> >  void phy_ethtool_ksettings_get(struct phy_device *phydev,
> >  			       struct ethtool_link_ksettings *cmd);
> >  int phy_ethtool_ksettings_set(struct phy_device *phydev,
> > diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> > new file mode 100644
> > index 000000000000..70aa75f93096
> > --- /dev/null
> > +++ b/include/linux/phy_port.h
> > @@ -0,0 +1,93 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +#ifndef __PHY_PORT_H
> > +#define __PHY_PORT_H
> > +
> > +#include <linux/ethtool.h>
> > +#include <linux/types.h>
> > +#include <linux/phy.h>
> > +
> > +struct phy_port;
> > +
> > +/**
> > + * enum phy_port_parent - The device this port is attached to
> > + *
> > + * @PHY_PORT_PHY: Indicates that the port is driven by a PHY device
> > + */
> > +enum phy_port_parent {
> > +	PHY_PORT_PHY,
> > +};
> > +
> > +struct phy_port_ops {
> > +	/* Sometimes, the link state can be retrieved from physical,
> > +	 * out-of-band channels such as the LOS signal on SFP. These
> > +	 * callbacks allows notifying the port about state changes
> > +	 */
> > +	void (*link_up)(struct phy_port *port);
> > +	void (*link_down)(struct phy_port *port);
> > +
> > +	/* If the port acts as a Media Independent Interface (Serdes port),
> > +	 * configures the port with the relevant state and mode. When enable is
> > +	 * not set, interface should be ignored
> > +	 */
> > +	int (*configure_mii)(struct phy_port *port, bool enable,   
> phy_interface_t
> > interface); +};
> > +
> > +/**
> > + * struct phy_port - A representation of a network device physical
> > interface + *
> > + * @head: Used by the port's parent to list ports
> > + * @parent_type: The type of device this port is directly connected to
> > + * @phy: If the parent is PHY_PORT_PHYDEV, the PHY controlling that port
> > + * @ops: Callback ops implemented by the port controller
> > + * @lanes: The number of lanes (diff pairs) this port has, 0 if not
> > applicable + * @mediums: Bitmask of the physical mediums this port provides
> > access to + * @supported: The link modes this port can expose, if this port
> > is MDI (not MII) + * @interfaces: The MII interfaces this port supports, if
> > this port is MII + * @active: Indicates if the port is currently part of
> > the active link. + * @is_serdes: Indicates if this port is Serialised MII
> > (Media Independent + *	       Interface), or an MDI (Media Dependent
> > Interface).
> > + */
> > +struct phy_port {
> > +	struct list_head head;
> > +	enum phy_port_parent parent_type;
> > +	union {
> > +		struct phy_device *phy;
> > +	};
> > +
> > +	const struct phy_port_ops *ops;
> > +
> > +	int lanes;
> > +	unsigned long mediums;
> > +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> > +	DECLARE_PHY_INTERFACE_MASK(interfaces);
> > +
> > +	unsigned int active:1;
> > +	unsigned int is_serdes:1;
> > +};
> > +
> > +struct phy_port *phy_port_alloc(void);
> > +void phy_port_destroy(struct phy_port *port);
> > +
> > +static inline struct phy_device *port_phydev(struct phy_port *port)
> > +{
> > +	return port->phy;
> > +}
> > +
> > +struct phy_port *phy_of_parse_port(struct device_node *dn);
> > +
> > +static inline bool phy_port_is_copper(struct phy_port *port)
> > +{
> > +	return port->mediums == BIT(ETHTOOL_LINK_MEDIUM_BASET);  
> 
> BaseC is also "copper" right? Maybe this should be renamed to 
> "phy_port_is_tp"?

Yeah indeed...

Maxime

> 


