Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB9C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22VVT/IdUfbn7Nm3ltcmZG99Pcs+4KpPbX15z8OZADw=; b=ttO12J1xFI/AI/qSAbdbbjUVD3
	EXSESud9EwpzTS9lqnLL0N3vJ+hzqh6hhfddNITQHMT/+gHsq6NmDMSrVCZbfSdJTqZmnJrzb5ihX
	bymG3NuP+XE12yob6PeH/Kxr54mVjcdUjALQtKYrx0x4xBsDl1udH6Gzb+rIo2Pc2aS+w2fogTcw1
	EW981uEMbIAesPrBSQowYIu34JOKawfhE4Oqs4D2nJaM1mNcAAAsWqJ1uobhJNvcIh/OJBBGBTGIM
	4Vxtg1yrfzSD0XROd4BFfQylxGCpIJO9gtZAr4cN4K/w/8kHsaU9cUBN5ZcVVsBLZ3woPC9HII98x
	8em9nX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLbr-00000007px8-1ojP;
	Wed, 26 Mar 2025 07:55:35 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txLZ5-00000007pYv-3HOq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:52:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4816120485;
	Wed, 26 Mar 2025 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742975559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22VVT/IdUfbn7Nm3ltcmZG99Pcs+4KpPbX15z8OZADw=;
	b=mKKZrAU03dnwsMUGTPxUFqi8kkMGztO/ATNyWhoXP7lNAzlivdJrWNE6V2Xs8VWqqivIwx
	rI8ty9WrMBp25D4OVHPZEMxV7fJY8a+skXw5V9i1Jfil4+saAH7Pz+7XPHvq0jm2lym4/Q
	GF6DYRchLiSLFuQb61tymzyQyYTpfxGGWDzOgy82e0cVGqzx7NEs+b8Dwu7ayXtE2pIBs6
	zb0zb7kST1N95kDBMveYwBONT2etZQBJMQ3vNjPxCKM0OqxgS0tFyVr0XyBPyHSNEXaGI5
	rEPSY9JkrTkCkU8fM62Z7sZ9pFmjFPiBqvPTUpAOd22mJ5M4RJkur1Fc6yIrqQ==
Date: Wed, 26 Mar 2025 08:52:36 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 0/8] net: ethtool: Introduce ethnl dump
 helpers
Message-ID: <20250326085236.0481e6fa@fedora.home>
In-Reply-To: <20250325143111.4a9e26c2@kernel.org>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250325143111.4a9e26c2@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieegleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuefhfefggfdthffghfdvhffhhfetuedtkeetgffhteevheehjeejgfduieduhedunecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguu
 hhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_005244_568788_11D94137 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Jakub,

On Tue, 25 Mar 2025 14:31:11 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 24 Mar 2025 11:40:02 +0100 Maxime Chevallier wrote:
> > The patches 1 and 2 introduce the support for filtered DUMPs, where an
> > ifindex/ifname can be passed in the request header for the DUMP
> > operation. This is for when we want to dump everything a netdev
> > supports, but without doing so for every single netdev. ethtool's
> > "--show-phys ethX" option for example performs a filtered dump.
> >=20
> > Patch 3 introduces 3 new ethnl ops :  =20
> >  ->dump_start() to initialize a dump context
> >  ->dump_one_dev(), that can be implemented per-command to dump   =20
> >  everything on a given netdev =20
> >  ->dump_done() to release the context   =20
>=20
> Did you consider ignoring the RSS and focusing purely on PHYs?
> The 3 callbacks are a bit generic, but we end up primarily
> using them for PHY stuff. And the implementations still need=20
> to call ethnl_req_get_phydev() AFAICT

True, one can even argue that the start() and done() aren't really
useful (allocate/free a ctx, we only really need to know the size of
the context), we'd end-up with just one dedicated helper for PHY dump.

I'll rework this and spin a new version when net-next re-opens, and
I'll clarify the DUMP behaviour for filtering, based on the discussin
with K=C3=B6ry.

Thanks a lot for taking a look then,

Maxime

