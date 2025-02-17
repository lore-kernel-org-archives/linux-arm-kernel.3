Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FB2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 09:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GD/trcjVijv8BKevRiWl5MHpKoDGJj6DiZdAEWA58A=; b=3QlYRNFiQG2Vcavdbf/vC71jki
	uzK3bEoclblsi43JVSYdDYaHiN44GnTrF4dMDz33P/y8lQDMXsM95fxNmHXbBLGYSFblWhR37Fgo8
	ZjTR7XSDdsZfx8RnY9q7EltCyN4aw0nRhAjCij95Ll1y/E+HbUDJ+fSMehdLQjqaI/wG9ygYi23mh
	gG6H/em++Ek1WZ+TNiITksbiUKb6B/S3gdYZu7CE6FILb/S/KBq+vpWK8kgUofzKaAll+2GmEzEdc
	tyMaVujjL7qmhbBCj3bQsIwUj23ShOjisx+Wh657ZK31XsLFAfhJmKREnfDtD9rJKcP3pqzcIyewE
	SQms/eQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxZg-00000003xQl-1iuP;
	Mon, 17 Feb 2025 09:38:00 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxIn-00000003uYF-2wdo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 09:20:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C149D433F7;
	Mon, 17 Feb 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739784031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GD/trcjVijv8BKevRiWl5MHpKoDGJj6DiZdAEWA58A=;
	b=O8hZx/ymgHX4GoVoMacfk+ZkAzzQFc8Y7uJbRnSDolWhl89wf2G+d7CH3FJtjOatyk+7Fx
	USQoWr1Pp3D6Wy1YAUPv/kS2Wx9nw1yGzFzsCJ6uGO7dAKBvzpR6EvasweX3J0REhK9XTa
	gx1FZiZRpuwAkWDXaq8mReLD894MUa18pTlSlV+v4Ud6MRD5vPDilf4jApT7cDSE3wn4M5
	ihurz1M7oMaQOOrYllUZCpaiYalw0RAwEdxs9PhcdF/4RygANnjjNz3e0myezG0ZDzysSQ
	3/g46MUaBaJ5C9WAQtYIN+SOfCCNoBnN6z7XKxVhauG7MbSPVT0ACC5/d0zdXA==
Date: Mon, 17 Feb 2025 10:20:26 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
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
Message-ID: <20250217102026.780ebf36@fedora.home>
In-Reply-To: <20250214165345.6cab996f@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250214165345.6cab996f@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_012034_362168_F90DE24C 
X-CRM114-Status: UNSURE (   9.31  )
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

On Fri, 14 Feb 2025 16:53:45 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 13 Feb 2025 11:15:48 +0100 Maxime Chevallier wrote:
> > This is V4 of the series introducing the phy_port infrastructure.  
> 
> FWIW it doesn't seem to apply:
> 
> Applying: net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
> Applying: net: ethtool: Export the link_mode_params definitions
> error: sha1 information is lacking or useless (net/ethtool/common.c).
> error: could not build fake ancestor

Hmm strange, I may have messed-up somewhere ? I'll rebase anyways for
the next iterations, some of the recently merged work with the
.get_nexy_update_time conflicts with the series as well.

Thanks,

Maxime


