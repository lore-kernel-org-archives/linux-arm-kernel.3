Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81CBC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgcTJTisVN3vy6/bL+F8k2WTg0zNvDoQ8oR2IntnOkc=; b=mObaDiI1SBz4eR8TR2S/Vu+2Qu
	I7jHUAP7MeofD4xilESSkWj+fBaUBDFk0SJfOcoZXV+NmoKCBvLVHiUpwp2SFL7+9O1/AJp7JtxZN
	kEMf7uUD+0F6wK53glGF7tOGiNRe7eB6/qjS3MHseUNJG4ebA8CgZAMuKyBLcGSlgZmZCBM6pj80A
	7mH05qzx2FutTyZegyJMoMKID8XCZkam5iuqLI+B2pSIrE/qM64m652oTRD+/U5Z0DJHSHvvvSv/h
	Qhs/eGTFzw6OfJ+Qfzk/jHWQBpNKHFbqqQUXj7Xpj9AhdAb3hu1i72zY5kcF5+0zUQyxA4KqVpSQH
	sDUVRCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgP1-0000000FkCT-026L;
	Fri, 21 Mar 2025 17:43:27 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvgNJ-0000000Fjvv-06PG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 17:41:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48191442A0;
	Fri, 21 Mar 2025 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742578897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zgcTJTisVN3vy6/bL+F8k2WTg0zNvDoQ8oR2IntnOkc=;
	b=crSaDCX2QS/A8fp3+lpQfUl7fQ2tuBed4GX0wjlD9hs0nk0U4UOiKv9Vw9eaOp1e4jaPpl
	vLAywACT9j/hM4KxHSbOIfiNJ5P3AdQqq+ni1fOlYTRqLYdFCfg38LQT2R6BBMuyVGaJ8k
	657j3Jmk93EORXSYAWQ8UM+EjiJ+7NCWb6ctfOAAg1XroZokb3J5khrYGG+dKh+hHi168u
	/org5gOdXv5VkqPrScb3W6f+BHKWTE9sY56ZsSmd05xKa/lqqaH++Kvhl/UXoIBiB5roSs
	akJLMWzHgRsYK6wjPzoLTWvzmw+o7LhCI4GO8yjxj+oN363e07AoZPOfBDi98g==
Date: Fri, 21 Mar 2025 18:41:34 +0100
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
Subject: Re: [PATCH net-next v3 1/7] net: ethtool: netlink: Allow
 per-netdevice DUMP operations
Message-ID: <20250321184134.22311370@fedora.home>
In-Reply-To: <c4e5bd2f-6216-4f74-b677-46c79343eb21@redhat.com>
References: <20250313182647.250007-1-maxime.chevallier@bootlin.com>
	<20250313182647.250007-2-maxime.chevallier@bootlin.com>
	<c4e5bd2f-6216-4f74-b677-46c79343eb21@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedujedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeeftdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheetveefiedvkeejfeekkefffefgtdduteejheekgeeileehkefgfefgveevfffhnecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepk
 hhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_104141_200731_DE73E889 
X-CRM114-Status: GOOD (  24.19  )
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

On Fri, 21 Mar 2025 17:31:17 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 3/13/25 7:26 PM, Maxime Chevallier wrote:
> > We have a number of netlink commands in the ethnl family that may have
> > multiple objects to dump even for a single net_device, including :
> > 
> >  - PLCA, PSE-PD, phy: one message per PHY device
> >  - tsinfo: one message per timestamp source (netdev + phys)
> >  - rss: One per RSS context
> > 
> > To get this behaviour, these netlink commands need to roll a custom  
> > ->dumpit().  
> > 
> > To prepare making per-netdev DUMP more generic in ethnl, introduce a
> > member in the ethnl ops to indicate if a given command may allow
> > pernetdev DUMPs (also referred to as filtered DUMPs).
> > 
> > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> >  net/ethtool/netlink.c | 45 +++++++++++++++++++++++++++++--------------
> >  net/ethtool/netlink.h |  2 ++
> >  2 files changed, 33 insertions(+), 14 deletions(-)
> > 
> > diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> > index a163d40c6431..7adede5e4ff1 100644
> > --- a/net/ethtool/netlink.c
> > +++ b/net/ethtool/netlink.c
> > @@ -587,21 +587,38 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
> >  	int ret = 0;
> >  
> >  	rcu_read_lock();  
> 
> Maintain the RCU read lock here is IMHO confusing...
> 
> > -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> > -		dev_hold(dev);
> > +	if (ctx->req_info->dev) {
> > +		dev = ctx->req_info->dev;  
> 
> .. as this is refcounted.
> 
> I suggest to move the rcu_read_lock inside the if.

Indeed, maybe not the best place indeed. I'll address that, thanks for
pointing this out

> 
> >  		rcu_read_unlock();
> > +		/* Filtered DUMP request targeted to a single netdev. We already
> > +		 * hold a ref to the netdev from ->start()
> > +		 */
> > +		ret = ethnl_default_dump_one(skb, dev, ctx,
> > +					     genl_info_dump(cb));
> > +		rcu_read_lock();
> > +		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
> >  
> > -		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
> > +		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
> > +			ret = skb->len;
> >  
> > -		rcu_read_lock();
> > -		dev_put(dev);
> > +	} else {
> > +		for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> > +			dev_hold(dev);
> > +			rcu_read_unlock();
> > +
> > +			ret = ethnl_default_dump_one(skb, dev, ctx,
> > +						     genl_info_dump(cb));
> > +
> > +			rcu_read_lock();
> > +			dev_put(dev);
> >  
> > -		if (ret < 0 && ret != -EOPNOTSUPP) {
> > -			if (likely(skb->len))
> > -				ret = skb->len;
> > -			break;
> > +			if (ret < 0 && ret != -EOPNOTSUPP) {
> > +				if (likely(skb->len))
> > +					ret = skb->len;  
> 
> IMHO a bit too many levels of indentation. It's possibly better to move
> this code in a separate helper.

That's true, not the prettiest piece of that patch. I'll refactor this
better then.

Thanks for the review,

Maxime

