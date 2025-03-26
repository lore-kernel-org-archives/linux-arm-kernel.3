Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1871C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCyhizZ6fioj/Cn50FEmvft5O6zsfQST6n+ZMo09TZw=; b=QQbLxgU8z+yIAHsJl6+28BazMK
	dXuxaNf47J3IIGQj/cIXsG1/Se4qx6f33LLGWfHm8Z3NeP27lJ4wbo0wYZcsrec6WANd8dUr5cy+8
	scCFskoLJVFS0qq6JgAq6ZX5DZplXiIHBuQ/aZhxSfZh0Ska5jcH4iMPL3gWZkmpyYEkF5V/Lau6y
	iPrzVODjX5ownQNa1YlcIO7vy8f6JYazBrLOFnquGeiMWoWvmgOQOUr4mdeNgz3stw0ak5E3K6p1m
	gxDzv8O6FB6PvayWkqxScbQNe+VR4Q0bzhUx9MjcX33835JVdYWBom9WMYsI82jBbIzJM4TSPahTb
	EC9KlI5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOvk-00000008MLF-3wmA;
	Wed, 26 Mar 2025 11:28:20 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOu0-00000008M2e-1yvI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:26:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECAD7441FF;
	Wed, 26 Mar 2025 11:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742988389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCyhizZ6fioj/Cn50FEmvft5O6zsfQST6n+ZMo09TZw=;
	b=YKEnACO4OwvDDi73eZxozFu3r+G2hmI0QrW9NrDammoDZdd4eE3tZza6uVCudWVgKGaJG8
	9iYghPUUIL4uxa8aBTQPHDw5p54YRxos2Qq5z9ByqD6OT222leEaq0ONMDVpDWMoE8BIwM
	Goil2DkhtNHqxcOUrFCpLSzkDykzdJhaQNdwUJHLpURNqOb0dhamhOBrvllixZY+Gl630D
	2Oz5ivbUUQ3nOT9GBu76z8ApSFXu+c3O4Gf+iGCDQHlcMf3HmOooAKsEGymv2+3jO5ka5k
	UxGeJyd57KTkV9BrMV+pY9bkOfOVWrslAVIkZjnfPn+amEuzwcd86lXseRFB6A==
Date: Wed, 26 Mar 2025 12:26:27 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, Andrew Lunn
 <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 2/8] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
Message-ID: <20250326122627.600bec6b@fedora.home>
In-Reply-To: <20250326112936.16f8b075@kmaincent-XPS-13-7390>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-3-maxime.chevallier@bootlin.com>
	<20250325122706.5287774d@kmaincent-XPS-13-7390>
	<20250325141507.4a223b03@kernel.org>
	<20250325142202.61d2d4b3@kernel.org>
	<20250326085906.62a7c9fc@fedora.home>
	<20250326112936.16f8b075@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvt
 hdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_042632_817306_FD83EE3C 
X-CRM114-Status: GOOD (  27.77  )
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

On Wed, 26 Mar 2025 11:29:36 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Wed, 26 Mar 2025 08:59:06 +0100
> Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:
> 
> > On Tue, 25 Mar 2025 14:22:02 -0700
> > Jakub Kicinski <kuba@kernel.org> wrote:
> >   
> > > On Tue, 25 Mar 2025 14:15:07 -0700 Jakub Kicinski wrote:    
> >  [...]    
> > > > 
> > > > Let's try. We can probably make required_dev attr of
> > > > ethnl_parse_header_dev_get() a three state one: require, allow, reject?
> > > >    
> > > 
> > > Ah, don't think this is going to work. You're not converting all 
> > > the dumps, just the PHY ones. It's fine either way, then.    
> > 
> > Yeah I noticed that when implementing, but I actually forgot to mention
> > in in my cover, which I definitely should have :(
> > 
> > What we can also do is properly support multi-phy dump but not filtered
> > dump on all the existing phy commands (plca, pse-pd, etc.) so that be
> > behaviour is unchanged for these. Only PHY_GET and any future per-phy
> > commands would support it.  
> 
> Couldn't we remove the existence check of ctx->req_info->dev in
> ethnl_default_start and add the netdev_put() in the ethnl_default_dumpit()?
> Would this work?

It would work, but it seems unnecessary to hold a refcount on a
specific netdev while we iterate on all netdevs in the namespace
afterwards. But I'd say that's an implementation detail :)

> Or we could keep your change and let the userspace adapt to the new support of
> filtered dump. In fact you are modifying all the ethtool commands that are
> already related to PHY, if you don't they surely will one day or another so it
> is good to keep it.

So the question is, is it OK to stop ignoring the ifindex/ifname header
attribute for ethnl dump requests, and if so, should we do that for all
dump commands or only the ones for which is makes sense to do so.

Jakub says "t's fine either way, then.", but don't fully get if this is
an answer to the above question :)

This will only change the behaviour of filtered dumps, that aren't
really used with ethnl (except for PHY_GET but we won't change its
behaviour either way)

Maxime

