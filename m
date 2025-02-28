Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BF1C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9fDfZJB/WezRePteXdcKn6DL3l6XX4XrV4HxKoRPK4=; b=KQEtlF/sak+yKydZync1OnJiJ0
	mWrmMAhkhYUnD2JpKpVCbZsyol6SnnJyjCNhcax/qFvtzY41JbSi25p5EonnWxC7kAMnbE1PoOa9k
	3Wm07wDVke3RQXMSwtbOYhITKPPhcHGMw8H27NQo5wUH1p/nEhD7bzJ0zIgU2/HLi7B7oepQ/3gWr
	OqyKFXaeF8QLRv4LPHveJilPOFK9pXsq5lBIUndB3cG4bni6mFfGWDA/l+4uaM27jmWJAi1Z6miT+
	qs2nn3bfIa3xCBfo80v7DclZGnRzuNN2Ab/tOkFL5oNij1iGM/ekBKvUwrskr5ai/CIqUXf2fCdy5
	is8aeqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3aC-0000000BlrK-30Gy;
	Fri, 28 Feb 2025 16:51:28 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Yc-0000000BlUQ-2dfy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:49:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A486432B3;
	Fri, 28 Feb 2025 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740761388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9fDfZJB/WezRePteXdcKn6DL3l6XX4XrV4HxKoRPK4=;
	b=VsMpQDTmTRTfwdsJcEnPhDuR8dcLtn9+OYZ/jXEJDLTMH8x9BsC0R3jFrLYXDZbztvRrl+
	TA6jKDzEDfxSRYzKGtuOUu9v1EQ+52cJ/eTBhHw3zo/yuktwCVcGwFL8+GBEYCwoEiNWMa
	VJUGe6QuYYTHBWxogzuSTTNl22ql57r+FvLAYK2TiScaf9wuz0lQkVEl/Z3euDhKGKxR0X
	gKsBnpKnWWaMfJidzwlgSM23rVtcgX42WCt7FumF+1+mgfoDCriyq/93bzl11cxP+gTLwI
	a60cxKSPxNWKb3FR5jYBTklVEB1aVcmsCTnP5AemuDJJhpqzAyQ+AeRCleuljg==
Date: Fri, 28 Feb 2025 17:49:45 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v3 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250228174945.791c3f74@fedora.home>
In-Reply-To: <Z8HiZpxPLy9YKTsf@shell.armlinux.org.uk>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
	<20250228145540.2209551-10-maxime.chevallier@bootlin.com>
	<Z8HiZpxPLy9YKTsf@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtt
 hhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_084950_981012_9A883BBD 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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

On Fri, 28 Feb 2025 16:20:54 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Feb 28, 2025 at 03:55:34PM +0100, Maxime Chevallier wrote:
> >  	adv = pl->link_config.advertising;
> >  	linkmode_zero(adv);
> > -	linkmode_set_bit(s->bit, adv);
> > +	linkmode_and(adv, pl->supported, c->linkmodes);  
> 
> There is no need for linkmode_zero() with linkmode_and() immediately
> after. linkmode_and() writes to its entire destination.
> 

Ah true indeed, I'll address that.

Thanks Russell,

Maxime

