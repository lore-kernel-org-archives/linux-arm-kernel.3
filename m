Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2507C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVm3s6Daurjg4AWD/fcVP0eHe4qdw9NBVQ3f6X7CoD8=; b=4oM1yDWY5rIAk9Ja23a5V3RACq
	9IEIfXBoVye3DT6yOmaXLm6NhjcCG7Woo76kJyPXKDwmcAQjUCrWAnnF8n7ihDv5/iOMQOW1UaTqy
	CvUoYZbU007Oyisf/2gtRkv3SAluD5aROyOxj24yZ+VAoRsbVPcWZDV8lEc5SlFnJlgwfGGsDYTo9
	/7zpXyVAwU9HmM9VDqH0vwwHPDECxGkXazKJ9qzNsjkqCZyteDiLW27rrtGBVjoc0NytnHUBIech7
	r/Tk1H6FpiwXUE4DEEsKNIlO350rULqRto+06I7qZf3Wo7gli11jLXvQAE5Csw1/zlrQ0mqZtU+lk
	xiPsnJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5g1V-0000000FSPD-2U6h;
	Fri, 18 Apr 2025 07:20:29 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fi5-0000000FOIx-2ZQZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:00:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D216F4435F;
	Fri, 18 Apr 2025 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744959619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVm3s6Daurjg4AWD/fcVP0eHe4qdw9NBVQ3f6X7CoD8=;
	b=L9yBzUfiLFVwSF++fBp2zlChVq6y9R1Cv2QxCZcDHteqWea1iWwck3uWioXm+9tXO3VTEw
	BlnctNULf64DkF40MZlCbPnBlJCpCzrJuOKghJIXtQt+85cQG+lwtJG9jW5OTKyNAMthOS
	cVtnOO5qLEV/bcDKRvw/nSUCpSao7Y/LBbUB5ptBQxaltjhIWSRofUUJ5Y6JnTehfcQufU
	rWHOlPh4Ywz1bQbdhWJqmYvdzJ31FHddmluKpfaJIWB1IerF6TMxROUyPjbZB1Hxe0N9di
	PIW8GeeZXwyJUX5lJIcicm0uJFOD2bzzelSwLQiK8ftOJ164Igw83l6Vnib7CQ==
Date: Fri, 18 Apr 2025 09:00:16 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v6 1/2] net: ethtool: Introduce per-PHY DUMP
 operations
Message-ID: <20250418090016.01900035@fedora.home>
In-Reply-To: <564ca4ac-661e-4126-a65a-106d3c28a47e@redhat.com>
References: <20250415085155.132963-1-maxime.chevallier@bootlin.com>
	<20250415085155.132963-2-maxime.chevallier@bootlin.com>
	<564ca4ac-661e-4126-a65a-106d3c28a47e@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedugeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetveefiedvkeejfeekkefffefgtdduteejheekgeeileehkefgfefgveevfffhnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepk
 hhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_000026_127848_093FA0BC 
X-CRM114-Status: GOOD (  11.10  )
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

Hi Paolo,

On Thu, 17 Apr 2025 12:03:43 +0200
Paolo Abeni <pabeni@redhat.com> wrote:

> On 4/15/25 10:51 AM, Maxime Chevallier wrote:
> > +static int ethnl_perphy_dump_all_dev(struct sk_buff *skb,
> > +				     struct ethnl_perphy_dump_ctx *ctx,
> > +				     const struct genl_info *info)
> > +{
> > +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> > +	struct net *net = sock_net(skb->sk);
> > +	struct net_device *dev;
> > +	int ret = 0;
> > +
> > +	rcu_read_lock();
> > +	for_each_netdev_dump(net, dev, ethnl_ctx->pos_ifindex) {
> > +		dev_hold(dev);  
> 
> Minor nit: please use netdev_hold() instead.

Will do, I didn't see the notice about using netdev_hold instead in the
doc, I merely used the current ethnl_default_dumpit() as a reference,
and it uses dev_hold() as well.

should I convert it to netdev_hold() along the way in v3 ?

Maxime

