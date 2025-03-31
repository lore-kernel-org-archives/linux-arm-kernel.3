Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C164C36017
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK/rPYXUAHUT4uoXiMNPICT+GOUkYGU1OH2yZB0mR28=; b=3szbAEXuJ1uR1jPM/9121AEwjA
	Ixaan9cJMkboIB5bByZyGhqP809ghK0h4UfLINSHLmtVC4k0i+dOdvlLeQinMhtNt84ejgnWCUMaq
	VXzCKZtkutZTStHaG3dZDfyGy0RHxOi248YJzGmSqkUgqMqS1LjMvlYM0oA7a45EgU72yOEIfi202
	JjxLuA2luUvALOEgQEDwvCxOdNkoQoJQQxASeOxlLYkveaqiUIeHoatpQI/ws2aD8MqUvCVzIO7vc
	+4gT1jYfzrtwb/Ll7HfpiQZ4TVrV4tWywxWp8HbFCNrLlmhYGrtb29BcLvLLthfbAc2e9s58ELPR1
	yrZ6FS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9ig-0000000HE2q-2Cj8;
	Mon, 31 Mar 2025 07:38:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9gF-0000000HDcc-3dxh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 07:35:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C55F44434E;
	Mon, 31 Mar 2025 07:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743406532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nK/rPYXUAHUT4uoXiMNPICT+GOUkYGU1OH2yZB0mR28=;
	b=MgC+uJyn3gloX9rqiUq/9KMmzLSHt5FrcP4zp3geP+4DnaZD9eWbb0CcC3FHYfb9jSQ8FS
	PJ/mo4bdz+tgTZezU/8SctkK7UAwd62JFn3++0iMedgvPzWAYJsW6u7G0hYBUeRUHTFXeB
	dsq0S51OS+l1gAfLvppXBBKfjpOWROwT5rlyIwCc/MCFwTJppIfRdYMHv04xSUqA7t3SQ5
	0goR2J1wItC6ATei8eEYlpj4EBte1XooEndWOaWrinANRI3duC1SgrsFrETq8FcnZcTY41
	NW3YekLIWq1ErrTeD/mvV5qjZQBv3prWEt7Qk5xZT0j59rV+/CehWQ5yGfahmQ==
Date: Mon, 31 Mar 2025 09:35:27 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v5 09/13] net: phylink: Use phy_caps_lookup for
 fixed-link configuration
Message-ID: <20250331093527.0267fc53@fedora.home>
In-Reply-To: <CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
	<CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprghlvgigrghnuggvrhdrughuhigtkhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtp
 dhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_003536_335962_84541429 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, 28 Mar 2025 16:26:04 -0700
Alexander Duyck <alexander.duyck@gmail.com> wrote:


> The general idea I had in mind for upstreaming the support for fbnic
> was to initially bring it up as a fixed-link setup using
> PHY_INTERFACE_MODE_INTERNAL as that is essentially what we have now
> and I can get rid of the extraneous 40G stuff that we aren't using.
> Then we pivot into enabling additional PHY interface modes and
> QSFP+/28 support in the kernel. Then I would add a mailbox based i2c
> and gpio to enable SFP/QSPF on fbnic. After that we could switch fbnic
> back to the inband setup with support for the higher speed interfaces.
> 
> One option I would be open to is to have me take on addressing the
> issue in net-next instead of net since I would need to sort it out to
> enable my patches anyway.

If that's OK for you and the proposed patch fixes your problem, I'd
still like for the patch to get in, as right now fixed links will
not work at all for >10G links.

Then we can get better linkmodes reporting for your usecase ?

Maxime


