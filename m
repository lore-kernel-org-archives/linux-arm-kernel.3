Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BCCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMx5Er9aIIGvyRUEf79v535DXGv9N6ufwqTeCTog8qE=; b=IIsac7MaOOaCcQ2jFr97Sr6tLz
	mPx+Zt9usWNLgYvgFBDkkpEoLHoEhr+LNAt8TkffYbw6ARAbr5Dxj9z/i784pCSI41eobfngaWTEm
	XXROf2gQBh/xC8ub+c0NGIemxykm1X368cVy0Yf+GHSAX/PyzJoTQYbsm+Aeoseb5kL7v0GC2wGos
	frw4QKIXzH16ZsWG+k4CISjfMK0MwuJwfzK+wfog28A3SrA2+tZsHECCe6OEdQq/R4n4Tn+7ilcN/
	NoqZ7xiFxhiaVCoQNnyJBG+ouHwDZcnvIB/wsI9SgxUYRrGXVWUxacOerXm0RKf1aqfsAsbRlaKDV
	c38YJiVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcSE-00000002ezB-1Uzw;
	Mon, 10 Mar 2025 12:41:58 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcAF-00000002axn-25y6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:23:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6DA1442CC;
	Mon, 10 Mar 2025 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741609401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZMx5Er9aIIGvyRUEf79v535DXGv9N6ufwqTeCTog8qE=;
	b=FXHEXF5u8hV9mAj48Msb+sBqu/8bDhyCW0hIYoSGjKV1OX3BeWP3wOIxh0SWNgAcCCUta0
	pbF8iqScDhJ25zs6r1r03z5iip6UQSk8LyrqHK2sysaTInv1exMoSpKsgUqkWOxWN+k8ue
	FylhZ4LrXOmPbjhjg07ZEaiUvqN9XZw//GNdAWtgfFW1nH2l0ISayQOw4hEs/uusz06+Id
	kPhjBbj+/wrCGaEIpC4XCbhQz3LqprSX/z8UyonBSB2SiOdJUwXs+79zLsLdK7lwc59mRx
	Ni/Sev01f3OfgP+hBDIvG+l3LJvcKEwMHjrzz8HPopN+iTY+cztjl70CWsaSvQ==
Date: Mon, 10 Mar 2025 13:23:16 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Simon
 Horman <horms@kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>
Subject: Re: [PATCH net-next v2 7/7] net: ethtool: pse-pd: Use per-PHY DUMP
 operations
Message-ID: <20250310132316.413605ad@kmaincent-XPS-13-7390>
In-Reply-To: <20250308155440.267782-8-maxime.chevallier@bootlin.com>
References: <20250308155440.267782-1-maxime.chevallier@bootlin.com>
	<20250308155440.267782-8-maxime.chevallier@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeegiedrudekkedrvdefledruddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepgeeirddukeekrddvfeelrddutddphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052323_665589_48E050CF 
X-CRM114-Status: UNSURE (   8.40  )
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

On Sat,  8 Mar 2025 16:54:39 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> Leverage the per-phy ethnl DUMP helpers in case we have more that one
> PSE PHY on the link.

I am unavailable now, I will be able to test it in two weeks.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

