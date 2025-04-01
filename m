Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C5C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJDvWRqiKkcgB0kMKWyCUi7DBbqUbwOCXbFkkoxLk7o=; b=Xgw6SGpPtRFGlVRWrhGC10lxdc
	AeCKf24tthfTdUh4mKqZouS6lwuXZLNEPYdzOYRB07Uo/uKP3imXGqLSK/Zelblv6TtZemAVmjkPp
	9J7UIg6KTkNcjwwLl1WgzlmQpIohV33jPlUaoBg2a0dP9V70pIM5iOtpJleVvq8kxVrGFSg4teQr+
	U9Ey0dPgTgptaifws0RcqY+zjeVxkF3lw+ZVyYgMjOqckirhJrgT84XB57/OL9f9voA7DJ11AsyVi
	W3hnk8zdcYxv3jWHOwhGtKuVbOnq5K7i3ud1v7MTTb0vETI1nxitXC4SxdtkproZhyZKiwDzpL09t
	A2ZPllGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX8d-00000002LZO-2R1t;
	Tue, 01 Apr 2025 08:38:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzX4G-00000002L53-1oQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:33:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C25EE432F5;
	Tue,  1 Apr 2025 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743496431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJDvWRqiKkcgB0kMKWyCUi7DBbqUbwOCXbFkkoxLk7o=;
	b=DqUdA8PPlAAoXI7Ct3xzJfyqwDeHWWZWjnOwFLV0h6nm8ViInZdwRl49YcfzDQfO0HH71B
	dnJTv+k3itmzkaRutuLUr5Jv2rN9gAkwRihA3C9fNGe553Vw5jwh2FwTwdB0xjF/5whbwP
	+7gpo8w7rq6rOjp4Ge/+c5rwI3tqWgUzT8HJ6Gjcf+VK7UtzRsyeh2Efgi1ms2tZp0omxo
	9tXfYZEwQuQM86qUawV2a9bqq0Iwlh7iN6ESsQoqwSWaHOz9pfndVFMtTVZztvSEZD/5rc
	qjGX6dZjT+fsUTttEadLoexIqjkb04kpnRMa9sI/AXNrdp1Xovaht2IbKyFuqA==
Date: Tue, 1 Apr 2025 10:33:49 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexander H Duyck <alexander.duyck@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
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
Message-ID: <20250401103349.102e8092@fedora.home>
In-Reply-To: <44f5c55e5fac60c118cb4d4e99b49e6bf6561295.camel@gmail.com>
References: <20250307173611.129125-1-maxime.chevallier@bootlin.com>
	<20250307173611.129125-10-maxime.chevallier@bootlin.com>
	<8d3a9c9bb76b1c6bc27d2bd01f4831b2cac83f7f.camel@gmail.com>
	<20250328090621.2d0b3665@fedora-2.home>
	<CAKgT0Ue_JzmJAPKBhe6XaMkDCy+YNNg5_5VvzOR6CCbqcaQg3Q@mail.gmail.com>
	<12e3b86d-27aa-420b-8676-97b603abb760@lunn.ch>
	<CAKgT0UcZRi1Eg2PbBnx0pDG_pCSV8tfELinNoJ-WH4g3CJOh2A@mail.gmail.com>
	<02c401a4-d255-4f1b-beaf-51a43cc087c5@lunn.ch>
	<Z-qsnN4umaz0QrG0@shell.armlinux.org.uk>
	<20250331182000.0d94902a@fedora.home>
	<44f5c55e5fac60c118cb4d4e99b49e6bf6561295.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtoheprghlvgigrghnuggvrhdrughuhigtkhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrt
 ghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_013356_637926_369D38FA 
X-CRM114-Status: GOOD (  25.73  )
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

Hi Alexander,

On Mon, 31 Mar 2025 15:31:23 -0700
Alexander H Duyck <alexander.duyck@gmail.com> wrote:

> On Mon, 2025-03-31 at 18:20 +0200, Maxime Chevallier wrote:
> > On Mon, 31 Mar 2025 15:54:20 +0100
> > "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:  
> 
> ...
> 
> > I was hoping Alexander could give option 1 a try, but let me know if
> > you think we should instead adopt option 2, which is probably the safer
> > on.
> > 
> > Maxime  
> 
> So I gave it a try, but the results weren't promising. I ended up
> getting the lp_advertised spammed with all the modes:
> 
>     Link partner advertised link modes:  100000baseKR4/Full
>                                          100000baseSR4/Full
>                                          100000baseCR4/Full
>                                          100000baseLR4_ER4/Full
>                                          100000baseKR2/Full
>                                          100000baseSR2/Full
>                                          100000baseCR2/Full
>                                          100000baseLR2_ER2_FR2/Full
>                                          100000baseDR2/Full
>                                          100000baseKR/Full
>                                          100000baseSR/Full
>                                          100000baseLR_ER_FR/Full
>                                          100000baseCR/Full
>                                          100000baseDR/Full

Thanks for testing, that's the expected outcome for the patch though. Is
that really an issue ? For fixed links, what report is bogus
anyways :/ I guess here as you mentioned, the problem is that you don't
actually have a real fixed link :)

> 
> In order to resolve it I just made the following change:
> @@ -713,9 +700,7 @@ static int phylink_parse_fixedlink(struct phylink
> *pl,
>                 phylink_warn(pl, "fixed link specifies half duplex for
> %dMbps link?\n",
>                              pl->link_config.speed);
>  
> -       linkmode_zero(pl->supported);
> -       phylink_fill_fixedlink_supported(pl->supported);
> -
> +       linkmode_fill(pl->supported);
>         linkmode_copy(pl->link_config.advertising, pl->supported);
>         phylink_validate(pl, pl->supported, &pl->link_config);
> 

So this goes back to the <10G modes reporting multiple modes then ?

> 
> Basically the issue is that I am using the pcs_validate to cleanup my
> link modes. So the code below this point worked correctly for me. The
> only issue was the dropping of the other bits.
> 
> That is why I mentioned the possibility of maybe adding some sort of
> follow-on filter function that would go through the upper bits and or
> them into the filter being run after the original one.
> 
> For example there is mask which is used to filter out everything but
> the pause and autoneg bits. Perhaps we should assemble bits there
> depending on the TP, FIBER, and BACKPLANE bits to clean out everything
> but CR, KR, and TP types if those bits are set.

Yeah but where do we get these TP / Fiber / Backplane bits from ? We
build that list of linkmodes from scratch in that function, only based
on speed/duplex, we don't know anything about the physical medium at
that point.

What you are suggesting is something I'm adding in the phy_port work
actually. You'll be able to say : "This port is a BaseK port" or
"BaseT" or "it may be baseC or baseL or baseS" and there'll be some
filtering based on that, although only in what we report to userspace,
at least for now :)

Maxime

