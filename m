Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00177C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnapWzZAP2PmKsEU76cAPOq5GgaCoy871bKVh+qsNoQ=; b=vv8l2IBvVN+pBX82j9wC9UixvT
	cKEUCyFsfG8l3rGm2B9FGv+TbyyRSigO/Dgt1sxW8DH+mCN1DGEDNjsefNlTMSwHECx88jtwkvHrS
	1UY3eErL1o66x/nRBUmaBIiZ6FKUj+UySD8hTFjLNx3dJdAfeuipuAcrKaF3+T44sEHBSGD7MmzrS
	LF5yIHUc52VYCve+avFfabjH2i8JuuFR+bokXZcnRTJV3Tuuz+isBXgJGZV0PKtRd58YHhEbByX3a
	qXemj6u/lt/FMAhcR0cnf0Zzq73MTxd1s2hFW3q2DtVfXyfJVjoOyBbbiqc+l6ar3dyMYw2oeu+TZ
	j8XNKDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBke-0000000739I-1PrZ;
	Tue, 25 Mar 2025 21:24:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBiw-0000000733k-0RJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 21:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DABE861126;
	Tue, 25 Mar 2025 21:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D76FC4CEE4;
	Tue, 25 Mar 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742937732;
	bh=c7bhxmiwXTsK4cxlbwFhMkEbn6MrnoZl0Hxv+hso6bU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r78TeF097LQaPGwKesLNMeYFakDCa727pWyXOQHaAiBwVDuIUNgYsTGclWrfABpvV
	 qtBXg/Cj6ueJu8AGn5AEBX/XXZksPMrUsbvVtMxMsmZjPhBjLo555unvDQSEs8gjLM
	 WDDt9BimEdQVkvJgVpf4/fu0GDIqw/53HK1CeiFn9sVcW6IpVjB5ADfQZn1wzFgr8x
	 nEVZkB5FW3boRYZvkyDR/wP4h9prrJaGFOITUCwrYcdGyt7n1Q1a14f6Ld9AyaJLCh
	 fijJNsaad6g9ICDvTBvWVoocj+GhIJ/nHItVrA1jter8dvPQTdgvSmZi3yLTDqq2kH
	 esJ824B8yJe1w==
Date: Tue, 25 Mar 2025 14:22:02 -0700
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
Message-ID: <20250325142202.61d2d4b3@kernel.org>
In-Reply-To: <20250325141507.4a223b03@kernel.org>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-3-maxime.chevallier@bootlin.com>
	<20250325122706.5287774d@kmaincent-XPS-13-7390>
	<20250325141507.4a223b03@kernel.org>
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

On Tue, 25 Mar 2025 14:15:07 -0700 Jakub Kicinski wrote:
> > This means the dump will have a different behavior in case of filtered dump
> > (allow_pernetdev_dump) or standard dump.
> > The standard dump will drop the interface device so it will dump all interfaces
> > even if one is specified.
> > The filtered dump will dump only the specified interface. 
> > Maybe it would be nice to have the same behavior for the dump for all the
> > ethtool command.
> > Even if this change modify the behavior of the dump for all the ethtool commands
> > it won't be an issue as the filtered dump did not exist before, so I suppose it
> > won't break anything. IMHO it is safer to do it now than later, if existing
> > ethtool command adds support for filtered dump.
> > We should find another way to know the parser is called from dump or doit.  
> 
> Let's try. We can probably make required_dev attr of
> ethnl_parse_header_dev_get() a three state one: require, allow, reject?

Ah, don't think this is going to work. You're not converting all 
the dumps, just the PHY ones. It's fine either way, then.

