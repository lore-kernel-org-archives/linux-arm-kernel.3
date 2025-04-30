Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09482C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMct6rwV0rkF1WxtEmv6iyMd03nGjUcSuxSQDfiZZro=; b=AMV9zCssNwBbvsg7KYMO8QEuI5
	NDsDCRkuedKnw7nRq/Vyb233mAFf+zFpjNvkgMQCdcrFTMjNTs+rbDd7CJQ62nI5NQNYBGeUEknSB
	5DxSOPGU5cpu74ZIVohlmXUe1isffgEbqKzCJTFTTo9DFH9P/gHD81H4SSb8EsGsD47MBQlrlPEf1
	IySLyqBDxKBOUMbcAxmllXgX+rcQbCCtQFsFFl1ErUhQjPWqC57f6gGTf+iBDhnOBEx16qaYISV9c
	8gHCJNdlfxL6HMTGJjRFnE38Xp4cVKsBNbkv0XwkXhxVLTLTpGewOElw6r0UaQmBf4WcniScmaqij
	SPNvoh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA11Z-0000000Bsg5-0FgR;
	Wed, 30 Apr 2025 06:34:29 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0zd-0000000BsJB-07qL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 06:32:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAD2A43A4D;
	Wed, 30 Apr 2025 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745994743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMct6rwV0rkF1WxtEmv6iyMd03nGjUcSuxSQDfiZZro=;
	b=j+nHDkymH+VHC8ASsobpg86S7/LM6pz/wDmJpz5NHLogTzM4DxHssAVCu6eNLKJ6f0woEW
	VPF6vcSEeFLF62mBBqOd/DlkTW5Bu6Z+VSYw9Fv5iucaML1bvARt5v1tQDQO3xOkN63D7M
	BZiTcxRpWekbC5YMnBdnvAQmlfjJcS5ARP41ATuWKHePDUjHdLPA6YeX5ADbcnUxk07Uid
	WBum957d6HADCt8av5O0ZpgB2XgvQi/yjfk1Ipd1BkKKbuSqdzeCmvoVQYvMcReu2abixF
	1uT06f/MQtVYS3EqoLgrwfOx8O3bIHH6ROLfH10HWr793ImwUW5f466aR6xt3g==
Date: Wed, 30 Apr 2025 08:32:20 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
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
Subject: Re: [PATCH net-next v7 1/3] net: ethtool: Introduce per-PHY DUMP
 operations
Message-ID: <20250430083220.5fba6c32@device-130.home>
In-Reply-To: <20250424180333.035ff7d3@kernel.org>
References: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
	<20250422161717.164440-2-maxime.chevallier@bootlin.com>
	<20250424180333.035ff7d3@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieehleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopeguvghvihgtvgdqudeftddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhto
 hepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_233229_692124_B2221659 
X-CRM114-Status: GOOD (  16.17  )
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

Hi Jakub,

On Thu, 24 Apr 2025 18:03:33 -0700
Jakub Kicinski <kuba@kernel.org> wrote:


> > +
> > +/* perphy ->dumpit() handler for GET requests. */
> > +static int ethnl_perphy_dumpit(struct sk_buff *skb,
> > +			       struct netlink_callback *cb)
> > +{
> > +	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
> > +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> > +	int ret = 0;
> > +
> > +	if (ethnl_ctx->req_info->dev) {
> > +		ret = ethnl_perphy_dump_one_dev(skb, ethnl_ctx->req_info->dev,
> > +						ctx, genl_info_dump(cb));
> > +		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
> > +			ret = skb->len;
> > +
> > +		netdev_put(ethnl_ctx->req_info->dev,
> > +			   &ethnl_ctx->req_info->dev_tracker);  
> 
> You have to release this in .done
> dumpit gets called multiple times until we run out of objects to dump.
> OTOH user may close the socket without finishing the dump operation.
> So all .dumpit implementations must be "balanced". The only state we
> should touch in them is the dump context to know where to pick up from
> next time.

Sorry for the delayed answer, I'm still wrapping my head around all
this. calling netdev_put in dumpit() is not correct, but won't moving
this into .done() make us subject to the scenario you described to me
in another mail where userspace would stall the dump operation by not
calling recv() ?

Maybe the safest path, as you mention in the other thread, would be to
store the requesting ifindex in .start(), call netdev_put() in start()
as well, and hold/dump/put in each .dumpit() then.

Maxime


