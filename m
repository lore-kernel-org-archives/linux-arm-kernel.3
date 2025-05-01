Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C18BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFp5ctPlBb31BUvVAyPbZSerujwWlHGL0EfB9AAi2ys=; b=imr/R0UvhE2/MvkpDyan70XlSc
	TPFpNNC9R9pqHV6t+lqsHQ/ReeJCDbIc8vfMs3jGI3Hxdh2sDGWiTBoTscsUcK+yrmxOUg0CKmfE0
	uizcPMY/Ob4Vg15ofaKKZf+sy1fsreUeSEJ+vP7R24HaFatJ6WsBZxhXwLvKu7XCB2ye/AWg86L4R
	h13Sre+z/zCA4sdD3BORVW7VHPQIh6LU1ZiNSlDCxQdcEP9MsfP5YmhIQEsG9EDcYLnHw2xOqvUPa
	5ef4Gl0Hma0H8ou5YAQz4KpcpuElk/LegM4qW+xlueRHn92wuROP+bN1N1Axmt4iM9qi0l3QX4RlV
	YZrAEvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAToX-0000000FnoH-0GVF;
	Thu, 01 May 2025 13:18:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATlX-0000000FnRZ-2vjI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7059B44C53;
	Thu,  1 May 2025 13:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E936C4CEE3;
	Thu,  1 May 2025 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746105350;
	bh=vG9RNDUsdMKUtcPNh3JTEqrqWWFL/iIruqjQNnXSe2Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZE8dhfOB0DRQqBSkFEh7Qhc0AbapWsMOLtOEowe066a90UYLToaMHAjsN9EBiGjQ2
	 K+vcftRYrPjRsbUO11ldjBXnn5Vz9fL1XUX6dTANVJTxH/ykYg9IuOc/gqIFONvcqh
	 rcT/HkYnOzyOKQCIBXx34Z8f0iZLXDpFYlrXIWX2WHaDJypw2wCcc0v0C2CMJd9t1N
	 QbEjslSC2xs3IHPb+uRHRJWtP/47463ZTvcYoO77bZokGZNyn10q0dcIrsifSXlwOr
	 0OALCVuwygFsNMnIB0BE6dKtS4EP6AgUQj/YCpB6Uv8YpR/ReiutWFhC6ctxSQeyOU
	 wtD5/K+TKjWZg==
Date: Thu, 1 May 2025 06:15:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
Message-ID: <20250501061548.38f7479b@kernel.org>
In-Reply-To: <20250430083220.5fba6c32@device-130.home>
References: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
	<20250422161717.164440-2-maxime.chevallier@bootlin.com>
	<20250424180333.035ff7d3@kernel.org>
	<20250430083220.5fba6c32@device-130.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_061551_760174_862BC388 
X-CRM114-Status: GOOD (  17.94  )
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

On Wed, 30 Apr 2025 08:32:20 +0200 Maxime Chevallier wrote:
> > > +/* perphy ->dumpit() handler for GET requests. */
> > > +static int ethnl_perphy_dumpit(struct sk_buff *skb,
> > > +			       struct netlink_callback *cb)
> > > +{
> > > +	struct ethnl_perphy_dump_ctx *ctx = ethnl_perphy_dump_context(cb);
> > > +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> > > +	int ret = 0;
> > > +
> > > +	if (ethnl_ctx->req_info->dev) {
> > > +		ret = ethnl_perphy_dump_one_dev(skb, ethnl_ctx->req_info->dev,
> > > +						ctx, genl_info_dump(cb));
> > > +		if (ret < 0 && ret != -EOPNOTSUPP && likely(skb->len))
> > > +			ret = skb->len;
> > > +
> > > +		netdev_put(ethnl_ctx->req_info->dev,
> > > +			   &ethnl_ctx->req_info->dev_tracker);    
> > 
> > You have to release this in .done
> > dumpit gets called multiple times until we run out of objects to dump.
> > OTOH user may close the socket without finishing the dump operation.
> > So all .dumpit implementations must be "balanced". The only state we
> > should touch in them is the dump context to know where to pick up from
> > next time.  
> 
> Sorry for the delayed answer, I'm still wrapping my head around all
> this. calling netdev_put in dumpit() is not correct, but won't moving
> this into .done() make us subject to the scenario you described to me
> in another mail where userspace would stall the dump operation by not
> calling recv() ?

Good catch, for the filtered dump you'll need to look up the netdev
on every dumpit call.

