Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5182EC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/aA7y6bAuUTYPcRRFDwJ2BUW3kEXDquQhyS1ob1O7I=; b=uE5eNCdgT5NMLU+YrFXiift2mj
	PihC7+CV0e98HS3XW1iwWwxZXMQ5k6YJ5FVEMCJbRE8YRumxWE7Ml/kT5VP0aA9cgsetKixsL51MJ
	wfKEGNvdi0S3Xj8Br2RFYyGP8byd1Cd5IsIi2UVCIKsTPGtKVWneUZsFMBavzQpjy8Qazbm/EKHff
	K3TIUdQ3WQSjSaU+Vc7y8rgtsKeP7A757F32h2yec6CN/qi+tiiw7Jh1PYyLrFYtfrHJvHSlmyBtw
	i1UfiHzs4D1TktkG3nAghEPEpATJlWxQsfz0S1DonwTmBeN/uR5GVYnjtUoXy+AdTA6pf+iuJMMEe
	9hHaXx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBdw-000000072WF-4As0;
	Tue, 25 Mar 2025 21:17:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBcE-000000072IR-3oxO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 21:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3BD96115E;
	Tue, 25 Mar 2025 21:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B42AC4CEE4;
	Tue, 25 Mar 2025 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742937317;
	bh=mxt6JNXfJPXNlWUTHnpRW/oHvE3ekeq0oRQ0lYqYPBk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sb25Rr9JGnrPnbmxJYCYAEXS15QlDG83gDuR/Dw7yx0CFM5sgk3IHmrrLKeWsdr0E
	 9cxjJX1J512P+r4j8aAWCmNUA7OZNLdxj4tAMQIBzUV3U0zcQC+O27wcihRxngY9O3
	 17i921yxwU0CpmRHFrYaI8qSJ0zMmUQKWybWKq3Q56NCGlTfBx2e7TuD2liEVmu8Pq
	 2Sn/NFmXj0pY2vl7rvv9rGZRC3nu+bFPq0esdjL3/WhucdHEYzmUDygRgdCM6amQZY
	 ld97nWIilA9C/YhbpBq9Hl+hj1JQ8QI1EP1ObvoLov26eyND4KtSX1AsFISJ4hMFc/
	 LDVUz5UiyYvGg==
Date: Tue, 25 Mar 2025 14:15:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
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
Message-ID: <20250325141507.4a223b03@kernel.org>
In-Reply-To: <20250325122706.5287774d@kmaincent-XPS-13-7390>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-3-maxime.chevallier@bootlin.com>
	<20250325122706.5287774d@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 25 Mar 2025 12:27:06 +0100 Kory Maincent wrote:
> > @@ -636,10 +659,10 @@ static int ethnl_default_start(struct netlink_callback
> > *cb) }
> >  
> >  	ret = ethnl_default_parse(req_info, &info->info, ops, false);
> > -	if (req_info->dev) {
> > -		/* We ignore device specification in dump requests but as the
> > -		 * same parser as for non-dump (doit) requests is used, it
> > -		 * would take reference to the device if it finds one
> > +	if (req_info->dev && !ops->allow_pernetdev_dump) {
> > +		/* We ignore device specification in unfiltered dump requests
> > +		 * but as the same parser as for non-dump (doit) requests is
> > +		 * used, it would take reference to the device if it finds  
> 
> This means the dump will have a different behavior in case of filtered dump
> (allow_pernetdev_dump) or standard dump.
> The standard dump will drop the interface device so it will dump all interfaces
> even if one is specified.
> The filtered dump will dump only the specified interface. 
> Maybe it would be nice to have the same behavior for the dump for all the
> ethtool command.
> Even if this change modify the behavior of the dump for all the ethtool commands
> it won't be an issue as the filtered dump did not exist before, so I suppose it
> won't break anything. IMHO it is safer to do it now than later, if existing
> ethtool command adds support for filtered dump.
> We should find another way to know the parser is called from dump or doit.

Let's try. We can probably make required_dev attr of
ethnl_parse_header_dev_get() a three state one: require, allow, reject?

Part of the problem is that ethtool is not converted to split ops, so
do and dump share the same parsing policy. But that's too painful to
fix now, I think.
-- 
pw-bot: cr

