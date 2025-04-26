Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16EEC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 00:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j97Cb/Xkl53UfRU83Fy3SPYGoJPgo2jifIgUZGrisp4=; b=YOz47ESt0qaZ2h8m0sto2D+Djr
	3jBqPARseyC8kqB+oVuUrNvln/1vwDVYcNewkbofVPsJKsyqNYh8mMuuQopQE/JG0AirON9cTpZO2
	8LEjO29+AaqdWx94DL1d1cfhjmo14T9SFOqdYnO0rb+bcWj1mLJhQ6GlvzT5AWTA8ZkSVxbnsnOZ+
	pr3n0P+7KLwxLlShWjIjTf9LkM12bo9+7pxt7EowCg4WrHWPUn4m+hpy7Pjq0dsxXyN/XbIN020SG
	/peVL+cXGROFpFY45r6z2WUrjDFZItXhH3rQSN91yyVeBDDfsOy3ilt0imAPPWqv6I685airbJxn2
	LK4PP+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8T9u-00000001BPN-0vTl;
	Sat, 26 Apr 2025 00:12:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8T82-00000001BAe-23hO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 00:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4CDAA4D6F3;
	Sat, 26 Apr 2025 00:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5596C4CEE4;
	Sat, 26 Apr 2025 00:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745626245;
	bh=bNU4pzJ5wlqCuRsV/oqD019TNucqvQgOF77N/7cF9b4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aSuDw74T5JJzoD9haGpUGjLMrnO7eW7vl9bNtoMaSpLxYJaXjQaF2SL0ROZ5tZpL6
	 uhVHMNs2sX3Sy7hrn+V4xAs188NIwGIRYTCtp2UUQ9DTKNQ1QpG+NFQRc0jUd7EPp5
	 MVzPldxEce3Dho/4MZHwpExbrfNzg/514zYv3Hw+H+yOUV/EJjzNCP2WM9YZkFlnAW
	 a9yp9owECLh8Au3qvA/UvtvyLP7UlTlTJHBRftszNAgr5/FDFHLKUECsKX3Wk1XnD2
	 k+Z1jft3IweZ0Pqi+o54tiucnHLO8+bnJ1g3LlAd1zam7Bn2WNnNiwUhmWqdEg44Y3
	 3KtyETx0rqh5A==
Date: Fri, 25 Apr 2025 17:10:44 -0700
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
Message-ID: <20250425171044.4a9e1b4a@kernel.org>
In-Reply-To: <20250425090153.170f11bd@device-40.home>
References: <20250422161717.164440-1-maxime.chevallier@bootlin.com>
	<20250422161717.164440-2-maxime.chevallier@bootlin.com>
	<20250424180333.035ff7d3@kernel.org>
	<20250425090153.170f11bd@device-40.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_171046_595954_571024B1 
X-CRM114-Status: GOOD (  20.58  )
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

On Fri, 25 Apr 2025 09:01:53 +0200 Maxime Chevallier wrote:
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
> Thanks for poiting it out.
> 
> Now that you say that, I guess that I should also move the reftracker
> I'm using for the netdev_hold in ethnl_perphy_dump_one_dev() call to
> struct ethnl_perphy_dump_ctx ? That way we make sure the netdev doesn't
> go away in-between the multiple .dumpit() calls then...
> 
> Is that correct ?

Probably not. That'd allow an unprivileged user space program to take 
a ref on a netdev, and never call recv() to make progress on the dump.

The possibility that the netdev may disappear half way thru is inherent
to the netlink dump model. We will pick back up within that netdev
based on its ifindex, no need to hold it.

