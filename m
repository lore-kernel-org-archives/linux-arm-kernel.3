Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13546C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 00:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8K64HgFGhqqKIK2IP7X9Oijz//ysx5XkVWgLLOEgbjs=; b=PnGsszgItrVKN3u/mblTWvAjzw
	PDs0UhuEos8IIHlZgKAcz/HFFYjHokLVO3oQh2UY3VVkwC9o8+it1Ub2RBDZSauvKBkdgHGM/eyAI
	auLzXK6YEbXRYDEH7rl+vTj3TkJInndf2R6XyCaYhiBABzmiQ0kd8Ze5lg5XfP/PSGaDuYsAuR65d
	1oeqf5KwcTk3NusdLuouyvCmddt5p9gd4HhJhoPeZO3TM924X83d3no7KNzs9DOg420DhpLFhUOPI
	STNHop/HdZTGrt98jV5XWSApZ5l1uVVmAZFO5/9k042RO6h1HZ9E7uZfuBt6kEnGvTQHTDcNvkzB4
	9YF+72+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6Sk-0000000GesF-1W9a;
	Sat, 15 Feb 2025 00:55:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6RH-0000000Geav-43tr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 00:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A46C55C5832;
	Sat, 15 Feb 2025 00:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E90C4CEE2;
	Sat, 15 Feb 2025 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739580826;
	bh=U2QJb6XIJC6fNter4lBmA14G9QFD+52FUM0I1jZgCx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sE5KJbIErIEnMN8ssaRMOU7wYVNoq49KmLNBuOhpYT2dC9Qp58XGtuzTjVjfE8v4g
	 MIeHJ9R3ASbAwY59YMeQB58dQgb/7ehBG+RdOt9nLndobnNZcRKdqvLLcDAgF7rEow
	 56ij5RYIxWo5PS9bO1Rj0bRnVRry6lwsPhdxyycJsZfZl19PE5irc2c9d82I9SXjFf
	 vY15DyE4TWVyYOcfOhXXaZ0LeVcSj/HKxM0ep2rfawnO/omKg1ZBAzk7AnVH3S6yk9
	 9hxrMz8+dFD0NjTsNnLK7ta8GhuD7l0xgA7aD+jVdldnpo8siG5+cXOmM6ai9hqF11
	 FI+arOB4Cx7cQ==
Date: Fri, 14 Feb 2025 16:53:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 00/15] Introduce an ethernet port
 representation
Message-ID: <20250214165345.6cab996f@kernel.org>
In-Reply-To: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_165348_052365_E6501910 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On Thu, 13 Feb 2025 11:15:48 +0100 Maxime Chevallier wrote:
> This is V4 of the series introducing the phy_port infrastructure.

FWIW it doesn't seem to apply:

Applying: net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
Applying: net: ethtool: Export the link_mode_params definitions
error: sha1 information is lacking or useless (net/ethtool/common.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0002 net: ethtool: Export the link_mode_params definitions

-- 
pw-bot: cr

