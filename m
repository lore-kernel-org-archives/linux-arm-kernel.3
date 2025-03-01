Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BAEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnlxC8ZW/CfqDjl5QKxrbPd8VoYU7dt7zFWgQ1CDGLw=; b=0tvJb1GZiJ0nps/tPA7BGhRZZt
	VgP7/BghlaBUWoScAN8AXlABXQzi55gP2nxwUIBNmnU1WhttQRLRxq28Ua1vSoi3d6XgvHg4RNvCQ
	sGgHzmue0qyH3mzu1Lbzl30w4MvrBlXaGp/eG6bDmud/2hTjjVU/AqIZThdB/6akJ5vc72cxUjRht
	a06Oaj2v0QYWWoq9kLn+b+O9jJBxVp7CX5NvWRRdbvuR5xrJp1VrAdSLyTXsch/wz1ZaWfsCD58wC
	5OOdhX1pwC4td0Y9xDdiTaAysYi7XAupzi2zRcYOlHaJuWhlQwAP/6sx25TZrOlZj42gba4Nj6AOq
	peklCm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKGi-0000000DleO-2gwv;
	Sat, 01 Mar 2025 10:40:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKF8-0000000DlYD-0BDQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 10:38:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7478E43319;
	Sat,  1 Mar 2025 10:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740825527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnlxC8ZW/CfqDjl5QKxrbPd8VoYU7dt7zFWgQ1CDGLw=;
	b=KqrgluW3hC8SfIGrUKkMKKLadJ1eu2tJh+1OKwN8pLZ5ENFClQlIrao6JGWw2C3gsdpNQu
	0G7xW9aXdBnDd6Et46S01DCo2N+WTw4OHKnjhpY+QoR/dwU0Va3ov3eB0RvImmMpm47fSv
	NYsUh0Klq7BvPIULXisXYYyG8RGPqMZgOINXbBEYG2wnpbyvD85Ej6rsrjatSn2R/RbiBh
	GjL8kPHVxYxwBb2f65GC0aNe2Rug8j2bEzOaJKqH17t1M3GRSZ271Ktmo8xpZvtjT3N/2F
	DD5faTJSD49wgxQns2R+Q2GacNNIr+DBmk7PNSvRpEDuMVU5wjaoPmjYysr5gQ==
Date: Sat, 1 Mar 2025 11:38:43 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
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
Subject: Re: [PATCH net 2/2] net: ethtool: netlink: Pass a context for
 default ethnl notifications
Message-ID: <20250301113843.3b9df0fe@fedora.home>
In-Reply-To: <20250228182440.3c7f4709@kernel.org>
References: <20250227182454.1998236-1-maxime.chevallier@bootlin.com>
	<20250227182454.1998236-3-maxime.chevallier@bootlin.com>
	<20250228182440.3c7f4709@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopegvughum
 hgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehprghrthhhihgsrghnrdhvvggvrhgrshhoohhrrghnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_023850_553214_532A8345 
X-CRM114-Status: GOOD (  13.16  )
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

On Fri, 28 Feb 2025 18:24:40 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 27 Feb 2025 19:24:52 +0100 Maxime Chevallier wrote:
> > The only relevant user for now is PLCA, and it very likely that we never
> > ended-up in a situation where the follow-up notif wasn't targeting the
> > correct PHY as :  
> 
> PLCA uses the ethnl_default_* handlers but it seems to operate on PHYs
> now. How does the dump work? Shoehorning the PHY support into
> the ethnl_default_* handlers is starting to look pretty messy.

Thinking more about this, this patch shouldn't have targetted -net in
the first place, as no usecase regressed yet (we don't have any
multi-PHY PLCA setup that exists). The DUMP keeps working as it did
before for that command, in that we dump the PLCA info for
netdev->phydev.

That DUMP / notify situation needs to be addressed as tome point thouh,
before the multi-PHY support through muxes lands (haven't sent it yet,
I'm still on the preliminary series for phy_ports).

So I think that indeed, I'll resend patch 1, and find a more graceful
solution for the phy-targetting commands in a separate series.

Maxime

