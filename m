Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F4CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tv6nfL6WueMjJzRa4hXNRmQ+BSSJGTk/KgTtLQl+qGE=; b=e03c+UpRhzTULi4a8aJTapCxX+
	y2LZdhL3fgeN2ulLs4Cf9Il5jJNmF09U/mG//ivlyKL+0NFVkU9dgdAtngquR/vQo+DRdDehXK+mE
	CCtkssbbaizRCVYJTC2E76luByPvd9MRbfwCWKR1K79zef6vAuPIvl1TwO9CzjwmFEstqE8/Bplsx
	CAv+8BEGM8cmpIcWY7awb8IQhE0vK/ZsoSGvGEVlR+GvJc2yuygstgJTBFCjwNhqd8+r8k4WSd42W
	UTtfnodRooKfFjrKcwKWubHb8oaM5TmdS9PoV/k/ceH4h3blwFhmB/ORbud89m1oQqBaHJ3ZXS5f4
	iUlhVmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFtF-00000002cgS-2iUr;
	Tue, 04 Mar 2025 00:12:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpFrf-00000002cUm-25RE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 00:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DD255C48EA;
	Tue,  4 Mar 2025 00:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3C1C4CEE4;
	Tue,  4 Mar 2025 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741047026;
	bh=mhb0R+JmZbuqZb2vKrLLB9HfKDaCWuI1Q6s/9+i/gkc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hSNxcxjQZv/RKSYZQNum16KV0wryu2LL8z+zTyog6YdTtK1gF1VttJ/xPPcbtjVHU
	 JZmil/BGqLpE9YLTHHzWIun8yrHJm+/uxcu/ucV3NF2apROYk68N6E6TFTzyEOSopS
	 Jty+DVMyr4zLFToJtTEvwTqvv8X+DC7+joSl3XW/C6igqAT6n6pUTWDTg91XHvJTEA
	 0WomYPJlQ6vQqWI2DjEtdX8BSwLWMZeK8AfhRVB1sbDI4T1aAiJ8xamF+Jv6J/tJ5w
	 3/yHvoE8D8dHNXXPhhPIcJdlAxr6SsqcrsyMxOIxvGr956jKnaxA93cLPHpNqQuYHZ
	 sskj05VhvjrOA==
Date: Mon, 3 Mar 2025 16:10:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Parthiban Veerasooran
 <parthiban.veerasooran@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net v2] net: ethtool: netlink: Allow NULL nlattrs when
 getting a phy_device
Message-ID: <20250303161024.43969294@kernel.org>
In-Reply-To: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
References: <20250301141114.97204-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_161027_585952_453D99B5 
X-CRM114-Status: GOOD (  16.78  )
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

On Sat,  1 Mar 2025 15:11:13 +0100 Maxime Chevallier wrote:
> ethnl_req_get_phydev() is used to lookup a phy_device, in the case an
> ethtool netlink command targets a specific phydev within a netdev's
> topology.
> 
> It takes as a parameter a const struct nlattr *header that's used for
> error handling :
> 
>        if (!phydev) {
>                NL_SET_ERR_MSG_ATTR(extack, header,
>                                    "no phy matching phyindex");
>                return ERR_PTR(-ENODEV);
>        }
> 
> In the notify path after a ->set operation however, there's no request
> attributes available.
> 
> The typical callsite for the above function looks like:
> 
> 	phydev = ethnl_req_get_phydev(req_base, tb[ETHTOOL_A_XXX_HEADER],
> 				      info->extack);
> 
> So, when tb is NULL (such as in the ethnl notify path), we have a nice
> crash.
> 
> It turns out that there's only the PLCA command that is in that case, as
> the other phydev-specific commands don't have a notification.
> 
> This commit fixes the crash by passing the cmd index and the nlattr
> array separately, allowing NULL-checking it directly inside the helper.
> 
> Fixes: c15e065b46dc ("net: ethtool: Allow passing a phy index for some commands")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Well, this alone doesn't look too bad.. :) Hopefully we can address
adding more suitable handlers for phy ops in net-next.

Didn't someone report this, tho? I vaguely remember seeing an email,
unless they said they don't want to be credited maybe we should add
a Reported-by tag? You can post it in reply, no need to repost 
the patch.

