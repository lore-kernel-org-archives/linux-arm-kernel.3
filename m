Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C15C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taiMsPttskKNBpvCxGJhPm3YCemIoil5yfNEVuPG6pY=; b=mmSB7/+vIp4GPZA/I9VZAyeBaO
	A+bXS+KWo6lgfIGxvLamUfBVKo/qnOVNrBzBFDcMzt7zaLu4p5olhFs1bP6v2sU3mMv7AkSMO2uyu
	b4EBmqjBAw89zy1FSqPkiqdz2ii0PM9lGaDe8imWPKqMSytakkDjbB8xUgKT/es9WtoMCpKdVSxng
	EDdXOxeEqz0SizgXsL+j0Jo3WWUx06LUyHSDjLHgSoaL1UxPodALE2n7v/E3l/RzjNsoc5zF3LGfB
	wPbvjnmAtjQTMWVNjq3+PX4mE1tyOTqIDZ2fB+GlLH+ufJ7E1jeTPhLj4BcdaCVx6nGBM+pSubFq7
	2Zrutlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZSw-0000000Ec9d-1r2Y;
	Fri, 07 Mar 2025 15:18:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZOz-0000000Eb9j-2gSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 097C65C5BA6;
	Fri,  7 Mar 2025 15:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05E5C4CEF8;
	Fri,  7 Mar 2025 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741360456;
	bh=umsaWF2jkAUH5epAcAYe4Rwh8ZURewWs90LsiduN1og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fP3O49lTMhH/bbfeIsgTB3q8YTREC4rz+pSHVu9sK55nGpQby3oFEmE//RJrgDVUG
	 VWKSKJ7gitZermCbYbNXjJhA8fG0XhXswR8cES1fpqjH1NrMMsRFQaOMgOjDZDjq9q
	 mCE3cdtNf3prA9Ufj/z98FzuVF4eWp9NkwVziwX5bZ2/AKRqCSh11ALYtze4MomcB8
	 LWXis6vmyRDd+mK0IQ+kJUV3Fc3idIVkOMink99dQv/SWVb5yv5CbbxwY3VsE1K+MJ
	 K+7Dx3n/surWG08UEv+1OvsVOEuBTgpMWrL0K0WjvtXEK/Vitqn1N20pQzqKduypWZ
	 I5/VZ5SN3FwWQ==
Date: Fri, 7 Mar 2025 15:14:09 +0000
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next 1/7] net: ethtool: netlink: Allow per-netdevice
 DUMP operations
Message-ID: <20250307151409.GJ3666230@kernel.org>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
 <20250305141938.319282-2-maxime.chevallier@bootlin.com>
 <20250307122119.GE3666230@kernel.org>
 <20250307141819.55e42ccd@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307141819.55e42ccd@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_071417_765492_852D8F30 
X-CRM114-Status: GOOD (  27.90  )
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

On Fri, Mar 07, 2025 at 02:18:19PM +0100, Maxime Chevallier wrote:
> Hi Simon,
> 
> On Fri, 7 Mar 2025 12:21:19 +0000
> Simon Horman <horms@kernel.org> wrote:
> 
> > On Wed, Mar 05, 2025 at 03:19:31PM +0100, Maxime Chevallier wrote:
> > > We have a number of netlink commands in the ethnl family that may have
> > > multiple objects to dump even for a single net_device, including :
> > > 
> > >  - PLCA, PSE-PD, phy: one message per PHY device
> > >  - tsinfo: one message per timestamp source (netdev + phys)
> > >  - rss: One per RSS context
> > > 
> > > To get this behaviour, these netlink commands need to roll a custom  
> > > ->dumpit().  
> > > 
> > > To prepare making per-netdev DUMP more generic in ethnl, introduce a
> > > member in the ethnl ops to indicate if a given command may allow
> > > pernetdev DUMPs (also referred to as filtered DUMPs).
> > > 
> > > Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > > ---
> > >  net/ethtool/netlink.c | 45 ++++++++++++++++++++++++++++---------------
> > >  net/ethtool/netlink.h |  1 +
> > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
> > > index 734849a57369..0815b28ba32f 100644
> > > --- a/net/ethtool/netlink.c
> > > +++ b/net/ethtool/netlink.c
> > > @@ -578,21 +578,34 @@ static int ethnl_default_dumpit(struct sk_buff *skb,
> > >  	int ret = 0;
> > >  
> > >  	rcu_read_lock();
> > > -	for_each_netdev_dump(net, dev, ctx->pos_ifindex) {
> > > -		dev_hold(dev);
> > > +	if (ctx->req_info->dev) {
> > > +		dev = ctx->req_info->dev;
> > >  		rcu_read_unlock();
> > > -
> > > -		ret = ethnl_default_dump_one(skb, dev, ctx, genl_info_dump(cb));
> > > -
> > > +		/* Filtered DUMP request targeted to a single netdev. We already
> > > +		 * hold a ref to the netdev from ->start()
> > > +		 */
> > > +		ret = ethnl_default_dump_one_dev(skb, dev, ctx,
> > > +						 genl_info_dump(cb));  
> > 
> > Hi Maxime,
> > 
> > ethnl_default_dump_one_dev() is called here but it doesn't exist
> > until the following patch is applied, which breaks bisection.
> 
> Yeah I messed-up in my rebase and bisection broke :(
> 
> I'll send a new version in a few days, as Jakub said, let's give some
> time for the netdev_lock series to move forward and go through CI, I'll
> need to rebase on it at some point.

Thanks. Apologies for duplicating Jakub's comments to some extent.
I only saw them after I'd sent my previous email to you.

...

