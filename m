Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBCC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiOs4t5S7Vba+FbukFmy46w8UUZlBA+9AHiDIzVMiQY=; b=AU5znIRx4tH5DnOmt1MIv0SgMD
	n3XqQqn/Mt3/qNvG5Sk++A0jKNJAvgyss0rwGNMnnOMpIh28mIHK73Ao7JLmlEaNPYoTokrsbKobu
	6HTfxNFNJ9rrfXUz26mDKoTCqHMfS/9hVp3llsdeU8G24FSc8ZiokYTfuILOu8heYwyxyFNGJJkm7
	1f4u6FAMhfsx7b2zGBJ9bHkeU4KUoCcmInJUdkwDYdIYqu2T9JxQXZyamxb0+aZPNkkbkGVwFHC4w
	ygba31hjX3dFodc36PcrapppaAY5B0pBHR46/4YQcAPh/pS6hmZePjbBnANwGrpii0C6PTb4l9HGw
	vUDV5jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to39o-0000000Bec3-2jH2;
	Fri, 28 Feb 2025 16:24:12 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to33I-0000000BdQh-28cw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:17:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1C7C4431B;
	Fri, 28 Feb 2025 16:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740759445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiOs4t5S7Vba+FbukFmy46w8UUZlBA+9AHiDIzVMiQY=;
	b=I76fipOAMV7OPHWC4tqyxx8hPk3KRxyyJzzjkT6yeg97wsKfB9m6ApewNq1NavNRoH/KJR
	D0ZewdrLLIFjrpBQqT7EwFSOJUhPfLiA5jVJa6wPfe+vi/l9r7Mp0tgVJ4dgtIKdfZaM3k
	wGbOrUxMt+C21aLQaHwvkevZ0xCgVDXJOo6nvoRQ8mjHhCdmaPAUgwKUU5iX7bSGj54Lb6
	4hMZN83760UNGxmckO3c35zyTtD9APBMET7CgbjtSb1ffXQLO9b/e1rJZuocNIQ5vSfu6Q
	6+HY3uIkCBvlWOG5rvzISylYNwLyg9Wu/QcRjmDvs4h/d0PqWjMKXrCKO+uCqQ==
Date: Fri, 28 Feb 2025 17:17:20 +0100
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
Subject: Re: [PATCH net-next v3 03/13] net: phy: phy_caps: Move phy_speeds
 to phy_caps
Message-ID: <20250228171720.62c6b378@fedora.home>
In-Reply-To: <Z8Hf-9yR3qD9cqsX@shell.armlinux.org.uk>
References: <20250228145540.2209551-1-maxime.chevallier@bootlin.com>
	<20250228145540.2209551-4-maxime.chevallier@bootlin.com>
	<Z8Hf-9yR3qD9cqsX@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtt
 hhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_081728_848172_CF96FACB 
X-CRM114-Status: GOOD (  20.97  )
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

Hi Russell,

On Fri, 28 Feb 2025 16:10:35 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Feb 28, 2025 at 03:55:28PM +0100, Maxime Chevallier wrote:
> > Use the newly introduced link_capabilities array to derive the list of
> > possible speeds when given a combination of linkmodes. As
> > link_capabilities is indexed by speed, we don't have to iterate the
> > whole phy_settings array.
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

[...]

> > +/**
> > + * phy_caps_speeds() - Fill an array of supported SPEED_* values for given modes
> > + * @speeds: Output array to store the speeds list into
> > + * @size: Size of the output array
> > + * @linkmodes: Linkmodes to get the speeds from
> > + *
> > + * Fills the speeds array with all possible speeds that can be achieved with
> > + * the specified linkmodes.
> > + *
> > + * Returns: The number of speeds filled into the array. If the input array isn't
> > + *	    big enough to store all speeds, fill it as much as possible.
> > + */
> > +size_t phy_caps_speeds(unsigned int *speeds, size_t size,
> > +		       unsigned long *linkmodes)
> > +{
> > +	size_t count;
> > +	int capa;
> > +
> > +	for (capa = 0, count = 0; capa < __LINK_CAPA_MAX && count < size; capa++) {
> > +		if (linkmode_intersects(link_caps[capa].linkmodes, linkmodes) &&
> > +		    (count == 0 || speeds[count - 1] != link_caps[capa].speed))
> > +			speeds[count++] = link_caps[capa].speed;
> > +	}  
> 
> Having looked at several of these patches, there's a common pattern
> emerging, which is we're walking over link_caps in either ascending
> speed order or descending speed order. So I wonder whether it would
> make sense to have:
> 
> #define for_each_link_caps_asc_speed(cap) \
> 	for (cap = link_caps; cap < &link_caps[__LINK_CAPA_MAX]; cap++)
> #define for_each_link_caps_desc_speed(cap) \
> 	for (cap = &link_caps[__LINK_CAPA_MAX - 1]; cap >= link_caps; cap--)
> 
> for where iterating over in speed order is important. E.g. this would
> make the above:
> 
> 	struct link_capabilities *lcap;
> 
> 	for_each_link_caps_asc_speed(lcap)
> 		if (linkmode_intersects(lcap->linkmodes, linkmodes) &&
> 		    (count == 0 || speeds[count - 1] != lcap->speed)) {
> 			speeds[count++] = lcap->speed;
> 			if (count >= size)
> 				break;
> 		}
> 
> which helps to make it explicit that speeds[] is in ascending value
> order.

That makes a lot of sense indeed, I will definitely add that.

Thanks a lot for the review,

Maxime

