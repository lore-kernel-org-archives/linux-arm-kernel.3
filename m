Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C268CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8Ai/j9FWWA8BuJUB3RoPY/GqoMvHgqve37LLwirBbU=; b=vGbxMVJHSGXUIEwltFJSDxq0bR
	zDAklMWiolKFYcJ348f3kcRdu9ND2NVGmeyvKYinO4DwqWc1O27pTIEXfeTUM28zzz97Dl7XrxvTU
	y+PQj3MFn+leD2dAeaX905mwvochWJyzkAMNBX4srwZI9nerq+CqM50fWBYbw/4gP7Q8Bm3OxfdOJ
	wu80xfhtE/W6ydQwEQdqhTUSMqwAltiX5gwJUP8/dyfImhNgTUikrWvSZT8pkuI5Q0xrKKnpuM0uv
	mmcJKbg7rb3v2Ff9MNpsaNnges896BZah+iPPYwBRPHp6bS5edFYgXaKy09LRl3wuGItLKvT9Ev6s
	pS1UU6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8Ja-0000000Ad5O-2Wba;
	Thu, 06 Mar 2025 10:18:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq72t-0000000APXu-1YNd
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 08:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=j8Ai/j9FWWA8BuJUB3RoPY/GqoMvHgqve37LLwirBbU=; b=MUaK95loezU2N7j65jjxsS1n1J
	/KZlwMB2Ra+OhBTJII6kJnMhcb76Gi2ZcJ3Us4vnZ4Y/jbyKjynA1tsGwuBByv7xXB5aJgYblcjDi
	Hob9qQtLuAXmIhLQNchwxiZPlMj4w74p4dhJFWiiLLmITWdqiAXOXUoSu+xuIWvv6pg2uflATD2VL
	W57r0qmJX2r+Zmn/kSDdgII719SJJNJWx0jj7n3lMTf3nkvbxixNYQULi2LZgoE7f1YQ1FevKcWt+
	FR2for/umFdoOZHT3wQWCp2s6KyMjKvc6CgYloAeQt43p/tSZ+7QmCka4c3WSko+jN8mdG1F4/AQ0
	Bfs3amww==;
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq72q-0000000770s-2cmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:57:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27221443D1;
	Thu,  6 Mar 2025 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741251448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8Ai/j9FWWA8BuJUB3RoPY/GqoMvHgqve37LLwirBbU=;
	b=aB2pAhX86gJ5Okidw2qqL44L/5oQPxeMT8/W0NaSFXpM4wICQD+xVuyjuP0I8hLLAOHAVT
	wH9OpIbQtbFkWaXKbxzjWjLiGrlIouHnC+loz/GIPwyQEYgCJXE+9g+vM8/BebvuDf+9Xu
	yWT/9y3nbhQShoPQHgLd6KIiJdG3233LVuXyToZf+X3NzUWGA1irx00zQFPoYWAVY491GU
	xSL4L7m2lBinbXXphSxowPEzyYN2JcYiDs0CJf1pk6meg0Q311TwMlylExRJL6SM29ewzQ
	P8HKGCJMe+qTtGud89KRbhi/0iDQyLHgJNZ2/jxmHmlg7ysZDt7OdRs+EMG/OQ==
Date: Thu, 6 Mar 2025 09:57:26 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next v4 02/13] net: phy: Use an internal, searchable
 storage for the linkmodes
Message-ID: <20250306095726.04125e5f@fedora.home>
In-Reply-To: <738bd67c-8688-4902-805f-4e35e6aaed4a@redhat.com>
References: <20250303090321.805785-1-maxime.chevallier@bootlin.com>
	<20250303090321.805785-3-maxime.chevallier@bootlin.com>
	<738bd67c-8688-4902-805f-4e35e6aaed4a@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdejfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepk
 hhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_085732_696954_2FAAC760 
X-CRM114-Status: GOOD (  13.34  )
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

Hello Paolo,

On Thu, 6 Mar 2025 09:30:11 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 3/3/25 10:03 AM, Maxime Chevallier wrote:
> [...]
> > +static int speed_duplex_to_capa(int speed, unsigned int duplex)
> > +{
> > +	if (duplex == DUPLEX_UNKNOWN ||
> > +	    (speed > SPEED_1000 && duplex != DUPLEX_FULL))
> > +		return -EINVAL;
> > +
> > +	switch (speed) {
> > +	case SPEED_10: return duplex == DUPLEX_FULL ?
> > +			      LINK_CAPA_10FD : LINK_CAPA_10HD;
> > +	case SPEED_100: return duplex == DUPLEX_FULL ?
> > +			       LINK_CAPA_100FD : LINK_CAPA_100HD;
> > +	case SPEED_1000: return duplex == DUPLEX_FULL ?
> > +				LINK_CAPA_1000FD : LINK_CAPA_1000HD;
> > +	case SPEED_2500: return LINK_CAPA_2500FD;
> > +	case SPEED_5000: return LINK_CAPA_5000FD;
> > +	case SPEED_10000: return LINK_CAPA_10000FD;
> > +	case SPEED_20000: return LINK_CAPA_20000FD;
> > +	case SPEED_25000: return LINK_CAPA_25000FD;
> > +	case SPEED_40000: return LINK_CAPA_40000FD;
> > +	case SPEED_50000: return LINK_CAPA_50000FD;
> > +	case SPEED_56000: return LINK_CAPA_56000FD;
> > +	case SPEED_100000: return LINK_CAPA_100000FD;
> > +	case SPEED_200000: return LINK_CAPA_200000FD;
> > +	case SPEED_400000: return LINK_CAPA_400000FD;
> > +	case SPEED_800000: return LINK_CAPA_800000FD;
> > +	}
> > +  
> 
> What about adding some code here to help future patch updating LINK_CAPA
> definition as needed?
> 
> Something alike:
> 
> 	pr_err_once("Unknown speed %d, please update LINK_CAPS\n", speed);
> 
> 
> > +	return -EINVAL;
> > +}
> > +
> > +/**
> > + * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
> > + */
> > +void phy_caps_init(void)
> > +{
> > +	const struct link_mode_info *linkmode;
> > +	int i, capa;
> > +
> > +	/* Fill the caps array from net/ethtool/common.c */
> > +	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
> > +		linkmode = &link_mode_params[i];
> > +		capa = speed_duplex_to_capa(linkmode->speed, linkmode->duplex);
> > +
> > +		if (capa < 0)
> > +			continue;  
> 
> Or even error-out here.

Good point yes indeed. Russell raised the point for the need of keeping
this in sync with new SPEED_XXX definitions, I'll add a check that
errors out.

I hope that's OK though, as higher speeds are introduced and used by
NICs that usually don't use phylib at all, so there's a good chance
that the developper introducing the new speed won't have CONFIG_PHYLIB
enabled.

Is that still good ?

Maxime

