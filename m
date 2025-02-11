Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3791C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T128NbBeShVjgHAQHFQBVXrcbz3LydX8l7wGrFI7ueM=; b=NIT2EtQh8gxDEb1dGsceRrtDoy
	Xv78bVLPA3rD7jmTkWtZ8XZMyeTLY1OMPMoEnSaxJc9zvbEgTHL3JO9C03KU2kF9H/p4ynHxQulMn
	5Xx1+d68b45fzh2UsHkPEDXrdDRyxDLtkfC3Sv/pYWVmCp+lF1IINRaWpfLD4ripT3IcL7CMlb336
	Z0wzrMB6tkjf034ilBUpC5n35qJwzJ2OfqMud+mGUCj207aY7NT8xKR2pBR0bw1LOSu0ANiXKz4H0
	XK+eOP7ajGkU4e66MbbdkfHXfGagEHVitIdjuKNllN76PQzPNTioYeeOfBPqN9EFpOF9AFw5XPXOG
	x0edc97A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmQC-000000038mA-1f47;
	Tue, 11 Feb 2025 09:19:12 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmOl-000000038ax-2lhI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 09:17:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27539433D9;
	Tue, 11 Feb 2025 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739265459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T128NbBeShVjgHAQHFQBVXrcbz3LydX8l7wGrFI7ueM=;
	b=T7xACDYRo4ZKNUXI1/0DERPK7oBUD4COOhQeQ03s6RH8EOyByC+6pjBEZ6OzrOskPxeFuS
	bj1x1oMaVubfmt3p26TgQVuUpl2zcK0XoiUC456N7+IGvvckqpqJgCItd7YswXw26TdEOJ
	M91jZud9cbdMfRKvKG0rkxCGpLdYdpRNO1gh9mW3iT33Ge4lrkju+oPKRM6FENGcYAigOS
	AMmT/wHxfjhD2hbhK6CFJZvEZDF1S2DQtqSVDuLGIfB4sw7wuuj4cIXdgh7E5LPVHPgIIh
	G5b8e1G431JQKCpx/CGPenErBzIhdyOHy2eojCn4jjfcomZSr06/ZsDQrE6S7g==
Date: Tue, 11 Feb 2025 10:17:35 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH net-next 11/13] net: phy: Only rely on phy_port for
 PHY-driven SFP
Message-ID: <20250211101735.0af025c4@fedora-1.home>
In-Reply-To: <202502082347.tFufJ529-lkp@intel.com>
References: <20250207223634.600218-12-maxime.chevallier@bootlin.com>
	<202502082347.tFufJ529-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeejgeevhffhhfefvdfhgefgudefkeefgeeivdeuveejueeljeekgfffieeihfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdptddurdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdquddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtr
 dhnvghtpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohgvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_011744_305091_54CB445C 
X-CRM114-Status: GOOD (  13.74  )
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

Hi,

On Sun, 9 Feb 2025 00:04:55 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Maxime,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on net-next/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-ethtool-Introduce-ETHTOOL_LINK_MEDIUM_-values/20250208-064223
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20250207223634.600218-12-maxime.chevallier%40bootlin.com
> patch subject: [PATCH net-next 11/13] net: phy: Only rely on phy_port for PHY-driven SFP
> config: i386-buildonly-randconfig-005-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082347.tFufJ529-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082347.tFufJ529-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/net/phy/qcom/qca807x.c:698:12: error: use of undeclared identifier 'phy_sfp_attach'; did you mean 'phy_attach'?  
>      698 |         .attach = phy_sfp_attach,
>          |                   ^~~~~~~~~~~~~~
>          |                   phy_attach
>    include/linux/phy.h:1912:20: note: 'phy_attach' declared here
>     1912 | struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
>          |                    ^
> >> drivers/net/phy/qcom/qca807x.c:699:12: error: use of undeclared identifier 'phy_sfp_detach'; did you mean 'phy_detach'?  
>      699 |         .detach = phy_sfp_detach,
>          |                   ^~~~~~~~~~~~~~
>          |                   phy_detach
>    include/linux/phy.h:1924:6: note: 'phy_detach' declared here
>     1924 | void phy_detach(struct phy_device *phydev);
>          |      ^
> >> drivers/net/phy/qcom/qca807x.c:702:17: error: use of undeclared identifier 'phy_sfp_connect_phy'  
>      702 |         .connect_phy = phy_sfp_connect_phy,
>          |                        ^
> >> drivers/net/phy/qcom/qca807x.c:703:20: error: use of undeclared identifier 'phy_sfp_disconnect_phy'  
>      703 |         .disconnect_phy = phy_sfp_disconnect_phy,
>          |                           ^
> >> drivers/net/phy/qcom/qca807x.c:748:9: error: call to undeclared function 'phy_sfp_probe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]  
>      748 |                 ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
>          |                       ^
>    5 errors generated.

Ah damned, I missed that qca807x now also supports SFP. I'll include a
conversion fr that driver too in V2 (and add Robert in CC:)

Thanks,

Maxime

