Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0248C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhRsUH63PXad8fITVdK3UPKSquO0H7HspkXydnx5S/g=; b=WLODykuuQ35HselH1wt5dMD/kW
	QkdsPi+Fl6yXQ2uPdIMFE9+bsj8wwwOTqMoKu+NtADPIKo12W/XvtcGMnoCGnrRNYPbnGzSP1G5ac
	uh3jgwnaAMXxXuEw1RNB+nJHdplN9oN/uiSMr/1dLNJCBPIk6xUoZTpkotc+4oHc76tXp9BnVuZKO
	/R5PP2SYeO7WDTks8tDnv16cATf+rChnozy5P1vi7M3iEpyD5fUWUiTIMloh0pLuOTNIA+ml5tQg/
	yxzyhC1gO4TkQNOWskHr1ISNdXiQvTdSzmMgP33O0bTv2hM4csbNbMt4qALlhdqrUqCMjjrT8y4M7
	5gQFRB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXcX-0000000EJIv-2YED;
	Fri, 07 Mar 2025 13:20:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXat-0000000EIwO-40JF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 13:18:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E9D344278;
	Fri,  7 Mar 2025 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741353502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhRsUH63PXad8fITVdK3UPKSquO0H7HspkXydnx5S/g=;
	b=jeWmpXMprgtWeYDHc95wJApTWvdfvuDoUAs5l9fQG2MGW/YZYF8PJelhmFIu2P6PTRT4p3
	c2R14B50m57QNsRgOzXVn5UIB4r5s91NYm6mdrrbBFf9BZs4OWGKLQc5pYk3ofQFBWU+7g
	MMK90pEgjRH78hUBDI+pDBEUGlKN4u9QeMOTOYg0qd+FNZx0j6CQlIM4gUIqaLua1r1ILZ
	aoPDeRESYhG0gXq5C/adW7tmeP85n2eKSGkueV5xM22r16ur6E5bTSuKMRaAyOOO8lmZCl
	rTaHeyfHp+y7AXbKjQ+bSq+BOWBHG472pe4Hop9fD6XTkJ8BkK7+pvIerzXymQ==
Date: Fri, 7 Mar 2025 14:18:19 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Simon Horman <horms@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Romain Gantois <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next 1/7] net: ethtool: netlink: Allow per-netdevice
 DUMP operations
Message-ID: <20250307141819.55e42ccd@fedora.home>
In-Reply-To: <20250307122119.GE3666230@kernel.org>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
	<20250305141938.319282-2-maxime.chevallier@bootlin.com>
	<20250307122119.GE3666230@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohephhhorhhmsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehku
 hgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_051828_439281_C5599DD4 
X-CRM114-Status: GOOD (  32.06  )
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

Hi Simon,

On Fri, 7 Mar 2025 12:21:19 +0000
Simon Horman <horms@kernel.org> wrote:

> On Wed, Mar 05, 2025 at 03:19:31PM +0100, Maxime Chevallier wrote:
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
> >  net/ethtool/netlink.c | 45 ++++++++++++++++++++++++++++---------------
> >  net/ethtool/netlink.h |  1 +
> >  2 files changed, 30 insertions(+), 16 deletions(-)
> > 
> > diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> > index 734849a57369..0815b28ba32f 100644
> > --- a/net/ethtool/netlink.c
> > +++ b/net/ethtool/netlink.c
> > @@ -578,21 +578,34 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
> >  	int ret = 0;
> >  
> >  	rcu_read_lock();
> > -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> > -		dev_hold(dev);
> > +	if (ctx->req_info->dev) {
> > +		dev = ctx->req_info->dev;
> >  		rcu_read_unlock();
> > -
> > -		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
> > -
> > +		/* Filtered DUMP request targeted to a single netdev. We already
> > +		 * hold a ref to the netdev from ->start()
> > +		 */
> > +		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
> > +						 genl_info_dump(cb));  
> 
> Hi Maxime,
> 
> ethnl_default_dump_one_dev() is called here but it doesn't exist
> until the following patch is applied, which breaks bisection.

Yeah I messed-up in my rebase and bisection broke :(

I'll send a new version in a few days, as Jakub said, let's give some
time for the netdev_lock series to move forward and go through CI, I'll
need to rebase on it at some point.

> 
> >  		rcu_read_lock();
> > -		dev_put(dev);
> > -
> > -		if (ret < 0 && ret != -EOPNOTSUPP) {
> > -			if (likely(skb->len))
> > -				ret = skb->len;
> > -			break;
> > +		netdev_put(ctx->req_info->dev, &ctx->req_info->dev_tracker);
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
> > +
> > +			if (ret < 0 && ret != -EOPNOTSUPP) {
> > +				if (likely(skb->len))
> > +					ret = skb->len;
> > +				break;
> > +			}
> > +			ret = 0;
> >  		}
> > -		ret = 0;
> >  	}
> >  	rcu_read_unlock();
> >    
> 
> ...
> 
> > diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
> > index ec6ab5443a6f..4db27182741f 100644
> > --- a/net/ethtool/netlink.h
> > +++ b/net/ethtool/netlink.h
> > @@ -388,6 +388,7 @@ struct ethnl_request_ops {
> >  	unsigned int		req_info_size;
> >  	unsigned int		reply_data_size;
> >  	bool			allow_nodev_do;
> > +	bool			allow_pernetdev_dump;  
> 
> nit: allow_pernetdev_dump should also be added to the Kernel doc for
>      struct ethnl_request_ops
> 
>      Flagged by ./scripts/kernel-doc -none
> 
>      There also appear to be similar minor issues with subsequent
>      patches in this series.

Ack, I'll make sure the doc is up to date and properly formatted :)

Thanks,

Maxime

> >  	u8			set_ntf_cmd;
> >  
> >  	int (*parse_request)(struct ethnl_req_info *req_info,
> > -- 
> > 2.48.1
> >   


