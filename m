Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1769CC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99KCsRPASfdiAb1s/3gUtMX8boYUlanoI/1WCWeVSw4=; b=cE/L6HgE5Az93NdyqEpH1OQxuw
	crpVYVSFBrwsfn6AGDChhinKWgTCSuncCprb5gtqwdXw2/FIyuhfOsemgD0a2PLx4xNe67F/M7/jo
	SdzDzO+szMdV50Akr/5Oqc2JMRHci9OYc1Htf5pDdMEqRvY/KCDmyLB8YrojIP8cOF5adsXoL4iif
	ngiIwQEG9rY7Reho8nYlcYjtfj0hVPEg8SI/tAC4s76FeIUSCrR9gxD3fxja/oHV/Pm5yeW21JZa6
	H4mSCiQ4K3uvURsGWpqEFsmgd/FAYCHghXUvT4vWmUo0t0I6ptwgx6F7YmRwsXco/JZLzpJ2s6hdm
	VrJ7xlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc8v-00000005kN7-10mA;
	Tue, 01 Jul 2025 14:39:29 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWah3-00000005RqC-0ZUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:06:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35B0943A14;
	Tue,  1 Jul 2025 13:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751375195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99KCsRPASfdiAb1s/3gUtMX8boYUlanoI/1WCWeVSw4=;
	b=l5winQADrXz8gIFWK5wKV2JNiNfKaposaPOmuhFtP3RWMLckru+ktlOBDYBYatPk7/pYph
	2O0aK5Rio/Yr2gVKS2nqqqV/LYt8/UGWoroQdnE5LprHQ+SJzv0+eWON2NhLJhUuB64230
	ihJ18E1orVcjGc7LocSS1+ZzCCAcH4SknDldVzVrKTow8mSdmM3Kp0kLILsFfIymZ1RQvX
	/W6wVpMaVh9yVDea/5a84QTl5BP5gubO+PnkTZQ1DdToN6T1Mf7f7J1SIIWJv3oeZ1fXXK
	+FdSklsyEpll2Xiv5BxRjU8EdRVyo8X29XvnpsAAk+mmMQPEFNQAaUpVCPcCEg==
Date: Tue, 1 Jul 2025 15:06:31 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
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
 <nicveronese@gmail.com>, mwojtas@chromium.org, Antoine Tenart
 <atenart@kernel.org>, devicetree@vger.kernel.org, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>, Dimitri Fedrau
 <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250701150631.0256539b@fedora.home>
In-Reply-To: <20250701130243.GA130037@horms.kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
	<20250630143315.250879-5-maxime.chevallier@bootlin.com>
	<20250701130243.GA130037@horms.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopehhohhrmhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060637_329379_5E43402B 
X-CRM114-Status: GOOD (  13.09  )
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

On Tue, 1 Jul 2025 14:02:43 +0100
Simon Horman <horms@kernel.org> wrote:

> On Mon, Jun 30, 2025 at 04:33:03PM +0200, Maxime Chevallier wrote:
> 
> ...
> 
> > +/**
> > + * phy_port_get_type() - get the PORT_* attribut for that port.
> > + * @port: The port we want the information from
> > + *
> > + * Returns: A PORT_XXX value.
> > + */
> > +int phy_port_get_type(struct phy_port *port)
> > +{
> > +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)  
> 
> Hi Maxime,
> 
> Should this be:
> 
> 	if (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASET))
> 
> Flagged by Smatch (because ETHTOOL_LINK_MEDIUM_BASET is 0,
> so as-is the condition is always false).

You're absolutely correct ! Thanks...

Maxime

