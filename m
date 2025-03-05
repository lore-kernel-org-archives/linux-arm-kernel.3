Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A4C282E5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPyWHc+8KiHi21EkIlCnv3oAaCqNgg8vVnv8v5oHtoM=; b=Rzu+l3fV3i8m22hrmJHuf705+m
	7dCNu01KXgEnMqYI/fHifsEjJD7eefSg5rgR6BsSBslUCeCZYKYnOdXWA2Xn0zdg5Rt6W9NIcSKms
	iWxmnBiqYup//p2aGmQhVaPw9N0RtwSJg1defy7OENW5rirVsScWEB8Rj/FEgN8S4MUW+ZCIX1Gnc
	2HU6dEaLxPDi7nfDdiyqZbK8ttn57zx7x4uK+qHmfBh6gedI2bkFb8uDbPA5PguyJftwsd+DG0YHV
	LR8bZqw9DrC32fkh77oWvysMHKjPq7GEL/hg1gsNmvGTI9HSWgU0/g6EsLhRLkGOMNmRm03QHQXia
	qKbGYMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptKP-00000008uRZ-1VNj;
	Wed, 05 Mar 2025 18:18:45 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tps94-00000008kiB-1WyJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0845443F3;
	Wed,  5 Mar 2025 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741194175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPyWHc+8KiHi21EkIlCnv3oAaCqNgg8vVnv8v5oHtoM=;
	b=GQoWGHo/UcXuWM5+M2p+ufkz2NxvtTKkX7cXWb9rICvOTm1tE0DFBFqym0cuD3G6YbSQ16
	iCwOa+FsBbPlIBYpNlJJzXTucmSoJxeBLxn97OiC/9rZfVoeBdhfkVVnQfTOby5xGMNLuS
	Gc0tU0Hqrz4xXQa0Yxqkdy91z6FBY5s60ckVmysNr+UxZqCfEVBYPyY5tCxc40eTRGGsI2
	puejnC5ToaRwTYbRqIwhvaVB0XQOD7aEhLMcxmixXcnur2OtwlgyyQ5bYynaYkmR7ow908
	bYwafXGx20/WcvxkXmrXEekb0CPkjgcQq9BnfSow+NJLiR8gb1SnFbCLZTA4qw==
Date: Wed, 5 Mar 2025 18:02:52 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, =?UTF-8?B?S8O2cnk=?= Maincent
 <kory.maincent@bootlin.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 0/7] net: ethtool: Introduce ethnl dump helpers
Message-ID: <20250305180252.5a0ceb86@fedora.home>
In-Reply-To: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdehfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteefgeehvdeitdeihfeuvdejkeevkeekieefkedvjefhudfhheeiveeuveefhefhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtp
 hhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_090258_556425_1E41487D 
X-CRM114-Status: GOOD (  28.77  )
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

On Wed,  5 Mar 2025 15:19:30 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Hi everyone,
> 
> This series adds some scaffolding into ethnl to ease the support of
> DUMP operations.
> 
> As of today when using ethnl's default ops, the DUMP requests will
> simply perform a GET for each netdev.
> 
> That hits limitations for commands that may return multiple messages for
> a single netdev, such as :
> 
>  - RSS (listing contexts)
>  - All PHY-specific commands (PLCA, PSE-PD, phy)
>  - tsinfo (one item for the netdev +  one per phy)
> 
>  Commands that need a non-default DUMP support have to re-implement
>  ->dumpit() themselves, which prevents using most of ethnl's internal  
>  circuitry.
> 
> This series therefore introduces a better support for dump operations in
> ethnl.
> 
> The patches 1 and 2 introduce the support for filtered DUMPs, where an
> ifindex/ifname can be passed in the request header for the DUMP
> operation. This is for when we want to dump everything a netdev
> supports, but without doing so for every single netdev. ethtool's
> "--show-phys ethX" option for example performs a filtered dump.
> 
> Patch 3 introduces 3 new ethnl ops : 
>  ->dump_start() to initialize a dump context
>  ->dump_one_dev(), that can be implemented per-command to dump  
>  everything on a given netdev
>  ->dump_done() to release the context  
> 
> The default behaviour for dumps remains the same, calling the whole
> ->doit() path for each netdev.  
> 
> Patch 4 introduces a set of ->dump_start(), ->dump_one_dev() and
> ->dump_done() callback implementations that can simply be plugged into  
> the existing commands that list objects per-phy, making the 
> phy-targeting command behaviour more coherent.
> 
> Patch 5 uses that new set of helpers to rewrite the phy.c support, which
> now uses the regulat ethnl_ops instead of fully custom genl ops. This
> one is the hardest to review, sorry about that, I couldn't really manage
> to incrementally rework that file :(
> 
> Patches 6 and 7 are where the new dump infra shines, adding per-netdev
> per-phy dump support for PLCA and PSE-PD.
> 
> We could also consider converting tsinfo/tsconfig, rss and tunnels to
> these new ->dump_***() operations as well, but that's out of this
> series' scope.
> 
> I've tested that series with some netdevsim PHY patches that I plan to
> submit (they can be found here [1]), with the refcount tracker
> for net/netns enabled to make sure the lock usage is somewhat coherent.
> 
> Thanks,
> 
> Maxime
> 
> [1]: https://github.com/minimaxwell/linux/tree/mc/netdevsim-phy
> 

This series will very likely conflict with Stanislav's netdev lock
work [2], I'll of course be happy to rebase should it get merged :)

Thanks,

Maxime

[2]: https://lore.kernel.org/netdev/20250305163732.2766420-1-sdf@fomichev.me/T/#t

> 
> Maxime Chevallier (7):
>   net: ethtool: netlink: Allow per-netdevice DUMP operations
>   net: ethtool: netlink: Rename ethnl_default_dump_one
>   net: ethtool: netlink: Introduce command-specific dump_one_dev
>   net: ethtool: netlink: Introduce per-phy DUMP helpers
>   net: ethtool: phy: Convert the PHY_GET command to generic phy dump
>   net: ethtool: plca: Use per-PHY DUMP operations
>   net: ethtool: pse-pd: Use per-PHY DUMP operations
> 
>  net/ethtool/netlink.c | 161 ++++++++++++++------
>  net/ethtool/netlink.h |  46 +++++-
>  net/ethtool/phy.c     | 335 ++++++++++++------------------------------
>  net/ethtool/plca.c    |  12 ++
>  net/ethtool/pse-pd.c  |   6 +
>  5 files changed, 277 insertions(+), 283 deletions(-)
> 


